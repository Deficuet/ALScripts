local var_0_0 = class("IslandOrderAgency", import(".IslandBaseAgency"))

var_0_0.GEN_NEW_ORDER = "IslandOrderAgency:GEN_NEW_ORDER"
var_0_0.UDPATE_ORDER = "IslandOrderAgency:UDPATE_ORDER"
var_0_0.ORDER_FINISH_UPDATE = "IslandOrderAgency:ORDER_FINISH_UPDATE"
var_0_0.COMMON_ORDER_TYPE = 1
var_0_0.URGENCY_ORDER_TYPE = 2
var_0_0.SHIP_ORDER_TYPE = 3

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0:InitData(arg_1_1.order_system or {})
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	arg_2_0.exp = arg_2_1.favor or 0
	arg_2_0.tendency = arg_2_1.daily_select or IslandOrderSlot.TENDENCY_TYPE_COMMON
	arg_2_0.finishCnt = arg_2_1.daily_slot_num or 0
	arg_2_0.urgencyFinishCnt = arg_2_1.time_slot_num or 0
	arg_2_0.nextManualReloadDelegateTime = arg_2_1.ship_refresh or 0
	arg_2_0.awardIndexList = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.get_favor or {}) do
		table.insert(arg_2_0.awardIndexList, iter_2_1)
	end

	arg_2_0.actFinishedGroupsMap = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.act_group or {}) do
		local var_2_0 = {}

		for iter_2_4, iter_2_5 in ipairs(iter_2_3.groups) do
			table.insert(var_2_0, iter_2_5)
		end

		arg_2_0.actFinishedGroupsMap[iter_2_3.act_id] = var_2_0
	end

	arg_2_0.slotList = {}

	for iter_2_6, iter_2_7 in ipairs(arg_2_1.slot_list or {}) do
		local var_2_1 = IslandOrderSlot.New(iter_2_7)

		arg_2_0.slotList[var_2_1.id] = var_2_1
	end

	arg_2_0.shipSlotList = {}

	for iter_2_8, iter_2_9 in ipairs(pg.island_order_list.get_id_list_by_type[var_0_0.SHIP_ORDER_TYPE]) do
		local var_2_2 = IslandShipOrderSlot.New({
			id = iter_2_9
		})

		arg_2_0.shipSlotList[var_2_2.id] = var_2_2
	end

	for iter_2_10, iter_2_11 in ipairs(arg_2_1.ship_slot_list or {}) do
		local var_2_3 = arg_2_0.shipSlotList[iter_2_11.id]

		if var_2_3 then
			var_2_3:Init(iter_2_11, true)
		end
	end

	arg_2_0.shipOrderDelegateSlots = {}

	for iter_2_12, iter_2_13 in ipairs(arg_2_1.appoint_list or {}) do
		local var_2_4 = IslandShipOrderDelegateSlot.New(iter_2_13)

		arg_2_0.shipOrderDelegateSlots[var_2_4.id] = var_2_4
	end

	for iter_2_14, iter_2_15 in ipairs(arg_2_1.speed_list or {}) do
		local var_2_5 = iter_2_15.slot_id
		local var_2_6 = iter_2_15.speed_time
		local var_2_7 = pg.island_order_list[var_2_5].type

		if var_2_7 == var_0_0.COMMON_ORDER_TYPE then
			arg_2_0.slotList[var_2_5]:SetReduceTime(var_2_6)
		elseif var_2_7 == var_0_0.SHIP_ORDER_TYPE then
			local var_2_8 = arg_2_0.shipSlotList[var_2_5]

			if var_2_8 and var_2_8:IsWaiting() then
				var_2_8:SetReloadingReduceTime(var_2_6)
			elseif var_2_8 and var_2_8:IsSubmited() then
				var_2_8:SetReduceTime(var_2_6)
			end
		end
	end
end

function var_0_0.GetShipSlotList(arg_3_0)
	return arg_3_0.shipSlotList
