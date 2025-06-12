local var_0_0 = class("LadySlide")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.ladyEnv = arg_1_1
end

function var_0_0.OnUpdate(arg_2_0)
	if not arg_2_0.wayPoints or not arg_2_0.curIndex or arg_2_0.curIndex > #arg_2_0.wayPoints then
		return
	end

	local function var_2_0(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0.position - arg_3_1.position

		var_3_0.y = 0

		return var_3_0.magnitude <= 0.1
	end

	if arg_2_0.curIndex == 0 or var_2_0(arg_2_0.wayPoints[arg_2_0.curIndex], arg_2_0.ladyEnv.lady) then
		arg_2_0.curIndex = arg_2_0.curIndex + 1

		local var_2_1 = arg_2_0.wayPoints[arg_2_0.curIndex]

		arg_2_0:ExitState(arg_2_0.curState)
		arg_2_0:EnterState(var_2_1.name)
	end

	arg_2_0:UpdateState()
end

function var_0_0.UpdateState(arg_4_0)
	switch(arg_4_0.curState, {
		walk = function()
			arg_4_0.ladyEnv:MoveToTarget(arg_4_0.wayPoints[arg_4_0.curIndex].position)
		end,
		ladder = function()
			return
		end,
		slide = function()
			return
		end
	})
end

function var_0_0.EnterState(arg_8_0, arg_8_1)
	switch(arg_8_1, {
		walk = function()
			arg_8_0.ladyEnv:PlaySingleAction("swim_slide_walk_01")

			arg_8_0.ladyEnv.characterController.enabled = true
		end,
		ladder = function()
			arg_8_0.ladyEnv:PlaySingleAction("swim_slide_ladder_01")

			arg_8_0.bonePosition = arg_8_0.ladyBoneRoot.localPosition
		end,
		slide = function()
			return
		end
	})

	arg_8_0.curState = arg_8_1
end

function var_0_0.ExitState(arg_12_0, arg_12_1)
	switch(arg_12_0.curState, {
		walk = function()
			arg_12_0.ladyEnv.characterController.enabled = false
		end,
		ladder = function()
			return
		end,
		slide = function()
			return
		end
	})

	arg_12_0.curState = nil
end

return var_0_0
