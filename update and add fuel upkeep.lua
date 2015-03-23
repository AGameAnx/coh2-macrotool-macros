
function file_exists(name)
	local f = io.open(name,"r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local ebpsDir = 'C:\\Games\\Steam\\SteamApps\\common\\Company of Heroes 2 Tools\\assets\\data\\attributes\\instances'

local excludedSquads = {
	"sbps\\races\\german\\vehicles\\tiger_squad\\tiger_ace_squad_mp.xml"
}

-- This function runs for every xml file in the selected directory
function each_file(xml)
	local sbpsStrIndex = string.find(string.reverse(xml.path), string.reverse('\\sbps\\'), 1, true)
	if sbpsStrIndex then
		local rootDir = string.sub(xml.path, 0, string.len(xml.path) - sbpsStrIndex - 5)
		local printPath = string.sub(xml.path, string.len(rootDir)+2)
		for i,v in pairs(excludedSquads) do
			if v == printPath then
				return
			end
		end
		if xml.instance.extensions then
			-- Get squad extensions
			local action_apply_ext
			local loadout_ext
			for i,v in pairs(xml.instance.extensions) do
				if v['@attributes'] and v['@attributes'].name == 'squadexts' then
					if v['@attributes'].value == 'sbpextensions\\squad_action_apply_ext' then
						action_apply_ext = v
						if loadout_ext then
							break
						end
					elseif v['@attributes'].value == 'sbpextensions\\squad_loadout_ext' then
						loadout_ext = v
						if action_apply_ext then
							break
						end
					end
				end
			end
			
			if loadout_ext and action_apply_ext then
				local errors = false
				local fuelCost = 0
				local pop = 0
				for i,v in pairs(loadout_ext.unit_list) do
					if type(v) == 'table' then
						local count = v.num
						local reference = v.type['@attributes']['value']
						local e
						local localDir = rootDir..'\\'..reference..'.xml'
						local defaultDir = ebpsDir..'\\'..reference..'.xml'
						if file_exists(localDir) then
							e = loadXML(localDir)
						elseif file_exists(defaultDir) then
							e = loadXML(defaultDir)
						else
							print('  ERROR: Can\'t open ebps')
							errors = true
							break
						end
						-- Get entity cost_ext
						local cost_ext
						local population_ext
						for j,w in pairs(e.instance.extensions) do
							if w['@attributes'] and w['@attributes'].name == 'exts' then
								if w['@attributes'].value == 'ebpextensions\\cost_ext' then
									cost_ext = w
									if population_ext then
										break
									end
								elseif w['@attributes'].value == 'ebpextensions\\population_ext' then
									population_ext = w
									if cost_ext then
										break
									end
								end
							end
						end
						if cost_ext then
							fuelCost = fuelCost + cost_ext.time_cost.cost.fuel*count
						else
							print('  ERROR: Can\'t find cost_ext')
							errors = true
							break
						end
						if population_ext then
							pop = pop + population_ext.personnel_pop*count
						else
							print('  ERROR: Can\'t find population_ext')
							errors = true
							break
						end
					end
				end
				if not errors and fuelCost > 0 and pop > 0 then
					print(printPath)
					
					local upkeep = tonumber(string.format('%.3f', fuelCost / 500 / 8 / 60 * math.max(1, pop*1.35-4)))
					
					print('  fuelCost: '..fuelCost)
					print('  pop: '..pop)
					print('    UPKEEP: '..string.format('%.1f', upkeep*60*8))
					
					
					local foundIndex = nil
					local lastIndex = 0
					for i,v in pairs(action_apply_ext.actions) do
						if type(i) == 'number' and type(v) == 'table' then
							if lastIndex < i then
								lastIndex = i
							end
							if v['@attributes'].value == 'action\\requirement_action' then
								for j,w in pairs(v.action_table) do
									if type(w) == 'table' then
										if w['@attributes'].value == 'action\\apply_modifiers_action' then
											for k,x in pairs(w.modifiers) do
												if type(x) == 'table' then
													if x.modifier_id == 'vehicle_upkeep' then
														foundIndex = i
														break
													else
														break
													end
												end
											end
										end
									end
									if foundIndex then
										break
									end
								end
							end
							if foundIndex then
								break
							end
						end
					end
					if not foundIndex then
						print('  action added (index: '..(lastIndex+1)..')')
						action_apply_ext.actions[lastIndex+1] = {
							['@type'] = 'template_reference',
							['@attributes'] = { ['name'] = 'action', ['value'] = 'action\\requirement_action' },
							
							['check_self'] = false,
							['global_fire_and_forget_on_success'] = false,
							['instant_requirement_check'] = false,
							['kill_action_on_failed_requirements'] = true,
							['no_retrigger'] = false,
							['validate_all_sub_actions'] = true,
							['requirement_table'] = {
								['@type'] = 'list',
								[1] = {
									['@type'] = 'template_reference',
									['@attributes'] = { ['name'] = 'required', ['value'] = 'requirements\\required_not' },
									
									['reason'] = { ['@type'] = 'enum', ['@attributes'] = { ['value'] = 'usage' } },
									['ui_name'] = { ['@type'] = 'locstring', ['@attributes'] = { ['value'] = "0" } },
									['requirement_table'] = {
										['@type'] = 'list',
										[1] = {
											['@type'] = 'template_reference',
											['@attributes'] = { ['name'] = 'required', ['value'] = 'requirements\\required_ownership' },
											
											['reason'] = { ['@type'] = 'enum', ['@attributes'] = { ['value'] = 'usage' } },
											['ui_name'] = { ['@type'] = 'locstring', ['@attributes'] = { ['value'] = "0" } },
											['ownership_type'] = { ['@type'] = 'enum', ['@attributes'] = { ['value'] = 'neutral' } },
										}
									}
								}
							},
							['action_table'] = {
								['@type'] = 'list',
								[1] = {
									['@type'] = 'template_reference',
									['@attributes'] = { ['name'] = 'action', ['value'] = 'action\\apply_modifiers_action' },
									['duration'] = 0,
									['permanent'] = false,
									['modifiers'] = {
										['@type'] = 'list',
										[1] = {
											['@type'] = 'template_reference',
											['@attributes'] = { ['name'] = 'modifier', ['value'] = 'modifiers\\income_fuel_player_modifier' },
											
											['application_type'] = { ['@type'] = 'enum', ['@attributes'] = { ['value'] = 'apply_to_player' } },
											['exclusive'] = false,
											['modifier_id'] = 'vehicle_upkeep',
											['target_type_name'] = '',
											['usage_type'] = { ['@type'] = 'enum', ['@attributes'] = { ['value'] = 'addition' } },
											['value'] = -upkeep,
											['tooltip'] = { ['@type'] = 'instance_reference', ['@attributes'] = { ['value'] = 'modifier_tooltip\\income_fuel_player_modifier' } }
										}
									},
									['id'] = { ['@type'] = 'uniqueid', ['@attributes'] = { ['value'] = string.format('%d', math.random()*1000000000) } },
								}
							},
							['id'] = { ['@type'] = 'uniqueid', ['@attributes'] = { ['value'] = string.format('%d', math.random()*1000000000) } },
							['fire_and_forget_non_global'] = false,
							['ui_help_text'] = {
								['@type'] = 'template_reference',
								['@attributes'] = { ['value'] = 'tables\\help_text_phrase' },
								
								['phrase_order'] = { ['@type'] = 'int', ['@attributes'] = { ['value'] = 0 } },
								['phrase'] = { ['@type'] = 'locstring', ['@attributes'] = { ['value'] = 0 } }
							}
						}
					else
						print('  updated')
						--print('  foundIndex: '..foundIndex)
						action_apply_ext.actions[foundIndex].action_table[1].modifiers[1].value = -upkeep
					end
					
					--xml:save()
				end
			end
		end
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end
