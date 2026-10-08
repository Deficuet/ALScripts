local var_0_0 = class("WorldScene", import("..base.BaseUI"))

var_0_0.SceneOp = "WorldScene.SceneOp"
var_0_0.Listeners = {
	onAchievementAchieved = "OnAchievementAchieved",
	onUpdateEventTips = "OnUpdateEventTips",
	onSelectFleet = "OnSelectFleet",
	onUpdateSubmarineSupport = "OnUpdateSubmarineSupport",
	onClearMoveQueue = "ClearMoveQueue",
	onModelSelectMap = "OnModelSelectMap",
	onUpdateDaily = "OnUpdateDaily",
	onUpdateProgress = "OnUpdateProgress",
	onUpdateScale = "OnUpdateScale",
	onUpdateRound = "OnUpdateRound",
	onDisposeMap = "OnDisposeMap",
	onFleetSelected = "OnFleetSelected"
}
var_0_0.optionsPath = {
	"top/adapt/top_chapter/option",
	"top/adapt/top_stage/option"
}

function var_0_0.forceGC(arg_1_0)
	return true
end

function var_0_0.getUIName(arg_2_0)
	return "WorldUI"
end

function var_0_0.getBGM(arg_3_0)
	local var_3_0 = {}

	if arg_3_0:GetInMap() == false then
		-- block empty
	else
		table.insert(var_3_0, nowWorld():GetActiveMap():GetBGM() or "")
	end

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if iter_3_1 ~= "" then
			return iter_3_1
		end
	end

	return var_0_0.super.getBGM(arg_3_0)
end

function var_0_0.getResource(arg_4_0, arg_4_1)
	local var_4_0 = {
		"scenes/worldmap3d",
		"model/worldmapmodel",
		"world/object/world_plane",
		"ui/darkfog",
		"ui/sairenfog",
		"world/cell/base",
		"world/object/yangliu_shang",
		"world/object/yangliu_you",
		"world/object/yangliu_xia",
		"world/object/yangliu_zuo",
		"world/object/longjuanfeng_shang",
		"world/object/longjuanfeng_you",
		"world/object/longjuanfeng_xia",
		"world/object/longjuanfeng_zuo",
		"world/object/ice",
		"world/object/poison01",
		"world/object/poison02",
		"world/object/longjuanfeng",
		"ui/san_low",
		"weaponframes",
		"shiptype"
	}

	return table.insertto(var_4_0, var_0_0.super.getResource(arg_4_0, arg_4_1))
end

function var_0_0.insertResToList(arg_5_0, arg_5_1, arg_5_2)
	if noEmptyStr(arg_5_2) and not table.contains(arg_5_1, arg_5_2) then
		table.insert(arg_5_1, arg_5_2)
	end
end

