local showWeaponsOfInterestOnly = true
local onlySmallArms = true

-- NORMALLY UNUSED LISTS
-- Copy into weaponsOfInterest table when needed
local list_Pistols = {
	['aef\\small_arms\\single_fire\\pistol\\medic_m1911_45cal_pistol_mp.xml'] = 3,
	['axis\\small_arms\\single_fire\\pistol\\luger_p08_9mm_pistol_mp.xml'] = 1,
	['west_german\\small_arms\\single_fire\\pistol\\officer_luger_p08_9mm_pistol_mp.xml'] = 1,
}
local list_BaseWeapons = { -- needs updating
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\aef_base_m2hb_50cal_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\bunker_starting_position_dshk_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\bunker_starting_position_maxim_mp.xml'] = 1, -- check
}
local list_VehicleMGs = {
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m5_stuart_top_mounted_30cal_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m7b1_priest_m2hb_50cal_mounted_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m8_greyhound_m2hb_50cal_mounted_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\sherman_m10_m36_m2hb_50cal_mounted_tank_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\light_machine_gun\\m5a1_stuart_m1919a4_30_cal_coaxial_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\light_machine_gun\\m5a1_stuart_m1919a4_30_cal_hull_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\light_machine_gun\\m5a1_stuart_m1919a4_30_cal_mounted_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\light_machine_gun\\m8_greyhound_m1919a4_30cal_coaxial_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\light_machine_gun\\sherman_m4a3_coaxial_vehicle_turret105_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\light_machine_gun\\sherman_m4a3_coaxial_vehicle_turret_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\light_machine_gun\\sherman_m4a3_vehicle_hull_mp.xml'] = 1, -- check
	
	['axis\\small_arms\\machine_gun\\light_machine_gun\\halftrack_mg42_vehicle_mp.xml'] = 1, -- check
	['axis\\small_arms\\machine_gun\\light_machine_gun\\mg34_coaxial_generic_mp.xml'] = 1, -- check
	['axis\\small_arms\\machine_gun\\light_machine_gun\\mg34_coaxial_generic_tigerace_mp.xml'] = 1, -- check
	['axis\\small_arms\\machine_gun\\light_machine_gun\\mg34_hull_mp.xml'] = 1, -- check
	['axis\\small_arms\\machine_gun\\light_machine_gun\\mg42_turret_mounted_brummbar_mp.xml'] = 1, -- check
	['axis\\small_arms\\machine_gun\\light_machine_gun\\mg42_turret_mounted_panther_mp.xml'] = 1, -- check
	['axis\\small_arms\\machine_gun\\light_machine_gun\\mg42_turret_mounted_pziv_mp.xml'] = 1, -- check
	['axis\\small_arms\\machine_gun\\light_machine_gun\\mg42_turret_mounted_stugiv_mp.xml'] = 1, -- check
	--['axis\\small_arms\\machine_gun\\light_machine_gun\\scout_car_mg34_coaxial_generic_mp.xml'] = 1, -- check
	
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\dshk_38_pintle_mounted_tank_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\sherman_top_gunner.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\coaxial_vehicle_hull_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\coaxial_vehicle_turret_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\coaxial_vehicle_turret_rear_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\is2_coaxial_vehicle_turret_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\sherman_coaxil_turret_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\sherman_hull_gun_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\t-70m_coaxial_vehicle.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\t-70m_coaxial_vehicle_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\t34_76_85_coaxial_vehicle_hull_greent34_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\t34_76_85_coaxial_vehicle_hull_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\t34_76_85_coaxial_vehicle_turret_greent34_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\t34_76_85_coaxial_vehicle_turret_mp.xml'] = 1, -- check
	
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\generic_mg34_coaxial_mp.xml'] = 1, -- check
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\generic_mg34_hull_mp.xml'] = 1, -- check
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\mg42_hull_mounted_sturmtiger_mp.xml'] = 1, -- check
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\mg42_turret_mounted_king_tiger_mp.xml'] = 1, -- check
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\mg42_turret_mounted_panther_wg_mp.xml'] = 1, -- check
}

