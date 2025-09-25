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

function var_0_0.InitItem(arg_5_0, arg_5_1, arg_5_2)
	onButton(arg_5_0, arg_5_2:Find("btns/prepare"), function()
		arg_5_0:OpenRestaurant(arg_5_0.restIds[arg_5_1 + 1])
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_2:Find("btns/opening"), function()
		arg_5_0:OpenRestaurant(arg_5_0.restIds[arg_5_1 + 1])
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_2:Find("btns/close"), function()
		arg_5_0:OpenRestaurant(arg_5_0.restIds[arg_5_1 + 1])
	end, SFX_PANEL)
end

function var_0_0.OpenRestaurant(arg_9_0, arg_9_1)
	arg_9_0:emit(IslandMediator.OPEN_PAGE, "IslandRestaurantPage", {
		arg_9_1,
		true
	})
end

function var_0_0.UpdateItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.restIds[arg_10_1 + 1]

	arg_10_2.name = var_10_0

	local var_10_1 = pg.island_manage_restaurant[var_10_0].name

	setText(arg_10_2:Find("name"), var_10_1)

	local var_10_2 = arg_10_0.rests[var_10_0]

	setActive(arg_10_2:Find("lock"), not var_10_2)
	setActive(arg_10_2:Find("btns/lock"), not var_10_2)
	setActive(arg_10_2:Find("rank"), var_10_2)
	setActive(arg_10_2:Find("opening"), var_10_2 and var_10_2:GetStatus() == IslandRestaurant.STATUS.OPENING)

	if var_10_2 then
		local var_10_3 = var_10_2:GetEventInfo()

		setActive(arg_10_2:Find("name/event"), var_10_2:GetEventInfo() ~= 0)
	else
		setActive(arg_10_2:Find("name/event"), false)
	end

	local var_10_4 = var_10_2 and var_10_2:GetAssistants() or {}

	UIItemList.StaticAlign(arg_10_2:Find("ships"), arg_10_2:Find("ships/tpl"), var_0_0.MAX_ASSISTANT_CNT, function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = var_10_4[arg_11_1 + 1]

			setActive(arg_11_2:Find("lock"), not var_11_0)

			local var_11_1 = var_11_0 and var_11_0.shipId

			setActive(arg_11_2:Find("icon"), var_11_1 and var_11_1 ~= 0)

			if var_11_1 and var_11_1 ~= 0 then
				local var_11_2 = IslandShip.StaticGetPrefab(var_11_1)

				LoadImageSpriteAsync("squareicon/" .. var_11_2, arg_11_2:Find("icon"))
			end
		end
	end)

	local var_10_5 = var_10_2 and var_10_2:GetCommondities() or {}
	local var_10_6 = var_10_2 and var_10_2:GetShelfCnt() or 0

	UIItemList.StaticAlign(arg_10_2:Find("shelfs"), arg_10_2:Find("shelfs/tpl"), var_0_0.MAX_SHELF_CNT, function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = var_10_5[arg_12_1 + 1]
			local var_12_1 = var_10_6 < arg_12_1 + 1

			setActive(arg_12_2:Find("lock"), var_12_1)
			setActive(arg_12_2:Find("drop"), var_12_0)

			if var_12_0 then
				local var_12_2 = Drop.New({
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_12_0.id,
					count = var_12_0.num
				})

				updateCustomDrop(arg_12_2:Find("drop"), var_12_2)
			end
		end
	end)

	if var_10_2 then
		local var_10_7 = var_10_2:getConfig("opening_number")
		local var_10_8 = var_10_2:GetRemainCnt()

		setText(arg_10_2:Find("btns/prepare/Text"), string.format("%s(%d/%d)", i18n("island_manage_prepare"), var_10_8, var_10_7))
		setText(arg_10_2:Find("btns/end/Text"), string.format("%s(%d/%d)", i18n("island_manage_daily_cnt_tip"), var_10_8, var_10_7))
		LoadImageSpriteAsync("island/islandrestaurant/" .. var_10_2:GetRankIcon(), arg_10_2:Find("rank"), true)
		arg_10_0:UpdataStatusInfo(arg_10_2, var_10_2)
	end
end

function var_0_0.UpdataStatusInfo(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_2:GetStatus()

	if var_13_0 == IslandRestaurant.STATUS.OPENING then
		local var_13_1 = pg.TimeMgr.GetInstance()
		local var_13_2 = arg_13_2:GetEndTime() - var_13_1:GetServerTime()

		setText(arg_13_1:Find("opening/Text"), var_13_1:DescCDTime(var_13_2))
	end

	eachChild(arg_13_1:Find("btns"), function(arg_14_0)
		setActive(arg_14_0, arg_14_0.name == var_13_0)
	end)
end

function var_0_0.Show(arg_15_0)
	arg_15_0.super.Show(arg_15_0)
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
			local var_18_0 = arg_16_0.rests[arg_18_0]

			return var_18_0 and arg_16_0:GetStatusSortWeight(var_18_0:GetStatus()) or 999
		end,
		function(arg_19_0)
			return arg_19_0
		end
	}))
	arg_16_0.uiList:align(#arg_16_0.restIds)
	arg_16_0:StartTimer()
	arg_16_0:UpdateTime()
end

function var_0_0.GetStatusSortWeight(arg_20_0, arg_20_1)
	return switch(arg_20_1, {
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

function var_0_0.UpdateTime(arg_26_0)
	arg_26_0.uiList:eachActive(function(arg_27_0, arg_27_1)
		local var_27_0 = arg_26_0.rests[arg_26_0.restIds[arg_27_0 + 1]]

		if var_27_0 then
			arg_26_0:UpdataStatusInfo(arg_27_1, var_27_0)
		end
	end)
end

function var_0_0.StartTimer(arg_28_0)
	arg_28_0.timer = Timer.New(function()
		arg_28_0:UpdateTime()
	end, 1, -1)

	arg_28_0.timer:Start()
end

function var_0_0.StopTimer(arg_30_0)
	if arg_30_0.timer ~= nil then
		arg_30_0.timer:Stop()

		arg_30_0.timer = nil
	end
end

function var_0_0.OnHide(arg_31_0)
	arg_31_0:StopTimer()
end

function var_0_0.OnDestroy(arg_32_0)
	arg_32_0:OnHide()
end

return var_0_0
