
-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.extensions then
		for i,v in pairs(xml.instance.extensions) do
			if v["@attributes"]["value"] == "ebpextensions\\explosion_ext" then
				if xml.instance.extensions[i].terrain_hit.deformation.vertical_scale > 0 then
					local terrain_hit = xml.instance.extensions[i].terrain_hit
					print(xml.name)
					print("  terrain_hit.radius_min: "..terrain_hit.radius_min.." => "..string.format("%.1f", terrain_hit.radius_max * 0.5))
					print("  terrain_hit.radius_min: "..terrain_hit.radius_max.." => "..string.format("%.1f", terrain_hit.radius_max * 0.85))
					print("  terrain_hit.deformation.vertical_scale: "..terrain_hit.deformation.vertical_scale.." => "..string.format("%.6f", terrain_hit.deformation.vertical_scale * 0.5))
					terrain_hit.radius_min = tonumber(string.format("%.1f", terrain_hit.radius_max * 0.5))
					terrain_hit.radius_max = tonumber(string.format("%.1f", terrain_hit.radius_max * 0.85))
					terrain_hit.deformation.vertical_scale = tonumber(string.format("%.6f", terrain_hit.deformation.vertical_scale * 0.5))
					--xml:save()
				end
				break
			end
		end
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end
