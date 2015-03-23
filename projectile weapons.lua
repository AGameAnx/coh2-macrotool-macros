
local search = 'pak40_75mm_mp'

-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.weapon_bag and xml.instance.weapon_bag.projectile.projectile['@attributes']['value'] == 'ebps\\projectile\\'..search then
		print(xml.path)
		--print('   '..xml.instance.weapon_bag.penetration.far..', '..xml.instance.weapon_bag.penetration.mid..', '..xml.instance.weapon_bag.penetration.near)
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end
