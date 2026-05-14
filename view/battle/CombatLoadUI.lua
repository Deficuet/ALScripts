local var_0_0 = class("CombatLoadUI", import("..base.BaseUI"))

var_0_0._loadObs = nil
var_0_0.LOADING_ANIMA_DISTANCE = 1820

function var_0_0.getUIName(arg_1_0)
	return "CombatLoadUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	arg_2_0._preloadBGSprite = nil

	local var_2_0 = arg_2_0.contextData.system == SYSTEM_BOSS_RUSH_COLLABRATE and "bg/star_level_bg_211" or var_0_0.GetRandomBGPath()

	if var_2_0 then
		LoadSpriteAsync(var_2_0, function(arg_3_0)
			arg_2_0._preloadBGSprite = arg_3_0

			arg_2_1()
		end)
	else
		arg_2_1()
	end
end

function var_0_0.init(arg_4_0)
	local var_4_0 = arg_4_0._tf:Find("loading")

	arg_4_0._loadingProgress = var_4_0:Find("loading_bar"):GetComponent(typeof(Slider))
	arg_4_0._loadingProgress.value = 0
	arg_4_0._loadingText = var_4_0:Find("loading_label/percent"):GetComponent(typeof(Text))
	arg_4_0._loadingAnima = var_4_0:Find("loading_anima")
	arg_4_0._loadingAnimaPosY = arg_4_0._loadingAnima.anchoredPosition.y
	arg_4_0._finishAnima = var_4_0:Find("done_anima")

	SetActive(arg_4_0._loadingAnima, true)
	SetActive(arg_4_0._finishAnima, false)
	arg_4_0._finishAnima:GetComponent("DftAniEvent"):SetEndEvent(function(arg_5_0)
		arg_4_0:emit(CombatLoadMediator.FINISH, arg_4_0._loadObs)
	end)

	local var_4_1 = arg_4_0._tf:Find("bg")
	local var_4_2 = arg_4_0._tf:Find("bg2")
	local var_4_3 = PlayerPrefs.GetInt("bgFitMode", 0)

	arg_4_0.bg = var_4_3 == 1 and var_4_2 or var_4_1

	SetActive(var_4_1, var_4_3 ~= 1)
	SetActive(var_4_2, var_4_3 == 1)

	if arg_4_0._preloadBGSprite then
		setImageSprite(arg_4_0.bg, arg_4_0._preloadBGSprite)
	end

	arg_4_0._tipsText = var_4_0:Find("tipsText"):GetComponent(typeof(Text))
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:Preload()
end

function var_0_0.onBackPressed(arg_7_0)
	return
end

