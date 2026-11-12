local var_0_0 = class("TwoPointFiveKillPage", import("..CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.rtTask = arg_1_0.bg:Find("task")
	arg_1_0.step = arg_1_0.rtTask:Find("step")
	arg_1_0.nowday = arg_1_0.step:Find("nowday")
	arg_1_0.aimday = arg_1_0.step:Find("aimday")
	arg_1_0.progress = arg_1_0.rtTask:Find("progress")
	arg_1_0.slider = arg_1_0.progress:Find("slider")
	arg_1_0.awardTF = arg_1_0.progress:Find("award")
	arg_1_0.progressStep = arg_1_0.progress:Find("step")
	arg_1_0.progressRule = arg_1_0.progress:Find("rule")
	arg_1_0.BtnGroup = arg_1_0.rtTask:Find("BtnGroup")
	arg_1_0.displayBtn = arg_1_0.BtnGroup:Find("Check_btn")
	arg_1_0.battleBtn = arg_1_0.BtnGroup:Find("battle_btn")
	arg_1_0.getBtn = arg_1_0.BtnGroup:Find("get_btn")
	arg_1_0.gotBtn = arg_1_0.BtnGroup:Find("got_btn")
end

function var_0_0.OnDataSetting(arg_2_0)
	if arg_2_0.ptData then
		arg_2_0.ptData:Update(arg_2_0.activity)
	else
		arg_2_0.ptData = ActivityPtData.New(arg_2_0.activity)
	end
end

function var_0_0.InitBtn(arg_3_0)
	onButton(arg_3_0, arg_3_0.displayBtn, function()
		arg_3_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			blur = true,
			type = arg_3_0.ptData.type,
			dropList = arg_3_0.ptData.dropList,
			targets = arg_3_0.ptData.targets,
			level = arg_3_0.ptData.level,
			count = arg_3_0.ptData.count,
			resId = arg_3_0.ptData.resId,
			unlockStamps = arg_3_0.ptData:GetDayUnlockStamps()
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.battleBtn, function()
		arg_3_0:emit(ActivityMediator.GO_Activity_level)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		local var_6_0 = {}
		local var_6_1 = arg_3_0.ptData:GetAward()
		local var_6_2 = getProxy(PlayerProxy):getRawData()
		local var_6_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_6_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_6_3)
		local var_6_5, var_6_6 = Task.StaticJudgeOverflow(var_6_2.gold, var_6_2.oil, var_6_4, true, true, {
			{
				var_6_1.type,
				var_6_1.id,
				var_6_1.count
			}
		})

		if var_6_5 then
			table.insert(var_6_0, function(arg_7_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_6_6,
					onYes = arg_7_0
				})
			end)
		end

		seriesAsync(var_6_0, function()
			local var_8_0, var_8_1 = arg_3_0.ptData:GetResProgress()

			arg_3_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 1,
				activity_id = arg_3_0.ptData:GetId(),
				arg1 = var_8_1
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.OnFirstFlush(arg_9_0)
	arg_9_0:InitBtn()
end

function var_0_0.OnUpdateFlush(arg_10_0)
	setText(arg_10_0.progressRule, i18n("nier_core_task_desc"))

	local var_10_0 = arg_10_0.ptData:getTargetLevel()
	local var_10_1, var_10_2, var_10_3 = arg_10_0.ptData:GetLevelProgress()

	setText(arg_10_0.nowday, string.format("%s", var_10_1))
	setText(arg_10_0.aimday, string.format("/%s", var_10_2))

	local var_10_4, var_10_5, var_10_6 = arg_10_0.ptData:GetResProgress()

	setText(arg_10_0.progressStep, string.format("%s<color=#bdbad1>/%s</color>", var_10_6 >= 1 and setColorStr(var_10_4, COLOR_GREEN) or var_10_4, var_10_5))
	setSlider(arg_10_0.slider, 0, 1, var_10_6)

	local var_10_7 = arg_10_0.ptData:CanGetAward()
	local var_10_8 = arg_10_0.ptData:CanGetNextAward()
	local var_10_9 = arg_10_0.ptData:CanGetMorePt()

	setActive(arg_10_0.battleBtn, var_10_9 and not var_10_7 and var_10_8)
	setActive(arg_10_0.getBtn, var_10_7)
	setActive(arg_10_0.gotBtn, not var_10_8)

	local var_10_10 = arg_10_0.ptData:GetAward()

	updateDrop(arg_10_0.awardTF, var_10_10)
	onButton(arg_10_0, arg_10_0.awardTF, function()
		arg_10_0:emit(BaseUI.ON_DROP, var_10_10)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

function var_0_0.GetWorldPtData(arg_13_0, arg_13_1)
	if arg_13_1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()

		arg_13_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2,
			activity_id = arg_13_0.ptData:GetId()
		})
	end
end

return var_0_0
