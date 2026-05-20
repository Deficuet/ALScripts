local var_0_0 = class("CombatLoadUI", import("..base.BaseUI"))

var_0_0._loadObs = nil
var_0_0.LOADING_ANIMA_DISTANCE = 1820

function var_0_0.getUIName(arg_1_0)
	return "CombatLoadUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	arg_2_0._preloadPicType = nil
	arg_2_0._preloadPicPath = nil
	arg_2_0._preloadPicSprite = nil
	arg_2_0._preloadBgFitMode = PlayerPrefs.GetInt("bgFitMode", 0)

	local var_2_0
	local var_2_1

	if arg_2_0.contextData.system == SYSTEM_BOSS_RUSH_COLLABRATE then
		var_2_0 = AppreciatePicConst.TYPE_GALLERY
		var_2_1 = "bg/star_level_bg_211"
	else
		local var_2_2 = AppreciatePicConst.getRandomLoadingPic()

		if var_2_2 then
			var_2_0 = var_2_2.type
			var_2_1 = var_2_2.path
		else
			var_2_0 = AppreciatePicConst.TYPE_GALLERY
			var_2_1 = "loadingbg/login"
		end
	end

	arg_2_0._preloadPicType = var_2_0
	arg_2_0._preloadPicPath = var_2_1

	if var_2_1 then
		LoadSpriteAsync(var_2_1, function(arg_3_0)
			arg_2_0._preloadPicSprite = arg_3_0

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

	local var_4_1 = arg_4_0._tf:Find("GalleryEnv")
	local var_4_2 = arg_4_0._tf:Find("GalleryFit")
	local var_4_3 = arg_4_0._preloadBgFitMode or PlayerPrefs.GetInt("bgFitMode", 0)

	arg_4_0.bg = var_4_3 == 1 and var_4_2 or var_4_1

	local var_4_4 = arg_4_0._tf:Find("Manga")

	arg_4_0.mangaPicImg = arg_4_0._tf:Find("Manga/Pic")

	local function var_4_5(arg_6_0)
		SetActive(var_4_1, var_4_3 ~= 1)
		SetActive(var_4_2, var_4_3 == 1)
		SetActive(var_4_4, false)
		setImageSprite(arg_4_0.bg, arg_6_0 or LoadSprite("loadingbg/login"))
	end

	if arg_4_0._preloadPicType == AppreciatePicConst.TYPE_MANGA and arg_4_0._preloadPicSprite then
		SetActive(var_4_1, false)
		SetActive(var_4_2, false)
		SetActive(var_4_4, true)
		setImageSprite(arg_4_0.mangaPicImg, arg_4_0._preloadPicSprite)
	else
		var_4_5(arg_4_0._preloadPicSprite)
	end

	arg_4_0._tipsText = var_4_0:Find("tipsText"):GetComponent(typeof(Text))
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:Preload()
end

function var_0_0.onBackPressed(arg_8_0)
	return
end

function var_0_0.Preload(arg_9_0)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_9_0._loadObs = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_9_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_9_0:Init()

	local var_9_1 = getProxy(BayProxy)
	local var_9_2, var_9_3 = var_0_0.GetTotalResourceList(arg_9_0.contextData)

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		var_9_0:AddPreloadResource(iter_9_1)
	end

	for iter_9_2, iter_9_3 in ipairs(var_9_3) do
		var_9_0:AddPreloadCV(iter_9_3)
	end

	if arg_9_0.contextData.system == SYSTEM_DEBUG and BATTLE_DEBUG_CUSTOM_WEAPON then
		for iter_9_4, iter_9_5 in pairs(ys.Battle.BattleUnitDetailView.BulletForger) do
			local var_9_4 = "触发自定义子弹替换>>>" .. iter_9_4 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_9_4)

			pg.bullet_template[iter_9_4] = iter_9_5
		end

		for iter_9_6, iter_9_7 in pairs(ys.Battle.BattleUnitDetailView.BarrageForger) do
			local var_9_5 = "触发自定义弹幕替换>>>" .. iter_9_6 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_9_5)

			pg.barrage_template[iter_9_6] = iter_9_7
		end

		for iter_9_8, iter_9_9 in pairs(ys.Battle.BattleUnitDetailView.AircraftForger) do
			local var_9_6 = "触发自定义飞机替换>>>" .. iter_9_8 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_9_6)

			pg.aircraft_template[iter_9_8] = iter_9_9
		end

		for iter_9_10, iter_9_11 in pairs(ys.Battle.BattleUnitDetailView.WeaponForger) do
			local var_9_7 = "触发自定义武器替换>>>" .. iter_9_10 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_9_7)

			pg.weapon_property[iter_9_10] = iter_9_11

			local var_9_8 = var_9_0.GetWeaponResource(iter_9_10)

			for iter_9_12, iter_9_13 in ipairs(var_9_8) do
				var_9_0:AddPreloadResource(iter_9_13)
			end
		end
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_9_9 = {}
		local var_9_10 = getProxy(FleetProxy):getFleetById(11)
		local var_9_11 = var_9_10:getTeamByName(TeamType.Submarine)

		for iter_9_14, iter_9_15 in ipairs(var_9_11) do
			table.insert(var_9_9, var_9_1:getShipById(iter_9_15))
		end

		local var_9_12, var_9_13 = var_9_0.GetPlayerShipResource(var_9_9, arg_9_0.contextData.system)

		for iter_9_16, iter_9_17 in ipairs(var_9_12) do
			var_9_0:AddPreloadResource(iter_9_17)
		end

		for iter_9_18, iter_9_19 in ipairs(var_9_13) do
			var_9_0:AddPreloadCV(iter_9_19)
		end

		var_0_0.addCommanderBuffRes(var_9_10:buildBattleBuffList())
	end

	local var_9_14, var_9_15 = var_0_0.GetTotalResourceList(arg_9_0.contextData)

	for iter_9_20, iter_9_21 in ipairs(var_9_14) do
		var_9_0:AddPreloadResource(iter_9_21)
	end

	for iter_9_22, iter_9_23 in ipairs(var_9_15) do
		var_9_0:AddPreloadCV(iter_9_23)
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_9_16 = {}
		local var_9_17 = getProxy(FleetProxy):getFleetById(11)
		local var_9_18 = var_9_17:getTeamByName(TeamType.Submarine)

		for iter_9_24, iter_9_25 in ipairs(var_9_18) do
			table.insert(var_9_16, var_9_1:getShipById(iter_9_25))
		end

		local var_9_19, var_9_20 = var_9_0.GetPlayerShipResource(var_9_16, arg_9_0.contextData.system)

		for iter_9_26, iter_9_27 in ipairs(var_9_19) do
			var_9_0:AddPreloadResource(iter_9_27)
		end

		for iter_9_28, iter_9_29 in ipairs(var_9_20) do
			var_9_0:AddPreloadCV(iter_9_29)
		end

		var_0_0.addCommanderBuffRes(var_9_17:buildBattleBuffList())
	end

	local function var_9_21()
		SetActive(arg_9_0._loadingAnima, false)
		SetActive(arg_9_0._finishAnima, true)

		arg_9_0._finishAnima:GetComponent("Animator").enabled = true
	end

	local var_9_22 = 0

	local function var_9_23(arg_11_0)
		local var_11_0
		local var_11_1 = var_9_22 == 0 and 0 or arg_11_0 / var_9_22

		arg_9_0._loadingProgress.value = var_11_1
		arg_9_0._loadingText.text = string.format("%.2f", var_11_1 * 100) .. "%"
		arg_9_0._loadingAnima.anchoredPosition = Vector2(var_11_1 * var_0_0.LOADING_ANIMA_DISTANCE, arg_9_0._loadingAnimaPosY)
	end

	local var_9_24 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_9_24, true)

	var_9_22 = var_9_0:StartPreload(var_9_21, var_9_23)
	arg_9_0._tipsText.text = pg.server_language[math.random(#pg.server_language)].content
end

function var_0_0.GetTotalResourceList(arg_12_0)
	local var_12_0 = {}
	local var_12_1 = {}
	local var_12_2 = {}
	local var_12_3 = ys.Battle.BattleGate.Gates[arg_12_0.system]

	if var_12_3.GetPreloadList then
		local var_12_4, var_12_5 = var_12_3.GetPreloadList(arg_12_0)

		for iter_12_0, iter_12_1 in ipairs(var_12_4) do
			table.insert(var_12_0, iter_12_1)
		end

		for iter_12_2, iter_12_3 in ipairs(var_12_5) do
			table.insert(var_12_1, iter_12_3)
		end
	elseif arg_12_0.mainFleetId then
		local var_12_6 = getProxy(FleetProxy):getFleetById(arg_12_0.mainFleetId)
		local var_12_7 = getProxy(BayProxy):getShipsByFleet(var_12_6)

		for iter_12_4, iter_12_5 in ipairs(var_12_7) do
			table.insert(var_12_2, iter_12_5)
		end
	end

	if arg_12_0.prefabFleet then
		local var_12_8 = arg_12_0.prefabFleet.main_unitList or {}
		local var_12_9 = arg_12_0.prefabFleet.vanguard_unitList or {}
		local var_12_10 = arg_12_0.prefabFleet.submarine_unitList or {}

		for iter_12_6, iter_12_7 in ipairs(var_12_8) do
			table.insert(var_12_2, var_0_0.generatePrefabShipData(iter_12_7))
		end

		for iter_12_8, iter_12_9 in ipairs(var_12_9) do
			table.insert(var_12_2, var_0_0.generatePrefabShipData(iter_12_9))
		end

		for iter_12_10, iter_12_11 in ipairs(var_12_10) do
			table.insert(var_12_2, var_0_0.generatePrefabShipData(iter_12_11))
		end
	end

	local var_12_11 = ys.Battle.BattleResourceManager.GetInstance()
	local var_12_12, var_12_13 = var_12_11.GetPlayerShipResource(var_12_2, arg_12_0.system)

	for iter_12_12, iter_12_13 in ipairs(var_12_12) do
		table.insert(var_12_0, iter_12_13)
	end

	for iter_12_14, iter_12_15 in ipairs(var_12_13) do
		table.insert(var_12_1, iter_12_15)
	end

	local var_12_14 = pg.expedition_data_template[arg_12_0.stageId].dungeon_id
	local var_12_15, var_12_16 = var_12_11.GetStageResource(var_12_14)

	for iter_12_16, iter_12_17 in ipairs(var_12_15) do
		table.insert(var_12_0, iter_12_17)
	end

	for iter_12_18, iter_12_19 in ipairs(var_12_11.GetCommonResource()) do
		table.insert(var_12_0, iter_12_19)
	end

	for iter_12_20, iter_12_21 in ipairs(var_12_11.GetBuffResource()) do
		table.insert(var_12_0, iter_12_21)
	end

	for iter_12_22, iter_12_23 in ipairs(var_12_16) do
		table.insert(var_12_1, iter_12_23)
	end

	local var_12_17 = pg.expedition_data_template[arg_12_0.stageId]

	if arg_12_0.system == SYSTEM_WORLD and var_12_17.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
		local var_12_18 = nowWorld():GetActiveMap()

		for iter_12_24, iter_12_25 in ipairs(var_12_11.GetMapResource(var_12_18.config.expedition_map_id)) do
			table.insert(var_12_0, iter_12_25)
		end
	else
		for iter_12_26, iter_12_27 in ipairs(var_12_17.map_id) do
			for iter_12_28, iter_12_29 in ipairs(var_12_11.GetMapResource(iter_12_27[1])) do
				table.insert(var_12_0, iter_12_29)
			end
		end
	end

	if pg.battle_cost_template[arg_12_0.system].global_buff_effected > 0 then
		local var_12_19 = BuffHelper.GetBattleBuffs()
		local var_12_20 = _.map(var_12_19, function(arg_13_0)
			return arg_13_0:getConfig("benefit_effect")
		end)

		for iter_12_30, iter_12_31 in ipairs(var_12_20) do
			iter_12_31 = tonumber(iter_12_31)

			local var_12_21 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_12_31, 1, {})

			for iter_12_32, iter_12_33 in ipairs(var_12_21) do
				table.insert(var_12_0, iter_12_33)
			end
		end
	end

	local var_12_22 = var_12_11.GetStageBGM(var_12_14)

	return var_12_0, var_12_1, var_12_22
end

function var_0_0.generatePrefabShipData(arg_14_0)
	local var_14_0 = {
		configId = arg_14_0.configId,
		equipments = {},
		skinId = arg_14_0.skinId,
		buffs = arg_14_0.skills
	}
	local var_14_1 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(arg_14_0.configId)
	local var_14_2 = math.max(#arg_14_0.equipment, #var_14_1.default_equip_list)

	for iter_14_0 = 1, var_14_2 do
		var_14_0.equipments[iter_14_0] = arg_14_0.equipment[iter_14_0] and {
			configId = arg_14_0.equipment[iter_14_0]
		} or false
	end

	function var_14_0.getActiveEquipments(arg_15_0)
		return arg_15_0.equipments
	end

	return var_14_0
end

function var_0_0.addCommanderBuffRes(arg_16_0)
	local var_16_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
		local var_16_1 = var_16_0.GetCommanderResource(iter_16_1)

		for iter_16_2, iter_16_3 in ipairs(var_16_1) do
			var_16_0:AddPreloadResource(iter_16_3)
		end
	end
end

function var_0_0.GetExistBGList()
	local var_17_0 = LOADING_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOADING_HX_LV.key_value and "loadingbg_hx/bg_" or "loadingbg/bg_"
	local var_17_1 = {}

	for iter_17_0 = 1, BG_RANDOM_RANGE do
		local var_17_2 = var_17_0 .. iter_17_0

		if checkABExist(var_17_2) then
			table.insert(var_17_1, var_17_2)
		end
	end

	return var_17_1
end

function var_0_0.GetRandomBGPath()
	local var_18_0 = var_0_0.GetExistBGList()

	return var_18_0[math.random(1, #var_18_0)]
end

function var_0_0.EnsureBaseBGList()
	local var_19_0 = {}

	if #var_0_0.GetExistBGList() <= 0 then
		table.insert(var_19_0, "loadingbg_hx/bg_1")
		table.insert(var_19_0, "loadingbg/bg_1")
	end

	return var_19_0
end

return var_0_0
