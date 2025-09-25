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
	arg_2_0.endTime = arg_2_1.get_time or 0
	arg_2_0.reduceTime = 0
	arg_2_0.order = IslandShipOrder.New(arg_2_1)
	arg_2_0.config = pg.island_order_list[arg_2_0.id]
end

function var_0_0.GetWorldObjId(arg_3_0)
	return pg.island_order_list[arg_3_0.id].objId or 0
end

function var_0_0.Submit(arg_4_0, arg_4_1)
	arg_4_0.endTime = arg_4_1
	arg_4_0.state = var_0_0.STATE_SUBMITED
end

function var_0_0.GetOrder(arg_5_0)
	return arg_5_0.order
end

function var_0_0.GetEndTime(arg_6_0)
	return arg_6_0.endTime - arg_6_0.reduceTime
end

function var_0_0.GetNeedTime(arg_7_0)
	return arg_7_0.totalTime
end

function var_0_0.IsLock(arg_8_0)
	return arg_8_0.state == var_0_0.STATE_LOCK
end

function var_0_0.IsWaiting(arg_9_0)
	return arg_9_0.state == var_0_0.STATE_WAITING
end

function var_0_0.IsSubmited(arg_10_0)
	return arg_10_0.state == var_0_0.STATE_SUBMITED
end

function var_0_0.IsFinished(arg_11_0)
	local function var_11_0()
		return pg.TimeMgr.GetInstance():GetServerTime() >= arg_11_0:GetEndTime()
	end

	return arg_11_0:IsSubmited() and var_11_0()
end

function var_0_0.CanSubmit(arg_13_0)
	return arg_13_0:IsWaiting()
end

function var_0_0.GetUnlockLevel(arg_14_0)
	return arg_14_0.config.unlock_level
end

function var_0_0.GetUnlockGold(arg_15_0)
	local var_15_0 = arg_15_0.config.unlock_cost[1] or {}

	return {
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_15_0[1] or 1,
		count = var_15_0[2] or 0
	}
end

function var_0_0.CanUnlock(arg_16_0)
	if not arg_16_0:IsLock() then
		return false
	end

	if arg_16_0.forceUnlock then
		return true
	end

	if not getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlockShipOrder(arg_16_0.id) then
		return false
	end

	return true
end

function var_0_0.SetReduceTime(arg_17_0, arg_17_1)
	arg_17_0.reduceTime = arg_17_1
end

function var_0_0.AddReduceTime(arg_18_0, arg_18_1)
	arg_18_0.reduceTime = arg_18_0.reduceTime + arg_18_1
end

return var_0_0
