local var_0_0 = class("PSSHei5TaskPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "PSSHei5TaskPage"
end

function var_0_0.UpdateActivity(arg_2_0, arg_2_1)
	arg_2_0.activity = arg_2_1 or getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5)

	for iter_2_0, iter_2_1 in pairs(arg_2_0.activity:GetHei5Info()) do
		arg_2_0[iter_2_0] = iter_2_1
	end

	arg_2_0.taskGroupList = {}

	local var_2_0 = pg.TimeMgr.GetInstance():GetServerDay(arg_2_0.activity:getStartTime())

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.activity:getConfig("config_data")) do
		local var_2_1 = pg.black_friday_battlepass_task_group[iter_2_3]

		arg_2_0.taskGroupList[var_2_1.group_mask] = {
			task_group = var_2_1.task_group,
			isLock = var_2_0 < var_2_1.group_mask
		}
	end

	updateCrusingHei5ActivityTask(arg_2_0.activity)

	arg_2_0.finishAll = arg_2_0.phase == #arg_2_0.awardList
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0:UpdateActivity()

	local var_3_0 = arg_3_0._tf:Find("frame")

	arg_3_0.togglesTF = var_3_0:Find("week_list")
	arg_3_0.toggleCount = arg_3_0.togglesTF:Find("count")

	local var_3_1 = var_3_0:Find("view/content")
	local var_3_2 = var_3_1:Find("tpl")

	setText(var_3_2:Find("info/go/Text"), i18n("task_go"))
	setText(var_3_2:Find("info/get/Text"), i18n("task_get"))
	setText(var_3_2:Find("info/got/Image/Text"), i18n("task_got"))

	arg_3_0.taskGroupItemList = UIItemList.New(var_3_1, var_3_2)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.taskGroupItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		arg_5_1 = arg_5_1 + 1

		if arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateTaskGroup(arg_5_2, arg_4_0.tempTaskGroup[arg_5_1])
		end
	end)
end

