local var_0_0 = class("ReversePacmanItemPopItem", import("view.base.BasePanel"))

var_0_0.SKIP_TYPE_SCENE = 2
var_0_0.SKIP_TYPE_ACTIVITY = 3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	setText(arg_2_0.uiGoText, i18n("task_go"))
	onButton(arg_2_0, arg_2_0.uiGoBtn, function()
		local var_3_0 = arg_2_0.data[2]

		if arg_2_0.data[1] == var_0_0.SKIP_TYPE_SCENE then
			pg.m02:sendNotification(GAME.GO_SCENE, var_3_0[1], var_3_0[2] or {})
		elseif arg_2_0.data[1] == var_0_0.SKIP_TYPE_ACTIVITY then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
				id = var_3_0
			})
		end
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_4_0, arg_4_1)
	arg_4_0.data = arg_4_1

	setScrollText(arg_4_0.uiTitleText, arg_4_1[3])
	arg_4_0:Show(true)
end

function var_0_0.Show(arg_5_0, arg_5_1)
	setActive(arg_5_0._go, arg_5_1)
end

function var_0_0.willExit(arg_6_0)
	arg_6_0:detach()
	Object.Destroy(arg_6_0._go)

	arg_6_0._tf = nil
	arg_6_0._go = nil
end

return var_0_0
