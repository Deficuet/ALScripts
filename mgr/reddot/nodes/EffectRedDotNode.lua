local var_0_0 = class("EffectRedDotNode", import(".RedDotNode"))

function var_0_0.SetData(arg_1_0, arg_1_1)
	if IsNil(arg_1_0.gameObject) or not isActive(arg_1_0.gameObject) then
		return
	end

	local var_1_0

	if arg_1_0.gameObject.childCount > 0 then
		var_1_0 = arg_1_0.gameObject:GetChild(0)
	end

	if var_1_0 then
		setActive(var_1_0, arg_1_1)
	end

	local var_1_1 = arg_1_0.gameObject:Find("tip")

	if var_1_1 then
		setActive(var_1_1, arg_1_1)

		if arg_1_1 then
			arg_1_0:StartAnimation(var_1_1)
		end
	end
end

function var_0_0.StartAnimation(arg_2_0, arg_2_1)
	arg_2_0:RemoveTimer()

	local var_2_0 = arg_2_1:GetComponent(typeof(Animator))

	var_2_0.enabled = true
	arg_2_0.timer = Timer.New(function()
		if not var_2_0 then
			return
		end

		var_2_0.enabled = false
		var_2_0.gameObject.transform.localEulerAngles = Vector3.zero
	end, 5, 1)

	arg_2_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_4_0)
	if arg_4_0.timer then
		arg_4_0.timer:Stop()

		arg_4_0.timer = nil
	end
end

function var_0_0.Remove(arg_5_0)
	arg_5_0:RemoveTimer()
end

function var_0_0.Pause(arg_6_0)
	arg_6_0:RemoveTimer()
end

return var_0_0
