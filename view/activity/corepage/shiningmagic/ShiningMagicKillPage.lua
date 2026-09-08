local var_0_0 = class("ShiningMagicKillPage", import("..CoreActivityPage"))

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
	arg_1_0.displayText = arg_1_0.displayBtn:Find("Text")
	arg_1_0.finishAll = false
end

function var_0_0.OnDataSetting(arg_2_0)
	if arg_2_0.ptData then
		arg_2_0.ptData:Update(arg_2_0.activity)
	else
		arg_2_0.ptData = ActivityPtData.New(arg_2_0.activity)
	end
end

function var_0_0.LocalInit(arg_3_0)
	setText(arg_3_0.displayText, i18n("nier_core_award_check"))
	setText(arg_3_0.progressRule, i18n("nier_core_task_desc"))
end

function var_0_0.InitBtn(arg_4_0)
	onButton(arg_4_0, arg_4_0.displayBtn, function()
		arg_4_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			blur = true,
			type = arg_4_0.ptData.type,
			dropList = arg_4_0.ptData.dropList,
			targets = arg_4_0.ptData.targets,
			level = arg_4_0.ptData.level,
			count = arg_4_0.ptData.count,
			resId = arg_4_0.ptData.resId,
			unlockStamps = arg_4_0.ptData:GetDayUnlockStamps()
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.battleBtn, function()
		arg_4_0:emit(ActivityMediator.GO_Activity_level)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.getBtn, function()
		local var_7_0 = {}
		local var_7_1 = arg_4_0.ptData:GetAward()
		local var_7_2 = getProxy(PlayerProxy):getRawData()
		local var_7_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_7_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_7_3)
		local var_7_5, var_7_6 = Task.StaticJudgeOverflow(var_7_2.gold, var_7_2.oil, var_7_4, true, true, {
			{
				var_7_1.type,
				var_7_1.id,
				var_7_1.count
			}
		})

		if var_7_5 then
			table.insert(var_7_0, function(arg_8_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_7_6,
					onYes = arg_8_0
				})
			end)
		end

		seriesAsync(var_7_0, function()
			local var_9_0, var_9_1 = arg_4_0.ptData:GetResProgress()

			arg_4_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 1,
				activity_id = arg_4_0.ptData:GetId(),
				arg1 = var_9_1
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.OnFirstFlush(arg_10_0)
	arg_10_0:LocalInit()
	arg_10_0:InitBtn()
end

function var_0_0.OnUpdateFlush(arg_11_0)
	local var_11_0 = arg_11_0.ptData:getTargetLevel()
	local var_11_1, var_11_2, var_11_3 = arg_11_0.ptData:GetLevelProgress()

	setText(arg_11_0.nowday, string.format("%s", var_11_1))
	setText(arg_11_0.aimday, string.format("/%s", var_11_2))

	local var_11_4, var_11_5, var_11_6 = arg_11_0.ptData:GetResProgress()

	setText(arg_11_0.progressStep, string.format("%s<color=#ffffff33>/%s</color>", var_11_6 >= 1 and setColorStr(var_11_4, COLOR_GREEN) or var_11_4, var_11_5))
	setSlider(arg_11_0.slider, 0, 1, var_11_6)

	local var_11_7 = arg_11_0.ptData:CanGetAward()
	local var_11_8 = arg_11_0.ptData:CanGetNextAward()
	local var_11_9 = arg_11_0.ptData:CanGetMorePt()

	setActive(arg_11_0.battleBtn, var_11_9 and not var_11_7 and var_11_8)
	setActive(arg_11_0.getBtn, var_11_7)
	setActive(arg_11_0.gotBtn, not var_11_8)

	local var_11_10 = arg_11_0.ptData:GetAward()

	updateDrop(arg_11_0.awardTF, var_11_10)
	onButton(arg_11_0, arg_11_0.awardTF, function()
		arg_11_0:emit(BaseUI.ON_DROP, var_11_10)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_13_0)
	return
end

function var_0_0.GetWorldPtData(arg_14_0, arg_14_1)
	if arg_14_1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()

		arg_14_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2,
			activity_id = arg_14_0.ptData:GetId()
		})
	end
end

function var_0_0.OnHideFlush(arg_15_0)
	return
end

function var_0_0.OnDestroy(arg_16_0)
	return
end

return var_0_0
