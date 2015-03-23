
function printTable(value, level)
	local tabs = ''
	for i=1,level do
		tabs = tabs .. '  '
	end
	for i,v in pairs(value) do
		if type(v) == 'table' or type(v) == 'object' then
			print(tabs..'['..tostring(i)..'] = {')
			printTable(v, level+1)
			print(tabs..'}')
		else
			print(tabs..'['..tostring(i)..'] = '..tostring(v))
		end
	end
end

local projectiles = {
	'aef_57mm_at_gun',
	'aef_57mm_at_gun_sabot_round',
	'aef_75mm_tank_shell_mp',
	'aef_76mm_high_velocity_tank_shell_mp',
	'aef_75mm_high_velocity_tank_shell_he_mp',
	'aef_76mm_high_velocity_tank_shell_e8_mp',
	'aef_76mm_high_velocity_tank_shell_he_mp',
	'aef_m8a1_hmc_he_75mm_shell_angle_distance_fire_mp',
	'aef_m9_bazooka_rocket',
	'aef_m10_ap_round',
	'aef_m10_tank_shell_mp',
	'stuart_mp',
	'stuart_ability_mp',
	't34_85_zis-s-53_85mm_t34',
	'aef_m36_90mm',
	'aef_m36_m10_ap_round',
	'd5_85mm_tank_gun',
	'is2_122mm_he',
	'is2_122mm_he_mp',
	'isu_152_shell',
	'isu_152_shell_mp',
	'isu_152_shell_piercing_shot_mp',
	'kwk_36_88mm_shell_mp',
	'kwk_40_75mm_panzeriv_tank_gun_mp',
	'kwk_40_75mm_panzeriv_tank_gun_wg_mp',
	'kwk_42_75mm_panther_tank_gun',
	'kwk_42_75mm_panther_tank_gun_mp',
	'kwk_42_75mm_panther_tank_gun_wg_mp',
	'kwk_43_88mm_shell_mp',
	'kwk37_panzeriii_50mm',
	'kwk37_panzeriv_stubby',
	'kwk37_panzeriv_stubby_mp',
	'kwk37_stugiii_stubby_mp',
	'kwk38_20mm_mp',
	'm8a1_hmc_he_75mm_shell_mp',
	'pak_88mm_pak43_shell_mp',
	'pak_88mm_shell',
	'pak_88mm_shell_elefant_mp',
	'pak_88mm_shell_mp',
	'pak40_75mm',
	'pak40_75mm_mp',
	'pak43_88mm_shell_mp',
	'pak44_128mm_piercing_shell_mp',
	'pak44_128mm_shell_mp',
	'pak44_128mm_supporting_fire_shell_mp',
	'panzerschreck',
	'panzerschreck_mp',
	'raketenwefer_43_88cm_mp',
	'soviet_45mm',
	'soviet_45mm_kv8_mp',
	'soviet_45mm_mp',
	'soviet_45mm_t70_mp',
	'soviet_76mm_at_shell',
	'soviet_76mm_at_shell_mp',
	'soviet_76mm_tank_shell_mp',
	'soviet_152mm_at_shell_mp',
	'soviet_kv2_150mm_indirect',
	'soviet_kv2_direct_fire',
	'su76_at_76mm_shell',
	'su76_at_76mm_shell_mp'
}

local addedProjectiles = {}

