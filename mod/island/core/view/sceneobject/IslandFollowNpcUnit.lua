local var_0_0 = class("IslandFollowNpcUnit", import(".IslandDressupNpcUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.randomizer = arg_1_2.randomizer
end

function var_0_0.OnInit(arg_2_0, arg_2_1, arg_2_2)
	var_0_0.super.OnInit(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:WarpAgent()
end

function var_0_0.ResetPosition(arg_3_0)
	arg_3_0._go.transform.eulerAngles = arg_3_0.rotation

	local var_3_0 = arg_3_0:GetNavPosition()

	arg_3_0._go.transform.position = var_3_0
end

function var_0_0.GetNavPosition(arg_4_0)
	for iter_4_0 = 1, 100 do
		local var_4_0 = IslandCalcUtil.GetRandomPointInSector(arg_4_0.position, -arg_4_0._go.transform.forward, 3, 270)
		local var_4_1 = IslandHelper.IsPointInWalkableArea(var_4_0, 0.2)

		if var_4_1 then
			return var_4_0
		end

		local var_4_2 = IslandHelper.SampleWalkablPosition(var_4_0, 2)

		if var_4_1 and var_4_2 ~= var_4_0 then
			return var_4_2
		end
	end

	return IslandHelper.SampleWalkablPosition(arg_4_0.position, arg_4_0.position.y * 1.1)
end

function var_0_0.OnAttach(arg_5_0, arg_5_1)
	var_0_0.super.OnAttach(arg_5_0, arg_5_1)
	arg_5_0:UpdateBtRandomizer()
end

function var_0_0.UpdateBtRandomizer(arg_6_0)
	arg_6_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("randomizer", arg_6_0.randomizer)
end

function var_0_0.SetBtRandomizer(arg_7_0)
	arg_7_0:StopBt()

	arg_7_0.randomizer = true

	arg_7_0:UpdateBtRandomizer()
	arg_7_0:RestartBt()
end

return var_0_0
