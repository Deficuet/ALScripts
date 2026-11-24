local var_0_0 = class("ActivityBossBattleFleetSelectSubPanel", import("view.base.BaseSubPanel"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityBossFleetSelectView"
end

function var_0_0.InvokeParent(arg_2_0, arg_2_1, ...)
	if arg_2_0.viewParent then
		arg_2_0.viewParent[arg_2_1](arg_2_0.viewParent, ...)
	end
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.tfShipTpl = arg_3_0._tf:Find("panel/shiptpl")
	arg_3_0.tfEmptyTpl = arg_3_0._tf:Find("panel/emptytpl")
	arg_3_0.tfFleets = {
		[FleetType.Normal] = {
			arg_3_0._tf:Find("panel/fleet/1"),
			arg_3_0._tf:Find("panel/fleet/2")
		},
		[FleetType.Submarine] = {
			arg_3_0._tf:Find("panel/sub/1")
		}
	}
	arg_3_0.tfLimit = arg_3_0._tf:Find("panel/limit_list/limit")
	arg_3_0.tfLimitTips = arg_3_0._tf:Find("panel/limit_list/limit_tip")
	arg_3_0.tfLimitElite = arg_3_0._tf:Find("panel/limit_list/limit_elite")
	arg_3_0.tfLimitContainer = arg_3_0._tf:Find("panel/limit_list/limit_elite/limit_list")
	arg_3_0.rtCostLimit = arg_3_0._tf:Find("panel/limit_list/cost_limit")
	arg_3_0.btnBack = arg_3_0._tf:Find("panel/btnBack")
	arg_3_0.btnGo = arg_3_0._tf:Find("panel/start_button")
	arg_3_0.btnGoS = arg_3_0._tf:Find("panel/start_button_s")
	arg_3_0.btnAuto = arg_3_0._tf:Find("panel/auto_button")
	arg_3_0.btnTry = arg_3_0._tf:Find("panel/try_button")
	arg_3_0.btnASHelp = arg_3_0._tf:Find("panel/title/ASvalue")
	arg_3_0.commanderToggle = arg_3_0._tf:Find("panel/commander_btn")
	arg_3_0.formationToggle = arg_3_0._tf:Find("panel/formation_btn")
	arg_3_0.toggleMask = arg_3_0._tf:Find("mask")
	arg_3_0.toggleList = arg_3_0._tf:Find("mask/list")
	arg_3_0.toggles = {}

	for iter_3_0 = 0, arg_3_0.toggleList.childCount - 1 do
		table.insert(arg_3_0.toggles, arg_3_0.toggleList:Find("item" .. iter_3_0 + 1))
	end

	arg_3_0.btnSp = arg_3_0._tf:Find("panel/sp")
	arg_3_0.spMask = arg_3_0._tf:Find("mask_sp")

	setActive(arg_3_0.tfShipTpl, false)
	setActive(arg_3_0.tfEmptyTpl, false)
	setActive(arg_3_0.toggleMask, false)
	setActive(arg_3_0.btnSp, false)
	setActive(arg_3_0.spMask, false)
	setActive(arg_3_0.tfLimitElite, false)
	setActive(arg_3_0.tfLimitTips, false)
	setActive(arg_3_0.tfLimit, false)
	setActive(arg_3_0._tf:Find("panel/title/ASvalue"), false)
	setText(arg_3_0._tf:Find("panel/formation_btn/text"), i18n("autofight_formation"))
	setText(arg_3_0._tf:Find("panel/commander_btn/text"), i18n("autofight_cat"))
	setText(arg_3_0._tf:Find("panel/title/Image/text"), i18n("fleet_select_title"))
	arg_3_0:InitInteractable()

	arg_3_0.autoPanel = ChapterAutoPanelTypeBoss.New(arg_3_0._tf, arg_3_0.event, arg_3_0.contextData)
end

function var_0_0.InitInteractable(arg_4_0)
	onButton(arg_4_0, arg_4_0.btnGo, function()
		arg_4_0:OnCombat()
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_4_0, arg_4_0.btnGoS, function()
		arg_4_0:OnCombat()
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_4_0, arg_4_0.btnTry, function()
		arg_4_0:OnTrybat()
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_4_0, arg_4_0.btnBack, function()
		arg_4_0:OnCancel()
		arg_4_0:OnCommit()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0._tf, function()
		arg_4_0:OnCancel()
		arg_4_0:OnCommit()
	end, SFX_CANCEL)
	onToggle(arg_4_0, arg_4_0.commanderToggle, function(arg_10_0)
		if arg_10_0 then
			arg_4_0.viewParent.contextData.showCommander = arg_10_0

			for iter_10_0, iter_10_1 in pairs(arg_4_0.tfFleets) do
				for iter_10_2 = 1, #iter_10_1 do
					arg_4_0:updateCommanderBtn(iter_10_0, iter_10_2)
				end
			end
		end
	end, SFX_PANEL)
	onToggle(arg_4_0, arg_4_0.formationToggle, function(arg_11_0)
		if arg_11_0 then
			arg_4_0.viewParent.contextData.showCommander = not arg_11_0

			for iter_11_0, iter_11_1 in pairs(arg_4_0.tfFleets) do
				for iter_11_2 = 1, #iter_11_1 do
					arg_4_0:updateCommanderBtn(iter_11_0, iter_11_2)
				end
			end
		end
	end, SFX_PANEL)
end

function var_0_0.SetFleets(arg_12_0, arg_12_1)
	arg_12_0.fleets = {
		[FleetType.Normal] = {},
		[FleetType.Submarine] = {}
	}

	for iter_12_0, iter_12_1 in pairs(arg_12_1) do
		iter_12_1:RemoveUnusedItems()

		if iter_12_1:isSubmarineFleet() then
			if #arg_12_0.fleets[FleetType.Submarine] < arg_12_0:getLimitNums(FleetType.Submarine) then
				table.insert(arg_12_0.fleets[FleetType.Submarine], iter_12_1)
			end
		elseif #arg_12_0.fleets[FleetType.Normal] < arg_12_0:getLimitNums(FleetType.Normal) then
			table.insert(arg_12_0.fleets[FleetType.Normal], iter_12_1)
		end
	end
end

function var_0_0.SetOilLimit(arg_13_0, arg_13_1)
	local var_13_0 = _.any(arg_13_1, function(arg_14_0)
		return arg_14_0 > 0
	end)

	setActive(arg_13_0.rtCostLimit, var_13_0)
	setText(arg_13_0.rtCostLimit:Find("text"), i18n("formationScene_use_oil_limit_tip_worldboss"))

	if var_13_0 then
		local var_13_1 = 0
		local var_13_2 = arg_13_1[1]

		setActive(arg_13_0.rtCostLimit:Find("cost_noraml/Text"), var_13_2 > 0)

		if var_13_2 > 0 then
			setText(arg_13_0.rtCostLimit:Find("cost_noraml/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_surface"), var_13_2))
		end

		local var_13_3 = 0

		setActive(arg_13_0.rtCostLimit:Find("cost_boss/Text"), var_13_3 > 0)

		local var_13_4 = arg_13_1[2]

		setActive(arg_13_0.rtCostLimit:Find("cost_sub/Text"), var_13_4 > 0)

		if var_13_4 > 0 then
			setText(arg_13_0.rtCostLimit:Find("cost_sub/Text"), string.format("%s(%d)", i18n("formationScene_use_oil_limit_submarine"), var_13_4))
		end
	end
end

function var_0_0.SetSettings(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	arg_15_0.groupNum = arg_15_1
	arg_15_0.submarineNum = arg_15_2
	arg_15_0.showTryBtn = arg_15_3
end

function var_0_0.UpdateView(arg_16_0)
	arg_16_0:clearFleets()
	arg_16_0:UpdateFleets()

	local var_16_0 = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "CommanderCatMediator")

	triggerToggle(arg_16_0.viewParent.contextData.showCommander and var_16_0 and arg_16_0.commanderToggle or arg_16_0.formationToggle, true)
	setActive(arg_16_0.commanderToggle, var_16_0)
	setActive(arg_16_0.btnTry, arg_16_0.showTryBtn)
	arg_16_0:UpdateAutoBtn()
end

function var_0_0.UpdateAutoBtn(arg_17_0)
	arg_17_0.expeditionId = arg_17_0.viewParent.contextData.normalStageIDs[arg_17_0.viewParent.contextData.editFleet]

	local var_17_0 = pg.expedition_auto_statistics[arg_17_0.expeditionId]
	local var_17_1 = ChapterAutoProxy.IsSystemOpen()

	setActive(arg_17_0.btnAuto, var_17_0)
	setActive(arg_17_0.btnGoS, var_17_0)
	setActive(arg_17_0.btnGo, not var_17_0)

	if not var_17_0 then
		return
	end

	local var_17_2 = getProxy(ChapterAutoProxy):GetRecord(ChapterAutoProxy.TYPE.BOSS, arg_17_0.expeditionId)
	local var_17_3 = var_17_1 and var_17_2 > 0

	setGray(arg_17_0.btnAuto, not var_17_3, true)
	onButton(arg_17_0, arg_17_0.btnAuto, function()
		if var_17_3 then
			local var_18_0 = getProxy(ChapterAutoProxy):GetCommissionDoingType()

			if not var_18_0 then
				arg_17_0:ShowChapterAutoPanel()
			else
				arg_17_0:CheckChapterAutoOccupied(var_18_0)
			end
		elseif var_17_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_chapter_unlock_tip_worldboss"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_unlock_tip"))
		end
	end, SFX_PANEL)
