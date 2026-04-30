ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleFormulas

var_0_0.Battle.BattleDataFunction = var_0_0.Battle.BattleDataFunction or {}

local var_0_3 = var_0_0.Battle.BattleDataFunction
local var_0_4 = pg.puzzle_card_template
local var_0_5 = pg.puzzle_ship_template
local var_0_6 = pg.puzzle_combat_template
local var_0_7 = pg.puzzle_card_affix

function var_0_3.GetDungeonTmpDataByID(arg_1_0)
	return require("GameCfg.dungeon." .. arg_1_0)
end

function var_0_3.ClearDungeonCfg(arg_2_0)
	package.loaded["GameCfg.dungeon." .. arg_2_0] = nil
end

function var_0_3.GetSkillTemplate(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or 1

	local var_3_0 = "skill_" .. arg_3_0
	local var_3_1 = pg.ConvertedSkill[var_3_0]
	local var_3_2 = var_3_1[arg_3_1] or var_3_1[0]

	var_3_2.name = getSkillName(arg_3_0)

	return var_3_2
end

function var_0_3.ConvertSkillTemplate()
	pg.ConvertedSkill = {}

	setmetatable(pg.ConvertedSkill, {
		__index = function(arg_5_0, arg_5_1)
			local var_5_0 = arg_5_1
			local var_5_1 = pg.skillCfg[arg_5_1]

			if var_5_1 then
				local var_5_2 = {}
				local var_5_3 = {}

				for iter_5_0, iter_5_1 in pairs(var_5_1) do
					var_5_3[iter_5_0] = Clone(iter_5_1)
				end

				var_5_2[0] = var_5_3

				for iter_5_2, iter_5_3 in ipairs(var_5_1) do
					local var_5_4 = Clone(var_5_3)

					for iter_5_4, iter_5_5 in pairs(iter_5_3) do
						var_5_4[iter_5_4] = iter_5_5
					end

					var_5_2[iter_5_2] = var_5_4
				end

				pg.ConvertedSkill[var_5_0] = var_5_2

				return var_5_2
			end
		end
	})
end

function var_0_3.GetBuffTemplate(arg_6_0, arg_6_1)
	arg_6_1 = arg_6_1 or 1

	local var_6_0 = "buff_" .. arg_6_0
	local var_6_1 = pg.ConvertedBuff[var_6_0]

	return var_6_1[arg_6_1] or var_6_1[0]
end

function var_0_3.ConvertBuffTemplate()
	pg.ConvertedBuff = {}

	setmetatable(pg.ConvertedBuff, {
		__index = function(arg_8_0, arg_8_1)
			local var_8_0 = arg_8_1
			local var_8_1 = pg.buffCfg[arg_8_1]

			if var_8_1 then
				local var_8_2 = {}
				local var_8_3 = {}

				for iter_8_0, iter_8_1 in pairs(var_8_1) do
					var_8_3[iter_8_0] = Clone(iter_8_1)
				end

				var_8_2[0] = var_8_3

				for iter_8_2, iter_8_3 in ipairs(var_8_1) do
					local var_8_4 = Clone(var_8_3)

					for iter_8_4, iter_8_5 in pairs(iter_8_3) do
						var_8_4[iter_8_4] = iter_8_5
					end

					var_8_2[iter_8_2] = var_8_4
				end

				pg.ConvertedBuff[var_8_0] = var_8_2

				return var_8_2
			end
		end
	})
end

function var_0_3.GetBuffBulletRes(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = {}
	local var_9_1 = {}

	arg_9_1 = arg_9_1 or {}

	local var_9_2 = var_0_3.GetPlayerShipModelFromID(arg_9_0)

	local function var_9_3(arg_10_0)
		if not arg_9_4 then
			return arg_10_0
		end

		if table.contains(var_9_2.hide_buff_list, arg_10_0) then
			return arg_9_4:RemapHiddenSkillId(arg_10_0)
		end

		local var_10_0 = arg_9_4:RemapHiddenSkillId(arg_10_0)

		if var_10_0 == arg_10_0 then
			var_10_0 = arg_9_4:RemapSkillId(arg_10_0)
		end

		return var_10_0
	end

	local function var_9_4(arg_11_0)
		for iter_11_0, iter_11_1 in ipairs(arg_11_0) do
			local var_11_0

			if arg_9_1[iter_11_1] then
				var_11_0 = arg_9_1[iter_11_1].level
			else
				var_11_0 = 1
			end

			iter_11_1 = var_9_3(iter_11_1)

			local var_11_1 = var_0_3.SkillTranform(arg_9_2, iter_11_1)
			local var_11_2 = var_0_3.GetResFromBuff(var_11_1, var_11_0, var_9_1, arg_9_3)

			for iter_11_2, iter_11_3 in ipairs(var_11_2) do
				var_9_0[#var_9_0 + 1] = iter_11_3
			end
		end
	end

	var_9_4(var_9_2.buff_list)
	var_9_4(var_9_2.hide_buff_list)

	local var_9_5 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_1) do
		table.insert(var_9_5, iter_9_0)
	end

	var_9_4(var_9_5)

	local var_9_6 = var_9_2.airassist_time

	for iter_9_2, iter_9_3 in ipairs(var_9_6) do
		local var_9_7 = var_0_3.GetResFromSkill(iter_9_3, 1, nil, arg_9_3)

		for iter_9_4, iter_9_5 in ipairs(var_9_7) do
			var_9_0[#var_9_0 + 1] = iter_9_5
		end
	end

	local var_9_8 = var_0_3.GetShipTransformDataTemplate(arg_9_0)

	if var_9_8 and var_9_8.skill_id ~= 0 and pg.transform_data_template[var_9_8.skill_id].skill_id ~= 0 then
		local var_9_9 = pg.transform_data_template[var_9_8.skill_id].skill_id
		local var_9_10

		if arg_9_1[var_9_9] then
			var_9_10 = arg_9_1[var_9_9].level
		else
			var_9_10 = 1
		end

		local var_9_11 = var_0_3.GetResFromBuff(var_9_9, var_9_10, var_9_1, arg_9_3)

		for iter_9_6, iter_9_7 in ipairs(var_9_11) do
			var_9_0[#var_9_0 + 1] = iter_9_7
		end
	end

	if var_0_3.GetShipMetaFromDataTemplate(arg_9_0) then
		var_9_4(var_9_2.buff_list_display)
	end

	return var_9_0
end

function var_0_3.getWeaponResource(arg_12_0, arg_12_1)
	local var_12_0 = var_0_0.Battle.BattleResourceManager.GetWeaponResource(arg_12_0)

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		arg_12_1[#arg_12_1 + 1] = iter_12_1
	end
end

function var_0_3.GetResFromBuff(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = {}
	local var_13_1 = arg_13_0 .. "_" .. arg_13_1

	if arg_13_2[var_13_1] then
		return var_13_0
	else
		arg_13_2[var_13_1] = true
	end

	local var_13_2 = var_0_3.GetBuffTemplate(arg_13_0, arg_13_1)

	if var_13_2.init_effect and var_13_2.init_effect ~= "" then
		local var_13_3 = var_13_2.init_effect

		if var_13_2.skin_adapt then
			var_13_3 = var_0_3.SkinAdaptFXID(var_13_3, arg_13_3)
		end

		var_13_0[#var_13_0 + 1] = var_0_0.Battle.BattleResourceManager.GetFXPath(var_13_3)
	end

	if var_13_2.last_effect and var_13_2.last_effect ~= "" then
		local var_13_4 = type(var_13_2.last_effect) == "table" and var_13_2.last_effect or {
			var_13_2.last_effect
		}

		for iter_13_0, iter_13_1 in ipairs(var_13_4) do
			var_13_0[#var_13_0 + 1] = var_0_0.Battle.BattleResourceManager.GetFXPath(iter_13_1)
		end
	end

	if var_13_2.last_effect_stack_list then
		for iter_13_2, iter_13_3 in pairs(var_13_2.last_effect_stack_list) do
			var_13_0[#var_13_0 + 1] = var_0_0.Battle.BattleResourceManager.GetFXPath(iter_13_3)
		end
	end

	for iter_13_4, iter_13_5 in ipairs(var_13_2.effect_list) do
		local var_13_5 = iter_13_5.arg_list.skill_id

		if var_13_5 ~= nil then
			local var_13_6 = var_0_3.GetResFromSkill(var_13_5, arg_13_1, arg_13_2, arg_13_3)

			for iter_13_6, iter_13_7 in ipairs(var_13_6) do
				var_13_0[#var_13_0 + 1] = iter_13_7
			end
		end

		local var_13_7 = iter_13_5.arg_list.skill_id_list

		if var_13_7 ~= nil then
			for iter_13_8, iter_13_9 in ipairs(var_13_7) do
				local var_13_8 = var_0_3.GetResFromSkill(iter_13_9, arg_13_1, arg_13_2, arg_13_3)

				for iter_13_10, iter_13_11 in ipairs(var_13_8) do
					var_13_0[#var_13_0 + 1] = iter_13_11
				end
			end
		end

		local var_13_9 = iter_13_5.arg_list.damage_attr_list

		if var_13_9 ~= nil then
			for iter_13_12, iter_13_13 in pairs(var_13_9) do
				local var_13_10 = var_0_3.GetResFromSkill(iter_13_13, arg_13_1, arg_13_2, arg_13_3)

				for iter_13_14, iter_13_15 in ipairs(var_13_10) do
					var_13_0[#var_13_0 + 1] = iter_13_15
				end
			end
		end

		local var_13_11 = iter_13_5.arg_list.bullet_id

		if var_13_11 then
			local var_13_12 = var_0_0.Battle.BattleResourceManager.GetBulletResource(var_13_11)

			for iter_13_16, iter_13_17 in ipairs(var_13_12) do
				var_13_0[#var_13_0 + 1] = iter_13_17
			end
		end

		local var_13_13 = iter_13_5.arg_list.weapon_id

		if var_13_13 then
			var_0_3.getWeaponResource(var_13_13, var_13_0)
		end

		local var_13_14 = iter_13_5.arg_list.aircraft_id_list

		if var_13_14 then
			for iter_13_18, iter_13_19 in ipairs(var_13_14) do
				var_0_3.getWeaponResource(iter_13_19, var_13_0)
			end
		end

		local var_13_15 = iter_13_5.arg_list.skin_id

		if var_13_15 then
			local var_13_16 = var_0_0.Battle.BattleResourceManager.GetEquipSkinBulletRes(var_13_15)

			for iter_13_20, iter_13_21 in ipairs(var_13_16) do
				var_13_0[#var_13_0 + 1] = iter_13_21
			end
		end

		local var_13_17 = iter_13_5.arg_list.ship_skin_id

		if var_13_17 then
			local var_13_18 = var_0_3.GetPlayerShipSkinDataFromID(var_13_17)

			var_13_0[#var_13_0 + 1] = var_0_0.Battle.BattleResourceManager.GetCharacterPath(var_13_18.prefab)
		end

		local var_13_19 = iter_13_5.arg_list.buff_id

		if var_13_19 then
			local var_13_20 = var_0_3.GetResFromBuff(var_13_19, arg_13_1, arg_13_2, arg_13_3)

			for iter_13_22, iter_13_23 in ipairs(var_13_20) do
				if type(iter_13_23) == "string" then
					var_13_0[#var_13_0 + 1] = iter_13_23
				elseif type(iter_13_23) == "table" then
					for iter_13_24, iter_13_25 in ipairs(iter_13_23) do
						var_13_0[#var_13_0 + 1] = iter_13_25
					end
				end
			end
		end

		local var_13_21 = iter_13_5.arg_list.buff_skin_id

		if var_13_21 then
			local var_13_22 = var_0_3.GetResFromBuff(var_13_21, arg_13_1, arg_13_2, arg_13_3)

			for iter_13_26, iter_13_27 in ipairs(var_13_22) do
				if type(iter_13_27) == "string" then
					var_13_0[#var_13_0 + 1] = iter_13_27
				elseif type(iter_13_27) == "table" then
					for iter_13_28, iter_13_29 in ipairs(iter_13_27) do
						var_13_0[#var_13_0 + 1] = iter_13_29
					end
				end
			end
		end

		local var_13_23 = iter_13_5.arg_list.effect

		if var_13_23 then
			var_13_0[#var_13_0 + 1] = var_0_0.Battle.BattleResourceManager.GetFXPath(var_13_23)
		end
	end

	return var_13_0
end

function var_0_3.GetBuffListRes(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = {}
	local var_14_1 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0) do
		local var_14_2 = iter_14_1.id
		local var_14_3 = iter_14_1.level

		for iter_14_2, iter_14_3 in ipairs(var_0_3.GetResFromBuff(var_14_2, var_14_3, var_14_1, arg_14_2)) do
			var_14_0[#var_14_0 + 1] = iter_14_3
		end
	end

	return var_14_0
end

function var_0_3.GetResFromSkill(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	arg_15_1 = arg_15_1 or 1

	local var_15_0 = {}
	local var_15_1 = var_0_3.GetSkillTemplate(arg_15_0, arg_15_1)

	local function var_15_2(arg_16_0)
		for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
			if iter_16_1.type == "BattleBuffShieldWall" then
				print(iter_16_1.arg_list.effect)
			end

			if iter_16_1.type == var_0_0.Battle.BattleSkillGridmanFloat.__name then
				table.insert(var_15_0, "UI/combatgridmanskillfloat")
			end

			if iter_16_1.type == var_0_0.Battle.BattleSkillFusion.__name then
				local var_16_0 = iter_16_1.arg_list
				local var_16_1 = var_0_0.Battle.BattleResourceManager.GetShipResource(var_16_0.fusion_id, var_16_0.ship_skin_id)

				for iter_16_2, iter_16_3 in ipairs(var_16_1) do
					table.insert(var_15_0, iter_16_3)
				end

				local var_16_2 = var_16_0.weapon_id_list

				for iter_16_4, iter_16_5 in ipairs(var_16_2) do
					var_0_3.getWeaponResource(iter_16_5, var_15_0)
				end

				local var_16_3 = var_16_0.buff_list

				for iter_16_6, iter_16_7 in ipairs(var_16_3) do
					local var_16_4 = var_0_3.GetResFromBuff(iter_16_7, arg_15_1, arg_15_2)

					for iter_16_8, iter_16_9 in ipairs(var_16_4) do
						var_15_0[#var_15_0 + 1] = iter_16_9
					end
				end
			end

			local var_16_5 = iter_16_1.arg_list.weapon_id

			if var_16_5 ~= nil then
				var_0_3.getWeaponResource(var_16_5, var_15_0)
			end

			local var_16_6 = iter_16_1.arg_list.buff_id

			if var_16_6 then
				local var_16_7 = var_0_3.GetResFromBuff(var_16_6, arg_15_1, arg_15_2)

				for iter_16_10, iter_16_11 in ipairs(var_16_7) do
					var_15_0[#var_15_0 + 1] = iter_16_11
				end
			end

			local var_16_8 = iter_16_1.arg_list.damage_buff_id

			if var_16_8 then
				local var_16_9 = iter_16_1.arg_list.damage_buff_lv or 1
				local var_16_10 = var_0_3.GetResFromBuff(var_16_8, var_16_9, arg_15_2)

				for iter_16_12, iter_16_13 in ipairs(var_16_10) do
					var_15_0[#var_15_0 + 1] = iter_16_13
				end
			end

			local var_16_11 = iter_16_1.arg_list.effect

			if var_16_11 then
				var_15_0[#var_15_0 + 1] = var_0_0.Battle.BattleResourceManager.GetFXPath(var_16_11)
			end

			local var_16_12 = iter_16_1.arg_list.finale_effect

			if var_16_12 then
				var_15_0[#var_15_0 + 1] = var_0_0.Battle.BattleResourceManager.GetFXPath(var_16_12)
			end

			local var_16_13 = iter_16_1.arg_list.spawnData

			if var_16_13 then
				local var_16_14 = var_0_0.Battle.BattleResourceManager.GetMonsterRes(var_16_13)

				for iter_16_14, iter_16_15 in ipairs(var_16_14) do
					var_15_0[#var_15_0 + 1] = iter_16_15
				end
			end
		end
	end

	if type(var_15_1.painting) == "string" then
		var_15_0[#var_15_0 + 1] = var_0_0.Battle.BattleResourceManager.GetHrzIcon(var_15_1.painting)
		var_15_0[#var_15_0 + 1] = var_0_0.Battle.BattleResourceManager.GetSquareIcon(var_15_1.painting)
	end

	if type(var_15_1.castCV) == "table" then
		var_0_0.Battle.BattleResourceManager.GetInstance():AddPreloadCV(var_15_1.castCV.skinID)
	end

	if var_15_1.focus_duration then
		if var_15_1.cutin_cover then
			var_15_0[#var_15_0 + 1] = var_0_0.Battle.BattleResourceManager.GetInstance().GetPaintingPath(var_15_1.cutin_cover)
		elseif var_15_1.cutin_cover_DAL then
			var_15_0[#var_15_0 + 1] = var_0_0.Battle.BattleResourceManager.GetInstance().GetPaintingPath(var_15_1.cutin_cover_DAL)
			var_15_0[#var_15_0 + 1] = "UI/SkillPaintingDAL"
		elseif arg_15_3 then
			local var_15_3 = var_0_3.GetPlayerShipSkinDataFromID(arg_15_3).painting

			var_15_0[#var_15_0 + 1] = var_0_0.Battle.BattleResourceManager.GetInstance().GetPaintingPath(var_15_3)
		end
	end

	var_15_2(var_15_1.effect_list)

	for iter_15_0, iter_15_1 in ipairs(var_15_1) do
		var_15_2(iter_15_1.effect_list)
	end

	return var_15_0
end

function var_0_3.GetShipSkillTriggerCount(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0)
		local var_18_0 = 0

		for iter_18_0, iter_18_1 in pairs(arg_18_0) do
			local var_18_1 = var_0_3.GetBuffTemplate(iter_18_1.id).effect_list

			for iter_18_2, iter_18_3 in ipairs(var_18_1) do
				local var_18_2 = iter_18_3.trigger

				for iter_18_4, iter_18_5 in ipairs(var_18_2) do
					if table.contains(arg_17_1, iter_18_5) then
						var_18_0 = var_18_0 + 1
					end
				end
			end
		end

		return var_18_0
	end

	local var_17_1 = 0
	local var_17_2 = arg_17_0.skills or {}
	local var_17_3 = var_17_1 + var_17_0(var_17_2)
	local var_17_4 = var_0_3.GetEquipSkill(arg_17_0.equipment)
	local var_17_5 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_4) do
		table.insert(var_17_5, {
			id = iter_17_1.buffID
		})
	end

	return var_17_3 + var_17_0(var_17_5)
end

function var_0_3.GetSongList(arg_19_0)
	local var_19_0 = {
		initList = {},
		otherList = {}
	}

	for iter_19_0, iter_19_1 in pairs(arg_19_0) do
		local var_19_1 = var_0_3.GetBuffTemplate(iter_19_0, 1)

		for iter_19_2, iter_19_3 in ipairs(var_19_1.effect_list) do
			if iter_19_3.type == var_0_0.Battle.BattleBuffDiva.__name then
				if table.contains(iter_19_3.trigger, "onInitGame") then
					for iter_19_4, iter_19_5 in ipairs(iter_19_3.arg_list.bgm_list) do
						var_19_0.initList[iter_19_5] = true
					end
				end

				if not table.contains(iter_19_3.trigger, "onInitGame") or #iter_19_3.trigger > 1 then
					for iter_19_6, iter_19_7 in ipairs(iter_19_3.arg_list.bgm_list) do
						var_19_0.otherList[iter_19_7] = true
					end
				end
			end
		end
	end

	return var_19_0
end

function var_0_3.GetCardRes(arg_20_0)
	local var_20_0 = {}
	local var_20_1 = var_0_0.Battle.BattleCardPuzzleCard.GetCardEffectConfig(arg_20_0)

	for iter_20_0, iter_20_1 in ipairs(var_20_1.effect_list) do
		local var_20_2 = var_0_3.GetCardFXRes(iter_20_1)

		for iter_20_2, iter_20_3 in ipairs(var_20_2) do
			table.insert(var_20_0, iter_20_3)
		end
	end

	for iter_20_4, iter_20_5 in pairs(var_20_1.effect_list) do
		local var_20_3 = var_0_3.GetCardFXRes(iter_20_5)

		for iter_20_6, iter_20_7 in ipairs(var_20_3) do
			table.insert(var_20_0, iter_20_7)
		end
	end

	return var_20_0
end

function var_0_3.GetCardFXRes(arg_21_0)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_0) do
		if iter_21_1.type == "BattleCardPuzzleSkillCreateCard" then
			local var_21_1 = var_0_3.GetCardRes(iter_21_1.arg_list.card_id)

			for iter_21_2, iter_21_3 in ipairs(var_21_1) do
				table.insert(var_21_0, iter_21_3)
			end
		elseif iter_21_1.type == "BattleCardPuzzleSkillFire" then
			local var_21_2 = var_0_0.Battle.BattleResourceManager.GetWeaponResource(iter_21_1.arg_list.weapon_id)

			for iter_21_4, iter_21_5 in ipairs(var_21_2) do
				table.insert(var_21_0, iter_21_5)
			end
		elseif iter_21_1.type == "BattleCardPuzzleSkillAddBuff" then
			local var_21_3 = var_0_3.GetResFromBuff(iter_21_1.arg_list.buff_id, 1, {})

			for iter_21_6, iter_21_7 in ipairs(var_21_3) do
				table.insert(var_21_0, iter_21_7)
			end
		end
	end

	return var_21_0
end

function var_0_3.NeedSkillPainting(arg_22_0)
	local var_22_0 = false

	if var_0_3.GetSkillTemplate(arg_22_0).focus_duration then
		var_22_0 = true
	end

	return var_22_0
end

function var_0_3.SkinAdaptFXID(arg_23_0, arg_23_1)
	return arg_23_0 .. "_" .. arg_23_1
end

function var_0_3.GetFleetReload(arg_24_0)
	return var_0_2.GetFleetReload(arg_24_0)
end

function var_0_3.GetFleetTorpedoPower(arg_25_0)
	return var_0_2.GetFleetTorpedoPower(arg_25_0)
end

function var_0_3.SortFleetList(arg_26_0, arg_26_1)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_0) do
		var_26_0[#var_26_0 + 1] = arg_26_1[iter_26_1]

		var_26_0[iter_26_0]:SetFormationIndex(iter_26_0)
	end

	return var_26_0
end

function var_0_3.GetLimitAttributeRange(arg_27_0, arg_27_1)
	if pg.battle_attribute_range[arg_27_0] then
		return math.clamp(arg_27_1, pg.battle_attribute_range[arg_27_0].min / 10000, pg.battle_attribute_range[arg_27_0].max / 10000)
	end

	return arg_27_1
end

function var_0_3.GetPuzzleCardDataTemplate(arg_28_0)
	assert(var_0_4[arg_28_0] ~= nil, ">>puzzle_card_template<< 找不到卡牌配置：" .. arg_28_0)

	return var_0_4[arg_28_0]
end

function var_0_3.GetPuzzleShipDataTemplate(arg_29_0)
	assert(var_0_5[arg_29_0] ~= nil, ">>puzzle_ship_template<< 找不到卡牌舰船配置：" .. arg_29_0)

	return var_0_5[arg_29_0]
end

function var_0_3.GetPuzzleDungeonTemplate(arg_30_0)
	assert(var_0_6[arg_30_0] ~= nil, ">>puzzle_combat_template<< 找不到卡牌关卡配置：" .. arg_30_0)

	return var_0_6[arg_30_0]
end

function var_0_3.GetPuzzleCardAffixDataTemplate(arg_31_0)
	assert(var_0_7[arg_31_0] ~= nil, ">>puzzle_card_affix<< 找不到卡牌关卡配置：" .. arg_31_0)

	return var_0_7[arg_31_0]
end
