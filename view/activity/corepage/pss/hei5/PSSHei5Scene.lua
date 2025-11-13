local var_0_0 = class("PSSHei5Scene", import("view.base.BaseUI"))

var_0_0.optionsPath = {
	"top/home"
}
var_0_0.PAGE_AWARD = "award"
var_0_0.PAGE_TASK = "task"

local var_0_1 = var_0_0.PAGE_AWARD

function var_0_0.getUIName(arg_1_0)
	return "PSSHei5UI"
end

function var_0_0.setActivity(arg_2_0, arg_2_1)
	arg_2_0.activity = arg_2_1

	for iter_2_0, iter_2_1 in pairs(arg_2_1:GetHei5Info()) do
		arg_2_0[iter_2_0] = iter_2_1
	end

	arg_2_0.contextData.phase = arg_2_0.phase
end

function var_0_0.init(arg_3_0)
	arg_3_0.topUI = arg_3_0._tf:Find("top")
	arg_3_0.titleTF = arg_3_0.topUI:Find("title/Text")
	arg_3_0.helpBtn = arg_3_0.topUI:Find("help")
	arg_3_0.dayTxt = arg_3_0.topUI:Find("day/Text"):GetComponent(typeof(Text))
	arg_3_0.phaseTF = arg_3_0._tf:Find("frame/phase")
	arg_3_0.frame = arg_3_0._tf:Find("frame")
	arg_3_0.btnPay = arg_3_0._tf:Find("frame/phase/btn_pay")
	arg_3_0.item = arg_3_0.frame:Find("phase/award/tpl")
	arg_3_0.items = arg_3_0.frame:Find("phase/award")
	arg_3_0.itemList = UIItemList.New(arg_3_0.items, arg_3_0.item)

	setActive(arg_3_0.item, false)
	setText(arg_3_0.frame:Find("toggles/award/selected/Text"), i18n("blackfriday_battlepass_rewards"))
	setText(arg_3_0.frame:Find("toggles/award/unselected/Text"), i18n("blackfriday_battlepass_rewards"))
	setText(arg_3_0.frame:Find("toggles/task/selected/Text"), i18n("blackfriday_battlepass_mission"))
	setText(arg_3_0.frame:Find("toggles/task/unselected/Text"), i18n("blackfriday_battlepass_mission"))

	arg_3_0.pages = {
		[var_0_0.PAGE_AWARD] = PSSHei5AwardPage.New(arg_3_0._tf:Find("frame/award_container"), arg_3_0.event, arg_3_0.contextData),
		[var_0_0.PAGE_TASK] = PSSHei5TaskPage.New(arg_3_0._tf:Find("frame/task_container"), arg_3_0.event, arg_3_0.contextData)
	}
	arg_3_0.togglesTF = arg_3_0._tf:Find("frame/toggles")

	eachChild(arg_3_0.togglesTF, function(arg_4_0)
		onButton(arg_3_0, arg_4_0, function()
			arg_3_0.contextData.page = arg_4_0.name

			arg_3_0:SwitchPage()
		end, SFX_PANEL)
	end)

	arg_3_0.contextData.windowForCharge = PSSCruiseChargePage.New(arg_3_0._tf, arg_3_0.event)
end

function var_0_0.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0.topUI:Find("title/back"), function()
		arg_6_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0.helpBtn, function()
		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_HELP, {
			helps = i18n("blackfriday_battlepass_main_help_" .. pg.black_friday_battlepass_event_pt[arg_6_0.activity.id].map_name)
		})
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.btnPay, function()
		arg_6_0.contextData.windowForCharge:ExecuteAction("ShowBuyWindow")
	end, SFX_CONFIRM)

	local var_6_0 = arg_6_0.activity.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

	arg_6_0.dayTxt.text = i18n("blackfriday_battlepass_main_time_title") .. i18n("battlepass_main_time", math.floor(var_6_0 / 86400), math.floor(var_6_0 % 86400 / 3600))

	arg_6_0:UpdatePhase()
	arg_6_0:UpdateAwardTip()
	triggerButton(arg_6_0.togglesTF:Find(arg_6_0.contextData.page or var_0_1))
	arg_6_0:SetAward()
end

