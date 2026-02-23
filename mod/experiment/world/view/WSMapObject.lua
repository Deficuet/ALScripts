local var_0_0 = class("WSMapObject", import("...BaseEntity"))

var_0_0.Fields = {
	modelType = "number",
	modelAction = "string",
	modelResPath = "string",
	modelParent = "userdata",
	modelAngles = "table",
	modelActionTimer = "table",
	modelScale = "table",
	model = "userdata",
	modelComps = "table",
	modelResAsync = "boolean",
	modelResName = "string"
}

function var_0_0.GetModelAngles(arg_1_0)
	return arg_1_0.modelAngles and arg_1_0.modelAngles:Clone() or Vector3.zero
end

function var_0_0.UpdateModelAngles(arg_2_0, arg_2_1)
	if arg_2_0.modelAngles ~= arg_2_1 then
		arg_2_0.modelAngles = arg_2_1

		arg_2_0:FlushModelAngles()
	end
end

function var_0_0.FlushModelAngles(arg_3_0)
	if arg_3_0.model and arg_3_0.modelAngles then
		arg_3_0.model.localEulerAngles = arg_3_0.modelAngles
	end
end

function var_0_0.GetModelScale(arg_4_0)
	return arg_4_0.modelScale and arg_4_0.modelScale:Clone() or Vector3.one
end

function var_0_0.UpdateModelScale(arg_5_0, arg_5_1)
	if arg_5_0.modelScale ~= arg_5_1 then
		arg_5_0.modelScale = arg_5_1

		arg_5_0:FlushModelScale()
	end
end

function var_0_0.GetModelAction(arg_6_0)
	return arg_6_0.modelAction
end

function var_0_0.FlushModelScale(arg_7_0)
	if arg_7_0.model and arg_7_0.modelScale then
		arg_7_0.model.localScale = arg_7_0.modelScale
	end
end

function var_0_0.UpdateModelAction(arg_8_0, arg_8_1)
	if arg_8_0.modelAction ~= arg_8_1 then
		arg_8_0.modelAction = arg_8_1

		arg_8_0:FlushModelAction()
	end
end

function var_0_0.FlushModelAction(arg_9_0)
	if arg_9_0.model and arg_9_0.modelAction then
		if arg_9_0.modelType == WorldConst.ModelSpine then
			local var_9_0 = arg_9_0.modelComps and arg_9_0.modelComps[1]

			if var_9_0 then
				var_9_0:SetAction(arg_9_0.modelAction, 0)
			end
		elseif arg_9_0.modelType == WorldConst.ModelPrefab then
			local var_9_1 = arg_9_0.modelComps and arg_9_0.modelComps[1]

			if var_9_1 then
				local var_9_2 = Animator.StringToHash(arg_9_0.modelAction)

				if var_9_1:HasState(0, var_9_2) then
					var_9_1:Play(var_9_2)
				end
			end
		end
	end
end

