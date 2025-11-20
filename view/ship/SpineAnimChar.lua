local var_0_0 = class("SpineAnimChar")
local var_0_1 = "normal"

var_0_0.state_init = 1
var_0_0.state_loading = 2
var_0_0.state_complete = 3
var_0_0.state_dispose = 4

function var_0_0.Ctor(arg_1_0, arg_1_1)
	if arg_1_1 then
		arg_1_0.config = pg.ship_skin_template[arg_1_1]
		arg_1_0.prefab = arg_1_0.config.prefab
	end

	arg_1_0.state = var_0_0.state_init
	arg_1_0.normalAction = var_0_1
end

function var_0_0.GetCharModel(arg_2_0)
	return arg_2_0._model
end

function var_0_0.SetName(arg_3_0, arg_3_1)
	if arg_3_0:isComplete() then
		arg_3_0._model.name = arg_3_1
	end
end

function var_0_0.SetSiblingIndex(arg_4_0, arg_4_1)
	if arg_4_0:isComplete() then
		arg_4_0._model.transform:SetSiblingIndex(arg_4_1)
	end
end

function var_0_0.SetPaint(arg_5_0, arg_5_1)
	arg_5_0.prefab = arg_5_1
end

function var_0_0.Load(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.state == var_0_0.state_init then
		arg_6_0.state = var_0_0.state_loading

		PoolMgr.GetInstance():GetSpineChar(arg_6_0.prefab, arg_6_0.sync, function(arg_7_0)
			if arg_7_0 then
				if arg_6_0:isDispose() then
					PoolMgr.GetInstance():ReturnSpineChar(arg_6_0.prefab, arg_7_0)
				else
					arg_6_0:start(arg_7_0)

					if arg_6_2 then
						arg_6_2(arg_6_0)
					end
				end
			else
				arg_6_0.state = var_0_0.state_init
			end
		end)
	end
end

function var_0_0.SetParent(arg_8_0, arg_8_1, arg_8_2)
	if not arg_8_0:isComplete() then
		arg_8_0.loadedParent = arg_8_1

		return
	end

	SetParent(arg_8_0._model, arg_8_1, arg_8_2 and true or false)
end

function var_0_0.SetNormalAction(arg_9_0, arg_9_1)
	arg_9_0.normalAction = arg_9_1
end

function var_0_0.SetAction(arg_10_0, arg_10_1, arg_10_2)
	arg_10_2 = arg_10_2 or 0
	arg_10_0.actionName = arg_10_1

	local var_10_0, var_10_1 = arg_10_0:getDirectActonName(arg_10_1)

	if not arg_10_0.modelScale then
		arg_10_0.modelScale = tf(arg_10_0._model).localScale
	end

	local var_10_2

	if var_10_1 then
		local var_10_3 = math.abs(arg_10_0.modelScale.x)

		tf(arg_10_0._model).localScale = Vector3(var_10_3, arg_10_0.modelScale.y, arg_10_0.modelScale.z)
	else
		local var_10_4 = math.sign(arg_10_0.modelScale.x)

		tf(arg_10_0._model).localScale = arg_10_0.modelScale
	end

	arg_10_0._animUI:SetAction(var_10_0, arg_10_2)
end

function var_0_0.SetActionOnce(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	arg_11_0:SetActionCallback(nil)
	arg_11_0:SetActionCallback(function(arg_12_0)
		if arg_12_0 == "action" then
			if arg_11_3 then
				arg_11_3()
			end
		elseif arg_12_0 == "finish" and arg_11_4 then
			arg_11_4()
		end
	end)
	arg_11_0:SetAction(arg_11_1, arg_11_2)
end

function var_0_0.SetActionCallBack(arg_13_0, arg_13_1)
	arg_13_0._animUI:SetActionCallBack(arg_13_1)
end

function var_0_0.GetLocalScale(arg_14_0)
	if arg_14_0:isComplete() then
		return tf(arg_14_0._model).localScale
	end
end

function var_0_0.SetLocalScale(arg_15_0, arg_15_1)
	if arg_15_0:isComplete() then
		arg_15_0.direct = math.sign(arg_15_1.x)
		tf(arg_15_0._model).localScale = arg_15_1
		arg_15_0.modelScale = arg_15_1

		arg_15_0:updateCharDirect()
	end
end

function var_0_0.SetLocalPosition(arg_16_0, arg_16_1)
	if arg_16_0:isComplete() then
		tf(arg_16_0._model).localPosition = arg_16_1
	end
end

function var_0_0.SetAnchoredPosition(arg_17_0, arg_17_1)
	if arg_17_0:isComplete() then
		tf(arg_17_0._model).anchoredPosition = arg_17_1
	end
end

function var_0_0.GetAnchoredPosition(arg_18_0)
	if arg_18_0:isComplete() then
		return tf(arg_18_0._model).anchoredPosition
	end
end

function var_0_0.SetLayer(arg_19_0, arg_19_1)
	if arg_19_0:isComplete() then
		pg.ViewUtils.SetLayer(tf(arg_19_0._model), arg_19_1)
	end
end

function var_0_0.SetAnchoredPosition3D(arg_20_0, arg_20_1)
	if arg_20_0:isComplete() then
		tf(arg_20_0._model).anchoredPosition3D = arg_20_1
	end
end

function var_0_0.GetPauseStatue(arg_21_0)
	if arg_21_0._animUI then
		return arg_21_0._animUI.Pause
	end

	return nil
end

function var_0_0.GetSkeletonGraphic(arg_22_0)
	return arg_22_0._skeletonGraphic
end

function var_0_0.GetAnimationState(arg_23_0)
	if arg_23_0._animUI then
		return arg_23_0._animUI:GetAnimationState()
	end

	return nil
end

function var_0_0.GetModel(arg_24_0)
	return arg_24_0._model
end

function var_0_0.Resume(arg_25_0)
	if arg_25_0._animUI then
		return arg_25_0._animUI:Resume()
	end
end

function var_0_0.Pause(arg_26_0)
	if arg_26_0._animUI then
		return arg_26_0._animUI:Pause()
	end
end

function var_0_0.Dispose(arg_27_0)
	if arg_27_0.state == var_0_0.state_complete then
		arg_27_0:SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(arg_27_0.prefab, arg_27_0._model)
	end

	arg_27_0.state = var_0_0.state_dispose
	arg_27_0.parent = nil
end

function var_0_0.start(arg_28_0, arg_28_1)
	arg_28_0.state = var_0_0.state_complete
	arg_28_0._model = arg_28_1
	arg_28_0._animUI = arg_28_1:GetComponent(typeof(SpineAnimUI))
	arg_28_0._skeletonGraphic = arg_28_1:GetComponent("SkeletonGraphic")

	if arg_28_0.loadedParent then
		arg_28_0:setParent(arg_28_1, arg_28_0.parent)

		arg_28_0.loadedParent = nil
	end

	if arg_28_0.loadedScale then
		arg_28_0:setScale(arg_28_0.loadedScale)

		arg_28_0.loadedScale = nil
	end

	if arg_28_0.loadedPosition then
		arg_28_0:setPosition(arg_28_0.loadedPosition)

		arg_28_0.loadedPosition = nil
	end
end

function var_0_0.updateCharDirect(arg_29_0)
	if arg_29_0.normalAction == arg_29_0.actionName then
		arg_29_0:SetAction(arg_29_0.actionName, 0, -1)
	end
end

function var_0_0.getDirectActonName(arg_30_0, arg_30_1)
	if not arg_30_0.direct then
		arg_30_0.direct = math.sign(tf(arg_30_0._model).localScale.x)
	end

	local var_30_0 = arg_30_0.direct == 1 and "_R" or "_L"
	local var_30_1 = arg_30_1 .. var_30_0

	if arg_30_0._skeletonGraphic.SkeletonData:FindAnimation(var_30_1) then
		return var_30_1, true
	end

	return arg_30_1, false
end

function var_0_0.isComplete(arg_31_0)
	return arg_31_0.state == var_0_0.state_complete
end

function var_0_0.isDispose(arg_32_0)
	return arg_32_0.state == var_0_0.state_dispose
end

return var_0_0
