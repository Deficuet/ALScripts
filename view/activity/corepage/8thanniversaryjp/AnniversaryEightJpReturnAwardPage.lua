local var_0_0 = class("AnniversaryEightJpReturnAwardPage", import("view.activity.CorePage.CoreActivityPage"))

var_0_0.INVITER = 1
var_0_0.RETURNER = 2

function var_0_0.OnFirstFlush(arg_1_0)
	local var_1_0 = {
		CoreInviterPage,
		CoreReturnerPage
	}
	local var_1_1 = arg_1_0.activity

	assert(var_1_0[var_1_1.data1], var_1_1.data1)

	arg_1_0.page = var_1_0[var_1_1.data1].New(arg_1_0._tf, arg_1_0.event)

	onButton(arg_1_0, arg_1_0.page.help, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.returner_help.tip
		})
	end)
end

function var_0_0.OnUpdateFlush(arg_3_0)
	local var_3_0 = arg_3_0.activity

	assert(arg_3_0.page)
	arg_3_0.page:Update(var_3_0)
end

function var_0_0.OnDestroy(arg_4_0)
	assert(arg_4_0.page)
	arg_4_0.page:Dispose()
end

function var_0_0.UseSecondPage(arg_5_0, arg_5_1)
	return arg_5_1.data1 > 1
end

return var_0_0
