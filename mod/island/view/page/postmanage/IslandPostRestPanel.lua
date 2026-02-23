local var_0_0 = class("IslandPostRestPanel", import("view.base.BaseSubView"))

var_0_0.MAX_ASSISTANT_CNT = 2
var_0_0.MAX_SHELF_CNT = 5

function var_0_0.getUIName(arg_1_0)
	return "IslandPostRestPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("view/content")
	local var_2_1 = var_2_0:Find("tpl")

	setText(var_2_1:Find("btns/opening/Text"), i18n("island_manage_view"))
	setText(var_2_1:Find("btns/close/Text"), i18n("island_manage_result"))
	setText(var_2_1:Find("btns/lock/Text"), i18n("word_lock"))
	setText(var_2_1:Find("name/event/Text"), i18n("island_post_event_label"))

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_1)
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.restIds = pg.island_set.post_manage_operate.key_value_varchar

	arg_3_0.uiList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventInit then
			arg_3_0:InitItem(arg_4_1, arg_4_2)
		elseif arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_4_1, arg_4_2)
		end
	end)
end

function var_0_0.TriggerEvent(arg_5_0, arg_5_1)
	local var_5_0 = -1

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.restIds) do
		if iter_5_1 == arg_5_1 then
			var_5_0 = iter_5_0

			break
		end
	end

	if var_5_0 < 0 then
		return
	end

	arg_5_0.uiList:eachActive(function(arg_6_0, arg_6_1)
		if arg_6_0 + 1 == var_5_0 then
			triggerButton(arg_6_1:Find("btns/opening"))
		end
	end)
end

function var_0_0.InitItem(arg_7_0, arg_7_1, arg_7_2)
	onButton(arg_7_0, arg_7_2:Find("btns/prepare"), function()
		arg_7_0:OpenRestaurant(arg_7_0.restIds[arg_7_1 + 1])
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_2:Find("btns/opening"), function()
		arg_7_0:OpenRestaurant(arg_7_0.restIds[arg_7_1 + 1])
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_2:Find("btns/close"), function()
		arg_7_0:OpenRestaurant(arg_7_0.restIds[arg_7_1 + 1])
	end, SFX_PANEL)
end

function var_0_0.OpenRestaurant(arg_11_0, arg_11_1)
	arg_11_0:emit(IslandMediator.OPEN_PAGE, "IslandRestaurantPage", {
		arg_11_1,
		true
	})
end

function var_0_0.UpdateItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.restIds[arg_12_1 + 1]

	arg_12_2.name = var_12_0

	local var_12_1 = pg.island_manage_restaurant[var_12_0].name

	setText(arg_12_2:Find("name"), var_12_1)

	local var_12_2 = arg_12_0.rests[var_12_0]

	setActive(arg_12_2:Find("lock"), not var_12_2)
	setActive(arg_12_2:Find("btns/lock"), not var_12_2)
	setActive(arg_12_2:Find("rank"), var_12_2)
	setActive(arg_12_2:Find("opening"), var_12_2 and var_12_2:GetStatus() == IslandRestaurant.STATUS.OPENING)

	if var_12_2 then
		local var_12_3 = var_12_2:GetEventInfo()

		setActive(arg_12_2:Find("name/event"), var_12_2:GetEventInfo() ~= 0)
	else
		setActive(arg_12_2:Find("name/event"), false)
	end

	onButton(arg_12_0, arg_12_2:Find("name/event"), function()
		arg_12_0:emit(IslandPostManagePage.EVENT_SHOW_SP_EVENT_TIP, var_12_2, false)
	end, SFX_PANEL)

	local var_12_4 = var_12_2 and var_12_2:GetAssistants() or {}

	UIItemList.StaticAlign(arg_12_2:Find("ships"), arg_12_2:Find("ships/tpl"), var_0_0.MAX_ASSISTANT_CNT, function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = var_12_4[arg_14_1 + 1]

			setActive(arg_14_2:Find("lock"), not var_14_0)

			local var_14_1 = var_14_0 and var_14_0.shipId

			setActive(arg_14_2:Find("icon"), var_14_1 and var_14_1 ~= 0)

			if var_14_1 and var_14_1 ~= 0 then
				local var_14_2 = IslandShip.StaticGetPrefab(var_14_1)

				LoadImageSpriteAsync("squareicon/" .. var_14_2, arg_14_2:Find("icon"))
			end
		end
	end)

	local var_12_5 = var_12_2 and var_12_2:GetCommondities() or {}
	local var_12_6 = var_12_2 and var_12_2:GetShelfCnt() or 0

	UIItemList.StaticAlign(arg_12_2:Find("shelfs"), arg_12_2:Find("shelfs/tpl"), var_0_0.MAX_SHELF_CNT, function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = var_12_5[arg_15_1 + 1]
			local var_15_1 = var_12_6 < arg_15_1 + 1

			setActive(arg_15_2:Find("lock"), var_15_1)
			setActive(arg_15_2:Find("drop"), var_15_0)

			if var_15_0 then
				local var_15_2 = Drop.New({
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_15_0.id,
					count = var_15_0.num
				})

				updateCustomDrop(arg_15_2:Find("drop"), var_15_2)
			end
		end
	end)

	if var_12_2 then
		local var_12_7 = var_12_2:getConfig("opening_number")
		local var_12_8 = var_12_2:GetRemainCnt()

		setText(arg_12_2:Find("btns/prepare/Text"), string.format("%s(%d/%d)", i18n("island_manage_prepare"), var_12_8, var_12_7))
		setText(arg_12_2:Find("btns/end/Text"), string.format("%s(%d/%d)", i18n("island_manage_daily_cnt_tip"), var_12_8, var_12_7))
		LoadImageSpriteAsync("island/islandrestaurant/" .. var_12_2:GetRankIcon(), arg_12_2:Find("rank"), true)
		arg_12_0:UpdataStatusInfo(arg_12_2, var_12_2)
	end
