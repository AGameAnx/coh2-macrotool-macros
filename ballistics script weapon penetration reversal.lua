
local ballistics_settings = {
	["aef_57mm_at_gun"] = {
		160,
		{160, 160},
		{140, 125, 115},
		{0, 66},
		{-1, 30, -1}
	},
	["aef_57mm_at_gun_sabot_round"] = {
		160,
		{160, 160},
		{140*1.5, 125*1.5, 115*1.5},
		{0, 66},
		{-1, 30, -1}
	},
	["aef_57mm_at_gun_take_aim"] = {
		160,
		{160, 160},
		{140, 125, 115},
		{0, 66+6},
		{-1, 30+6, -1}
	},
	["aef_m9_bazooka_rocket"] = {
		100,
		{100, 100},
		{130, 120, 110},
		{0, 39},
		{-1, -1, -1}
	},
	["aef_m10_ap_round"] = {
		160,
		{160, 160},
		{250, 225, 200},
		{0, 45},
		{0, 28, 45}
	},
	["aef_m10_tank_shell_mp"] = {
		160,
		{160, 160},
		{180, 160, 140},
		{0, 45},
		{0, 28, 45}
	},
	["aef_m36_m10_ap_round"] = {
		240,
		{240, 240},
		{280, 250, 220},
		{0, 51},
		{0, 30, 51}
	},
	["aef_m36_90mm"] = {
		220,
		{220, 220},
		{200, 180, 160},
		{0, 51},
		{0, 30, 51}
	},
	["stuart_mp"] = {
		60,
		{60, 60},
		{100, 80, 60},
		{0, 44},
		{8, 15, 33}
	},
	["aef_76mm_high_velocity_tank_shell_mp"] = { -- used in soviet and usf sherman weapons, stats match
		160,
		{160, 160},
		{140, 130, 120},
		{0, 50},
		{0, 22.5, 50}
	},
	["aef_76mm_high_velocity_tank_shell_e8_mp"] = {
		160,
		{160, 160},
		{175, 165, 155},
		{0, 44},
		{0, 20, 44}
	},
	["aef_76mm_high_velocity_tank_shell_he_mp"] = {
		80,
		{80, 80},
		{50, 35, 15},
		{0, 44},
		{0, 20, 44}
	},
	["aef_75mm_high_velocity_tank_shell_he_mp"] = {
		160,
		{160, 160},
		{25, 25, 25},
		{0, 44},
		{0, 20, 44}
	},
	["aef_75mm_tank_shell_mp"] = {
		160,
		{160, 160},
		{120, 100, 80},
		{0, 44},
		{0, 20, 44}
	},
	["aef_105mm_sherman_tank_shell_mp"] = {
		160,
		{160, 160},
		{35, 35, 35},
		{0, 50},
		{-1, -1, -1}
	},
	["m8a1_hmc_he_75mm_shell_mp"] = {
		120,
		{120, 120},
		{40, 40, 40},
		{10, 60},
		{10, 35, 60}
	},
	["aef_m8a1_hmc_he_75mm_shell_angle_distance_fire_mp"] = { -- used in victor target and normal weapon, stats match except range
		120,
		{120, 120},
		{75, 75, 75},
		{10, 80},
		{10, 35, 60}
	},
	["pak40_75mm"] = {
		80,
		{80, 80},
		{170, 170, 170},
		{0, 63},
		{10, 25, 60}
	},
	["pak40_75mm_mp"] = { -- used in an OKW pak40 (unused ingame), stats match
		160,
		{160, 160},
		{210, 180, 120},
		{0, 63},
		{10, 25, 60}
	},
	--[[["pak40_75mm_critical_mp"] = { -- used in an OKW pak40 (unused ingame), stats match
		160,
		{160, 160},
		{420, 400, 380},
		{0, 63},
		{10, 25, 60}
	},]]
	["pak_88mm_pak43_shell_mp"] = {
		320,
		{320, 320},
		{380, 340, 300},
		{5, 83},
		{-1, -1, -1}
	},
	--[[["pak_88mm_pak43_shell_critical_mp"] = {
		320,
		{320, 320},
		{760, 680, 600},
		{5, 100},
		{-1, -1, -1}
	},]]
	["panzerschreck"] = { -- used in sp folder destroy engine and normal sp weapon, stats match
		150,
		{150, 150},
		{170, 170, 170},
		{0, 44},
		{-1, -1, -1}
	},
	["panzerschreck_mp"] = { -- used for ostheer, okw and sp rangers panzerschreks, stats match
		150,
		{150, 150},
		{180, 170, 160},
		{0, 39},
		{0, 17.5, 39}
	},
	["50mm_puma_gun_projectile"] = {
		120,
		{120, 120},
		{160, 120, 80},
		{0, 53},
		{10, 30, 53}
	},
	--[[["50mm_puma_gun_projectile_critical"] = {
		120,
		{120, 120},
		{320, 240, 160},
		{0, 80},
		{0, 17.5, 39}
	},]]
	['sdkfz_234_kwk39_5cm_shell_mp'] = { -- OKW Puma
		120,
		{120, 120},
		{160, 120, 80},
		{0, 53},
		{10, 30, 53}
	},
	["pak_88mm_shell_elefant_mp"] = {
		300,
		{300, 300},
		{440, 400, 360},
		{0, 110},
		{-1, -1, -1}
	},
	["pak_88mm_shell_elefant_critical_mp"] = {
		300,
		{300, 300},
		{880, 800, 720},
		{0, 110},
		{-1, -1, -1}
	},
	["kwk_42_75mm_panther_tank_gun"] = {
		120,
		{120, 120},
		{260, 240, 220},
		{0, 44},
		{-1, -1, -1}
	},
	["kwk_42_75mm_panther_tank_gun_mp"] = { -- used in ostheer panther, and two command panthers (okw and ostheer), stats match
		160,
		{160, 160},
		{260, 240, 220},
		{0, 55},
		{0, 25, 55}
	},
	["kwk_40_75mm_panzeriv_tank_gun_wg_mp"] = { -- used in ostheer and okw pzivs, stats match
		160,
		{160, 160},
		{120, 110, 100},
		{0, 44},
		{-1, -1, -1}
	},
	["kwk37_panzeriv_stubby_mp"] = {
		80,
		{80, 80},
		{55, 50, 45},
		{0, 44},
		{-1, -1, -1}
	},
	["pak_88mm_shell"] = { -- used in ostheer sp tigers (unchecked)
		160,
		{160, 160},
		{220, 200, 180},
		{0, 44},
		{-1, -1, -1}
	},
	["pak_88mm_shell_mp"] = { -- used in normal and sp_mp tiger, stats match
		160,
		{160, 160},
		{220, 200, 180},
		{0, 44},
		{-1, -1, -1}
	},
	["stug_75mm_mp"] = {
		160,
		{160, 160},
		{130, 120, 110},
		{0, 55},
		{-1, -1, -1}
	},
	--[[["stug_75mm_critical_mp"] = {
		160,
		{160, 160},
		{280, 280, 280},
		{0, 55},
		{-1, -1, -1}
	},]]
	--[[["tiger_ace_critical"] = {
		160,
		{160, 160},
		{440, 400, 360},
		{0, 55},
		{-1, -1, -1}
	},]]
	["wg_jagdpanzer_mp"] = {
		160,
		{160, 160},
		{200, 185, 170},
		{0, 60},
		{0, 30, 60}
	},
	["kwk_40_75mm_panzeriv_tank_gun_mp"] = { -- this is unused (used in OKW stug, stats are not updated)
		160,
		{160, 160},
		{120, 110, 100},
		{0, 55},
		{-1, -1, -1}
	},
	["kwk37_panzeriv_stubby"] = { -- SP short barrel stug
		80,
		{80, 80},
		{40, 40, 40},
		{0, 50},
		{-1, -1, -1}
	},
	["kwk37_stugiii_stubby_mp"] = {
		80,
		{80, 80},
		{55, 50, 45},
		{0, 55},
		{-1, -1, -1}
	},
	["soviet_45mm_mp"] = {
		100,
		{100, 100},
		{140, 100, 70},
		{0, 66},
		{-1, -1, -1}
	},
	["soviet_76mm_at_shell"] = {
		80,
		{80, 80},
		{170, 170, 170},
		{0, 63},
		{10, 25, 60}
	},
	["soviet_76mm_at_shell_mp"] = {
		160,
		{160, 160},
		{200, 190, 130},
		{0, 63},
		{10, 25, 60}
	},
	["isu_152_shell_mp"] = {
		240,
		{240, 240},
		{260, 230, 200},
		{5, 77},
		{5, 37.5, 77}
	},
	["isu_152_shell_ap_mp"] = {
		240,
		{240, 240},
		{260, 230, 200},
		{5, 77},
		{5, 37.5, 77}
	},
	["isu_152_shell_barrage_mp"] = {
		240,
		{240, 240},
		{1000, 1000, 1000},
		{50, 110},
		{50, 75, 110}
	},
	["isu_152_shell"] = {
		270,
		{270, 270},
		{170, 170, 170},
		{0, 110},
		{-1, -1, -1}
	},
	["isu_152_shell_piercing_shot_mp"] = {
		240,
		{240, 240},
		{400, 350, 300},
		{25, 143},
		{-1, -1, -1}
	},
	["soviet_45mm_kv8_mp"] = {
		80,
		{80, 80},
		{50, 50, 50},
		{0, 44},
		{-1, -1, -1}
	},
	["soviet_kv2_direct_fire"] = {
		210,
		{210, 210},
		{200, 180, 160},
		{0, 44},
		{-1, -1, -1}
	},
	["soviet_kv2_150mm_indirect"] = {
		210,
		{210, 210},
		{200, 180, 160},
		{25, 77},
		{-1, -1, -1}
	},
	["su76_at_76mm_shell"] = {
		80,
		{80, 80},
		{160, 120, 80},
		{5, 66},
		{-1, -1, -1}
	},
	["su76_at_76mm_shell_mp"] = {
		120,
		{120, 120},
		{160, 120, 80},
		{0, 61},
		{20, 35, 60}
	},
	["d5_85mm_tank_gun"] = {
		160,
		{160, 160},
		{200, 190, 180},
		{0, 66},
		{-1, -1, -1}
	},
	["soviet_76mm_tank_shell_mp"] = { -- used for the three kv-1 weapons, stats match
		160,
		{160, 160},
		{120, 100, 80},
		{0, 44},
		{-1, -1, -1}
	},
	["d25t_122mm"] = {
		160,
		{160, 160},
		{250, 220, 190},
		{0, 44},
		{-1, -1, -1}
	},
	["d25t_122mm_mp"] = {
		160,
		{160, 160},
		{250, 220, 190},
		{0, 44},
		{-1, -1, -1}
	},
	["t34_85_zis-s-53_85mm_t34"] = {
		160,
		{160, 160},
		{160, 140, 120},
		{0, 44},
		{-1, -1, -1}
	},
	["raketenwefer_43_88cm_mp"] = {
		160,
		{160, 160},
		{200, 190, 180},
		{0, 57},
		{0, 25, 57}
	},
	["pak44_128mm_shell_mp"] = {
		300,
		{300, 300},
		{550, 525, 500},
		{0, 94},
		{0, 42.5, 94}
	},
	["pak44_128mm_supporting_fire_shell_mp"] = {
		160,
		{160, 160},
		{550, 525, 500},
		{25, 138},
		{25, 75, 138}
	},
	["pak44_128mm_piercing_shell_mp"] = {
		300,
		{300, 300},
		{550, 525, 500},
		{0, 94},
		{0, 42.5, 94}
	},
	["kwk_42_75mm_panther_tank_gun_wg_mp"] = { -- used in a vet weapon, stats match
		160,
		{160, 160},
		{260, 240, 220},
		{0, 55},
		{0, 25, 55}
	},
	["kwk_36_88mm_shell_mp"] = {
		160,
		{160, 160},
		{220, 200, 180},
		{0, 44},
		{-1, -1, -1}
	},
	["kwk_43_88mm_shell_mp"] = { -- used in okw tiger and tiger spearhead, stats match
		240,
		{240, 240},
		{240, 220, 200},
		{0, 44},
		{0, 20, 44}
	}
}

