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

			if not var_4_0 or not arg_3_0.pageDic[var_4_0.id] then
				warning(arg_4_2.name, var_4_0.id)

				return
			end

			if arg_3_0.pageDic[var_4_0.id] ~= nil then
				local var_4_1 = arg_3_0:findTF("tip", arg_4_2)

				setActive(var_4_1, var_4_0:readyToAchieve())
				onToggle(arg_3_0, arg_4_2, function(arg_6_0)
					if arg_6_0 then
						arg_3_0:selectActivity(var_4_0)
					end
				end, SFX_PANEL)
			end
		end
	end)
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
	onButton(arg_7_0, arg_7_0.btnSkin, function()
		arg_7_0:emit(ActivityMediator.GO_CHANGE_SHOP)
	end, SFX_PANEL)
	arg_7_0:emit(ActivityMediator.SHOW_NEXT_ACTIVITY)
end

function var_0_0.setActivities(arg_13_0, arg_13_1)
	arg_13_0.activities = arg_13_1 or {}
	arg_13_0.shareData = arg_13_0.shareData or ActivityShareData.New()
	arg_13_0.pageDic = arg_13_0.pageDic or {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		arg_13_0:instanceActivityPage(iter_13_1)
	end

	arg_13_0.activity = nil

	table.sort(arg_13_0.activities, CompareFuncs({
		function(arg_14_0)
			return -arg_14_0:getShowPriority()
		end,
		function(arg_15_0)
			return -arg_15_0.id
		end
	}))
	arg_13_0:flushTabs()
end

function var_0_0.updateActivity(arg_16_0, arg_16_1)
	if ActivityConst.PageIdLink[arg_16_1.id] then
		arg_16_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.PageIdLink[arg_16_1.id])
	end

	if arg_16_1:isShow() and arg_16_1:isCorePage(arg_16_0.contextData.coreName) and not arg_16_1:isEnd() then
		arg_16_0.activities[arg_16_0:getActivityIndex(arg_16_1.id) or #arg_16_0.activities + 1] = arg_16_1

		table.sort(arg_16_0.activities, CompareFuncs({
			function(arg_17_0)
				return -arg_17_0:getShowPriority()
			end,
			function(arg_18_0)
				return -arg_18_0.id
			end
		}))

		if not arg_16_0.pageDic[arg_16_1.id] then
			arg_16_0:instanceActivityPage(arg_16_1)
		end

		arg_16_0:flushTabs()

		if arg_16_0.activity and arg_16_0.activity.id == arg_16_1.id then
			arg_16_0.activity = arg_16_1

			arg_16_0.pageDic[arg_16_1.id]:ActionInvoke("Flush", arg_16_1)
		end
	end
end

function var_0_0.updateEntrances(arg_19_0)
	return
end

function var_0_0.flushTabs(arg_20_0)
	arg_20_0.tabsList:align(#arg_20_0.activities)
end

function var_0_0.selectActivity(arg_21_0, arg_21_1)
	if arg_21_1 and (not arg_21_0.activity or arg_21_0.activity.id ~= arg_21_1.id) then
		local var_21_0 = arg_21_0.pageDic[arg_21_1.id]

		assert(var_21_0, "找不到id:" .. arg_21_1.id .. "的活动页，请检查")
		var_21_0:Load()
		var_21_0:ActionInvoke("Flush", arg_21_1)
		var_21_0:ActionInvoke("ShowOrHide", true)

		if arg_21_0.activity and arg_21_0.activity.id ~= arg_21_1.id then
			arg_21_0.pageDic[arg_21_0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		arg_21_0.activity = arg_21_1
		arg_21_0.contextData.id = arg_21_1.id
	end
end

function var_0_0.verifyTabs(arg_22_0, arg_22_1)
	local var_22_0 = underscore.detect(arg_22_0.activities, function(arg_23_0)
		return arg_23_0.id == arg_22_1
	end)
	local var_22_1 = var_22_0 and var_22_0:getConfig("is_show") or 1
	local var_22_2 = arg_22_0.tabs:Find(tostring(var_22_1))

	triggerToggle(var_22_2, true)
end

function var_0_0.getActClass(arg_24_0, arg_24_1)
	return _G[arg_24_1]
end

return var_0_0
