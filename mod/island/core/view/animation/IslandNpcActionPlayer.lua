local var_0_0 = class("IslandNpcActionPlayer", import("..IslandBaseUnit"))

function var_0_0.Resopon(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if not arg_1_1 or not arg_1_2 then
		return
	end

	local var_1_0, var_1_1 = arg_1_1.data:GetResponeAction(arg_1_3)

	if not var_1_0 then
		return
	end

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_1_3, 2, arg_1_1.modelId, var_1_0, 1))
	seriesAsync({
		function(arg_2_0)
			arg_1_0:PlayBubble(arg_1_1, var_1_0)

			local var_2_0 = pg.island_action_feedback[var_1_0].state_name

			if not var_2_0 then
				arg_2_0()

				return
			end

			arg_1_1:PlayAnimation(var_2_0, 0.25, arg_2_0)
		end
	}, function()
		if var_1_1 then
			arg_1_0:NotifiyMeditor(IslandMediator.NPC_ACTION_AWARD, arg_1_1.id, var_1_0)
		end
	end)
end

function var_0_0.PlayBubble(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = pg.island_action_feedback[arg_4_2]

	if not var_4_0.emoji or var_4_0.emoji == "" then
		return
	end

	local var_4_1 = 0

	if type(var_4_0.emoji) == "table" then
		local var_4_2 = var_4_0.emoji

		var_4_1 = var_4_2[math.random(1, #var_4_2)]
	else
		var_4_1 = var_4_0.emoji
	end

	require("nodecanvas.Task.NcPlayChatExpression").New(nil, {}):DoAction(var_4_1, arg_4_1.id, arg_4_1.unitType, function()
		return
	end)
end

function var_0_0.ResoponByRandom(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = pg.island_action[arg_6_2]

	if not var_6_0 then
		return
	end

	local var_6_1 = var_6_0.sigle_action_reply_type

	if not var_6_1 then
		return
	end

	local var_6_2 = arg_6_0:GetResponActionName(var_6_0.chara_sigle_action_reply or {})

	if not var_6_2 then
		return
	end

	local var_6_3 = arg_6_0:CollectUnits(var_6_1, arg_6_1)

	if #var_6_3 <= 0 then
		return
	end

	arg_6_0:TurnToPlayer(var_6_3, arg_6_1)

	local var_6_4 = {}

	table.insert(var_6_4, function(arg_7_0)
		onNextTick(arg_7_0)
	end)

	for iter_6_0, iter_6_1 in ipairs(var_6_3) do
		table.insert(var_6_4, function(arg_8_0)
			iter_6_1:PlayAnimation(var_6_2, 0.25, arg_8_0)
		end)
	end

	table.insert(var_6_4, function(arg_9_0)
		onNextTick(arg_9_0)
	end)
	parallelAsync(var_6_4, function()
		arg_6_0:ResetUnits(var_6_3)
	end)
end

function var_0_0.GetResponActionName(arg_11_0, arg_11_1)
	if #arg_11_1 <= 0 then
		return
	end

	local var_11_0 = _.map(arg_11_1, function(arg_12_0)
		return pg.island_action_feedback[arg_12_0].state_name
	end)

	return var_11_0[math.random(1, #var_11_0)]
end

function var_0_0.TurnToPlayer(arg_13_0, arg_13_1, arg_13_2)
	local function var_13_0(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_1.position - arg_14_0.position
		local var_14_1 = Quaternion.LookRotation(var_14_0)

		arg_14_0.rotation = Quaternion.Euler(0, var_14_1.eulerAngles.y, 0)
	end

	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		if iter_13_1 then
			iter_13_1:StopMove()
			iter_13_1:PauseBt()
			var_13_0(iter_13_1._go.transform, arg_13_2._go.transform)
		end
	end
end

function var_0_0.ResetUnits(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
		if iter_15_1 then
			iter_15_1:SetupBt()
		end
	end
end

function var_0_0.CollectUnits(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {}
	local var_16_1 = pg.island_set.single_action_respon_check_range.key_value_int

	if arg_16_1 == IslandConst.ACTION_REPOSON_TYPE_NEAREST_ONE then
		arg_16_0:GetNearestUnit(var_16_0, arg_16_2, var_16_1)
	elseif arg_16_1 == IslandConst.ACTION_REPOSON_TYPE_NEAREST_FOLLOWER then
		arg_16_0:GetNearestFollower(var_16_0, arg_16_2, var_16_1)
	elseif arg_16_1 == IslandConst.ACTION_REPOSON_TYPE_ALL_FOLLOWER then
		arg_16_0:GetAllFollower(var_16_0, arg_16_2, var_16_1)
	elseif arg_16_1 == IslandConst.ACTION_REPOSON_TYPE_RANDOM_FOLLOWER then
		arg_16_0:GetRandomFollower(var_16_0, arg_16_2, var_16_1)
	end

	return var_16_0
end

function var_0_0.GetNearestUnit(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0:GetView():GetAllUnits()
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if isa(iter_17_1, IslandNpcUnit) then
			table.insert(var_17_1, iter_17_1)
		end
	end

	if #var_17_1 <= 0 then
		return
	end

	local var_17_2
	local var_17_3 = math.huge

	for iter_17_2, iter_17_3 in ipairs(var_17_1) do
		local var_17_4 = Vector3.Distance(iter_17_3._go.transform.position, arg_17_2._go.transform.position)

		if var_17_4 <= arg_17_3 and var_17_4 < var_17_3 then
			var_17_3 = var_17_4
			var_17_2 = iter_17_3
		end
	end

	if var_17_2 then
		table.insert(arg_17_1, var_17_2)
	end
end

function var_0_0.GetNearestFollower(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0:GetView():GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_18_1
	local var_18_2 = math.huge

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		local var_18_3 = Vector3.Distance(iter_18_1._go.transform.position, arg_18_2._go.transform.position)

		if var_18_3 <= arg_18_3 and var_18_3 < var_18_2 then
			var_18_2 = var_18_3
			var_18_1 = iter_18_1
		end
	end

	if var_18_1 then
		table.insert(arg_18_1, var_18_1)
	end
end

function var_0_0.GetAllFollower(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = arg_19_0:GetView():GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		if arg_19_3 >= Vector3.Distance(iter_19_1._go.transform.position, arg_19_2._go.transform.position) then
			table.insert(arg_19_1, iter_19_1)
		end
	end
end

function var_0_0.GetRandomFollower(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_0:GetView():GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_20_1 = {}

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		if arg_20_3 >= Vector3.Distance(iter_20_1._go.transform.position, arg_20_2._go.transform.position) then
			table.insert(var_20_1, iter_20_1)
		end
	end

	if #var_20_1 <= 0 then
		return
	end

	local var_20_2 = var_20_1[math.random(1, #var_20_1)]

	table.insert(arg_20_1, var_20_2)
end

return var_0_0
