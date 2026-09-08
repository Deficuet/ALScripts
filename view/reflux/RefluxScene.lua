local var_0_0 = class("RefluxScene", import("..base.BaseUI"))

var_0_0.Sign = 1
var_0_0.Task = 2
var_0_0.PT = 3
var_0_0.Shop = 4

function var_0_0.getUIName(arg_1_0)
	return "RefluxUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local function var_2_0()
		arg_2_1()
	end

	if getProxy(ShopsProxy):ShouldRefreshChargeList() then
		pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
			callback = var_2_0
		})
	else
		var_2_0()
	end
end

function var_0_0.init(arg_4_0)
	arg_4_0:findUI()
	arg_4_0:initData()
	arg_4_0:addListener()
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:updateRedPotList()

	if not getProxy(RefluxProxy):isInRefluxTime() then
		arg_5_0:closeView()

		return
	end

	if not arg_5_0:tryOpenLetterView() then
		arg_5_0:tryAutoOpenLastView()
	end

	arg_5_0:updateDay()
	arg_5_0:OverlayPanel(arg_5_0._tf)
end

function var_0_0.willExit(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.viewList) do
		if iter_6_1 and iter_6_1:GetLoaded() then
			iter_6_1:Destroy()
		end
	end

	if arg_6_0.letterView then
		arg_6_0.letterView:Destroy()

		arg_6_0.letterView = nil

		return
	end

	arg_6_0:UnOverlayPanel(arg_6_0._tf, arg_6_0._parentTf)
end

function var_0_0.onBackPressed(arg_7_0)
	if arg_7_0.letterView and arg_7_0.letterView:isShowing() then
		arg_7_0.letterView:Hide()

		arg_7_0.letterView = nil

		return
	end

	arg_7_0:closeView()
end

function var_0_0.findUI(arg_8_0)
	arg_8_0.letterContainer = arg_8_0._tf:Find("PanelLetter")
	arg_8_0.panelContainer = arg_8_0._tf:Find("PanelContainer")

	local var_8_0 = arg_8_0._tf:Find("left/left_bar")

	arg_8_0.letterBtn = var_8_0:Find("letter")
	arg_8_0.signToggle = var_8_0:Find("tabs/sign")
	arg_8_0.taskToggle = var_8_0:Find("tabs/task")
	arg_8_0.ptToggle = var_8_0:Find("tabs/pt")
	arg_8_0.shopToggle = var_8_0:Find("tabs/shop")
	arg_8_0.toggleList = {
		[var_0_0.Sign] = arg_8_0.signToggle,
		[var_0_0.Task] = arg_8_0.taskToggle,
		[var_0_0.PT] = arg_8_0.ptToggle,
		[var_0_0.Shop] = arg_8_0.shopToggle
	}
	arg_8_0.redPotList = {
		[var_0_0.Sign] = arg_8_0.signToggle:Find("Red"),
		[var_0_0.Task] = arg_8_0.taskToggle:Find("Red"),
		[var_0_0.PT] = arg_8_0.ptToggle:Find("Red"),
		[var_0_0.Shop] = arg_8_0.shopToggle:Find("Red")
	}
	arg_8_0.backBtn = var_8_0:Find("back")
	arg_8_0.dayText = arg_8_0._tf:Find("time/text")

	local var_8_1 = arg_8_0._tf:Find("time/icon")

	setText(var_8_1, i18n("reflux_word_1"))

	local var_8_2 = arg_8_0._tf:Find("time/icon1")

	setText(var_8_2, i18n("word_date"))
end

function var_0_0.initData(arg_9_0)
	arg_9_0.curViewIndex = 0
	arg_9_0.letterView = RefluxAnimationPlayer.New(pg.UIMgr.GetInstance().OverlayUITop)
	arg_9_0.signView = RefluxSignView.New(arg_9_0.panelContainer, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.taskView = RefluxTaskView.New(arg_9_0.panelContainer, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.ptView = RefluxPTView.New(arg_9_0.panelContainer, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.shopView = RefluxShopView.New(arg_9_0.panelContainer, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.viewList = {
		[var_0_0.Sign] = arg_9_0.signView,
		[var_0_0.Task] = arg_9_0.taskView,
		[var_0_0.PT] = arg_9_0.ptView,
		[var_0_0.Shop] = arg_9_0.shopView
	}
end

function var_0_0.addListener(arg_10_0)
	onButton(arg_10_0, arg_10_0.backBtn, function()
		arg_10_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.letterBtn, function()
		arg_10_0:switchLetter()
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.signToggle, function(arg_13_0)
		if arg_13_0 == true then
			arg_10_0:switchPage(var_0_0.Sign)
		end
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.taskToggle, function(arg_14_0)
		if arg_14_0 == true then
			arg_10_0:switchPage(var_0_0.Task)
		end
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.ptToggle, function(arg_15_0)
		if arg_15_0 == true then
			arg_10_0:switchPage(var_0_0.PT)
		end
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.shopToggle, function(arg_16_0)
		if arg_16_0 == true then
			arg_10_0:switchPage(var_0_0.Shop)
			arg_10_0:updateRedPotList()
		end
	end, SFX_PANEL)
end

function var_0_0.tryOpenLetterView(arg_17_0)
	return false
end

function var_0_0.switchPage(arg_18_0, arg_18_1)
	if arg_18_0.curViewIndex ~= arg_18_1 then
		local var_18_0 = arg_18_0.viewList[arg_18_1]

		var_18_0:Load()
		var_18_0:ActionInvoke("Show")
		var_18_0:ActionInvoke("updateOutline")

		if arg_18_0.curViewIndex > 0 then
			arg_18_0.viewList[arg_18_0.curViewIndex]:Hide()
		end

		arg_18_0.curViewIndex = arg_18_1
		arg_18_0.contextData.lastViewIndex = arg_18_1
	end
end

function var_0_0.tryAutoOpenLastView(arg_19_0)
	if arg_19_0.contextData.lastViewIndex then
		triggerToggle(arg_19_0.toggleList[arg_19_0.contextData.lastViewIndex], true)
	else
		triggerToggle(arg_19_0.toggleList[var_0_0.Sign], true)
	end
end

function var_0_0.switchLetter(arg_20_0)
	local var_20_0 = getProxy(RefluxProxy):GetRefluxBgs()

	arg_20_0.letterView:ExecuteAction("Play4Review", var_20_0, function()
		arg_20_0.letterView:Hide()
	end)
end

function var_0_0.updateRedPotList(arg_22_0)
	local var_22_0 = RefluxTaskView.isAnyTaskCanGetAward()
	local var_22_1 = RefluxPTView.isAnyPTCanGetAward()
	local var_22_2 = RefluxShopView.isShowRedPot()

	setActive(arg_22_0.redPotList[var_0_0.Sign], false)
	setActive(arg_22_0.redPotList[var_0_0.Task], var_22_0)
	setActive(arg_22_0.redPotList[var_0_0.PT], var_22_1)
	setActive(arg_22_0.redPotList[var_0_0.Shop], var_22_2)
end

function var_0_0.updateDay(arg_23_0)
	local var_23_0 = getProxy(RefluxProxy)
	local var_23_1 = pg.TimeMgr.GetInstance()
	local var_23_2 = #pg.return_sign_template.all
	local var_23_3 = math.clamp(var_23_1:DiffDay(var_23_0.returnTimestamp, var_23_1:GetServerTime()), 0, var_23_2 - 1)

	setText(arg_23_0.dayText, var_23_2 - var_23_3)
end

return var_0_0