-- All other weapons will be skipped if showWeaponsOfInterestOnly is set to true. The number next to the file indicates the number of weapons of that type the squad normally carries
local weaponsOfInterest = {
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\dodge_wc51_m1917_30cal_mp.xml'] = 1, -- check
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\dodge_wc51_m2hb_50cal_mp.xml'] = 1, -- check
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\fighting_position_mg_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m15a1_aa_half_track_50cal_left_mp.xml'] = 1,
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m15a1_aa_half_track_50cal_left_special_aa_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m15a1_aa_half_track_50cal_right_mp.xml'] = 1,
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m15a1_aa_half_track_50cal_right_special_aa_mp.xml'] = 1, -- check
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m1919a4_30cal_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m20_utility_car_m2hb_50cal_mounted_mp.xml'] = 1,
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m2hb_50cal_fighting_position_mp.xml'] = 1, -- check
	['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m2hb_50cal_mp.xml'] = 1,
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\m3_halftrack_m2hb_50cal_mp.xml'] = 1, -- check
	--['aef\\small_arms\\machine_gun\\heavy_machine_gun\\p47_50cal_machineguns.xml'] = 1, -- check (sp only)
	['aef\\small_arms\\machine_gun\\light_machine_gun\\paratrooper_m1919a6_lmg_moving_mp.xml'] = 2,
	['aef\\small_arms\\machine_gun\\light_machine_gun\\riflemen_bar_30_06_light_machine_gun_mp.xml'] = 1,
	['aef\\small_arms\\machine_gun\\sub_machine_gun\\captain_m1_thompson_mp.xml'] = 1,
	['aef\\small_arms\\machine_gun\\sub_machine_gun\\engineer_m3_grease_gun_mp.xml'] = 4,
	['aef\\small_arms\\machine_gun\\sub_machine_gun\\m3_grease_gun_vehicle_crew_mp.xml'] = 4,
	['aef\\small_arms\\machine_gun\\sub_machine_gun\\paratrooper_m1_thompson_mp.xml'] = 4,
	--['aef\\small_arms\\machine_gun\\sub_machine_gun\\ranger_m1_thompson_mp.xml'] = 1, -- check
	['aef\\small_arms\\single_fire\\rifle\\m1a1_carbine_paratrooper_mp.xm'] = 4,
	['aef\\small_arms\\single_fire\\rifle\\m1_carbine_rear_echelon_mp.xml'] = 4,
	--['aef\\small_arms\\single_fire\\rifle\\m1_garand_rifle_rear_echelon_mp.xml'] = 5, -- check
	['aef\\small_arms\\single_fire\\rifle\\m1_garand_rifle_rifleman_mp.xml'] = 5,
	['aef\\small_arms\\single_fire\\rifle\\pathfinder_m1garand_scope_mp.xml'] = 4,
	
	['axis\\small_arms\\machine_gun\\heavy_machine_gun\\bunker_mg42_mp.xml'] = 1,
	['axis\\small_arms\\machine_gun\\heavy_machine_gun\\hmg_team_mg42_mp.xml'] = 1,
	['axis\\small_arms\\machine_gun\\light_machine_gun\\grenadier_mg42lmg_mp.xml'] = 1,
	['axis\\small_arms\\machine_gun\\light_machine_gun\\scout_car_mg34_pintle_generic_mp.xml'] = 1,
	['axis\\small_arms\\machine_gun\\sub_machine_gun\\eg_pioneer_mp40_smg_mp.xml'] = 4,
	['axis\\small_arms\\machine_gun\\sub_machine_gun\\assault_grenadier_mp40.xml'] = 5,
	['axis\\small_arms\\machine_gun\\sub_machine_gun\\panzer_grenadier_mp44_smg_mp.xml'] = 4,
	--['axis\\small_arms\\machine_gun\\sub_machine_gun\\urban_panzer_grenadier_mp40_smg_mp.xml'] = 4,
	['axis\\small_arms\\machine_gun\\sub_machine_gun\\weapon_crew_&_pioneer_mp40_smg_mp.xml'] = 1,
	['axis\\small_arms\\single_fire\\rifle\\grenadier_kar_98k_rifle_mp.xml'] = 4,
	['axis\\small_arms\\single_fire\\rifle\\jaeger_g43_rifle_mp.xml'] = 4,
	['axis\\small_arms\\single_fire\\rifle\\jaeger_panzergren_g43_rifle_mp.xml'] = 4,
	['axis\\small_arms\\single_fire\\rifle\\ostruppen_kar_98k_rifle_mp.xml'] = 5,
	
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\dshk_38_sokolov_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\m3a1_scout_car_m2hb_hmg_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\m5_halftrack_m2hb_hmg_mp.xml'] = 1, -- check -- check
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\m5_halftrack_quad_50_cal_m2hb_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\heavy_machine_gun\\maxim_m1910_hmg_mp.xml'] = 1,
	['soviet\\small_arms\\machine_gun\\light_machine_gun\\guard_troop_dp-28_light_machine_gun_mp.xml'] = 2,
	--['soviet\\small_arms\\machine_gun\\light_machine_gun\\m3a1_scout_car_30cal_browning_m1919__machine_gun_mp.xml'] = 1, -- check
	--['soviet\\small_arms\\machine_gun\\light_machine_gun\\m3a1_scout_car_30cal_browning_m1919__machine_gun_rear_mp.xml'] = 1, -- check
	--['soviet\\small_arms\\machine_gun\\light_machine_gun\\partisan_dp-28_light_machine_gun_mp.xml'] = 1, -- check
	--['soviet\\small_arms\\machine_gun\\light_machine_gun\\partisan_mg42lmg_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\sub_machine_gun\\conscript_ppsh-41_sub_machine_gun_mp.xml'] = 4,
	--['soviet\\small_arms\\machine_gun\\sub_machine_gun\\partisan_ppsh-41_sub_machine_gun_mp.xml'] = 1, -- check
	['soviet\\small_arms\\machine_gun\\sub_machine_gun\\shock troops_ppsh-41_sub_machine_gun_mp.xml'] = 6,
	['soviet\\small_arms\\single_fire\\rifle\\guards_troops_mosin_nagant_rifle_mp.xml'] = 4,
	['soviet\\small_arms\\single_fire\\rifle\\mosin_nagant_rifle_combat_engineer_mp.xml'] = 4,
	['soviet\\small_arms\\single_fire\\rifle\\mosin_nagant_rifle_conscript_mp.xml'] = 6,
	--['soviet\\small_arms\\single_fire\\rifle\\partisan_kar_98k_rifle_mp.xml'] = 4, -- check
	--['soviet\\small_arms\\single_fire\\rifle\\partisan_svt_rifle_mp.xml'] = 4, -- check
	--['soviet\\small_arms\\single_fire\\rifle\\partisan_troops_mosin_nagant_rifle_mp.xml'] = 4, -- check
	['soviet\\small_arms\\single_fire\\rifle\\penal_troops_svt_rifle_mp.xml'] = 6,
	
	['west_german\\small_arms\\machine_gun\\heavy_machine_gun\\hmg_team_mg34_mp.xml'] = 1,
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\fallschirmjager_gewehr_42_mp.xml'] = 4,
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\kubelwagen_mg34_pintle_mp.xml'] = 1,
	['west_german\\small_arms\\machine_gun\\light_machine_gun\\obersoldaten_mg34_lmg_moving_no_prone_mp.xml'] = 1,
	['west_german\\small_arms\\machine_gun\\sub_machine_gun\\assault_pioneer_mp44_smg_mp.xml'] = 4,
	['west_german\\small_arms\\machine_gun\\sub_machine_gun\\waffen_mp44_infrared.xml'] = 2,
	['west_german\\small_arms\\single_fire\\rifle\\jaeger_light_recon_g43.xml'] = 4,
	['west_german\\small_arms\\single_fire\\rifle\\panzerfusilier_g43.xml'] = 6,
	['west_german\\small_arms\\single_fire\\rifle\\panzerfusilier_kar_98k_rifle_mp.xml'] = 6,
	['west_german\\small_arms\\single_fire\\rifle\\volksgrenadier_kar_98k_rifle_mp.xml'] = 5,
	['west_german\\small_arms\\single_fire\\rifle\\waffen_wlite_kar_98k_rifle_mp.xml'] = 3,
}

