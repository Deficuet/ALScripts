local var_0_0 = class("LadySlide")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	arg_1_0.id = arg_1_1
	arg_1_0.ladyEnv = arg_1_2
	arg_1_0._tf = arg_1_2.lady
	arg_1_0.animator = arg_1_0._tf:GetComponent(typeof(Animator))
	arg_1_0.commandConfig = arg_1_3
	arg_1_0.defaultPoint = arg_1_4
	arg_1_0.ladderTime = pg.dorm3d_minigame_slide[arg_1_1].ladder_time
	arg_1_0.moveSpeed = pg.dorm3d_minigame_slide[arg_1_1].move_speed
	arg_1_0.onPlayVFX = arg_1_5
end

function var_0_0.Reset(arg_2_0)
	arg_2_0._tf.localPosition = arg_2_0.defaultPoint.position
	arg_2_0._tf.localRotation = arg_2_0.defaultPoint.rotation

	arg_2_0.ladyEnv:PlaySingleAction(SlideConst.IDLE_ANIM)
end

function var_0_0.StartMove(arg_3_0)
	arg_3_0:Cancel()

	arg_3_0.curIndex = 1
	arg_3_0.curState = nil
	arg_3_0.inProgress = true

	arg_3_0.ladyEnv:SetCollisible(false)
	arg_3_0.ladyEnv:EnableCharacterTransparency(true)
	arg_3_0.ladyEnv:BlockCanWatch(true)
end

function var_0_0.EndMove(arg_4_0)
	arg_4_0.curIndex = nil
	arg_4_0.curState = nil
	arg_4_0.inProgress = false

	arg_4_0.ladyEnv:SetCollisible(true)
	arg_4_0.ladyEnv:EnableCharacterTransparency(false)
	arg_4_0.ladyEnv:BlockCanWatch(false)
	arg_4_0:Reset()
end

function var_0_0.OnUpdate(arg_5_0)
	if not arg_5_0.inProgress or arg_5_0.curIndex > #arg_5_0.commandConfig then
		return
	end

	local var_5_0 = arg_5_0.commandConfig[arg_5_0.curIndex]

	if not arg_5_0.curState then
		arg_5_0:EnterState(var_5_0.type, var_5_0)
	elseif arg_5_0:Check(var_5_0) then
		arg_5_0.curIndex = arg_5_0.curIndex + 1

		if arg_5_0.curIndex > #arg_5_0.commandConfig then
			arg_5_0:ExitState(arg_5_0.curState)
			arg_5_0:EndMove()

			return
		end

		var_5_0 = arg_5_0.commandConfig[arg_5_0.curIndex]

		if var_5_0.type ~= arg_5_0.curState then
			arg_5_0:ExitState(arg_5_0.curState)
		end

		arg_5_0:EnterState(var_5_0.type, var_5_0)
	end

	arg_5_0:UpdateState(var_5_0)
end