function var_0_0.insertResListToList(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in ipairs(arg_6_2 or {}) do
		arg_6_0:insertResToList(arg_6_1, iter_6_1)
	end
end

function var_0_0.insertPrefixResToList(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if noEmptyStr(arg_7_3) then
		arg_7_0:insertResToList(arg_7_1, arg_7_2 .. arg_7_3)
	end
end

function var_0_0.insertWorldBuffIconRes(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_2 and arg_8_2.config and noEmptyStr(arg_8_2.config.icon) then
		arg_8_0:insertPrefixResToList(arg_8_1, arg_8_3, arg_8_2.config.icon)
	end
end

function var_0_0.downloadWorldResList(arg_9_0, arg_9_1, arg_9_2)
	SplitPackConst.DownloadByLuaArr(arg_9_1, function()
		if arg_9_0.exited then
			return
		end

		return existCall(arg_9_2)
	end)
end

function var_0_0.getAtlasResList(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(WSEntranceTpl.prefabName) do
		arg_11_0:insertPrefixResToList(var_11_0, "world/mark/", iter_11_1)
	end

	arg_11_0:insertResToList(var_11_0, "world/mark/dsj_srgr")

	return var_11_0
end

function var_0_0.getMapCellResList(arg_12_0, arg_12_1)
	local var_12_0 = {}

	if not arg_12_1 then
		return var_12_0
	end

	local var_12_1 = arg_12_1:GetTerrain()

	if var_12_1 == WorldMapCell.TerrainStream or var_12_1 == WorldMapCell.TerrainWind or var_12_1 == WorldMapCell.TerrainIce or var_12_1 == WorldMapCell.TerrainPoison then
		arg_12_0:insertResToList(var_12_0, (WorldConst.GetTerrainEffectRes(var_12_1, arg_12_1.terrainDir, arg_12_1.terrainStrong)))
	end

	local var_12_2 = arg_12_1:GetEmotion()

	if noEmptyStr(var_12_2) then
		arg_12_0:insertResToList(var_12_0, "ui/" .. var_12_2)
	end

	return var_12_0
end

function var_0_0.getMapAttachmentResList(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {}

	if not arg_13_2 then
		return var_13_0
	end

	if arg_13_2.type == WorldMapAttachment.TypeArtifact then
		local var_13_1 = arg_13_2:GetArtifaceInfo()

		if var_13_1 and noEmptyStr(var_13_1[3]) then
			arg_13_0:insertPrefixResToList(var_13_0, WorldConst.ResChapterPrefab, var_13_1[3])
		end

		return var_13_0
	end

	local var_13_2 = arg_13_2.config

	if not var_13_2 then
		return var_13_0
	end

	if arg_13_2.type == WorldMapAttachment.TypeEvent then
		local var_13_3 = arg_13_2:GetReplaceDisplayEnemyConfig()

		if var_13_3 then
			if arg_13_2:IsAvatar() then
				arg_13_0:insertPrefixResToList(var_13_0, "char/", var_13_3.icon)
			else
				arg_13_0:insertPrefixResToList(var_13_0, "enemies/", var_13_3.icon)

				if noEmptyStr(var_13_3.icon) then
					arg_13_0:insertResToList(var_13_0, "enemies/" .. var_13_3.icon .. "_d_blue")
				end
			end
		elseif arg_13_2:IsAvatar() then
			arg_13_0:insertPrefixResToList(var_13_0, "char/", var_13_2.icon)
		elseif math.floor(var_13_2.enemyicon / 2) == 2 then
			arg_13_0:insertPrefixResToList(var_13_0, WorldConst.ResChapterPrefab, var_13_2.icon)
		elseif math.floor(var_13_2.enemyicon / 2) == 0 then
			arg_13_0:insertPrefixResToList(var_13_0, WorldConst.ResBoxPrefab, var_13_2.icon)
		end
	elseif arg_13_2.type == WorldMapAttachment.TypeBox then
		if arg_13_2:IsAvatar() then
			arg_13_0:insertPrefixResToList(var_13_0, "char/", var_13_2.icon)
		else
			arg_13_0:insertPrefixResToList(var_13_0, WorldConst.ResBoxPrefab, var_13_2.icon)
		end
	elseif WorldMapAttachment.IsEnemyType(arg_13_2.type) then
		if arg_13_2:IsAvatar() then
			arg_13_0:insertPrefixResToList(var_13_0, "char/", var_13_2.icon)
		else
			arg_13_0:insertPrefixResToList(var_13_0, "enemies/", var_13_2.icon)

			if noEmptyStr(var_13_2.icon) then
				arg_13_0:insertResToList(var_13_0, "enemies/" .. var_13_2.icon .. "_d_blue")
			end
		end
	elseif arg_13_2.type == WorldMapAttachment.TypeTransportFleet then
		arg_13_0:insertPrefixResToList(var_13_0, "enemies/", var_13_2.icon)
	elseif arg_13_2.type == WorldMapAttachment.TypeTrap then
		if arg_13_2:IsAvatar() then
			arg_13_0:insertPrefixResToList(var_13_0, "char/", var_13_2.trap_fx)
		else
			arg_13_0:insertPrefixResToList(var_13_0, WorldConst.ResBoxPrefab, var_13_2.trap_fx)
		end
	end

	for iter_13_0, iter_13_1 in ipairs(arg_13_2:GetBuffList()) do
		arg_13_0:insertWorldBuffIconRes(var_13_0, iter_13_1, "world/buff/")
	end

	if arg_13_1 then
		local var_13_4 = arg_13_2:GetRadiationBuffs()

		if #var_13_4 > 0 then
			local var_13_5, var_13_6, var_13_7 = unpack(var_13_4[1])
			local var_13_8 = pg.world_SLGbuff_data[var_13_6]

			if var_13_8 then
				arg_13_0:insertPrefixResToList(var_13_0, "world/mapbuff/", var_13_8.icon)
			end
		else
			for iter_13_2, iter_13_3 in ipairs(arg_13_1:GetBuffList(WorldMap.FactionEnemy, arg_13_2)) do
				arg_13_0:insertWorldBuffIconRes(var_13_0, iter_13_3, "world/mapbuff/")
			end
		end
	end

	return var_13_0
end

function var_0_0.getCarryItemResList(arg_14_0, arg_14_1)
	local var_14_0 = {}

	if arg_14_1 and arg_14_1.config then
		if arg_14_1:IsAvatar() then
			arg_14_0:insertPrefixResToList(var_14_0, "char/", arg_14_1.config.icon)
		else
			arg_14_0:insertPrefixResToList(var_14_0, WorldConst.ResBoxPrefab, arg_14_1.config.icon)
		end
	end

	return var_14_0
end

function var_0_0.getWorldFleetResList(arg_15_0, arg_15_1)
	local var_15_0 = {}

	if not arg_15_1 then
		return var_15_0
	end

	arg_15_0:insertPrefixResToList(var_15_0, "char/", arg_15_1:GetPrefab())

	for iter_15_0, iter_15_1 in ipairs(arg_15_1:GetBuffFxList()) do
		if type(iter_15_1) == "table" then
			for iter_15_2, iter_15_3 in ipairs(iter_15_1) do
				arg_15_0:insertPrefixResToList(var_15_0, "ui/", iter_15_3)
			end
		else
			arg_15_0:insertPrefixResToList(var_15_0, "ui/", iter_15_1)
		end
	end

	for iter_15_4, iter_15_5 in ipairs(arg_15_1:GetCarries()) do
		arg_15_0:insertResListToList(var_15_0, arg_15_0:getCarryItemResList(iter_15_5))
	end

	for iter_15_6, iter_15_7 in ipairs(arg_15_1:GetBuffList()) do
		arg_15_0:insertWorldBuffIconRes(var_15_0, iter_15_7, "world/buff/")
	end

	arg_15_0:insertWorldBuffIconRes(var_15_0, arg_15_1:GetDamageBuff(), "world/buff/")
	arg_15_0:insertWorldBuffIconRes(var_15_0, arg_15_1:GetWatchingBuff(), "world/watchingbuff/")

	if arg_15_1:IsCatSalvage() then
		local var_15_1 = arg_15_1:GetDisplayCommander()

		if var_15_1 then
			arg_15_0:insertPrefixResToList(var_15_0, "commandericon/", var_15_1:getPainting())
		end
	end

	for iter_15_8, iter_15_9 in pairs(arg_15_1:getCommanders()) do
		if iter_15_9 then
			local var_15_2 = iter_15_9:getSkills()[1]

			if var_15_2 then
				arg_15_0:insertPrefixResToList(var_15_0, "commanderskillicon/", var_15_2:getConfig("icon"))
			end
		end
	end

	for iter_15_10, iter_15_11 in ipairs({
		TeamType.Main,
		TeamType.Vanguard
	}) do
		for iter_15_12, iter_15_13 in ipairs(arg_15_1:GetTeamShips(iter_15_11, true)) do
			local var_15_3 = WorldConst.FetchShipVO(iter_15_13.id)

			if var_15_3 then
				arg_15_0:insertPrefixResToList(var_15_0, "SquareIcon/", var_15_3:getPainting())
			end
		end
	end

	return var_15_0
end

function var_0_0.getMapResList(arg_16_0, arg_16_1)
	local var_16_0 = {
		"world/object/world_plane",
		"ui/darkfog",
		"ui/sairenfog",
		"world/cell/base",
		"world/object/yangliu_shang",
		"world/object/yangliu_you",
		"world/object/yangliu_xia",
		"world/object/yangliu_zuo",
		"world/object/longjuanfeng_shang",
		"world/object/longjuanfeng_you",
		"world/object/longjuanfeng_xia",
		"world/object/longjuanfeng_zuo",
		"world/object/ice",
		"world/object/poison01",
		"world/object/poison02",
		"world/object/longjuanfeng",
		"ui/san_low",
		"weaponframes",
		"shiptype"
	}

	if not arg_16_1 then
		return var_16_0
	end

	if arg_16_1.theme and noEmptyStr(arg_16_1.theme.assetSea) then
		arg_16_0:insertPrefixResToList(var_16_0, "chapter/pic/", arg_16_1.theme.assetSea)
	end

	for iter_16_0, iter_16_1 in ipairs(checkExist(arg_16_1, {
		"config"
	}, {
		"float_items"
	}) or {}) do
		arg_16_0:insertPrefixResToList(var_16_0, WorldConst.ResChapterPrefab, iter_16_1[3])
	end

	for iter_16_2, iter_16_3 in pairs(arg_16_1.cells or {}) do
		arg_16_0:insertResListToList(var_16_0, arg_16_0:getMapCellResList(iter_16_3))

		for iter_16_4, iter_16_5 in ipairs(iter_16_3.attachments or {}) do
			arg_16_0:insertResListToList(var_16_0, arg_16_0:getMapAttachmentResList(arg_16_1, iter_16_5))
		end
	end

	for iter_16_6, iter_16_7 in ipairs(arg_16_1:GetNormalFleets()) do
		arg_16_0:insertResListToList(var_16_0, arg_16_0:getWorldFleetResList(iter_16_7))
	end

	for iter_16_8, iter_16_9 in ipairs(nowWorld():GetWorldMapBuffs()) do
		arg_16_0:insertWorldBuffIconRes(var_16_0, iter_16_9, "world/buff/")
	end

	local var_16_1 = WorldBuff.New()

	var_16_1:Setup({
		floor = 0,
		id = WorldConst.MoveLimitBuffId
	})
	arg_16_0:insertWorldBuffIconRes(var_16_0, var_16_1, "world/buff/")

	return var_16_0
end

function var_0_0.getUIAnimResList(arg_17_0, arg_17_1)
	local var_17_0 = {}

	arg_17_0:insertPrefixResToList(var_17_0, "ui/", arg_17_1)

	return var_17_0
end

function var_0_0.getStrikeAnimResList(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0:getUIAnimResList(arg_18_1)

	if arg_18_2 then
		arg_18_0:insertPrefixResToList(var_18_0, "painting/", arg_18_2:getPainting())
		arg_18_0:insertPrefixResToList(var_18_0, "char/", arg_18_2:getPrefab())
	end

	return var_18_0
end

function var_0_0.init(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(var_0_0.Listeners) do
		arg_19_0[iter_19_0] = function(...)
			var_0_0[iter_19_1](arg_19_0, ...)
		end
	end

	arg_19_0:bind(var_0_0.SceneOp, function(arg_21_0, ...)
		arg_19_0:Op(...)
	end)

	arg_19_0.camera = pg.UIMgr.GetInstance().levelCamera:GetComponent(typeof(Camera))
	arg_19_0.rtUIMain = pg.UIMgr.GetInstance().LevelMain

	setActive(arg_19_0.rtUIMain, false)

	arg_19_0.rtGrid = arg_19_0.rtUIMain:Find("LevelGrid")

	setActive(arg_19_0.rtGrid, true)

	arg_19_0.rtDragLayer = arg_19_0.rtGrid:Find("DragLayer")
	arg_19_0.rtEnvBG = arg_19_0._tf:Find("main/bg")
	arg_19_0.rtTop = arg_19_0._tf:Find("top")
	arg_19_0.rtTopAtlas = arg_19_0.rtTop:Find("adapt/top_chapter")

	setActive(arg_19_0.rtTopAtlas, false)

	arg_19_0.rtRightAtlas = arg_19_0.rtTop:Find("adapt/right_chapter")

	setActive(arg_19_0.rtRightAtlas, false)

	arg_19_0.rtBottomAtlas = arg_19_0.rtTop:Find("adapt/bottom_chapter")

	setActive(arg_19_0.rtBottomAtlas, false)

	arg_19_0.rtTransportAtlas = arg_19_0.rtTop:Find("transport_chapter")

	setActive(arg_19_0.rtTransportAtlas, false)

	arg_19_0.rtTopMap = arg_19_0.rtTop:Find("adapt/top_stage")

	setActive(arg_19_0.rtTopMap, false)

	arg_19_0.rtLeftMap = arg_19_0.rtTop:Find("adapt/left_stage")

	setActive(arg_19_0.rtLeftMap, false)

	arg_19_0.rtRightMap = arg_19_0.rtTop:Find("adapt/right_stage")

	setActive(arg_19_0.rtRightMap, false)

	arg_19_0.rtOutMap = arg_19_0.rtTop:Find("effect_stage")

	setActive(arg_19_0.rtOutMap, false)

	arg_19_0.rtClickStop = arg_19_0.rtTop:Find("stop_click")

	onButton(arg_19_0, arg_19_0.rtClickStop:Find("long_move"), function()
		if #arg_19_0.moveQueue > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_fleet_stop"))
			arg_19_0:ClearMoveQueue()
		end
	end)
	onButton(arg_19_0, arg_19_0.rtClickStop:Find("auto_fight"), function()
		local var_23_0 = nowWorld()

		if var_23_0.isAutoFight then
			pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_tip_bigworld_stop"))
			var_23_0:TriggerAutoFight(false)
		else
			assert(false, "stop clicker shouldn't active")
		end
	end)
	setActive(arg_19_0.rtClickStop, false)

	arg_19_0.resAtlas = WorldResource.New()

	arg_19_0.resAtlas:setParent(arg_19_0.rtTopAtlas:Find("resources"), false)

	arg_19_0.resMap = WorldResource.New()

	arg_19_0.resMap:setParent(arg_19_0.rtTopMap:Find("resources"), false)

	arg_19_0.wsPool = WSPool.New()

	arg_19_0.wsPool:Setup(arg_19_0._tf:Find("resources"))

	arg_19_0.wsAnim = WSAnim.New()

	arg_19_0.wsAnim:Setup()

	arg_19_0.wsTimer = WSTimer.New()

	arg_19_0.wsTimer:Setup()

	arg_19_0.wsDragProxy = WSDragProxy.New()
	arg_19_0.wsDragProxy.transform = arg_19_0.rtDragLayer
	arg_19_0.wsDragProxy.wsTimer = arg_19_0.wsTimer

	arg_19_0.wsDragProxy:Setup({
		clickCall = function(arg_24_0, arg_24_1)
			if arg_19_0.svScannerPanel:isShowing() then
				local var_24_0, var_24_1 = arg_19_0:CheckScannerEnable(arg_19_0:ScreenPos2MapPos(arg_24_1.position))

				if var_24_0 then
					arg_19_0.svScannerPanel:ActionInvoke("DisplayWindow", var_24_0, var_24_1)
				else
					arg_19_0.svScannerPanel:ActionInvoke("HideWindow")
				end
			else
				arg_19_0:OnClickMap(arg_19_0:ScreenPos2MapPos(arg_24_1.position))
			end
		end,
		longPressCall = function()
			arg_19_0:OnLongPressMap(arg_19_0:ScreenPos2MapPos(Vector3(Input.mousePosition.x, Input.mousePosition.y)))
		end
	})

	arg_19_0.wsMapCamera = WSMapCamera.New()
	arg_19_0.wsMapCamera.camera = arg_19_0.camera

	arg_19_0.wsMapCamera:Setup()
	arg_19_0:InitSubView()
	arg_19_0:AddWorldListener()

	arg_19_0.moveQueue = {}
	arg_19_0.achievedList = {}
	arg_19_0.mapOps = {}
	arg_19_0.wsCommands = {}

	WSCommand.Bind(arg_19_0)
	arg_19_0:OpOpen()
end

function var_0_0.InitSubView(arg_26_0)
	arg_26_0.rtPanelList = arg_26_0._tf:Find("panel_list")
	arg_26_0.svOrderPanel = SVOrderPanel.New(arg_26_0.rtPanelList, arg_26_0.event, {
		wsPool = arg_26_0.wsPool
	})
	arg_26_0.svScannerPanel = SVScannerPanel.New(arg_26_0.rtPanelList, arg_26_0.event)

	arg_26_0:bind(SVScannerPanel.ShowView, function(arg_27_0)
		arg_26_0.wsMap:ShowScannerMap(true)
		setActive(arg_26_0.wsMap.rtTop, false)
		arg_26_0:HideMapUI()
	end)
	arg_26_0:bind(SVScannerPanel.HideView, function(arg_28_0)
		arg_26_0.wsMap:ShowScannerMap(false)
		setActive(arg_26_0.wsMap.rtTop, true)
		arg_26_0:DisplayMapUI()
	end)
	arg_26_0:bind(SVScannerPanel.HideGoing, function(arg_29_0, arg_29_1, arg_29_2)
		arg_26_0.wsMap:ShowScannerMap(false)
		setActive(arg_26_0.wsMap.rtTop, true)
		arg_26_0:DisplayMapUI()
		arg_26_0:OnClickCell(arg_29_1, arg_29_2)
	end)

	arg_26_0.svRealmPanel = SVRealmPanel.New(arg_26_0.rtPanelList, arg_26_0.event)
	arg_26_0.svAchievement = SVAchievement.New(arg_26_0.rtPanelList, arg_26_0.event)

	arg_26_0:bind(SVAchievement.HideView, function(arg_30_0)
		table.remove(arg_26_0.achievedList, 1)

		return (#arg_26_0.achievedList > 0 and function()
			arg_26_0:ShowSubView("Achievement", arg_26_0.achievedList[1])
		end or function()
			arg_26_0:Op("OpInteractive")
		end)()
	end)

	arg_26_0.svDebugPanel = SVDebugPanel.New(arg_26_0.rtPanelList, arg_26_0.event)
	arg_26_0.svFloatPanel = SVFloatPanel.New(arg_26_0.rtTop, arg_26_0.event)

	arg_26_0:bind(SVFloatPanel.ReturnCall, function(arg_33_0, arg_33_1)
		arg_26_0:Op("OpCall", function(arg_34_0)
			arg_34_0()

			local var_34_0 = nowWorld():GetActiveEntrance()

			if arg_33_1.id == var_34_0.id then
				arg_26_0.wsAtlas:UpdateSelect()
				arg_26_0.wsAtlas:UpdateSelect(arg_33_1)
			else
				arg_26_0:ClickAtlas(var_34_0)
			end
		end)
	end)
	arg_26_0:bind(SVFloatPanel.DelegateCall, function(arg_35_0, arg_35_1)
		local var_35_0, var_35_1 = nowWorld():CanDelegate()

		if not var_35_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n(var_35_1))

			return
		end

		arg_26_0.svSingleDelegatePanel:ExecuteAction("Show", arg_35_1)
	end)

	arg_26_0.svPoisonPanel = SVPoisonPanel.New(arg_26_0.rtPanelList, arg_26_0.event)
	arg_26_0.svGlobalBuff = SVGlobalBuff.New(arg_26_0.rtPanelList, arg_26_0.event)

	arg_26_0:bind(SVGlobalBuff.HideView, function(arg_36_0, arg_36_1)
		return existCall(arg_36_1)
	end)

	arg_26_0.svBossProgress = SVBossProgress.New(arg_26_0.rtPanelList, arg_26_0.event)

	arg_26_0:bind(SVBossProgress.HideView, function(arg_37_0, arg_37_1)
		return existCall(arg_37_1)
	end)

	arg_26_0.svSalvageResult = SVSalvageResult.New(arg_26_0.rtPanelList, arg_26_0.event)
	arg_26_0.svDelegatePanel = ChapterAutoPanelTypeWorld.New(arg_26_0.rtPanelList, arg_26_0.event)

	arg_26_0.svDelegatePanel:RegisterView(arg_26_0)

	arg_26_0.svSingleDelegatePanel = ChapterAutoPanelTypeWorldSingle.New(arg_26_0.rtPanelList, arg_26_0.event)

	arg_26_0.svSingleDelegatePanel:RegisterView(arg_26_0)
end

function var_0_0.didEnter(arg_38_0)
	arg_38_0:OverlayPanel(arg_38_0.rtTop)

	arg_38_0.warningSairen = not arg_38_0.contextData.inSave

	if getProxy(ChapterAutoProxy):HasTypeCommission(ChapterAutoProxy.TYPE.WORLD) or arg_38_0.contextData.inWorld then
		arg_38_0:Op("OpSetInMap", false, function()
			arg_38_0.wsAtlas:UpdateSelect(nowWorld():GetActiveEntrance())
		end)
	else
		arg_38_0:Op("OpSetInMap", true)
	end
end

function var_0_0.onBackPressed(arg_40_0)
	if arg_40_0.inCutIn then
		return
	elseif arg_40_0.svDebugPanel:isShowing() then
		arg_40_0:HideSubView("DebugPanel")
	elseif arg_40_0.svAchievement:isShowing() then
		arg_40_0:HideSubView("Achievement")
	elseif arg_40_0.svGlobalBuff:isShowing() then
		arg_40_0:HideSubView("GlobalBuff")
	elseif arg_40_0.svBossProgress:isShowing() then
		arg_40_0:HideSubView("BossProgress")
	elseif arg_40_0.svOrderPanel:isShowing() then
		arg_40_0:HideSubView("OrderPanel")
	elseif arg_40_0.svScannerPanel:isShowing() then
		arg_40_0:HideSubView("ScannerPanel")
	elseif arg_40_0.svPoisonPanel:isShowing() then
		arg_40_0:HideSubView("PoisonPanel")
	elseif arg_40_0.svSalvageResult:isShowing() then
		arg_40_0:HideSubView("SalvageResult")
	elseif arg_40_0.svDelegatePanel:isShowing() then
		arg_40_0:HideSubView("DelegatePanel")
	elseif arg_40_0.svSingleDelegatePanel:isShowing() then
		arg_40_0:HideSubView("SingleDelegatePanel")
	elseif arg_40_0.wsMapLeft and isActive(arg_40_0.wsMapLeft.toggleMask) then
		arg_40_0.wsMapLeft:HideToggleMask()
	elseif not arg_40_0:GetInMap() then
		triggerButton(arg_40_0.rtTopAtlas:Find("back_button"))
	else
		triggerButton(arg_40_0.wsMapTop.btnBack)
	end
end

function var_0_0.quickExitFunc(arg_41_0)
	arg_41_0:Op("OpCall", function(arg_42_0)
		arg_42_0()

		local var_42_0 = {}

		if nowWorld():CheckReset() then
			table.insert(var_42_0, function(arg_43_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("world_recycle_notice"),
					onYes = arg_43_0
				})
			end)
		end

		seriesAsync(var_42_0, function()
			var_0_0.super.quickExitFunc(arg_41_0)
		end)
	end)
end

function var_0_0.ExitWorld(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = {}

	if not arg_45_2 then
		table.insert(var_45_0, function(arg_46_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_exit_tip"),
				onYes = arg_46_0,
				onNo = function()
					return existCall(arg_45_1)
				end
			})
		end)
	end

	if not arg_45_2 and nowWorld():CheckReset() then
		table.insert(var_45_0, function(arg_48_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_recycle_notice"),
				onYes = arg_48_0,
				onNo = function()
					return existCall(arg_45_1)
				end
			})
		end)
	end

	table.insert(var_45_0, function(arg_50_0)
		if arg_45_0:GetInMap() then
			arg_45_0:EaseOutMapUI(arg_50_0)
		else
			arg_45_0:EaseOutAtlasUI(arg_50_0)
		end
	end)
	seriesAsync(var_45_0, function()
		existCall(arg_45_1)
		arg_45_0:closeView()
	end)
end

function var_0_0.SaveState(arg_52_0)
	arg_52_0.contextData.inSave = true
	arg_52_0.contextData.inWorld = arg_52_0:GetInMap() == false
	arg_52_0.contextData.inShop = false
	arg_52_0.contextData.inPort = false
end

function var_0_0.willExit(arg_53_0)
	arg_53_0:SaveState()
	arg_53_0:RemoveWorldListener()
	arg_53_0:UnOverlayPanel(arg_53_0.rtTop, arg_53_0._tf)
	arg_53_0.svOrderPanel:Destroy()
	arg_53_0.svScannerPanel:Destroy()
	arg_53_0.svAchievement:Destroy()
	arg_53_0.svRealmPanel:Destroy()
	arg_53_0.svDebugPanel:Destroy()
	arg_53_0.svFloatPanel:Destroy()
	arg_53_0.svPoisonPanel:Destroy()
	arg_53_0.svGlobalBuff:Destroy()
	arg_53_0.svBossProgress:Destroy()
	arg_53_0.svDelegatePanel:Destroy()
	arg_53_0.svSingleDelegatePanel:Destroy()
	arg_53_0:DisposeAtlas()
	arg_53_0:DisposeAtlasUI()
	arg_53_0:DisposeMap()
	arg_53_0:DisposeMapUI()
	arg_53_0.wsPool:Dispose()

	arg_53_0.wsPool = nil

	arg_53_0.wsAnim:Dispose()

	arg_53_0.wsAnim = nil

	arg_53_0.wsTimer:Dispose()

	arg_53_0.wsTimer = nil

	arg_53_0.wsDragProxy:Dispose()

	arg_53_0.wsDragProxy = nil

	arg_53_0.wsMapCamera:Dispose()

	arg_53_0.wsMapCamera = nil

	arg_53_0.resAtlas:exit()

	arg_53_0.resAtlas = nil

	arg_53_0.resMap:exit()

	arg_53_0.resMap = nil

	arg_53_0:VerifyMapOp()
	arg_53_0:OpDispose()
	WSCommand.Unbind(arg_53_0)
	WBank:Recycle(WorldMapOp)
end

function var_0_0.SetPlayer(arg_54_0, arg_54_1)
	arg_54_0.player = arg_54_1

	arg_54_0.resAtlas:setPlayer(arg_54_0.player)
	arg_54_0.resMap:setPlayer(arg_54_0.player)
end

function var_0_0.AddWorldListener(arg_55_0)
	local var_55_0 = nowWorld()

	var_55_0:AddListener(World.EventUpdateProgress, arg_55_0.onUpdateProgress)
	var_55_0:GetTaskProxy():AddListener(WorldTaskProxy.EventUpdateDailyTaskIds, arg_55_0.onUpdateDaily)
end

function var_0_0.RemoveWorldListener(arg_56_0)
	local var_56_0 = nowWorld()

	var_56_0:RemoveListener(World.EventUpdateProgress, arg_56_0.onUpdateProgress)
	var_56_0:GetTaskProxy():RemoveListener(WorldTaskProxy.EventUpdateDailyTaskIds, arg_56_0.onUpdateDaily)
end

function var_0_0.SetInMap(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_1 then
		arg_57_2 = defaultValue(arg_57_2, function()
			arg_57_0:Op("OpInteractive")
		end)
	end

	if arg_57_0.inMap == arg_57_1 then
		return existCall(arg_57_2)
	end

	local var_57_0 = {}
	local var_57_1 = {}

	arg_57_0:StopAnim()

	if arg_57_0.inMap then
		table.insert(var_57_0, function(arg_59_0)
			arg_57_0:Op("OpSwitchOutMap", arg_59_0)
		end)
	elseif arg_57_0.inMap ~= nil then
		table.insert(var_57_0, function(arg_60_0)
			arg_57_0:Op("OpSwitchOutWorld", arg_60_0)
		end)
	end

	table.insert(var_57_0, function(arg_61_0)
		arg_57_0:Op("OpCall", function(arg_62_0)
			parallelAsync(var_57_1, function()
				arg_62_0()

				return arg_61_0()
			end)
		end)
	end)
	table.insert(var_57_1, function(arg_64_0)
		arg_57_0:DisplayEnv(arg_64_0)
	end)
	table.insert(var_57_1, function(arg_65_0)
		arg_57_0:LoadMap(nowWorld():GetActiveMap(), arg_65_0)
	end)

	if arg_57_1 then
		table.insert(var_57_0, function(arg_66_0)
			arg_57_0:Op("OpSwitchInMap", arg_66_0)
		end)
	else
		table.insert(var_57_1, function(arg_67_0)
			arg_57_0:LoadAtlas(arg_67_0)
		end)
		table.insert(var_57_0, function(arg_68_0)
			arg_57_0:Op("OpSwitchInWorld", arg_68_0)
		end)
		table.insert(var_57_0, function(arg_69_0)
			arg_57_0:CheckGuideWorld(arg_69_0)
		end)
	end

	table.insert(var_57_0, function(arg_70_0)
		arg_57_0:PlayBGM()
		arg_70_0()
	end)

	arg_57_0.inMap = arg_57_1

	seriesAsync(var_57_0, arg_57_2)
end

function var_0_0.CheckGuideWorld(arg_71_0, arg_71_1)
	local var_71_0 = nowWorld()
	local var_71_1 = {}

	table.insert(var_71_1, {
		"CHAPTER_AUTO_WORLD_GUIDE",
		function()
			return var_71_0:CanDelegate()
		end
	})

	local var_71_2 = pg.NewStoryMgr.GetInstance()

	for iter_71_0, iter_71_1 in ipairs(var_71_1) do
		if not var_71_2:IsPlayed(iter_71_1[1]) and iter_71_1[2]() then
			return WorldGuider.GetInstance():PlayGuide(iter_71_1[1], nil, arg_71_1)
		end
	end

	existCall(arg_71_1)
end

function var_0_0.GetInMap(arg_73_0)
	return arg_73_0.inMap
end

function var_0_0.ShowSubView(arg_74_0, arg_74_1, arg_74_2, arg_74_3)
	local var_74_0 = arg_74_0["sv" .. arg_74_1]

	var_74_0:Load()
	var_74_0:ActionInvoke("Setup", unpack(arg_74_2 or {}))
	var_74_0:ActionInvoke("Show", unpack(arg_74_3 or {}))
end

function var_0_0.HideSubView(arg_75_0, arg_75_1, ...)
	arg_75_0["sv" .. arg_75_1]:ActionInvoke("Hide", ...)
end

function var_0_0.DisplayAtlasUI(arg_76_0)
	arg_76_0:DisplayAtlasTop()
	arg_76_0:DisplayAtlasRight()
	arg_76_0:DisplayAtlasBottom()
	arg_76_0:UpdateSystemOpen()
end

function var_0_0.HideAtlasUI(arg_77_0)
	arg_77_0:HideAtlasTop()
	arg_77_0:HideAtlasRight()
	arg_77_0:HideAtlasBottom()
end

function var_0_0.EaseInAtlasUI(arg_78_0, arg_78_1)
	arg_78_0:CancelAtlasUITween()
	parallelAsync({
		function(arg_79_0)
			setAnchoredPosition(arg_78_0.rtTopAtlas, {
				y = arg_78_0.rtTopAtlas.rect.height
			})
			arg_78_0.wsTimer:AddTween(LeanTween.moveY(arg_78_0.rtTopAtlas, 0, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(arg_79_0)).uniqueId)
		end,
		function(arg_80_0)
			setAnchoredPosition(arg_78_0.rtBottomAtlas, {
				y = -arg_78_0.rtBottomAtlas.rect.height
			})
			arg_78_0.wsTimer:AddTween(LeanTween.moveY(arg_78_0.rtBottomAtlas, 0, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(arg_80_0)).uniqueId)
		end,
		function(arg_81_0)
			setAnchoredPosition(arg_78_0.rtRightAtlas, {
				x = arg_78_0.rtRightAtlas.rect.width
			})
			arg_78_0.wsTimer:AddTween(LeanTween.moveX(arg_78_0.rtRightAtlas, 0, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(arg_81_0)).uniqueId)
		end
	}, function()
		return existCall(arg_78_1)
	end)
end

function var_0_0.EaseOutAtlasUI(arg_83_0, arg_83_1)
	arg_83_0:CancelAtlasUITween()
	parallelAsync({
		function(arg_84_0)
			setAnchoredPosition(arg_83_0.rtTopAtlas, {
				y = 0
			})
			arg_83_0.wsTimer:AddTween(LeanTween.moveY(arg_83_0.rtTopAtlas, arg_83_0.rtTopAtlas.rect.height, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeOutSine):setOnComplete(System.Action(arg_84_0)).uniqueId)
		end,
		function(arg_85_0)
			setAnchoredPosition(arg_83_0.rtBottomAtlas, {
				y = 0
			})
			arg_83_0.wsTimer:AddTween(LeanTween.moveY(arg_83_0.rtBottomAtlas, -arg_83_0.rtBottomAtlas.rect.height, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeOutSine):setOnComplete(System.Action(arg_85_0)).uniqueId)
		end,
		function(arg_86_0)
			setAnchoredPosition(arg_83_0.rtRightAtlas, {
				x = 0
			})
			arg_83_0.wsTimer:AddTween(LeanTween.moveX(arg_83_0.rtRightAtlas, arg_83_0.rtRightAtlas.rect.width, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeOutSine):setOnComplete(System.Action(arg_86_0)).uniqueId)
		end
	}, function()
		return existCall(arg_83_1)
	end)
end

function var_0_0.CancelAtlasUITween(arg_88_0)
	LeanTween.cancel(go(arg_88_0.rtTransportAtlas))
	LeanTween.cancel(go(arg_88_0.rtTopAtlas))
	LeanTween.cancel(go(arg_88_0.rtBottomAtlas))
	LeanTween.cancel(go(arg_88_0.rtRightAtlas))
end

function var_0_0.DisposeAtlasUI(arg_89_0)
	arg_89_0:HideAtlasUI()
	arg_89_0:DisposeAtlasTransport()
	arg_89_0:DisposeAtlasTop()
	arg_89_0:DisposeAtlasRight()
	arg_89_0:DisposeAtlasBottom()
end

function var_0_0.DisplayAtlas(arg_90_0)
	local var_90_0 = nowWorld():GetActiveEntrance()

	arg_90_0.wsAtlas:SwitchArea(var_90_0:GetAreaId())
	arg_90_0.wsAtlas:UpdateActiveMark()
	arg_90_0.wsAtlas:ShowOrHide(true)
end

function var_0_0.HideAtlas(arg_91_0)
	arg_91_0.wsAtlas:UpdateSelect()
	arg_91_0.wsAtlas:ShowOrHide(false)
end

function var_0_0.ClickAtlas(arg_92_0, arg_92_1)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)

	local var_92_0 = arg_92_1:GetAreaId()

	if not nowWorld():CheckAreaUnlock(var_92_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("area_lock"))

		return
	end

	if arg_92_0.wsAtlas.nowArea then
		arg_92_0.wsAtlas:UpdateSelect()

		if arg_92_0.wsAtlas.selectEntrance ~= arg_92_1 then
			arg_92_0.wsAtlas:UpdateSelect(arg_92_1)
		end
	else
		arg_92_0:EnterToModelMap(var_92_0)
	end
end

function var_0_0.LoadAtlas(arg_93_0, arg_93_1)
	local var_93_0 = {}

	if not arg_93_0.wsAtlas then
		table.insert(var_93_0, function(arg_94_0)
			arg_93_0:downloadWorldResList(arg_93_0:getAtlasResList(), arg_94_0)
		end)
		table.insert(var_93_0, function(arg_95_0)
			arg_93_0.wsAtlas = arg_93_0:NewAtlas()

			arg_93_0.wsAtlas:LoadScene(function()
				arg_93_0.wsAtlas:AddListener(WSAtlasWorld.EventUpdateselectEntrance, arg_93_0.onModelSelectMap)
				arg_93_0.wsAtlas:UpdateAtlas(nowWorld():GetAtlas())

				return arg_95_0()
			end)
		end)
	end

	seriesAsync(var_93_0, arg_93_1)
end

function var_0_0.NewAtlas(arg_97_0)
	local var_97_0 = WSAtlasWorld.New()

	var_97_0.wsTimer = arg_97_0.wsTimer

	function var_97_0.onClickColor(arg_98_0, arg_98_1)
		if arg_97_0.wsAtlas:CheckIsTweening() then
			return
		end

		arg_97_0:Op("OpCall", function(arg_99_0)
			arg_99_0()
			arg_97_0:ClickAtlas(arg_98_0)
		end)
	end

	var_97_0:Setup()

	return var_97_0
end

function var_0_0.DisposeAtlas(arg_100_0)
	if arg_100_0.wsAtlas then
		arg_100_0:HideAtlas()
		arg_100_0.wsAtlas:RemoveListener(WSAtlasWorld.EventUpdateselectEntrance, arg_100_0.onModelSelectMap)
		arg_100_0.wsAtlas:Dispose()

		arg_100_0.wsAtlas = nil
	end
end

function var_0_0.DisplayAtlasTop(arg_101_0)
	arg_101_0.wsAtlasTop = arg_101_0.wsAtlasTop or arg_101_0:NewAtlasTop(arg_101_0.rtTopAtlas)

	setActive(arg_101_0.rtTopAtlas, true)
	setActive(arg_101_0.rtTopAtlas:Find("print/title_world"), true)
	setActive(arg_101_0.rtTopAtlas:Find("print/title_view"), false)
	setActive(arg_101_0.rtTopAtlas:Find("sairen_warning"), arg_101_0.warningSairen and #nowWorld():GetAtlas().sairenEntranceList > 0)

	arg_101_0.warningSairen = false
end

function var_0_0.UpdateDelegateDisplay(arg_102_0)
	if arg_102_0.svDelegatePanel:isShowing() then
		arg_102_0:HideSubView("DelegatePanel")
	end

	if arg_102_0.svSingleDelegatePanel:isShowing() then
		arg_102_0:HideSubView("SingleDelegatePanel")
	end

	if arg_102_0.wsAtlasRight then
		arg_102_0.wsAtlasRight:UpdateDelegate()
	end

	if arg_102_0.svFloatPanel:isShowing() then
		arg_102_0.svFloatPanel:UpdatePanel()
	end
end

function var_0_0.HideAtlasTop(arg_103_0)
	setActive(arg_103_0.rtTopAtlas, false)
end

function var_0_0.NewAtlasTop(arg_104_0, arg_104_1)
	local var_104_0 = {
		transform = arg_104_1
	}

	onButton(arg_104_0, arg_104_1:Find("back_button"), function()
		if getProxy(ChapterAutoProxy):HasTypeCommission(ChapterAutoProxy.TYPE.WORLD) then
			arg_104_0:Op("OpCall", function(arg_106_0)
				arg_104_0:ExitWorld(arg_106_0)
			end)
		else
			arg_104_0:Op("OpCall", function(arg_107_0)
				arg_107_0()
				arg_104_0:BackToMap()
			end)
		end
	end, SFX_CANCEL)

	return var_104_0
end

function var_0_0.DisposeAtlasTop(arg_108_0)
	arg_108_0.wsAtlasTop = nil
end

function var_0_0.DisplayAtlasRight(arg_109_0)
	arg_109_0.wsAtlasRight = arg_109_0.wsAtlasRight or arg_109_0:NewAtlasRight(arg_109_0.rtRightAtlas)

	arg_109_0.wsAtlasRight:SetOverSize(arg_109_0.rtTop:Find("adapt").offsetMax.x)
	setActive(arg_109_0.rtRightAtlas, true)
end

function var_0_0.HideAtlasRight(arg_110_0)
	setActive(arg_110_0.rtRightAtlas, false)
end

function var_0_0.NewAtlasRight(arg_111_0, arg_111_1, arg_111_2)
	local var_111_0 = WSAtlasRight.New()

	var_111_0.transform = arg_111_1

	var_111_0:Setup()
	onButton(arg_111_0, var_111_0.btnSettings, function()
		arg_111_0:Op("OpOpenScene", SCENE.SETTINGS, {
			scroll = "world_settings",
			page = NewSettingsScene.PAGE_OPTION
		})
	end, SFX_PANEL)
	onButton(arg_111_0, var_111_0.btnSwitch, function()
		if getProxy(ChapterAutoProxy):IsCommissionDoing() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_auto_plan_error_tip1"))

			return
		end

		arg_111_0:Op("OpOpenLayer", Context.New({
			mediator = WorldSwitchPlanningMediator,
			viewComponent = WorldSwitchPlanningLayer
		}))
	end, SFX_CONFIRM)
	onButton(arg_111_0, var_111_0.btnDelegate, function()
		local var_114_0, var_114_1 = nowWorld():CanDelegate()

		if not var_114_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n(var_114_1))

			return
		end

		arg_111_0.svDelegatePanel:ExecuteAction("Show")
	end, SFX_PANEL)
	onButton(arg_111_0, var_111_0.btnDeleCancel, function()
		arg_111_0:emit(WorldMediator.OnFinishDelegate)
	end, SFX_CANCEL)
	onButton(arg_111_0, var_111_0.btnDeleConfirm, function()
		arg_111_0:emit(WorldMediator.OnFinishDelegate)
	end, SFX_CONFIRM)

	return var_111_0
end

function var_0_0.DisposeAtlasRight(arg_117_0)
	if arg_117_0.wsAtlasRight then
		arg_117_0.wsAtlasRight:Dispose()

		arg_117_0.wsAtlasRight = nil
	end
end

function var_0_0.DisplayAtlasBottom(arg_118_0)
	arg_118_0.wsAtlasBottom = arg_118_0.wsAtlasBottom or arg_118_0:NewAtlasBottom(arg_118_0.rtBottomAtlas)

	arg_118_0.wsAtlasBottom:SetOverSize(arg_118_0.rtTop:Find("adapt").offsetMax.x)
	arg_118_0.wsAtlasBottom:UpdateScale(1)
	setActive(arg_118_0.rtBottomAtlas, true)
	setActive(arg_118_0.wsAtlasBottom.btnDailyTask:Find("tip"), nowWorld():GetTaskProxy():canAcceptDailyTask())
end

function var_0_0.HideAtlasBottom(arg_119_0)
	setActive(arg_119_0.rtBottomAtlas, false)
end

function var_0_0.NewAtlasBottom(arg_120_0, arg_120_1)
	local var_120_0 = WSAtlasBottom.New()

	var_120_0.transform = arg_120_1
	var_120_0.wsTimer = arg_120_0.wsTimer

	var_120_0:Setup()

	if CAMERA_MOVE_OPEN then
		var_120_0:AddListener(WSAtlasBottom.EventUpdateScale, arg_120_0.onUpdateScale)
	end

	onButton(arg_120_0, var_120_0.btnOverview, function()
		if arg_120_0.wsAtlas:CheckIsTweening() then
			return
		end

		arg_120_0:Op("OpCall", function(arg_122_0)
			arg_120_0.wsAtlas:LoadModel(function()
				arg_122_0()
				arg_120_0:ReturnToModelArea()
			end)
		end)
	end, SFX_PANEL)
	onButton(arg_120_0, var_120_0.btnBoss, function()
		if nowWorld():GetBossProxy():IsOpen() then
			arg_120_0:Op("OpOpenScene", SCENE.WORLDBOSS)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		end
	end, SFX_PANEL)
	onButton(arg_120_0, var_120_0.btnShop, function()
		arg_120_0:Op("OpOpenLayer", Context.New({
			mediator = WorldShopMediator,
			viewComponent = WorldShopLayer
		}))
	end, SFX_PANEL)
	onButton(arg_120_0, var_120_0.btnCollection, function()
		arg_120_0:Op("OpOpenScene", SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_RECORD
		})
	end, SFX_PANEL)
	onButton(arg_120_0, var_120_0.btnDailyTask, function()
		local var_127_0 = nowWorld()

		if var_127_0:IsSystemOpen(WorldConst.SystemDailyTask) then
			var_127_0:GetTaskProxy():checkDailyTask(function()
				arg_120_0:Op("OpOpenLayer", Context.New({
					mediator = WorldDailyTaskMediator,
					viewComponent = WorldDailyTaskLayer
				}))
			end)
		else
			pg.TipsMgr.GetInstance(i18n("world_daily_task_lock"))
		end
	end, SFX_PANEL)

	return var_120_0
end

function var_0_0.DisposeAtlasBottom(arg_129_0)
	if arg_129_0.wsAtlasBottom then
		arg_129_0.wsAtlasBottom:Dispose()

		arg_129_0.wsAtlasBottom = nil
	end
end

function var_0_0.DisplayAtlasTransport(arg_130_0)
	arg_130_0.wsAtlasTransport = arg_130_0.wsAtlasTransport or arg_130_0:NewAtlasTransport(arg_130_0.rtTransportAtlas)

	setActive(arg_130_0.rtTransportAtlas, true)
end

function var_0_0.HideAtlasTransport(arg_131_0)
	setActive(arg_131_0.rtTransportAtlas, false)
end

function var_0_0.NewAtlasTransport(arg_132_0, arg_132_1)
	local var_132_0 = {
		transform = arg_132_1,
		btnBack = arg_132_1:Find("adapt/btn_back")
	}

	onButton(arg_132_0, var_132_0.btnBack, function()
		assert(arg_132_0.inTransportMode, "this isn't transport mode atlas")
		arg_132_0:BackToMap()
	end, SFX_CANCEL)

	return var_132_0
end

function var_0_0.DisposeAtlasTransport(arg_134_0)
	arg_134_0.wsAtlasTransport = nil
end

function var_0_0.DisplayMapUI(arg_135_0)
	arg_135_0:DisplayMapTop()
	arg_135_0:DisplayMapLeft()
	arg_135_0:DisplayMapRight()
	arg_135_0:DisplayMapOut()
	arg_135_0:UpdateSystemOpen()
end

function var_0_0.HideMapUI(arg_136_0)
	arg_136_0:HideMapTop()
	arg_136_0:HideMapLeft()
	arg_136_0:HideMapRight()
	arg_136_0:HideMapOut()
end

function var_0_0.UpdateMapUI(arg_137_0)
	local var_137_0 = nowWorld()
	local var_137_1 = var_137_0:GetActiveEntrance()
	local var_137_2 = var_137_0:GetActiveMap()

	arg_137_0.wsMapTop:Update(var_137_1, var_137_2)
	arg_137_0.wsMapLeft:UpdateMap(var_137_2)
	arg_137_0.wsMapRight:Update(var_137_1, var_137_2)
	arg_137_0.wsMapOut:UpdateMap(var_137_2)
end

function var_0_0.EaseInMapUI(arg_138_0, arg_138_1)
	arg_138_0:CancelMapUITween()
	parallelAsync({
		function(arg_139_0)
			setAnchoredPosition(arg_138_0.rtTopMap, {
				y = arg_138_0.rtTopMap.rect.height
			})
			arg_138_0.wsTimer:AddTween(LeanTween.moveY(arg_138_0.rtTopMap, 0, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(arg_139_0)).uniqueId)
		end,
		function(arg_140_0)
			setAnchoredPosition(arg_138_0.rtLeftMap, {
				x = -arg_138_0.rtLeftMap.rect.width
			})
			arg_138_0.wsTimer:AddTween(LeanTween.moveX(arg_138_0.rtLeftMap, 0, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(arg_140_0)).uniqueId)
		end,
		function(arg_141_0)
			setAnchoredPosition(arg_138_0.rtRightMap, {
				x = arg_138_0.rtRightMap.rect.width
			})
			arg_138_0.wsTimer:AddTween(LeanTween.moveX(arg_138_0.rtRightMap, 0, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(arg_141_0)).uniqueId)
		end
	}, function()
		return existCall(arg_138_1)
	end)
end

function var_0_0.EaseOutMapUI(arg_143_0, arg_143_1)
	arg_143_0:CancelMapUITween()
	parallelAsync({
		function(arg_144_0)
			setAnchoredPosition(arg_143_0.rtTopMap, {
				y = 0
			})
			arg_143_0.wsTimer:AddTween(LeanTween.moveY(arg_143_0.rtTopMap, arg_143_0.rtTopMap.rect.height, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeOutSine):setOnComplete(System.Action(arg_144_0)).uniqueId)
		end,
		function(arg_145_0)
			setAnchoredPosition(arg_143_0.rtLeftMap, {
				x = 0
			})
			arg_143_0.wsTimer:AddTween(LeanTween.moveX(arg_143_0.rtLeftMap, -arg_143_0.rtLeftMap.rect.width, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeOutSine):setOnComplete(System.Action(arg_145_0)).uniqueId)
		end,
		function(arg_146_0)
			setAnchoredPosition(arg_143_0.rtRightMap, {
				x = 0
			})
			arg_143_0.wsTimer:AddTween(LeanTween.moveX(arg_143_0.rtRightMap, arg_143_0.rtRightMap.rect.width, WorldConst.UIEaseFasterDuration):setEase(LeanTweenType.easeOutSine):setOnComplete(System.Action(arg_146_0)).uniqueId)
		end
	}, function()
		return existCall(arg_143_1)
	end)
end

function var_0_0.CancelMapUITween(arg_148_0)
	LeanTween.cancel(go(arg_148_0.rtTopMap))
	LeanTween.cancel(go(arg_148_0.rtLeftMap))
	LeanTween.cancel(go(arg_148_0.rtRightMap))
end

function var_0_0.DisposeMapUI(arg_149_0)
	arg_149_0:DisposeMapTop()
	arg_149_0:DisposeMapLeft()
	arg_149_0:DisposeMapRight()
	arg_149_0:DisposeMapOut()
end

function var_0_0.DisplayMap(arg_150_0)
	setActive(arg_150_0.rtUIMain, true)
end

function var_0_0.HideMap(arg_151_0)
	setActive(arg_151_0.rtUIMain, false)
end

function var_0_0.ShowMargin(arg_152_0, arg_152_1)
	if arg_152_0.wsMap then
		arg_152_0.wsMap:UpdateTransportDisplay(arg_152_1)
	end
end

function var_0_0.LoadMap(arg_153_0, arg_153_1, arg_153_2)
	assert(arg_153_1, "target map not exist.")

	local var_153_0 = {}

	if not arg_153_1:IsValid() then
		table.insert(var_153_0, function(arg_154_0)
			arg_153_0:emit(WorldMediator.OnMapReq, arg_153_1.id, arg_154_0)
		end)
	end

	seriesAsync(var_153_0, function()
		if arg_153_0.wsMap then
			return existCall(arg_153_2)
		else
			arg_153_0:downloadWorldResList(arg_153_0:getMapResList(arg_153_1), function()
				arg_153_1:AddListener(WorldMap.EventUpdateActive, arg_153_0.onDisposeMap)
				arg_153_1:AddListener(WorldMap.EventUpdateMoveSpeed, arg_153_0.onClearMoveQueue)

				arg_153_0.wsMap = arg_153_0:NewMap(arg_153_1)

				arg_153_0.wsMap:Load(function()
					arg_153_0.wsMap.transform:SetParent(arg_153_0.rtDragLayer, false)
					setActive(arg_153_0.wsMap.transform, true)
					arg_153_0:InitMap()

					return existCall(arg_153_2)
				end)
			end)
		end
	end)
end

function var_0_0.InitMap(arg_158_0)
	for iter_158_0, iter_158_1 in ipairs(arg_158_0.wsMap.wsMapFleets) do
		onButton(arg_158_0, iter_158_1.rtRetreat, function()
			arg_158_0:Op("OpReqRetreat", iter_158_1.fleet)
		end, SFX_PANEL)
		iter_158_1:AddListener(WSMapFleet.EventUpdateSelected, arg_158_0.onFleetSelected)
	end

	arg_158_0.wsMap:AddListener(WSMap.EventUpdateEventTips, arg_158_0.onUpdateEventTips)

	local var_158_0 = nowWorld()

	var_158_0:AddListener(World.EventUpdateSubmarineSupport, arg_158_0.onUpdateSubmarineSupport)
	var_158_0:AddListener(World.EventAchieved, arg_158_0.onAchievementAchieved)

	local var_158_1 = arg_158_0.wsMap.map

	arg_158_0.wsDragProxy:UpdateMap(var_158_1)
	arg_158_0.wsDragProxy:Focus(arg_158_0.wsMap:GetFleet().transform.position)
	arg_158_0.wsMapCamera:UpdateMap(var_158_1)
	arg_158_0:OnUpdateSubmarineSupport()
end

function var_0_0.NewMap(arg_160_0, arg_160_1)
	local var_160_0 = WSMap.New()

	var_160_0.wsPool = arg_160_0.wsPool
	var_160_0.wsTimer = arg_160_0.wsTimer

	var_160_0:Setup(arg_160_1)

	arg_160_0.rtGrid.localEulerAngles = Vector3(arg_160_1.theme.angle, 0, 0)

	return var_160_0
end

function var_0_0.DisposeMap(arg_161_0)
	if arg_161_0.wsMap then
		arg_161_0.wsTimer:ClearInMapTimers()
		arg_161_0.wsTimer:ClearInMapTweens()
		arg_161_0:HideMap()

		local var_161_0 = nowWorld()

		var_161_0:RemoveListener(World.EventUpdateSubmarineSupport, arg_161_0.onUpdateSubmarineSupport)
		var_161_0:RemoveListener(World.EventAchieved, arg_161_0.onAchievementAchieved)

		local var_161_1 = arg_161_0.wsMap.map

		var_161_1:RemoveListener(WorldMap.EventUpdateActive, arg_161_0.onDisposeMap)
		var_161_1:RemoveListener(WorldMap.EventUpdateMoveSpeed, arg_161_0.onClearMoveQueue)
		arg_161_0.wsMap:Dispose()

		arg_161_0.wsMap = nil
	end
end

function var_0_0.OnDisposeMap(arg_162_0, arg_162_1, arg_162_2)
	local var_162_0 = false

	if arg_162_1 == WorldMap.EventUpdateActive then
		var_162_0 = not arg_162_2.active
	end

	if var_162_0 then
		arg_162_0:DisposeMap()
	end
end

function var_0_0.DisplayMapTop(arg_163_0)
	arg_163_0.wsMapTop = arg_163_0.wsMapTop or arg_163_0:NewMapTop(arg_163_0.rtTopMap)

	setActive(arg_163_0.rtTopMap, true)
end

function var_0_0.HideMapTop(arg_164_0)
	setActive(arg_164_0.rtTopMap, false)
end

function var_0_0.NewMapTop(arg_165_0, arg_165_1)
	local var_165_0 = WSMapTop.New()

	var_165_0.transform = arg_165_1

	var_165_0:Setup()

	function var_165_0.cmdSkillFunc(arg_166_0)
		arg_165_0:emit(WorldMediator.OnOpenLayer, Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				isWorld = true,
				skill = arg_166_0
			}
		}))
	end

	function var_165_0.poisonFunc(arg_167_0)
		arg_165_0:ShowSubView("PoisonPanel", {
			arg_167_0
		})
	end

	onButton(arg_165_0, var_165_0.btnBack, function()
		arg_165_0:Op("OpCall", function(arg_169_0)
			arg_165_0:ExitWorld(arg_169_0)
		end)
	end, SFX_CANCEL)

	return var_165_0
