local var_0_0 = class("GuildOfficeTaskPage", import("...base.GuildBasePage"))

function var_0_0.getTargetUI(arg_1_0)
	return "GuildOfficeTaskBluePage", "GuildOfficeTaskRedPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.selectTaskPage = GuildOfficeSelectTaskPage.New(arg_2_0._tf.parent, arg_2_0.event)
	arg_2_0.taskTF = arg_2_0:findTF("TaskPanel")
	arg_2_0.taskUnOpenTF = arg_2_0:findTF("TaskPanel/unopen")
	arg_2_0.unOpenAdmin = arg_2_0.taskUnOpenTF:Find("select")
	arg_2_0.unOpenUnAdmin = arg_2_0.taskUnOpenTF:Find("lock")
	arg_2_0.taskOpenTF = arg_2_0:findTF("TaskPanel/open")
	arg_2_0.taskDescTxt = arg_2_0:findTF("top/desc/Text", arg_2_0.taskOpenTF):GetComponent(typeof(Text))
	arg_2_0.taskAwardTxt = arg_2_0:findTF("top/desc1/Text", arg_2_0.taskOpenTF):GetComponent(typeof(Text))
	arg_2_0.taskProgressTxt = arg_2_0:findTF("top/progress", arg_2_0.taskOpenTF):GetComponent(typeof(Text))
	arg_2_0.taskProgressBar = arg_2_0:findTF("top/progress_bar", arg_2_0.taskOpenTF)
	arg_2_0.privateTaskDesc = arg_2_0:findTF("bottom/desc", arg_2_0.taskOpenTF):GetComponent(typeof(Text))
	arg_2_0.privateTaskGetBtn = arg_2_0:findTF("bottom/get", arg_2_0.taskOpenTF)
	arg_2_0.privateTaskAcceptBtn = arg_2_0:findTF("bottom/accept", arg_2_0.taskOpenTF)
	arg_2_0.privateTaskProgressTxt = arg_2_0:findTF("bottom/progress/Text", arg_2_0.taskOpenTF):GetComponent(typeof(Text))
	arg_2_0.privateTaskReapeatFlag = arg_2_0:findTF("bottom/reapeat", arg_2_0.taskOpenTF)
	arg_2_0.privateTaskResTxt = arg_2_0:findTF("bottom/res/Text", arg_2_0.taskOpenTF):GetComponent(typeof(Text))
	arg_2_0.taskMaskAll = arg_2_0:findTF("TaskPanel/open/mask_all")
	arg_2_0.taskMaskTop = arg_2_0:findTF("TaskPanel/open/mask_top")
	arg_2_0.contributionList = UIItemList.New(arg_2_0:findTF("TaskPanel/SubmitPanel/list"), arg_2_0:findTF("TaskPanel/SubmitPanel/list/tpl"))
	arg_2_0.contributionCntTxt = arg_2_0:findTF("TaskPanel/SubmitPanel/cnt/Text"):GetComponent(typeof(Text))
	arg_2_0.supplyFrame = arg_2_0:findTF("TaskPanel/SupplyPanel/frame")
	arg_2_0.supplyOpenTF = arg_2_0:findTF("TaskPanel/SupplyPanel/frame/open")
	arg_2_0.supplyOpenTimeTxt = arg_2_0:findTF("time", arg_2_0.supplyOpenTF):GetComponent(typeof(Text))
	arg_2_0.supplyOpenLetfCntTxt = arg_2_0:findTF("Text", arg_2_0.supplyOpenTF):GetComponent(typeof(Text))
	arg_2_0.supplyOpenGetBtn = arg_2_0:findTF("get", arg_2_0.supplyOpenTF)
	arg_2_0.supplyOpenGotBtn = arg_2_0:findTF("got", arg_2_0.supplyOpenTF)
	arg_2_0.supplyUnOpenTF = arg_2_0:findTF("TaskPanel/SupplyPanel/frame/unopen")
	arg_2_0.supplyUnOpenAdminTF = arg_2_0:findTF("purchase", arg_2_0.supplyUnOpenTF)
	arg_2_0.supplyUnOpenResTF = arg_2_0.supplyUnOpenAdminTF:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.supplyUnOpenLockTF = arg_2_0:findTF("lock", arg_2_0.supplyUnOpenTF)
end

