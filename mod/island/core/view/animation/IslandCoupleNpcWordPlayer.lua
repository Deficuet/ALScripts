local var_0_0 = class("IslandCoupleNpcWordPlayer", import("..IslandBaseUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.delayTime = pg.island_set.couple_word_cd.key_value_int
	arg_1_0.schedule = {}
end

function var_0_0.Play(arg_2_0, arg_2_1)
	if table.contains(arg_2_0.schedule, arg_2_1) then
		return
	end

	table.insert(arg_2_0.schedule, arg_2_1)

	if #arg_2_0.schedule == 1 then
		arg_2_0:Start()
	end
end

function var_0_0.Start(arg_3_0)
	if not arg_3_0.schedule or #arg_3_0.schedule <= 0 then
		return
	end

	local var_3_0 = arg_3_0.schedule[1]
	local var_3_1 = IslandCoupleNpcWordTask.New(var_3_0, arg_3_0:GetView())

	var_3_1:Execute(var_3_0, function()
		arg_3_0.player = nil

		table.remove(arg_3_0.schedule, 1)
		arg_3_0:DelayStart()
	end)

	arg_3_0.player = var_3_1
end

function var_0_0.DelayStart(arg_5_0)
	arg_5_0:RemoveTimer()

	if #arg_5_0.schedule <= 0 then
		return
	end

	arg_5_0.timer = Timer.New(function()
		arg_5_0:Start()
	end, arg_5_0.delayTime, 1)

	arg_5_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_7_0)
	if arg_7_0.timer then
		arg_7_0.timer:Stop()

		arg_7_0.timer = nil
	end
end

function var_0_0.Stop(arg_8_0, arg_8_1)
	if table.contains(arg_8_0.schedule, arg_8_1) then
		table.removebyvalue(arg_8_0.schedule, arg_8_1)
	end

	if arg_8_0.player and arg_8_0.player:IsCurrentTask(arg_8_1) then
		arg_8_0.player:Stop()

		arg_8_0.player = nil

		arg_8_0:DelayStart()
	end
end

function var_0_0.OnDispose(arg_9_0)
	if arg_9_0.player then
		arg_9_0.player:Stop()
		arg_9_0.player:Dispose()

		arg_9_0.player = nil
	end

	arg_9_0.schedule = nil

	arg_9_0:RemoveTimer()
end

return var_0_0
