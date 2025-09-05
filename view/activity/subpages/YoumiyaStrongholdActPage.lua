local var_0_0 = class("YoumiyaStrongholdActPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	local var_1_0 = arg_1_0._tf:Find("panel/go_btn")

	onButton(arg_1_0, var_1_0, function()
		arg_1_0:emit(ActivityMediator.OPEN_LAYER, Context.New({
			mediator = YoumiyaStrongholdMediator,
			viewComponent = YoumiyaStrongholdLayer
		}))
	end, SFX_PANEL)
	setActive(arg_1_0._tf:Find("panel/go_btn/tip"), YoumiyaStrongholdLayer.ShouldShowTip())

	for iter_1_0 = 1, 3 do
		setText(arg_1_0._tf:Find("bg/" .. tostring(iter_1_0) .. "/name"), i18n("yumia_base_name_" .. iter_1_0))
	end

	setText(arg_1_0._tf:Find("panel/go_btn/text"), i18n("yumia_stronghold_1"))
end

return var_0_0
