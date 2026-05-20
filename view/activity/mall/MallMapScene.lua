local var_0_0 = class("MallMapScene", import("view.base.BaseUI"))

var_0_0.TYPE2INFOS = {
	[MallActivity.POINT_TYPE.SITE] = {
		"name_bg_blue",
		i18n("mall_point_name_type1"),
		"icon_site"
	},
	[MallActivity.POINT_TYPE.MAIN_STORY] = {
		"name_bg_green",
		i18n("mall_point_name_type2"),
		"icon_branch"
	},
	[MallActivity.POINT_TYPE.BRANCH_STORY] = {
		"name_bg_green",
		i18n("mall_point_name_type3"),
		"icon_branch"
	},
	[MallActivity.POINT_TYPE.INTERACT_STORY] = {
		"name_bg_orange",
		i18n("mall_point_name_type4"),
		""
	}
}

function var_0_0.getUIName(arg_1_0)
	return "MallMapUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBackBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiHomeBtn, function()
		arg_2_0:quickExitFunc()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiHelpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.mall_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiMallBtn, function()
		arg_2_0:emit(MallMapMediator.CHANGE_SCENE, SCENE.MALL)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiBookBtn, function()
		arg_2_0:emit(MallMapMediator.GO_SUBLAYER, Context.New({
			mediator = MallStoryLineMediator,
			viewComponent = MallStoryLineLayer
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiOrderBtn, function()
		arg_2_0:emit(MallMapMediator.GO_SUBLAYER, Context.New({
			mediator = MallOrderMediator,
			viewComponent = MallOrderLayer,
			data = {
				onExit = function()
					arg_2_0:UpdateOrderTip()
				end
			}
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiSummaryBtn, function()
		arg_2_0:ShowSummaryBox()
	end, SFX_PANEL)

	arg_2_0.pointUIList = UIItemList.New(arg_2_0.uiContentTF, arg_2_0.uiContentTF:Find("tpl"))

	arg_2_0.pointUIList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_2_0:UpdatePointTpl(arg_11_1, arg_11_2)
		end
	end)

	arg_2_0.siteBox = MallSiteBox.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.summaryBox = MallSummaryBox.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)

	setText(arg_2_0.uiTitleText, i18n("mall_title"))
	setText(arg_2_0.uiTitleEnText, i18n("mall_title_en"))
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0:UpdateData()
	arg_12_0:UpdateView()
	arg_12_0:UpdateBg()
	arg_12_0:CheckGuide()
end

function var_0_0.CheckGuide(arg_13_0)
	if not pg.NewStoryMgr.GetInstance():IsPlayed("MALL_GUIDE") then
		pg.NewGuideMgr.GetInstance():Play("MALL_GUIDE")
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "MALL_GUIDE"
		})

		return
	end

	if not pg.NewStoryMgr.GetInstance():IsPlayed("MALL_GUIDE_2") then
		pg.NewGuideMgr.GetInstance():Play("MALL_GUIDE_2")
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "MALL_GUIDE_2"
		})

		return
	end
end

function var_0_0.UpdateData(arg_14_0)
	arg_14_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MALL)

	assert(arg_14_0.activity and not arg_14_0.activity:isEnd(), "not exist mall act, type: " .. ActivityConst.ACTIVITY_TYPE_MALL)

	arg_14_0.triggeredIds = arg_14_0.activity:GetTriggeredPointIds()

	local var_14_0 = arg_14_0.activity:GetLevelData():GetUnlockStoryIdsByType()

	arg_14_0.showPointIds = {}

	for iter_14_0, iter_14_1 in pairs(var_14_0) do
		local var_14_1 = iter_14_0 ~= MallActivity.POINT_TYPE.SITE
		local var_14_2 = underscore.detect(iter_14_1, function(arg_15_0)
			local var_15_0 = pg.activity_mall_story[arg_15_0]

			return not table.contains(arg_14_0.triggeredIds, arg_15_0) or var_14_1 and var_15_0.lua ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_15_0.lua)
		end)

		if var_14_2 then
			table.insert(arg_14_0.showPointIds, var_14_2)
		end
	end

	arg_14_0.bgConfig = arg_14_0.activity:getConfig("config_client").bg_switch
end

