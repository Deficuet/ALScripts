local var_0_0 = class("IslandManagePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandManageUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uiAnim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.uiAnimEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.uiAnimEvent:SetEndEvent(function()
		arg_2_0.playingHideAnim = false

		var_0_0.super.Hide(arg_2_0)
	end)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_manage_title"))

	local var_2_0 = arg_2_0._tf:Find("window/view/content")
	local var_2_1 = var_2_0:Find("tpl")

	setText(var_2_1:Find("bg/event/Text"), i18n("island_manage_sp_event"))
	setText(var_2_1:Find("bg/status/prepare/Text"), i18n("island_manage_no_work"))
	setText(var_2_1:Find("bg/status/end/Text"), i18n("island_manage_end_work"))
	setText(var_2_1:Find("btns/opening/Text"), i18n("island_manage_view"))
	setText(var_2_1:Find("btns/close/Text"), i18n("island_manage_result"))

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_1)
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("top/back"), function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	arg_4_0.uiList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			onButton(arg_4_0, arg_6_2:Find("btns/prepare"), function()
				arg_4_0:OpenPage(IslandRestaurantPage, arg_4_0.restIds[arg_6_1 + 1])
			end, SFX_PANEL)
			onButton(arg_4_0, arg_6_2:Find("btns/opening"), function()
				arg_4_0:OpenPage(IslandRestaurantPage, arg_4_0.restIds[arg_6_1 + 1])
			end, SFX_PANEL)
			onButton(arg_4_0, arg_6_2:Find("btns/close"), function()
				arg_4_0:OpenPage(IslandRestaurantPage, arg_4_0.restIds[arg_6_1 + 1])
			end, SFX_PANEL)
		elseif arg_6_0 == UIItemList.EventUpdate then
			arg_4_0:UpdataRest(arg_6_1, arg_6_2)
		end
	end)

	arg_4_0.restIds = pg.island_manage_restaurant.all
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(IslandManageAgecny.UPDATE_RESTAURANT, arg_10_0.Flush)
	arg_10_0:AddListener(IslandManageAgecny.ADD_RESTAURANT, arg_10_0.Flush)
	arg_10_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_10_0.Flush)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(IslandManageAgecny.UPDATE_RESTAURANT, arg_11_0.Flush)
	arg_11_0:RemoveListener(IslandManageAgecny.ADD_RESTAURANT, arg_11_0.Flush)
	arg_11_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_11_0.Flush)
end

function var_0_0.OnShow(arg_12_0)
	arg_12_0:BlurPanel()
	arg_12_0:Flush()

	local var_12_0 = {}

	arg_12_0.uiList:eachActive(function(arg_13_0, arg_13_1)
		arg_13_1:GetComponent(typeof(CanvasGroup)).alpha = 0

		table.insert(var_12_0, function(arg_14_0)
			arg_13_1:GetComponent(typeof(Animation)):Play()
			arg_12_0:managedTween(LeanTween.delayedCall, function()
				arg_14_0()
			end, 0.05, nil)
		end)
	end)
	seriesAsync(var_12_0)
end

function var_0_0.OnEnable(arg_16_0)
	arg_16_0:Flush()
end

