
-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.weapon_bag then
		local w = xml.instance.weapon_bag
		print("@@ "..xml.name)
		
		print("  w.damage.min: "..string.format("%d -> %d", w.damage.min, w.damage.min * 1.5525))
		w.damage.min = tonumber(string.format("%d", w.damage.min * 1.5525))
		print("  w.damage.max: "..string.format("%d -> %d", w.damage.max, w.damage.max * 1.5525))
		w.damage.max = tonumber(string.format("%d", w.damage.max * 1.5525))
		
		print("  w.range.max: "..string.format("%d -> %d", w.range.max, w.range.max * 1.125))
		w.range.max = tonumber(string.format("%d", w.range.max * 1.125))
		if w.range.distance.far > 0 then
			print("  w.range.distance.far: "..string.format("%d -> %d", w.range.distance.far, w.range.distance.far * 1.125))
			w.range.distance.far = tonumber(string.format("%d", w.range.distance.far * 1.125))
		end
		if w.range.distance.mid > 0 then
			print("  w.range.distance.mid: "..string.format("%d -> %d", w.range.distance.mid, w.range.distance.mid * 1.05))
			w.range.distance.mid = tonumber(string.format("%d", w.range.distance.mid * 1.05))
		end
		if w.range.distance.near > 0 then
			print("  w.range.distance.near: "..string.format("%d -> %d", w.range.distance.near, math.max(w.range.min, w.range.distance.near * 1.05)))
			w.range.distance.near = tonumber(string.format("%d", w.range.distance.near * 1.05))
		end
		
		if w.accuracy.far < 1 and w.accuracy.far > 0 then
			print("  w.accuracy.far: "..string.format("%.2f -> %.2f", w.accuracy.far, w.accuracy.far * 0.6))
			w.accuracy.far = tonumber(string.format("%.2f", w.accuracy.far * 0.6))
		end
		if w.accuracy.mid < 1 and w.accuracy.mid > 0 then
			print("  w.accuracy.mid: "..string.format("%.2f -> %.2f", w.accuracy.mid, w.accuracy.mid * 0.9))
			w.accuracy.mid = tonumber(string.format("%.2f", w.accuracy.mid * 0.9))
		end
		if w.accuracy.near < 1 and w.accuracy.near > 0 then
			print("  w.accuracy.near: "..string.format("%.2f -> %.2f", w.accuracy.near, math.max(0.01, math.min(0.99, w.accuracy.near * 1.35))))
			w.accuracy.near = tonumber(string.format("%.2f", math.max(0.01, math.min(0.99, w.accuracy.near * 1.35))))
		end
		
		if w.cover_table.tp_light.accuracy_multiplier < 1 and w.cover_table.tp_light.accuracy_multiplier > 0.3 and w.cover_table.tp_light.damage_multiplier > 0.5 then
			print("  w.cover_table.tp_light.damage_multiplier: "..string.format("%.2f -> %.2f", w.cover_table.tp_light.damage_multiplier, w.cover_table.tp_light.damage_multiplier * 0.85))
			w.cover_table.tp_light.damage_multiplier = tonumber(string.format("%.2f", w.cover_table.tp_light.damage_multiplier * 0.85))
		end
		
		--xml:save()
	end
end

-- This function runs at the end of execution
function at_end()
	print("Done")
end
