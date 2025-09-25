local var_0_0 = class("CommanderBoxesPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderBoxesUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.boxCards = {}
	arg_2_0.startBtn = arg_2_0._tf:Find("frame/boxes/start_btn")
	arg_2_0.finishBtn = arg_2_0._tf:Find("frame/boxes/finish_btn")
	arg_2_0.quicklyFinishAllBtn = arg_2_0._tf:Find("frame/boxes/quick_all")
	arg_2_0.settingsBtn = arg_2_0._tf:Find("frame/boxes/setting_btn")
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/close_btn")
	arg_2_0.boxesList = UIItemList.New(arg_2_0._tf:Find("frame/boxes/mask/content"), arg_2_0._tf:Find("frame/boxes/mask/content/frame"))
	arg_2_0.scrollRect = arg_2_0._tf:Find("frame/boxes/mask")
	arg_2_0.traningCnt = arg_2_0._tf:Find("frame/boxes/statistics/traning"):GetComponent(typeof(Text))
	arg_2_0.waitCnt = arg_2_0._tf:Find("frame/boxes/statistics/wait"):GetComponent(typeof(Text))
	arg_2_0.itemCnt = arg_2_0._tf:Find("frame/item/Text"):GetComponent(typeof(Text))

	setActive(arg_2_0._tf:Find("frame/item"), not LOCK_CATTERY)

	arg_2_0.mask = arg_2_0._tf:Find("mask")

	setActive(arg_2_0.mask, false)

	arg_2_0.buildPoolPanel = CommanderBuildPoolPanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.quicklyToolPage = CommanderQuicklyToolPage.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0.quicklyToolMsgbox = CommanderQuicklyFinishBoxMsgBoxPage.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0.lockFlagSettingPage = CommanderLockFlagSettingPage.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.buildResultPage = GetCommanderResultPage.New(arg_2_0._tf, arg_2_0.event)

	setActive(arg_2_0._tf:Find("frame"), true)
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:RegisterEvent()
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.startBtn, function()
		local var_6_0 = 0

		for iter_6_0, iter_6_1 in ipairs(arg_3_0.boxes) do
			if iter_6_1:getState() == CommanderBox.STATE_EMPTY then
				var_6_0 = var_6_0 + 1
			end
		end

		if var_6_0 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_build_solt_deficiency"))

			return
		end

		arg_3_0.buildPoolPanel:ExecuteAction("Show", arg_3_0.pools, var_6_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.finishBtn, function()
		if #arg_3_0.boxes <= 0 then
			return
		end

		if getProxy(PlayerProxy):getRawData().commanderBagMax <= getProxy(CommanderProxy):getCommanderCnt() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_capcity_is_max"))

			if callback then
				callback()
			end

			return
		end

		scrollTo(arg_3_0.scrollRect, nil, 1)
		arg_3_0:emit(CommanderCatMediator.BATCH_GET, arg_3_0.boxes)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.settingsBtn, function()
		arg_3_0.lockFlagSettingPage:ExecuteAction("Show")
	end, SFX_PANEL)
	setActive(arg_3_0.settingsBtn, false)
	onButton(arg_3_0, arg_3_0.quicklyFinishAllBtn, function()
		local var_9_0 = Item.COMMANDER_QUICKLY_TOOL_ID

		if getProxy(BagProxy):getItemCountById(var_9_0) <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("cat_accelfrate_notenough"))

			return
		end

		local var_9_1, var_9_2, var_9_3, var_9_4 = getProxy(CommanderProxy):CalcQuickItemUsageCnt()

		if var_9_1 <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("noacceleration_tips"))

			return
		end

		arg_3_0.contextData.msgBox:ExecuteAction("Show", {
			content = i18n("acceleration_tips_1", var_9_1, var_9_2),
			content1 = i18n("acceleration_tips_2", var_9_4[1], var_9_4[2], var_9_4[3]),
			onYes = function()
				arg_3_0:emit(CommanderCatMediator.ONE_KEY, var_9_1, var_9_2, var_9_3)
			end
		})
	end, SFX_PANEL)
end

