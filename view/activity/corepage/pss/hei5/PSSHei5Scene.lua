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

function var_0_0.initTplVar(arg_3_0)
	arg_3_0.helpBtnTip = "blackfriday_battlepass_main_help_" .. pg.black_friday_battlepass_event_pt[arg_3_0.activity.id].map_name
	arg_3_0.awardPageCls = PSSHei5AwardPage
	arg_3_0.taskPageCls = PSSHei5TaskPage
	arg_3_0.chargePageCls = PSSCruiseChargePage
	arg_3_0.dayTextTip = "blackfriday_battlepass_main_time_title"
	arg_3_0.titleTextTip = "activity_ninjia_main_title"
	arg_3_0.rewardTip = "blackfriday_battlepass_rewards"
	arg_3_0.missionTip = "blackfriday_battlepass_mission"
end

function var_0_0.init(arg_4_0)
	arg_4_0:initTplVar()

	arg_4_0.topUI = arg_4_0._tf:Find("top")
	arg_4_0.titleTF = arg_4_0.topUI:Find("title/Text")
	arg_4_0.helpBtn = arg_4_0.topUI:Find("help")
	arg_4_0.dayTxt = arg_4_0.topUI:Find("day/Text"):GetComponent(typeof(Text))
	arg_4_0.phaseTF = arg_4_0._tf:Find("frame/phase")
	arg_4_0.frame = arg_4_0._tf:Find("frame")
	arg_4_0.btnPay = arg_4_0._tf:Find("frame/phase/btn_pay")
	arg_4_0.item = arg_4_0.frame:Find("phase/award/tpl")
	arg_4_0.items = arg_4_0.frame:Find("phase/award")
	arg_4_0.itemList = UIItemList.New(arg_4_0.items, arg_4_0.item)

	setActive(arg_4_0.item, false)
	setText(arg_4_0.frame:Find("toggles/award/selected/Text"), i18n(arg_4_0.rewardTip))
	setText(arg_4_0.frame:Find("toggles/award/unselected/Text"), i18n(arg_4_0.rewardTip))
	setText(arg_4_0.frame:Find("toggles/task/selected/Text"), i18n(arg_4_0.missionTip))
	setText(arg_4_0.frame:Find("toggles/task/unselected/Text"), i18n(arg_4_0.missionTip))

	arg_4_0.pages = {
		[var_0_0.PAGE_AWARD] = arg_4_0.awardPageCls.New(arg_4_0._tf:Find("frame/award_container"), arg_4_0.event, arg_4_0.contextData),
		[var_0_0.PAGE_TASK] = arg_4_0.taskPageCls.New(arg_4_0._tf:Find("frame/task_container"), arg_4_0.event, arg_4_0.contextData)
	}
	arg_4_0.togglesTF = arg_4_0._tf:Find("frame/toggles")

	eachChild(arg_4_0.togglesTF, function(arg_5_0)
		onButton(arg_4_0, arg_5_0, function()
			arg_4_0.contextData.page = arg_5_0.name

			arg_4_0:SwitchPage()
		end, SFX_PANEL)
	end)

	arg_4_0.contextData.windowForCharge = arg_4_0.chargePageCls.New(arg_4_0._tf, arg_4_0.event)
end

function var_0_0.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0.topUI:Find("title/back"), function()
		arg_7_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.helpBtn, function()
		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_HELP, {
			helps = i18n(arg_7_0.helpBtnTip)
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnPay, function()
		arg_7_0.contextData.windowForCharge:ExecuteAction("ShowBuyWindow")
	end, SFX_CONFIRM)

	local var_7_0 = arg_7_0.activity.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

	arg_7_0.dayTxt.text = i18n(arg_7_0.dayTextTip) .. i18n("battlepass_main_time", math.floor(var_7_0 / 86400), math.floor(var_7_0 % 86400 / 3600))

	arg_7_0:UpdatePhase()
	arg_7_0:UpdateAwardTip()
	triggerButton(arg_7_0.togglesTF:Find(arg_7_0.contextData.page or var_0_1))
	arg_7_0:SetAward()
end

