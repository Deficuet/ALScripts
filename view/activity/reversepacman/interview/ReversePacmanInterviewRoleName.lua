local var_0_0 = class("ReversePacmanInterviewRoleName", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	return
end

function var_0_0.didEnter(arg_3_0)
	return
end

function var_0_0.RefreshUI(arg_4_0, arg_4_1)
	local var_4_0 = pg.activity_chasing_character[arg_4_1]
	local var_4_1
	local var_4_2 = var_4_0.ai_type == ReversePacmanHomeConst.ROLE_TYPE.CHASER and "hire_chaser" or var_4_0.ai_type == ReversePacmanHomeConst.ROLE_TYPE.AMBUSHER and "hire_ambusher" or "hire_planner"

	GetImageSpriteFromAtlasAsync("ui/reversepacmanui_atlas", var_4_2, arg_4_0.uiTypeImage)
	setImageColor(arg_4_0.uiQuotesImage, Color.NewHex(var_4_0.color))

	local var_4_3 = ReversePacmanTools.IsUnlockRole(arg_4_1)

	setActive(arg_4_0.uiNameMaskGo, not var_4_3)
	setActive(arg_4_0.uiNameGo, var_4_3)

	local var_4_4 = var_4_0.name

	setScrollText(arg_4_0.uiScrollNameText, HXSet.hxLan(var_4_4))
end

function var_0_0.willExit(arg_5_0)
	arg_5_0:detach()
end

return var_0_0
