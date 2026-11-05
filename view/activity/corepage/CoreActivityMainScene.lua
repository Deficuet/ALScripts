local var_0_0 = class("CoreActivityMainScene", import("view.activity.ActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return nil
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {}

	if arg_2_0:IsImageTgName() then
		local var_2_1 = getProxy(ActivityProxy):getCorePanelActivities(arg_2_0.contextData.coreName)

		for iter_2_0, iter_2_1 in ipairs(var_2_1) do
			local var_2_2 = string.lower(iter_2_1:getConfig("title_res_tag"))
			local var_2_3 = "coreactivityuitable/" .. var_2_2 .. "_text"
			local var_2_4 = "coreactivityuitable/" .. var_2_2 .. "_text_selected"

			table.insert(var_2_0, var_2_3)
			table.insert(var_2_0, var_2_4)
		end
	end

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))

	return var_2_0
end

var_0_0.optionsPath = {
	"adapt/top/btn_home"
}

function var_0_0.PlayBGM(arg_3_0)
	return
end

function var_0_0.init(arg_4_0)
	arg_4_0.btnBack = arg_4_0._tf:Find("adapt/top/btn_back")
	arg_4_0.btnSkin = arg_4_0._tf:Find("adapt/btn_skin")
	arg_4_0.pageContainer = arg_4_0._tf:Find("page_list")
	arg_4_0.tabs = arg_4_0._tf:Find("adapt/tabs")
	arg_4_0.windowList = {}
	arg_4_0.awardWindow = AwardWindow.New(arg_4_0._tf, arg_4_0.event)
	arg_4_0.chargeTipWindow = ChargeTipWindow.New(arg_4_0._tf, arg_4_0.event)
	arg_4_0.tabsList = UIItemList.New(arg_4_0.tabs, arg_4_0.tabs:GetChild(0))

	arg_4_0.tabsList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = underscore.detect(arg_4_0.activities, function(arg_6_0)
				return tostring(arg_6_0:getConfig("is_show")) == arg_5_2.name
			end)

			if not var_5_0 or var_5_0:isEnd() then
				setActive(arg_5_2, false)
			elseif not arg_4_0.pageDic[var_5_0.id] then
				warning(string.format("without page in act:", var_5_0.id))
			else
				local var_5_1 = arg_4_0.pageDic[var_5_0.id]
				local var_5_2 = arg_5_2:Find("tip")
				local var_5_3 = var_5_1:IsShowReminder()

				if var_5_3 == nil then
					setActive(var_5_2, var_5_0:readyToAchieve())
				else
					setActive(var_5_2, var_5_3)
				end

				onToggle(arg_4_0, arg_5_2, function(arg_7_0)
					if arg_7_0 then
						arg_4_0:selectActivity(var_5_0)
					end
				end, SFX_PANEL)
			end
		end
	end)

	arg_4_0.switchCount = 0
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:bind(var_0_0.UPDATE_ACTIVITY, function(arg_9_0, arg_9_1)
		arg_8_0:updateActivity(arg_9_1)
	end)
	arg_8_0:bind(var_0_0.GET_PAGE_BGM, function(arg_10_0, arg_10_1, arg_10_2)
		arg_10_2.bgm = arg_8_0:getBGM(arg_10_1) or arg_8_0:getBGM()
	end)
	arg_8_0:bind(var_0_0.FLUSH_TABS, function()
		arg_8_0:flushTabs()
	end)
	onButton(arg_8_0, arg_8_0.btnBack, function()
		arg_8_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)

	if arg_8_0.btnSkin then
		onButton(arg_8_0, arg_8_0.btnSkin, function()
			arg_8_0:emit(ActivityMediator.GO_CHANGE_SHOP)
		end, SFX_PANEL)
	end

	arg_8_0:emit(ActivityMediator.SHOW_NEXT_ACTIVITY, arg_8_0.contextData.coreName)
end

function var_0_0.setActivities(arg_14_0, arg_14_1)
	arg_14_0.activities = underscore.filter(arg_14_1 or {}, function(arg_15_0)
		return not arg_15_0:isEnd()
	end)
	arg_14_0.shareData = arg_14_0.shareData or ActivityShareData.New()
	arg_14_0.pageDic = arg_14_0.pageDic or {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.activities) do
		arg_14_0:instanceActivityPage(iter_14_1)
	end

	table.sort(arg_14_0.activities, CompareFuncs({
		function(arg_16_0)
			return arg_16_0:getShowPriority()
		end,
		function(arg_17_0)
			return -arg_17_0.id
		end
	}))
	arg_14_0:flushTabs()
end