function each_file(xml)
	local weaponStrIndex = string.find(string.reverse(xml.path), string.reverse('\\weapon\\'), 1, true)
	if weaponStrIndex then
		if xml.instance.weapon_bag then
			if onlySmallArms then
				local smallArmsStrIndex = string.find(xml.path, '\\small_arms\\')
				if not smallArmsStrIndex then
					return
				end
			end
			local rootDir = string.sub(xml.path, 0, string.len(xml.path) - weaponStrIndex - 7)
			local printPath = string.sub(xml.path, string.len(rootDir)+2+7)
			local show = true
			local squadSize = 1
			if showWeaponsOfInterestOnly then
				if weaponsOfInterest[printPath] then
					show = true
					squadSize = weaponsOfInterest[printPath]
				else
					show = false
				end
			end
			
			if show then
				local weapon = xml.instance.weapon_bag
				
				local damage = (weapon.damage.min + weapon.damage.max)/2
				local reloadFrequency = 1+(weapon.reload.frequency.max + weapon.reload.frequency.min)/2
				local aimTime = (weapon.aim.fire_aim_time.max + weapon.aim.fire_aim_time.min)/2
				local reloadDuration = (weapon.reload.duration.max + weapon.reload.duration.min)/2
				
				local burstDuration = 0.125
				local burstROF = 8
				if weapon.burst.can_burst == true then
					burstDuration = (weapon.burst.duration.max + weapon.burst.duration.min)/2
					burstROF = (weapon.burst.rate_of_fire.max + weapon.burst.rate_of_fire.min)/2
				end
				
				function getDPS(distance, squadSize)
					if squadSize == nil then squadSize = 1 end
					if distance >= weapon.range.min and distance <= weapon.range.max then
						local cooldownMultiplier
						local reloadMultiplier
						local aimMultiplier
						local accuracy
						local burstMultiplier = 1
						local rofMultiplier = 1
						local distances = {}
						if weapon.range.distance.near < 0 then
							distances.near = (weapon.range.max - weapon.range.min)*0.25
						else
							distances.near = weapon.range.distance.near
						end
						if weapon.range.distance.mid < 0 then
							distances.mid = (weapon.range.max - weapon.range.min)*0.5
						else
							distances.mid = weapon.range.distance.mid
						end
						if weapon.range.distance.far < 0 then
							distances.far = (weapon.range.max - weapon.range.min)*0.75
						else
							distances.far = weapon.range.distance.far
						end
						if distance > distances.far then
							cooldownMultiplier = weapon.cooldown.duration_multiplier.far
							aimMultiplier = weapon.aim.aim_time_multiplier.far
							accuracy = weapon.accuracy.far
							reloadMultiplier = weapon.reload.duration_multiplier.far
							if weapon.burst.can_burst == true then
								burstMultiplier = weapon.burst.duration_multiplier.far
								rofMultiplier = weapon.burst.rate_of_fire_multiplier.far
							end
						elseif distance > distances.mid then
							local distanceMult = (distance - distances.mid)/(distances.far-distances.mid)
							cooldownMultiplier = weapon.cooldown.duration_multiplier.mid+(weapon.cooldown.duration_multiplier.far-weapon.cooldown.duration_multiplier.mid)*distanceMult
							aimMultiplier = weapon.aim.aim_time_multiplier.mid+(weapon.aim.aim_time_multiplier.far-weapon.aim.aim_time_multiplier.mid)*distanceMult
							accuracy = weapon.accuracy.mid+(weapon.accuracy.far-weapon.accuracy.mid)*distanceMult
							reloadMultiplier = weapon.reload.duration_multiplier.mid+(weapon.reload.duration_multiplier.far-weapon.reload.duration_multiplier.mid)*distanceMult
							if weapon.burst.can_burst == true then
								burstMultiplier = weapon.burst.duration_multiplier.mid+(weapon.burst.duration_multiplier.far-weapon.burst.duration_multiplier.mid)*distanceMult
								rofMultiplier = weapon.burst.rate_of_fire_multiplier.mid+(weapon.burst.rate_of_fire_multiplier.far-weapon.burst.rate_of_fire_multiplier.mid)*distanceMult
							end
						elseif distance > distances.near then
							local distanceMult = (distance - distances.near)/(distances.mid-distances.near)
							cooldownMultiplier = weapon.cooldown.duration_multiplier.near+(weapon.cooldown.duration_multiplier.mid-weapon.cooldown.duration_multiplier.near)*distanceMult
							aimMultiplier = weapon.aim.aim_time_multiplier.near+(weapon.aim.aim_time_multiplier.mid-weapon.aim.aim_time_multiplier.near)*distanceMult
							accuracy = weapon.accuracy.near+(weapon.accuracy.mid-weapon.accuracy.near)*distanceMult
							reloadMultiplier = weapon.reload.duration_multiplier.near+(weapon.reload.duration_multiplier.mid-weapon.reload.duration_multiplier.near)*distanceMult
							if weapon.burst.can_burst == true then
								burstMultiplier = weapon.burst.duration_multiplier.near+(weapon.burst.duration_multiplier.mid-weapon.burst.duration_multiplier.near)*distanceMult
								rofMultiplier = weapon.burst.rate_of_fire_multiplier.near+(weapon.burst.rate_of_fire_multiplier.mid-weapon.burst.rate_of_fire_multiplier.near)*distanceMult
							end
						else
							cooldownMultiplier = weapon.cooldown.duration_multiplier.near
							aimMultiplier = weapon.aim.aim_time_multiplier.near
							accuracy = weapon.accuracy.near
							reloadMultiplier = weapon.reload.duration_multiplier.near
							if weapon.burst.can_burst == true then
								burstMultiplier = weapon.burst.duration_multiplier.near
								rofMultiplier = weapon.burst.rate_of_fire_multiplier.near
							end
						end
						
						return
							squadSize
							* math.min(1, accuracy)
							* damage
							
							* burstDuration*burstMultiplier
							* burstROF*rofMultiplier
							* reloadFrequency
							
							/ (
								(
									math.max(0.125, aimTime*aimMultiplier) -- aim time capped at 0.125 minimum according to the .csv dps export
									+ burstDuration*burstMultiplier
									+ weapon.fire.wind_up
									+ weapon.fire.wind_down
								) * reloadFrequency
								+ (weapon.cooldown.duration.max+weapon.cooldown.duration.min)/2 * cooldownMultiplier * (reloadFrequency-1)
								+ reloadDuration*reloadMultiplier
							)
					else
						return 0
					end
				end
				
				if squadSize == 1 then
					print(string.format('# %s. [%d, %d] Ready Aim Time: [%.2f, %.2f]',
						printPath --[[xml.name]],
						weapon.range.min,
						weapon.range.max,
						weapon.aim.ready_aim_time.max,
						weapon.aim.ready_aim_time.min
					))
				else
					print(string.format('# %s. [%d, %d] (Weapons in Squad: %d) Ready Aim Time: [%.2f, %.2f]',
						printPath --[[xml.name]],
						weapon.range.min,
						weapon.range.max,
						squadSize,
						weapon.aim.ready_aim_time.max,
						weapon.aim.ready_aim_time.min
					))
				end
				
				local damageScale = ''
				for range=0,54,2 do
					damageScale = damageScale..string.format('%3d ', range)
				end
				print(damageScale)
				
				damageScale = ''
				for range=0,54,2 do
					damageScale = damageScale..string.format('%3d ', getDPS(range, 1))
				end
				print(damageScale)
				
				if squadSize ~= 1 then
					damageScale = ''
					for range=0,54,2 do
						damageScale = damageScale..string.format('%3d ', getDPS(range, squadSize))
					end
					print(damageScale)
				end
				
				function distNameDps(distName)
					local dist
					if weapon.range.distance[distName] < 0 then
						if distName == 'near' then
							dist = (weapon.range.max - weapon.range.min)*0.25
						elseif distName == 'mid' then
							dist = (weapon.range.max - weapon.range.min)*0.5
						else
							dist = (weapon.range.max - weapon.range.min)*0.75
						end
					else
						dist = weapon.range.distance[distName]
					end
					if squadSize ~= 1 then
						print(string.format('  | %s (%d)=%.2f (%.2f)', distName, weapon.range.distance[distName], getDPS(dist), getDPS(dist, squadSize)))
					else
						print(string.format('  | %s (%d)=%.2f', distName, weapon.range.distance[distName], getDPS(dist)))
					end
				end
				
				distNameDps('far')
				distNameDps('mid')
				distNameDps('near')
			end
		end
	end
end

function at_end()
end