function var_0_0.Check(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_0.position - arg_7_1.position

		var_7_0.y = 0

		return var_7_0.magnitude <= 0.1
	end

	return switch(arg_6_0.curState, {
		[SlideConst.COMMAND_TYPE.WALK] = function()
			return var_6_0(arg_6_1.target, arg_6_0._tf)
		end,
		[SlideConst.COMMAND_TYPE.LADDER] = function()
			return var_6_0(arg_6_1.target, arg_6_0._tf)
		end,
		[SlideConst.COMMAND_TYPE.SLIDE] = function()
			return arg_6_1.target.position.y >= arg_6_0._tf.position.y
		end,
		[SlideConst.COMMAND_TYPE.TELEPORT] = function()
			return true
		end,
		[SlideConst.COMMAND_TYPE.ANIM] = function()
			if arg_6_0.animator:IsInTransition(arg_6_0.ladyEnv.ladyAnimBaseLayerIndex) then
				return false
			end

			return arg_6_0.animator:GetCurrentAnimatorStateInfo(arg_6_0.ladyEnv.ladyAnimBaseLayerIndex).normalizedTime >= 1
		end,
		[SlideConst.COMMAND_TYPE.ANIM_MOVE_ROTATE] = function()
			return arg_6_0.walkWithRotateTime >= arg_6_1.time
		end
	})
end

function var_0_0.UpdateState(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.target

	switch(arg_14_0.curState, {
		[SlideConst.COMMAND_TYPE.WALK] = function()
			arg_14_0.ladyEnv:MoveToTarget(var_14_0.position, arg_14_0.moveSpeed)
		end,
		[SlideConst.COMMAND_TYPE.LADDER] = function()
			arg_14_0.ladderMoveTime = arg_14_0.ladderMoveTime + Time.deltaTime

			local var_16_0 = math.min(arg_14_0.ladderMoveTime / arg_14_0.ladderTime, 1)

			arg_14_0._tf.localPosition = arg_14_0.ladderStartPos + arg_14_0.ladderForward * (SlideConst.LADDER_DISPLACEMENT.z * var_16_0) + Vector3.up * (SlideConst.LADDER_DISPLACEMENT.y * var_16_0)

			if var_16_0 >= 1 then
				arg_14_0.ladderMoveTime = 0
				arg_14_0.ladderStartPos = arg_14_0._tf.localPosition
			end
		end,
		[SlideConst.COMMAND_TYPE.SLIDE] = function()
			arg_14_0.slideMoveTime = arg_14_0.slideMoveTime + Time.deltaTime

			local var_17_0 = arg_14_0.slideMoveTime * SlideConst.SLIDE_GRAVITY
			local var_17_1 = arg_14_0.slideTotalDelta.normalized * var_17_0

			arg_14_0.ladyEnv.characterController:Move(var_17_1 * Time.deltaTime)
		end,
		[SlideConst.COMMAND_TYPE.TELEPORT] = function()
			arg_14_0._tf.localPosition = var_14_0.position
			arg_14_0._tf.localRotation = var_14_0.rotation
		end,
		[SlideConst.COMMAND_TYPE.ANIM] = function()
			return
		end,
		[SlideConst.COMMAND_TYPE.ANIM_MOVE_ROTATE] = function()
			arg_14_0.walkWithRotateTime = arg_14_0.walkWithRotateTime + Time.deltaTime

			local var_20_0 = math.min(arg_14_0.walkWithRotateTime / arg_14_1.time, 1)

			arg_14_0._tf.localRotation = Quaternion.Slerp(arg_14_0.cacheRotation, arg_14_1.target.rotation, var_20_0)
			arg_14_0._tf.localPosition = Vector3.Lerp(arg_14_0.cachePosition, arg_14_1.target.position, var_20_0)
		end
	})
end

function var_0_0.EnterState(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_2:HasEffect() then
		local var_21_0, var_21_1 = arg_21_2:GetEffect()

		arg_21_0.vfxLTId = LeanTween.delayedCall(var_21_0, System.Action(function()
			arg_21_0.onPlayVFX(var_21_1)
		end)).uniqueId
	end

	if arg_21_2:HasWet() then
		local var_21_2, var_21_3 = arg_21_2:GetWet()

		arg_21_0.wetLTId = LeanTween.delayedCall(var_21_2, System.Action(function()
			arg_21_0:ShowWetness(var_21_3)
		end)).uniqueId
	end

	switch(arg_21_1, {
		[SlideConst.COMMAND_TYPE.WALK] = function()
			arg_21_0.ladyEnv:PlaySingleAction(SlideConst.WALK_ANIM, nil, arg_21_2:GetFadeInTime())

			arg_21_0.ladyEnv.characterController.enabled = true
		end,
		[SlideConst.COMMAND_TYPE.LADDER] = function()
			arg_21_0.ladyEnv:PlaySingleAction(SlideConst.LADDER_ANIM, nil, arg_21_2:GetFadeInTime())

			local var_25_0 = arg_21_2.target.position - arg_21_0._tf.position

			var_25_0.y = 0

			if var_25_0.sqrMagnitude > 0 then
				arg_21_0._tf.rotation = Quaternion.LookRotation(var_25_0.normalized, Vector3.up)
			end

			arg_21_0.ladderMoveTime = 0
			arg_21_0.ladderStartPos = arg_21_0._tf.localPosition
			arg_21_0.ladderForward = arg_21_0._tf.forward
		end,
		[SlideConst.COMMAND_TYPE.SLIDE] = function()
			arg_21_0.ladyEnv.characterController.enabled = true

			arg_21_0.ladyEnv:PlaySingleAction(SlideConst.SLIDE_ANIM, nil, arg_21_2:GetFadeInTime())

			local var_26_0 = arg_21_2.target.position - arg_21_0._tf.position

			if var_26_0.sqrMagnitude > 0 then
				arg_21_0._tf.rotation = Quaternion.LookRotation(var_26_0.normalized, Vector3.up)
			end

			arg_21_0.slideMoveTime = 0
			arg_21_0.slideTotalDelta = arg_21_2.target.position - arg_21_0._tf.localPosition
		end,
		[SlideConst.COMMAND_TYPE.TELEPORT] = function()
			return
		end,
		[SlideConst.COMMAND_TYPE.ANIM] = function()
			arg_21_0.ladyEnv:PlaySingleAction(arg_21_2.anim, nil, arg_21_2:GetFadeInTime())
		end,
		[SlideConst.COMMAND_TYPE.ANIM_MOVE_ROTATE] = function()
			arg_21_0.ladyEnv:PlaySingleAction(arg_21_2.anim, nil, arg_21_2:GetFadeInTime())

			arg_21_0.cacheRotation = arg_21_0._tf.localRotation
			arg_21_0.cachePosition = arg_21_0._tf.localPosition
			arg_21_0.walkWithRotateTime = 0
		end
	})

	arg_21_0.curState = arg_21_1
end

function var_0_0.ExitState(arg_30_0, arg_30_1)
	switch(arg_30_0.curState, {
		[SlideConst.COMMAND_TYPE.WALK] = function()
			arg_30_0.ladyEnv.characterController.enabled = false
		end,
		[SlideConst.COMMAND_TYPE.LADDER] = function()
			arg_30_0.ladderMoveTime = nil
			arg_30_0.ladderStartPos = nil
			arg_30_0.ladderForward = nil
		end,
		[SlideConst.COMMAND_TYPE.SLIDE] = function()
			arg_30_0.ladyEnv.characterController.enabled = false

			local var_33_0 = arg_30_0._tf.rotation.eulerAngles

			arg_30_0._tf.rotation = Quaternion.Euler(0, var_33_0.y, var_33_0.z)
			arg_30_0.slideMoveTime = nil
			arg_30_0.slideTotalDelta = nil
		end,
		[SlideConst.COMMAND_TYPE.TELEPORT] = function()
			return
		end,
		[SlideConst.COMMAND_TYPE.ANIM] = function()
			return
		end,
		[SlideConst.COMMAND_TYPE.ANIM_MOVE_ROTATE] = function()
			return
		end
	})

	arg_30_0.curState = nil
end

function var_0_0.ShowWetness(arg_37_0, arg_37_1)
	if arg_37_0.wetTimer then
		arg_37_0.wetTimer:Stop()
	end

	local var_37_0 = 0

	arg_37_0.wetTimer = Timer.New(function()
		if var_37_0 >= SlideConst.WET_FADE_IN_TIME then
			arg_37_0.wetTimer:Stop()

			arg_37_0.wetTimer = nil

			return
		end

		var_37_0 = var_37_0 + 0.016666666666666666

		local var_38_0 = var_37_0 / SlideConst.WET_FADE_IN_TIME

		if not arg_37_1 then
			var_38_0 = 1 - var_38_0
		end

		local var_38_1 = math.min(var_38_0, 1)
		local var_38_2 = math.max(var_38_1, 0)

		GraphicsInterface.Instance:SetWetness(go(arg_37_0._tf), var_38_2)
	end, 0.016666666666666666, -1)

	arg_37_0.wetTimer:Start()
end

function var_0_0.Cancel(arg_39_0)
	if arg_39_0.vfxLTId then
		LeanTween.cancel(arg_39_0.vfxLTId)

		arg_39_0.vfxLTId = nil
	end

	if arg_39_0.wetLTId then
		LeanTween.cancel(arg_39_0.wetLTId)

		arg_39_0.wetLTId = nil
	end

	if arg_39_0.wetTimer then
		arg_39_0.wetTimer:Stop()

		arg_39_0.wetTimer = nil
	end

	GraphicsInterface.Instance:SetWetness(go(arg_39_0._tf), 0)
end

function var_0_0.Dispose(arg_40_0)
	arg_40_0:Cancel()
	arg_40_0.ladyEnv:SetCollisible(true)
	arg_40_0.ladyEnv:EnableCharacterTransparency(false)
	arg_40_0.ladyEnv:BlockCanWatch(false)
end

return var_0_0