end

function var_0_0.ShowChapterAutoPanel(arg_19_0)
	arg_19_0.autoPanel:ExecuteAction("Enter", arg_19_0.expeditionId)
end

function var_0_0.RefreshChapterAutoPanel(arg_20_0)
	if arg_20_0.autoPanel:isShowing() then
		arg_20_0.autoPanel:ExecuteAction("RefreshView")
	end
end

function var_0_0.HideChapterAutoPanel(arg_21_0)
	arg_21_0.autoPanel:ExecuteAction("Hide")
end

function var_0_0.CheckChapterAutoOccupied(arg_22_0, arg_22_1)
	switch(arg_22_1, {
		[ChapterAutoProxy.TYPE.WORLD] = function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("auto_battle_in_world"),
				onYes = function()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLD)
				end,
				yesText = i18n("auto_drop_is_activation_go"),
				noText = i18n("auto_drop_is_activation_cancle")
			})
		end,
		[ChapterAutoProxy.TYPE.SLG] = function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("auto_battle_in_world"),
				onYes = function()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL)
				end,
				yesText = i18n("auto_drop_is_activation_go"),
				noText = i18n("auto_drop_is_activation_cancle")
			})
		end,
		[ChapterAutoProxy.TYPE.RUSH] = function()
			local var_27_0 = getProxy(ChapterAutoProxy):GetCommissionList()[1].id
			local var_27_1 = pg.activity_series_enemy_auto[var_27_0].link_id
			local var_27_2 = BossRushChapterRemasterHelper.GetRemasterByActivityId(var_27_1) ~= nil

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("auto_battle_in_world"),
				onYes = function()
					if var_27_2 then
						pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_REMASTER, {
							id = var_27_1
						})
					else
						pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
					end
				end,
				yesText = i18n("auto_drop_is_activation_go"),
				noText = i18n("auto_drop_is_activation_cancle")
			})
		end
	})