function var_0_0.Preload(arg_8_0)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_8_0._loadObs = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_8_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_8_0:Init()

	local var_8_1 = getProxy(BayProxy)
	local var_8_2, var_8_3 = var_0_0.GetTotalResourceList(arg_8_0.contextData)

	for iter_8_0, iter_8_1 in ipairs(var_8_2) do
		var_8_0:AddPreloadResource(iter_8_1)
	end

	for iter_8_2, iter_8_3 in ipairs(var_8_3) do
		var_8_0:AddPreloadCV(iter_8_3)
	end

	if arg_8_0.contextData.system == SYSTEM_DEBUG and BATTLE_DEBUG_CUSTOM_WEAPON then
		for iter_8_4, iter_8_5 in pairs(ys.Battle.BattleUnitDetailView.BulletForger) do
			local var_8_4 = "触发自定义子弹替换>>>" .. iter_8_4 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_8_4)

			pg.bullet_template[iter_8_4] = iter_8_5
		end

		for iter_8_6, iter_8_7 in pairs(ys.Battle.BattleUnitDetailView.BarrageForger) do
			local var_8_5 = "触发自定义弹幕替换>>>" .. iter_8_6 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_8_5)

			pg.barrage_template[iter_8_6] = iter_8_7
		end

		for iter_8_8, iter_8_9 in pairs(ys.Battle.BattleUnitDetailView.AircraftForger) do
			local var_8_6 = "触发自定义飞机替换>>>" .. iter_8_8 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_8_6)

			pg.aircraft_template[iter_8_8] = iter_8_9
		end

		for iter_8_10, iter_8_11 in pairs(ys.Battle.BattleUnitDetailView.WeaponForger) do
			local var_8_7 = "触发自定义武器替换>>>" .. iter_8_10 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_8_7)

			pg.weapon_property[iter_8_10] = iter_8_11

			local var_8_8 = var_8_0.GetWeaponResource(iter_8_10)

			for iter_8_12, iter_8_13 in ipairs(var_8_8) do
				var_8_0:AddPreloadResource(iter_8_13)
			end
		end
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_8_9 = {}
		local var_8_10 = getProxy(FleetProxy):getFleetById(11)
		local var_8_11 = var_8_10:getTeamByName(TeamType.Submarine)

		for iter_8_14, iter_8_15 in ipairs(var_8_11) do
			table.insert(var_8_9, var_8_1:getShipById(iter_8_15))
		end

		local var_8_12, var_8_13 = var_8_0.GetPlayerShipResource(var_8_9, arg_8_0.contextData.system)

		for iter_8_16, iter_8_17 in ipairs(var_8_12) do
			var_8_0:AddPreloadResource(iter_8_17)
		end

		for iter_8_18, iter_8_19 in ipairs(var_8_13) do
			var_8_0:AddPreloadCV(iter_8_19)
		end

		var_0_0.addCommanderBuffRes(var_8_10:buildBattleBuffList())
	end

	local var_8_14, var_8_15 = var_0_0.GetTotalResourceList(arg_8_0.contextData)

	for iter_8_20, iter_8_21 in ipairs(var_8_14) do
		var_8_0:AddPreloadResource(iter_8_21)
	end

	for iter_8_22, iter_8_23 in ipairs(var_8_15) do
		var_8_0:AddPreloadCV(iter_8_23)
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_8_16 = getProxy(FleetProxy):getFleetById(11)
		local var_8_17 = var_8_16:getTeamByName(TeamType.Submarine)

		for iter_8_24, iter_8_25 in ipairs(var_8_17) do
			table.insert(loadShip, var_8_1:getShipById(iter_8_25))
		end

		var_0_0.addCommanderBuffRes(var_8_16:buildBattleBuffList())
	end

	local function var_8_18()
		SetActive(arg_8_0._loadingAnima, false)
		SetActive(arg_8_0._finishAnima, true)

		arg_8_0._finishAnima:GetComponent("Animator").enabled = true
	end

	local var_8_19 = 0

	local function var_8_20(arg_10_0)
		local var_10_0
		local var_10_1 = var_8_19 == 0 and 0 or arg_10_0 / var_8_19

		arg_8_0._loadingProgress.value = var_10_1
		arg_8_0._loadingText.text = string.format("%.2f", var_10_1 * 100) .. "%"
		arg_8_0._loadingAnima.anchoredPosition = Vector2(var_10_1 * var_0_0.LOADING_ANIMA_DISTANCE, arg_8_0._loadingAnimaPosY)
	end

	local var_8_21 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_8_21, true)

	var_8_19 = var_8_0:StartPreload(var_8_18, var_8_20)
	arg_8_0._tipsText.text = pg.server_language[math.random(#pg.server_language)].content
end

function var_0_0.GetTotalResourceList(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = {}
	local var_11_2 = {}
	local var_11_3 = ys.Battle.BattleGate.Gates[arg_11_0.system]

	if var_11_3.GetPreloadList then
		local var_11_4, var_11_5 = var_11_3.GetPreloadList(arg_11_0)

		for iter_11_0, iter_11_1 in ipairs(var_11_4) do
			table.insert(var_11_0, iter_11_1)
		end

		for iter_11_2, iter_11_3 in ipairs(var_11_5) do
			table.insert(var_11_1, iter_11_3)
		end
	elseif arg_11_0.mainFleetId then
		local var_11_6 = getProxy(FleetProxy):getFleetById(arg_11_0.mainFleetId)
		local var_11_7 = getProxy(BayProxy):getShipsByFleet(var_11_6)

		for iter_11_4, iter_11_5 in ipairs(var_11_7) do
			table.insert(var_11_2, iter_11_5)
		end
	end

	if arg_11_0.prefabFleet then
		local var_11_8 = arg_11_0.prefabFleet.main_unitList or {}
		local var_11_9 = arg_11_0.prefabFleet.vanguard_unitList or {}
		local var_11_10 = arg_11_0.prefabFleet.submarine_unitList or {}

		for iter_11_6, iter_11_7 in ipairs(var_11_8) do
			table.insert(var_11_2, var_0_0.generatePrefabShipData(iter_11_7))
		end

		for iter_11_8, iter_11_9 in ipairs(var_11_9) do
			table.insert(var_11_2, var_0_0.generatePrefabShipData(iter_11_9))
		end

		for iter_11_10, iter_11_11 in ipairs(var_11_10) do
			table.insert(var_11_2, var_0_0.generatePrefabShipData(iter_11_11))
		end
	end

	local var_11_11 = ys.Battle.BattleResourceManager.GetInstance()
	local var_11_12, var_11_13 = var_11_11.GetPlayerShipResource(var_11_2, arg_11_0.system)

	for iter_11_12, iter_11_13 in ipairs(var_11_12) do
		table.insert(var_11_0, iter_11_13)
	end

	for iter_11_14, iter_11_15 in ipairs(var_11_13) do
		table.insert(var_11_1, iter_11_15)
	end

	local var_11_14 = pg.expedition_data_template[arg_11_0.stageId].dungeon_id
	local var_11_15, var_11_16 = var_11_11.GetStageResource(var_11_14)

	for iter_11_16, iter_11_17 in ipairs(var_11_15) do
		table.insert(var_11_0, iter_11_17)
	end

	for iter_11_18, iter_11_19 in ipairs(var_11_11.GetCommonResource()) do
		table.insert(var_11_0, iter_11_19)
	end

	for iter_11_20, iter_11_21 in ipairs(var_11_11.GetBuffResource()) do
		table.insert(var_11_0, iter_11_21)
	end

	for iter_11_22, iter_11_23 in ipairs(var_11_16) do
		table.insert(var_11_1, iter_11_23)
	end

	local var_11_17 = pg.expedition_data_template[arg_11_0.stageId]

	if arg_11_0.system == SYSTEM_WORLD and var_11_17.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
		local var_11_18 = nowWorld():GetActiveMap()

		for iter_11_24, iter_11_25 in ipairs(var_11_11.GetMapResource(var_11_18.config.expedition_map_id)) do
			table.insert(var_11_0, iter_11_25)
		end
	else
		for iter_11_26, iter_11_27 in ipairs(var_11_17.map_id) do
			for iter_11_28, iter_11_29 in ipairs(var_11_11.GetMapResource(iter_11_27[1])) do
				table.insert(var_11_0, iter_11_29)
			end
		end
	end

	if pg.battle_cost_template[arg_11_0.system].global_buff_effected > 0 then
		local var_11_19 = BuffHelper.GetBattleBuffs()
		local var_11_20 = _.map(var_11_19, function(arg_12_0)
			return arg_12_0:getConfig("benefit_effect")
		end)

		for iter_11_30, iter_11_31 in ipairs(var_11_20) do
			iter_11_31 = tonumber(iter_11_31)

			local var_11_21 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_11_31, 1, {})

			for iter_11_32, iter_11_33 in ipairs(var_11_21) do
				table.insert(var_11_0, iter_11_33)
			end
		end
	end

	local var_11_22 = var_11_11.GetStageBGM(var_11_14)

	return var_11_0, var_11_1, var_11_22
end

function var_0_0.generatePrefabShipData(arg_13_0)
	local var_13_0 = {
		configId = arg_13_0.configId,
		equipments = {},
		skinId = arg_13_0.skinId,
		buffs = arg_13_0.skills
	}
	local var_13_1 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(arg_13_0.configId)
	local var_13_2 = math.max(#arg_13_0.equipment, #var_13_1.default_equip_list)

	for iter_13_0 = 1, var_13_2 do
		var_13_0.equipments[iter_13_0] = arg_13_0.equipment[iter_13_0] and {
			configId = arg_13_0.equipment[iter_13_0]
		} or false
	end

	function var_13_0.getActiveEquipments(arg_14_0)
		return arg_14_0.equipments
	end

	return var_13_0
end

function var_0_0.addCommanderBuffRes(arg_15_0)
	local var_15_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_15_0, iter_15_1 in ipairs(arg_15_0) do
		local var_15_1 = var_15_0.GetCommanderResource(iter_15_1)

		for iter_15_2, iter_15_3 in ipairs(var_15_1) do
			var_15_0:AddPreloadResource(iter_15_3)
		end
	end
end

function var_0_0.GetExistBGList()
	local var_16_0 = LOADING_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOADING_HX_LV.key_value and "loadingbg_hx/bg_" or "loadingbg/bg_"
	local var_16_1 = {}

	for iter_16_0 = 1, BG_RANDOM_RANGE do
		local var_16_2 = var_16_0 .. iter_16_0

		if checkABExist(var_16_2) then
			table.insert(var_16_1, var_16_2)
		end
	end

	return var_16_1
end

function var_0_0.GetRandomBGPath()
	local var_17_0 = var_0_0.GetExistBGList()

	return var_17_0[math.random(1, #var_17_0)]
end

function var_0_0.EnsureBaseBGList()
	local var_18_0 = {}

	if #var_0_0.GetExistBGList() <= 0 then
		table.insert(var_18_0, "loadingbg_hx/bg_1")
		table.insert(var_18_0, "loadingbg/bg_1")
	end

	return var_18_0
end

return var_0_0
