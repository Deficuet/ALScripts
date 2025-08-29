local var_0_0 = class("IslandBaseSubView", import("Mod.Island.Core.View.IslandBaseUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.__funcList = {}
	arg_1_0.isloading = false
end

function var_0_0.Init(arg_2_0, ...)
	arg_2_0.isloading = true

	local var_2_0 = packEx(...)

	ResourceMgr.Inst:getAssetAsync("UI/" .. arg_2_0:GetUIName(), "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_3_0)
		arg_2_0.isloading = false

		local var_3_0 = Object.Instantiate(arg_3_0)

		arg_2_0._go = var_3_0
		arg_2_0._tf = var_3_0.transform

		var_0_0.super.Init(arg_2_0, var_3_0)
		arg_2_0:SetUIParent(var_3_0)
		var_3_0.transform:SetAsFirstSibling()
		arg_2_0:FirstFlush()
		arg_2_0:Flush(unpackEx(var_2_0))
		arg_2_0:ExecuteFuncList()
	end), true, true)
end

function var_0_0.ExecuteFuncList(arg_4_0)
	if #arg_4_0.__funcList <= 0 then
		return
	end

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.__funcList) do
		arg_4_0[iter_4_1.name](arg_4_0, unpackEx(iter_4_1.args))
	end

	arg_4_0.__funcList = {}
end

function var_0_0.findTF(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0._tf, "transform should exist")

	return findTF(arg_5_2 or arg_5_0._tf, arg_5_1)
end

function var_0_0.SetUIParent(arg_6_0, arg_6_1)
	setParent(arg_6_1, arg_6_0:GetView().pageContianer)
end

function var_0_0.OnDispose(arg_7_0)
	if not IsNil(arg_7_0._go) then
		Object.Destroy(arg_7_0._go)
	end

	arg_7_0._go = nil
	arg_7_0._tf = nil
end

function var_0_0.Show(arg_8_0, ...)
	if arg_8_0:IsEmpty() then
		arg_8_0:Init(...)
	else
		setActive(arg_8_0._go, true)
		arg_8_0:Flush(...)
	end
end

function var_0_0.ShowMsgbox(arg_9_0, arg_9_1)
	arg_9_0:GetView():ShowMsgbox(arg_9_1)
end

function var_0_0.Hide(arg_10_0)
	setActive(arg_10_0._go, false)
end

function var_0_0.Disable(arg_11_0)
	setActive(arg_11_0._go, false)
end

function var_0_0.Enable(arg_12_0)
	setActive(arg_12_0._go, true)
end

function var_0_0.Execute(arg_13_0, arg_13_1, ...)
	if arg_13_0:IsLoaded() or not arg_13_0:IsLoaded() and #arg_13_0.__funcList == 0 and arg_13_1 == "Show" then
		arg_13_0[arg_13_1](arg_13_0, ...)
	elseif arg_13_0.isloading then
		table.insert(arg_13_0.__funcList, {
			name = arg_13_1,
			args = packEx(...)
		})
	end
end

function var_0_0.GetUIName(arg_14_0)
	assert(false, "overwrite me")
end

function var_0_0.Flush(arg_15_0, ...)
	return
end

function var_0_0.FirstFlush(arg_16_0)
	return
end

return var_0_0
