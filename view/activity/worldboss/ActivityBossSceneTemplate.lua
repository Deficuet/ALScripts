local var_0_0 = class("ActivityBossSceneTemplate", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	error("Need Complete")
end

function var_0_0.getGroupName(arg_2_0)
	return "ActivityBossSceneTemplate"
end

var_0_0.optionsPath = {
	"adapt/top/option"
}

function var_0_0.init(arg_3_0)
	arg_3_0.mainTF = arg_3_0:findTF("adapt")
	arg_3_0.bg = arg_3_0:findTF("bg")
	arg_3_0.bottom = arg_3_0:findTF("bottom", arg_3_0.mainTF)
	arg_3_0.hpBar = arg_3_0:findTF("progress", arg_3_0.bottom)
	arg_3_0.barList = {}

	for iter_3_0 = 1, 4 do
		arg_3_0.barList[iter_3_0] = arg_3_0:findTF(iter_3_0, arg_3_0.hpBar)
	end

	arg_3_0.progressDigit = arg_3_0:findTF("digit", arg_3_0.bottom)
	arg_3_0.digitbig = arg_3_0.progressDigit:Find("big")
	arg_3_0.digitsmall = arg_3_0.progressDigit:Find("small")
	arg_3_0.left = arg_3_0:findTF("left", arg_3_0.mainTF)
	arg_3_0.rankTF = arg_3_0:findTF("rank", arg_3_0.left)
	arg_3_0.rankList = CustomIndexLayer.Clone2Full(arg_3_0.rankTF:Find("layout"), 3)

	for iter_3_1, iter_3_2 in ipairs(arg_3_0.rankList) do
		setActive(iter_3_2, false)
	end

	arg_3_0.right = arg_3_0:findTF("right", arg_3_0.mainTF)
	arg_3_0.stageList = {}

	for iter_3_3 = 1, 4 do
		arg_3_0.stageList[iter_3_3] = arg_3_0:findTF(iter_3_3, arg_3_0.right)
	end

	arg_3_0.stageSP = arg_3_0:findTF("5", arg_3_0.right)

	if not IsNil(arg_3_0.stageSP) then
		setActive(arg_3_0.stageSP, false)
	end

	arg_3_0.awardFlash = arg_3_0:findTF("ptaward/flash", arg_3_0.right)
	arg_3_0.awardBtn = arg_3_0:findTF("ptaward/button", arg_3_0.right)
	arg_3_0.ptScoreTxt = arg_3_0:findTF("ptaward/Text", arg_3_0.right)
	arg_3_0.top = arg_3_0:findTF("top", arg_3_0.mainTF)
	arg_3_0.ticketNum = arg_3_0:findTF("ticket/Text", arg_3_0.top)
	arg_3_0.helpBtn = arg_3_0:findTF("help", arg_3_0.top)

	onButton(arg_3_0, arg_3_0.top:Find("back_btn"), function()
		arg_3_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
	setActive(arg_3_0.top, false)
	setAnchoredPosition(arg_3_0.top, {
		y = 1080
	})
	setActive(arg_3_0.left, false)
	setAnchoredPosition(arg_3_0.left, {
		x = -1920
	})
	setActive(arg_3_0.right, false)
	setAnchoredPosition(arg_3_0.right, {
		x = 1920
	})
	setActive(arg_3_0.bottom, false)
	setAnchoredPosition(arg_3_0.bottom, {
		y = -1080
	})
	arg_3_0:buildCommanderPanel()
end

function var_0_0.GetBonusWindow(arg_5_0)
	if not arg_5_0.bonusWindow then
		arg_5_0.bonusWindow = ActivityBossPtAwardSubPanel.New(arg_5_0)

		arg_5_0.bonusWindow:Load()
	end

	return arg_5_0.bonusWindow
end

function var_0_0.DestroyBonusWindow(arg_6_0)
	if arg_6_0.bonusWindow then
		arg_6_0.bonusWindow:Destroy()

		arg_6_0.bonusWindow = nil
	end
end

function var_0_0.GetFleetEditPanel(arg_7_0)
	if not arg_7_0.fleetEditPanel then
		arg_7_0.fleetEditPanel = ActivityBossBattleFleetSelectSubPanel.New(arg_7_0)

		arg_7_0.fleetEditPanel:Load()
	end

	return arg_7_0.fleetEditPanel
end

function var_0_0.DestroyFleetEditPanel(arg_8_0)
	if arg_8_0.fleetEditPanel then
		arg_8_0.fleetEditPanel:Destroy()

		arg_8_0.fleetEditPanel = nil
	end
end

function var_0_0.EnterAnim(arg_9_0)
	setActive(arg_9_0.top, true)
	setActive(arg_9_0.left, true)
	setActive(arg_9_0.right, true)
	setActive(arg_9_0.bottom, true)
	arg_9_0.mainTF:GetComponent("Animation"):Play("Enter_Animation")
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.awardBtn, function()
		arg_10_0:ShowAwards()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.world_boss_help.tip
		})
	end, SFX_PANEL)
	arg_10_0:UpdateDropItems()

	for iter_10_0 = 1, #arg_10_0.stageList - 1 do
		onButton(arg_10_0, arg_10_0.stageList[iter_10_0], function()
			if arg_10_0.contextData.activity:checkBattleTimeInBossAct() then
				arg_10_0:ShowNormalFleet(iter_10_0, true)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
			end
		end, SFX_PANEL)
	end

	onButton(arg_10_0, arg_10_0.stageList[#arg_10_0.stageList], function()
		if arg_10_0.contextData.activity:checkBattleTimeInBossAct() then
			arg_10_0:ShowEXFleet()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		end
	end, SFX_PANEL)

	if not IsNil(arg_10_0.stageSP) then
		setActive(arg_10_0.stageSP, arg_10_0.contextData.spStageID)
		onButton(arg_10_0, arg_10_0.stageSP, function()
			if arg_10_0.contextData.activity:checkBattleTimeInBossAct() then
				arg_10_0:emit(ActivityBossMediatorTemplate.ONEN_BUFF_SELECT)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
			end
		end, SFX_PANEL)
	end

	if arg_10_0.contextData.editFleet then
		local var_10_0 = arg_10_0.contextData.editFleet

		if var_10_0 <= #arg_10_0.contextData.normalStageIDs then
			arg_10_0:ShowNormalFleet(var_10_0)
		elseif arg_10_0.contextData.editFleet == #arg_10_0.contextData.normalStageIDs + 1 then
			arg_10_0:ShowEXFleet()
		elseif arg_10_0.contextData.editFleet == #arg_10_0.contextData.normalStageIDs + 2 then
			arg_10_0:ShowSPFleet()
		end
	end

	arg_10_0:EnterAnim()

	if arg_10_0.contextData.msg then
		local var_10_1 = arg_10_0.contextData.msg.param

		switch(arg_10_0.contextData.msg.type, {
			lastBonus = function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox(var_10_1)
			end,
			oil = function()
				if not ItemTipPanel.ShowOilBuyTip(var_10_1) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))
				end
			end,
			shipCapacity = function()
				BeginStageCommand.DockOverload()
			end,
			energy = function()
				Fleet.EnergyCheck(_.map(_.values(var_10_1.ships), function(arg_20_0)
					return getProxy(BayProxy):getShipById(arg_20_0)
				end), Fleet.DEFAULT_NAME_BOSS_ACT[var_10_1.id], function(arg_21_0)
					if arg_21_0 then
						arg_10_0:emit(PreCombatMediator.BEGIN_STAGE_PROXY, {
							curFleetId = var_10_1.id
						})
					end
				end)
			end
		})

		arg_10_0.contextData.msg = nil
	end
