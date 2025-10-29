local var_0_0 = class("RefluxLetterView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "RefluxLetterUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:updateUI()
end

function var_0_0.OnDestroy(arg_3_0)
	return
end

function var_0_0.OnBackPress(arg_4_0)
	arg_4_0:Hide()

	if arg_4_0.closeCB then
		arg_4_0.closeCB()
	end
end

function var_0_0.initData(arg_5_0)
	arg_5_0.refluxProxy = getProxy(RefluxProxy)
end

function var_0_0.initUI(arg_6_0)
	local var_6_0 = arg_6_0._tf:Find("billboard")

	arg_6_0.billboardTF = var_6_0
	arg_6_0.yearText = var_6_0:Find("year")
	arg_6_0.monthText = var_6_0:Find("month")
	arg_6_0.dateText = var_6_0:Find("date")
	arg_6_0.daysText = var_6_0:Find("days")
	arg_6_0.countText = var_6_0:Find("count")
	arg_6_0.shareBtn = var_6_0:Find("btn_share")

	setActive(arg_6_0.shareBtn, false)
	onButton(arg_6_0, arg_6_0.billboardTF, function()
		arg_6_0:OnBackPress()
	end, SFX_PANEL)
end

function var_0_0.updateUI(arg_8_0)
	local var_8_0 = pg.TimeMgr.GetInstance()
	local var_8_1 = arg_8_0.refluxProxy.returnLastTimestamp
	local var_8_2 = arg_8_0.refluxProxy.returnTimestamp
	local var_8_3 = var_8_0:STimeDescS(var_8_1, "*t")

	setText(arg_8_0.yearText, var_8_3.year % 100)
	setText(arg_8_0.monthText, var_8_3.month)
	setText(arg_8_0.dateText, var_8_3.day)
	setText(arg_8_0.daysText, var_8_0:DiffDay(var_8_1, var_8_2))
	setText(arg_8_0.countText, arg_8_0.refluxProxy.returnShipNum)
end

function var_0_0.setCloseFunc(arg_9_0, arg_9_1)
	arg_9_0.closeCB = arg_9_1
end

return var_0_0
