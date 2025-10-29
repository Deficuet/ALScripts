local var_0_0 = class("IslandSeasonActivityPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonActivityPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:GetComponent("ItemList").prefabItem:ToTable()

	for iter_2_0, iter_2_1 in ipairs({
		"rtTabsContent",
		"rtTabsTpl",
		"rtPages",
		"rtPagesEmpty"
	}) do
		arg_2_0[iter_2_1] = var_2_0[iter_2_0].transform
	end
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.tabsList = UIItemList.New(arg_3_0.rtTabsContent, arg_3_0.rtTabsTpl)

	arg_3_0.tabsList:make(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_3_0.activities[arg_4_1]
			local var_4_1 = var_4_0 and var_4_0.id or 0

			arg_4_2.name = var_4_1

			if var_4_0 then
				local var_4_2 = var_4_0:getIslandConfig("title_res_tag")

				setText(arg_4_2:Find("on/Text"), var_4_2)
				setText(arg_4_2:Find("off/Text"), var_4_2)
				setActive(arg_4_2:Find("red"), var_4_0:readyToAchieve())
			else
				setText(arg_4_2:Find("on/Text"), i18n("island_no_activity"))
				setText(arg_4_2:Find("on/Text/en"), i18n("island_activity_decorative_word"))
				setText(arg_4_2:Find("off/Text"), i18n("island_no_activity"))
			end

			local var_4_3 = arg_3_0.pageDic[var_4_1]

			onToggle(arg_3_0, arg_4_2, function(arg_5_0)
				if var_4_3 and arg_5_0 then
					arg_3_0:selectActivity(var_4_0)
				end
			end, SFX_PANEL)
		end
	end)

	arg_3_0.switchCount = 0
end

function var_0_0.Show(arg_6_0)
	var_0_0.super.Show(arg_6_0)
	arg_6_0:Flush()
	IslandGuideChecker.CheckGuide("ISLAND_GUIDE_14")
end

function var_0_0.Flush(arg_7_0)
	if not arg_7_0:isShowing() then
		return
	end

	if not arg_7_0.activities then
		arg_7_0:setActivities(getProxy(ActivityProxy):getIslandPanelActivities())
	end

	if arg_7_0.activity then
		arg_7_0.pageDic[arg_7_0.activity.id]:ExecuteAction("ShowOrHide", true)
	else
		arg_7_0:verifyTabs()
	end
end

function var_0_0.verifyTabs(arg_8_0, arg_8_1)
	if #arg_8_0.activities > 0 then
		local var_8_0 = arg_8_0:getActivityIndex(arg_8_1) or 1
		local var_8_1 = arg_8_0.rtTabsContent:GetChild(var_8_0 - 1)

		triggerToggle(var_8_1, true)
	end
end

function var_0_0.getActivityIndex(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.activities) do
		if iter_9_1.id == arg_9_1 then
			return iter_9_0
		end
	end

	return nil
end

function var_0_0.setActivities(arg_10_0, arg_10_1)
	arg_10_0.activities = arg_10_1 or {}
	arg_10_0.shareData = arg_10_0.shareData or ActivityShareData.New()
	arg_10_0.pageDic = arg_10_0.pageDic or {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		arg_10_0:instanceActivityPage(iter_10_1)
	end

	arg_10_0.activity = nil

	table.sort(arg_10_0.activities, CompareFuncs({
		function(arg_11_0)
			return -arg_11_0:getIslandConfig("is_show")
		end,
		function(arg_12_0)
			return -arg_12_0.id
		end
	}))
	arg_10_0:flushTabs()
end

function var_0_0.updateActivity(arg_13_0, arg_13_1)
	if arg_13_1:isIslandShow() and not arg_13_1:isEnd() then
		arg_13_0.activities[arg_13_0:getActivityIndex(arg_13_1.id) or #arg_13_0.activities + 1] = arg_13_1

		table.sort(arg_13_0.activities, CompareFuncs({
			function(arg_14_0)
				return -arg_14_0:getIslandConfig("is_show")
			end,
			function(arg_15_0)
				return -arg_15_0.id
			end
		}))

		if not arg_13_0.pageDic[arg_13_1.id] then
			arg_13_0:instanceActivityPage(arg_13_1)
		end

		arg_13_0:flushTabs()

		if arg_13_0:isShowing() and arg_13_0.activity and arg_13_0.activity.id == arg_13_1.id then
			arg_13_0.activity = arg_13_1

			arg_13_0.pageDic[arg_13_1.id]:ActionInvoke("Flush", arg_13_1)
		end
	end
end

function var_0_0.removeActivity(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:getActivityIndex(arg_16_1)

	if var_16_0 then
		table.remove(arg_16_0.activities, var_16_0)
		arg_16_0.pageDic[arg_16_1]:Destroy()

		arg_16_0.pageDic[arg_16_1] = nil

		arg_16_0:flushTabs()

		if arg_16_0.activity and arg_16_0.activity.id == arg_16_1 then
			arg_16_0.activity = nil

			arg_16_0:verifyTabs()
		end
	end
end

function var_0_0.getActClass(arg_17_0, arg_17_1)
	return import("Mod.Island.View.page.activity." .. arg_17_1)
end

function var_0_0.instanceActivityPage(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1:getIslandConfig("page_info")

	if var_18_0.class_name and not arg_18_0.pageDic[arg_18_1.id] and not arg_18_1:isEnd() then
		local var_18_1 = arg_18_0:getActClass(var_18_0.class_name).New(arg_18_0.rtPages, arg_18_0.event, arg_18_0.contextData)

		if var_18_1:UseSecondPage(arg_18_1) then
			var_18_1:SetUIName(var_18_0.ui_name2)
		else
			var_18_1:SetUIName(var_18_0.ui_name)
		end

		var_18_1:SetShareData(arg_18_0.shareData)

		arg_18_0.pageDic[arg_18_1.id] = var_18_1
	end
end

function var_0_0.flushTabs(arg_19_0)
	setActive(arg_19_0.rtPagesEmpty, #arg_19_0.activities == 0)
	arg_19_0.tabsList:align(math.max(#arg_19_0.activities, 1))
end

function var_0_0.selectActivity(arg_20_0, arg_20_1)
	if arg_20_0.nextActivity == arg_20_1 or not arg_20_0.nextActivity and arg_20_0.activity and arg_20_1.id == arg_20_0.activity.id then
		return
	end

	local var_20_0 = {}

	if arg_20_0.activity and not arg_20_0.nextActivity then
		arg_20_0.switchCount = arg_20_0.switchCount + 1

		table.insert(var_20_0, function(arg_21_0)
			arg_20_0.pageDic[arg_20_0.activity.id]:ActionInvoke("SwitchOut", function()
				arg_20_0.switchCount = arg_20_0.switchCount - 1

				arg_21_0()
			end)
		end)
	end

	if not arg_20_0.activity or arg_20_0.activity.id ~= arg_20_1.id then
		local var_20_1 = arg_20_0.pageDic[arg_20_1.id]

		assert(var_20_1, "找不到id:" .. arg_20_1.id .. "的活动页，请检查")

		arg_20_0.switchCount = arg_20_0.switchCount + 1

		table.insert(var_20_0, function(arg_23_0)
			var_20_1:Load()
			var_20_1:ActionInvoke("ShowOrHide", false)
			var_20_1:CallbackInvoke(function()
				arg_20_0.switchCount = arg_20_0.switchCount - 1

				arg_23_0()
			end)
		end)
	end

	arg_20_0.nextActivity = arg_20_1

	parallelAsync(var_20_0, function()
		if arg_20_0.switchCount > 0 then
			return
		end

		if arg_20_0.activity then
			arg_20_0.pageDic[arg_20_0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		arg_20_0.activity = arg_20_0.nextActivity
		arg_20_0.contextData.id = arg_20_0.nextActivity.id
		arg_20_0.nextActivity = nil

		local var_25_0 = arg_20_0.pageDic[arg_20_0.activity.id]

		var_25_0:ActionInvoke("Flush", arg_20_0.activity)
		var_25_0:ActionInvoke("ShowOrHide", true)
	end)
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0.shareData = nil

	for iter_26_0, iter_26_1 in pairs(arg_26_0.pageDic) do
		iter_26_1:Destroy()
	end

	arg_26_0.pageDic = nil
	arg_26_0.activities = nil
	arg_26_0.switchCount = nil
end

return var_0_0