function var_0_0.PlayModelAction(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	assert(arg_10_1)

	local var_10_0 = {}

	if arg_10_0.model then
		if arg_10_0.modelType == WorldConst.ModelSpine then
			local var_10_1 = arg_10_0.modelComps[1]

			if var_10_1 and isa(var_10_1, SpineAnimChar) and var_10_1:GetModel().transform.gameObject.activeInHierarchy then
				table.insert(var_10_0, function(arg_11_0)
					var_10_1:SetAction(arg_10_1, 0)

					if arg_10_2 then
						arg_10_0:NewActionTimer(arg_10_2, arg_11_0)
					else
						var_10_1:SetActionCallBack(function(arg_12_0)
							if arg_12_0 == "finish" then
								var_10_1:SetActionCallBack(nil)
								arg_11_0()
							end
						end)
					end
				end)
			elseif var_10_1 and isa(var_10_1, SpineRole) and var_10_1:GetRootModel().transform.gameObject.activeInHierarchy then
				table.insert(var_10_0, function(arg_13_0)
					var_10_1:SetAction(arg_10_1, 0)

					if arg_10_2 then
						arg_10_0:NewActionTimer(arg_10_2, arg_13_0)
					else
						var_10_1:SetActionCallBack(function(arg_14_0)
							if arg_14_0 == "finish" then
								var_10_1:SetActionCallBack(nil)
								arg_13_0()
							end
						end)
					end
				end)
			elseif var_10_1 and var_10_1.transform.gameObject.activeInHierarchy then
				table.insert(var_10_0, function(arg_15_0)
					var_10_1:SetAction(arg_10_1, 0)

					if arg_10_2 then
						arg_10_0:NewActionTimer(arg_10_2, arg_15_0)
					else
						var_10_1:SetActionCallBack(function(arg_16_0)
							if arg_16_0 == "finish" then
								var_10_1:SetActionCallBack(nil)
								arg_15_0()
							end
						end)
					end
				end)
			end
		elseif arg_10_0.modelType == WorldConst.ModelPrefab then
			local var_10_2 = arg_10_0.modelComps and arg_10_0.modelComps[1]

			if var_10_2 and var_10_2.transform.gameObject.activeInHierarchy then
				local var_10_3 = Animator.StringToHash(arg_10_1)

				if var_10_2:HasState(0, var_10_3) then
					table.insert(var_10_0, function(arg_17_0)
						var_10_2:Play(var_10_3)

						if arg_10_2 then
							arg_10_0:NewActionTimer(arg_10_2, arg_17_0)
						else
							local var_17_0 = arg_10_0.modelComps[2]

							var_17_0:SetEndEvent(function()
								var_17_0:SetEndEvent(nil)
								arg_17_0()
							end)
						end
					end)
				end
			end
		end
	end

	seriesAsync(var_10_0, arg_10_3)
end

function var_0_0.LoadModel(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	if arg_19_0.modelType ~= arg_19_1 or arg_19_0.modelResPath ~= arg_19_2 or arg_19_0.modelResName ~= arg_19_3 then
		arg_19_0:UnloadModel()

		arg_19_0.model = createNewGameObject("model")
		arg_19_0.modelType = arg_19_1
		arg_19_0.modelResPath = arg_19_2
		arg_19_0.modelResName = arg_19_3
		arg_19_0.modelResAsync = defaultValue(arg_19_4, true)

		local var_19_0 = {}

		if arg_19_0.modelType == WorldConst.ModelSpine then
			arg_19_0.modelAction = arg_19_0.modelAction or WorldConst.ActionIdle

			table.insert(var_19_0, function(arg_20_0)
				arg_19_0:LoadSpine(arg_20_0)
			end)
		elseif arg_19_0.modelType == WorldConst.ModelPrefab then
			arg_19_0.modelAction = arg_19_0.modelAction or "idle"

			table.insert(var_19_0, function(arg_21_0)
				arg_19_0:LoadPrefab(arg_21_0)
			end)
		else
			assert("invalid model type: " .. arg_19_1)
		end

		seriesAsync(var_19_0, function()
			if arg_19_0.modelScale == nil then
				arg_19_0.modelScale = arg_19_0.model.localScale
			else
				arg_19_0:FlushModelScale()
			end

			if arg_19_0.modelAngles == nil then
				arg_19_0.modelAngles = arg_19_0.model.localEulerAngles
			else
				arg_19_0:FlushModelAngles()
			end

			arg_19_0:FlushModelAction()

			if arg_19_5 then
				arg_19_5()
			end
		end)
	end
end

function var_0_0.UnloadModel(arg_23_0)
	arg_23_0:DisposeActionTimer()

	if arg_23_0.model then
		if arg_23_0.model.childCount > 0 then
			if arg_23_0.modelType == WorldConst.ModelSpine then
				arg_23_0:UnloadSpine()
			elseif arg_23_0.modelType == WorldConst.ModelPrefab then
				arg_23_0:UnloadPrefab()
			end
		end

		Destroy(arg_23_0.model)
	end

	arg_23_0.model = nil
	arg_23_0.modelComps = nil
	arg_23_0.modelType = nil
	arg_23_0.modelResPath = nil
	arg_23_0.modelResName = nil
	arg_23_0.modelResAsync = nil
end

function var_0_0.LoadSpine(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.modelResPath
	local var_24_1 = arg_24_0.modelResAsync
	local var_24_2 = SpineAnimChar.New()

	var_24_2:SetPaint(var_24_0)
	var_24_2:Load(var_24_1, function(arg_25_0)
		if arg_24_0.modelType ~= WorldConst.ModelSpine or arg_24_0.modelResPath ~= var_24_0 then
			arg_25_0:Dispose()

			var_24_2 = nil

			return
		end

		arg_25_0:GetSkeletonGraphic().raycastTarget = false

		arg_25_0:SetAnchoredPosition3D(Vector3.zero)
		arg_25_0:SetLocalScale(Vector3.one)
		arg_25_0:SetLayer(Layer.UI)
		arg_25_0:SetParent(arg_24_0.model)

		arg_24_0.modelComps = {
			arg_25_0
		}

		arg_24_1()
	end)
end

function var_0_0.LoadPrefab(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.modelResPath
	local var_26_1 = arg_26_0.modelResName
	local var_26_2 = arg_26_0.modelResAsync

	PoolMgr.GetInstance():GetPrefab(var_26_0, var_26_1, var_26_2, function(arg_27_0)
		if arg_26_0.modelType ~= WorldConst.ModelPrefab or arg_26_0.modelResPath ~= var_26_0 or arg_26_0.modelResName ~= var_26_1 then
			PoolMgr.GetInstance():ReturnPrefab(var_26_0, var_26_1, arg_27_0, true)

			return
		end

		local var_27_0 = arg_27_0:GetComponentsInChildren(typeof(Image)):ToTable()

		for iter_27_0, iter_27_1 in ipairs(var_27_0) do
			iter_27_1.raycastTarget = false
		end

		arg_27_0.transform:SetParent(arg_26_0.model, false)

		arg_26_0.modelComps = {}

		local var_27_1 = arg_27_0:GetComponentInChildren(typeof(Animator))

		if var_27_1 then
			local var_27_2 = var_27_1:GetComponent("DftAniEvent")

			arg_26_0.modelComps = {
				var_27_1,
				var_27_2
			}
		end

		arg_26_1()
	end)
end

function var_0_0.UnloadSpine(arg_28_0)
	local var_28_0 = arg_28_0.modelComps[1]

	if var_28_0 and isa(var_28_0, SpineAnimChar) then
		var_28_0:SetActionCallBack(nil)
		var_28_0:Dispose()
	end
end

function var_0_0.UnloadPrefab(arg_29_0)
	local var_29_0 = arg_29_0.modelComps[2]

	if var_29_0 then
		var_29_0:SetEndEvent(nil)
	end

	PoolMgr.GetInstance():ReturnPrefab(arg_29_0.modelResPath, arg_29_0.modelResName, arg_29_0.model:GetChild(0).gameObject, true)
end

function var_0_0.NewActionTimer(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0:DisposeActionTimer()

	arg_30_0.modelActionTimer = Timer.New(arg_30_2, arg_30_1, 1)

	arg_30_0.modelActionTimer:Start()
end

function var_0_0.DisposeActionTimer(arg_31_0)
	if arg_31_0.modelActionTimer then
		arg_31_0.modelActionTimer:Stop()

		arg_31_0.modelActionTimer = nil
	end
end

return var_0_0
