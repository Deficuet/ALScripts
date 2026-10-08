local var_0_0 = class("ActivityMainScene", import("..base.BaseUI"))

var_0_0.LOCK_ACT_MAIN = "ActivityMainScene:LOCK_ACT_MAIN"
var_0_0.UPDATE_ACTIVITY = "ActivityMainScene:UPDATE_ACTIVITY"
var_0_0.GET_PAGE_BGM = "ActivityMainScene.GET_PAGE_BGM"
var_0_0.FLUSH_TABS = "ActivityMainScene.FLUSH_TABS"

function var_0_0.getResource(arg_1_0, arg_1_1)
	local var_1_0 = {
		"activitybanner",
		"activityuitable",
		"ui/ActivitybonusWindow",
		"ui/ActivitybonusWindow_nonPt",
		"ui/ChargeTipUI",
		"ui/MonthCardTipWindow",
		"ui/GiftPackageTipWindow",
		"ui/CrusingTipWindow",
		"ui/iconcolorful",
		"activitybanner/empty",
		"activityuitable/activity_text",
		"activityuitable/activity_text_selected"
	}

	local function var_1_1(arg_2_0)
		if not table.contains(var_1_0, arg_2_0) then
			table.insert(var_1_0, arg_2_0)
		end
	end

	for iter_1_0, iter_1_1 in ipairs(getProxy(ActivityProxy):getPanelActivities()) do
		local var_1_2 = iter_1_1:getConfig("title_res_tag")

		if noEmptyStr(var_1_2) then
			var_1_1("activityuitable/" .. var_1_2 .. "_text")
			var_1_1("activityuitable/" .. var_1_2 .. "_text_selected")
		end
	end

	local var_1_3 = getProxy(ActivityPermanentProxy):getActivityIdsByType(ActivityPermanentProxy.TYPE_NORMAL_ACTIVITY)

	for iter_1_2, iter_1_3 in ipairs(var_1_3) do
		local var_1_4 = pg.activity_task_permanent[iter_1_3].id
		local var_1_5 = pg.activity_template[var_1_4].title_res_tag

		if noEmptyStr(var_1_5) then
			var_1_1("activityuitable/" .. var_1_5 .. "_text")
			var_1_1("activityuitable/" .. var_1_5 .. "_text_selected")
		end
	end

	for iter_1_4, iter_1_5 in ipairs(var_0_0.GetOnShowEntranceData()) do
		var_1_1("activitybanner/" .. iter_1_5.banner)
	end

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))

	return var_1_0
end

function var_0_0.getUIName(arg_3_0)
	return "ActivityMainUI"
end

function var_0_0.PlayBGM(arg_4_0)
	return
end

function var_0_0.onBackPressed(arg_5_0)
	if arg_5_0.locked then
		return
	end

	for iter_5_0, iter_5_1 in pairs(arg_5_0.windowList) do
		if isActive(iter_5_1._tf) then
			arg_5_0:HideWindow(iter_5_1.class)

			return
		end
	end

	if arg_5_0.awardWindow and arg_5_0.awardWindow:GetLoaded() and arg_5_0.awardWindow:isShowing() then
		arg_5_0.awardWindow:Hide()

		return
	end

	for iter_5_2, iter_5_3 in pairs(arg_5_0.pageDic) do
		if iter_5_3.onBackPressed and iter_5_3:onBackPressed() then
			return
		end
	end

	arg_5_0:emit(var_0_0.ON_BACK_PRESSED)
end

local var_0_1

