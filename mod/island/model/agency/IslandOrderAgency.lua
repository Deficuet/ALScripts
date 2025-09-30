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
	arg_2_0.awardIndexList = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.get_favor or {}) do
		table.insert(arg_2_0.awardIndexList, iter_2_1)
	end

	arg_2_0.slotList = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.slot_list or {}) do
		local var_2_0 = IslandOrderSlot.New(iter_2_3)

		arg_2_0.slotList[var_2_0.id] = var_2_0
	end

	arg_2_0.shipSlotList = {}

	for iter_2_4, iter_2_5 in ipairs(pg.island_order_list.get_id_list_by_type[var_0_0.SHIP_ORDER_TYPE]) do
		local var_2_1 = IslandShipOrderSlot.New({
			id = iter_2_5
		})

		arg_2_0.shipSlotList[var_2_1.id] = var_2_1
	end

	for iter_2_6, iter_2_7 in ipairs(arg_2_1.ship_slot_list or {}) do
		local var_2_2 = arg_2_0.shipSlotList[iter_2_7.id]

		if var_2_2 then
			var_2_2:Init(iter_2_7, true)
		end
	end

	for iter_2_8, iter_2_9 in ipairs(arg_2_1.speed_list or {}) do
		local var_2_3 = iter_2_9.slot_id
		local var_2_4 = iter_2_9.speed_time
		local var_2_5 = pg.island_order_list[var_2_3].type

		if var_2_5 == var_0_0.COMMON_ORDER_TYPE then
			arg_2_0.slotList[var_2_3]:SetReduceTime(var_2_4)
		elseif var_2_5 == var_0_0.SHIP_ORDER_TYPE then
			arg_2_0.shipSlotList[var_2_3]:SetReduceTime(var_2_4)
		end
	end
end

function var_0_0.GetShipSlotList(arg_3_0)
	return arg_3_0.shipSlotList
end

function var_0_0.GetShipOrderSlot(arg_4_0, arg_4_1)
	return arg_4_0.shipSlotList[arg_4_1]
end

function var_0_0.AddSlot(arg_5_0, arg_5_1)
	local var_5_0 = IslandOrderSlot.New(arg_5_1)

	arg_5_0.slotList[var_5_0.id] = var_5_0

	arg_5_0:DispatchEvent(var_0_0.GEN_NEW_ORDER, {
		slotId = var_5_0.id
	})
end

