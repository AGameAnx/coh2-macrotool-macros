
print('local AIControl.WeaponStatistics = {')
-- This function runs for every xml file in the selected directory
function each_file(xml)
	local wb = xml.instance.weapon_bag
	if not wb then
		return
	end
	print('\t['..string.format('%q', xml.name)..'] = {')
	print('\t\t[\'accuracy\'] = {'..string.format('%q, %q, %q', wb.accuracy.near, wb.accuracy.mid, wb.accuracy.far)..'},')
	print('\t\t[\'aim\'] = {')
	print('\t\t\t[\'aim_time_multiplier\'] = {'..string.format('%q, %q, %q', wb.aim.aim_time_multiplier.near, wb.aim.aim_time_multiplier.mid, wb.aim.aim_time_multiplier.far)..'},')
	print('\t\t\t[\'fire_aim_time\'] = {'..string.format('%q, %q', wb.aim.fire_aim_time.min, wb.aim.fire_aim_time.max)..'},')
	print('\t\t\t[\'ready_aim_time\'] = {'..string.format('%q, %q, %q', wb.aim.ready_aim_time.near, wb.aim.ready_aim_time.mid, wb.aim.ready_aim_time.far)..'},')
	print('\t\t\t[\'post_firing_aim_time\'] = '..string.format('%q', wb.aim.post_firing_aim_time)..',')
	print('\t\t\t[\'post_firing_cooldown_interval\'] = '..string.format('%q', wb.aim.post_firing_cooldown_interval)..',')
	print('\t\t},')
	print('\t\t[\'area_effect\'] = {')
	print('\t\t\t[\'accuracy\'] = {'..string.format('%q, %q, %q', wb.area_effect.accuracy.near, wb.area_effect.accuracy.mid, wb.area_effect.accuracy.far)..'},')
	print('\t\t\t[\'aoe_penetration\'] = {'..string.format('%q, %q, %q', wb.area_effect.aoe_penetration.near, wb.area_effect.aoe_penetration.mid, wb.area_effect.aoe_penetration.far)..'},')
	print('\t\t\t[\'area_info\'] = {[\'radius\'] = '..string.format('%q', wb.area_effect.area_info.radius)..'},')
	print('\t\t\t[\'damage\'] = {'..string.format('%q, %q, %q', wb.area_effect.damage.near, wb.area_effect.damage.mid, wb.area_effect.damage.far)..'},')
	print('\t\t},')
	print('\t},')
	--xml:save()
end

-- This function runs at the end of execution
function at_end()
	print('}')
end