end

function var_0_0.UpdataStatusInfo(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_2:GetStatus()

	if var_16_0 == IslandRestaurant.STATUS.OPENING then
		local var_16_1 = pg.TimeMgr.GetInstance()
		local var_16_2 = arg_16_2:GetEndTime() - var_16_1:GetServerTime()

		setText(arg_16_1:Find("opening/Text"), var_16_1:DescCDTime(var_16_2))
	end

	eachChild(arg_16_1:Find("btns"), function(arg_17_0)
		setActive(arg_17_0, arg_17_0.name == var_16_0)
	end)
end

function var_0_0.Show(arg_18_0)
	arg_18_0.super.Show(arg_18_0)
	arg_18_0:Flush()
	arg_18_0:CheckEventTip()
end

function var_0_0.CheckEventTip(arg_19_0)
	if not getProxy(SettingsProxy):ShouldTipIslandRestEvet() then
		return
	end

	local var_19_0

	for iter_19_0, iter_19_1 in pairs(arg_19_0.rests) do
		local var_19_1 = iter_19_1:GetEventInfo()

		if iter_19_1:GetEventInfo() ~= 0 then
			var_19_0 = iter_19_1

			break
		end
	end

	if var_19_0 then
		arg_19_0:emit(IslandPostManagePage.EVENT_SHOW_SP_EVENT_TIP, var_19_0, true)
	end
end

function var_0_0.Flush(arg_20_0)
	arg_20_0:StopTimer()

	arg_20_0.rests = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurants()

	table.sort(arg_20_0.restIds, CompareFuncs({
		function(arg_21_0)
			return arg_20_0.rests[arg_21_0] and 0 or 1
		end,
		function(arg_22_0)
			local var_22_0 = arg_20_0.rests[arg_22_0]

			return var_22_0 and arg_20_0:GetStatusSortWeight(var_22_0:GetStatus()) or 999
		end,
		function(arg_23_0)
			return arg_23_0
		end
	}))
	arg_20_0.uiList:align(#arg_20_0.restIds)
	arg_20_0:StartTimer()
	arg_20_0:UpdateTime()
end

function var_0_0.GetStatusSortWeight(arg_24_0, arg_24_1)
	return switch(arg_24_1, {
		[IslandRestaurant.STATUS.CLOSE] = function()
			return 1
		end,
		[IslandRestaurant.STATUS.PREPARE] = function()
			return 2
		end,
		[IslandRestaurant.STATUS.OPENING] = function()
			return 3
		end,
		[IslandRestaurant.STATUS.END] = function()
			return 4
		end
	}, function()
		return 999
	end)
end

function var_0_0.UpdateTime(arg_30_0)
	arg_30_0.uiList:eachActive(function(arg_31_0, arg_31_1)
		local var_31_0 = arg_30_0.rests[arg_30_0.restIds[arg_31_0 + 1]]

		if var_31_0 then
			arg_30_0:UpdataStatusInfo(arg_31_1, var_31_0)
		end
	end)
end

function var_0_0.StartTimer(arg_32_0)
	arg_32_0.timer = Timer.New(function()
		arg_32_0:UpdateTime()
	end, 1, -1)

	arg_32_0.timer:Start()
end

function var_0_0.StopTimer(arg_34_0)
	if arg_34_0.timer ~= nil then
		arg_34_0.timer:Stop()

		arg_34_0.timer = nil
	end
end

function var_0_0.OnHide(arg_35_0)
	arg_35_0:StopTimer()
end

function var_0_0.OnDestroy(arg_36_0)
	arg_36_0:OnHide()
end

return var_0_0