end

function var_0_0.UpdateView(arg_22_0)
	arg_22_0:UpdatePage()
	arg_22_0:CheckStory()
end

function var_0_0.CheckStory(arg_23_0)
	local var_23_0 = pg.NewStoryMgr.GetInstance()
	local var_23_1 = arg_23_0.contextData.activity:getConfig("config_client").story

	table.SerialIpairsAsync(var_23_1, function(arg_24_0, arg_24_1, arg_24_2)
		if arg_23_0.contextData.bossHP < arg_24_1[1] + ((arg_24_0 == 1 or arg_24_1[1] == 0) and 1 or 0) and not pg.NewStoryMgr.GetInstance():IsPlayed(arg_24_1[2]) then
			var_23_0:Play(arg_24_1[2], arg_24_2)

			return
		end

		arg_24_2()
	end)
end

function var_0_0.UpdatePage(arg_25_0)
	local var_25_0 = arg_25_0.contextData.bossHP

	setText(arg_25_0.digitbig, math.floor(var_25_0 / 100))
	setText(arg_25_0.digitsmall, string.format("%02d", var_25_0 % 100) .. "%")

	local var_25_1 = pg.TimeMgr.GetInstance()

	for iter_25_0 = 1, 4 do
		local var_25_2 = arg_25_0.barList[iter_25_0]

		setSlider(arg_25_0:findTF("Slider", var_25_2), 0, 2500, math.min(math.max(var_25_0 - (iter_25_0 - 1) * 2500, 0), 2500))

		local var_25_3 = arg_25_0.contextData.mileStones[5 - iter_25_0]

		setActive(arg_25_0:findTF("milestone/item", var_25_2), not var_25_3)
		setActive(arg_25_0:findTF("milestone/time", var_25_2), var_25_3)

		if var_25_3 then
			local var_25_4 = var_25_1:STimeDescC(arg_25_0.contextData.mileStones[5 - iter_25_0], "%m/%d/%H:%M")

			setText(arg_25_0:findTF("milestone/time/Text", var_25_2), var_25_4)
		end
	end

	for iter_25_1 = 1, #arg_25_0.stageList - 1 do
		local var_25_5 = arg_25_0.contextData.normalStageIDs[iter_25_1]
		local var_25_6 = arg_25_0.stageList[iter_25_1]

		for iter_25_2, iter_25_3 in ipairs(arg_25_0.contextData.ticketInitPools) do
			for iter_25_4, iter_25_5 in ipairs(iter_25_3[1]) do
				if iter_25_5 == var_25_5 then
					local var_25_7 = iter_25_3[2]
					local var_25_8 = arg_25_0.contextData.stageTickets[var_25_5] or 0

					setActive(var_25_6:Find("Text"), var_25_8 > 0)
					setText(var_25_6:Find("Text"), string.format("%d/%d", var_25_8, var_25_7))
				end
			end
		end
	end

	setText(arg_25_0.ptScoreTxt, arg_25_0.contextData.ptData.count)
	setActive(arg_25_0.awardFlash, arg_25_0.contextData.ptData:CanGetAward())

	if arg_25_0.bonusWindow and arg_25_0.bonusWindow:IsShowing() then
		arg_25_0.bonusWindow.buffer:UpdateView(arg_25_0.contextData.ptData)
	end

	local var_25_9 = arg_25_0:GetEXTicket()

	setText(arg_25_0.ticketNum, var_25_9)