end

function var_0_0.DisposeMapTop(arg_170_0)
	if arg_170_0.wsMapTop then
		arg_170_0:HideMapTop()
		arg_170_0.wsMapTop:Dispose()

		arg_170_0.wsMapTop = nil
	end
end

function var_0_0.DisplayMapLeft(arg_171_0)
	arg_171_0.wsMapLeft = arg_171_0.wsMapLeft or arg_171_0:NewMapLeft(arg_171_0.rtLeftMap)

	setActive(arg_171_0.rtLeftMap, true)
end

function var_0_0.HideMapLeft(arg_172_0)
	setActive(arg_172_0.rtLeftMap, false)
end

function var_0_0.NewMapLeft(arg_173_0, arg_173_1)
	local var_173_0 = WSMapLeft.New()

	var_173_0.transform = arg_173_1

	var_173_0:Setup()

	function var_173_0.onAgonyClick()
		arg_173_0:Op("OpOpenLayer", Context.New({
			mediator = WorldInventoryMediator,
			viewComponent = WorldInventoryLayer,
			data = {
				currentFleetIndex = nowWorld():GetActiveMap().findex
			}
		}))
	end

	function var_173_0.onLongPress(arg_175_0)
		local var_175_0 = nowWorld():GetFleet(arg_175_0.fleetId):GetShipVOs(true)

		arg_173_0:Op("OpOpenScene", SCENE.SHIPINFO, {
			shipId = arg_175_0.id,
			shipVOs = var_175_0
		})
	end

	function var_173_0.onClickSalvage(arg_176_0)
		arg_173_0:Op("OpCall", function(arg_177_0)
			arg_177_0()
			arg_173_0:ShowSubView("SalvageResult", {
				arg_176_0
			})
		end)
	end

	var_173_0:AddListener(WSMapLeft.EventSelectFleet, arg_173_0.onSelectFleet)

	return var_173_0
