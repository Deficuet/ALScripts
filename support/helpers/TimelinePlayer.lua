local var_0_0 = class("TimelinePlayer")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.comDirector = arg_1_1:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

	if GetComponent(arg_1_1, "TimelineSpeed") then
		arg_1_0:SetSpeed(1)
	else
		GetOrAddComponent(arg_1_1, "TimelineSpeed")
	end

	arg_1_0.signalReceiver = GetOrAddComponent(arg_1_1, "DftCommonSignalReceiver")

	arg_1_0.signalReceiver:SetCommonEvent(function(arg_2_0)
		arg_1_0:TriggerEvent(arg_2_0)
	end)
	arg_1_0.comDirector:Stop()

	arg_1_0.comDirector.extrapolationMode = ReflectionHelp.RefGetField(typeof("UnityEngine.Playables.DirectorWrapMode"), "Hold", nil)

	TimelineSupport.InitTimeline(arg_1_0.comDirector)
end

function var_0_0.Register(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1 then
		arg_3_0.comDirector.time = math.clamp(arg_3_1, 0, arg_3_0.comDirector.duration)
	end

	if arg_3_2 then
		arg_3_0.triggerFunc = arg_3_2
	end
end

function var_0_0.TriggerEvent(arg_4_0, arg_4_1)
	assert(arg_4_0.triggerFunc)
	arg_4_0.triggerFunc(arg_4_0, arg_4_1, arg_4_0.mark)
end

function var_0_0.Start(arg_5_0)
	arg_5_0.mark = {}

	arg_5_0:Play()
end

function var_0_0.Play(arg_6_0)
	arg_6_0.comDirector:Play()
end

function var_0_0.Pause(arg_7_0)
	arg_7_0.comDirector:Pause()
end

function var_0_0.Stop(arg_8_0)
	arg_8_0.comDirector:Stop()
end

function var_0_0.SetSpeed(arg_9_0, arg_9_1)
	setDirectorSpeed(arg_9_0.comDirector, arg_9_1)
end

function var_0_0.SetTime(arg_10_0, arg_10_1)
	arg_10_0.comDirector.time = arg_10_1

	arg_10_0.comDirector:RebuildGraph()
end

function var_0_0.RawSetTime(arg_11_0, arg_11_1)
	arg_11_0.comDirector.time = arg_11_1
end

function var_0_0.Dispose(arg_12_0)
	return
end

return var_0_0
