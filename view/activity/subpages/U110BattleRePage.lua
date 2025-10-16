local var_0_0 = class("U110BattleRePage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.slider = arg_1_0.bg:Find("slider")
	arg_1_0.step = arg_1_0.bg:Find("step")
	arg_1_0.progress = arg_1_0.bg:Find("progress")
	arg_1_0.desc = arg_1_0.bg:Find("desc")
	arg_1_0.awardTF = arg_1_0.bg:Find("award")
	arg_1_0.battleBtn = arg_1_0.bg:Find("battle_btn")
	arg_1_0.getBtn = arg_1_0.bg:Find("get_btn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("got_btn")
	arg_1_0.buildBtn = arg_1_0.bg:Find("build_btn")
end

function var_0_0.OnDataSetting(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_data")

	arg_2_0.taskIDList = _.flatten(var_2_0)
	arg_2_0.taskProxy = getProxy(TaskProxy)
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.battleBtn, function()
		local var_4_0 = arg_3_0.activity:getConfig("config_client").fightLinkActID
		local var_4_1 = var_4_0 and getProxy(ActivityProxy):getActivityById(var_4_0)

		if not var_4_1 or var_4_1:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

			return
		end

		arg_3_0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, arg_3_0.curTaskVO)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.buildBtn, function()
		local var_6_0 = arg_3_0.activity:getConfig("config_client").buildLinkActID
		local var_6_1 = var_6_0 and getProxy(ActivityProxy):getActivityById(var_6_0)

		if not var_6_1 or var_6_1:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

			return
		end

		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
			projectName = BuildShipScene.PROJECTS.SPECIAL
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	local var_7_0 = arg_7_0:findCurTaskIndex()

	setText(arg_7_0.step, var_7_0 .. "/" .. #arg_7_0.taskIDList)

	local var_7_1 = arg_7_0.taskIDList[var_7_0]
	local var_7_2 = arg_7_0.taskProxy:getTaskVO(var_7_1)

	arg_7_0.curTaskVO = var_7_2

	local var_7_3 = var_7_2:getProgress()
	local var_7_4 = var_7_2:getConfig("target_num")

	setText(arg_7_0.progress, (var_7_4 <= var_7_3 and setColorStr(var_7_3, COLOR_GREEN) or var_7_3) .. "/" .. var_7_4)
	setSlider(arg_7_0.slider, 0, var_7_4, var_7_3)

	local var_7_5 = var_7_2:getConfig("award_display")[1]
	local var_7_6 = {
		type = var_7_5[1],
		id = var_7_5[2],
		count = var_7_5[3]
	}

	updateDrop(arg_7_0.awardTF, var_7_6)
	onButton(arg_7_0, arg_7_0.awardTF, function()
		arg_7_0:emit(BaseUI.ON_DROP, var_7_6)
	end, SFX_PANEL)

	local var_7_7 = pg.task_data_template[var_7_1].desc

	setText(arg_7_0.desc, var_7_7)

	local var_7_8 = var_7_2:getTaskStatus()

	setActive(arg_7_0.battleBtn, var_7_8 == 0)
	setActive(arg_7_0.getBtn, var_7_8 == 1)
	setActive(arg_7_0.gotBtn, var_7_8 == 2)
end

function var_0_0.OnDestroy(arg_9_0)
	return
end

function var_0_0.findCurTaskIndex(arg_10_0)
	local var_10_0

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.taskIDList) do
		if arg_10_0.taskProxy:getTaskVO(iter_10_1):getTaskStatus() <= 1 then
			var_10_0 = iter_10_0

			break
		elseif iter_10_0 == #arg_10_0.taskIDList then
			var_10_0 = iter_10_0
		end
	end

	return var_10_0
end

return var_0_0