end

function var_0_0.DisposeMapLeft(arg_178_0)
	if arg_178_0.wsMapLeft then
		arg_178_0:HideMapLeft()
		arg_178_0.wsMapLeft:RemoveListener(WSMapLeft.EventSelectFleet, arg_178_0.onSelectFleet)
		arg_178_0.wsMapLeft:Dispose()

		arg_178_0.wsMapLeft = nil
	end
end

function var_0_0.DisplayMapRight(arg_179_0)
	arg_179_0.wsMapRight = arg_179_0.wsMapRight or arg_179_0:NewMapRight(arg_179_0.rtRightMap)

	setActive(arg_179_0.rtRightMap, true)
	arg_179_0:UpdateAutoFightDisplay()
	arg_179_0:UpdateAutoSwitchDisplay()
end

function var_0_0.HideMapRight(arg_180_0)
	setActive(arg_180_0.rtRightMap, false)
end

function var_0_0.HideMapRightCompass(arg_181_0)
	return
end

function var_0_0.HideMapRightMemo(arg_182_0)
	return
end

function var_0_0.NewMapRight(arg_183_0, arg_183_1)
	local var_183_0 = WSMapRight.New()

	var_183_0.transform = arg_183_1
	var_183_0.wsPool = arg_183_0.wsPool
	var_183_0.wsTimer = arg_183_0.wsTimer

	var_183_0:Setup()
	var_183_0:OnUpdateInfoBtnTip()
	var_183_0:OnUpdateHelpBtnTip()
	onButton(arg_183_0, var_183_0.btnOrder, function()
		arg_183_0:Op("OpShowOrderPanel")
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnScan, function()
		arg_183_0:Op("OpShowScannerPanel")
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnDefeat, function()
		var_183_0:OnUpdateHelpBtnTip(true)
		arg_183_0:Op("OpOpenLayer", Context.New({
			mediator = WorldHelpMediator,
			viewComponent = WorldHelpLayer,
			data = {
				titleId = 4,
				pageId = 5
			}
		}))
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnDetail, function()
		arg_183_0:Op("OpOpenLayer", Context.New({
			mediator = WorldDetailMediator,
			viewComponent = WorldDetailLayer,
			data = {
				fleetId = nowWorld():GetActiveMap():GetFleet().id
			}
		}))
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnInformation, function()
		arg_183_0:Op("OpOpenLayer", Context.New({
			mediator = WorldInformationMediator,
			viewComponent = WorldInformationLayer,
			data = {
				fleetId = nowWorld():GetActiveMap():GetFleet().id
			}
		}))
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnInventory, function()
		arg_183_0:Op("OpOpenLayer", Context.New({
			mediator = WorldInventoryMediator,
			viewComponent = WorldInventoryLayer,
			data = {
				currentFleetIndex = nowWorld():GetActiveMap().findex
			}
		}))
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnTransport, function()
		arg_183_0:OnClickTransport()
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnPort, function()
		local var_191_0 = nowWorld():GetActiveMap()
		local var_191_1 = var_191_0:GetFleet()

		if var_191_0:GetCell(var_191_1.row, var_191_1.column):ExistEnemy() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_port_inbattle"))

			return
		end

		arg_183_0:Op("OpReqEnterPort")
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnExit, function()
		local var_192_0 = nowWorld():GetActiveMap()
		local var_192_1 = {}

		if var_192_0:CheckFleetSalvage(true) then
			table.insert(var_192_1, function(arg_193_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("world_catsearch_leavemap"),
					onYes = arg_193_0
				})
			end)
		end

		seriesAsync(var_192_1, function()
			arg_183_0:Op("OpReqJumpOut", var_192_0.gid)
		end)
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.btnHelp, function()
		var_183_0:OnUpdateHelpBtnTip(true)
		arg_183_0:Op("OpOpenLayer", Context.New({
			mediator = WorldHelpMediator,
			viewComponent = WorldHelpLayer
		}))
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.toggleAutoFight:Find("off"), function()
		arg_183_0:Op("OpCall", function(arg_197_0)
			arg_197_0()

			local var_197_0 = {}

			if PlayerPrefs.GetInt("first_auto_fight_mark", 0) == 0 then
				table.insert(var_197_0, function(arg_198_0)
					PlayerPrefs.SetInt("first_auto_fight_mark", 1)
					arg_183_0:Op("OpOpenLayer", Context.New({
						mediator = WorldHelpMediator,
						viewComponent = WorldHelpLayer,
						data = {
							titleId = 2,
							pageId = 8
						},
						onRemoved = arg_198_0
					}))
				end)
			end

			local var_197_1 = nowWorld()

			if var_197_1:IsSystemOpen(WorldConst.SystemOrderSubmarine) and PlayerPrefs.GetInt("world_sub_auto_call", 0) == 1 and var_197_1:GetActiveMap():GetConfig("instruction_available")[1] == 1 and var_197_1:CanCallSubmarineSupport() and not var_197_1:IsSubmarineSupporting() then
				local var_197_2 = var_197_1:CalcOrderCost(WorldConst.OpReqSub)

				if var_197_2 <= PlayerPrefs.GetInt("world_sub_call_line", 0) and var_197_2 <= var_197_1.staminaMgr:GetTotalStamina() then
					if var_197_2 > 0 then
						table.insert(var_197_0, function(arg_199_0)
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("world_instruction_submarine_2", setColorStr(var_197_2, COLOR_GREEN)),
								onYes = function()
									PlayerPrefs.SetInt("autoSubIsAcitve" .. AutoSubCommand.GetAutoSubMark(SYSTEM_WORLD), 1)
									arg_183_0:Op("OpReqSub", arg_199_0)
								end,
								onNo = arg_199_0
							})
						end)
					else
						PlayerPrefs.SetInt("autoSubIsAcitve" .. AutoSubCommand.GetAutoSubMark(SYSTEM_WORLD), 1)
						table.insert(var_197_0, function(arg_201_0)
							arg_183_0:Op("OpReqSub", arg_201_0)
						end)
					end
				end
			end

			seriesAsync(var_197_0, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_tip_bigworld_begin"))
				getProxy(MetaCharacterProxy):setMetaTacticsInfoOnStart()
				PlayerPrefs.SetInt("world_skip_precombat", 1)
				PlayerPrefs.SetInt("autoBotIsAcitve" .. AutoBotCommand.GetAutoBotMark(SYSTEM_WORLD), 1)
				var_197_1:TriggerAutoFight(true)
				arg_183_0:Op("OpInteractive")
			end)
		end)
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.toggleAutoFight:Find("on"), function()
		arg_183_0:Op("OpCall", function(arg_204_0)
			arg_204_0()
			nowWorld():TriggerAutoFight(false)
			arg_183_0:Op("OpInteractive")
		end)
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.toggleAutoSwitch:Find("off"), function()
		arg_183_0:Op("OpOpenLayer", Context.New({
			mediator = WorldSwitchPlanningMediator,
			viewComponent = WorldSwitchPlanningLayer
		}))
	end, SFX_PANEL)
	onButton(arg_183_0, var_183_0.toggleAutoSwitch:Find("on"), function()
		arg_183_0:Op("OpCall", function(arg_207_0)
			arg_207_0()
			nowWorld():TriggerAutoFight(false)
			arg_183_0:Op("OpInteractive")
		end)
	end, SFX_PANEL)

	return var_183_0
