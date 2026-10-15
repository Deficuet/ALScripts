local var_0_0 = class("WindFogCorridorSkinPage", import("view.activity.CorePage.CoreLoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.prog = arg_1_0.bg:Find("total_progress/prog")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.btnDetail = arg_1_0.bg:Find("btn_detail")
	arg_1_0.getBtn = arg_1_0.bg:Find("btn_get_pt")
	arg_1_0.getBtnGray = arg_1_0.bg:Find("btn_get_pt_gray")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.nday = 0
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.clientConfig = arg_2_0.activity:getConfig("config_client")
	arg_2_0.taskGroup = arg_2_0.clientConfig.show_task

	local var_2_0 = getProxy(ActivityProxy):getActivityById(arg_2_0.clientConfig.ptActId)

	arg_2_0.ptData = ActivityPtData.New(var_2_0)

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	var_0_0.super.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.btnDetail, function()
		arg_3_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			blur = true,
			isBtnActive = true,
			type = arg_3_0.ptData.type,
			dropList = arg_3_0.ptData.dropList,
			targets = arg_3_0.ptData.targets,
			level = arg_3_0.ptData.level,
			count = arg_3_0.ptData.count,
			resId = arg_3_0.ptData.resId,
			resDrop = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = arg_3_0.ptData.resId
			}),
			unlockStamps = arg_3_0.ptData:GetDayUnlockStamps(),
			ptActId = arg_3_0.clientConfig.ptActId
		})
	end)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		if not arg_3_0.ptData or arg_3_0.ptData:GetMaxAvailableTargetIndex() == arg_3_0.ptData:GetLevel() then
			return
		end

		local var_5_0 = {}
		local var_5_1 = getProxy(PlayerProxy):getRawData()
		local var_5_2 = pg.gameset.urpt_chapter_max.description[1]
		local var_5_3 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_5_2)
		local var_5_4 = arg_3_0.ptData:GetAllAvailableAwards()
		local var_5_5, var_5_6 = Task.StaticJudgeOverflow(var_5_1.gold, var_5_1.oil, var_5_3, true, true, var_5_4)

		if var_5_5 then
			table.insert(var_5_0, function(arg_6_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_5_6,
					onYes = arg_6_0
				})
			end)
		end

		seriesAsync(var_5_0, function()
			local var_7_0 = arg_3_0.ptData:GetCurrTarget()

			arg_3_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 4,
				activity_id = arg_3_0.ptData:GetId(),
				arg1 = var_7_0
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_8_0)
	arg_8_0.nday = arg_8_0:getTaskIdx(arg_8_0.activity)

	if not table.contains(arg_8_0.taskGroup[arg_8_0.nday], arg_8_0.clientConfig.daily_task) then
		table.insert(arg_8_0.taskGroup[arg_8_0.nday], 2, arg_8_0.clientConfig.daily_task)
	end

	if not table.contains(arg_8_0.taskGroup[arg_8_0.nday], arg_8_0.clientConfig.once_task) then
		table.insert(arg_8_0.taskGroup[arg_8_0.nday], 4, arg_8_0.clientConfig.once_task)
	end

	if arg_8_0.prog then
		local var_8_0, var_8_1 = arg_8_0:GetPtColor()
		local var_8_2 = var_8_0 and setColorStr(arg_8_0.ptData.count, var_8_0) or arg_8_0.ptData.count
		local var_8_3 = var_8_1 and setColorStr("/" .. arg_8_0.ptData:GetTotalResRequire(), var_8_1) or "/" .. arg_8_0.ptData:GetTotalResRequire()

		setText(arg_8_0.prog, var_8_2 .. var_8_3)
	end

	arg_8_0.uilist:align(#arg_8_0.taskGroup[arg_8_0.nday])
	setActive(arg_8_0.getBtnGray, arg_8_0.ptData:GetMaxAvailableTargetIndex() == arg_8_0.ptData:GetLevel())
	setActive(arg_8_0.getBtn, arg_8_0.ptData:GetMaxAvailableTargetIndex() ~= arg_8_0.ptData:GetLevel())
end

function var_0_0.getTaskIdx(arg_9_0, arg_9_1)
	local var_9_0 = 1
	local var_9_1 = arg_9_1:getNDay()
	local var_9_2 = #arg_9_0.taskGroup
	local var_9_3 = math.min(var_9_1, var_9_2)
	local var_9_4 = true

	for iter_9_0 = 1, var_9_3 do
		if not var_9_4 then
			break
		end

		var_9_0 = iter_9_0

		if iter_9_0 < var_9_3 then
			for iter_9_1, iter_9_2 in ipairs(arg_9_0.taskGroup[iter_9_0]) do
				if iter_9_2 ~= arg_9_0.clientConfig.daily_task and iter_9_2 ~= arg_9_0.clientConfig.once_task and not arg_9_0:isTaskFinished(iter_9_2) then
					var_9_4 = false

					break
				end
			end
		end
	end

	return math.min(var_9_0, var_9_2)
end

function var_0_0.isTaskFinished(arg_10_0, arg_10_1)
	if not arg_10_0.taskProxy then
		arg_10_0.taskProxy = getProxy(TaskProxy)
	end

	local var_10_0 = arg_10_0.taskProxy:getTaskById(arg_10_1) or arg_10_0.taskProxy:getFinishTaskById(arg_10_1)

	return var_10_0 and var_10_0:getTaskStatus() == 2
end

function var_0_0.GetPtColor(arg_11_0)
	return "#864749", "#f29b76"
end

return var_0_0