function var_0_0.init(arg_6_0)
	arg_6_0.entranceList = UIItemList.New(arg_6_0.entranceContent, arg_6_0.entranceTpl)
	arg_6_0.windowList = {}
	arg_6_0.awardWindow = AwardWindow.New(arg_6_0._tf, arg_6_0.event)
	arg_6_0.chargeTipWindow = ChargeTipWindow.New(arg_6_0._tf, arg_6_0.event)

	setActive(arg_6_0.tab, false)
	setActive(arg_6_0.lockAll, false)
	setActive(arg_6_0.permanentFinshMask, false)
	setText(arg_6_0.permanentFinshMask:Find("piece/Text"), i18n("activity_permanent_tips2"))
	onButton(arg_6_0, arg_6_0.permanentFinshMask:Find("piece/arrow/Image"), function()
		arg_6_0:emit(ActivityMediator.FINISH_ACTIVITY_PERMANENT)
	end, SFX_PANEL)

	arg_6_0.tabsList = UIItemList.New(arg_6_0.tabs, arg_6_0.tab)

	arg_6_0.tabsList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_6_0.activities[arg_8_1 + 1]

			arg_8_2.name = var_8_0.id

			local var_8_1 = var_8_0:getConfig("title_res_tag")

			if var_8_1 then
				local var_8_2 = arg_8_2:Find("red")
				local var_8_3 = GetSpriteFromAtlas("activityuitable/" .. var_8_1 .. "_text", "") or GetSpriteFromAtlas("activityuitable/activity_text", "")
				local var_8_4 = GetSpriteFromAtlas("activityuitable/" .. var_8_1 .. "_text_selected", "") or GetSpriteFromAtlas("activityuitable/activity_text_selected", "")

				setImageSprite(arg_8_2:Find("off/text"), var_8_3, true)
				setImageSprite(arg_8_2:Find("on/text"), var_8_4, true)
				setActive(var_8_2, var_8_0:readyToAchieve())
				onToggle(arg_6_0, arg_8_2, function(arg_9_0)
					if arg_9_0 then
						arg_6_0:selectActivity(var_8_0)
					end
				end, SFX_PANEL)
			end

			local var_8_5 = arg_6_0.pageDic[var_8_0.id]

			onToggle(arg_6_0, arg_8_2, function(arg_10_0)
				if var_8_5 then
					if arg_10_0 then
						arg_6_0:selectActivity(var_8_0)
					end
				else
					arg_6_0:loadActivityPanel(arg_10_0, var_8_0)
				end
			end, SFX_PANEL)
		end
	end)

	arg_6_0.switchCount = 0
end