function var_0_0.SetAward(arg_11_0)
	arg_11_0.config_client = arg_11_0.activity:getConfig("config_client")[2]
	arg_11_0.taskProxy = getProxy(TaskProxy)

	arg_11_0.itemList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventInit then
			local var_12_0 = arg_12_2:Find("item")
			local var_12_1 = Drop.Create({
				arg_11_0.config_client[arg_12_1 + 1][1],
				arg_11_0.config_client[arg_12_1 + 1][2],
				arg_11_0.config_client[arg_12_1 + 1][3]
			})

			updateDrop(var_12_0, var_12_1)
			onButton(arg_11_0, arg_12_2, function()
				arg_11_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
					drop = drop
				})
			end, SFX_PANEL)
		end
	end)
	arg_11_0.itemList:align(#arg_11_0.config_client)
end

function var_0_0.UpdatePhase(arg_14_0)
	setText(arg_14_0.phaseTF:Find("Text"), arg_14_0.phase)

	if arg_14_0.phase < #arg_14_0.awardList then
		local var_14_0 = arg_14_0.phase == 0 and 0 or arg_14_0.awardList[arg_14_0.phase].pt
		local var_14_1 = arg_14_0.pt - var_14_0
		local var_14_2 = arg_14_0.awardList[arg_14_0.phase + 1].pt - var_14_0

		arg_14_0.phaseTF:Find("slider"):GetComponent(typeof(Image)).fillAmount = var_14_1 / var_14_2

		setText(arg_14_0.phaseTF:Find("progress/progress1"), var_14_1)
		setText(arg_14_0.phaseTF:Find("progress/progress2"), "/" .. var_14_2)
	else
		arg_14_0.phaseTF:Find("slider"):GetComponent(typeof(Image)).fillAmount = 1

		setText(arg_14_0.phaseTF:Find("progress/progress1"), "MAX")
		setActive(arg_14_0.phaseTF:Find("progress/progress2"), false)
	end

	arg_14_0.contextData.phase = arg_14_0.phase

	setActive(arg_14_0.btnPay, not arg_14_0.isPay)

	if not arg_14_0.isPay then
		local var_14_3 = arg_14_0.chargePageCls.GetPassID()

		if not pg.TimeMgr.GetInstance():inTime(pg.pay_data_display[var_14_3].time) then
			setActive(arg_14_0.btnPay, false)
		end
	end

	setText(arg_14_0.titleTF, i18n(arg_14_0.titleTextTip))
end

function var_0_0.OnChargeSuccess(arg_15_0, arg_15_1)
	arg_15_0.contextData.windowForCharge:ExecuteAction("ShowUnlockWindow", arg_15_1)
end

function var_0_0.UpdateAwardTip(arg_16_0)
	setActive(arg_16_0.togglesTF:Find("award/tip"), #arg_16_0.activity:GetHei5UnreceiveAward() > 0)
end

function var_0_0.SwitchPage(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.pages) do
		if iter_17_0 == arg_17_0.contextData.page then
			iter_17_1:ExecuteAction("Flush")
		else
			iter_17_1:ExecuteAction("Hide")
		end
	end

	eachChild(arg_17_0.togglesTF, function(arg_18_0)
		setActive(arg_18_0:Find("unselected"), arg_18_0.name ~= arg_17_0.contextData.page)
		setActive(arg_18_0:Find("selected"), arg_18_0.name == arg_17_0.contextData.page)
	end)

	local var_17_0

	var_17_0 = arg_17_0.contextData.page == var_0_0.PAGE_SHOP
end

function var_0_0.UpdateView(arg_19_0)
	arg_19_0.pages[arg_19_0.contextData.page]:ExecuteAction("Flush")
end

function var_0_0.UpdateAwardPage(arg_20_0)
	arg_20_0:UpdateAwardTip()
	arg_20_0.pages[var_0_0.PAGE_AWARD]:ExecuteAction("UpdateActivity", arg_20_0.activity)
end

function var_0_0.UpdateTaskPage(arg_21_0)
	arg_21_0.pages[var_0_0.PAGE_TASK]:ExecuteAction("UpdateActivity", arg_21_0.activity)
end

function var_0_0.onBackPressed(arg_22_0)
	if arg_22_0.contextData.windowForCharge and arg_22_0.contextData.windowForCharge:GetLoaded() and arg_22_0.contextData.windowForCharge:isShowing() then
		arg_22_0.contextData.windowForCharge:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_22_0)
end

function var_0_0.willExit(arg_23_0)
	return
end

return var_0_0