end

function var_0_0.DisposeMapRight(arg_208_0)
	if arg_208_0.wsMapRight then
		arg_208_0:HideMapRight()
		arg_208_0.wsMapRight:Dispose()

		arg_208_0.wsMapRight = nil
	end
end

function var_0_0.DisplayMapOut(arg_209_0)
	arg_209_0.wsMapOut = arg_209_0.wsMapOut or arg_209_0:NewMapOut(arg_209_0.rtOutMap)

	setActive(arg_209_0.rtOutMap, true)
end

function var_0_0.HideMapOut(arg_210_0)
	setActive(arg_210_0.rtOutMap, false)
end

function var_0_0.NewMapOut(arg_211_0, arg_211_1)
	local var_211_0 = WSMapOut.New()

	var_211_0.transform = arg_211_1

	var_211_0:Setup()

	return var_211_0
end

function var_0_0.DisposeMapOut(arg_212_0)
	if arg_212_0.wsMapOut then
		arg_212_0:HideMapOut()
		arg_212_0.wsMapOut:Dispose()

		arg_212_0.wsMapOut = nil
	end
end

function var_0_0.OnUpdateProgress(arg_213_0, arg_213_1, arg_213_2, arg_213_3, arg_213_4)
	arg_213_0:UpdateSystemOpen()

	if arg_213_0.wsMapRight then
		arg_213_0.wsMapRight:OnUpdateHelpBtnTip()
	end
end

function var_0_0.OnUpdateScale(arg_214_0, arg_214_1, arg_214_2, arg_214_3)
	if arg_214_0.wsAtlas and not arg_214_0.wsAtlasBottom:CheckIsTweening() then
		arg_214_0.wsAtlas:UpdateScale(arg_214_3)
	end
end

function var_0_0.OnModelSelectMap(arg_215_0, arg_215_1, arg_215_2, arg_215_3, arg_215_4, arg_215_5)
	if arg_215_3 then
		arg_215_0:ShowSubView("FloatPanel", {
			arg_215_3,
			arg_215_4,
			arg_215_5,
			arg_215_2
		})
	else
		arg_215_0:HideSubView("FloatPanel")
	end
end

function var_0_0.OnUpdateSubmarineSupport(arg_216_0, arg_216_1)
	arg_216_0.wsMap:UpdateSubmarineSupport()

	if arg_216_0.wsMapLeft then
		arg_216_0.wsMapLeft:OnUpdateSubmarineSupport()
	end
end

function var_0_0.OnUpdateDaily(arg_217_0)
	if arg_217_0.wsAtlasBottom then
		setActive(arg_217_0.wsAtlasBottom.btnDailyTask:Find("tip"), nowWorld():GetTaskProxy():canAcceptDailyTask())
	end
end

function var_0_0.OnFleetSelected(arg_218_0, arg_218_1, arg_218_2)
	if arg_218_2.selected then
		arg_218_0.wsDragProxy:Focus(arg_218_2.transform.position, nil, LeanTweenType.easeInOutSine)
	end
