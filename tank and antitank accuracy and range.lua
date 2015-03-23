
-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.weapon_bag then
		
		print(xml.name)
		
		local range = xml.instance.weapon_bag.range
		local accuracy = xml.instance.weapon_bag.accuracy
		
		if range.distance.far > 0 then
			print("  range.distance.far: "..range.distance.far.." => "..string.format("%.f", range.distance.far * 1.1))
			range.distance.far = tonumber(string.format("%.f", range.distance.far * 1.1))
		end
		
		print("  range.max: "..range.max.." => "..string.format("%.f", range.max * 1.1))
		range.max = tonumber(string.format("%.f", range.max * 1.1))
		
		local accuracy_near = accuracy.near
		local accuracy_mid = accuracy.mid
		local accuracy_far = accuracy.far
		if accuracy.near < 1 then
			print("  accuracy.near: "..accuracy.near.." => "..string.format("%.3f", accuracy_near + (1 - accuracy_near) * 0.045))
			accuracy.near = tonumber(string.format("%.3f", accuracy_near + (1 - accuracy_near) * 0.045))
		end
		if accuracy.mid < 1 then
			print("  accuracy.mid: "..accuracy.mid.." => "..string.format("%.3f", math.min(accuracy.near, accuracy_mid + (accuracy_near - accuracy_mid) * 0.25)))
			accuracy.mid = tonumber(string.format("%.3f", math.min(accuracy.near, accuracy_mid + (accuracy_near - accuracy_mid) * 0.25)))
		end
		if accuracy.far < 1 then
			print("  accuracy.far: "..accuracy.far.." => "..string.format("%.3f", math.min(accuracy.mid, accuracy_far + (accuracy_mid - accuracy_far) * 0.65)))
			accuracy.far = tonumber(string.format("%.3f", math.min(accuracy.mid, accuracy_far + (accuracy_mid - accuracy_far) * 0.65)))
		end
		
		xml:save()
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end