-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.weapon_bag then
		local projectileFound = false
		for i,v in pairs(projectiles) do
			if 'ebps\\projectile\\'..v == xml.instance.weapon_bag.projectile.projectile['@attributes'].value then
				projectileFound = true
				break
			end
		end
		if projectileFound then
			local damageAvg = (xml.instance.weapon_bag.damage.min+xml.instance.weapon_bag.damage.max)/2
			local scriptPenDamageReduction = math.min(120, tonumber(string.format('%.0f', damageAvg/1.5/10))*10)
			
			if damageAvg >= 60 then
				local reductionPercent = scriptPenDamageReduction / damageAvg
				if not addedProjectiles[xml.instance.weapon_bag.projectile.projectile['@attributes'].value] then
					print('\t['..string.format('%q', string.sub(xml.instance.weapon_bag.projectile.projectile['@attributes'].value, 17))..'] = {')
					print('\t\t'..damageAvg..',')
					print('\t\t{'..xml.instance.weapon_bag.damage.min..', '..xml.instance.weapon_bag.damage.max..'},')
					print('\t\t{'..
						xml.instance.weapon_bag.penetration.near..', '..
						xml.instance.weapon_bag.penetration.mid..', '..
						xml.instance.weapon_bag.penetration.far..
					'}')
					print('\t\t{'..xml.instance.weapon_bag.range.min..', '..xml.instance.weapon_bag.range.max..'},')
					print('\t\t{'..
						xml.instance.weapon_bag.range.distance.near..', '..
						xml.instance.weapon_bag.range.distance.mid..', '..
						xml.instance.weapon_bag.range.distance.far..
					'}')
					print('\t},')
				end
				
				xml.instance.weapon_bag.penetration.near = 0.01
				xml.instance.weapon_bag.penetration.mid = 0.01
				xml.instance.weapon_bag.penetration.far = 0.01
				
				xml:save()
			end
			if addedProjectiles[xml.instance.weapon_bag.projectile.projectile['@attributes'].value] then
				if damageAvg ~= addedProjectiles[xml.instance.weapon_bag.projectile.projectile['@attributes'].value][2] then
					print('!!!! ['..xml.name..' // '..addedProjectiles[xml.instance.weapon_bag.projectile.projectile['@attributes'].value][1]..']')
				end
			else
				addedProjectiles[xml.instance.weapon_bag.projectile.projectile['@attributes'].value] = {xml.name, damageAvg}
			end
		end
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end

--printTable(xml.instance.weapon_bag.damage.on_penetrated_actions, 1)
--[[table.insert(xml.instance.weapon_bag.damage.on_penetrated_actions, {
	['@type'] = 'template_reference',
	['@attributes'] = {
		['value'] = 'action\\requirement_action',
		['name'] = 'action'
	},
	['check_self'] = false,
	['global_fire_and_forget_on_success'] = false,
	['instant_requirement_check'] = true,
	['kill_action_on_failed_requirements'] = false,
	['no_retrigger'] = false,
	['validate_all_sub_actions'] = true,
	['id'] = {
		['@attributes'] = {
			['value'] = 1073744123
		},
		['@type'] = 'uniqueid'
	},
	['fire_and_forget_non_global'] = false,
	['ui_help_text'] = {
		['@attributes'] = {
			['value'] = 'tables\\help_text_phrase'
		},
		['@type'] = 'template_reference',
		['phrase_order'] = {
			['@attributes'] = {
				['value'] = 0
			},
			['@type'] = 'int'
		},
		['phrase'] = {
			['@attributes'] = {
				['value'] = 0
			},
			['@type'] = 'locstring'
		}
	},
	['requirement_table'] = {
		['@type'] = 'list',
		[1] = {
			['@type'] = 'template_reference',
			['@attributes'] = {
				['value'] = 'requirements\\required_unit_type',
				['name'] = 'required'
			},
			['reason'] = {
				['@type'] = 'enum',
				['@attributes'] = {
					['value'] = 'usage'
				}
			},
			['ui_name'] = {
				['@type'] = 'locstring',
				['@attributes'] = {
					['value'] = 0
				}
			},
			['unit_type'] = {
				['@type'] = 'enum',
				['@attributes'] = {
					['value'] = 'building'
				}
			},
			['qualify_option'] = {
				['@type'] = 'template_reference',
				['@attributes'] = {
					['value'] = 'options\\none'
				}
			},
			['search_load_out'] = false,
			['owned_by_player_only'] = true
		}
	},
	['action_table'] = {
		[1] = {
			['@attributes'] = {
				['value'] = 'action\\damage',
				['name'] = 'action'
			},
			['id'] = {
				['@type'] = 'uniqueid',
				['@attributes'] = {
					['value'] = 1073744124
				}
			},
			['damage'] = scriptPenDamageReduction,
			['percentage'] = false,
			['set'] = false,
			['cause_criticals'] = true,
			['crit_weapon_type'] = {
				['@type'] = 'enum',
				['@attributes'] = {
					['value'] = 'ballistic'
				}
			}
		}
	}
})]]
