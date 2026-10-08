local var_0_0 = class("CombatLoadUI", import("..base.BaseUI"))

var_0_0._loadObs = nil
var_0_0.LOADING_ANIMA_DISTANCE = 1820

function var_0_0.getUIName(arg_1_0)
	return "CombatLoadUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1
	local var_2_2

	if arg_2_1.system == SYSTEM_BOSS_RUSH_COLLABRATE then
		var_2_1 = AppreciatePicConst.TYPE_GALLERY
		var_2_2 = "bg/star_level_bg_211"
	else
		local var_2_3 = AppreciatePicConst.getRandomLoadingPic()

		if var_2_3 then
			var_2_1 = var_2_3.type
			var_2_2 = var_2_3.path
		else
			var_2_1 = AppreciatePicConst.TYPE_GALLERY
			var_2_2 = "loadingbg/login"
		end
	end

	if var_2_2 then
		table.insert(var_2_0, var_2_2)
	end

	local var_2_4 = HXSet.HxPath(var_2_2)

	arg_2_1._combatLoadPicData = {
		type = var_2_1,
		path = var_2_4
	}
	arg_2_0._preloadPicType = var_2_1
	arg_2_0._preloadPicPath = var_2_4

	local var_2_5, var_2_6, var_2_7 = CombatLoadUI.GetTotalResourceList(arg_2_1)

	if var_2_5 and #var_2_5 > 0 then
		for iter_2_0, iter_2_1 in ipairs(var_2_5) do
			iter_2_1 = string.lower(iter_2_1)

			table.insert(var_2_0, iter_2_1)
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.contextData and arg_3_0.contextData._combatLoadPicData

	arg_3_0._preloadPicType = var_3_0 and var_3_0.type or nil
	arg_3_0._preloadPicPath = var_3_0 and var_3_0.path or nil
	arg_3_0._preloadPicSprite = nil
	arg_3_0._preloadBgFitMode = PlayerPrefs.GetInt("bgFitMode", 0)

	if arg_3_0._preloadPicPath then
		LoadSpriteAsync(arg_3_0._preloadPicPath, function(arg_4_0)
			arg_3_0._preloadPicSprite = arg_4_0

			arg_3_1()
		end)
	else
		arg_3_1()
	end
end

function var_0_0.init(arg_5_0)
	local var_5_0 = arg_5_0._tf:Find("loading")

	arg_5_0._loadingProgress = var_5_0:Find("loading_bar"):GetComponent(typeof(Slider))
	arg_5_0._loadingProgress.value = 0
	arg_5_0._loadingText = var_5_0:Find("loading_label/percent"):GetComponent(typeof(Text))
	arg_5_0._loadingAnima = var_5_0:Find("loading_anima")
	arg_5_0._loadingAnimaPosY = arg_5_0._loadingAnima.anchoredPosition.y
	arg_5_0._finishAnima = var_5_0:Find("done_anima")

	SetActive(arg_5_0._loadingAnima, true)
	SetActive(arg_5_0._finishAnima, false)
	arg_5_0._finishAnima:GetComponent("DftAniEvent"):SetEndEvent(function(arg_6_0)
		arg_5_0:emit(CombatLoadMediator.FINISH, arg_5_0._loadObs)
	end)

	local var_5_1 = arg_5_0._tf:Find("GalleryEnv")
	local var_5_2 = arg_5_0._tf:Find("GalleryFit")
	local var_5_3 = arg_5_0._preloadBgFitMode or PlayerPrefs.GetInt("bgFitMode", 0)

	arg_5_0.bg = var_5_3 == 1 and var_5_2 or var_5_1

	local var_5_4 = arg_5_0._tf:Find("Manga")

	arg_5_0.mangaPicImg = arg_5_0._tf:Find("Manga/Pic")

	local function var_5_5(arg_7_0)
		SetActive(var_5_1, var_5_3 ~= 1)
		SetActive(var_5_2, var_5_3 == 1)
		SetActive(var_5_4, false)
		setImageSprite(arg_5_0.bg, arg_7_0 or LoadSprite("loadingbg/login"))
	end

	if arg_5_0._preloadPicType == AppreciatePicConst.TYPE_MANGA and arg_5_0._preloadPicSprite then
		SetActive(var_5_1, false)
		SetActive(var_5_2, false)
		SetActive(var_5_4, true)
		setImageSprite(arg_5_0.mangaPicImg, arg_5_0._preloadPicSprite)
	else
		var_5_5(arg_5_0._preloadPicSprite)
	end

	arg_5_0._tipsText = var_5_0:Find("tipsText"):GetComponent(typeof(Text))
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:Preload()
end

function var_0_0.onBackPressed(arg_9_0)
	return
end

