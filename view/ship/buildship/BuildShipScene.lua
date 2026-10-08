local var_0_0 = class("BuildShipScene", import("...base.BaseUI"))

var_0_0.PAGE_BUILD = 1
var_0_0.PAGE_QUEUE = 2
var_0_0.PAGE_SUPPORT = 3
var_0_0.PAGE_UNSEAM = 4
var_0_0.PAGE_PRAY = 5
var_0_0.PAGE_NEWSERVER = 6
var_0_0.PROJECTS = {
	SPECIAL = "special",
	ACTIVITY = "new",
	HEAVY = "heavy",
	LIGHT = "light"
}

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/al_bg01"
	}

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_2_0)
	return "BuildShipUI"
end

function var_0_0.ResUISettings(arg_3_0)
	return true
end

function var_0_0.setPools(arg_4_0, arg_4_1)
	arg_4_0.pools = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		table.insert(arg_4_0.pools, iter_4_1)
	end
end

function var_0_0.setPlayer(arg_5_0, arg_5_1)
	arg_5_0.contextData.player = arg_5_1
end

function var_0_0.setUseItem(arg_6_0, arg_6_1)
	arg_6_0.contextData.itemVO = arg_6_1 or Item.New({
		count = 0,
		id = pg.ship_data_create_material[1].use_item
	})

	if arg_6_0.poolsPage and arg_6_0.poolsPage:GetLoaded() then
		arg_6_0.poolsPage:UpdateItem(arg_6_0.contextData.itemVO.count)
	end
end

function var_0_0.setStartCount(arg_7_0, arg_7_1)
	arg_7_0.contextData.startCount = arg_7_1
end

function var_0_0.setFlagShip(arg_8_0, arg_8_1)
	arg_8_0.contextData.falgShip = arg_8_1
end

function var_0_0.RefreshActivityBuildPool(arg_9_0, arg_9_1)
	arg_9_0.poolsPage:RefreshActivityBuildPool(arg_9_1)
end

function var_0_0.RefreshFreeBuildActivity(arg_10_0)
	arg_10_0.poolsPage:RefreshFreeBuildActivity()
	arg_10_0.poolsPage:UpdateTicket()
end

function var_0_0.RefreshRegularExchangeCount(arg_11_0)
	arg_11_0.poolsPage:RefreshRegularExchangeCount()
end

function var_0_0.init(arg_12_0)
	Input.multiTouchEnabled = false
	arg_12_0.blurPanel = arg_12_0._tf:Find("blur_panel")
	arg_12_0.topPanel = arg_12_0.blurPanel:Find("adapt/top")
	arg_12_0.backBtn = arg_12_0.topPanel:Find("back_btn")
	arg_12_0.toggles = {
		arg_12_0.blurPanel:Find("adapt/left_length/frame/tagRoot/build_btn"),
		arg_12_0.blurPanel:Find("adapt/left_length/frame/tagRoot/queue_btn"),
		arg_12_0.blurPanel:Find("adapt/left_length/frame/tagRoot/support_btn"),
		arg_12_0.blurPanel:Find("adapt/left_length/frame/tagRoot/unseam_btn"),
		arg_12_0.blurPanel:Find("adapt/left_length/frame/tagRoot/pray_btn"),
		arg_12_0.blurPanel:Find("adapt/left_length/frame/tagRoot/other_build_btn")
	}
	arg_12_0.tip = arg_12_0.toggles[2]:Find("tip")
	arg_12_0.contextData.msgbox = BuildShipMsgBox.New(arg_12_0._tf, arg_12_0.event)
	arg_12_0.contextData.helpWindow = BuildShipHelpWindow.New(arg_12_0._tf, arg_12_0.event)
	arg_12_0.poolsPage = BuildShipPoolsPage.New(arg_12_0._tf, arg_12_0.event, arg_12_0.contextData)
	arg_12_0.supportShipPoolPage = SupportShipPoolPage.New(arg_12_0._tf, arg_12_0.event, arg_12_0.contextData)
end

function var_0_0.didEnter(arg_13_0)
	arg_13_0:OverlayPanel(arg_13_0.blurPanel)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		arg_13_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)

	local var_13_0 = arg_13_0.blurPanel:Find("adapt/left_length/stamp")

	setActive(var_13_0, getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(arg_13_0, var_13_0, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(11)
	end, SFX_CONFIRM)

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.toggles) do
		onToggle(arg_13_0, iter_13_1, function(arg_16_0)
			arg_13_0:switchPage(iter_13_0, arg_16_0)
		end, SFX_PANEL)
	end

	local var_13_1 = getProxy(ActivityProxy)
	local var_13_2 = var_13_1:getActivityById(ActivityConst.ACTIVITY_PRAY_POOL)

	if var_13_2 and not var_13_2:isEnd() then
		setActive(arg_13_0.toggles[var_0_0.PAGE_PRAY], true)
	else
		setActive(arg_13_0.toggles[var_0_0.PAGE_PRAY], false)
	end

	if underscore.any(arg_13_0.pools, function(arg_17_0)
		return checkExist(var_13_1:getBuildPoolActivity(arg_17_0), {
			"getConfig",
			{
				"type"
			}
		}) == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	end) then
		setActive(arg_13_0.toggles[var_0_0.PAGE_NEWSERVER], true)
	else
		setActive(arg_13_0.toggles[var_0_0.PAGE_NEWSERVER], false)
	end

	local var_13_3 = arg_13_0.contextData.page or pg.SeriesGuideMgr.GetInstance():isRunning() and var_0_0.PAGE_BUILD or var_0_0.PAGE_NEWSERVER

	if not isActive(arg_13_0.toggles[var_13_3]) then
		var_13_3 = var_0_0.PAGE_BUILD
	end

	triggerToggle(arg_13_0.toggles[var_13_3], true)
	PoolMgr.GetInstance():GetUI("al_bg01", true, function(arg_18_0)
		arg_18_0:SetActive(true)
		setParent(arg_18_0, arg_13_0._tf)
		arg_18_0.transform:SetAsFirstSibling()
	end)
	TagTipHelper.SetFreeBuildMark()

	arg_13_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_13_0, arg_13_0.blurPanel)