end

function var_0_0.OnSelectFleet(arg_219_0, arg_219_1, arg_219_2, arg_219_3)
	if arg_219_3 == nowWorld():GetActiveMap():GetFleet() then
		arg_219_0:Op("OpMoveCamera", 0, 0.1)
	else
		arg_219_0:Op("OpReqSwitchFleet", arg_219_3)
	end
end

function var_0_0.OnClickCell(arg_220_0, arg_220_1, arg_220_2)
	local var_220_0 = nowWorld():GetActiveMap()
	local var_220_1 = var_220_0:GetFleet()
	local var_220_2 = var_220_0:GetCell(arg_220_1, arg_220_2)
	local var_220_3 = var_220_0:FindFleet(var_220_2.row, var_220_2.column)

	if var_220_3 and var_220_3 ~= var_220_1 then
		arg_220_0:Op("OpReqSwitchFleet", var_220_3)
	elseif var_220_0:CheckInteractive() then
		arg_220_0:Op("OpInteractive", true)
	elseif var_220_0:IsSign(arg_220_1, arg_220_2) and ManhattonDist({
		row = var_220_1.row,
		column = var_220_1.column
	}, {
		row = var_220_2.row,
		column = var_220_2.column
	}) <= 1 then
		arg_220_0:Op("OpTriggerSign", var_220_1, var_220_2:GetEventAttachment(), function()
			arg_220_0:Op("OpInteractive")
		end)
	elseif var_220_0:CanLongMove(var_220_1) then
		arg_220_0:Op("OpLongMoveFleet", var_220_1, var_220_2.row, var_220_2.column)
	else
		arg_220_0:Op("OpReqMoveFleet", var_220_1, var_220_2.row, var_220_2.column)
	end
end

function var_0_0.OnClickTransport(arg_222_0)
	if arg_222_0.svScannerPanel:isShowing() then
		return
	end

	arg_222_0:Op("OpCall", function(arg_223_0)
		arg_223_0()
		arg_222_0:QueryTransport(function()
			arg_222_0:EnterTransportWorld()
		end)
	end)
end

function var_0_0.QueryTransport(arg_225_0, arg_225_1)
	local var_225_0 = nowWorld()
	local var_225_1 = var_225_0:GetActiveMap()
	local var_225_2 = {}

	if not var_225_0:IsSystemOpen(WorldConst.SystemOutMap) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))

		return
	end

	if var_225_1:CheckAttachmentTransport() == "story" then
		local var_225_3 = pg.gameset.world_transfer_eventstory.description[1]

		table.insert(var_225_2, function(arg_226_0)
			arg_225_0:OpRaw("OpStory", var_225_3, true, true, false, function(arg_227_0)
				if arg_227_0 == 1 then
					arg_226_0()
				end
			end)
		end)
	end

	if var_225_0:IsSubmarineSupporting() and var_225_1:GetSubmarineFleet():GetAmmo() > 0 then
		table.insert(var_225_2, function(arg_228_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_instruction_submarine_6"),
				onYes = arg_228_0
			})
		end)
	end

	if var_225_1:CheckFleetSalvage(true) then
		table.insert(var_225_2, function(arg_229_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_catsearch_leavemap"),
				onYes = arg_229_0
			})
		end)
	end

	local var_225_4

	for iter_225_0, iter_225_1 in ipairs(var_225_1:GetNormalFleets()) do
		for iter_225_2, iter_225_3 in ipairs(iter_225_1:GetCarries()) do
			if iter_225_3.config.out_story ~= "" then
				var_225_4 = iter_225_3.config.out_story
			end
		end
	end

	if var_225_4 then
		table.insert(var_225_2, function(arg_230_0)
			arg_225_0:OpRaw("OpStory", var_225_4, true, true, false, function(arg_231_0)
				if arg_231_0 == 1 then
					arg_230_0()
				end
			end)
		end)
	end

	local var_225_5, var_225_6 = var_225_1:CkeckTransport()

	if not var_225_5 then
		table.insert(var_225_2, function(arg_232_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = var_225_6,
				onYes = arg_232_0
			})
		end)
	end

	seriesAsync(var_225_2, function()
		return arg_225_1(var_225_5)
	end)
end

function var_0_0.OnUpdateEventTips(arg_234_0, arg_234_1, arg_234_2)
	if arg_234_0.wsMapRight then
		arg_234_0.wsMapRight:OnUpdateEventTips()
	end

	if arg_234_0.wsMapTop then
		arg_234_0.wsMapTop:OnUpdatePoison()
	end
end

function var_0_0.OnClickMap(arg_235_0, arg_235_1, arg_235_2)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)

	local var_235_0 = arg_235_0.wsMap.map
	local var_235_1 = var_235_0.top
	local var_235_2 = var_235_0.bottom
	local var_235_3 = var_235_0.left
	local var_235_4 = var_235_0.right

	if arg_235_1 < var_235_1 or var_235_2 < arg_235_1 or arg_235_2 < var_235_3 or var_235_4 < arg_235_2 then
		arg_235_0:OnClickTransport()
	else
		arg_235_0:OnClickCell(arg_235_1, arg_235_2)
	end
end

function var_0_0.CheckScannerEnable(arg_236_0, arg_236_1, arg_236_2)
	if nowWorld():IsSystemOpen(WorldConst.SystemScanner) then
		local var_236_0 = arg_236_0.wsMap.map:GetCell(arg_236_1, arg_236_2)

		if var_236_0 and var_236_0:GetInFOV() and not var_236_0:InFog() then
			local var_236_1 = var_236_0:GetScannerAttachment()

			if var_236_1 then
				local var_236_2 = arg_236_0.wsMap:GetCell(arg_236_1, arg_236_2).rtAttachments.position

				return var_236_1, arg_236_0.camera:WorldToScreenPoint(var_236_2)
			end
		end
	end
end

function var_0_0.OnLongPressMap(arg_237_0, arg_237_1, arg_237_2)
	if not arg_237_0.svScannerPanel:isShowing() then
		local var_237_0, var_237_1 = arg_237_0:CheckScannerEnable(arg_237_1, arg_237_2)

		if var_237_0 then
			arg_237_0:Op("OpShowScannerPanel", var_237_0, var_237_1)
		end
	end
end

function var_0_0.OnAchievementAchieved(arg_238_0, arg_238_1, arg_238_2, arg_238_3, arg_238_4)
	if arg_238_3 then
		for iter_238_0, iter_238_1 in ipairs(arg_238_3) do
			pg.TipsMgr.GetInstance():ShowTips(iter_238_1)
		end
	end

	if arg_238_4 then
		local var_238_0 = nowWorld()

		if var_238_0.isAutoFight then
			var_238_0:AddAutoInfo("message", i18n("autofight_discovery", arg_238_4.config.target_desc))
		else
			table.insert(arg_238_0.achievedList, {
				arg_238_4,
				arg_238_0.wsMapRight.btnInformation.position
			})
		end
	end
end

function var_0_0.DoAnim(arg_239_0, arg_239_1, arg_239_2)
	arg_239_0:downloadWorldResList(arg_239_0:getUIAnimResList(arg_239_1), function()
		local var_240_0 = arg_239_0.wsAnim

		if not var_240_0:GetAnim(arg_239_1) then
			var_240_0:SetAnim(arg_239_1, arg_239_0:NewUIAnim(arg_239_1))
		end

		var_240_0:GetAnim(arg_239_1):Play(arg_239_2)
	end)
end

function var_0_0.NewUIAnim(arg_241_0, arg_241_1)
	local var_241_0 = UIAnim.New()

	var_241_0:Setup(arg_241_1)
	var_241_0:AddListener(UIAnim.EventLoaded, function()
		var_241_0.transform:SetParent(arg_241_0.rtTop, false)
	end)
	var_241_0:Load()

	return var_241_0
end

function var_0_0.DoStrikeAnim(arg_243_0, arg_243_1, arg_243_2, arg_243_3)
	arg_243_0:downloadWorldResList(arg_243_0:getStrikeAnimResList(arg_243_1, arg_243_2), function()
		local var_244_0 = arg_243_0.wsAnim

		if not var_244_0:GetAnim(arg_243_1) then
			var_244_0:SetAnim(arg_243_1, arg_243_0:NewStrikeAnim(arg_243_1, arg_243_2))
		else
			var_244_0:GetAnim(arg_243_1):ReloadShip(arg_243_2)
		end

		var_244_0:GetAnim(arg_243_1):Play(arg_243_3)
	end)
end

function var_0_0.NewStrikeAnim(arg_245_0, arg_245_1, arg_245_2)
	local var_245_0 = UIStrikeAnim.New()

	var_245_0:Setup(arg_245_1, arg_245_2)
	var_245_0:AddListener(UIStrikeAnim.EventLoaded, function()
		var_245_0.transform:SetParent(arg_245_0.rtTop, false)
	end)
	var_245_0:Load()

	return var_245_0
end

function var_0_0.StopAnim(arg_247_0)
	arg_247_0.wsAnim:Stop()
end

function var_0_0.UpdateSystemOpen(arg_248_0)
	local var_248_0 = nowWorld()

	if arg_248_0:GetInMap() then
		local var_248_1 = var_248_0:GetActiveMap()

		arg_248_0.wsMapLeft.onAgonyClickEnabled = var_248_0:IsSystemOpen(WorldConst.SystemInventory)

		setActive(arg_248_0.wsMapRight.btnInventory, var_248_0:IsSystemOpen(WorldConst.SystemInventory))
		setActive(arg_248_0.wsMapRight.btnTransport, var_248_0:IsSystemOpen(WorldConst.SystemOutMap))
		setActive(arg_248_0.wsMapRight.btnDetail, var_248_0:IsSystemOpen(WorldConst.SystemFleetDetail))
		setActive(arg_248_0.wsMapRight.rtCompassPanel, var_248_0:IsSystemOpen(WorldConst.SystemCompass))
		setActive(arg_248_0.wsMapRight.toggleAutoFight, var_248_1:CanAutoFight())
		setActive(arg_248_0.wsMapRight.toggleAutoSwitch, var_248_0:IsSystemOpen(WorldConst.SystemAutoSwitch))
	else
		setActive(arg_248_0.wsAtlasBottom.btnBoss, var_248_0:IsSystemOpen(WorldConst.SystemWorldBoss))

		local var_248_2 = var_248_0:GetBossProxy():NeedTip()
		local var_248_3 = var_248_0:GetBossProxy():ExistSelfBoss()
		local var_248_4 = WorldBossConst.CanUnlockCurrBoss()
		local var_248_5 = not var_248_3 and not var_248_4

		setActive(arg_248_0.wsAtlasBottom.btnBoss:Find("tip"), var_248_2 or var_248_4 or WorldBossConst.AnyArchivesBossCanGetAward())
		setActive(arg_248_0.wsAtlasBottom.btnBoss:Find("sel"), not var_248_5)

		local var_248_6 = arg_248_0.rtTopAtlas:Find("reset_coutdown")

		onButton(arg_248_0, var_248_6, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("world_reset_tip")
			})
		end, SFX_PANEL)

		local var_248_7 = var_248_0:IsSystemOpen(WorldConst.SystemResetCountDown) and var_248_0:CheckResetProgress()

		setActive(var_248_6, var_248_7)

		if var_248_7 then
			local var_248_8 = var_248_0:GetResetWaitingTime()
			local var_248_9 = math.floor(var_248_8 / 86400)

			if var_248_9 > 0 then
				setText(var_248_6:Find("Text"), i18n("world_reset_1", string.format("  %d  ", var_248_9)))
			elseif var_248_9 == 0 then
				setText(var_248_6:Find("Text"), i18n("world_reset_2", string.format("  %d  ", 0)))
			elseif var_248_9 < 0 then
				setText(var_248_6:Find("Text"), i18n("world_reset_3"))
			end
		end

		setActive(arg_248_0.wsAtlasBottom.btnShop, var_248_0:IsSystemOpen(WorldConst.SystemResetShop))
		setActive(arg_248_0.wsAtlasBottom.btnDailyTask:Find("mask"), not var_248_0:IsSystemOpen(WorldConst.SystemDailyTask))
		setActive(arg_248_0.wsAtlasRight.btnSwitch, var_248_0:IsSystemOpen(WorldConst.SystemAutoSwitch))
		setActive(arg_248_0.wsAtlasRight.btnDelegate, var_248_0:IsSystemOpen(WorldConst.SystemAutoSwitch))
	end

	setActive(arg_248_0.resAtlas._tf, var_248_0:IsSystemOpen(WorldConst.SystemResource))
	setActive(arg_248_0.resMap._tf, var_248_0:IsSystemOpen(WorldConst.SystemResource))
end

function var_0_0.EnterToModelMap(arg_250_0, arg_250_1)
	local var_250_0 = {}

	table.insert(var_250_0, function(arg_251_0)
		setActive(arg_250_0.rtTopAtlas:Find("print/title_world"), true)
		setActive(arg_250_0.rtTopAtlas:Find("print/title_view"), false)
		arg_250_0.wsAtlasBottom:UpdateScale(1, true, arg_251_0)
	end)
	table.insert(var_250_0, function(arg_252_0)
		arg_250_0.wsAtlas:SwitchArea(arg_250_1, true, arg_252_0)
	end)
	parallelAsync(var_250_0, function()
		local var_253_0 = nowWorld():GetAtlas():GetActiveEntrance()

		if arg_250_1 == var_253_0:GetAreaId() then
			arg_250_0.wsAtlas:UpdateSelect(var_253_0)
		end
	end)
end

function var_0_0.ReturnToModelArea(arg_254_0)
	arg_254_0.wsAtlas:UpdateSelect()

	local var_254_0 = {}

	table.insert(var_254_0, function(arg_255_0)
		setActive(arg_254_0.rtTopAtlas:Find("print/title_world"), false)
		setActive(arg_254_0.rtTopAtlas:Find("print/title_view"), true)
		arg_254_0.wsAtlasBottom:UpdateScale(0, true, arg_255_0)
	end)
	table.insert(var_254_0, function(arg_256_0)
		arg_254_0.wsAtlas:SwitchArea(nil, true, arg_256_0)
	end)
	parallelAsync(var_254_0, function()
		return
	end)
end

