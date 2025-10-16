local var_0_0 = class("IslandShipOrderSlot")

var_0_0.STATE_LOCK = 0
var_0_0.STATE_WAITING = 1
var_0_0.STATE_SUBMITED = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0:Init(arg_1_1)
end

function var_0_0.Init(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.forceUnlock = arg_2_2
	arg_2_0.id = arg_2_1.id
	arg_2_0.state = arg_2_1.state or var_0_0.STATE_LOCK
	arg_2_0.totalTime = arg_2_1.load_time or 0
	arg_2_0.endTime = 0

	if arg_2_0:IsSubmited() then
		arg_2_0.endTime = arg_2_1.get_time or 0
	end

	arg_2_0.openTime = 0

	if arg_2_0:IsWaiting() then
		arg_2_0.openTime = arg_2_1.get_time or 0
	end

	arg_2_0.reduceTime = 0
	arg_2_0.reloadingReduceTime = 0
	arg_2_0.order = IslandShipOrder.New(arg_2_1)
	arg_2_0.config = pg.island_order_list[arg_2_0.id]
end

function var_0_0.CanRefresh(arg_3_0)
	if arg_3_0:GetOrder():IsAnyLoadUp() then
		return false
	end

	if arg_3_0:IsReloading() then
		return false
	end

	return true
end

function var_0_0.GetWorldObjId(arg_4_0)
	return pg.island_order_list[arg_4_0.id].objId or 0
end

function var_0_0.Submit(arg_5_0, arg_5_1)
	arg_5_0.endTime = arg_5_1
	arg_5_0.state = var_0_0.STATE_SUBMITED
end

function var_0_0.GetOrder(arg_6_0)
	return arg_6_0.order
end

function var_0_0.GetEndTime(arg_7_0)
	return arg_7_0.endTime - arg_7_0.reduceTime
end

function var_0_0.GetNeedTime(arg_8_0)
	return arg_8_0.totalTime
end

function var_0_0.GetReloadingEndTime(arg_9_0)
	return arg_9_0.openTime - arg_9_0.reloadingReduceTime
end

function var_0_0.IsReloading(arg_10_0)
	if arg_10_0:IsWaiting() then
		return pg.TimeMgr.GetInstance():GetServerTime() < arg_10_0:GetReloadingEndTime()
	else
		return false
	end
end

function var_0_0.IsLock(arg_11_0)
	return arg_11_0.state == var_0_0.STATE_LOCK
end

function var_0_0.IsWaiting(arg_12_0)
	return arg_12_0.state == var_0_0.STATE_WAITING
end

function var_0_0.IsSubmited(arg_13_0)
	return arg_13_0.state == var_0_0.STATE_SUBMITED
end

function var_0_0.IsFinished(arg_14_0)
	local function var_14_0()
		return pg.TimeMgr.GetInstance():GetServerTime() >= arg_14_0:GetEndTime()
	end

	return arg_14_0:IsSubmited() and var_14_0()
end

function var_0_0.CanSubmit(arg_16_0)
	return arg_16_0:IsWaiting()
end

function var_0_0.GetUnlockLevel(arg_17_0)
	return arg_17_0.config.unlock_level
end

function var_0_0.GetUnlockGold(arg_18_0)
	local var_18_0 = arg_18_0.config.unlock_cost[1] or {}

	return {
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_18_0[1] or 1,
		count = var_18_0[2] or 0
	}
end

function var_0_0.CanUnlock(arg_19_0)
	if not arg_19_0:IsLock() then
		return false
	end

	if arg_19_0.forceUnlock then
		return true
	end

	if not getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlockShipOrder(arg_19_0.id) then
		return false
	end

	return true
end

function var_0_0.SetReduceTime(arg_20_0, arg_20_1)
	arg_20_0.reduceTime = arg_20_1
end

function var_0_0.AddReduceTime(arg_21_0, arg_21_1)
	arg_21_0.reduceTime = arg_21_0.reduceTime + arg_21_1
end

function var_0_0.SetReloadingReduceTime(arg_22_0, arg_22_1)
	arg_22_0.reloadingReduceTime = arg_22_1
end

function var_0_0.AddReduceReloadingTime(arg_23_0, arg_23_1)
	arg_23_0.reloadingReduceTime = math.max(arg_23_0.reloadingReduceTime + arg_23_1, 0)
end

return var_0_0
