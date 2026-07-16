local var_0_0 = class("NieRAutomataKillPage", import("..CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.title = arg_1_0.bg:Find("title")
	arg_1_0.desc1 = arg_1_0.title:Find("desc1")
	arg_1_0.desc2 = arg_1_0.title:Find("desc2")
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

function var_0_0.LocalFresh(arg_4_0)
	local var_4_0, var_4_1, var_4_2 = arg_4_0.ptData:GetLevelProgress()
	local var_4_3 = "nier_2b_text_block_day"
	local var_4_4 = arg_4_0.ptData:CanGetNextAward()
	local var_4_5

	arg_4_0.finishAll = var_4_0 >= 7 and not var_4_4

	if arg_4_0.finishAll then
		var_4_5 = i18n(var_4_3 .. "_fin")

		setActive(arg_4_0.desc1, false)
	else
		var_4_5 = i18n(var_4_3 .. var_4_0)

		setText(arg_4_0.desc1, var_4_5[1].info)
	end

	setText(arg_4_0.desc2, var_4_5[2].info)
	setActive(arg_4_0.desc2, false)
	arg_4_0:Playwriter()
end

function var_0_0.InitBtn(arg_5_0)
	onButton(arg_5_0, arg_5_0.displayBtn, function()
		arg_5_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			blur = true,
			type = arg_5_0.ptData.type,
			dropList = arg_5_0.ptData.dropList,
			targets = arg_5_0.ptData.targets,
			level = arg_5_0.ptData.level,
			count = arg_5_0.ptData.count,
			resId = arg_5_0.ptData.resId,
			unlockStamps = arg_5_0.ptData:GetDayUnlockStamps()
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.battleBtn, function()
		arg_5_0:emit(ActivityMediator.GO_Activity_level)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.getBtn, function()
		local var_8_0 = {}
		local var_8_1 = arg_5_0.ptData:GetAward()
		local var_8_2 = getProxy(PlayerProxy):getRawData()
		local var_8_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_8_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_8_3)
		local var_8_5, var_8_6 = Task.StaticJudgeOverflow(var_8_2.gold, var_8_2.oil, var_8_4, true, true, {
			{
				var_8_1.type,
				var_8_1.id,
				var_8_1.count
			}
		})

		if var_8_5 then
			table.insert(var_8_0, function(arg_9_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_8_6,
					onYes = arg_9_0
				})
			end)
		end

		seriesAsync(var_8_0, function()
			local var_10_0, var_10_1 = arg_5_0.ptData:GetResProgress()

			arg_5_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 1,
				activity_id = arg_5_0.ptData:GetId(),
				arg1 = var_10_1
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.GetTypewriterSpeed(arg_11_0)
	local var_11_0 = arg_11_0.activity:getConfig("config_client").typewriterSpeed

	return var_11_0 and var_11_0 or 0.1
end

function var_0_0.Playwriter(arg_12_0)
	local var_12_0 = {}

	if not arg_12_0.finishAll then
		table.insert(var_12_0, function(arg_13_0)
			local var_13_0 = arg_12_0.desc1
			local var_13_1 = GetOrAddComponent(var_13_0, typeof(Typewriter))

			function var_13_1.endFunc()
				arg_13_0()
			end

			var_13_1:setSpeed(arg_12_0:GetTypewriterSpeed())
			var_13_1:Play()
		end)
	else
		local var_12_1, var_12_2, var_12_3 = arg_12_0.ptData:GetLevelProgress()

		table.insert(var_12_0, function(arg_15_0)
			local var_15_0 = arg_12_0.activity:getConfig("config_client").story
			local var_15_1 = checkExist(var_15_0, {
				var_12_1
			}, {
				1
			})

			if var_15_1 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_15_1) then
				pg.NewStoryMgr.GetInstance():Play(var_15_1, function()
					arg_15_0()
				end)
			else
				arg_15_0()
			end
		end)
	end

	table.insert(var_12_0, function(arg_17_0)
		local var_17_0 = arg_12_0.desc2

		setActive(arg_12_0.desc2, true)

		local var_17_1 = GetOrAddComponent(var_17_0, typeof(Typewriter))

		function var_17_1.endFunc()
			arg_17_0()
		end

		var_17_1:setSpeed(arg_12_0:GetTypewriterSpeed())
		var_17_1:Play()
	end)
	seriesAsync(var_12_0, callback)
end

function var_0_0.OnFirstFlush(arg_19_0)
	arg_19_0:LocalInit()
	arg_19_0:LocalFresh()
	arg_19_0:InitBtn()
end

function var_0_0.OnUpdateFlush(arg_20_0)
	local var_20_0 = arg_20_0.ptData:getTargetLevel()
	local var_20_1, var_20_2, var_20_3 = arg_20_0.ptData:GetLevelProgress()

	setText(arg_20_0.nowday, string.format("%s", var_20_1))
	setText(arg_20_0.aimday, string.format("/%s", var_20_2))
	arg_20_0:LocalFresh()

	local var_20_4, var_20_5, var_20_6 = arg_20_0.ptData:GetResProgress()

	setText(arg_20_0.progressStep, string.format("%s<color=#ffffff33>/%s</color>", var_20_6 >= 1 and setColorStr(var_20_4, COLOR_GREEN) or var_20_4, var_20_5))
	setSlider(arg_20_0.slider, 0, 1, var_20_6)

	local var_20_7 = arg_20_0.ptData:CanGetAward()
	local var_20_8 = arg_20_0.ptData:CanGetNextAward()
	local var_20_9 = arg_20_0.ptData:CanGetMorePt()

	setActive(arg_20_0.battleBtn, var_20_9 and not var_20_7 and var_20_8)
	setActive(arg_20_0.getBtn, var_20_7)
	setActive(arg_20_0.gotBtn, not var_20_8)

	local var_20_10 = arg_20_0.ptData:GetAward()

	updateDrop(arg_20_0.awardTF, var_20_10)
	onButton(arg_20_0, arg_20_0.awardTF, function()
		arg_20_0:emit(BaseUI.ON_DROP, var_20_10)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_22_0)
	return
end

function var_0_0.GetWorldPtData(arg_23_0, arg_23_1)
	if arg_23_1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()

		arg_23_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2,
			activity_id = arg_23_0.ptData:GetId()
		})
	end
end

return var_0_0
