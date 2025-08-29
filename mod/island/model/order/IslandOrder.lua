local var_0_0 = class("IslandOrder", import("model.vo.BaseVO"))

var_0_0.TYPE_NORMAL = 1
var_0_0.TYPE_URGENCY = 2
var_0_0.TYPE_FORM = 4

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0:Flush(arg_1_1)
end

function var_0_0.Flush(arg_2_0, arg_2_1)
	arg_2_0.id = arg_2_1.dialog_id
	arg_2_0.configId = arg_2_0.id
	arg_2_0.tendency = arg_2_1.cur_select
	arg_2_0.startTime = arg_2_1.start_time
	arg_2_0.submitTime = arg_2_1.submit_time
	arg_2_0.showFlag = arg_2_1.view_flag
	arg_2_0.consumeList = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.cost or {}) do
		table.insert(arg_2_0.consumeList, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_2_1.id,
			count = iter_2_1.num
		})
	end

	arg_2_0.orderLevel = arg_2_1.order_lv or 1
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.island_order_publish_random
end

function var_0_0.GetExpValue(arg_4_0)
	return pg.island_set.order_favor.key_value_int
end

function var_0_0.GetTendency(arg_5_0)
	return arg_5_0.tendency
end

function var_0_0.CanFinish(arg_6_0)
	local var_6_0 = arg_6_0:GetConsume()

	return _.all(var_6_0, function(arg_7_0)
		return Drop.New({
			type = arg_7_0.type,
			id = arg_7_0.id
		}):getOwnedCount() >= arg_7_0.count
	end)
end

function var_0_0.GetDesc(arg_8_0)
	return arg_8_0:getConfig("desc")
end

function var_0_0.GetConsume(arg_9_0)
	return arg_9_0.consumeList
end

function var_0_0.GetDisplayAwards(arg_10_0)
	local var_10_0, var_10_1 = arg_10_0:GetAwardItemAndExp()

	table.insert(var_10_0, {
		id = 2,
		type = DROP_TYPE_ISLAND_ITEM,
		count = var_10_1
	})

	return var_10_0
end

function var_0_0.GetAwardConfigByTendency(arg_11_0, arg_11_1)
	local var_11_0 = pg.island_order_price[arg_11_1]

	assert(var_11_0, "order config not found, level: " .. arg_11_1)

	local var_11_1 = arg_11_0:GetTendency()

	if arg_11_0:IsUrgency() then
		return var_11_0.order_award_special
	end

	if IslandOrderSlot.TENDENCY_TYPE_COMMON == var_11_1 then
		return var_11_0.order_award
	elseif IslandOrderSlot.TENDENCY_TYPE_EASY == var_11_1 then
		return var_11_0.order_easy_award
	elseif IslandOrderSlot.TENDENCY_TYPE_HARD == var_11_1 then
		return var_11_0.order_award_challenge
	end

	assert(false, "unknown order tendency: " .. arg_11_1 .. tostring(var_11_1))
end

function var_0_0.GenAwards(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1[1]
	local var_12_1 = {}

	table.insert(var_12_1, {
		id = 1,
		type = DROP_TYPE_ISLAND_ITEM,
		count = arg_12_1[2]
	})

	return var_12_1, var_12_0
end

function var_0_0.GetAwardItemAndExp(arg_13_0)
	local var_13_0 = arg_13_0:GetAwardConfigByTendency(arg_13_0.orderLevel)

	return arg_13_0:GenAwards(var_13_0)
end

function var_0_0.GetRoleIcon(arg_14_0)
	local var_14_0 = arg_14_0:getConfig("npc_id")

	return pg.island_unit_character[var_14_0].IslandShipIcon
end

function var_0_0.GetRoleName(arg_15_0)
	local var_15_0 = arg_15_0:getConfig("npc_id")

	return pg.island_unit_character[var_15_0].name
end

function var_0_0.IsUrgency(arg_16_0)
	return false
end

function var_0_0.IsFirm(arg_17_0)
	return false
end

function var_0_0.GetTitle(arg_18_0)
	return i18n("island_order_type_1")
end

function var_0_0.IsEmpty(arg_19_0)
	return arg_19_0.showFlag == IslandOrderSlot.SHOW_FLAG_TOMORROW and arg_19_0:IsLoading()
end

function var_0_0.IsLoading(arg_20_0)
	return pg.TimeMgr.GetInstance():GetServerTime() < arg_20_0.submitTime
end

function var_0_0.CanReplace(arg_21_0)
	return not arg_21_0:IsEmpty() and not arg_21_0:IsLoading()
end

function var_0_0.GetTotalTime(arg_22_0)
	return arg_22_0.submitTime - arg_22_0.startTime
end

function var_0_0.GetDisappearTime(arg_23_0)
	return -1
end

function var_0_0.GetCanSubmitTime(arg_24_0)
	return arg_24_0.submitTime
end

return var_0_0