function var_0_0.didEnter(arg_11_0)
	arg_11_0:bind(var_0_0.LOCK_ACT_MAIN, function(arg_12_0, arg_12_1)
		arg_11_0.locked = arg_12_1

		setActive(arg_11_0.lockAll, arg_12_1)
	end)
	arg_11_0:bind(var_0_0.UPDATE_ACTIVITY, function(arg_13_0, arg_13_1)
		arg_11_0:updateActivity(arg_13_1)
	end)
	arg_11_0:bind(var_0_0.GET_PAGE_BGM, function(arg_14_0, arg_14_1, arg_14_2)
		arg_14_2.bgm = arg_11_0:getBGM(arg_14_1) or arg_11_0:getBGM()
	end)
	arg_11_0:bind(var_0_0.FLUSH_TABS, function()
		arg_11_0:flushTabs()
	end)
	getProxy(CommanderManualProxy):TaskProgressAdd(2020, 1)
	onButton(arg_11_0, arg_11_0.btnBack, function()
		arg_11_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
	arg_11_0:updateEntrances()
	arg_11_0:emit(ActivityMediator.SHOW_NEXT_ACTIVITY)

	if arg_11_0.contextData.event then
		arg_11_0:emit(arg_11_0.contextData.event, arg_11_0.contextData.data)

		arg_11_0.contextData.event = nil
		arg_11_0.contextData.data = nil
	end

	pg.CameraFixMgr.GetInstance():Adapt()
end

function var_0_0.setPlayer(arg_17_0, arg_17_1)
	arg_17_0.shareData:SetPlayer(arg_17_1)
end

function var_0_0.setFlagShip(arg_18_0, arg_18_1)
	arg_18_0.shareData:SetFlagShip(arg_18_1)
end

function var_0_0.updateTaskLayers(arg_19_0)
	if not arg_19_0.activity then
		return
	end

	arg_19_0:updateActivity(arg_19_0.activity)
end

function var_0_0.getActClass(arg_20_0, arg_20_1)
	local var_20_0, var_20_1 = pcall(import, "view.activity.subPages." .. arg_20_1)

	if not var_20_0 then
		local var_20_2, var_20_3 = pcall(import, "view.activity.Remaster.re." .. arg_20_1)

		var_20_1 = var_20_3

		if not var_20_2 then
			error("模块未找到: " .. arg_20_1)
		end
	end

	return var_20_1
end

function var_0_0.instanceActivityPage(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:getConfig("page_info")

	if var_21_0.class_name and not arg_21_0.pageDic[arg_21_1.id] and not arg_21_1:isEnd() then
		local var_21_1 = arg_21_0:getActClass(var_21_0.class_name).New(arg_21_0.pageContainer, arg_21_0.event, arg_21_0.contextData)

		if var_21_1:UseSecondPage(arg_21_1) then
			var_21_1:SetUIName(var_21_0.ui_name2)
		else
			var_21_1:SetUIName(var_21_0.ui_name)
		end

		var_21_1:SetShareData(arg_21_0.shareData)

		arg_21_0.pageDic[arg_21_1.id] = var_21_1
	end
end

function var_0_0.setActivities(arg_22_0, arg_22_1)
	arg_22_0.activities = underscore.filter(arg_22_1 or {}, function(arg_23_0)
		return arg_23_0:checkPageABExist()
	end)
	arg_22_0.shareData = arg_22_0.shareData or ActivityShareData.New()
	arg_22_0.pageDic = arg_22_0.pageDic or {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
		arg_22_0:instanceActivityPage(iter_22_1)
	end

	arg_22_0.activity = nil

	table.sort(arg_22_0.activities, CompareFuncs({
		function(arg_24_0)
			return -arg_24_0:getShowPriority()
		end,
		function(arg_25_0)
			return -arg_25_0.id
		end
	}))
	arg_22_0:flushTabs()
end

function var_0_0.getActivityIndex(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.activities) do
		if iter_26_1.id == arg_26_1 then
			return iter_26_0
		end
	end

	return nil
end

function var_0_0.updateActivity(arg_27_0, arg_27_1)
	if ActivityConst.PageIdLink[arg_27_1.id] then
		arg_27_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.PageIdLink[arg_27_1.id])
	end

	if arg_27_1:isShow() and arg_27_1:isCorePage(arg_27_0.contextData.coreName or "") and not arg_27_1:isEnd() and arg_27_1:checkPageABExist() then
		arg_27_0.activities[arg_27_0:getActivityIndex(arg_27_1.id) or #arg_27_0.activities + 1] = arg_27_1

		table.sort(arg_27_0.activities, CompareFuncs({
			function(arg_28_0)
				return -arg_28_0:getShowPriority()
			end,
			function(arg_29_0)
				return -arg_29_0.id
			end
		}))

		if not arg_27_0.pageDic[arg_27_1.id] then
			arg_27_0:instanceActivityPage(arg_27_1)
		end

		arg_27_0:flushTabs()

		if arg_27_0.activity and arg_27_0.activity.id == arg_27_1.id then
			arg_27_0.activity = arg_27_1

			arg_27_0.pageDic[arg_27_1.id]:ActionInvoke("Flush", arg_27_1)
			setActive(arg_27_0.permanentFinshMask, pg.activity_task_permanent[arg_27_1.id] and arg_27_1:canPermanentFinish())
		end
	end
end

function var_0_0.removeActivity(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:getActivityIndex(arg_30_1)

	if var_30_0 then
		table.remove(arg_30_0.activities, var_30_0)
		arg_30_0.pageDic[arg_30_1]:Destroy()

		arg_30_0.pageDic[arg_30_1] = nil

		arg_30_0:flushTabs()

		if arg_30_0.activity and arg_30_0.activity.id == arg_30_1 then
			arg_30_0.activity = nil

			arg_30_0:verifyTabs()
		end
	end
end

function var_0_0.GetOnShowEntranceData()
	var_0_1 = var_0_1 or require("GameCfg.activity.EntranceData")

	assert(var_0_1, "Missing EntranceData.lua!")

	var_0_1 = var_0_1 or {}

	local var_31_0 = _.select(var_0_1, function(arg_32_0)
		return arg_32_0.isShow and arg_32_0.isShow()
	end)
	local var_31_1 = var_0_0.createEntranceData()

	table.insertto(var_31_0, var_31_1)

	return var_31_0
end

function var_0_0.createEntranceData()
	local var_33_0 = {}

	for iter_33_0, iter_33_1 in ipairs(pg.activity_entrance.all) do
		local var_33_1 = pg.activity_entrance[iter_33_1]

		if pg.TimeMgr.GetInstance():inTime(var_33_1.time) then
			local var_33_2 = {
				event = ActivityMediator.EVENT_GO_SCENE,
				data = {
					SCENE.ACTIVITY,
					{
						id = var_33_1.act_ids[1]
					}
				},
				banner = var_33_1.banner,
				isShow = function()
					for iter_34_0, iter_34_1 in ipairs(var_33_1.act_ids) do
						local var_34_0 = getProxy(ActivityProxy):getActivityById(iter_34_1)

						if var_34_0 and not var_34_0:isEnd() then
							return true
						end
					end

					return false
				end,
				isTip = function()
					for iter_35_0, iter_35_1 in ipairs(var_33_1.act_ids) do
						local var_35_0 = getProxy(ActivityProxy):getActivityById(iter_35_1)

						if Activity.IsActivityReady(var_35_0) then
							return true
						end
					end

					return false
				end
			}

			table.insert(var_33_0, var_33_2)
		end
	end

	return var_33_0
end

function var_0_0.updateEntrances(arg_36_0)
	local var_36_0 = var_0_0.GetOnShowEntranceData()
	local var_36_1 = math.max(#var_36_0, 5)

	arg_36_0.entranceList:make(function(arg_37_0, arg_37_1, arg_37_2)
		if arg_37_0 == UIItemList.EventUpdate then
			local var_37_0 = var_36_0[arg_37_1 + 1]
			local var_37_1 = "empty"

			removeOnButton(arg_37_2)

			local var_37_2 = false

			if var_37_0 and table.getCount(var_37_0) ~= 0 and var_37_0.isShow() then
				onButton(arg_36_0, arg_37_2, function()
					arg_36_0:emit(var_37_0.event, var_37_0.data[1], var_37_0.data[2])
				end, SFX_PANEL)

				var_37_1 = var_37_0.banner

				if var_37_0.isTip then
					var_37_2 = var_37_0.isTip()
				end
			end

			setActive(arg_37_2:Find("tip"), var_37_2)
			LoadImageSpriteAsync("activitybanner/" .. var_37_1, arg_37_2)
		end
	end)
	arg_36_0.entranceList:align(var_36_1)
end

function var_0_0.flushTabs(arg_39_0)
	arg_39_0.tabsList:align(#arg_39_0.activities)
end

function var_0_0.selectActivity(arg_40_0, arg_40_1)
	if arg_40_0.nextActivity == arg_40_1 or not arg_40_0.nextActivity and arg_40_0.activity and arg_40_1.id == arg_40_0.activity.id then
		return
	end

	local var_40_0 = {}

	if arg_40_0.activity and not arg_40_0.nextActivity then
		arg_40_0.switchCount = arg_40_0.switchCount + 1

		table.insert(var_40_0, function(arg_41_0)
			arg_40_0.pageDic[arg_40_0.activity.id]:ActionInvoke("SwitchOut", function()
				arg_40_0.switchCount = arg_40_0.switchCount - 1

				arg_41_0()
			end)
		end)
	end

	if not arg_40_0.activity or arg_40_0.activity.id ~= arg_40_1.id then
		local var_40_1 = arg_40_0.pageDic[arg_40_1.id]

		assert(var_40_1, "找不到id:" .. arg_40_1.id .. "的活动页，请检查")

		arg_40_0.switchCount = arg_40_0.switchCount + 1

		table.insert(var_40_0, function(arg_43_0)
			var_40_1:Load()
			var_40_1:ActionInvoke("ShowOrHide", false)
			var_40_1:CallbackInvoke(function()
				arg_40_0.switchCount = arg_40_0.switchCount - 1

				arg_43_0()
			end)
		end)
	end

	arg_40_0.nextActivity = arg_40_1

	parallelAsync(var_40_0, function()
		if arg_40_0.switchCount > 0 then
			return
		end

		if arg_40_0.activity then
			arg_40_0.pageDic[arg_40_0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		arg_40_0.activity = arg_40_0.nextActivity
		arg_40_0.contextData.id = arg_40_0.nextActivity.id
		arg_40_0.nextActivity = nil

		local var_45_0 = arg_40_0.pageDic[arg_40_0.activity.id]

		var_45_0:ActionInvoke("ShowOrHide", true)
		var_45_0:ActionInvoke("Flush", arg_40_0.activity)
		setActive(arg_40_0.permanentFinshMask, pg.activity_task_permanent[arg_40_1.id] and arg_40_1:canPermanentFinish())
	end)
end

function var_0_0.checkAutoHideActivity(arg_46_0)
	if arg_46_0.activity and not arg_46_0.activity:isShow() then
		arg_46_0:removeActivity(arg_46_0.activity.id)
	end
end

function var_0_0.verifyTabs(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:getActivityIndex(arg_47_1) or 1
	local var_47_1 = arg_47_0.tabs:GetChild(var_47_0 - 1)

	triggerToggle(var_47_1, true)
end

function var_0_0.loadActivityPanel(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = arg_48_2:getConfig("type")
	local var_48_1

	if var_48_1 and arg_48_1 then
		arg_48_0:emit(ActivityMediator.OPEN_LAYER, var_48_1)
	elseif var_48_1 and not arg_48_1 then
		arg_48_0:emit(ActivityMediator.CLOSE_LAYER, var_48_1.mediator)
	else
		originalPrint("------活动id为" .. arg_48_2.id .. "类型为" .. arg_48_2:getConfig("type") .. "的页面不存在")
	end
end

function var_0_0.getBonusWindow(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = arg_49_0._tf:Find(arg_49_1)

	if not var_49_0 then
		PoolMgr.GetInstance():GetUI("ActivitybonusWindow", true, function(arg_50_0)
			SetParent(arg_50_0, arg_49_0._tf, false)

			arg_50_0.name = arg_49_1

			arg_49_2(arg_50_0)
		end)
	else
		arg_49_2(var_49_0)
	end
end

function var_0_0.ShowWindow(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_1.__cname

	if not arg_51_0.windowList[var_51_0] then
		arg_51_0:getBonusWindow(var_51_0, function(arg_52_0)
			arg_51_0.windowList[var_51_0] = arg_51_1.New(tf(arg_52_0), arg_51_0)

			arg_51_0.windowList[var_51_0]:Show(arg_51_2)
		end)
	else
		arg_51_0.windowList[var_51_0]:Show(arg_51_2)
	end
end

function var_0_0.HideWindow(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.__cname

	if not arg_53_0.windowList[var_53_0] then
		return
	end

	arg_53_0.windowList[var_53_0]:Hide()
end

function var_0_0.ShowAwardWindow(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4)
	arg_54_0.awardWindow:ExecuteAction("Flush", arg_54_1, arg_54_2, arg_54_3, arg_54_4)
end

function var_0_0.OnChargeSuccess(arg_55_0, arg_55_1)
	arg_55_0.chargeTipWindow:ExecuteAction("Show", arg_55_1)
end

function var_0_0.willExit(arg_56_0)
	arg_56_0.switchCount = nil
	arg_56_0.shareData = nil

	for iter_56_0, iter_56_1 in pairs(arg_56_0.pageDic) do
		iter_56_1:Destroy()
	end

	for iter_56_2, iter_56_3 in pairs(arg_56_0.windowList) do
		iter_56_3:Dispose()
	end

	if arg_56_0.awardWindow then
		arg_56_0.awardWindow:Destroy()

		arg_56_0.awardWindow = nil
	end

	if arg_56_0.chargeTipWindow then
		arg_56_0.chargeTipWindow:Destroy()

		arg_56_0.chargeTipWindow = nil
	end
end

return var_0_0