end

function var_0_0.GetShipOrderSlot(arg_4_0, arg_4_1)
	return arg_4_0.shipSlotList[arg_4_1]
end

function var_0_0.UpdateShipSlot(arg_5_0, arg_5_1)
	arg_5_0.shipSlotList[arg_5_1.id] = arg_5_1
end

function var_0_0.CanRefreshShipOrderDelegate(arg_6_0)
	local var_6_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_6_1 = arg_6_0:GetNextManualReloadDelegateTime()

	return var_6_1 <= var_6_0, var_6_1
end

function var_0_0.GetDelegateList(arg_7_0)
	return arg_7_0.shipOrderDelegateSlots
end

function var_0_0.RemoveDelegateSlot(arg_8_0, arg_8_1)
	if arg_8_0.shipOrderDelegateSlots[arg_8_1] then
		arg_8_0.shipOrderDelegateSlots[arg_8_1] = nil
	end
end

function var_0_0.GetDelegateSlot(arg_9_0, arg_9_1)
	return arg_9_0.shipOrderDelegateSlots[arg_9_1]
end

function var_0_0.AddDelegateSlot(arg_10_0, arg_10_1)
	arg_10_0.shipOrderDelegateSlots[arg_10_1.id] = arg_10_1
end

function var_0_0.AddDelegateSlotList(arg_11_0, arg_11_1)
	arg_11_0.shipOrderDelegateSlots = arg_11_1
end

function var_0_0.GetNextAutoReloadDelegateTime(arg_12_0)
	local var_12_0 = pg.TimeMgr.GetInstance():GetServerTime() + 86400

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.shipOrderDelegateSlots) do
		local var_12_1 = iter_12_1:GetShowTime()

		if not iter_12_1:CanShow() and var_12_1 < var_12_0 then
			var_12_0 = var_12_1
		end
	end

	return var_12_0
end

function var_0_0.GetNextManualReloadDelegateTime(arg_13_0)
	return arg_13_0.nextManualReloadDelegateTime
end

function var_0_0.UpdateNextManualReloadDelegateTime(arg_14_0, arg_14_1)
	arg_14_0.nextManualReloadDelegateTime = arg_14_1
end

function var_0_0.ReduceNextManualReloadDelegateTime(arg_15_0, arg_15_1)
	arg_15_0.nextManualReloadDelegateTime = arg_15_0.nextManualReloadDelegateTime - arg_15_1
end

function var_0_0.AddSlot(arg_16_0, arg_16_1)
	local var_16_0 = IslandOrderSlot.New(arg_16_1)

	arg_16_0.slotList[var_16_0.id] = var_16_0

	arg_16_0:DispatchEvent(var_0_0.GEN_NEW_ORDER, {
		slotId = var_16_0.id
	})
end