function var_0_0.Preload(arg_10_0)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_10_0._loadObs = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_10_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_10_0:Init()

	local var_10_1 = getProxy(BayProxy)
	local var_10_2, var_10_3 = var_0_0.GetTotalResourceList(arg_10_0.contextData)

	for iter_10_0, iter_10_1 in ipairs(var_10_2) do
		var_10_0:AddPreloadResource(iter_10_1)
	end

	for iter_10_2, iter_10_3 in ipairs(var_10_3) do
		var_10_0:AddPreloadCV(iter_10_3)
	end

	if arg_10_0.contextData.system == SYSTEM_DEBUG and BATTLE_DEBUG_CUSTOM_WEAPON then
		for iter_10_4, iter_10_5 in pairs(ys.Battle.BattleUnitDetailView.BulletForger) do
			local var_10_4 = "触发自定义子弹替换>>>" .. iter_10_4 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_10_4)

			pg.bullet_template[iter_10_4] = iter_10_5
		end

		for iter_10_6, iter_10_7 in pairs(ys.Battle.BattleUnitDetailView.BarrageForger) do
			local var_10_5 = "触发自定义弹幕替换>>>" .. iter_10_6 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_10_5)

			pg.barrage_template[iter_10_6] = iter_10_7
		end

		for iter_10_8, iter_10_9 in pairs(ys.Battle.BattleUnitDetailView.AircraftForger) do
			local var_10_6 = "触发自定义飞机替换>>>" .. iter_10_8 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_10_6)

			pg.aircraft_template[iter_10_8] = iter_10_9
		end

		for iter_10_10, iter_10_11 in pairs(ys.Battle.BattleUnitDetailView.WeaponForger) do
			local var_10_7 = "触发自定义武器替换>>>" .. iter_10_10 .. "<<<，检查是否测试需要，否则联系程序"

			pg.TipsMgr.GetInstance():ShowTips(var_10_7)

			pg.weapon_property[iter_10_10] = iter_10_11

			local var_10_8 = var_10_0.GetWeaponResource(iter_10_10)

			for iter_10_12, iter_10_13 in ipairs(var_10_8) do
				var_10_0:AddPreloadResource(iter_10_13)
			end
		end
	end

	if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
		local var_10_9 = {}
		local var_10_10 = getProxy(FleetProxy):getFleetById(11)
		local var_10_11 = var_10_10:getTeamByName(TeamType.Submarine)

		for iter_10_14, iter_10_15 in ipairs(var_10_11) do
			table.insert(var_10_9, var_10_1:getShipById(iter_10_15))
		end

		local var_10_12, var_10_13 = var_10_0.GetPlayerShipResource(var_10_9, arg_10_0.contextData.system)

		for iter_10_16, iter_10_17 in ipairs(var_10_12) do
			var_10_0:AddPreloadResource(iter_10_17)
		end

		for iter_10_18, iter_10_19 in ipairs(var_10_13) do
			var_10_0:AddPreloadCV(iter_10_19)
		end

		var_0_0.addCommanderBuffRes(var_10_10:buildBattleBuffList())
	end

	local function var_10_14()
		SetActive(arg_10_0._loadingAnima, false)
		SetActive(arg_10_0._finishAnima, true)

		arg_10_0._finishAnima:GetComponent("Animator").enabled = true
	end

	local var_10_15 = 0

	local function var_10_16(arg_12_0)
		local var_12_0
		local var_12_1 = var_10_15 == 0 and 0 or arg_12_0 / var_10_15

		arg_10_0._loadingProgress.value = var_12_1
		arg_10_0._loadingText.text = string.format("%.2f", var_12_1 * 100) .. "%"
		arg_10_0._loadingAnima.anchoredPosition = Vector2(var_12_1 * var_0_0.LOADING_ANIMA_DISTANCE, arg_10_0._loadingAnimaPosY)
	end

	local var_10_17 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_10_17, true)

	var_10_15 = var_10_0:StartPreload(var_10_14, var_10_16)
	arg_10_0._tipsText.text = pg.server_language[math.random(#pg.server_language)].content
end

function var_0_0.GetTotalResourceList(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = {}
	local var_13_2 = {}
	local var_13_3 = ys.Battle.BattleGate.Gates[arg_13_0.system]

	if var_13_3.GetPreloadList then
		local var_13_4, var_13_5 = var_13_3.GetPreloadList(arg_13_0)

		for iter_13_0, iter_13_1 in ipairs(var_13_4) do
			table.insert(var_13_0, iter_13_1)
		end

		for iter_13_2, iter_13_3 in ipairs(var_13_5) do
			table.insert(var_13_1, iter_13_3)
		end
	elseif arg_13_0.mainFleetId then
		local var_13_6 = getProxy(FleetProxy):getFleetById(arg_13_0.mainFleetId)
		local var_13_7 = getProxy(BayProxy):getShipsByFleet(var_13_6)

		for iter_13_4, iter_13_5 in ipairs(var_13_7) do
			table.insert(var_13_2, iter_13_5)
		end
	end

	if arg_13_0.prefabFleet then
		local var_13_8 = arg_13_0.prefabFleet.main_unitList or {}
		local var_13_9 = arg_13_0.prefabFleet.vanguard_unitList or {}
		local var_13_10 = arg_13_0.prefabFleet.submarine_unitList or {}

		for iter_13_6, iter_13_7 in ipairs(var_13_8) do
			table.insert(var_13_2, var_0_0.generatePrefabShipData(iter_13_7))
		end

		for iter_13_8, iter_13_9 in ipairs(var_13_9) do
			table.insert(var_13_2, var_0_0.generatePrefabShipData(iter_13_9))
		end

		for iter_13_10, iter_13_11 in ipairs(var_13_10) do
			table.insert(var_13_2, var_0_0.generatePrefabShipData(iter_13_11))
		end
	end

	local var_13_11 = ys.Battle.BattleResourceManager.GetInstance()
	local var_13_12, var_13_13 = var_13_11.GetPlayerShipResource(var_13_2, arg_13_0.system)

	for iter_13_12, iter_13_13 in ipairs(var_13_12) do
		table.insert(var_13_0, iter_13_13)
	end

	for iter_13_14, iter_13_15 in ipairs(var_13_13) do
		table.insert(var_13_1, iter_13_15)
	end

	local var_13_14 = pg.expedition_data_template[arg_13_0.stageId].dungeon_id
	local var_13_15, var_13_16 = var_13_11.GetStageResource(var_13_14)

	for iter_13_16, iter_13_17 in ipairs(var_13_15) do
		table.insert(var_13_0, iter_13_17)
	end

	for iter_13_18, iter_13_19 in ipairs(var_13_11.GetCommonResource()) do
		table.insert(var_13_0, iter_13_19)
	end

	for iter_13_20, iter_13_21 in ipairs(var_13_11.GetBuffResource()) do
		table.insert(var_13_0, iter_13_21)
	end

	for iter_13_22, iter_13_23 in ipairs(var_13_16) do
		table.insert(var_13_1, iter_13_23)
	end

	local var_13_17 = pg.expedition_data_template[arg_13_0.stageId]

	if arg_13_0.system == SYSTEM_WORLD and var_13_17.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
		local var_13_18 = nowWorld():GetActiveMap()

		for iter_13_24, iter_13_25 in ipairs(var_13_11.GetMapResource(var_13_18.config.expedition_map_id)) do
			table.insert(var_13_0, iter_13_25)
		end
	else
		for iter_13_26, iter_13_27 in ipairs(var_13_17.map_id) do
			for iter_13_28, iter_13_29 in ipairs(var_13_11.GetMapResource(iter_13_27[1])) do
				table.insert(var_13_0, iter_13_29)
			end
		end
	end

	if pg.battle_cost_template[arg_13_0.system].global_buff_effected > 0 then
		local var_13_19 = BuffHelper.GetBattleBuffs()
		local var_13_20 = _.map(var_13_19, function(arg_14_0)
			return arg_14_0:getConfig("benefit_effect")
		end)

		for iter_13_30, iter_13_31 in ipairs(var_13_20) do
			iter_13_31 = tonumber(iter_13_31)

			local var_13_21 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_13_31, 1, {})

			for iter_13_32, iter_13_33 in ipairs(var_13_21) do
				table.insert(var_13_0, iter_13_33)
			end
		end
	end

	local var_13_22 = var_13_11.GetStageBGM(var_13_14)

	return var_13_0, var_13_1, var_13_22
end

function var_0_0.generatePrefabShipData(arg_15_0)
	local var_15_0 = {
		configId = arg_15_0.configId,
		equipments = {},
		skinId = arg_15_0.skinId,
		buffs = arg_15_0.skills
	}
	local var_15_1 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(arg_15_0.configId)
	local var_15_2 = math.max(#arg_15_0.equipment, #var_15_1.default_equip_list)

	for iter_15_0 = 1, var_15_2 do
		var_15_0.equipments[iter_15_0] = arg_15_0.equipment[iter_15_0] and {
			configId = arg_15_0.equipment[iter_15_0]
		} or false
	end

	function var_15_0.getActiveEquipments(arg_16_0)
		return arg_16_0.equipments
	end

	return var_15_0
end

function var_0_0.addCommanderBuffRes(arg_17_0)
	local var_17_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_17_0, iter_17_1 in ipairs(arg_17_0) do
		local var_17_1 = var_17_0.GetCommanderResource(iter_17_1)

		for iter_17_2, iter_17_3 in ipairs(var_17_1) do
			var_17_0:AddPreloadResource(iter_17_3)
		end
	end
end

return var_0_0