function var_0_0.SetAward(arg_10_0)
	arg_10_0.config_client = arg_10_0.activity:getConfig("config_client")[2]
	arg_10_0.taskProxy = getProxy(TaskProxy)

	arg_10_0.itemList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventInit then
			local var_11_0 = arg_11_2:Find("item")
			local var_11_1 = Drop.Create({
				arg_10_0.config_client[arg_11_1 + 1][1],
				arg_10_0.config_client[arg_11_1 + 1][2],
				arg_10_0.config_client[arg_11_1 + 1][3]
			})

			updateDrop(var_11_0, var_11_1)
			onButton(arg_10_0, arg_11_2, function()
				arg_10_0:emit(BaseUI.ON_DROP, var_11_1)
			end, SFX_PANEL)
		end
	end)
	arg_10_0.itemList:align(#arg_10_0.config_client)
end

function var_0_0.UpdatePhase(arg_13_0)
	setText(arg_13_0.phaseTF:Find("Text"), arg_13_0.phase)

	if arg_13_0.phase < #arg_13_0.awardList then
		local var_13_0 = arg_13_0.phase == 0 and 0 or arg_13_0.awardList[arg_13_0.phase].pt
		local var_13_1 = arg_13_0.pt - var_13_0
		local var_13_2 = arg_13_0.awardList[arg_13_0.phase + 1].pt - var_13_0

		arg_13_0.phaseTF:Find("slider"):GetComponent(typeof(Image)).fillAmount = var_13_1 / var_13_2

		setText(arg_13_0.phaseTF:Find("progress/progress1"), var_13_1)
		setText(arg_13_0.phaseTF:Find("progress/progress2"), "/" .. var_13_2)
	else
		arg_13_0.phaseTF:Find("slider"):GetComponent(typeof(Image)).fillAmount = 1

		setText(arg_13_0.phaseTF:Find("progress/progress1"), "MAX")
		setActive(arg_13_0.phaseTF:Find("progress/progress2"), false)
	end

	arg_13_0.contextData.phase = arg_13_0.phase

	setActive(arg_13_0.btnPay, not arg_13_0.isPay)

	if not arg_13_0.isPay then
		local var_13_3 = PSSCruiseChargePage.GetPassID()

		if not pg.TimeMgr.GetInstance():inTime(pg.pay_data_display[var_13_3].time) then
			setActive(arg_13_0.btnPay, false)
		end
	end

	setText(arg_13_0.titleTF, i18n("activity_ninjia_main_title"))
end

function var_0_0.OnChargeSuccess(arg_14_0, arg_14_1)
	arg_14_0.contextData.windowForCharge:ExecuteAction("ShowUnlockWindow", arg_14_1)
end

function var_0_0.UpdateAwardTip(arg_15_0)
	setActive(arg_15_0.togglesTF:Find("award/tip"), #arg_15_0.activity:GetHei5UnreceiveAward() > 0)
end

function var_0_0.SwitchPage(arg_16_0)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.pages) do
		if iter_16_0 == arg_16_0.contextData.page then
			iter_16_1:ExecuteAction("Flush")
		else
			iter_16_1:ExecuteAction("Hide")
		end
	end

	eachChild(arg_16_0.togglesTF, function(arg_17_0)
		setActive(arg_17_0:Find("unselected"), arg_17_0.name ~= arg_16_0.contextData.page)
		setActive(arg_17_0:Find("selected"), arg_17_0.name == arg_16_0.contextData.page)
	end)

	local var_16_0

	var_16_0 = arg_16_0.contextData.page == var_0_0.PAGE_SHOP
end

function var_0_0.UpdateView(arg_18_0)
	arg_18_0.pages[arg_18_0.contextData.page]:ExecuteAction("Flush")
end

function var_0_0.UpdateAwardPage(arg_19_0)
	arg_19_0:UpdateAwardTip()
	arg_19_0.pages[var_0_0.PAGE_AWARD]:ExecuteAction("UpdateActivity", arg_19_0.activity)
end

function var_0_0.UpdateTaskPage(arg_20_0)
	arg_20_0.pages[var_0_0.PAGE_TASK]:ExecuteAction("UpdateActivity", arg_20_0.activity)
end

function var_0_0.onBackPressed(arg_21_0)
	if arg_21_0.contextData.windowForCharge and arg_21_0.contextData.windowForCharge:GetLoaded() and arg_21_0.contextData.windowForCharge:isShowing() then
		arg_21_0.contextData.windowForCharge:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_21_0)
end

function var_0_0.willExit(arg_22_0)
	return
end

return var_0_0
