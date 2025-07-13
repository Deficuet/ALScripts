local var_0_0 = class("SecondAnniversaryPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.btnShop = arg_1_0:findTF("BtnShop")
	arg_1_0.btnContainer = arg_1_0:findTF("BtnList/Viewport/Content")
	arg_1_0.btn1 = arg_1_0:findTF("1", arg_1_0.btnContainer)
	arg_1_0.btn2 = arg_1_0:findTF("2", arg_1_0.btnContainer)
	arg_1_0.btn3 = arg_1_0:findTF("3", arg_1_0.btnContainer)
	arg_1_0.btn4 = arg_1_0:findTF("4", arg_1_0.btnContainer)
	arg_1_0.btn5 = arg_1_0:findTF("5", arg_1_0.btnContainer)
	arg_1_0.btn6 = arg_1_0:findTF("6", arg_1_0.btnContainer)
	arg_1_0.btn7 = arg_1_0:findTF("7", arg_1_0.btnContainer)
	arg_1_0.btnList1 = {
		arg_1_0.btn1,
		arg_1_0.btn2,
		arg_1_0.btn3,
		arg_1_0.btn4,
		arg_1_0.btn5,
		arg_1_0.btn6,
		arg_1_0.btn7
	}
	arg_1_0.btn11 = arg_1_0:findTF("11", arg_1_0.btnContainer)
	arg_1_0.btn12 = arg_1_0:findTF("12", arg_1_0.btnContainer)
	arg_1_0.btn13 = arg_1_0:findTF("13", arg_1_0.btnContainer)
	arg_1_0.btn14 = arg_1_0:findTF("14", arg_1_0.btnContainer)
	arg_1_0.btn15 = arg_1_0:findTF("15", arg_1_0.btnContainer)
	arg_1_0.btn16 = arg_1_0:findTF("16", arg_1_0.btnContainer)
	arg_1_0.btn17 = arg_1_0:findTF("17", arg_1_0.btnContainer)
	arg_1_0.btnList2 = {
		arg_1_0.btn11,
		arg_1_0.btn12,
		arg_1_0.btn13,
		arg_1_0.btn14,
		arg_1_0.btn15,
		arg_1_0.btn16,
		arg_1_0.btn17
	}
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.btn1, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
	end, SFX_PANEL)
	onButton(arg_2_0, list[2], function()
		arg_2_0:emit(ActivityMediator.SELECT_ACTIVITY, ActivityConst.ACTIVITY_TYPE_RETURN_AWARD_ID2)
	end, SFX_PANEL)
	onButton(arg_2_0, list[3], function()
		arg_2_0:emit(ActivityMediator.SELECT_ACTIVITY, ActivityConst.YIDALI_MAIN_ID)
	end, SFX_PANEL)
	onButton(arg_2_0, list[4], function()
		arg_2_0:emit(ActivityMediator.SELECT_ACTIVITY, ActivityConst.ANNIVERSARY_LOGIN_ID)
	end, SFX_PANEL)
	onButton(arg_2_0, list[5], function()
		arg_2_0:emit(ActivityMediator.SELECT_ACTIVITY, ActivityConst.CARDPAIR_ZQ)
	end, SFX_PANEL)
	onButton(arg_2_0, list[6], function()
		arg_2_0:emit(ActivityMediator.SELECT_ACTIVITY, ActivityConst.DACHAOLIFU_SKIN)
	end, SFX_PANEL)
end

return var_0_0