function var_0_0.Flush(arg_6_0, arg_6_1)
	if arg_6_1 then
		arg_6_0:UpdateActivity(arg_6_1)
	end

	local var_6_0 = getProxy(TaskProxy)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.taskGroupList) do
		local var_6_1

		if iter_6_0 == 0 then
			var_6_1 = arg_6_0._tf:Find("frame/" .. iter_6_0)
		else
			var_6_1 = arg_6_0.toggleCount:Find(iter_6_0)
		end

		if iter_6_0 > 0 then
			setText(var_6_1:Find("off/Text"), i18n("blackfriday_cruise_task_day", iter_6_0))
			setText(var_6_1:Find("on/Text"), i18n("blackfriday_cruise_task_day", iter_6_0))
		end

		setActive(var_6_1:Find("tip"), not iter_6_1.isLock and PlayerPrefs.GetInt(string.format("cursing_%d_task_week_%d", arg_6_0.activity.id, iter_6_0), 0) == 0)
		onToggle(arg_6_0, var_6_1, function(arg_7_0)
			if arg_7_0 then
				setActive(var_6_1:Find("tip"), false)
				PlayerPrefs.SetInt(string.format("cursing_%d_task_week_%d", arg_6_0.activity.id, iter_6_0), 1)

				arg_6_0.weekToggle = iter_6_0
				arg_6_0.contextData.weekToggle = iter_6_0
				arg_6_0.tempTaskGroup = underscore.map(iter_6_1.task_group, function(arg_8_0)
					return underscore.map(arg_8_0, function(arg_9_0)
						assert(var_6_0:getTaskVO(arg_9_0), "without this task:" .. arg_9_0)

						return var_6_0:getTaskVO(arg_9_0)
					end)
				end)

				table.sort(arg_6_0.tempTaskGroup, CompareFuncs({
					function(arg_10_0)
						return underscore.all(arg_10_0, function(arg_11_0)
							return arg_11_0:isReceive()
						end) and 1 or 0
					end,
					function(arg_12_0)
						return arg_12_0[1].id
					end
				}))
				arg_6_0.taskGroupItemList:align(#arg_6_0.tempTaskGroup)
			end
		end, SFX_PANEL)

		if var_6_1:Find("mask") then
			setActive(var_6_1:Find("mask"), iter_6_1.isLock)
		end
	end

	local var_6_2 = underscore.keys(arg_6_0.taskGroupList)

	table.sort(var_6_2, function(arg_13_0, arg_13_1)
		return arg_13_0 < arg_13_1
	end)

	if arg_6_0.contextData.weekToggle and not arg_6_0.taskGroupList[arg_6_0.contextData.weekToggle].isLock then
		arg_6_0.weekToggle = arg_6_0.contextData.weekToggle
		arg_6_0.contextData.weekToggle = nil
	else
		arg_6_0.weekToggle = table.remove(var_6_2, 1)

		for iter_6_2, iter_6_3 in ipairs(var_6_2) do
			local var_6_3 = arg_6_0.taskGroupList[iter_6_3]

			if var_6_3.isLock then
				break
			elseif underscore.any(underscore.flatten(var_6_3.task_group), function(arg_14_0)
				local var_14_0 = var_6_0:getTaskVO(arg_14_0)

				return var_14_0 and not var_14_0:isReceive()
			end) then
				arg_6_0.weekToggle = iter_6_3

				break
			end
		end
	end

	if arg_6_0.weekToggle == 0 then
		triggerToggle(arg_6_0._tf:Find("frame/0"), true)
	else
		triggerToggle(arg_6_0.toggleCount:Find(arg_6_0.weekToggle), true)
	end

	for iter_6_4, iter_6_5 in ipairs(arg_6_0.taskGroupList) do
		local var_6_4 = arg_6_0.toggleCount:Find(iter_6_4)

		SetCompomentEnabled(var_6_4, typeof(Toggle), not iter_6_5.isLock)

		if not iter_6_5.isLock then
			setGray(var_6_4, underscore.all(underscore.flatten(iter_6_5.task_group), function(arg_15_0)
				local var_15_0 = var_6_0:getTaskVO(arg_15_0)

				return var_15_0 and var_15_0:isReceive()
			end))
		end
	end

	arg_6_0:Show()
end

function var_0_0.UpdateTaskGroup(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_1:Find("info")
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_2) do
		if not iter_16_1:isReceive() then
			table.insert(var_16_1, iter_16_1)
		end
	end

	local var_16_2 = #var_16_1 > 0 and table.remove(var_16_1, 1) or arg_16_2[#arg_16_2]

	arg_16_0:UpdateTaskDisplay(var_16_0, var_16_2)
end

function var_0_0.UpdateTaskDisplay(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_2:getProgress()
	local var_17_1 = arg_17_2:getConfig("target_num")

	setText(arg_17_1:Find("desc"), string.format("%s(%d/%d)", arg_17_2:getConfig("desc"), var_17_0, var_17_1))

	local var_17_2 = Drop.Create(arg_17_2:getConfig("award_display")[1])
	local var_17_3 = arg_17_0.finishAll and 2 or arg_17_2:getTaskStatus()

	setActive(arg_17_1:Find("go"), var_17_3 == 0)
	setActive(arg_17_1:Find("get"), var_17_3 == 1)
	setActive(arg_17_1:Find("got"), var_17_3 == 2)
	setText(arg_17_1:Find("go/Text"), i18n("island_word_go"))
	setText(arg_17_1:Find("get/Text"), i18n("handbook_research_final_task_btn_claim"))
	setText(arg_17_1:Find("got/Image/Text"), i18n("handbook_research_final_task_btn_finished"))

	local var_17_4 = Drop.Create(arg_17_2:getConfig("award_display")[1])

	setText(arg_17_1:Find("icon/num"), "X" .. arg_17_2:getConfig("award_display")[1][3])
	setImageSprite(arg_17_1:Find("icon"), LoadSprite("ui/PSSHei5UI_atlas", "battlepass_blackfriday"), false)
	onButton(arg_17_0, arg_17_1:Find("icon"), function()
		arg_17_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_17_4
		})
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_1:Find("go"), function()
		arg_17_0:emit(PSSHei5Mediator.ON_TASK_GO, arg_17_2)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_1:Find("get"), function()
		arg_17_0:emit(PSSHei5Mediator.ON_TASK_SUBMIT, arg_17_2)
	end, SFX_CONFIRM)
end

function var_0_0.OnDestroy(arg_21_0)
	return
end

return var_0_0
