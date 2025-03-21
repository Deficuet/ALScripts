ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleResourceManager

var_0_0.Battle.BattleCharacterFXContainersPool = singletonClass("BattleCharacterFXContainersPool")
var_0_0.Battle.BattleCharacterFXContainersPool.__name = "BattleCharacterFXContainersPool"

local var_0_2 = var_0_0.Battle.BattleCharacterFXContainersPool

function var_0_2.Ctor(arg_1_0)
	return
end

function var_0_2.Init(arg_2_0)
	arg_2_0._pool = {}
	arg_2_0._templateContainer = GameObject("characterFXContainerPoolParent")
	arg_2_0._templateContainerTf = arg_2_0._templateContainer.transform
	arg_2_0._templateContainerTf.position = Vector3(-10000, -10000, 0)
end

function var_0_2.Pop(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_1.localEulerAngles

	arg_3_2 = arg_3_2 or {
		{
			0,
			0,
			0
		},
		{
			0,
			0,
			0
		},
		{
			0,
			0,
			0
		},
		{
			0,
			0,
			0
		}
	}

	local var_3_1

	if #arg_3_0._pool == 0 then
		var_3_1 = {}

		for iter_3_0, iter_3_1 in ipairs(var_0_0.Battle.BattleConst.FXContainerIndex) do
			local var_3_2 = GameObject()
			local var_3_3 = var_3_2.transform
			local var_3_4 = arg_3_2[iter_3_0]

			var_3_3:SetParent(arg_3_1, false)

			var_3_3.localPosition = Vector3(var_3_4[1], var_3_4[2], var_3_4[3])
			var_3_3.localEulerAngles = Vector3(var_3_0.x * -1, var_3_0.y, var_3_0.z)
			var_3_2.name = "fxContainer_" .. iter_3_1
			var_3_1[iter_3_0] = var_3_2
		end
	else
		var_3_1 = arg_3_0._pool[#arg_3_0._pool]
		arg_3_0._pool[#arg_3_0._pool] = nil

		for iter_3_2, iter_3_3 in ipairs(var_3_1) do
			local var_3_5 = arg_3_2[iter_3_2]
			local var_3_6 = iter_3_3.transform

			var_3_6:SetParent(arg_3_1, false)

			var_3_6.localPosition = Vector3(var_3_5[1], var_3_5[2], var_3_5[3])
			var_3_6.localEulerAngles = Vector3(var_3_0.x * -1, var_3_0.y, var_3_0.z)
		end
	end

	return var_3_1
end

function var_0_2.Push(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		local var_4_0 = iter_4_1.transform

		var_4_0:SetParent(arg_4_0._templateContainerTf, false)

		for iter_4_2 = var_4_0.childCount - 1, 0, -1 do
			var_0_1.GetInstance():DestroyOb(var_4_0:GetChild(iter_4_2).gameObject)
		end
	end

	arg_4_0._pool[#arg_4_0._pool + 1] = arg_4_1
end

function var_0_2.Clear(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0._pool) do
		for iter_5_2, iter_5_3 in ipairs(iter_5_1) do
			Object.Destroy(iter_5_3)
		end
	end

	arg_5_0._pool = nil

	Object.Destroy(arg_5_0._templateContainer)

	arg_5_0._templateContainer = nil
	arg_5_0._templateContainerTf = nil
end
