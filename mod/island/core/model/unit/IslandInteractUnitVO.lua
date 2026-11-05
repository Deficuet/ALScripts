local var_0_0 = class("IslandInteractUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.config = pg.island_unit_interactive_item[arg_1_0.modelId]
	arg_1_0.slots = {}

	for iter_1_0 = 1, arg_1_0.config.slot_cnt do
		table.insert(arg_1_0.slots, InteractSlot.New(iter_1_0, arg_1_0.id))
	end

	arg_1_0:InitTimlineInfo()
end

function var_0_0.InitTimlineInfo(arg_2_0)
	arg_2_0.timelineInfo = {}

	if arg_2_0.config.timeline == nil or arg_2_0.config.timeline == "" then
		return
	end

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.config.timeline) do
		table.insert(arg_2_0.timelineInfo, pg.island_item_timeline[iter_2_1])
	end
end

function var_0_0.GetTimeline(arg_3_0)
	return arg_3_0.timelineInfo
end

function var_0_0.HasTimeline(arg_4_0)
	return #arg_4_0.timelineInfo > 0
end

function var_0_0.GetSlot(arg_5_0)
	return #arg_5_0.slots
end

function var_0_0.GetBlackboardParam(arg_6_0)
	return arg_6_0.config.param
end

return var_0_0