end

function var_0_0.getLimitNums(arg_29_0, arg_29_1)
	local var_29_0 = 0

	if arg_29_1 == FleetType.Normal then
		var_29_0 = arg_29_0.groupNum
	elseif arg_29_1 == FleetType.Submarine then
		var_29_0 = arg_29_0.submarineNum
	end

	return var_29_0 or 0
end

function var_0_0.UpdateFleets(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.tfFleets) do
		for iter_30_2 = 1, #iter_30_1 do
			arg_30_0:updateFleet(iter_30_0, iter_30_2)
		end
	end
end

function var_0_0.updateFleet(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0:updateCommanderBtn(arg_31_1, arg_31_2)

	local var_31_0 = arg_31_2 <= arg_31_0:getLimitNums(arg_31_1)
	local var_31_1 = var_31_0 and arg_31_0.fleets[arg_31_1][arg_31_2]
	local var_31_2 = arg_31_0.tfFleets[arg_31_1][arg_31_2]
	local var_31_3 = findTF(var_31_2, "bg/name")
	local var_31_4 = var_31_2:Find(TeamType.Main)
	local var_31_5 = var_31_2:Find(TeamType.Vanguard)
	local var_31_6 = var_31_2:Find(TeamType.Submarine)
	local var_31_7 = var_31_2:Find("btn_recom")
	local var_31_8 = var_31_2:Find("btn_clear")
	local var_31_9 = var_31_2:Find("selected")
	local var_31_10 = var_31_2:Find("commander")

	setActive(var_31_9, false)
	setText(var_31_3, "")

	if var_31_4 then
		setActive(var_31_4, var_31_0 and var_31_1)
	end

	if var_31_5 then
		setActive(var_31_5, var_31_0 and var_31_1)
	end

	if var_31_6 then
		setActive(var_31_6, var_31_0 and var_31_1)
	end

	if var_31_0 and var_31_1 then
		setText(var_31_3, Fleet.DEFAULT_NAME_BOSS_ACT[var_31_1.id] or "")

		if arg_31_1 == FleetType.Submarine then
			arg_31_0:updateShips(var_31_6, var_31_1.subShips, var_31_1.id, TeamType.Submarine)
		else
			arg_31_0:updateShips(var_31_4, var_31_1.mainShips, var_31_1.id, TeamType.Main)
			arg_31_0:updateShips(var_31_5, var_31_1.vanguardShips, var_31_1.id, TeamType.Vanguard)
		end

		arg_31_0:updateCommanders(var_31_10, var_31_1)
		onButton(arg_31_0, var_31_7, function()
			arg_31_0:emit(arg_31_0.viewParent.contextData.mediatorClass.ON_FLEET_RECOMMEND, var_31_1.id)
		end)
		onButton(arg_31_0, var_31_8, function()
			arg_31_0:emit(arg_31_0.viewParent.contextData.mediatorClass.ON_FLEET_CLEAR, var_31_1.id)
		end, SFX_UI_CLICK)
	end
end

function var_0_0.updateShips(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	removeAllChildren(arg_34_1)

	local var_34_0 = getProxy(BayProxy)

	for iter_34_0 = 1, 3 do
		local var_34_1 = var_34_0:getShipById(arg_34_2[iter_34_0])
		local var_34_2 = var_34_1 and arg_34_0.tfShipTpl or arg_34_0.tfEmptyTpl
		local var_34_3 = cloneTplTo(var_34_2, arg_34_1)

		setActive(var_34_3, true)

		if var_34_1 then
			updateShip(var_34_3, var_34_1)
			setActive(var_34_3:Find("event_block"), var_34_1:getFlag("inEvent"))
		end

		setActive(var_34_3:Find("ship_type"), false)

		local var_34_4 = GetOrAddComponent(var_34_3, typeof(UILongPressTrigger))

		var_34_4.onLongPressed:RemoveAllListeners()

		local function var_34_5()
			arg_34_0:emit(arg_34_0.viewParent.contextData.mediatorClass.ON_OPEN_DOCK, {
				fleet = arg_34_2,
				shipVO = var_34_1,
				fleetIndex = arg_34_3,
				teamType = arg_34_4
			})
		end

		onButton(arg_34_0, var_34_3, var_34_5)
		var_34_4.onLongPressed:AddListener(function()
			if var_34_1 then
				arg_34_0:OnLongPressShip(arg_34_2[iter_34_0], arg_34_3)
			else
				var_34_5()
			end
		end)
	end
end

function var_0_0.updateCommanderBtn(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_2 <= arg_37_0:getLimitNums(arg_37_1)
	local var_37_1 = var_37_0 and arg_37_0.fleets[arg_37_1][arg_37_2]
	local var_37_2 = arg_37_0.tfFleets[arg_37_1][arg_37_2]
	local var_37_3 = var_37_2:Find("btn_select")
	local var_37_4 = var_37_2:Find("btn_clear")
	local var_37_5 = var_37_2:Find("btn_recom")
	local var_37_6 = var_37_2:Find("blank")
	local var_37_7 = var_37_2:Find("commander")

	setActive(var_37_3, false)
	setActive(var_37_4, var_37_0 and not arg_37_0.viewParent.contextData.showCommander)
	setActive(var_37_5, var_37_0 and not arg_37_0.viewParent.contextData.showCommander)
	setActive(var_37_7, var_37_0 and var_37_1 and arg_37_0.viewParent.contextData.showCommander)
	setActive(var_37_6, not var_37_0 or var_37_0 and not var_37_1 and arg_37_0.viewParent.contextData.showCommander)
end

function var_0_0.updateCommanders(arg_38_0, arg_38_1, arg_38_2)
	for iter_38_0 = 1, 2 do
		local var_38_0 = arg_38_2:getCommanderByPos(iter_38_0)
		local var_38_1 = arg_38_1:Find("pos" .. iter_38_0)
		local var_38_2 = var_38_1:Find("add")
		local var_38_3 = var_38_1:Find("info")

		setActive(var_38_2, not var_38_0)
		setActive(var_38_3, var_38_0)

		if var_38_0 then
			local var_38_4 = Commander.rarity2Frame(var_38_0:getRarity())

			setImageSprite(var_38_3:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. var_38_4))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. var_38_0:getPainting(), "", var_38_3:Find("mask/icon"))
		end

		onButton(arg_38_0, var_38_2, function()
			arg_38_0:InvokeParent("openCommanderPanel", arg_38_2, arg_38_2.id)
		end, SFX_PANEL)
		onButton(arg_38_0, var_38_3, function()
			arg_38_0:InvokeParent("openCommanderPanel", arg_38_2, arg_38_2.id)
		end, SFX_PANEL)
	end
end

function var_0_0.clearFleets(arg_41_0)
	for iter_41_0, iter_41_1 in pairs(arg_41_0.tfFleets) do
		_.each(iter_41_1, function(arg_42_0)
			arg_41_0:clearFleet(arg_42_0)
		end)
	end
end

function var_0_0.clearFleet(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1:Find(TeamType.Main)
	local var_43_1 = arg_43_1:Find(TeamType.Vanguard)
	local var_43_2 = arg_43_1:Find(TeamType.Submarine)

	if var_43_0 then
		removeAllChildren(var_43_0)
	end

	if var_43_1 then
		removeAllChildren(var_43_1)
	end

	if var_43_2 then
		removeAllChildren(var_43_2)
	end
end

function var_0_0.OnShow(arg_44_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_44_0._tf, {
		groupDelta = -1,
		groupName = "ActivityBossSceneTemplate"
	})
end

function var_0_0.OnHide(arg_45_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_45_0._tf, arg_45_0.viewParent._tf)
	triggerToggle(arg_45_0.commanderToggle, false)
	arg_45_0:HideChapterAutoPanel()
end

function var_0_0.OnCancel(arg_46_0)
	arg_46_0:InvokeParent("hideFleetEdit")
end

function var_0_0.OnCommit(arg_47_0)
	arg_47_0:InvokeParent("commitEdit")
end

function var_0_0.OnCombat(arg_48_0)
	arg_48_0:InvokeParent("commitEdit")
	arg_48_0:InvokeParent("commitCombat")
end

function var_0_0.OnTrybat(arg_49_0)
	arg_49_0:InvokeParent("commitEdit")
	arg_49_0:InvokeParent("commitTrybat")
end

function var_0_0.OnLongPressShip(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0:InvokeParent("openShipInfo", arg_50_1, arg_50_2)
end

function var_0_0.OnDestroy(arg_51_0)
	if arg_51_0.autoPanel then
		arg_51_0.autoPanel:Destroy()

		arg_51_0.autoPanel = nil
	end
end

return var_0_0
