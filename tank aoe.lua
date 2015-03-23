
-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.weapon_bag
			and xml.instance.weapon_bag.area_effect
			and xml.instance.weapon_bag.area_effect.area_info.radius > 0 then
		
		local area_effect = xml.instance.weapon_bag.area_effect
		
		print(xml.name)
		if area_effect.damage.far > 0.07 then
			print("  area_effect.damage.far: "..area_effect.damage.far.." => "..string.format("%.3f", area_effect.damage.far * 0.4))
			area_effect.damage.far = tonumber(string.format("%.3f", area_effect.damage.far * 0.4))
		end
		print("  area_effect.area_info.radius: "..area_effect.area_info.radius.." => "..string.format("%.1f", area_effect.area_info.radius * 1.35))
		print("  area_effect.distance.far: "..area_effect.distance.far.." => "..string.format("%.1f", area_effect.distance.far * 1.35))
		print("  area_effect.distance.mid: "..area_effect.distance.mid.." => "..string.format("%.1f", area_effect.distance.mid * 0.75))
		print("  area_effect.distance.near: "..area_effect.distance.near.." => "..string.format("%.1f", area_effect.distance.near * 0.5))
		area_effect.area_info.radius = tonumber(string.format("%.1f", area_effect.area_info.radius * 1.25))
		area_effect.distance.far = tonumber(string.format("%.1f", area_effect.distance.far * 1.25))
		area_effect.distance.mid = tonumber(string.format("%.1f", area_effect.distance.mid * 0.75))
		area_effect.distance.near = tonumber(string.format("%.1f", area_effect.distance.near * 0.5))
		--xml:save()
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end


--[[
-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.weapon_bag
			and xml.instance.weapon_bag.area_effect
			and xml.instance.weapon_bag.area_effect.area_info.radius > 0 then
		
		local area_effect = xml.instance.weapon_bag.area_effect
		
		print(xml.name)
		if area_effect.damage.far > 0.062 then
			print("  area_effect.damage.far: "..area_effect.damage.far.." => "..string.format("%.2f", area_effect.damage.far * 1.75))
			area_effect.damage.far = tonumber(string.format("%.2f", area_effect.damage.far * 1.75))
		end
		print("  area_effect.distance.mid: "..area_effect.distance.mid.." => "..string.format("%.1f", area_effect.distance.mid * 1.2))
		area_effect.distance.mid = tonumber(string.format("%.1f", area_effect.distance.mid * 1.2))
		
		print("  area_effect.distance.near: "..area_effect.distance.near.." => "..string.format("%.1f", area_effect.distance.near * 1.3))
		area_effect.distance.near = tonumber(string.format("%.1f", area_effect.distance.near * 1.3))
		xml:save()
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end
]]