function var_0_0.EnterTransportWorld(arg_258_0, arg_258_1)
	local var_258_0 = nowWorld()

	arg_258_1 = arg_258_1 or {
		entrance = var_258_0:GetActiveEntrance()
	}

	local var_258_1 = {}

	if arg_258_0:GetInMap() then
		table.insert(var_258_1, function(arg_259_0)
			arg_258_0:Op("OpSetInMap", false, arg_259_0)
		end)
	elseif not arg_258_0.wsAtlas.nowArea then
		table.insert(var_258_1, function(arg_260_0)
			arg_258_0.wsAtlas:SwitchArea(arg_258_1.entrance:GetAreaId(), false, arg_260_0)
		end)
	end

	seriesAsync(var_258_1, function()
		arg_258_0.wsAtlas:UpdateSelect()
		arg_258_0.wsAtlas:UpdateSelect(arg_258_1.entrance, arg_258_1.mapId, arg_258_1.mapTypes)
		arg_258_0.wsAtlas:DisplayTransport(arg_258_0.contextData.displayTransDic or {}, function()
			arg_258_0.contextData.displayTransDic = Clone(var_258_0:GetAtlas().transportDic)
		end)
	end)
end

function var_0_0.BackToMap(arg_263_0)
	if arg_263_0.wsAtlas:CheckIsTweening() then
		return
	end

	arg_263_0:Op("OpSetInMap", true)
end

function var_0_0.DisplayEnv(arg_264_0, arg_264_1)
	local var_264_0 = checkExist(nowWorld():GetActiveMap(), {
		"config"
	}, {
		"map_bg"
	}, {
		1
	}) or "model_bg"
	local var_264_1 = {}

	if arg_264_0.rtEnvBG:GetComponent(typeof(Image)).sprite.name ~= var_264_0 then
		table.insert(var_264_1, function(arg_265_0)
			arg_264_0:downloadWorldResList({
				"world/map/" .. var_264_0
			}, arg_265_0)
		end)
		table.insert(var_264_1, function(arg_266_0)
			GetSpriteFromAtlasAsync("world/map/" .. var_264_0, var_264_0, function(arg_267_0)
				setImageSprite(arg_264_0.rtEnvBG, arg_267_0)

				return arg_266_0()
			end)
		end)
	end

	seriesAsync(var_264_1, arg_264_1)
end

function var_0_0.ScreenPos2MapPos(arg_268_0, arg_268_1)
	local var_268_0 = arg_268_0.wsMap
	local var_268_1 = var_268_0.map
	local var_268_2 = arg_268_0.camera:ScreenPointToRay(arg_268_1)
	local var_268_3, var_268_4 = Plane.New(var_268_0.rtQuads.forward, -Vector3.Dot(var_268_0.rtQuads.position, var_268_0.rtQuads.forward)):Raycast(var_268_2)

	if var_268_3 then
		local var_268_5 = var_268_2:GetPoint(var_268_4)
		local var_268_6 = var_268_0.rtQuads:InverseTransformPoint(var_268_5)
		local var_268_7 = var_268_1.theme:X2Column(var_268_6.x)

		return var_268_1.theme:Y2Row(var_268_6.y), var_268_7
	end
end

function var_0_0.BuildCutInAnim(arg_269_0, arg_269_1, arg_269_2)
	arg_269_0.tfAnim = arg_269_0.rtPanelList:Find(arg_269_1 .. "(Clone)")

	local var_269_0 = {}

	if not arg_269_0.tfAnim then
		table.insert(var_269_0, function(arg_270_0)
			arg_269_0:downloadWorldResList({
				"ui/" .. arg_269_1
			}, arg_270_0)
		end)
		table.insert(var_269_0, function(arg_271_0)
			PoolMgr.GetInstance():GetUI(arg_269_1, true, function(arg_272_0)
				arg_272_0:SetActive(false)

				arg_269_0.tfAnim = tf(arg_272_0)

				arg_269_0.tfAnim:SetParent(arg_269_0.rtPanelList, false)

				return arg_271_0()
			end)
		end)
	end

	table.insert(var_269_0, function(arg_273_0)
		arg_269_0.inCutIn = true

		arg_269_0.tfAnim:GetComponent("DftAniEvent"):SetEndEvent(function(arg_274_0)
			if not IsNil(arg_269_0.tfAnim) then
				arg_269_0.inCutIn = false

				arg_269_0:UnOverlayPanel(arg_269_0.tfAnim, arg_269_0.rtPanelList)
				setActive(arg_269_0.tfAnim, false)

				return arg_273_0()
			end
		end)
		arg_269_0:OverlayPanel(arg_269_0.tfAnim)
		setActive(arg_269_0.tfAnim, true)
	end)
	seriesAsync(var_269_0, function()
		return existCall(arg_269_2)
	end)
end

function var_0_0.PlaySound(arg_276_0, arg_276_1, arg_276_2)
	if arg_276_0.cueName then
		pg.CriMgr.GetInstance():StopSE_V3()

		arg_276_0.cueName = nil
	end

	pg.CriMgr.GetInstance():PlaySE_V3(arg_276_1, function()
		arg_276_0.cueName = nil
	end)

	return existCall(arg_276_2)
end

function var_0_0.ChangeTopRaycasts(arg_278_0, arg_278_1)
	GetOrAddComponent(arg_278_0.rtTop, typeof(CanvasGroup)).blocksRaycasts = tobool(arg_278_1)
end

function var_0_0.DoTopBlock(arg_279_0, arg_279_1)
	arg_279_0:ChangeTopRaycasts(false)

	return function(...)
		arg_279_0:ChangeTopRaycasts(true)

		return existCall(arg_279_1, ...)
	end
end

function var_0_0.SetMoveQueue(arg_281_0, arg_281_1)
	arg_281_0:ReContinueMoveQueue()

	arg_281_0.moveQueue = arg_281_1
end

function var_0_0.ClearMoveQueue(arg_282_0)
	arg_282_0:DisplayMoveStopClick(false)

	arg_282_0.moveQueueInteractive = true

	if #arg_282_0.moveQueue > 0 then
		arg_282_0.moveQueue = {}
	end

	arg_282_0:ShowFleetMoveTurn(false)
end