function var_0_0.UpdateView(arg_16_0)
	arg_16_0.pointUIList:align(#arg_16_0.showPointIds)
	arg_16_0:UpdateOrderBtn()
	arg_16_0:UpdateTips()
end

function var_0_0.UpdateBg(arg_17_0)
	local var_17_0 = arg_17_0:GetCurBg()

	if var_17_0 then
		setImageSprite(arg_17_0.uiBgTF, LoadSprite("bg/" .. var_17_0), false)
	end
end

function var_0_0.GetCurBg(arg_18_0)
	for iter_18_0 = #arg_18_0.bgConfig, 1, -1 do
		local var_18_0 = arg_18_0.bgConfig[iter_18_0]

		if pg.NewStoryMgr.GetInstance():IsPlayed(var_18_0[1]) then
			return var_18_0[2]
		end
	end

	return nil
end

function var_0_0.UpdateOrderBtn(arg_19_0)
	setActive(arg_19_0.uiOrderTimeTF, false)

	arg_19_0.orderData = arg_19_0.activity:GetOrderData()

	if arg_19_0.orderData.id ~= 0 then
		if pg.TimeMgr.GetInstance():GetServerTime() < arg_19_0.orderData:GetEndTime() then
			setActive(arg_19_0.uiOrderTimeTF, true)
			arg_19_0:StartTimer()
		end
	else
		arg_19_0:StopTimer()
	end
end

function var_0_0.UpdateTips(arg_20_0)
	setActive(arg_20_0.uiMallTip, var_0_0.IsMallTip())
	arg_20_0:UpdateOrderTip()
end

function var_0_0.UpdateOrderTip(arg_21_0)
	setActive(arg_21_0.uiOrderTip, MallScene.IsOrderTip())
end

function var_0_0.UpdatePointTpl(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.showPointIds[arg_22_1 + 1]

	arg_22_2.name = var_22_0

	local var_22_1 = pg.activity_mall_story[var_22_0]

	setAnchoredPosition(arg_22_2, {
		x = var_22_1.posion[1],
		y = var_22_1.posion[2]
	})

	local var_22_2 = var_22_1.type
	local var_22_3 = var_0_0.TYPE2INFOS[var_22_2]

	GetImageSpriteFromAtlasAsync("ui/mallmapui_atlas", var_22_3[1], arg_22_2:Find("name"), true)
	setText(arg_22_2:Find("name/Text"), var_22_3[2])

	local var_22_4 = var_22_2 == MallActivity.POINT_TYPE.INTERACT_STORY

	setActive(arg_22_2:Find("ship"), var_22_4)
	setActive(arg_22_2:Find("icon"), not var_22_4)

	if var_22_4 then
		GetImageSpriteFromAtlasAsync(var_22_1.icon, "", arg_22_2:Find("ship"))
	else
		GetImageSpriteFromAtlasAsync("ui/mallmapui_atlas", var_22_3[3], arg_22_2:Find("icon"), true)
	end

	onButton(arg_22_0, arg_22_2, function()
		if not table.contains(arg_22_0.triggeredIds, var_22_0) then
			arg_22_0:emit(MallMapMediator.TRIGGER_POINT, arg_22_0.activity.id, var_22_0)
		end

		if var_22_2 == MallActivity.POINT_TYPE.SITE then
			arg_22_0.siteBox:ExecuteAction("Show", var_22_0)
		else
			pg.NewStoryMgr.GetInstance():Play(var_22_1.lua, function()
				arg_22_0:didEnter()
			end)
		end
	end, SFX_PANEL)
end

function var_0_0.StartTimer(arg_25_0)
	arg_25_0:StopTimer()

	arg_25_0.orderEndTime = arg_25_0.orderData:GetEndTime()
	arg_25_0.timer = Timer.New(function()
		local var_26_0 = arg_25_0.orderEndTime - pg.TimeMgr.GetInstance():GetServerTime()

		setText(arg_25_0.uiOrderTimeTF:Find("Text"), pg.TimeMgr.GetInstance():DescCDTime(var_26_0))

		if var_26_0 <= 0 then
			arg_25_0:UpdateOrderBtn()
			setActive(arg_25_0.uiOrderTip, true)
		end
	end, 1, -1)

	arg_25_0.timer:Start()
	arg_25_0.timer.func()
end

function var_0_0.StopTimer(arg_27_0)
	if arg_27_0.timer then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end
end

function var_0_0.ShowSummaryBox(arg_28_0)
	arg_28_0.summaryBox:ExecuteAction("Show")
end

function var_0_0.onBackPressed(arg_29_0)
	if arg_29_0.siteBox and arg_29_0.siteBox:isShowing() then
		arg_29_0.siteBox:ExecuteAction("Hide")

		return
	end

	if arg_29_0.summaryBox and arg_29_0.summaryBox:isShowing() then
		arg_29_0.summaryBox:ExecuteAction("Hide")

		return
	end

	var_0_0.super.onBackPressed(arg_29_0)
end

function var_0_0.willExit(arg_30_0)
	if arg_30_0.siteBox then
		arg_30_0.siteBox:Destroy()

		arg_30_0.siteBox = nil
	end

	if arg_30_0.summaryBox then
		arg_30_0.summaryBox:Destroy()

		arg_30_0.summaryBox = nil
	end

	arg_30_0:StopTimer()
end

function var_0_0.IsMallTip()
	return MallScene.IsAwardTip() or MallScene.IsOrderTip()
end

function var_0_0.IsEntranceTip()
	local var_32_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MALL)

	if not var_32_0 or var_32_0:isEnd() then
		return false
	end

	return MallScene.IsMapTip() or var_0_0.IsMallTip()
end

return var_0_0