function var_0_0.updateActivity(arg_18_0, arg_18_1)
	if ActivityConst.PageIdLink[arg_18_1.id] then
		arg_18_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.PageIdLink[arg_18_1.id])
	end

	if arg_18_1:isShow() and arg_18_1:isCorePage(arg_18_0.contextData.coreName) and not arg_18_1:isEnd() then
		arg_18_0.activities[arg_18_0:getActivityIndex(arg_18_1.id) or #arg_18_0.activities + 1] = arg_18_1

		table.sort(arg_18_0.activities, CompareFuncs({
			function(arg_19_0)
				return arg_19_0:getShowPriority()
			end,
			function(arg_20_0)
				return -arg_20_0.id
			end
		}))

		if not arg_18_0.pageDic[arg_18_1.id] then
			arg_18_0:instanceActivityPage(arg_18_1)
		end

		arg_18_0:flushTabs()

		if arg_18_0.activity and arg_18_0.activity.id == arg_18_1.id then
			arg_18_0.activity = arg_18_1

			arg_18_0.pageDic[arg_18_1.id]:ActionInvoke("Flush", arg_18_1)
			arg_18_0:verifyTabs(arg_18_0.activity.id)
		end
	end
end

function var_0_0.instanceActivityPage(arg_21_0, arg_21_1)
	var_0_0.super.instanceActivityPage(arg_21_0, arg_21_1)

	for iter_21_0, iter_21_1 in pairs(arg_21_0.pageDic) do
		iter_21_1:SetCoreActivityUI(arg_21_0)
	end
end

function var_0_0.updateEntrances(arg_22_0)
	return
end

function var_0_0.flushTabs(arg_23_0)
	arg_23_0.tabsList:align(arg_23_0.tabs.childCount)
end

function var_0_0.IsImageTgName(arg_24_0)
	return false
end

function var_0_0.OnToggleName(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_2:getConfig("title_res_tag")
	local var_25_1 = "coreactivityuitable/" .. var_25_0 .. "_text"
	local var_25_2 = "coreactivityuitable/" .. var_25_0 .. "_text_selected"

	setText(arg_25_1:Find("on/name"), i18n(var_25_0))
	setText(arg_25_1:Find("off/name"), i18n(var_25_0))

	local var_25_3 = arg_25_0:IsImageTgName()
	local var_25_4 = checkABExist(var_25_1)
	local var_25_5 = checkABExist(var_25_2)

	setActive(arg_25_1:Find("off/imgName"), var_25_3 and var_25_4)
	setActive(arg_25_1:Find("off/name"), not var_25_3 or not var_25_4)
	setActive(arg_25_1:Find("on/imgName"), var_25_3 and var_25_5)
	setActive(arg_25_1:Find("on/name"), not var_25_3 or not var_25_5)

	if arg_25_0:IsImageTgName() then
		local var_25_6 = string.lower(var_25_0)

		if var_25_4 then
			setImageSprite(arg_25_1:Find("off/imgName"), GetSpriteFromAtlas(var_25_1, ""), true)
		end

		if var_25_5 then
			setImageSprite(arg_25_1:Find("on/imgName"), GetSpriteFromAtlas(var_25_2, ""), true)
		end
	end
end

function var_0_0.selectActivity(arg_26_0, arg_26_1)
	if arg_26_0.nextActivity == arg_26_1 or not arg_26_0.nextActivity and arg_26_0.activity and arg_26_1.id == arg_26_0.activity.id then
		return
	end

	local var_26_0 = {}

	if arg_26_0.activity and not arg_26_0.nextActivity then
		arg_26_0.switchCount = arg_26_0.switchCount + 1

		table.insert(var_26_0, function(arg_27_0)
			arg_26_0.pageDic[arg_26_0.activity.id]:ActionInvoke("SwitchOut", function()
				arg_26_0.switchCount = arg_26_0.switchCount - 1

				arg_27_0()
			end)
		end)
	end

	if not arg_26_0.activity or arg_26_0.activity.id ~= arg_26_1.id then
		local var_26_1 = arg_26_0.pageDic[arg_26_1.id]

		assert(var_26_1, "找不到id:" .. arg_26_1.id .. "的活动页，请检查")

		arg_26_0.switchCount = arg_26_0.switchCount + 1

		table.insert(var_26_0, function(arg_29_0)
			var_26_1:Load()
			var_26_1:ActionInvoke("ShowOrHide", false)
			var_26_1:CallbackInvoke(function()
				arg_26_0.switchCount = arg_26_0.switchCount - 1

				arg_29_0()
			end)
		end)
	end

	arg_26_0.nextActivity = arg_26_1

	parallelAsync(var_26_0, function()
		if arg_26_0.switchCount > 0 then
			return
		end

		if arg_26_0.activity then
			arg_26_0.pageDic[arg_26_0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		arg_26_0.activity = arg_26_0.nextActivity
		arg_26_0.contextData.id = arg_26_0.nextActivity.id
		arg_26_0.nextActivity = nil

		local var_31_0 = arg_26_0.pageDic[arg_26_0.activity.id]

		var_31_0:ActionInvoke("ShowOrHide", true)
		var_31_0:ActionInvoke("Flush", arg_26_0.activity)

		local var_31_1 = table.indexof(arg_26_0.activities, arg_26_0.activity)

		arg_26_0:OnPageSwitchDone(var_31_0, var_31_1)
	end)
end

function var_0_0.OnPageSwitchDone(arg_32_0, arg_32_1, arg_32_2)
	return
end

function var_0_0.verifyTabs(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.activities[arg_33_0:getActivityIndex(arg_33_1) or arg_33_0:getActivityIndex(arg_33_0:GetActiveActivity()) or 1]

	if var_33_0 == nil then
		return
	end

	local var_33_1 = var_33_0:getConfig("is_show")
	local var_33_2 = arg_33_0.tabs:Find(tostring(var_33_1))

	if var_33_2 then
		triggerToggle(var_33_2, true)
	end
end

function var_0_0.GetActiveActivity(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.activities) do
		if not iter_34_1:isEnd() then
			return iter_34_1.id
		end
	end
end

function var_0_0.GetActivityIdByPageClass(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in ipairs(arg_35_0.activities or {}) do
		local var_35_0 = iter_35_1:getConfig("page_info")

		if var_35_0 and var_35_0.class_name == arg_35_1 then
			return iter_35_1.id
		end
	end

	return nil
end

function var_0_0.onBackPressed(arg_36_0)
	local var_36_0 = arg_36_0.pageDic[arg_36_0.activity.id]

	if var_36_0:IsShowingPopWindow() then
		var_36_0:ClosePopWindow()

		return
	end

	var_0_0.super.onBackPressed(arg_36_0)
end

function var_0_0.getActClass(arg_37_0, arg_37_1)
	return _G[arg_37_1]
end

return var_0_0
