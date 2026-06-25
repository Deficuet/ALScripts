local var_0_0 = class("WSMapTransform", import(".WSMapObject"))

var_0_0.Fields = {
	transform = "userdata",
	isMoving = "boolean",
	modelOrder = "number"
}

function var_0_0.Dispose(arg_1_0)
	arg_1_0:ClearModelOrder()
	arg_1_0:Clear()
end

function var_0_0.SetModelOrder(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.transform)

	if not GetComponent(arg_2_0.transform, typeof(Canvas)) then
		SetCanvasOverrideSorting(arg_2_0.transform, true)
	end

	local var_2_0 = 0

	if arg_2_0.modelOrder then
		var_2_0 = var_2_0 - arg_2_0.modelOrder
	end

	arg_2_0.modelOrder = arg_2_1 + defaultValue(arg_2_2, 0) * 10

	local var_2_1 = var_2_0 + arg_2_0.modelOrder

	if var_2_1 ~= 0 then
		WorldConst.ArrayEffectOrder(arg_2_0.transform, var_2_1)
	end

	arg_2_0:ModelOrderChanged()
end

function var_0_0.ModelOrderChanged(arg_3_0)
	return
end

function var_0_0.ClearModelOrder(arg_4_0)
	assert(arg_4_0.transform)
	arg_4_0:UnloadModel()

	if arg_4_0.modelOrder then
		WorldConst.ArrayEffectOrder(arg_4_0.transform, -arg_4_0.modelOrder)

		arg_4_0.modelOrder = nil
	end
end

function var_0_0.LoadModel(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
	var_0_0.super.LoadModel(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, function()
		if arg_5_0.modelOrder then
			WorldConst.ArrayEffectOrder(arg_5_0.model, arg_5_0.modelOrder)
		end

		return existCall(arg_5_5)
	end)
end

function var_0_0.UnloadModel(arg_7_0)
	if arg_7_0.modelOrder and arg_7_0.model then
		WorldConst.ArrayEffectOrder(arg_7_0.model, -arg_7_0.modelOrder)
	end

	var_0_0.super.UnloadModel(arg_7_0)
end

return var_0_0
