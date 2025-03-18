local var_0_0 = class("SpAnimStoryPlayer", import(".StoryPlayer"))

function var_0_0.OnReset(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	setActive(arg_1_0.spAnimPanel, true)

	local var_1_0 = pg.NewStoryMgr.GetInstance().skipBtn
	local var_1_1 = pg.NewStoryMgr.GetInstance().autoBtn
	local var_1_2 = pg.NewStoryMgr.GetInstance().recordBtn

	arg_1_0.hideBtns = {}

	if isActive(var_1_0) and arg_1_1:ShouldHideSkipBtn() then
		setActive(var_1_0, false)
		table.insert(arg_1_0.hideBtns, var_1_0)
	end

	if isActive(var_1_1) then
		setActive(var_1_1, false)
		table.insert(arg_1_0.hideBtns, var_1_1)
	end

	if isActive(var_1_2) then
		setActive(var_1_2, false)
		table.insert(arg_1_0.hideBtns, var_1_2)
	end

	arg_1_3()
end

function var_0_0.OnEnter(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	seriesAsync({
		function(arg_3_0)
			arg_2_0:GetSpine(arg_2_1, arg_3_0)
		end,
		function(arg_4_0)
			arg_2_0:PlaySpAnim(arg_2_1, arg_4_0)
		end
	}, arg_2_3)
end

function var_0_0.GetSpine(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1:GetSpineName()

	PoolMgr.GetInstance():GetSpineChar(var_5_0, true, function(arg_6_0)
		setParent(arg_6_0, arg_5_0.spAnimPanel)

		tf(arg_6_0).localPosition = Vector3(0, 0, 0)

		local var_6_0 = arg_6_0:GetComponent("SpineAnimUI")

		arg_5_0.spineAnim = var_6_0
		arg_5_0.shipModel = arg_6_0

		arg_5_2()
	end)

	arg_5_0.prefab = var_5_0
end

function var_0_0.PlaySpAnim(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.spineAnim:SetActionCallBack(nil)

	if arg_7_1:HasStopTime() then
		arg_7_0:DelayCall(arg_7_1:GetStopTime(), arg_7_2)
	else
		arg_7_0.spineAnim:SetActionCallBack(function(arg_8_0)
			if arg_8_0 == "finish" then
				arg_7_0.spineAnim:SetActionCallBack(nil)
				arg_7_2()
			end
		end)
	end

	local var_7_0 = arg_7_1:GetActionName()

	arg_7_0.spineAnim:SetAction(var_7_0, 0)

	if arg_7_1:ShouldAdjustSpeed() then
		arg_7_0:AdjustSpeed(arg_7_1:GetSpeed())
	end
end

function var_0_0.AdjustSpeed(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:GetAnimationState()

	var_9_0.TimeScale = var_9_0.TimeScale * arg_9_1
end

function var_0_0.GetAnimationState(arg_10_0)
	return arg_10_0.shipModel:GetComponent("Spine.Unity.SkeletonGraphic").AnimationState
end

function var_0_0.ReturnSpine(arg_11_0)
	if arg_11_0.shipModel == nil or arg_11_0.spineAnim == nil or arg_11_0.prefab == nil then
		return
	end

	arg_11_0:GetAnimationState().TimeScale = 1

	arg_11_0.spineAnim:SetActionCallBack(nil)
	PoolMgr.GetInstance():ReturnSpineChar(arg_11_0.prefab, arg_11_0.shipModel)

	arg_11_0.shipModel = nil
	arg_11_0.spineAnim = nil
	arg_11_0.prefab = nil
end

function var_0_0.ClearSp(arg_12_0)
	arg_12_0:ReturnSpine()

	for iter_12_0, iter_12_1 in pairs(arg_12_0.hideBtns or {}) do
		setActive(iter_12_1, true)
	end

	arg_12_0.hideBtns = {}
end

function var_0_0.OnWillExit(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_0:ClearSp()
	arg_13_3()
end

function var_0_0.OnEnd(arg_14_0)
	arg_14_0:ClearSp()
end

function var_0_0.RegisetEvent(arg_15_0, arg_15_1, arg_15_2)
	var_0_0.super.RegisetEvent(arg_15_0, arg_15_1, arg_15_2)
	triggerButton(arg_15_0._go)
end

return var_0_0