function var_0_0.Flush(arg_17_0)
	arg_17_0.rests = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurants()

	table.sort(arg_17_0.restIds, CompareFuncs({
		function(arg_18_0)
			return arg_17_0.rests[arg_18_0] and 0 or 1
		end,
		function(arg_19_0)
			return arg_19_0
		end
	}))
	arg_17_0.uiList:align(#arg_17_0.restIds)
	arg_17_0:StartTimer()
	arg_17_0:UpdateTime()
end

function var_0_0.UpdataRest(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.restIds[arg_20_1 + 1]
	local var_20_1 = pg.island_manage_restaurant[var_20_0]

	arg_20_2.name = var_20_0

	LoadImageSpriteAsync("island/islandrestaurant/" .. var_20_1.icon, arg_20_2:Find("bg"))
	setText(arg_20_2:Find("bg/name/Text"), var_20_1.name)
	setText(arg_20_2:Find("bg/name_en/Text"), var_20_1.name_en)

	local var_20_2 = arg_20_0.rests[var_20_0]
	local var_20_3 = not var_20_2

	setActive(arg_20_2:Find("bg/rank"), not var_20_3)
	setActive(arg_20_2:Find("bg/lock"), var_20_3)
	setActive(arg_20_2:Find("bg/event"), not var_20_3)
	setActive(arg_20_2:Find("bg/status"), not var_20_3)
	setActive(arg_20_2:Find("btns"), not var_20_3)

	if var_20_2 then
		local var_20_4 = var_20_2:getConfig("opening_number")
		local var_20_5 = var_20_2:GetRemainCnt()

		setText(arg_20_2:Find("btns/prepare/Text"), string.format("%s(%d/%d)", i18n("island_manage_prepare"), var_20_5, var_20_4))
		setText(arg_20_2:Find("btns/end/Text"), string.format("%s(%d/%d)", i18n("island_manage_daily_cnt_tip"), var_20_5, var_20_4))
		LoadImageSpriteAsync("island/islandrestaurant/" .. var_20_2:GetRankIcon(), arg_20_2:Find("bg/rank"))

		local var_20_6 = var_20_2:GetEventInfo()

		setActive(arg_20_2:Find("bg/event"), var_20_6 ~= 0)
		arg_20_0:UpdataStatusInfo(arg_20_2, var_20_2)
	end
end

function var_0_0.UpdataStatusInfo(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_2:GetStatus()
	local var_21_1 = var_21_0 == IslandRestaurant.STATUS.OPENING or var_21_0 == IslandRestaurant.STATUS.CLOSE

	setActive(arg_21_1:Find("bg/status/prepare"), var_21_0 == IslandRestaurant.STATUS.PREPARE)
	setActive(arg_21_1:Find("bg/status/opening"), var_21_1)
	setActive(arg_21_1:Find("bg/status/end"), var_21_0 == IslandRestaurant.STATUS.END)

	if var_21_0 == IslandRestaurant.STATUS.OPENING then
		local var_21_2 = pg.TimeMgr.GetInstance()
		local var_21_3 = arg_21_2:GetEndTime() - var_21_2:GetServerTime()

		setText(arg_21_1:Find("bg/status/opening/Text"), var_21_2:DescCDTime(var_21_3))
	elseif var_21_0 == IslandRestaurant.STATUS.CLOSE then
		setText(arg_21_1:Find("bg/status/opening/Text"), "00:00:00")
	end

	local var_21_4 = arg_21_2:GetStatus()

	eachChild(arg_21_1:Find("btns"), function(arg_22_0)
		setActive(arg_22_0, arg_22_0.name == var_21_4)
	end)
end

function var_0_0.UpdateTime(arg_23_0)
	arg_23_0.uiList:eachActive(function(arg_24_0, arg_24_1)
		local var_24_0 = arg_23_0.rests[arg_23_0.restIds[arg_24_0 + 1]]

		if var_24_0 then
			arg_23_0:UpdataStatusInfo(arg_24_1, var_24_0)
		end
	end)
end

function var_0_0.StartTimer(arg_25_0)
	arg_25_0.timer = Timer.New(function()
		arg_25_0:UpdateTime()
	end, 1, -1)

	arg_25_0.timer:Start()
end

function var_0_0.StopTimer(arg_27_0)
	if arg_27_0.timer ~= nil then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end
end

function var_0_0.Hide(arg_28_0)
	if arg_28_0.playingHideAnim then
		return
	end

	arg_28_0.uiAnim:Play("anim_IslandManageUI_Out")

	arg_28_0.playingHideAnim = true
end

function var_0_0.OnHide(arg_29_0)
	arg_29_0:StopTimer()
	arg_29_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_30_0)
	arg_30_0:OnHide()
end

function var_0_0.OnDestroy(arg_31_0)
	arg_31_0.uiAnimEvent:SetEndEvent(nil)
end

return var_0_0
