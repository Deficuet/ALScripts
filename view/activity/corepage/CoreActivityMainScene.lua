local var_0_0 = class("CoreActivityMainScene", import("view.activity.ActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return nil
end

var_0_0.optionsPath = {
	"adapt/top/btn_home"
}

function var_0_0.PlayBGM(arg_2_0)
	return
end

function var_0_0.init(arg_3_0)
	arg_3_0.btnBack = arg_3_0._tf:Find("adapt/top/btn_back")
	arg_3_0.btnSkin = arg_3_0._tf:Find("adapt/btn_skin")
	arg_3_0.pageContainer = arg_3_0._tf:Find("page_list")
	arg_3_0.tabs = arg_3_0._tf:Find("adapt/tabs")
	arg_3_0.windowList = {}
	arg_3_0.awardWindow = AwardWindow.New(arg_3_0._tf, arg_3_0.event)
	arg_3_0.chargeTipWindow = ChargeTipWindow.New(arg_3_0._tf, arg_3_0.event)
	arg_3_0.tabsList = UIItemList.New(arg_3_0.tabs, arg_3_0.tabs:GetChild(0))

	arg_3_0.tabsList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = underscore.detect(arg_3_0.activities, function(arg_5_0)
				return tostring(arg_5_0:getConfig("is_show")) == arg_4_2.name
			end)

			if not var_4_0 or var_4_0:isEnd() then
				setActive(arg_4_2, false)
			elseif not arg_3_0.pageDic[var_4_0.id] then
				warning(string.format("without page in act:", var_4_0.id))
			else
				local var_4_1 = arg_3_0.pageDic[var_4_0.id]
				local var_4_2 = arg_4_2:Find("tip")
				local var_4_3 = var_4_1:IsShowReminder()

				if var_4_3 == nil then
					setActive(var_4_2, var_4_0:readyToAchieve())
				else
					setActive(var_4_2, var_4_3)
				end

				onToggle(arg_3_0, arg_4_2, function(arg_6_0)
					if arg_6_0 then
						arg_3_0:selectActivity(var_4_0)
					end
				end, SFX_PANEL)
			end
		end
	end)

	arg_3_0.switchCount = 0
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:bind(var_0_0.UPDATE_ACTIVITY, function(arg_8_0, arg_8_1)
		arg_7_0:updateActivity(arg_8_1)
	end)
	arg_7_0:bind(var_0_0.GET_PAGE_BGM, function(arg_9_0, arg_9_1, arg_9_2)
		arg_9_2.bgm = arg_7_0:getBGM(arg_9_1) or arg_7_0:getBGM()
	end)
	arg_7_0:bind(var_0_0.FLUSH_TABS, function()
		arg_7_0:flushTabs()
	end)
	onButton(arg_7_0, arg_7_0.btnBack, function()
		arg_7_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)

	if arg_7_0.btnSkin then
		onButton(arg_7_0, arg_7_0.btnSkin, function()
			arg_7_0:emit(ActivityMediator.GO_CHANGE_SHOP)
		end, SFX_PANEL)
	end

	arg_7_0:emit(ActivityMediator.SHOW_NEXT_ACTIVITY, arg_7_0.contextData.coreName)
end

function var_0_0.setActivities(arg_13_0, arg_13_1)
	arg_13_0.activities = underscore.filter(arg_13_1 or {}, function(arg_14_0)
		return not arg_14_0:isEnd()
	end)
	arg_13_0.shareData = arg_13_0.shareData or ActivityShareData.New()
	arg_13_0.pageDic = arg_13_0.pageDic or {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.activities) do
		arg_13_0:instanceActivityPage(iter_13_1)
	end

	table.sort(arg_13_0.activities, CompareFuncs({
		function(arg_15_0)
			return arg_15_0:getShowPriority()
		end,
		function(arg_16_0)
			return -arg_16_0.id
		end
	}))
	arg_13_0:flushTabs()
end

function var_0_0.updateActivity(arg_17_0, arg_17_1)
	if ActivityConst.PageIdLink[arg_17_1.id] then
		arg_17_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.PageIdLink[arg_17_1.id])
	end

	if arg_17_1:isShow() and arg_17_1:isCorePage(arg_17_0.contextData.coreName) and not arg_17_1:isEnd() then
		arg_17_0.activities[arg_17_0:getActivityIndex(arg_17_1.id) or #arg_17_0.activities + 1] = arg_17_1

		table.sort(arg_17_0.activities, CompareFuncs({
			function(arg_18_0)
				return -arg_18_0:getShowPriority()
			end,
			function(arg_19_0)
				return -arg_19_0.id
			end
		}))

		if not arg_17_0.pageDic[arg_17_1.id] then
			arg_17_0:instanceActivityPage(arg_17_1)
		end

		arg_17_0:flushTabs()

		if arg_17_0.activity and arg_17_0.activity.id == arg_17_1.id then
			arg_17_0.activity = arg_17_1

			arg_17_0.pageDic[arg_17_1.id]:ActionInvoke("Flush", arg_17_1)
			arg_17_0:verifyTabs(arg_17_0.activity.id)
		end
	end
end

function var_0_0.instanceActivityPage(arg_20_0, arg_20_1)
	var_0_0.super.instanceActivityPage(arg_20_0, arg_20_1)

	for iter_20_0, iter_20_1 in pairs(arg_20_0.pageDic) do
		iter_20_1:SetCoreActivityUI(arg_20_0)
	end
end

function var_0_0.updateEntrances(arg_21_0)
	return
end

function var_0_0.flushTabs(arg_22_0)
	arg_22_0.tabsList:align(arg_22_0.tabs.childCount)
end

function var_0_0.selectActivity(arg_23_0, arg_23_1)
	if arg_23_0.nextActivity == arg_23_1 or not arg_23_0.nextActivity and arg_23_0.activity and arg_23_1.id == arg_23_0.activity.id then
		return
	end

	local var_23_0 = {}

	if arg_23_0.activity and not arg_23_0.nextActivity then
		arg_23_0.switchCount = arg_23_0.switchCount + 1

		table.insert(var_23_0, function(arg_24_0)
			arg_23_0.pageDic[arg_23_0.activity.id]:ActionInvoke("SwitchOut", function()
				arg_23_0.switchCount = arg_23_0.switchCount - 1

				arg_24_0()
			end)
		end)
	end

	if not arg_23_0.activity or arg_23_0.activity.id ~= arg_23_1.id then
		local var_23_1 = arg_23_0.pageDic[arg_23_1.id]

		assert(var_23_1, "找不到id:" .. arg_23_1.id .. "的活动页，请检查")

		arg_23_0.switchCount = arg_23_0.switchCount + 1

		table.insert(var_23_0, function(arg_26_0)
			var_23_1:Load()
			var_23_1:ActionInvoke("ShowOrHide", false)
			var_23_1:CallbackInvoke(function()
				arg_23_0.switchCount = arg_23_0.switchCount - 1

				arg_26_0()
			end)
		end)
	end

	arg_23_0.nextActivity = arg_23_1

	parallelAsync(var_23_0, function()
		if arg_23_0.switchCount > 0 then
			return
		end

		if arg_23_0.activity then
			arg_23_0.pageDic[arg_23_0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		arg_23_0.activity = arg_23_0.nextActivity
		arg_23_0.contextData.id = arg_23_0.nextActivity.id
		arg_23_0.nextActivity = nil

		local var_28_0 = arg_23_0.pageDic[arg_23_0.activity.id]

		var_28_0:ActionInvoke("Flush", arg_23_0.activity)
		var_28_0:ActionInvoke("ShowOrHide", true)
	end)
end

function var_0_0.verifyTabs(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.activities[arg_29_0:getActivityIndex(arg_29_1) or arg_29_0:getActivityIndex(arg_29_0:GetActiveActivity()) or 1]

	if var_29_0 == nil then
		return
	end

	local var_29_1 = var_29_0:getConfig("is_show")
	local var_29_2 = arg_29_0.tabs:Find(tostring(var_29_1))

	triggerToggle(var_29_2, true)
end

function var_0_0.GetActiveActivity(arg_30_0)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0.activities) do
		if not iter_30_1:isEnd() then
			return iter_30_1.id
		end
	end
end

function var_0_0.onBackPressed(arg_31_0)
	local var_31_0 = arg_31_0.pageDic[arg_31_0.activity.id]

	if var_31_0:IsShowingPopWindow() then
		var_31_0:ClosePopWindow()

		return
	end

	var_0_0.super.onBackPressed(arg_31_0)
end

function var_0_0.getActClass(arg_32_0, arg_32_1)
	return _G[arg_32_1]
end

return var_0_0
