local var_0_0 = class("IslandChatBubblePlayer", import("Mgr.Story.model.animation.StoryAnimtion"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.tpl = arg_1_1
	arg_1_0.role = arg_1_2
	arg_1_0.contentTxt = arg_1_0.tpl.transform:Find("Text"):GetComponent(typeof(Text))
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:Stop()
	seriesAsync({
		function(arg_3_0)
			setActive(arg_2_0.tpl, true)
			arg_2_0:UpdateBubble(arg_2_1, arg_3_0)
		end,
		function(arg_4_0)
			arg_2_0:WaitForNextOne(arg_2_1, arg_4_0)
		end,
		function(arg_5_0)
			arg_2_0:EneAction(arg_2_1)
			arg_5_0()
		end
	}, arg_2_2)
end

function var_0_0.UpdateBubble(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetSay()

	if var_6_0 == "" then
		if arg_6_2 then
			arg_6_2()
		end

		return
	end

	arg_6_0.contentTxt.text = var_6_0

	arg_6_0:PlayCharatorAnimation(arg_6_1)
	arg_6_2()
end

function var_0_0.WaitForNextOne(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1:GetTime()

	arg_7_0:UnscaleDelayCall(var_7_0, arg_7_2)
end

function var_0_0.PlayCharatorAnimation(arg_8_0, arg_8_1)
	if not arg_8_1:ExistAnimation() then
		return
	end

	local var_8_0 = arg_8_0.role
	local var_8_1 = arg_8_1:GetAnimation()
	local var_8_2 = var_8_0:GetComponent(typeof(Animator)) or var_8_0.transform:GetChild(0):GetComponent(typeof(Animator))

	if not var_8_2:GetCurrentAnimatorStateInfo(0):IsName(var_8_1) then
		local var_8_3 = Animator.StringToHash(var_8_1)

		for iter_8_0 = 1, var_8_2.layerCount do
			var_8_2:CrossFadeInFixedTime(var_8_3, 0.2, iter_8_0 - 1)
		end
	end
end

function var_0_0.EneAction(arg_9_0, arg_9_1)
	arg_9_0:RemnoveTimer()

	local var_9_0, var_9_1 = arg_9_1:GetHideType()
	local var_9_2 = arg_9_0.tpl

	if var_9_0 == BubbleStep.HIDE_TYPE_IMMEDIATELY then
		setActive(var_9_2, false)
	elseif var_9_0 == BubbleStep.HIDE_TYPE_NEVER then
		-- block empty
	elseif var_9_0 == BubbleStep.HIDE_TYPE_TIME then
		arg_9_0.timer = arg_9_0:CreateDelayTimer(var_9_1, function()
			if not IsNil(var_9_2) then
				setActive(var_9_2, false)
			end
		end)
	end
end

function var_0_0.RemnoveTimer(arg_11_0)
	if arg_11_0.timer then
		arg_11_0.timer:Stop()

		arg_11_0.timer = nil
	end
end

function var_0_0.Stop(arg_12_0)
	arg_12_0:RemnoveTimer()
	arg_12_0:ClearAnimation()
	setActive(arg_12_0.tpl, false)
end

function var_0_0.Dispose(arg_13_0)
	Object.Destroy(arg_13_0.tpl)

	arg_13_0.tpl = nil
	arg_13_0.role = nil
	arg_13_0.contentTxt = nil

	arg_13_0:RemnoveTimer()
	arg_13_0:ClearAnimation()
end

return var_0_0
