local var_0_0 = class("IslandManagePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandManageUI"
end

function var_0_0.OnLoaded(arg_2_0)
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

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			onButton(arg_3_0, arg_5_2:Find("btns/prepare"), function()
				arg_3_0:OpenPage(IslandRestaurantPage, arg_3_0.restIds[arg_5_1 + 1])
			end, SFX_PANEL)
			onButton(arg_3_0, arg_5_2:Find("btns/opening"), function()
				arg_3_0:OpenPage(IslandRestaurantPage, arg_3_0.restIds[arg_5_1 + 1])
			end, SFX_PANEL)
			onButton(arg_3_0, arg_5_2:Find("btns/close"), function()
				arg_3_0:OpenPage(IslandRestaurantPage, arg_3_0.restIds[arg_5_1 + 1])
			end, SFX_PANEL)
		elseif arg_5_0 == UIItemList.EventUpdate then
			arg_3_0:UpdataRest(arg_5_1, arg_5_2)
		end
	end)

	arg_3_0.restIds = pg.island_manage_restaurant.all
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(IslandManageAgecny.UPDATE_RESTAURANT, arg_9_0.Flush)
	arg_9_0:AddListener(IslandManageAgecny.ADD_RESTAURANT, arg_9_0.Flush)
	arg_9_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_9_0.Flush)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(IslandManageAgecny.UPDATE_RESTAURANT, arg_10_0.Flush)
	arg_10_0:RemoveListener(IslandManageAgecny.ADD_RESTAURANT, arg_10_0.Flush)
	arg_10_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_10_0.Flush)
end

function var_0_0.OnShow(arg_11_0)
	arg_11_0:BlurPanel()
	arg_11_0:Flush()

	local var_11_0 = {}

	arg_11_0.uiList:eachActive(function(arg_12_0, arg_12_1)
		arg_12_1:GetComponent(typeof(CanvasGroup)).alpha = 0

		table.insert(var_11_0, function(arg_13_0)
			arg_12_1:GetComponent(typeof(Animation)):Play()
			arg_11_0:managedTween(LeanTween.delayedCall, function()
				arg_13_0()
			end, 0.05, nil)
		end)
	end)
	seriesAsync(var_11_0)
end

function var_0_0.OnEnable(arg_15_0)
	arg_15_0:Flush()
end

function var_0_0.Flush(arg_16_0)
	arg_16_0:StopTimer()

	arg_16_0.rests = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurants()

	table.sort(arg_16_0.restIds, CompareFuncs({
		function(arg_17_0)
			return arg_16_0.rests[arg_17_0] and 0 or 1
		end,
		function(arg_18_0)
			return arg_18_0
		end
	}))
	arg_16_0.uiList:align(#arg_16_0.restIds)
	arg_16_0:StartTimer()
	arg_16_0:UpdateTime()
end

function var_0_0.UpdataRest(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.restIds[arg_19_1 + 1]
	local var_19_1 = pg.island_manage_restaurant[var_19_0]

	arg_19_2.name = var_19_0

	LoadImageSpriteAsync("island/islandrestaurant/" .. var_19_1.icon, arg_19_2:Find("bg"))
	setText(arg_19_2:Find("bg/name/Text"), var_19_1.name)
	setText(arg_19_2:Find("bg/name_en/Text"), var_19_1.name_en)

	local var_19_2 = arg_19_0.rests[var_19_0]
	local var_19_3 = not var_19_2

	setActive(arg_19_2:Find("bg/rank"), not var_19_3)
	setActive(arg_19_2:Find("bg/lock"), var_19_3)
	setActive(arg_19_2:Find("bg/event"), not var_19_3)
	setActive(arg_19_2:Find("bg/status"), not var_19_3)
	setActive(arg_19_2:Find("btns"), not var_19_3)

	if var_19_2 then
		local var_19_4 = var_19_2:getConfig("opening_number")
		local var_19_5 = var_19_2:GetRemainCnt()

		setText(arg_19_2:Find("btns/prepare/Text"), string.format("%s(%d/%d)", i18n("island_manage_prepare"), var_19_5, var_19_4))
		setText(arg_19_2:Find("btns/end/Text"), string.format("%s(%d/%d)", i18n("island_manage_daily_cnt_tip"), var_19_5, var_19_4))
		LoadImageSpriteAsync("island/islandrestaurant/" .. var_19_2:GetRankIcon(), arg_19_2:Find("bg/rank"))

		local var_19_6 = var_19_2:GetEventInfo()

		setActive(arg_19_2:Find("bg/event"), var_19_6 ~= 0)
		arg_19_0:UpdataStatusInfo(arg_19_2, var_19_2)
	end
end

function var_0_0.UpdataStatusInfo(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_2:GetStatus()
	local var_20_1 = var_20_0 == IslandRestaurant.STATUS.OPENING or var_20_0 == IslandRestaurant.STATUS.CLOSE

	setActive(arg_20_1:Find("bg/status/prepare"), var_20_0 == IslandRestaurant.STATUS.PREPARE)
	setActive(arg_20_1:Find("bg/status/opening"), var_20_1)
	setActive(arg_20_1:Find("bg/status/end"), var_20_0 == IslandRestaurant.STATUS.END)

	if var_20_0 == IslandRestaurant.STATUS.OPENING then
		local var_20_2 = pg.TimeMgr.GetInstance()
		local var_20_3 = arg_20_2:GetEndTime() - var_20_2:GetServerTime()

		setText(arg_20_1:Find("bg/status/opening/Text"), var_20_2:DescCDTime(var_20_3))
	elseif var_20_0 == IslandRestaurant.STATUS.CLOSE then
		setText(arg_20_1:Find("bg/status/opening/Text"), "00:00:00")
	end

	eachChild(arg_20_1:Find("btns"), function(arg_21_0)
		setActive(arg_21_0, arg_21_0.name == var_20_0)
	end)
end

function var_0_0.UpdateTime(arg_22_0)
	arg_22_0.uiList:eachActive(function(arg_23_0, arg_23_1)
		local var_23_0 = arg_22_0.rests[arg_22_0.restIds[arg_23_0 + 1]]

		if var_23_0 then
			arg_22_0:UpdataStatusInfo(arg_23_1, var_23_0)
		end
	end)
end

function var_0_0.StartTimer(arg_24_0)
	arg_24_0.timer = Timer.New(function()
		arg_24_0:UpdateTime()
	end, 1, -1)

	arg_24_0.timer:Start()
end

function var_0_0.StopTimer(arg_26_0)
	if arg_26_0.timer ~= nil then
		arg_26_0.timer:Stop()

		arg_26_0.timer = nil
	end
end

function var_0_0.OnHide(arg_27_0)
	arg_27_0:StopTimer()
	arg_27_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_28_0)
	arg_28_0:OnHide()
end

function var_0_0.OnDestroy(arg_29_0)
	arg_29_0:OnHide()
end

return var_0_0
