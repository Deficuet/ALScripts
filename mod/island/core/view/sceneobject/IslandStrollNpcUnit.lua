local var_0_0 = class("IslandStrollNpcUnit", import(".IslandDressupNpcUnit"))

function var_0_0.SetupBt(arg_1_0)
	if not arg_1_0.behaviourTreeOwner then
		return
	end

	local var_1_0 = arg_1_0.data:GetPath()

	LuaHelper.NodeCanvasSetIntVariableValue(arg_1_0.behaviourTreeOwner, "pathId", var_1_0)
	var_0_0.super.SetupBt(arg_1_0)
end

function var_0_0.ExistActionFeedbackBubble(arg_2_0)
	return arg_2_0.data:ExistActionFeedback()
end

return var_0_0