function var_0_0.UpdateSlot(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.slotList[arg_17_1.id]

	var_17_0:Flush(arg_17_1)
	arg_17_0:DispatchEvent(var_0_0.UDPATE_ORDER, {
		slotId = var_17_0.id
	})
end

function var_0_0.RemoveSlot(arg_18_0, arg_18_1)
	arg_18_0.slotList[arg_18_1] = nil
end

function var_0_0.UpdateOrAddOrder(arg_19_0, arg_19_1)
	if not arg_19_0.slotList[arg_19_1.id] then
		arg_19_0:AddSlot(arg_19_1)
	else
		arg_19_0:UpdateSlot(arg_19_1)
	end
end

function var_0_0.IncFinishCnt(arg_20_0)
	arg_20_0.finishCnt = arg_20_0.finishCnt + 1
end

function var_0_0.GetFinishCnt(arg_21_0)
	return arg_21_0.finishCnt
end

function var_0_0.GetMaxFinishCount(arg_22_0)
	local var_22_0 = arg_22_0:GetHost():GetAblityAgency():GetOrderDailyCntAddition()

	return pg.island_set.order_daily_limit_num.key_value_int + var_22_0
end

function var_0_0.IncUrgencyFinishCnt(arg_23_0)
	arg_23_0.urgencyFinishCnt = arg_23_0.urgencyFinishCnt + 1
end

function var_0_0.GetUrgentFinishCnt(arg_24_0)
	return arg_24_0.urgencyFinishCnt
end

function var_0_0.GetMaxUrgentFinishCnt(arg_25_0)
	return pg.island_set.order_special_limit_num.key_value_int
end

function var_0_0.GetLeftUrgentCnt(arg_26_0)
	return arg_26_0:GetMaxUrgentFinishCnt() - arg_26_0:GetUrgentFinishCnt()
end

function var_0_0.GetTendency(arg_27_0)
	return arg_27_0.tendency
end

function var_0_0.SetTendency(arg_28_0, arg_28_1)
	arg_28_0.tendency = arg_28_1
end

function var_0_0.ExpSystemIsOpen(arg_29_0)
	return arg_29_0:GetHost():GetAblityAgency():IsUnlockOrderExp()
end

function var_0_0.AddExp(arg_30_0, arg_30_1)
	if not arg_30_0:ExpSystemIsOpen() then
		return
	end

	if arg_30_0:IsMaxLevel() then
		return
	end

	arg_30_0.exp = arg_30_0.exp + arg_30_1
end

function var_0_0.GetExp(arg_31_0)
	return arg_31_0.exp
end

function var_0_0.GetTargetExp(arg_32_0)
	local var_32_0 = arg_32_0:GetLevel()

	return arg_32_0:StaticGetTargetExp(var_32_0)
end

function var_0_0.GetNextTargetExp(arg_33_0)
	if arg_33_0:IsMaxLevel() then
		return 0
	end

	local var_33_0 = arg_33_0:GetLevel()

	return arg_33_0:StaticGetTargetExp(var_33_0)
end

function var_0_0.StaticGetTargetExp(arg_34_0, arg_34_1)
	local var_34_0 = 0

	for iter_34_0 = 1, arg_34_1 do
		local var_34_1 = pg.island_order_favor[iter_34_0]

		var_34_0 = var_34_0 + (var_34_1 and var_34_1.exp or 0)
	end

	return var_34_0
end

function var_0_0.GetLevel(arg_35_0)
	for iter_35_0, iter_35_1 in ipairs(pg.island_order_favor.all) do
		if arg_35_0:StaticGetTargetExp(iter_35_1 + 1) > arg_35_0.exp then
			return iter_35_1
		end
	end

	if arg_35_0:IsMaxLevel() then
		local var_35_0 = pg.island_order_favor.all

		return var_35_0[#var_35_0]
	else
		return 0
	end
end

function var_0_0.IsMaxLevel(arg_36_0)
	local var_36_0 = pg.island_order_favor.all
	local var_36_1 = var_36_0[#var_36_0]

	return arg_36_0:StaticGetTargetExp(var_36_1) <= arg_36_0.exp
end

function var_0_0.GetSlots(arg_37_0)
	return arg_37_0.slotList
end

function var_0_0.GetSlot(arg_38_0, arg_38_1)
	return arg_38_0.slotList[arg_38_1]
end

function var_0_0.IsGotAward(arg_39_0, arg_39_1)
	return table.contains(arg_39_0.awardIndexList, arg_39_1)
end

function var_0_0.UpdateGotAwardList(arg_40_0, arg_40_1)
	if not arg_40_0:IsGotAward(arg_40_1) then
		table.insert(arg_40_0.awardIndexList, arg_40_1)
	end
end

function var_0_0.GetAllCanGetAwardList(arg_41_0)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in ipairs(pg.island_order_favor.all) do
		if arg_41_0:CanGetAward(iter_41_1) then
			table.insert(var_41_0, iter_41_1)
		end
	end

	return var_41_0
end

function var_0_0.CanGetAward(arg_42_0, arg_42_1)
	if arg_42_0:IsGotAward(arg_42_1) then
		return false
	end

	return arg_42_0:StaticGetTargetExp(arg_42_1) <= arg_42_0.exp
end

local var_0_1 = "island_next_submit_order_time"

function var_0_0.RecordNextCanSubmitTime(arg_43_0)
	local var_43_0 = getProxy(PlayerProxy):getRawData().id
	local var_43_1 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_43_2 = pg.island_set.order_complete_refresh_time.key_value_int

	PlayerPrefs.SetInt(var_0_1 .. var_43_0, var_43_1 + var_43_2)
	PlayerPrefs.Save()
end

function var_0_0.CanSubmitOrder(arg_44_0)
	local var_44_0 = getProxy(PlayerProxy):getRawData().id
	local var_44_1 = PlayerPrefs.GetInt(var_0_1 .. var_44_0, 0)
	local var_44_2 = pg.TimeMgr.GetInstance():GetServerTime()

	return var_44_1 <= 0 or var_44_1 <= var_44_2, var_44_1
end

local var_0_2 = "island_selected_order_id"

function var_0_0.GetCacheSelectedId(arg_45_0)
	local var_45_0 = getProxy(PlayerProxy):getRawData().id

	return (PlayerPrefs.GetInt(var_0_2 .. var_45_0, 0))
end

function var_0_0.SetCacheSelectedId(arg_46_0, arg_46_1)
	local var_46_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_0_2 .. var_46_0, arg_46_1)
	PlayerPrefs.Save()
end

function var_0_0.AddFinishedActGroupId(arg_47_0, arg_47_1, arg_47_2)
	if not arg_47_0.actFinishedGroupsMap[arg_47_1] then
		arg_47_0.actFinishedGroupsMap[arg_47_1] = {}
	end

	if not table.contains(arg_47_0.actFinishedGroupsMap[arg_47_1], arg_47_2) then
		table.insert(arg_47_0.actFinishedGroupsMap[arg_47_1], arg_47_2)
	end
end

function var_0_0.GetFinishedCntByActId(arg_48_0, arg_48_1)
	local var_48_0 = pg.island_order
	local var_48_1 = var_48_0.get_id_list_by_activity_id[arg_48_1]
	local var_48_2 = {}

	for iter_48_0, iter_48_1 in ipairs(var_48_1) do
		local var_48_3 = var_48_0[iter_48_1].group_id

		if not var_48_2[var_48_3] then
			var_48_2[var_48_3] = {}
		end

		table.insert(var_48_2[var_48_3], iter_48_1)
	end

	local var_48_4 = 0

	for iter_48_2, iter_48_3 in ipairs(arg_48_0.actFinishedGroupsMap[arg_48_1] or {}) do
		var_48_4 = var_48_4 + #var_48_2[iter_48_3]
	end

	for iter_48_4, iter_48_5 in pairs(arg_48_0.slotList) do
		local var_48_5 = iter_48_5:GetOrder()

		if isa(var_48_5, IslandFirmActivityOrder) and var_48_5:GetActivityId() == arg_48_1 then
			local var_48_6 = var_48_2[var_48_5:GetGroupId()]

			table.sort(var_48_6)

			var_48_4 = var_48_4 + table.indexof(var_48_6, var_48_5.id) - 1
		end
	end

	return var_48_4
end

function var_0_0.UpdatePerDay(arg_49_0)
	arg_49_0.finishCnt = 0

	if pg.TimeMgr.GetInstance():GetServerWeek() == 1 then
		arg_49_0.urgencyFinishCnt = 0
		arg_49_0.exp = 0
	end

	arg_49_0:DispatchEvent(var_0_0.ORDER_FINISH_UPDATE)
end

function var_0_0.OnSeasonReset(arg_50_0, arg_50_1)
	arg_50_0:InitData(arg_50_1)
end

return var_0_0
