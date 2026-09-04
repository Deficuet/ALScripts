local var_0_0 = class("ShiningMagicSignPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.daysTF = arg_1_0.bg:Find("days")
	arg_1_0.btnSign = arg_1_0.bg:Find("btn_sign")
	arg_1_0.remainTimes = arg_1_0.btnSign:Find("remainTimes")
	arg_1_0.tipSign = arg_1_0.btnSign:Find("tip")
	arg_1_0.btnSigned = arg_1_0.bg:Find("btn_sign_gray")
	arg_1_0.btnSignedAll = arg_1_0.bg:Find("btn_sign_gray_all")
	arg_1_0.days = {}

	for iter_1_0 = 1, arg_1_0.daysTF.childCount do
		arg_1_0.days[iter_1_0] = arg_1_0:initDayTpl(arg_1_0.daysTF:Find("day_" .. iter_1_0))
	end
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.curDay = 0
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = underscore.flatten(arg_2_0.activity:getConfig("config_data"))
	arg_2_0.preStory = arg_2_0.activity:getConfig("config_client").preStory

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.btnSign, function()
		if not arg_3_0.enableSign then
			return
		end

		seriesAsync({
			function(arg_5_0)
				local var_5_0 = arg_3_0.activity:getConfig("config_client").story

				if checkExist(var_5_0, {
					arg_3_0.curDay
				}, {
					1
				}) then
					pg.NewStoryMgr.GetInstance():Play(var_5_0[arg_3_0.curDay][1], arg_5_0)
				else
					arg_5_0()
				end
			end,
			function(arg_6_0)
				if arg_3_0.curTaskVO and arg_3_0.curTaskVO:getTaskStatus() == 1 then
					arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, arg_3_0.curTaskVO, arg_6_0)
				else
					arg_6_0()
				end
			end
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	arg_7_0.curDay = arg_7_0.activity.data3
	arg_7_0.enableSign = false

	local var_7_0 = arg_7_0:isAllSigned()

	setActive(arg_7_0.btnSignedAll, var_7_0)

	if not var_7_0 then
		local var_7_1 = arg_7_0.taskGroup[arg_7_0.curDay]
		local var_7_2 = math.min(arg_7_0.activity:getDayIndex(), #arg_7_0.taskGroup)

		arg_7_0.curTaskVO = arg_7_0.taskProxy:getTaskById(var_7_1) or arg_7_0.taskProxy:getFinishTaskById(var_7_1)
		arg_7_0.remain = math.max(var_7_2 - arg_7_0.curDay, 0)

		if arg_7_0.curTaskVO:getTaskStatus() == 1 then
			arg_7_0.remain = arg_7_0.remain + 1
		end

		arg_7_0.enableSign = arg_7_0.remain > 0

		setText(arg_7_0.remainTimes, i18n("shiningmagicsignpage_sign_remain") .. "  " .. arg_7_0.remain)
	end

	local var_7_3 = arg_7_0.enableSign and arg_7_0.curDay - 1 or arg_7_0.curDay

	for iter_7_0 = 1, var_7_3 do
		local var_7_4 = arg_7_0.days[iter_7_0]

		setActive(var_7_4.signed, iter_7_0 <= var_7_3)
	end

	setActive(arg_7_0.btnSign, arg_7_0.enableSign)
end

function var_0_0.initDayTpl(arg_8_0, arg_8_1)
	local var_8_0 = {
		signed = arg_8_1:Find("on")
	}

	setActive(var_8_0.signed, false)

	return var_8_0
end

function var_0_0.isAllSigned(arg_9_0)
	local var_9_0 = arg_9_0.taskGroup[#arg_9_0.taskGroup]
	local var_9_1 = arg_9_0.taskProxy:getTaskById(var_9_0) or arg_9_0.taskProxy:getFinishTaskById(var_9_0)

	return var_9_1 and var_9_1:getTaskStatus() == 2
end

return var_0_0
