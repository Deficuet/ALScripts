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

	local var_2_4 = (LOADING_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOADING_HX_LV.key_value and "loadingbg_hx/bg_" or "loadingbg/bg_") .. math.random(1, BG_RANDOM_RANGE)

	setImageSprite(arg_2_0.bg, LoadSprite(var_2_4))

	arg_2_0._tipsText = var_2_0:Find("tipsText"):GetComponent(typeof(Text))
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:Preload()
end

function var_0_0.onBackPressed(arg_5_0)
	return
end

function var_0_0.Preload(arg_6_0)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_6_0._loadObs = {}
	arg_6_0._toLoad = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_6_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_6_0:Init()

	local var_6_1 = getProxy(BayProxy)

	if arg_6_0.contextData.system == SYSTEM_BOSS_RUSH_COLLABRATE then
		setImageSprite(arg_6_0.bg, LoadSprite("bg/star_level_bg_211"))
	end

	if arg_6_0.contextData.system == SYSTEM_DEBUG and BATTLE_DEBUG_CUSTOM_WEAPON then
		for iter_6_0, iter_6_1 in pairs(ys.Battle.BattleUnitDetailView.BulletForger) do
			local var_6_2 = "触发自定义子弹替换>>>" .. iter_6_0 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_6_2)

			pg.bullet_template[iter_6_0] = iter_6_1
		end

		for iter_6_2, iter_6_3 in pairs(ys.Battle.BattleUnitDetailView.BarrageForger) do
			local var_6_3 = "触发自定义弹幕替换>>>" .. iter_6_2 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_6_3)

			pg.barrage_template[iter_6_2] = iter_6_3
		end

		for iter_6_4, iter_6_5 in pairs(ys.Battle.BattleUnitDetailView.AircraftForger) do
			local var_6_4 = "触发自定义飞机替换>>>" .. iter_6_4 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_6_4)

			pg.aircraft_template[iter_6_4] = iter_6_5
		end

		for iter_6_6, iter_6_7 in pairs(ys.Battle.BattleUnitDetailView.WeaponForger) do
			local var_6_5 = "触发自定义武器替换>>>" .. iter_6_6 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_6_5)

			pg.weapon_property[iter_6_6] = iter_6_7

			local var_6_6 = var_6_0.GetWeaponResource(iter_6_6)

			for iter_6_8, iter_6_9 in ipairs(var_6_6) do
				var_6_0:AddPreloadResource(iter_6_9)
			end
		end
	end

	local var_6_7, var_6_8 = var_0_0.GetTotalResourceList(arg_6_0.contextData)

	for iter_6_10, iter_6_11 in ipairs(var_6_7) do
		var_6_0:AddPreloadResource(iter_6_11)
	end

	for iter_6_12, iter_6_13 in ipairs(var_6_8) do
		var_6_0:AddPreloadCV(iter_6_13)
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_6_9 = getProxy(FleetProxy):getFleetById(11)
		local var_6_10 = var_6_9:getTeamByName(TeamType.Submarine)

		for iter_6_14, iter_6_15 in ipairs(var_6_10) do
			table.insert(loadShip, var_6_1:getShipById(iter_6_15))
		end

		var_0_0.addCommanderBuffRes(var_6_9:buildBattleBuffList())
	end

	local function var_6_11()
		SetActive(arg_6_0._loadingAnima, false)
		SetActive(arg_6_0._finishAnima, true)

		arg_6_0._finishAnima:GetComponent("Animator").enabled = true
	end

	local var_6_12 = 0

	local function var_6_13(arg_8_0)
		local var_8_0
		local var_8_1 = var_6_12 == 0 and 0 or arg_8_0 / var_6_12

		arg_6_0._loadingProgress.value = var_8_1
		arg_6_0._loadingText.text = string.format("%.2f", var_8_1 * 100) .. "%"
		arg_6_0._loadingAnima.anchoredPosition = Vector2(var_8_1 * var_0_0.LOADING_ANIMA_DISTANCE, arg_6_0._loadingAnimaPosY)
	end

	local var_6_14 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_6_14, true)

	var_6_12 = var_6_0:StartPreload(var_6_11, var_6_13)
	arg_6_0._tipsText.text = pg.server_language[math.random(#pg.server_language)].content
end

function var_0_0.GetTotalResourceList(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = {}
	local var_9_2 = {}
	local var_9_3 = ys.Battle.BattleGate.Gates[arg_9_0.system]

	if var_9_3.GetPreloadList then
		local var_9_4, var_9_5 = var_9_3.GetPreloadList(arg_9_0)

		for iter_9_0, iter_9_1 in ipairs(var_9_4) do
			table.insert(var_9_0, iter_9_1)
		end

		for iter_9_2, iter_9_3 in ipairs(var_9_5) do
			table.insert(var_9_1, iter_9_3)
		end
	elseif arg_9_0.mainFleetId then
		local var_9_6 = getProxy(FleetProxy):getFleetById(arg_9_0.mainFleetId)
		local var_9_7 = getProxy(BayProxy):getShipsByFleet(var_9_6)

		for iter_9_4, iter_9_5 in ipairs(var_9_7) do
			table.insert(var_9_2, iter_9_5)
		end
	end

	if arg_9_0.prefabFleet then
		local var_9_8 = arg_9_0.prefabFleet.main_unitList or {}
		local var_9_9 = arg_9_0.prefabFleet.vanguard_unitList or {}
		local var_9_10 = arg_9_0.prefabFleet.submarine_unitList or {}

		for iter_9_6, iter_9_7 in ipairs(var_9_8) do
			table.insert(var_9_2, var_0_0.generatePrefabShipData(iter_9_7))
		end

		for iter_9_8, iter_9_9 in ipairs(var_9_9) do
			table.insert(var_9_2, var_0_0.generatePrefabShipData(iter_9_9))
		end

		for iter_9_10, iter_9_11 in ipairs(var_9_10) do
			table.insert(var_9_2, var_0_0.generatePrefabShipData(iter_9_11))
		end
	end

	local var_9_11 = ys.Battle.BattleResourceManager.GetInstance()
	local var_9_12, var_9_13 = var_9_11.GetPlayerShipResource(var_9_2, arg_9_0.system)

	for iter_9_12, iter_9_13 in ipairs(var_9_12) do
		table.insert(var_9_0, iter_9_13)
	end

	for iter_9_14, iter_9_15 in ipairs(var_9_13) do
		table.insert(var_9_1, iter_9_15)
	end

	local var_9_14 = pg.expedition_data_template[arg_9_0.stageId].dungeon_id
	local var_9_15, var_9_16 = var_9_11.GetStageResource(var_9_14)

	for iter_9_16, iter_9_17 in ipairs(var_9_15) do
		table.insert(var_9_0, iter_9_17)
	end

	for iter_9_18, iter_9_19 in ipairs(var_9_11.GetCommonResource()) do
		table.insert(var_9_0, iter_9_19)
	end

	for iter_9_20, iter_9_21 in ipairs(var_9_11.GetBuffResource()) do
		table.insert(var_9_0, iter_9_21)
	end

	for iter_9_22, iter_9_23 in ipairs(var_9_16) do
		table.insert(var_9_1, iter_9_23)
	end

	local var_9_17 = pg.expedition_data_template[arg_9_0.stageId]

	if arg_9_0.system == SYSTEM_WORLD and var_9_17.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
		local var_9_18 = nowWorld():GetActiveMap()

		for iter_9_24, iter_9_25 in ipairs(var_9_11.GetMapResource(var_9_18.config.expedition_map_id)) do
			table.insert(var_9_0, iter_9_25)
		end
	else
		for iter_9_26, iter_9_27 in ipairs(var_9_17.map_id) do
			for iter_9_28, iter_9_29 in ipairs(var_9_11.GetMapResource(iter_9_27[1])) do
				table.insert(var_9_0, iter_9_29)
			end
		end
	end

	if pg.battle_cost_template[arg_9_0.system].global_buff_effected > 0 then
		local var_9_19 = BuffHelper.GetBattleBuffs()
		local var_9_20 = _.map(var_9_19, function(arg_10_0)
			return arg_10_0:getConfig("benefit_effect")
		end)

		for iter_9_30, iter_9_31 in ipairs(var_9_20) do
			iter_9_31 = tonumber(iter_9_31)

			local var_9_21 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_9_31, 1, {})

			for iter_9_32, iter_9_33 in ipairs(var_9_21) do
				table.insert(var_9_0, iter_9_33)
			end
		end
	end

	return var_9_0, var_9_1
end

function var_0_0.generatePrefabShipData(arg_11_0)
	local var_11_0 = {
		configId = arg_11_0.configId,
		equipments = {},
		skinId = arg_11_0.skinId,
		buffs = arg_11_0.skills
	}
	local var_11_1 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(arg_11_0.configId)
	local var_11_2 = math.max(#arg_11_0.equipment, #var_11_1.default_equip_list)

	for iter_11_0 = 1, var_11_2 do
		var_11_0.equipments[iter_11_0] = arg_11_0.equipment[iter_11_0] and {
			configId = arg_11_0.equipment[iter_11_0]
		} or false
	end

	function var_11_0.getActiveEquipments(arg_12_0)
		return arg_12_0.equipments
	end

	return var_11_0
end

function var_0_0.addCommanderBuffRes(arg_13_0)
	local var_13_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_13_0, iter_13_1 in ipairs(arg_13_0) do
		local var_13_1 = var_13_0.GetCommanderResource(iter_13_1)

		for iter_13_2, iter_13_3 in ipairs(var_13_1) do
			var_13_0:AddPreloadResource(iter_13_3)
		end
	end
end

function var_0_0.StartLoad(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_0._toLoad[arg_14_3] = 1

	LoadAndInstantiateAsync(arg_14_1, arg_14_2, function(arg_15_0)
		arg_14_0:LoadFinish(arg_15_0, arg_14_3)
	end)
end

function var_0_0.LoadFinish(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0._loadObs.map = arg_16_1
	arg_16_0._toLoad.map = nil

	if table.getCount(arg_16_0._toLoad) <= 0 then
		arg_16_0._go:GetComponent("Animator"):Play("start")
	end
end

return var_0_0
