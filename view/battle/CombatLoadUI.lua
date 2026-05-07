local var_0_0 = class("CombatLoadUI", import("..base.BaseUI"))

var_0_0._loadObs = nil
var_0_0.LOADING_ANIMA_DISTANCE = 1820

function var_0_0.getUIName(arg_1_0)
	return "CombatLoadUI"
end

function var_0_0.init(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("loading")

	arg_2_0._loadingProgress = var_2_0:Find("loading_bar"):GetComponent(typeof(Slider))
	arg_2_0._loadingProgress.value = 0
	arg_2_0._loadingText = var_2_0:Find("loading_label/percent"):GetComponent(typeof(Text))
	arg_2_0._loadingAnima = var_2_0:Find("loading_anima")
	arg_2_0._loadingAnimaPosY = arg_2_0._loadingAnima.anchoredPosition.y
	arg_2_0._finishAnima = var_2_0:Find("done_anima")

	SetActive(arg_2_0._loadingAnima, true)
	SetActive(arg_2_0._finishAnima, false)
	arg_2_0._finishAnima:GetComponent("DftAniEvent"):SetEndEvent(function(arg_3_0)
		arg_2_0:emit(CombatLoadMediator.FINISH, arg_2_0._loadObs)
	end)

	local var_2_1 = arg_2_0._tf:Find("bg")
	local var_2_2 = arg_2_0._tf:Find("bg2")
	local var_2_3 = PlayerPrefs.GetInt("bgFitMode", 0)

	arg_2_0.bg = var_2_3 == 1 and var_2_2 or var_2_1

	SetActive(var_2_1, var_2_3 ~= 1)
	SetActive(var_2_2, var_2_3 == 1)

	local var_2_4 = var_0_0.GetRandomBGPath()

	LoadSpriteAsync(var_2_4, function(arg_4_0)
		setImageSprite(arg_2_0.bg, arg_4_0)
	end)

	arg_2_0._tipsText = var_2_0:Find("tipsText"):GetComponent(typeof(Text))
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:Preload()
end

function var_0_0.onBackPressed(arg_6_0)
	return
end

function var_0_0.Preload(arg_7_0)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_7_0._loadObs = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_7_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_7_0:Init()

	local var_7_1 = getProxy(BayProxy)

	if arg_7_0.contextData.system == SYSTEM_BOSS_RUSH_COLLABRATE then
		setImageSprite(arg_7_0.bg, LoadSprite("bg/star_level_bg_211"))
	end

	local var_7_2, var_7_3 = var_0_0.GetTotalResourceList(arg_7_0.contextData)

	for iter_7_0, iter_7_1 in ipairs(var_7_2) do
		var_7_0:AddPreloadResource(iter_7_1)
	end

	for iter_7_2, iter_7_3 in ipairs(var_7_3) do
		var_7_0:AddPreloadCV(iter_7_3)
	end

	if arg_7_0.contextData.system == SYSTEM_DEBUG and BATTLE_DEBUG_CUSTOM_WEAPON then
		for iter_7_4, iter_7_5 in pairs(ys.Battle.BattleUnitDetailView.BulletForger) do
			local var_7_4 = "触发自定义子弹替换>>>" .. iter_7_4 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_7_4)

			pg.bullet_template[iter_7_4] = iter_7_5
		end

		for iter_7_6, iter_7_7 in pairs(ys.Battle.BattleUnitDetailView.BarrageForger) do
			local var_7_5 = "触发自定义弹幕替换>>>" .. iter_7_6 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_7_5)

			pg.barrage_template[iter_7_6] = iter_7_7
		end

		for iter_7_8, iter_7_9 in pairs(ys.Battle.BattleUnitDetailView.AircraftForger) do
			local var_7_6 = "触发自定义飞机替换>>>" .. iter_7_8 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_7_6)

			pg.aircraft_template[iter_7_8] = iter_7_9
		end

		for iter_7_10, iter_7_11 in pairs(ys.Battle.BattleUnitDetailView.WeaponForger) do
			local var_7_7 = "触发自定义武器替换>>>" .. iter_7_10 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_7_7)

			pg.weapon_property[iter_7_10] = iter_7_11

			local var_7_8 = var_7_0.GetWeaponResource(iter_7_10)

			for iter_7_12, iter_7_13 in ipairs(var_7_8) do
				var_7_0:AddPreloadResource(iter_7_13)
			end
		end
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_7_9 = {}
		local var_7_10 = getProxy(FleetProxy):getFleetById(11)
		local var_7_11 = var_7_10:getTeamByName(TeamType.Submarine)

		for iter_7_14, iter_7_15 in ipairs(var_7_11) do
			table.insert(var_7_9, var_7_1:getShipById(iter_7_15))
		end

		local var_7_12, var_7_13 = var_7_0.GetPlayerShipResource(var_7_9, arg_7_0.contextData.system)

		for iter_7_16, iter_7_17 in ipairs(var_7_12) do
			var_7_0:AddPreloadResource(iter_7_17)
		end

		for iter_7_18, iter_7_19 in ipairs(var_7_13) do
			var_7_0:AddPreloadCV(iter_7_19)
		end

		var_0_0.addCommanderBuffRes(var_7_10:buildBattleBuffList())
	end

	local var_7_14, var_7_15 = var_0_0.GetTotalResourceList(arg_7_0.contextData)

	for iter_7_20, iter_7_21 in ipairs(var_7_14) do
		var_7_0:AddPreloadResource(iter_7_21)
	end

	for iter_7_22, iter_7_23 in ipairs(var_7_15) do
		var_7_0:AddPreloadCV(iter_7_23)
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_7_16 = getProxy(FleetProxy):getFleetById(11)
		local var_7_17 = var_7_16:getTeamByName(TeamType.Submarine)

		for iter_7_24, iter_7_25 in ipairs(var_7_17) do
			table.insert(loadShip, var_7_1:getShipById(iter_7_25))
		end

		var_0_0.addCommanderBuffRes(var_7_16:buildBattleBuffList())
	end

	local function var_7_18()
		SetActive(arg_7_0._loadingAnima, false)
		SetActive(arg_7_0._finishAnima, true)

		arg_7_0._finishAnima:GetComponent("Animator").enabled = true
	end

	local var_7_19 = 0

	local function var_7_20(arg_9_0)
		local var_9_0
		local var_9_1 = var_7_19 == 0 and 0 or arg_9_0 / var_7_19

		arg_7_0._loadingProgress.value = var_9_1
		arg_7_0._loadingText.text = string.format("%.2f", var_9_1 * 100) .. "%"
		arg_7_0._loadingAnima.anchoredPosition = Vector2(var_9_1 * var_0_0.LOADING_ANIMA_DISTANCE, arg_7_0._loadingAnimaPosY)
	end

	local var_7_21 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_7_21, true)

	var_7_19 = var_7_0:StartPreload(var_7_18, var_7_20)
	arg_7_0._tipsText.text = pg.server_language[math.random(#pg.server_language)].content
end

function var_0_0.GetTotalResourceList(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = {}
	local var_10_2 = {}
	local var_10_3 = ys.Battle.BattleGate.Gates[arg_10_0.system]

	if var_10_3.GetPreloadList then
		local var_10_4, var_10_5 = var_10_3.GetPreloadList(arg_10_0)

		for iter_10_0, iter_10_1 in ipairs(var_10_4) do
			table.insert(var_10_0, iter_10_1)
		end

		for iter_10_2, iter_10_3 in ipairs(var_10_5) do
			table.insert(var_10_1, iter_10_3)
		end
	elseif arg_10_0.mainFleetId then
		local var_10_6 = getProxy(FleetProxy):getFleetById(arg_10_0.mainFleetId)
		local var_10_7 = getProxy(BayProxy):getShipsByFleet(var_10_6)

		for iter_10_4, iter_10_5 in ipairs(var_10_7) do
			table.insert(var_10_2, iter_10_5)
		end
	end

	if arg_10_0.prefabFleet then
		local var_10_8 = arg_10_0.prefabFleet.main_unitList or {}
		local var_10_9 = arg_10_0.prefabFleet.vanguard_unitList or {}
		local var_10_10 = arg_10_0.prefabFleet.submarine_unitList or {}

		for iter_10_6, iter_10_7 in ipairs(var_10_8) do
			table.insert(var_10_2, var_0_0.generatePrefabShipData(iter_10_7))
		end

		for iter_10_8, iter_10_9 in ipairs(var_10_9) do
			table.insert(var_10_2, var_0_0.generatePrefabShipData(iter_10_9))
		end

		for iter_10_10, iter_10_11 in ipairs(var_10_10) do
			table.insert(var_10_2, var_0_0.generatePrefabShipData(iter_10_11))
		end
	end

	local var_10_11 = ys.Battle.BattleResourceManager.GetInstance()
	local var_10_12, var_10_13 = var_10_11.GetPlayerShipResource(var_10_2, arg_10_0.system)

	for iter_10_12, iter_10_13 in ipairs(var_10_12) do
		table.insert(var_10_0, iter_10_13)
	end

	for iter_10_14, iter_10_15 in ipairs(var_10_13) do
		table.insert(var_10_1, iter_10_15)
	end

	local var_10_14 = pg.expedition_data_template[arg_10_0.stageId].dungeon_id
	local var_10_15, var_10_16 = var_10_11.GetStageResource(var_10_14)

	for iter_10_16, iter_10_17 in ipairs(var_10_15) do
		table.insert(var_10_0, iter_10_17)
	end

	for iter_10_18, iter_10_19 in ipairs(var_10_11.GetCommonResource()) do
		table.insert(var_10_0, iter_10_19)
	end

	for iter_10_20, iter_10_21 in ipairs(var_10_11.GetBuffResource()) do
		table.insert(var_10_0, iter_10_21)
	end

	for iter_10_22, iter_10_23 in ipairs(var_10_16) do
		table.insert(var_10_1, iter_10_23)
	end

	local var_10_17 = pg.expedition_data_template[arg_10_0.stageId]

	if arg_10_0.system == SYSTEM_WORLD and var_10_17.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
		local var_10_18 = nowWorld():GetActiveMap()

		for iter_10_24, iter_10_25 in ipairs(var_10_11.GetMapResource(var_10_18.config.expedition_map_id)) do
			table.insert(var_10_0, iter_10_25)
		end
	else
		for iter_10_26, iter_10_27 in ipairs(var_10_17.map_id) do
			for iter_10_28, iter_10_29 in ipairs(var_10_11.GetMapResource(iter_10_27[1])) do
				table.insert(var_10_0, iter_10_29)
			end
		end
	end

	if pg.battle_cost_template[arg_10_0.system].global_buff_effected > 0 then
		local var_10_19 = BuffHelper.GetBattleBuffs()
		local var_10_20 = _.map(var_10_19, function(arg_11_0)
			return arg_11_0:getConfig("benefit_effect")
		end)

		for iter_10_30, iter_10_31 in ipairs(var_10_20) do
			iter_10_31 = tonumber(iter_10_31)

			local var_10_21 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_10_31, 1, {})

			for iter_10_32, iter_10_33 in ipairs(var_10_21) do
				table.insert(var_10_0, iter_10_33)
			end
		end
	end

	local var_10_22 = var_10_11.GetStageBGM(var_10_14)

	return var_10_0, var_10_1, var_10_22
end

function var_0_0.generatePrefabShipData(arg_12_0)
	local var_12_0 = {
		configId = arg_12_0.configId,
		equipments = {},
		skinId = arg_12_0.skinId,
		buffs = arg_12_0.skills
	}
	local var_12_1 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(arg_12_0.configId)
	local var_12_2 = math.max(#arg_12_0.equipment, #var_12_1.default_equip_list)

	for iter_12_0 = 1, var_12_2 do
		var_12_0.equipments[iter_12_0] = arg_12_0.equipment[iter_12_0] and {
			configId = arg_12_0.equipment[iter_12_0]
		} or false
	end

	function var_12_0.getActiveEquipments(arg_13_0)
		return arg_13_0.equipments
	end

	return var_12_0
end

function var_0_0.addCommanderBuffRes(arg_14_0)
	local var_14_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_14_0, iter_14_1 in ipairs(arg_14_0) do
		local var_14_1 = var_14_0.GetCommanderResource(iter_14_1)

		for iter_14_2, iter_14_3 in ipairs(var_14_1) do
			var_14_0:AddPreloadResource(iter_14_3)
		end
	end
end

function var_0_0.GetExistBGList()
	local var_15_0 = LOADING_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOADING_HX_LV.key_value and "loadingbg_hx/bg_" or "loadingbg/bg_"
	local var_15_1 = {}

	for iter_15_0 = 1, BG_RANDOM_RANGE do
		local var_15_2 = var_15_0 .. iter_15_0

		if checkABExist(var_15_2) then
			table.insert(var_15_1, var_15_2)
		end
	end

	return var_15_1
end

function var_0_0.GetRandomBGPath()
	local var_16_0 = var_0_0.GetExistBGList()

	return var_16_0[math.random(1, #var_16_0)]
end

function var_0_0.EnsureBaseBGList()
	local var_17_0 = {}

	if #var_0_0.GetExistBGList() <= 0 then
		table.insert(var_17_0, "loadingbg_hx/bg_1")
		table.insert(var_17_0, "loadingbg/bg_1")
	end

	return var_17_0
end

return var_0_0