-- This function runs for every xml file in the selected directory
function each_file(xml)
	if xml.instance.weapon_bag then
		local slash_index_in_string = string.find(string.reverse(xml.instance.weapon_bag.projectile.projectile['@attributes']['value']), '\\')
		if slash_index_in_string then
			local projectile_name = string.sub(xml.instance.weapon_bag.projectile.projectile['@attributes']['value'], -slash_index_in_string+1)
			--print(projectile_name)
			local setting = ballistics_settings[projectile_name]
			if setting then
				print('# '..xml.name)
				--print('damage.min: '..xml.instance.weapon_bag.damage.min..' -> '..setting[2][1])
				--print('damage.max: '..xml.instance.weapon_bag.damage.max..' -> '..setting[2][2])
				print('penetration.near: '..xml.instance.weapon_bag.penetration.near..' -> '..setting[3][1])
				print('penetration.mid: '..xml.instance.weapon_bag.penetration.mid..' -> '..setting[3][2])
				print('penetration.far: '..xml.instance.weapon_bag.penetration.far..' -> '..setting[3][3])
				xml.instance.weapon_bag.penetration.near = setting[3][1]
				xml.instance.weapon_bag.penetration.mid = setting[3][2]
				xml.instance.weapon_bag.penetration.far = setting[3][3]
				xml:save()
			end
		end
	end
end

-- This function runs at the end of execution
function at_end()
	print('Done!')
end
