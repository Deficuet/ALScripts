local var_0_0 = class("WindFogCorridorSkinStoryMainPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0._tf:Find("AD")
	arg_1_0.btnGo = arg_1_0.AD:Find("go")
	arg_1_0.redPoint = arg_1_0.btnGo:Find("red")
	arg_1_0.btnShop = arg_1_0.AD:Find("shop")
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.btnGo, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.WINDFOGSKINPAGE)
	end)
	onButton(arg_2_0, arg_2_0.btnShop, function()
		arg_2_0:emit(ActivityMediator.GO_CHANGE_SHOP)
	end)
	arg_2_0:refreshRed()
end

function var_0_0.OnUpdateFlush(arg_5_0)
	arg_5_0:refreshRed()
end

function var_0_0.refreshRed(arg_6_0)
	setActive(arg_6_0.redPoint, arg_6_0.activity:readyToAchieve())
end

return var_0_0
