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
end

function var_0_0.willExit(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.viewList) do
		if iter_6_1 and iter_6_1:GetLoaded() then
			iter_6_1:Destroy()
		end
	end
end

function var_0_0.onBackPressed(arg_7_0)
	if arg_7_0.letterView and arg_7_0.letterView:isShowing() then
		arg_7_0.letterView:OnBackPress()

		return
	end

	arg_7_0:closeView()
end

function var_0_0.findUI(arg_8_0)
	arg_8_0.letterContainer = arg_8_0:findTF("PanelLetter")
	arg_8_0.panelContainer = arg_8_0:findTF("PanelContainer")

	local var_8_0 = arg_8_0:findTF("left/left_bar")

	arg_8_0.letterBtn = arg_8_0:findTF("letter", var_8_0)
	arg_8_0.signToggle = arg_8_0:findTF("tabs/sign", var_8_0)
	arg_8_0.taskToggle = arg_8_0:findTF("tabs/task", var_8_0)
	arg_8_0.ptToggle = arg_8_0:findTF("tabs/pt", var_8_0)
	arg_8_0.shopToggle = arg_8_0:findTF("tabs/shop", var_8_0)
	arg_8_0.toggleList = {
		[var_0_0.Sign] = arg_8_0.signToggle,
		[var_0_0.Task] = arg_8_0.taskToggle,
		[var_0_0.PT] = arg_8_0.ptToggle,
		[var_0_0.Shop] = arg_8_0.shopToggle
	}
	arg_8_0.redPotList = {
		[var_0_0.Sign] = arg_8_0:findTF("Red", arg_8_0.signToggle),
		[var_0_0.Task] = arg_8_0:findTF("Red", arg_8_0.taskToggle),
		[var_0_0.PT] = arg_8_0:findTF("Red", arg_8_0.ptToggle),
		[var_0_0.Shop] = arg_8_0:findTF("Red", arg_8_0.shopToggle)
	}
	arg_8_0.backBtn = arg_8_0:findTF("back", var_8_0)
	arg_8_0.dayText = arg_8_0:findTF("time/text")

	local var_8_1 = arg_8_0:findTF("time/icon")

	setText(var_8_1, i18n("reflux_word_1"))

	local var_8_2 = arg_8_0:findTF("time/icon1")

	setText(var_8_2, i18n("word_date"))
end

function var_0_0.initData(arg_9_0)
	arg_9_0.curViewIndex = 0
	arg_9_0.letterView = RefluxLetterView.New(arg_9_0.letterContainer, arg_9_0.event, arg_9_0.contextData)
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
	local var_17_0 = getProxy(RefluxProxy).returnTimestamp
	local var_17_1 = getProxy(PlayerProxy):getRawData().id .. "_" .. var_17_0

	if PlayerPrefs.GetInt(var_17_1, 0) ~= 1 then
		PlayerPrefs.SetInt(var_17_1, 1)
		PlayerPrefs.Save()
		arg_17_0.letterView:ActionInvoke("setCloseFunc", function()
			triggerToggle(arg_17_0.toggleList[var_0_0.Sign], true)
		end)
		arg_17_0:switchLetter()

		return true
	else
		return false
	end
end

function var_0_0.switchPage(arg_19_0, arg_19_1)
	if arg_19_0.curViewIndex ~= arg_19_1 then
		local var_19_0 = arg_19_0.viewList[arg_19_1]

		var_19_0:Load()
		var_19_0:ActionInvoke("Show")
		var_19_0:ActionInvoke("updateOutline")

		if arg_19_0.curViewIndex > 0 then
			arg_19_0.viewList[arg_19_0.curViewIndex]:Hide()
		end

		arg_19_0.curViewIndex = arg_19_1
		arg_19_0.contextData.lastViewIndex = arg_19_1
	end
end

function var_0_0.tryAutoOpenLastView(arg_20_0)
	if arg_20_0.contextData.lastViewIndex then
		triggerToggle(arg_20_0.toggleList[arg_20_0.contextData.lastViewIndex], true)
	else
		triggerToggle(arg_20_0.toggleList[var_0_0.Sign], true)
	end
end

function var_0_0.switchLetter(arg_21_0)
	arg_21_0.letterView:Load()
	arg_21_0.letterView:ActionInvoke("Show")
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
