local var_0_0 = class("EducateMapScene", import("..base.EducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EducateMapUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	if getProxy(EducateProxy):NeedRequestOptsData() then
		pg.m02:sendNotification(GAME.EDUCATE_REQUEST_OPTION, {
			callback = arg_2_1
		})
	else
		arg_2_1()
	end
end

function var_0_0.getResource(arg_3_0)
	local var_3_0 = var_0_0.super.getResource(arg_3_0)
	local var_3_1 = {
		"ui/EducateDatePanel",
		"ui/EducateResPanel",
		"ui/EducateTopPanel",
		"ui/EducateTargetPanel",
		"ui/EducateArchivePanel",
		"ui/EducateSiteDetailUI",
		"ui/educatecommonui_atlas"
	}

	local function var_3_2(arg_4_0)
		if noEmptyStr(arg_4_0) and not table.contains(var_3_1, arg_4_0) then
			table.insert(var_3_1, arg_4_0)
		end
	end

	local var_3_3 = getProxy(EducateProxy)
	local var_3_4 = var_3_3 and var_3_3:GetShowSiteIds() or {}

	for iter_3_0, iter_3_1 in ipairs(var_3_4) do
		local var_3_5 = pg.child_site[iter_3_1]

		if var_3_5 then
			var_3_2("educatesite/" .. var_3_5.icon)
			var_3_2("educatesite/" .. var_3_5.name_pic)
			var_3_2("educatesite/" .. var_3_5.pic)

			for iter_3_2, iter_3_3 in ipairs(var_3_5.option or {}) do
				local var_3_6 = pg.child_site_option[iter_3_3]

				if var_3_6 and var_3_6.type == EducateSiteOption.TYPE_SITE then
					local var_3_7 = var_3_6.param[1]
					local var_3_8 = pg.child_site[var_3_7]

					if var_3_8 then
						var_3_2("educatesite/" .. var_3_8.pic)
					end
				end
			end
		end
	end

	for iter_3_4, iter_3_5 in ipairs(var_3_1) do
		if not table.contains(var_3_0, iter_3_5) then
			table.insert(var_3_0, iter_3_5)
		end
	end

	return var_3_0
end

function var_0_0.init(arg_5_0)
	arg_5_0:initData()
	arg_5_0:findUI()
	arg_5_0:addListener()
end

function var_0_0.initData(arg_6_0)
	arg_6_0.config = pg.child_site
	arg_6_0.siteIdList = getProxy(EducateProxy):GetShowSiteIds()
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.topTF = arg_7_0._tf:Find("ui/top")
	arg_7_0.homeBtn = arg_7_0._tf:Find("ui/home_btn/home_btn")

	setText(arg_7_0.homeBtn:Find("Text"), i18n("child_btn_home"))
	setActive(arg_7_0.homeBtn, false)

	arg_7_0.mapTF = arg_7_0._tf:Find("map")
	arg_7_0.mapContent = arg_7_0.mapTF:Find("content")
	arg_7_0.mapSiteTpl = arg_7_0.mapTF:Find("site_tpl")

	setText(arg_7_0.mapSiteTpl:Find("limit/Text"), i18n("child_option_limit"))
	setActive(arg_7_0.mapSiteTpl, false)

	arg_7_0.siteUIList = UIItemList.New(arg_7_0.mapContent, arg_7_0.mapSiteTpl)
	arg_7_0.datePanel = EducateDatePanel.New(arg_7_0.topTF:Find("date"), arg_7_0.event)

	arg_7_0.datePanel:RegisterView(arg_7_0)
	arg_7_0.datePanel:Load()

	arg_7_0.resPanel = EducateResPanel.New(arg_7_0.topTF:Find("res"), arg_7_0.event, {
		showBg = true
	})

	arg_7_0.resPanel:RegisterView(arg_7_0)
	arg_7_0.resPanel:Load()

	arg_7_0.topPanel = EducateTopPanel.New(arg_7_0.topTF:Find("top_right"), arg_7_0.event)

	arg_7_0.topPanel:RegisterView(arg_7_0)
	arg_7_0.topPanel:Load()

	arg_7_0.targetPanel = EducateTargetPanel.New(arg_7_0._tf:Find("ui/target"), arg_7_0.event)

	arg_7_0.targetPanel:RegisterView(arg_7_0)
	arg_7_0.targetPanel:Load()

	arg_7_0.archivePanel = EducateArchivePanel.New(arg_7_0._tf:Find("ui/archive_panel"), arg_7_0.event)

	arg_7_0.archivePanel:RegisterView(arg_7_0)
	arg_7_0.archivePanel:Load()

	arg_7_0.detailPanel = EducateSiteDetailPanel.New(arg_7_0._tf:Find("ui/detail_panel"), arg_7_0.event, {
		onEnter = function()
			arg_7_0:MoveTargetPanelLeft()
		end,
		onExit = function()
			arg_7_0:MoveTargetPanelRight()
		end
	})

	arg_7_0.detailPanel:RegisterView(arg_7_0)
	arg_7_0.detailPanel:Load()
end

function var_0_0.addListener(arg_10_0)
	onButton(arg_10_0, arg_10_0.homeBtn, function()
		arg_10_0:emit(EducateBaseUI.EDUCATE_CHANGE_SCENE, SCENE.EDUCATE)
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0:OverlayPanel(arg_12_0.topTF)
	arg_12_0.siteUIList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			arg_12_0:updateSiteItem(arg_13_1, arg_13_2)
		end
	end)
	arg_12_0.siteUIList:align(#arg_12_0.siteIdList)
	arg_12_0:playAnim()
	arg_12_0:CheckTips(function()
		arg_12_0.siteUIList:align(#arg_12_0.siteIdList)
	end)
end

function var_0_0.playAnim(arg_15_0)
	arg_15_0.siteUIList:each(function(arg_16_0, arg_16_1)
		setActive(arg_16_1, false)
	end)

	local var_15_0 = {}

	table.insert(var_15_0, function(arg_17_0)
		arg_15_0:managedTween(LeanTween.delayedCall, function()
			arg_17_0()
		end, 0.165, nil)
	end)

	for iter_15_0 = 1, #arg_15_0.siteIdList do
		table.insert(var_15_0, function(arg_19_0)
			setActive(arg_15_0.siteUIList.container:GetChild(iter_15_0 - 1), true)
			arg_15_0:managedTween(LeanTween.delayedCall, function()
				arg_19_0()
			end, 0.033, nil)
		end)
	end

	seriesAsync(var_15_0, function()
		return
	end)
end

function var_0_0.CheckTips(arg_22_0, arg_22_1)
	local var_22_0 = {}
	local var_22_1 = EducateTipHelper.GetSiteUnlockTipIds()

	if #var_22_1 > 0 then
		arg_22_0:emit(var_0_0.EDUCATE_ON_UNLOCK_TIP, {
			type = EducateUnlockTipLayer.UNLOCK_TYPE_SITE,
			list = var_22_1,
			onExit = arg_22_1
		})
	end
end

function var_0_0.updateSiteItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.config[arg_23_0.siteIdList[arg_23_1 + 1]]

	arg_23_2.name = var_23_0.id

	LoadImageSpriteAsync("educatesite/" .. var_23_0.icon, arg_23_2:Find("icon"), true)
	LoadImageSpriteAsync("educatesite/" .. var_23_0.name_pic, arg_23_2:Find("name"), true)

	local var_23_1 = getProxy(EducateProxy):GetOptionsBySiteId(var_23_0.id)
	local var_23_2 = underscore.any(var_23_1, function(arg_24_0)
		return arg_24_0:IsShowLimit()
	end)

	setActive(arg_23_2:Find("limit"), var_23_2)
	setActive(arg_23_2:Find("new"), EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_SITE, var_23_0.id))
	setAnchoredPosition(arg_23_2, {
		x = var_23_0.coordinate[1],
		y = var_23_0.coordinate[2]
	})
	onButton(arg_23_0, arg_23_2, function()
		arg_23_0.detailPanel:Show(var_23_0.id)
	end, SFX_PANEL)
end

function var_0_0.clearNewTip(arg_26_0, arg_26_1)
	eachChild(arg_26_0.mapContent, function(arg_27_0)
		if tonumber(arg_27_0.name) == arg_26_1 then
			setActive(arg_27_0:Find("new"), false)
		end
	end)
end

function var_0_0.updateRes(arg_28_0)
	arg_28_0.resPanel:Flush()
end

function var_0_0.updateAttrs(arg_29_0)
	arg_29_0.archivePanel:Flush()
end

function var_0_0.updateTime(arg_30_0)
	arg_30_0.siteUIList:align(#arg_30_0.siteIdList)
	arg_30_0.datePanel:Flush()
end

function var_0_0.updateTarget(arg_31_0)
	arg_31_0.targetPanel:Flush()
end

function var_0_0.updateTimeWeekDay(arg_32_0, arg_32_1)
	arg_32_0.datePanel:UpdateWeekDay(arg_32_1)
end

function var_0_0.MoveTargetPanelLeft(arg_33_0)
	arg_33_0.targetPanel:SetPosLeft()
end

function var_0_0.MoveTargetPanelRight(arg_34_0)
	arg_34_0.targetPanel:SetPosRight()
end

function var_0_0.ShowSpecEvent(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	arg_35_0.detailPanel:showSpecEvent(arg_35_1, arg_35_2, arg_35_3, arg_35_4)
end

function var_0_0.ShowSitePerform(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5)
	arg_36_0.detailPanel:showSitePerform(arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5)
end

function var_0_0.onBackPressed(arg_37_0)
	if arg_37_0.detailPanel:isShowing() then
		arg_37_0.detailPanel:onClose()
	else
		arg_37_0:emit(var_0_0.ON_BACK_PRESSED)
	end
end

function var_0_0.willExit(arg_38_0)
	arg_38_0:UnOverlayPanel(arg_38_0.topTF, arg_38_0._tf:Find("ui"))
	arg_38_0.datePanel:Destroy()

	arg_38_0.datePanel = nil

	arg_38_0.resPanel:Destroy()

	arg_38_0.resPanel = nil

	arg_38_0.topPanel:Destroy()

	arg_38_0.topPanel = nil

	arg_38_0.targetPanel:Destroy()

	arg_38_0.targetPanel = nil

	arg_38_0.archivePanel:Destroy()

	arg_38_0.archivePanel = nil

	arg_38_0.detailPanel:Destroy()

	arg_38_0.detailPanel = nil
end

return var_0_0
