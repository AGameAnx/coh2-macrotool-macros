
-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.extensions then
		for i,v in pairs(xml.instance.extensions) do
			if i ~= '@type' and v['@attributes']['value'] == 'ebpextensions\\health_ext' then
				local rear_damage_enabled = 'false'
				if v.rear_damage_enabled then rear_damage_enabled = 'true' end
				print('\t['..string.format('%q', xml.name)..'] = {'..v.armor..', '..rear_damage_enabled..', '..v.rear_armor..'},')
				break
			end
		end
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end
