local var_0_0 = class("SpringFesMainPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.go1 = arg_1_0.bg:Find("1")
	arg_1_0.go2 = arg_1_0.bg:Find("2")
	arg_1_0.go3 = arg_1_0.bg:Find("3")
	arg_1_0.go4 = arg_1_0.bg:Find("4")
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.go1, function()
		arg_2_0:emit(ActivityMediator.SELECT_ACTIVITY, 470)
	end)
	onButton(arg_2_0, arg_2_0.go2, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.COLORING)
	end)
	onButton(arg_2_0, arg_2_0.go3, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.CHARGE, {
			wrap = 4
		})
	end)
	onButton(arg_2_0, arg_2_0.go4, function()
		arg_2_0:emit(ActivityMediator.SELECT_ACTIVITY, 473)
	end)
end

return var_0_0
