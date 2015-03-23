
function pr(value, level)
	if level == nil then level = 0 end
	local i,v
	for i,v in pairs(value) do
		local tabs = ""
		for t = 1,level do
			tabs = tabs.."  "
		end
		local output = i.." = "
		if type(v) == "table" then
			if pairs(v) then
				print(tabs..output.."{")
				pr(v, level+1)
				print(tabs.."}")
			else
				print(tabs..output.."{}")
			end
		else
			if type(v) == "string" then
				print(tabs..output..'"'..tostring(v)..'"')
			elseif type(v) == "function" then
				print(tabs..output..'FUNC')
			else
				print(tabs..output..tostring(v))
			end
		end
	end
end

-- This function runs for every xml file in the selected directory
function each_file(xml)
	print(xml.name.." = {")
	pr(xml.instance, 1)
	print("}")
end

-- This function runs at the end of execution
function at_end()
	
end