function var_0_0.OnInit(arg_3_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_3_0.taskTF, {
		pbList = {
			arg_3_0.taskTF
		}
	})
	onButton(arg_3_0, arg_3_0.supplyUnOpenAdminTF, function()
		local var_4_0 = arg_3_0.guild:getSupplyConsume()

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_start_supply_consume_tip", var_4_0),
			onYes = function()
				arg_3_0:emit(GuildOfficeMediator.ON_PURCHASE_SUPPLY)
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.supplyOpenGetBtn, function()
		arg_3_0:emit(GuildOfficeMediator.GET_SUPPLY_AWARD)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.supplyFrame, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.guild_supply_help_tip.tip
		})
	end, SFX_PANEL)
end

function var_0_0.Update(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0:OnUpdateGuild(arg_8_1, arg_8_2)
	arg_8_0:UpdateTaskPanel(false)
	arg_8_0:UpdateContributionPanel()
	arg_8_0:UpdateSupplyPanel()
	arg_8_0:Show()
end

function var_0_0.OnUpdateGuild(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.guild = arg_9_1
	arg_9_0.isAdmin = arg_9_2
end

function var_0_0.OnUpdateContribution(arg_10_0)
	arg_10_0:UpdateContributionPanel()
end

function var_0_0.OnUpdateTask(arg_11_0, arg_11_1)
	arg_11_0:UpdateTaskPanel(arg_11_1)
end

function var_0_0.OnUpdateSupplyPanel(arg_12_0)
	arg_12_0:UpdateSupplyPanel()
end

function var_0_0.UpdateTaskPanel(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.guild
	local var_13_1 = var_13_0:getWeeklyTask()
	local var_13_2 = var_13_1:getState()

	if var_13_2 == GuildTask.STATE_EMPTY then
		arg_13_0:UpdateLockTask()
	elseif var_13_2 == GuildTask.STATE_ONGOING or var_13_2 == GuildTask.STATE_FINISHED then
		arg_13_0:UpdatePubliceTask(var_13_1)
		arg_13_0:UpdatePrivateTask(var_13_1)
	end

	setActive(arg_13_0.taskOpenTF, var_13_2 ~= GuildTask.STATE_EMPTY)
	setActive(arg_13_0.taskUnOpenTF, var_13_2 == GuildTask.STATE_EMPTY)

	if arg_13_1 or var_13_0:shouldRefreshWeeklyTaskProgress() then
		arg_13_0:emit(GuildOfficeMediator.UPDATE_WEEKLY_TASK)
	end
end

function var_0_0.UpdateLockTask(arg_14_0)
	setActive(arg_14_0.unOpenAdmin, arg_14_0.isAdmin)
	setActive(arg_14_0.unOpenUnAdmin, not arg_14_0.isAdmin)

	if arg_14_0.isAdmin then
		onButton(arg_14_0, arg_14_0.unOpenAdmin, function()
			arg_14_0.selectTaskPage:ExecuteAction("Show", arg_14_0.guild, arg_14_0.isAdmin)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdatePrivateTask(arg_16_0, arg_16_1)
	local var_16_0 = not arg_16_0.guild:hasWeeklyTaskFlag()
	local var_16_1 = arg_16_1:GetPresonTaskId()
	local var_16_2 = getProxy(TaskProxy)
	local var_16_3 = var_16_2:getTaskById(var_16_1) or var_16_2:getFinishTaskById(var_16_1)
	local var_16_4 = var_16_3 ~= nil

	if not var_16_4 then
		var_16_3 = Task.New({
			id = var_16_1
		})
	end

	arg_16_0.privateTaskDesc.text = var_16_3:getConfig("desc")
	arg_16_0.privateTaskProgressTxt.text = var_16_3.progress .. "/" .. var_16_3:getConfig("target_num")
	arg_16_0.privateTaskResTxt.text = arg_16_1:GetPrivateAward()

	onButton(arg_16_0, arg_16_0.privateTaskAcceptBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_task_accept", arg_16_1:getConfig("name"), var_16_3:getConfig("name"), var_16_3:getConfig("name")),
			onYes = function()
				arg_16_0:emit(GuildOfficeMediator.ON_ACCEPT_TASK, var_16_1)
			end
		})
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.privateTaskGetBtn, function()
		arg_16_0:emit(GuildOfficeMediator.ON_SUBMIT_TASK, var_16_1)
	end, SFX_PANEL)

	if var_16_3:isFinish() and not var_16_3:isReceive() and not var_16_0 then
		arg_16_0:emit(GuildOfficeMediator.ON_SUBMIT_TASK, var_16_1)
	elseif not var_16_4 and var_16_0 then
		arg_16_0:emit(GuildOfficeMediator.ON_ACCEPT_TASK, var_16_1)
	end

	local var_16_5 = not var_16_0
	local var_16_6 = arg_16_1:isFinished() and (not var_16_4 or not var_16_0)

	setActive(arg_16_0.taskMaskAll, var_16_6)
	setActive(arg_16_0.taskMaskTop, not var_16_6 and arg_16_1:isFinished())
	setActive(arg_16_0.privateTaskReapeatFlag, var_16_5)
	setActive(arg_16_0.privateTaskResTxt.gameObject.transform.parent, not var_16_5)
	setActive(arg_16_0.privateTaskAcceptBtn, not var_16_4 or var_16_3:isReceive())
	setActive(arg_16_0.privateTaskGetBtn, var_16_4 and var_16_3:isFinish() and not var_16_3:isReceive())
	setActive(arg_16_0.privateTaskProgressTxt.gameObject.transform.parent, var_16_4 and not var_16_3:isFinish())
end

function var_0_0.UpdatePubliceTask(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1:getProgress()
	local var_20_1 = arg_20_1:getMaxProgress()

	arg_20_0.taskProgressTxt.text = var_20_0 .. "/<size=40>" .. var_20_1 .. "</size>"

	setFillAmount(arg_20_0.taskProgressBar, var_20_0 / var_20_1)

	arg_20_0.taskDescTxt.text = var_20_0
	arg_20_0.taskAwardTxt.text = arg_20_1:GetCurrCaptailAward()
end

function var_0_0.UpdateContributionPanel(arg_21_0)
	local var_21_0 = arg_21_0.guild
	local var_21_1 = var_21_0:getDonateTasks()
	local var_21_2 = var_21_0:getRemainDonateCnt() + var_21_0:GetExtraDonateCnt()

	arg_21_0.contributionList:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_21_1[arg_22_1 + 1]
			local var_22_1 = GuildDonateCard.New(arg_22_2)

			var_22_1:update(var_22_0)
			onButton(arg_21_0, var_22_1.commitBtn, function()
				local var_23_0 = var_22_0:getCommitItem()
				local var_23_1 = Drop.New({
					type = var_23_0[1],
					id = var_23_0[2],
					count = var_23_0[3]
				})
				local var_23_2 = var_22_1:GetResCntByAward(var_23_0)
				local var_23_3 = var_23_2 < var_23_0[3] and "#FF5C5CFF" or "#92FC63FF"

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("guild_donate_tip", var_23_1:getConfig("name"), var_23_0[3], var_23_2, var_23_3),
					onYes = function()
						arg_21_0:emit(GuildOfficeMediator.ON_COMMIT, var_22_0.id)
					end
				})
			end, SFX_PANEL)
			setButtonEnabled(var_22_1.commitBtn, var_21_2 > 0)
		end
	end)
	arg_21_0.contributionList:align(#var_21_1)

	arg_21_0.contributionCntTxt.text = i18n("guild_left_donate_cnt", var_21_2)
end

function var_0_0.UpdateSupplyPanel(arg_25_0)
	local var_25_0 = arg_25_0.guild
	local var_25_1 = var_25_0:isOpenedSupply()

	setActive(arg_25_0.supplyOpenTF, var_25_1)
	setActive(arg_25_0.supplyUnOpenTF, not var_25_1)

	if not var_25_1 then
		setActive(arg_25_0.supplyUnOpenAdminTF, arg_25_0.isAdmin)
		setActive(arg_25_0.supplyUnOpenLockTF, not arg_25_0.isAdmin)

		if arg_25_0.isAdmin then
			arg_25_0.supplyUnOpenResTF.text = var_25_0:getSupplyConsume()
		end
	else
		local var_25_2 = var_25_0:getSupplyCnt()
		local var_25_3 = var_25_0:getSupplyLeftCnt()

		setActive(arg_25_0.supplyOpenGetBtn, var_25_2 > 0)
		setActive(arg_25_0.supplyOpenGotBtn, var_25_2 <= 0)

		if var_25_3 < 0 then
			arg_25_0.supplyOpenTimeTxt.text = i18n("guild_exist_unreceived_supply_award")
		else
			arg_25_0.supplyOpenTimeTxt.text = i18n("guild_left_supply_day", var_25_3)
		end

		arg_25_0.supplyOpenLetfCntTxt.text = i18n1(var_25_2 .. "/" .. GuildConst.MAX_SUPPLY_CNT)
	end
end

function var_0_0.OnDestroy(arg_26_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_26_0.taskTF, arg_26_0._tf)
	arg_26_0.selectTaskPage:Destroy()
end

return var_0_0
