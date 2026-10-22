local var_0_0 = class("WindFogCorridorPtPage", import("view.activity.CorePage.CorePageNewPtTemplatePage"))

function var_0_0.UpdateAward(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1 + 1
	local var_1_1 = arg_1_0.awardList[var_1_0].drop

	updateDrop(arg_1_2:Find("mask/IconTpl"), var_1_1)

	GetComponent(arg_1_2:Find("mask/IconTpl/icon_bg/frame"), typeof(Image)).enabled = false

	setText(arg_1_2:Find("pt"), arg_1_0.awardList[var_1_0].target)

	local var_1_2 = var_1_0 <= arg_1_0.ptData:GetLevel()
	local var_1_3 = not var_1_2 and var_1_0 <= arg_1_0.ptData:GetMaxAvailableTargetIndex()
	local var_1_4 = not var_1_2 and not var_1_3

	setActive(arg_1_2:Find("got_mask"), var_1_2)
	setActive(arg_1_2:Find("get"), var_1_3)
	setActive(arg_1_2:Find("lock"), not var_1_3)
	setActive(arg_1_2:Find("lock"), var_1_4)
	onButton(arg_1_0, arg_1_2, function()
		arg_1_0:emit(BaseUI.ON_DROP, var_1_1)
	end, SFX_PANEL)
end

return var_0_0
