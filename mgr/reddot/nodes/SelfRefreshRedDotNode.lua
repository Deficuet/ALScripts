local var_0_0 = class("SelfRefreshRedDotNode", import(".RedDotNode"))

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)
	arg_1_0:AddTimer()
end

function var_0_0.AddTimer(arg_2_0)
	arg_2_0:RemoveTimer()

	arg_2_0.timer = Timer.New(function()
		arg_2_0:Check()
	end, 10, -1)

	arg_2_0.timer:Start()
end

function var_0_0.Check(arg_4_0)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.types) do
		pg.RedDotMgr.GetInstance():NotifyAll(iter_4_1)
	end
end

function var_0_0.RemoveTimer(arg_5_0)
	if arg_5_0.timer then
		arg_5_0.timer:Stop()

		arg_5_0.timer = nil
	end
end

function var_0_0.Remove(arg_6_0)
	arg_6_0:RemoveTimer()
end

function var_0_0.Resume(arg_7_0)
	if arg_7_0.timer then
		arg_7_0.timer:Resume()
	end
end

function var_0_0.Pause(arg_8_0)
	if arg_8_0.timer then
		arg_8_0.timer:Pause()
	end
end

return var_0_0