function var_0_0.DoQueueMove(arg_283_0, arg_283_1)
	assert(#arg_283_0.moveQueue > 0, "without move queue")
	arg_283_0:DisplayMoveStopClick(true)

	local var_283_0 = nowWorld():GetActiveMap()
	local var_283_1 = _.detect(arg_283_0.moveQueue, function(arg_284_0)
		return arg_284_0.stay
	end)

	if #arg_283_0.moveQueue == 1 and var_283_0:IsSign(var_283_1.row, var_283_1.column) then
		arg_283_0:ClearMoveQueue()

		local var_283_2 = var_283_0:GetCell(var_283_1.row, var_283_1.column)

		arg_283_0:Op("OpTriggerSign", arg_283_1, var_283_2:GetEventAttachment(), function()
			arg_283_0:Op("OpInteractive")
		end)
	else
		arg_283_0:ReContinueMoveQueue()
		arg_283_0:ShowFleetMoveTurn(true)
		arg_283_0:Op("OpReqMoveFleet", arg_283_1, var_283_1.row, var_283_1.column)
	end
end

function var_0_0.CheckMoveQueue(arg_286_0, arg_286_1)
	if #arg_286_0.moveQueue < #arg_286_1 or #arg_286_1 == 0 then
		arg_286_0:ClearMoveQueue()
	else
		local var_286_0 = arg_286_1[#arg_286_1]

		if arg_286_0.moveQueue[#arg_286_1].row ~= var_286_0.row or arg_286_0.moveQueue[#arg_286_1].column ~= var_286_0.column then
			arg_286_0:ClearMoveQueue()
		else
			for iter_286_0 = 1, #arg_286_1 do
				table.remove(arg_286_0.moveQueue, 1)
			end

			if #arg_286_0.moveQueue == 0 then
				arg_286_0:ResetLostMoveQueueCount()

				arg_286_0.moveQueueInteractive = true
			end
		end
	end
end

function var_0_0.InteractiveMoveQueue(arg_287_0)
	if arg_287_0.moveQueueInteractive then
		arg_287_0:ClearMoveQueue()
	else
		arg_287_0:DisplayMoveStopClick(false)

		arg_287_0.moveQueueInteractive = true
	end
end

function var_0_0.ReContinueMoveQueue(arg_288_0)
	arg_288_0.moveQueueInteractive = false
end

function var_0_0.CheckLostMoveQueueCount(arg_289_0)
	arg_289_0.lostMoveQueueCount = defaultValue(arg_289_0.lostMoveQueueCount, 0) + 1

	return arg_289_0.lostMoveQueueCount > WorldConst.AutoFightLoopCountLimit
end

function var_0_0.ResetLostMoveQueueCount(arg_290_0, arg_290_1)
	if arg_290_1 then
		arg_290_0.inLoopAutoFight = true
	end

	arg_290_0.lostMoveQueueCount = 0
end

function var_0_0.DisplayMoveStopClick(arg_291_0, arg_291_1)
	setActive(arg_291_0.rtClickStop, arg_291_1)

	if arg_291_1 then
		local var_291_0 = nowWorld().isAutoFight

		setActive(arg_291_0.rtClickStop:Find("long_move"), not var_291_0)
		setActive(arg_291_0.rtClickStop:Find("auto_fight"), var_291_0)
	end
end

function var_0_0.ShowFleetMoveTurn(arg_292_0, arg_292_1)
	if arg_292_0.wsMap then
		if arg_292_1 then
			arg_292_0.wsMap:GetFleet():PlusMoveTurn()
		else
			arg_292_0.wsMap:GetFleet():ClearMoveTurn()
		end
	end
end

function var_0_0.GetAllPessingAward(arg_293_0, arg_293_1)
	local var_293_0 = nowWorld()
	local var_293_1 = var_293_0:GetAtlas()
	local var_293_2 = {}

	for iter_293_0, iter_293_1 in pairs(var_293_0.pressingAwardDic) do
		if iter_293_1.flag then
			var_293_0:FlagMapPressingAward(iter_293_0)
			var_293_1:MarkMapTransport(iter_293_0)

			local var_293_3 = pg.world_event_complete[iter_293_1.id].event_reward_slgbuff

			if #var_293_3 > 0 then
				var_293_2[var_293_3[1]] = defaultValue(var_293_2[var_293_3[1]], 0) + var_293_3[2]
			end
		end
	end

	local var_293_4 = var_293_0:GetActiveMap()

	if not var_293_4.visionFlag and var_293_0:IsMapVisioned(var_293_4.id) then
		var_293_4:UpdateVisionFlag(true)
	end

	if arg_293_0.wsAtlas then
		arg_293_0.wsAtlas:OnUpdatePressingAward()
	end

	local var_293_5 = {}

	for iter_293_2, iter_293_3 in pairs(var_293_2) do
		table.insert(var_293_5, function(arg_294_0)
			local var_294_0 = {
				id = iter_293_2,
				floor = iter_293_3,
				before = var_293_0:GetGlobalBuff(iter_293_2):GetFloor()
			}

			arg_293_0:ShowSubView("GlobalBuff", {
				var_294_0,
				arg_294_0
			})
		end)
		table.insert(var_293_5, function(arg_295_0)
			var_293_0:AddGlobalBuff(iter_293_2, iter_293_3)
			arg_295_0()
		end)
	end

	seriesAsync(var_293_5, function()
		return existCall(arg_293_1)
	end)
end

function var_0_0.GetDelegatedAwards(arg_297_0, arg_297_1, arg_297_2, arg_297_3, arg_297_4)
	local var_297_0 = nowWorld()
	local var_297_1 = var_297_0:GetAtlas()
	local var_297_2 = {}

	for iter_297_0, iter_297_1 in ipairs(arg_297_1) do
		local var_297_3 = var_297_0.pressingAwardDic[iter_297_1]

		if var_297_3.flag then
			var_297_0:FlagMapPressingAward(iter_297_1)
			var_297_1:MarkMapTransport(iter_297_1)

			local var_297_4 = pg.world_event_complete[var_297_3.id].event_reward_slgbuff

			if #var_297_4 > 0 then
				var_297_2[var_297_4[1]] = defaultValue(var_297_2[var_297_4[1]], 0) + var_297_4[2]
			end
		end
	end

	if arg_297_0.wsAtlas then
		arg_297_0.wsAtlas:OnUpdatePressingAward()
	end

	local var_297_5 = {}
	local var_297_6 = {}

	for iter_297_2, iter_297_3 in pairs(var_297_2) do
		table.insert(var_297_5, function(arg_298_0)
			local var_298_0 = {
				id = iter_297_2,
				floor = iter_297_3,
				before = var_297_0:GetGlobalBuff(iter_297_2):GetFloor()
			}

			table.insert(var_297_6, var_298_0)
			arg_297_0:ShowSubView("GlobalBuff", {
				var_298_0,
				arg_298_0
			})
		end)
		table.insert(var_297_5, function(arg_299_0)
			var_297_0:AddGlobalBuff(iter_297_2, iter_297_3)
			arg_299_0()
		end)
	end

	if #arg_297_2 > 0 then
		table.insert(var_297_5, function(arg_300_0)
			arg_297_0:Op("OpOpenLayer", Context.New({
				viewComponent = WorldChapterAutoRewardLayer,
				mediator = WorldChapterAutoRewardMediator,
				data = {
					awards = arg_297_2,
					buffInfos = var_297_6,
					proficiency = arg_297_3,
					onClose = arg_300_0
				}
			}))
		end)
	end

	seriesAsync(var_297_5, arg_297_4)
end

function var_0_0.CheckGuideSLG(arg_301_0, arg_301_1, arg_301_2)
	local var_301_0 = nowWorld()
	local var_301_1 = {}

	table.insert(var_301_1, {
		"WorldG007",
		function()
			local var_302_0 = arg_301_1:GetPort()

			if var_302_0 and not var_302_0:IsTempPort() then
				local var_302_1 = arg_301_1:GetFleet()

				return not arg_301_1:GetCell(var_302_1.row, var_302_1.column):ExistEnemy()
			end
		end
	})
	table.insert(var_301_1, {
		"WorldG111",
		function()
			return arg_301_1:canExit()
		end
	})
	table.insert(var_301_1, {
		"WorldG112",
		function()
			local var_304_0 = var_301_0:GetActiveEntrance()

			return var_304_0.becomeSairen and var_304_0:GetSairenMapId() == arg_301_1.id
		end
	})
	table.insert(var_301_1, {
		"WorldG124",
		function()
			return var_301_0:IsSystemOpen(WorldConst.SystemOrderSubmarine) and arg_301_1:GetConfig("instruction_available")[1] ~= 0 and var_301_0:CanCallSubmarineSupport()
		end
	})
	table.insert(var_301_1, {
		"WorldG162",
		function()
			return _.any(arg_301_1:GetNormalFleets(), function(arg_307_0)
				return _.any(arg_307_0:GetShips(true), function(arg_308_0)
					return arg_308_0:IsBroken()
				end)
			end)
		end
	})
	table.insert(var_301_1, {
		"WorldG163",
		function()
			local var_309_0 = var_301_0:GetTaskProxy():getDoingTaskVOs()

			return underscore.any(var_309_0, function(arg_310_0)
				return not arg_310_0:IsAutoSubmit() and arg_310_0:isFinished()
			end)
		end
	})
	table.insert(var_301_1, {
		"WorldG164",
		function()
			return arg_301_1:CheckFleetSalvage(true)
		end
	})
	table.insert(var_301_1, {
		"WorldG181",
		function()
			return var_301_0:GetInventoryProxy():GetItemCount(102) > 0
		end
	})
	table.insert(var_301_1, {
		"WorldG191",
		function()
			return WorldBossConst.CanUnlockCurrBoss() and nowWorld():IsSystemOpen(WorldConst.SystemWorldBoss)
		end
	})

	local var_301_2 = _.filter(arg_301_1:FindAttachments(WorldMapAttachment.TypeEvent), function(arg_314_0)
		return arg_314_0:IsAlive()
	end)

	for iter_301_0, iter_301_1 in ipairs(pg.gameset.world_guide_event.description) do
		table.insert(var_301_1, {
			iter_301_1[2],
			function()
				return _.any(var_301_2, function(arg_316_0)
					return arg_316_0.id == iter_301_1[1]
				end)
			end
		})
	end

	local var_301_3 = pg.NewStoryMgr.GetInstance()

	for iter_301_2, iter_301_3 in ipairs(var_301_1) do
		if not var_301_3:IsPlayed(iter_301_3[1]) and iter_301_3[2]() then
			WorldGuider.GetInstance():PlayGuide(iter_301_3[1])

			return true
		end
	end

	return false
end

function var_0_0.CheckEventForMsg(arg_317_0, arg_317_1)
	return pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_317_0.player.level, "EventMediator") and getProxy(EventProxy).eventForMsg
end

function var_0_0.OpenPortLayer(arg_318_0, arg_318_1)
	arg_318_0:Op("OpOpenLayer", Context.New({
		mediator = WorldPortMediator,
		viewComponent = WorldPortLayer,
		data = arg_318_1
	}))
end

function var_0_0.ShowTransportMarkOverview(arg_319_0, arg_319_1, arg_319_2)
	if nowWorld():GetActiveMap():CheckFleetSalvage(true) then
		arg_319_0:Op("OpShowMarkOverview", arg_319_1, function()
			pg.NewStoryMgr.GetInstance():Play(pg.gameset.world_catsearch_special.description[1], arg_319_2, true)
		end)
	else
		arg_319_0:Op("OpShowMarkOverview", arg_319_1, arg_319_2)
	end
end

function var_0_0.UpdateAutoFightDisplay(arg_321_0)
	arg_321_0:ClearMoveQueue()

	local var_321_0 = nowWorld().isAutoFight

	if arg_321_0.wsMapRight then
		setActive(arg_321_0.wsMapRight.toggleAutoFight:Find("off"), not var_321_0)
		setActive(arg_321_0.wsMapRight.toggleAutoFight:Find("on"), var_321_0)
		setActive(arg_321_0.wsMapRight.toggleSkipPrecombat, not var_321_0)
		triggerToggle(arg_321_0.wsMapRight.toggleSkipPrecombat, PlayerPrefs.GetInt("world_skip_precombat", 0) == 1)
	end
end

function var_0_0.UpdateAutoSwitchDisplay(arg_322_0)
	local var_322_0 = nowWorld().isAutoSwitch

	if arg_322_0.wsMapRight then
		setActive(arg_322_0.wsMapRight.toggleAutoSwitch:Find("off"), not var_322_0)
		setActive(arg_322_0.wsMapRight.toggleAutoSwitch:Find("on"), var_322_0)
	end
end

function var_0_0.GuideShowScannerEvent(arg_323_0, arg_323_1)
	assert(arg_323_0.svScannerPanel:isShowing(), "scanner mode is closed")

	local var_323_0 = arg_323_0.wsMap.map:FindAttachments(WorldMapAttachment.TypeEvent, arg_323_1)

	assert(#var_323_0 == 1, "event number error: " .. #var_323_0)

	local var_323_1, var_323_2 = arg_323_0:CheckScannerEnable(var_323_0[1].row, var_323_0[1].column)

	assert(var_323_1, "without scanner attachment")
	arg_323_0.svScannerPanel:ActionInvoke("DisplayWindow", var_323_1, var_323_2)
end

function var_0_0.DisplayAwards(arg_324_0, arg_324_1, arg_324_2, arg_324_3)
	local var_324_0 = {}
	local var_324_1 = {}

	for iter_324_0, iter_324_1 in ipairs(arg_324_1) do
		if iter_324_1.type == DROP_TYPE_WORLD_COLLECTION then
			table.insert(var_324_1, iter_324_1)
		else
			table.insert(var_324_0, iter_324_1)
		end
	end

	seriesAsync({
		function(arg_325_0)
			if #var_324_0 == 0 then
				return arg_325_0()
			end

			arg_324_2.items = var_324_0
			arg_324_2.removeFunc = arg_325_0

			arg_324_0:emit(BaseUI.ON_WORLD_ACHIEVE, arg_324_2)
		end,
		function(arg_326_0)
			local var_326_0 = var_324_1[1]

			if not var_326_0 then
				arg_326_0()

				return
			end

			assert(WorldCollectionProxy.GetCollectionType(var_326_0.id) == WorldCollectionProxy.WorldCollectionType.FILE, string.format("collection drop type error#%d", var_326_0.id))
			arg_324_0:emit(WorldMediator.OnOpenLayer, Context.New({
				mediator = WorldMediaCollectionFilePreviewMediator,
				viewComponent = WorldMediaCollectionFilePreviewLayer,
				data = {
					collectionId = var_326_0.id
				},
				onRemoved = arg_326_0
			}))
		end
	}, arg_324_3)
end

function var_0_0.DisplayPhaseAction(arg_327_0, arg_327_1)
	local var_327_0 = {}

	while #arg_327_1 > 0 do
		local var_327_1 = nowWorld()
		local var_327_2 = table.remove(arg_327_1, 1)

		table.insert(var_327_0, function(arg_328_0)
			if var_327_2.anim then
				arg_327_0:BuildCutInAnim(var_327_2.anim, arg_328_0)
			elseif var_327_2.story then
				if var_327_1.isAutoFight then
					arg_328_0()
				else
					pg.NewStoryMgr.GetInstance():Play(var_327_2.story, arg_328_0, true)
				end
			elseif var_327_2.drops then
				if var_327_1.isAutoFight then
					var_327_1:AddAutoInfo("drops", var_327_2.drops)
					arg_328_0()
				else
					arg_327_0:DisplayAwards(var_327_2.drops, {}, arg_328_0)
				end
			end
		end)
	end

	seriesAsync(var_327_0, function()
		arg_327_0:Op("OpInteractive")
	end)
end

function var_0_0.StartAutoSwitch(arg_330_0)
	local var_330_0 = nowWorld()
	local var_330_1 = var_330_0:GetActiveEntrance()
	local var_330_2 = var_330_0:GetActiveMap()

	if PlayerPrefs.GetInt("auto_switch_mode", 0) == WorldSwitchPlanningLayer.MODE_SAFE and PlayerPrefs.GetString("auto_switch_difficult_safe", "only") == "only" and World.ReplacementMapType(var_330_1, var_330_2) ~= "complete_chapter" then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_automode_start_tip3"))

		return
	elseif PlayerPrefs.GetInt("auto_switch_mode", 0) == WorldSwitchPlanningLayer.MODE_TREASURE and not var_330_0:GetGobalFlag("treasure_flag") then
		pg.TipsMgr.GetInstance():ShowTips("without auto switch flag")

		return
	end

	arg_330_0:QueryTransport(function(arg_331_0)
		if not arg_331_0 then
			if PlayerPrefs.GetInt("auto_switch_mode", 0) == WorldSwitchPlanningLayer.MODE_TREASURE and World.ReplacementMapType(var_330_1, var_330_2) == "teasure_chapter" then
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_automode_start_tip5"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_automode_start_tip4"))
			end
		else
			getProxy(MetaCharacterProxy):setMetaTacticsInfoOnStart()
			PlayerPrefs.SetInt("world_skip_precombat", 1)
			PlayerPrefs.SetInt("autoBotIsAcitve" .. AutoBotCommand.GetAutoBotMark(SYSTEM_WORLD), 1)
			arg_330_0:Op("OpAutoSwitchMap")
		end
	end)
end

function var_0_0.MoveAndOpenLayer(arg_332_0, arg_332_1)
	local var_332_0 = {}

	table.insert(var_332_0, function(arg_333_0)
		arg_332_0:Op("OpSetInMap", arg_332_1.inMap, arg_333_0)
	end)
	seriesAsync(var_332_0, function()
		arg_332_0:Op("OpOpenLayer", arg_332_1.context)
	end)
end

function var_0_0.GetDepth(arg_335_0)
	return #arg_335_0.wsCommands
end

function var_0_0.GetCommand(arg_336_0, arg_336_1)
	return arg_336_0.wsCommands[arg_336_1 or arg_336_0:GetDepth()]
end

function var_0_0.Op(arg_337_0, arg_337_1, ...)
	arg_337_0:GetCommand():Op(arg_337_1, ...)
end

function var_0_0.OpRaw(arg_338_0, arg_338_1, ...)
	arg_338_0:GetCommand():OpRaw(arg_338_1, ...)
end

function var_0_0.OpOpen(arg_339_0)
	local var_339_0 = arg_339_0:GetDepth()

	WorldConst.Print("open operation stack: " .. var_339_0 + 1)
	table.insert(arg_339_0.wsCommands, WSCommand.New(var_339_0 + 1))
end

function var_0_0.OpClose(arg_340_0)
	local var_340_0 = arg_340_0:GetDepth()

	assert(var_340_0 > 0)
	WorldConst.Print("close operation stack: " .. var_340_0)
	arg_340_0.wsCommands[var_340_0]:Dispose()
	table.remove(arg_340_0.wsCommands, var_340_0)
end

function var_0_0.OpClear(arg_341_0)
	for iter_341_0, iter_341_1 in ipairs(arg_341_0.wsCommands) do
		iter_341_1:OpClear()
	end
end

function var_0_0.OpDispose(arg_342_0)
	for iter_342_0, iter_342_1 in ipairs(arg_342_0.wsCommands) do
		iter_342_1:Dispose()
	end

	arg_342_0.wsCommands = nil
end

function var_0_0.NewMapOp(arg_343_0, arg_343_1)
	local var_343_0 = WBank:Fetch(WorldMapOp)

	var_343_0.depth = arg_343_0:GetDepth()

	for iter_343_0, iter_343_1 in pairs(arg_343_1) do
		var_343_0[iter_343_0] = iter_343_1
	end

	return var_343_0
end

function var_0_0.RegistMapOp(arg_344_0, arg_344_1)
	assert(arg_344_1, "mapOp can not be nil.")
	assert(not table.contains(arg_344_0.mapOps, arg_344_1), "repeated registered mapOp.")
	table.insert(arg_344_0.mapOps, arg_344_1)
	arg_344_1:AddCallbackWhenApplied(function()
		for iter_345_0 = #arg_344_0.mapOps, 1, -1 do
			if arg_344_0.mapOps[iter_345_0] == arg_344_1 then
				table.remove(arg_344_0.mapOps, iter_345_0)
			end
		end
	end)
end

function var_0_0.VerifyMapOp(arg_346_0)
	for iter_346_0 = #arg_346_0.mapOps, 1, -1 do
		local var_346_0 = table.remove(arg_346_0.mapOps, iter_346_0)

		if not var_346_0.applied then
			var_346_0:Apply()
		end
	end

	arg_346_0:OpClear()
end

function var_0_0.GetCompassGridPos(arg_347_0, arg_347_1, arg_347_2, arg_347_3)
	WorldGuider.GetInstance():SetTempGridPos(arg_347_0.wsMapRight.wsCompass:GetMarkPosition(arg_347_1, arg_347_2), arg_347_3)
end

function var_0_0.GetEntranceTrackMark(arg_348_0, arg_348_1, arg_348_2)
	WorldGuider.GetInstance():SetTempGridPos(arg_348_0.wsMapRight.wsCompass:GetEntranceTrackMark(arg_348_1), arg_348_2)
end

function var_0_0.GetSlgTilePos(arg_349_0, arg_349_1, arg_349_2, arg_349_3)
	WorldGuider.GetInstance():SetTempGridPos2(arg_349_0.wsMap:GetCell(arg_349_1, arg_349_2):GetWorldPos(), arg_349_3)
end

function var_0_0.GetScannerPos(arg_350_0, arg_350_1)
	local var_350_0 = arg_350_0.svScannerPanel.rtPanel.transform
	local var_350_1 = arg_350_0.svScannerPanel.rtWindow.transform
	local var_350_2 = Vector3.New(var_350_1.localPosition.x + var_350_1.rect.width * (0.5 - var_350_1.pivot.x), var_350_1.localPosition.y + var_350_1.rect.height * (0.5 - var_350_1.pivot.y), 0)
	local var_350_3 = var_350_0:TransformPoint(var_350_2)

	WorldGuider.GetInstance():SetTempGridPos(var_350_3, arg_350_1)
end

function var_0_0.GuideSelectModelMap(arg_351_0, arg_351_1)
	local var_351_0 = nowWorld():GetEntrance(arg_351_1)

	assert(arg_351_0.wsAtlas, "didn't enter the world map mode")
	arg_351_0:ClickAtlas(var_351_0)
end

return var_0_0