end

function var_0_0.GetEXTicket(arg_26_0)
	return getProxy(PlayerProxy):getRawData():getResource(arg_26_0.contextData.TicketID)
end

function var_0_0.ShowNormalFleet(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_0.contextData.actFleets[arg_27_1] then
		arg_27_0.contextData.actFleets[arg_27_1] = arg_27_0:CreateNewFleet(arg_27_1)
	end

	if not arg_27_0.contextData.actFleets[arg_27_1 + 10] then
		arg_27_0.contextData.actFleets[arg_27_1 + 10] = arg_27_0:CreateNewFleet(arg_27_1 + 10)
	end

	local var_27_0 = arg_27_0.contextData.actFleets[arg_27_1]

	if arg_27_2 and #var_27_0.ships <= 0 then
		for iter_27_0 = #arg_27_0.contextData.normalStageIDs, 1, -1 do
			local var_27_1 = arg_27_0.contextData.actFleets[iter_27_0]

			if iter_27_0 ~= arg_27_1 and var_27_1 and var_27_1:isLegalToFight() == true then
				var_27_0:updateShips(var_27_1.ships)

				break
			end
		end
	end

	local var_27_2 = arg_27_0:GetFleetEditPanel()

	var_27_2.buffer:SetSettings(1, 1, false)
	var_27_2.buffer:SetFleets({
		arg_27_0.contextData.actFleets[arg_27_1],
		arg_27_0.contextData.actFleets[arg_27_1 + 10]
	})

	local var_27_3 = arg_27_0.contextData.useOilLimit[arg_27_1]
	local var_27_4 = arg_27_0.contextData.normalStageIDs[arg_27_1]

	if not arg_27_0.contextData.activity:IsOilLimit(var_27_4) then
		var_27_3 = {
			0,
			0
		}
	end

	var_27_2.buffer:SetOilLimit(var_27_3)

	arg_27_0.contextData.editFleet = arg_27_1

	var_27_2.buffer:UpdateView()
	var_27_2.buffer:Show()
end

function var_0_0.ShowEXFleet(arg_28_0)
	local var_28_0 = #arg_28_0.contextData.normalStageIDs + 1

	if not arg_28_0.contextData.actFleets[var_28_0] then
		arg_28_0.contextData.actFleets[var_28_0] = arg_28_0:CreateNewFleet(var_28_0)
	end

	if not arg_28_0.contextData.actFleets[var_28_0 + 10] then
		arg_28_0.contextData.actFleets[var_28_0 + 10] = arg_28_0:CreateNewFleet(var_28_0 + 10)
	end

	local var_28_1 = arg_28_0:GetFleetEditPanel()

	var_28_1.buffer:SetSettings(1, 1, true)
	var_28_1.buffer:SetFleets({
		arg_28_0.contextData.actFleets[var_28_0],
		arg_28_0.contextData.actFleets[var_28_0 + 10]
	})

	local var_28_2 = arg_28_0.contextData.useOilLimit[var_28_0]
	local var_28_3 = arg_28_0.contextData.exStageID

	if not arg_28_0.contextData.activity:IsOilLimit(var_28_3) then
		var_28_2 = {
			0,
			0
		}
	end

	var_28_1.buffer:SetOilLimit(var_28_2)

	arg_28_0.contextData.editFleet = var_28_0

	var_28_1.buffer:UpdateView()
	var_28_1.buffer:Show()
end

function var_0_0.ShowSPFleet(arg_29_0)
	local var_29_0 = #arg_29_0.contextData.normalStageIDs + 2

	if not arg_29_0.contextData.actFleets[var_29_0] then
		arg_29_0.contextData.actFleets[var_29_0] = arg_29_0:CreateNewFleet(var_29_0)
	end

	if not arg_29_0.contextData.actFleets[var_29_0 + 10] then
		arg_29_0.contextData.actFleets[var_29_0 + 10] = arg_29_0:CreateNewFleet(var_29_0 + 10)
	end

	local var_29_1 = arg_29_0:GetFleetEditPanel()

	var_29_1.buffer:SetSettings(1, 1, false)
	var_29_1.buffer:SetFleets({
		arg_29_0.contextData.actFleets[var_29_0],
		arg_29_0.contextData.actFleets[var_29_0 + 10]
	})

	local var_29_2 = {
		0,
		0
	}

	var_29_1.buffer:SetOilLimit(var_29_2)

	arg_29_0.contextData.editFleet = var_29_0

	var_29_1.buffer:UpdateView()
	var_29_1.buffer:Show()
end

function var_0_0.commitEdit(arg_30_0)
	arg_30_0:emit(arg_30_0.contextData.mediatorClass.ON_COMMIT_FLEET)
end

function var_0_0.commitCombat(arg_31_0)
	if arg_31_0.contextData.editFleet <= #arg_31_0.contextData.normalStageIDs then
		arg_31_0:emit(arg_31_0.contextData.mediatorClass.ON_PRECOMBAT, arg_31_0.contextData.editFleet)
	elseif arg_31_0.contextData.editFleet == #arg_31_0.contextData.normalStageIDs + 1 then
		arg_31_0:emit(arg_31_0.contextData.mediatorClass.ON_EX_PRECOMBAT, arg_31_0.contextData.editFleet, false)
	elseif arg_31_0.contextData.editFleet <= #arg_31_0.contextData.normalStageIDs + 2 then
		arg_31_0:emit(arg_31_0.contextData.mediatorClass.ON_SP_PRECOMBAT, arg_31_0.contextData.editFleet, false)
	end
end

function var_0_0.commitTrybat(arg_32_0)
	arg_32_0:emit(arg_32_0.contextData.mediatorClass.ON_EX_PRECOMBAT, arg_32_0.contextData.editFleet, true)
end

function var_0_0.updateEditPanel(arg_33_0)
	if arg_33_0.fleetEditPanel then
		arg_33_0.fleetEditPanel.buffer:UpdateView()
	end
end

function var_0_0.hideFleetEdit(arg_34_0)
	if arg_34_0.fleetEditPanel then
		arg_34_0.fleetEditPanel.buffer:Hide()
	end

	if arg_34_0.commanderFormationPanel then
		arg_34_0.commanderFormationPanel.buffer:Close()
	end

	arg_34_0.contextData.editFleet = nil
end

function var_0_0.openShipInfo(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_0.contextData.actFleets[arg_35_2]
	local var_35_1 = {}
	local var_35_2 = getProxy(BayProxy)

	for iter_35_0, iter_35_1 in ipairs(var_35_0 and var_35_0.ships or {}) do
		table.insert(var_35_1, var_35_2:getShipById(iter_35_1))
	end

	arg_35_0:emit(arg_35_0.contextData.mediatorClass.ON_FLEET_SHIPINFO, {
		shipId = arg_35_1,
		shipVOs = var_35_1
	})
end

function var_0_0.setCommanderPrefabs(arg_36_0, arg_36_1)
	arg_36_0.commanderPrefabs = arg_36_1
end

function var_0_0.openCommanderPanel(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0.contextData.activityID

	arg_37_0.levelCMDFormationView:setCallback(function(arg_38_0)
		if arg_38_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_37_0:emit(ActivityBossMediatorTemplate.ON_COMMANDER_SKILL, arg_38_0.skill)
		elseif arg_38_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_37_0.contextData.eliteCommanderSelected = {
				fleetIndex = arg_37_2,
				cmdPos = arg_38_0.pos,
				mode = arg_37_0.curMode
			}

			arg_37_0:emit(ActivityBossMediatorTemplate.ON_SELECT_COMMANDER, arg_37_2, arg_38_0.pos)
		else
			arg_37_0:emit(ActivityBossMediatorTemplate.COMMANDER_FORMATION_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_ACTIVITY,
				data = arg_38_0,
				fleetId = arg_37_1.id,
				actId = var_37_0
			})
		end
	end)
	arg_37_0.levelCMDFormationView:Load()
	arg_37_0.levelCMDFormationView:ActionInvoke("update", arg_37_1, arg_37_0.commanderPrefabs)
	arg_37_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderFleet(arg_39_0, arg_39_1)
	if arg_39_0.levelCMDFormationView:isShowing() then
		arg_39_0.levelCMDFormationView:ActionInvoke("updateFleet", arg_39_1)
	end
end

function var_0_0.updateCommanderPrefab(arg_40_0)
	if arg_40_0.levelCMDFormationView:isShowing() then
		arg_40_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_40_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_41_0)
	if arg_41_0.levelCMDFormationView:isShowing() then
		arg_41_0.levelCMDFormationView:ActionInvoke("Hide")
	end
end

function var_0_0.buildCommanderPanel(arg_42_0)
	arg_42_0.levelCMDFormationView = LevelCMDFormationView.New(arg_42_0._tf, arg_42_0.event, arg_42_0.contextData)
end

function var_0_0.destroyCommanderPanel(arg_43_0)
	arg_43_0.levelCMDFormationView:Destroy()

	arg_43_0.levelCMDFormationView = nil
end

function var_0_0.ShowAwards(arg_44_0)
	local var_44_0 = arg_44_0:GetBonusWindow()

	var_44_0.buffer:UpdateView(arg_44_0.contextData.ptData)
	var_44_0.buffer:Show()
end

function var_0_0.CreateNewFleet(arg_45_0, arg_45_1)
	return TypedFleet.New({
		id = arg_45_1,
		ship_list = {},
		commanders = {},
		fleetType = arg_45_1 > 10 and FleetType.Submarine or FleetType.Normal
	})
end

function var_0_0.UpdateRank(arg_46_0, arg_46_1)
	arg_46_1 = arg_46_1 or {}

	for iter_46_0 = 1, #arg_46_0.rankList do
		local var_46_0 = arg_46_0.rankList[iter_46_0]

		setActive(var_46_0, iter_46_0 <= #arg_46_1)

		if iter_46_0 <= #arg_46_1 then
			local var_46_1 = var_46_0:Find("Text")

			setText(var_46_1, tostring(arg_46_1[iter_46_0].name))
		end
	end
end

function var_0_0.UpdateDropItems(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.contextData.DisplayItems or {}) do
		local var_47_0 = arg_47_0:findTF("milestone/item", arg_47_0.barList[iter_47_0])
		local var_47_1 = Drop.New({
			type = arg_47_0.contextData.DisplayItems[5 - iter_47_0][1],
			id = arg_47_0.contextData.DisplayItems[5 - iter_47_0][2],
			count = arg_47_0.contextData.DisplayItems[5 - iter_47_0][3]
		})

		onButton(arg_47_0, var_47_0, function()
			arg_47_0:emit(var_0_0.ON_DROP, var_47_1)
		end, SFX_PANEL)
	end
end

function var_0_0.onBackPressed(arg_49_0)
	if arg_49_0.bonusWindow and arg_49_0.bonusWindow:IsShowing() then
		arg_49_0.bonusWindow.buffer:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_49_0)
end

function var_0_0.willExit(arg_50_0)
	arg_50_0:DestroyBonusWindow()
	arg_50_0:DestroyFleetEditPanel()
	arg_50_0:destroyCommanderPanel()
end

return var_0_0
