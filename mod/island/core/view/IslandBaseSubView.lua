local var_0_0 = class("IslandBaseSubView", import("Mod.Island.Core.View.IslandBaseUnit"))

function var_0_0.Init(arg_1_0, ...)
	local var_1_0 = packEx(...)

	arg_1_0.loadingId = IslandAssetLoadDispatcher.Instance:Enqueue("UI/" .. arg_1_0:GetUIName(), "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_2_0)
		local var_2_0 = arg_1_0:SetUIParent()

		arg_1_0.uiInstID = FrameAsyncInstantiateManager.Instance:EnqueueInstantiate(arg_2_0, Vector3.zero, Quaternion.identity, var_2_0, function(arg_3_0)
			arg_1_0:DoInit(arg_3_0, var_1_0)
		end)
	end), true, true)
end

function var_0_0.DoInit(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._go = arg_4_1
	arg_4_0._tf = arg_4_1.transform

	var_0_0.super.Init(arg_4_0, arg_4_1)

	arg_4_0._tf.localPosition = Vector3.zero

	arg_4_1.transform:SetAsFirstSibling()
	arg_4_0:OnBeforeLoaded()
	arg_4_0:FirstFlush()
	arg_4_0:Flush(unpackEx(arg_4_2))
	arg_4_0:OnLoaded()
end

function var_0_0.OnDispose(arg_5_0)
	if not IsNil(arg_5_0._go) then
		Object.Destroy(arg_5_0._go)
	end

	arg_5_0._go = nil
	arg_5_0._tf = nil

	if arg_5_0.uiInstID then
		FrameAsyncInstantiateManager.Instance:Cancel(arg_5_0.uiInstID)

		arg_5_0.uiInstID = nil
	end

	if arg_5_0.loadingId then
		IslandAssetLoadDispatcher.Instance:Cancel(arg_5_0.loadingId)

		arg_5_0.loadingId = nil
	end
end

function var_0_0.ShowMsgbox(arg_6_0, arg_6_1)
	arg_6_0:GetView():ShowMsgbox(arg_6_1)
end

function var_0_0.GetPlayerUnit(arg_7_0)
	return arg_7_0:GetView().player
end

function var_0_0.GetUIName(arg_8_0)
	assert(false, "overwrite me")
end

function var_0_0.SetUIParent(arg_9_0, arg_9_1)
	assert(false, "overwrite me")
end

function var_0_0.Flush(arg_10_0, ...)
	return
end

function var_0_0.FirstFlush(arg_11_0)
	return
end

function var_0_0.OnBeforeLoaded(arg_12_0)
	return
end

function var_0_0.OnLoaded(arg_13_0)
	return
end

return var_0_0
