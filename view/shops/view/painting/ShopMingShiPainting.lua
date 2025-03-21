local var_0_0 = class("ShopMingShiPainting")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._painting = arg_1_1
	arg_1_0.live2dContainer = findTF(arg_1_0._painting, "live2d")

	setActive(arg_1_0.live2dContainer, true)
end

function var_0_0.Load(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = Live2D.GenerateData({
		ship = Ship.New({
			configId = 312011
		}),
		scale = Vector3(75, 75, 75),
		position = Vector3(0, 0, 0),
		parent = arg_2_0.live2dContainer
	})

	Live2D.New(var_2_0, function(arg_3_0)
		arg_2_0.live2dChar = arg_3_0

		if arg_2_0.cacheAnimationName then
			arg_2_0:Action(arg_2_0.cacheAnimationName)

			arg_2_0.cacheAnimationName = nil
		end

		arg_2_3()
	end)
end

function var_0_0.Action(arg_4_0, arg_4_1)
	if arg_4_0.live2dChar then
		arg_4_0.live2dChar:TriggerAction(arg_4_1, nil, true)
	else
		arg_4_0.cacheAnimationName = arg_4_1
	end
end

function var_0_0.UnLoad(arg_5_0)
	setActive(arg_5_0.live2dContainer, false)

	if arg_5_0.live2dChar then
		arg_5_0.live2dChar:Dispose()

		arg_5_0.live2dChar = nil
	end
end

return var_0_0