function var_0_0.RegisterEvent(arg_11_0)
	arg_11_0:bind(CommanderCatScene.MSG_QUICKLY_FINISH_TOOL_ERROR, function(arg_12_0)
		pg.TipsMgr.GetInstance():ShowTips(i18n("comander_tool_cnt_is_reclac"))
		triggerButton(arg_11_0.quicklyFinishAllBtn)
	end)
	arg_11_0:bind(CommanderCatScene.MSG_BUILD, function(arg_13_0)
		arg_11_0:Flush()
	end)
	arg_11_0:bind(CommanderCatScene.MSG_BATCH_BUILD, function(arg_14_0, arg_14_1)
		print(#arg_14_1)

		if arg_14_1 and #arg_14_1 > 0 then
			arg_11_0.buildResultPage:ExecuteAction("Show", arg_14_1)
		end
	end)
	arg_11_0:bind(CommanderCatScene.EVENT_QUICKLY_TOOL, function(arg_15_0, arg_15_1)
		local var_15_0 = Item.COMMANDER_QUICKLY_TOOL_ID

		arg_11_0.quicklyToolPage:ExecuteAction("Show", arg_15_1, var_15_0)
	end)
	arg_11_0:bind(CommanderCatScene.MSG_OPEN_BOX, function(arg_16_0, arg_16_1, arg_16_2)
		arg_11_0:PlayAnimation(arg_16_1, arg_16_2)
	end)
end

function var_0_0.Update(arg_17_0)
	arg_17_0:Show()
	arg_17_0:Flush()
end

function var_0_0.Flush(arg_18_0)
	arg_18_0.boxes = getProxy(CommanderProxy):getBoxes()
	arg_18_0.pools = getProxy(CommanderProxy):getPools()

	arg_18_0:UpdateList()
	arg_18_0:UpdateItem()
	arg_18_0:updateCntLabel()
end

function var_0_0.UpdateList(arg_19_0)
	local var_19_0 = _.map(arg_19_0.boxes, function(arg_20_0)
		arg_20_0.state = arg_20_0:getState()

		return arg_20_0
	end)

	table.sort(var_19_0, function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_0.state
		local var_21_1 = arg_21_1.state

		if var_21_0 == var_21_1 then
			return arg_21_0.index < arg_21_1.index
		else
			return var_21_1 < var_21_0
		end
	end)
	arg_19_0.boxesList:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_19_0[arg_22_1 + 1]
			local var_22_1 = arg_19_0.boxCards[arg_22_1]

			if not var_22_1 then
				var_22_1 = CommanderBoxCard.New(arg_19_0, arg_22_2)
				arg_19_0.boxCards[arg_22_1] = var_22_1
			end

			local var_22_2 = arg_22_1 > 3 and var_22_0.state == CommanderBox.STATE_EMPTY

			if not var_22_2 then
				var_22_1:Update(var_22_0)
			else
				var_22_1:Clear()
			end

			setActive(arg_22_2, not var_22_2)
		end
	end)
	arg_19_0.boxesList:align(#var_19_0)
end

function var_0_0.updateCntLabel(arg_23_0)
	local var_23_0 = 0
	local var_23_1 = 0

	_.each(arg_23_0.boxes, function(arg_24_0)
		arg_24_0.state = arg_24_0:getState()

		if arg_24_0.state == CommanderBox.STATE_WAITING then
			var_23_1 = var_23_1 + 1
		elseif arg_24_0.state == CommanderBox.STATE_STARTING then
			var_23_0 = var_23_0 + 1
		end
	end)

	arg_23_0.traningCnt.text = var_23_0 .. "/" .. CommanderProxy.MAX_WORK_COUNT
	arg_23_0.waitCnt.text = var_23_1 .. "/" .. CommanderProxy.MAX_SLOT - CommanderProxy.MAX_WORK_COUNT
end

function var_0_0.Show(arg_25_0)
	arg_25_0.activation = true

	setActive(arg_25_0._go, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_25_0._tf)
end

function var_0_0.Hide(arg_26_0)
	arg_26_0.activation = false

	setActive(arg_26_0._go, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_26_0._tf, arg_26_0._parentTf)
end

function var_0_0.isShow(arg_27_0)
	return arg_27_0.activation
end

function var_0_0.PlayAnimation(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0

	for iter_28_0, iter_28_1 in pairs(arg_28_0.boxCards) do
		if iter_28_1.boxVO and iter_28_1.boxVO.id == arg_28_1 then
			var_28_0 = iter_28_1

			break
		end
	end

	if var_28_0 then
		var_28_0:playAnim(arg_28_2)
	else
		arg_28_2()
	end
end

function var_0_0.CanBack(arg_29_0)
	if arg_29_0.buildPoolPanel and arg_29_0.buildPoolPanel:GetLoaded() and arg_29_0.buildPoolPanel:isShowing() then
		arg_29_0.buildPoolPanel:Hide()

		return false
	end

	if arg_29_0.quicklyToolPage and arg_29_0.quicklyToolPage:GetLoaded() and arg_29_0.quicklyToolPage:isShowing() then
		arg_29_0.quicklyToolPage:Hide()

		return false
	end

	if arg_29_0.quicklyToolMsgbox and arg_29_0.quicklyToolMsgbox:GetLoaded() and arg_29_0.quicklyToolMsgbox:isShowing() then
		arg_29_0.quicklyToolMsgbox:Hide()

		return false
	end

	if arg_29_0.lockFlagSettingPage and arg_29_0.lockFlagSettingPage:GetLoaded() and arg_29_0.lockFlagSettingPage:isShowing() then
		arg_29_0.lockFlagSettingPage:Hide()

		return false
	end

	if arg_29_0.buildResultPage and arg_29_0.buildResultPage:GetLoaded() and arg_29_0.buildResultPage:isShowing() then
		arg_29_0.buildResultPage:Hide()

		return false
	end

	return true
end

function var_0_0.UpdateItem(arg_30_0)
	arg_30_0.itemCnt.text = getProxy(BagProxy):getItemCountById(Item.COMMANDER_QUICKLY_TOOL_ID)
end

function var_0_0.OnDestroy(arg_31_0)
	arg_31_0:Hide()

	for iter_31_0, iter_31_1 in pairs(arg_31_0.boxCards or {}) do
		iter_31_1:Destroy()
	end

	arg_31_0.boxCards = {}

	if arg_31_0.quicklyToolMsgbox then
		arg_31_0.quicklyToolMsgbox:Destroy()

		arg_31_0.quicklyToolMsgbox = nil
	end

	if arg_31_0.lockFlagSettingPage then
		arg_31_0.lockFlagSettingPage:Destroy()

		arg_31_0.lockFlagSettingPage = nil
	end

	if arg_31_0.buildResultPage then
		arg_31_0.buildResultPage:Destroy()

		arg_31_0.buildResultPage = nil
	end
end

return var_0_0