function var_0_0.UpdateSlot(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.slotList[arg_6_1.id]

	var_6_0:Flush(arg_6_1)
	arg_6_0:DispatchEvent(var_0_0.UDPATE_ORDER, {
		slotId = var_6_0.id
	})
end

function var_0_0.RemoveSlot(arg_7_0, arg_7_1)
	arg_7_0.slotList[arg_7_1] = nil
end

function var_0_0.UpdateOrAddOrder(arg_8_0, arg_8_1)
	if not arg_8_0.slotList[arg_8_1.id] then
		arg_8_0:AddSlot(arg_8_1)
	else
		arg_8_0:UpdateSlot(arg_8_1)
	end
end

function var_0_0.IncFinishCnt(arg_9_0)
	arg_9_0.finishCnt = arg_9_0.finishCnt + 1
end

function var_0_0.GetFinishCnt(arg_10_0)
	return arg_10_0.finishCnt
end

function var_0_0.GetMaxFinishCount(arg_11_0)
	local var_11_0 = arg_11_0:GetHost():GetAblityAgency():GetOrderDailyCntAddition()

	return pg.island_set.order_daily_limit_num.key_value_int + var_11_0
end

function var_0_0.IncUrgencyFinishCnt(arg_12_0)
	arg_12_0.urgencyFinishCnt = arg_12_0.urgencyFinishCnt + 1
end

function var_0_0.GetUrgentFinishCnt(arg_13_0)
	return arg_13_0.urgencyFinishCnt
end

function var_0_0.GetMaxUrgentFinishCnt(arg_14_0)
	return pg.island_set.order_special_limit_num.key_value_int
end

function var_0_0.GetLeftUrgentCnt(arg_15_0)
	return arg_15_0:GetMaxUrgentFinishCnt() - arg_15_0:GetUrgentFinishCnt()
end

function var_0_0.GetTendency(arg_16_0)
	return arg_16_0.tendency
end

function var_0_0.SetTendency(arg_17_0, arg_17_1)
	arg_17_0.tendency = arg_17_1
end

function var_0_0.ExpSystemIsOpen(arg_18_0)
	return arg_18_0:GetHost():GetAblityAgency():IsUnlockOrderExp()
end

function var_0_0.AddExp(arg_19_0, arg_19_1)
	if not arg_19_0:ExpSystemIsOpen() then
		return
	end

	if arg_19_0:IsMaxLevel() then
		return
	end

	arg_19_0.exp = arg_19_0.exp + arg_19_1
end

function var_0_0.GetExp(arg_20_0)
	return arg_20_0.exp
end

function var_0_0.GetTargetExp(arg_21_0)
	local var_21_0 = arg_21_0:GetLevel()

	return arg_21_0:StaticGetTargetExp(var_21_0)
end

function var_0_0.GetNextTargetExp(arg_22_0)
	if arg_22_0:IsMaxLevel() then
		return 0
	end

	local var_22_0 = arg_22_0:GetLevel()

	return arg_22_0:StaticGetTargetExp(var_22_0 + 1)
end

function var_0_0.StaticGetTargetExp(arg_23_0, arg_23_1)
	local var_23_0 = 0

	for iter_23_0 = 1, arg_23_1 do
		var_23_0 = var_23_0 + pg.island_order_favor[iter_23_0].exp
	end

	return var_23_0
end

function var_0_0.GetLevel(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(pg.island_order_favor.all) do
		if arg_24_0:StaticGetTargetExp(iter_24_1) >= arg_24_0.exp then
			return iter_24_1
		end
	end
end

function var_0_0.IsMaxLevel(arg_25_0)
	local var_25_0 = arg_25_0:GetLevel()

	return arg_25_0:StaticIsMaxLevel(var_25_0)
end

function var_0_0.StaticIsMaxLevel(arg_26_0, arg_26_1)
	local var_26_0 = pg.island_order_favor.all

	return arg_26_1 >= var_26_0[#var_26_0]
end

function var_0_0.GetSlots(arg_27_0)
	return arg_27_0.slotList
end

function var_0_0.GetSlot(arg_28_0, arg_28_1)
	return arg_28_0.slotList[arg_28_1]
end

function var_0_0.IsGotAward(arg_29_0, arg_29_1)
	return table.contains(arg_29_0.awardIndexList, arg_29_1)
end

function var_0_0.UpdateGotAwardList(arg_30_0, arg_30_1)
	if not arg_30_0:IsGotAward(arg_30_1) then
		table.insert(arg_30_0.awardIndexList, arg_30_1)
	end
end

function var_0_0.GetAllCanGetAwardList(arg_31_0)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in ipairs(pg.island_order_favor.all) do
		if arg_31_0:CanGetAward(iter_31_1) then
			table.insert(var_31_0, iter_31_1)
		end
	end

	return var_31_0
end

function var_0_0.CanGetAward(arg_32_0, arg_32_1)
	if arg_32_0:IsGotAward(arg_32_1) then
		return false
	end

	return arg_32_0:StaticGetTargetExp(arg_32_1) <= arg_32_0.exp
end

local var_0_1 = "island_next_submit_order_time"

function var_0_0.RecordNextCanSubmitTime(arg_33_0)
	local var_33_0 = getProxy(PlayerProxy):getRawData().id
	local var_33_1 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_33_2 = pg.island_set.order_complete_refresh_time.key_value_int

	PlayerPrefs.SetInt(var_0_1 .. var_33_0, var_33_1 + var_33_2)
	PlayerPrefs.Save()
end

function var_0_0.CanSubmitOrder(arg_34_0)
	local var_34_0 = getProxy(PlayerProxy):getRawData().id
	local var_34_1 = PlayerPrefs.GetInt(var_0_1 .. var_34_0, 0)
	local var_34_2 = pg.TimeMgr.GetInstance():GetServerTime()

	return var_34_1 <= 0 or var_34_1 <= var_34_2, var_34_1
end

local var_0_2 = "island_selected_order_id"

function var_0_0.GetCacheSelectedId(arg_35_0)
	local var_35_0 = getProxy(PlayerProxy):getRawData().id

	return (PlayerPrefs.GetInt(var_0_2 .. var_35_0, 0))
end

function var_0_0.SetCacheSelectedId(arg_36_0, arg_36_1)
	local var_36_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_0_2 .. var_36_0, arg_36_1)
	PlayerPrefs.Save()
end

function var_0_0.UpdatePerDay(arg_37_0)
	arg_37_0.finishCnt = 0

	if pg.TimeMgr.GetInstance():GetServerWeek() == 1 then
		arg_37_0.urgencyFinishCnt = 0
		arg_37_0.exp = 0
	end

	arg_37_0:DispatchEvent(var_0_0.ORDER_FINISH_UPDATE)
end

function var_0_0.OnSeasonReset(arg_38_0, arg_38_1)
	arg_38_0:InitData(arg_38_1)
end

return var_0_0