end

function var_0_0.checkPage(arg_19_0)
	if arg_19_0.contextData.msgbox and arg_19_0.contextData.msgbox:GetLoaded() and arg_19_0.contextData.msgbox:isShowing() then
		arg_19_0.contextData.msgbox:Hide()
	end

	if arg_19_0.contextData.helpWindow and arg_19_0.contextData.helpWindow:GetLoaded() and arg_19_0.contextData.helpWindow:isShowing() then
		arg_19_0.contextData.helpWindow:Hide()
	end

	local var_19_0 = getProxy(ActivityProxy)

	if underscore.any(arg_19_0.pools, function(arg_20_0)
		return checkExist(var_19_0:getBuildPoolActivity(arg_20_0), {
			"getConfig",
			{
				"type"
			}
		}) == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	end) then
		setActive(arg_19_0.toggles[var_0_0.PAGE_NEWSERVER], true)
	else
		setActive(arg_19_0.toggles[var_0_0.PAGE_NEWSERVER], false)
	end

	if not isActive(arg_19_0.toggles[var_0_0.PAGE_NEWSERVER]) and arg_19_0.contextData.page == var_0_0.PAGE_NEWSERVER then
		triggerToggle(arg_19_0.toggles[var_0_0.PAGE_BUILD], true)
	else
		arg_19_0.poolsPage:Flush(arg_19_0.pools)
	end
end

function var_0_0.switchPage(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_2 then
		arg_21_0.contextData.page = arg_21_1 == var_0_0.PAGE_UNSEAM and var_0_0.PAGE_BUILD or arg_21_1
	end

	if arg_21_1 == var_0_0.PAGE_UNSEAM then
		if arg_21_2 then
			arg_21_0:emit(BuildShipMediator.OPEN_DESTROY)
		end
	elseif arg_21_1 == var_0_0.PAGE_QUEUE then
		if arg_21_2 then
			arg_21_0:emit(BuildShipMediator.OPEN_PROJECT_LIST)
		else
			arg_21_0:emit(BuildShipMediator.REMOVE_PROJECT_LIST)
		end
	elseif arg_21_1 == var_0_0.PAGE_SUPPORT then
		arg_21_0.supportShipPoolPage:ExecuteAction("ShowOrHide", arg_21_2)

		if arg_21_2 then
			arg_21_0.supportShipPoolPage:ExecuteAction("Flush")
		end
	elseif arg_21_1 == var_0_0.PAGE_BUILD then
		arg_21_0.poolsPage:ExecuteAction("ShowOrHide", arg_21_2)

		if arg_21_2 then
			arg_21_0.poolsPage:ExecuteAction("Flush", arg_21_0.pools, false)
		end
	elseif arg_21_1 == var_0_0.PAGE_NEWSERVER then
		arg_21_0.poolsPage:ExecuteAction("ShowOrHide", arg_21_2)

		if arg_21_2 then
			arg_21_0.poolsPage:ExecuteAction("Flush", arg_21_0.pools, true)
		end
	elseif arg_21_1 == var_0_0.PAGE_PRAY then
		if arg_21_2 then
			arg_21_0:emit(BuildShipMediator.OPEN_PRAY_PAGE)
		else
			arg_21_0:emit(BuildShipMediator.CLOSE_PRAY_PAGE)
		end
	end
end

function var_0_0.updateQueueTip(arg_22_0, arg_22_1)
	setActive(arg_22_0.tip, arg_22_1 > 0)
end

function var_0_0.onBackPressed(arg_23_0)
	if arg_23_0.contextData.helpWindow:GetLoaded() and arg_23_0.contextData.helpWindow:isShowing() then
		arg_23_0.contextData.helpWindow:Hide()

		return
	end

	if arg_23_0.contextData.msgbox:GetLoaded() and arg_23_0.contextData.msgbox:isShowing() then
		arg_23_0.contextData.msgbox:Hide()

		return
	end

	arg_23_0:emit(var_0_0.ON_BACK_PRESSED)
end

function var_0_0.willExit(arg_24_0)
	Input.multiTouchEnabled = true

	arg_24_0.contextData.msgbox:Destroy()
	arg_24_0.contextData.helpWindow:Destroy()
	arg_24_0.poolsPage:Destroy()
	arg_24_0.supportShipPoolPage:Destroy()
	arg_24_0:UnOverlayPanel(arg_24_0.blurPanel, arg_24_0._tf)
end

return var_0_0
