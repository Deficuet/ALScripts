local var_0_0 = class("InstagramOfficialAccountsItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.uiTip = arg_2_0._tf:Find("tip")
	arg_2_0.uiNameText = arg_2_0._tf:Find("name")
end

function var_0_0.SetData(arg_3_0, arg_3_1)
	arg_3_0.id = arg_3_1

	arg_3_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_4_0)
	local var_4_0 = arg_4_0.id
	local var_4_1 = getProxy(InstagramProxy):GetOfficialAccounts()[var_4_0]

	setText(arg_4_0.uiNameText, shortenString(var_4_1:getConfig("title"), 26))
	arg_4_0:RefreshTip()
end

function var_0_0.RefreshTip(arg_5_0)
	local var_5_0 = arg_5_0.id
	local var_5_1 = getProxy(InstagramProxy):GetOfficialAccounts()[var_5_0]

	if var_5_1 then
		setActive(arg_5_0.uiTip, var_5_1:ShouldShowTip())
	end
end

function var_0_0.willExit(arg_6_0)
	arg_6_0:detach()
end

return var_0_0
