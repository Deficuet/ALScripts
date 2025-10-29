local var_0_0 = class("SenrankaguraTaskPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.taskProxy = getProxy(TaskProxy)
	arg_1_0.activityProxy = getProxy(ActivityProxy)

	arg_1_0:findUI()
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.configID = arg_2_0.activity:getConfig("config_id")
	arg_2_0.configData = pg.activity_event_turning[arg_2_0.configID]
	arg_2_0.groupNum = arg_2_0.configData.total_num
end

function var_0_0.OnFirstFlush(arg_3_0)
	return
end

function var_0_0.OnUpdateFlush(arg_4_0)
	local var_4_0 = arg_4_0:getCurIndex()

	if arg_4_0.markClickPos and arg_4_0.markClickPos > 0 then
		print("有操作再更新任务面板")
		arg_4_0:openTaskAni()
	elseif var_4_0 > 0 then
		if arg_4_0.activity.data4 <= arg_4_0.groupNum then
			print("直接更新任务面板")
			arg_4_0:updateTaskPanel()
			setActive(arg_4_0.posPanel, false)
			setActive(arg_4_0.taskPanel, true)
		end
	elseif var_4_0 == 0 then
		arg_4_0:updatePosPanel()
		setActive(arg_4_0.posPanel, true)
		setActive(arg_4_0.taskPanel, false)

		if arg_4_0:getStep() > arg_4_0.groupNum then
			-- block empty
		end
	end

	arg_4_0:check()
	arg_4_0:updateLogText()
end

function var_0_0.onDestroy(arg_5_0)
	return
end

function var_0_0.findUI(arg_6_0)
	local var_6_0 = arg_6_0._tf:Find("IconList")

	arg_6_0.nameList = {
		"feiniao",
		"banjiu",
		"yan",
		"xuequan",
		"xuebugui",
		"zi",
		"xishao"
	}
	arg_6_0.paintingList = {
		"asuka",
		"ikaruga",
		"homura",
		"yumi",
		"fubuki",
		"murasaki",
		"yuuyaki"
	}
	arg_6_0.iconSpriteDict = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.nameList) do
		local var_6_1 = var_6_0:Find(iter_6_1)
		local var_6_2 = getImageSprite(var_6_1)

		arg_6_0.iconSpriteDict[iter_6_0] = var_6_2
		arg_6_0.iconSpriteDict[iter_6_1] = var_6_2
	end

	local var_6_3 = arg_6_0._tf:Find("HXList")
	local var_6_4 = {
		"feiniao",
		"yan",
		"xuequan",
		"xuebugui",
		"xishao"
	}

	arg_6_0.hxSpriteDict = {}

	for iter_6_2, iter_6_3 in ipairs(var_6_4) do
		local var_6_5 = var_6_3:Find(iter_6_3)
		local var_6_6 = getImageSprite(var_6_5)

		arg_6_0.hxSpriteDict[iter_6_3] = var_6_6
	end

	arg_6_0.hxPosDict = {
		feiniao = {
			x = -47,
			y = -7
		},
		yan = {
			x = 24,
			y = -176
		},
		xuequan = {
			x = -92,
			y = -126
		},
		xuebugui = {
			x = 5,
			y = 22
		},
		xishao = {
			x = -86,
			y = -21
		}
	}
	arg_6_0.paintingPosDict = {
		feiniao = {
			x = 42,
			y = -22
		},
		banjiu = {
			x = 23,
			y = -8
		},
		yan = {
			x = -11,
			y = 20
		},
		xuequan = {
			x = 39,
			y = 30
		},
		xuebugui = {
			x = 26,
			y = 12
		},
		zi = {
			x = 46,
			y = 36
		},
		xishao = {
			x = 20,
			y = -1
		}
	}
	arg_6_0.posPanel = arg_6_0._tf:Find("PosPanel")
	arg_6_0.finalLockTF = arg_6_0.posPanel:Find("FinalAward/Lock")
	arg_6_0.finalGotTF = arg_6_0.posPanel:Find("FinalAward/Got")
	arg_6_0.posTFList = {}

	local var_6_7 = arg_6_0.posPanel:Find("PosList")

	for iter_6_4 = 1, #arg_6_0.nameList do
		local var_6_8 = var_6_7:Find(iter_6_4)

		table.insert(arg_6_0.posTFList, var_6_8)

		local var_6_9 = var_6_8:Find("Get")

		onButton(arg_6_0, var_6_9, function()
			local var_7_0 = arg_6_0:getStep()

			if var_7_0 < arg_6_0:getCurDayCount() and var_7_0 < arg_6_0.groupNum then
				arg_6_0.markClickPos = iter_6_4

				arg_6_0:selectPos(iter_6_4)
			end
		end, SFX_PANEL)
	end

	arg_6_0.taskPanel = arg_6_0._tf:Find("TaskPanel")
	arg_6_0.paintingTF = arg_6_0.taskPanel:Find("PaintingPanel/Main/Painting")
	arg_6_0.paintingHXTF = arg_6_0.taskPanel:Find("PaintingPanel/Main/HX")
	arg_6_0.progressTFList = {}

	local var_6_10 = arg_6_0.taskPanel:Find("Progress")

	for iter_6_5 = 1, #arg_6_0.nameList do
		local var_6_11 = var_6_10:Find(iter_6_5)

		arg_6_0.progressTFList[iter_6_5] = var_6_11
	end

	arg_6_0.taskTFList = {}
	arg_6_0.taskTFList[1] = arg_6_0.taskPanel:Find("Task1")
	arg_6_0.taskTFList[2] = arg_6_0.taskPanel:Find("Task2")
	arg_6_0.logText = arg_6_0._tf:Find("LogText")
end

function var_0_0.updatePosPanel(arg_8_0)
	local var_8_0 = arg_8_0.posTFList
	local var_8_1 = arg_8_0.activity.data1_list

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		local var_8_2 = var_8_1[iter_8_0] > 0
		local var_8_3 = iter_8_1:Find("Got")
		local var_8_4 = var_8_3:Find("Icon")
		local var_8_5 = var_8_1[iter_8_0]
		local var_8_6 = arg_8_0.iconSpriteDict[var_8_5]

		setImageSprite(var_8_4, var_8_6, true)
		setActive(var_8_3, var_8_2)
	end

	local var_8_7 = arg_8_0:isGotFinalAward()

	setActive(arg_8_0.finalGotTF, var_8_7)
	setActive(arg_8_0.finalLockTF, not var_8_7)
end

function var_0_0.updateTaskPanel(arg_9_0)
	arg_9_0:updateTaskList()
	arg_9_0:updateProgress()
	arg_9_0:updatePainting()
end

function var_0_0.updateTaskList(arg_10_0)
	local var_10_0 = arg_10_0:getCurTaskIDList()

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.taskTFList) do
		local var_10_1 = var_10_0[iter_10_0]
		local var_10_2 = arg_10_0.taskProxy:getTaskVO(var_10_1)
		local var_10_3 = iter_10_1:Find("Desc")

		setText(var_10_3, var_10_2:getConfig("desc"))

		local var_10_4 = var_10_2:getProgress()
		local var_10_5 = var_10_2:getConfig("target_num")
		local var_10_6 = iter_10_1:Find("ProgressText")
		local var_10_7 = iter_10_1:Find("ProgressBar")

		setText(var_10_6, var_10_4 .. "/" .. var_10_5)
		setSlider(var_10_7, 0, var_10_5, var_10_4)

		local var_10_8 = var_10_2:getTaskStatus()
		local var_10_9 = iter_10_1:Find("GetBtn")
		local var_10_10 = iter_10_1:Find("GotBtn")
		local var_10_11 = iter_10_1:Find("GoBtn")

		setActive(var_10_11, var_10_8 == 0)
		setActive(var_10_9, var_10_8 == 1)
		setActive(var_10_10, var_10_8 == 2)
		onButton(arg_10_0, var_10_11, function()
			arg_10_0:emit(ActivityMediator.ON_TASK_GO, var_10_2)
		end, SFX_PANEL)
		onButton(arg_10_0, var_10_9, function()
			arg_10_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_10_2)
		end, SFX_PANEL)

		local var_10_12 = var_10_2:getConfig("award_display")[1]
		local var_10_13 = {
			type = var_10_12[1],
			id = var_10_12[2],
			count = var_10_12[3]
		}
		local var_10_14 = iter_10_1:Find("Icon")

		updateDrop(var_10_14, var_10_13)
		onButton(arg_10_0, var_10_14, function()
			arg_10_0:emit(BaseUI.ON_DROP, var_10_13)
		end, SFX_PANEL)

		if arg_10_0:isFinishedCurTaskList() then
			local var_10_15 = arg_10_0:getStep()
			local var_10_16 = arg_10_0.configData.story_task[var_10_15][1]

			print("story", tostring(var_10_16))

			if var_10_16 then
				pg.NewStoryMgr.GetInstance():Play(var_10_16, nil)
			end
		end
	end
end

function var_0_0.updateProgress(arg_14_0)
	local var_14_0 = arg_14_0:getStep()

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.progressTFList) do
		local var_14_1 = iter_14_1:Find("Get")
		local var_14_2 = iter_14_1:Find("Got")
		local var_14_3 = iter_14_1:Find("Doing")

		setActive(var_14_2, iter_14_0 < var_14_0)
		setActive(var_14_1, var_14_0 < iter_14_0)
		setActive(var_14_3, iter_14_0 == var_14_0)
	end
end

function var_0_0.updatePainting(arg_15_0)
	local var_15_0 = arg_15_0:getCurIndex()
	local var_15_1 = arg_15_0.nameList[var_15_0]
	local var_15_2 = arg_15_0.paintingList[var_15_0]
	local var_15_3 = LoadSprite("activitypainting/" .. var_15_2, var_15_2)

	setImageSprite(arg_15_0.paintingTF, var_15_3, true)

	local var_15_4 = arg_15_0.paintingPosDict[var_15_1]

	setLocalPosition(arg_15_0.paintingTF, var_15_4)

	if PLATFORM_CODE == PLATFORM_CH then
		local var_15_5 = arg_15_0.hxPosDict[var_15_1]

		if var_15_5 then
			local var_15_6 = arg_15_0.hxSpriteDict[var_15_1]

			setImageSprite(arg_15_0.paintingHXTF, var_15_6, true)
			setLocalPosition(arg_15_0.paintingHXTF, var_15_5)
			setActive(arg_15_0.paintingHXTF, true)
		else
			setActive(arg_15_0.paintingHXTF, false)
		end
	else
		setActive(arg_15_0.paintingHXTF, false)
	end
end

function var_0_0.openTaskAni(arg_16_0)
	local var_16_0 = arg_16_0:getCurIndex()
	local var_16_1 = arg_16_0.activity.data1_list
	local var_16_2 = table.indexof(var_16_1, var_16_0, 1)
	local var_16_3 = arg_16_0.posTFList[var_16_2]
	local var_16_4 = var_16_3:Find("Get")
	local var_16_5 = var_16_3:Find("Got")

	setImageAlpha(var_16_4, 1)
	setImageAlpha(var_16_5, 0)
	setActive(var_16_4, true)
	setActive(var_16_5, true)

	local var_16_6 = var_16_5:Find("Icon")

	setActive(var_16_6, false)

	local var_16_7 = System.Action_float(function(arg_17_0)
		setImageAlpha(var_16_4, 1 - arg_17_0)
		setImageAlpha(var_16_5, arg_17_0)
	end)
	local var_16_8 = System.Action(function()
		local var_18_0 = arg_16_0:getCurIndex()
		local var_18_1 = arg_16_0.configData.story_list[var_18_0]

		if var_18_1 then
			pg.NewStoryMgr.GetInstance():Play(var_18_1, function()
				arg_16_0:updateTaskPanel()
				setActive(arg_16_0.posPanel, false)
				setActive(arg_16_0.taskPanel, true)
			end, true, true)
		else
			arg_16_0:updateTaskPanel()
			setActive(arg_16_0.posPanel, false)
			setActive(arg_16_0.taskPanel, true)
		end

		arg_16_0.markClickPos = nil
	end)

	var_16_3:SetAsLastSibling()
	arg_16_0:managedTween(LeanTween.value, nil, go(var_16_3), var_16_7, 0, 1, 0.5):setOnComplete(var_16_8)

	arg_16_0.tweenTF = var_16_3
end

function var_0_0.check(arg_20_0)
	if not arg_20_0:isGotFinalAward() then
		local var_20_0 = arg_20_0:getStep()

		if var_20_0 <= arg_20_0.groupNum and arg_20_0:getCurTaskIDList() and arg_20_0:isFinishedCurTaskList() then
			print("清除位置")
			arg_20_0:resetPos()
		end

		if var_20_0 == arg_20_0.groupNum and not arg_20_0:getCurTaskIDList() then
			print("领取最终奖励")
			arg_20_0:getFinalAward()
		end
	end
end

function var_0_0.isGotFinalAward(arg_21_0)
	return arg_21_0.activity.data2 > 0
end

function var_0_0.getStep(arg_22_0)
	return arg_22_0.activity.data3
end

function var_0_0.getCurIndex(arg_23_0)
	return arg_23_0.activity.data4
end

function var_0_0.getCurTaskIDList(arg_24_0)
	local var_24_0 = arg_24_0:getCurIndex()

	return arg_24_0.configData.task_table[var_24_0]
end

function var_0_0.isFinishedCurTaskList(arg_25_0)
	local var_25_0 = arg_25_0:getCurTaskIDList()

	return _.all(var_25_0, function(arg_26_0)
		return arg_25_0.taskProxy:getTaskVO(arg_26_0):getTaskStatus() == 2
	end)
end

function var_0_0.getCurDayCount(arg_27_0)
	local var_27_0 = arg_27_0.activity.data1
	local var_27_1 = pg.TimeMgr.GetInstance():GetServerTime()

	return pg.TimeMgr.GetInstance():DiffDay(var_27_0, var_27_1) + 1
end

function var_0_0.getMaxDayCount(arg_28_0)
	local var_28_0 = arg_28_0:getCurDayCount()

	return (math.clamp(var_28_0, 1, arg_28_0.configData.total_num))
end

function var_0_0.resetPos(arg_29_0)
	arg_29_0:emit(ActivityMediator.EVENT_OPERATION, {
		cmd = 2,
		activity_id = arg_29_0.activity.id
	})
end

function var_0_0.selectPos(arg_30_0, arg_30_1)
	arg_30_0:emit(ActivityMediator.EVENT_OPERATION, {
		cmd = 1,
		activity_id = arg_30_0.activity.id,
		arg1 = arg_30_1
	})
end

function var_0_0.getFinalAward(arg_31_0)
	arg_31_0:emit(ActivityMediator.EVENT_OPERATION, {
		cmd = 1,
		activity_id = arg_31_0.activity.id
	})
end

function var_0_0.updateLogText(arg_32_0)
	local var_32_0 = arg_32_0.activity.data1
	local var_32_1 = arg_32_0.activity.data2
	local var_32_2 = arg_32_0.activity.data3
	local var_32_3 = arg_32_0.activity.data4
	local var_32_4 = arg_32_0.activity.data1_list
	local var_32_5 = arg_32_0.activity:getConfig("config_id")
	local var_32_6 = pg.activity_event_turning[var_32_5].total_num
	local var_32_7 = pg.activity_event_turning[var_32_5].groupid_list
	local var_32_8 = pg.TimeMgr.GetInstance():DiffDay(var_32_0, pg.TimeMgr.GetInstance():GetServerTime()) + 1
	local var_32_9 = math.clamp(var_32_8, 1, var_32_6)
	local var_32_10 = ""

	local function var_32_11(arg_33_0)
		var_32_10 = var_32_10 .. arg_33_0 .. "\n"
	end

	var_32_11("开始时间戳：" .. tostring(var_32_0))
	var_32_11("是否领取最终奖励：" .. tostring(var_32_1))
	var_32_11("当前进度：" .. tostring(var_32_2))
	var_32_11("抽到的索引：" .. tostring(var_32_3))
	var_32_11("抽到的位置-索引列表：" .. table.concat(var_32_4, "-"))
	var_32_11("活动开始到现在的天数：" .. tostring(var_32_8))
	var_32_11("活动的最大抽取次数：" .. tostring(var_32_9))
	var_32_11("配置的总段数：" .. tostring(var_32_6))
	var_32_11("配置的GroupID列表：" .. table.concat(var_32_7, "-"))

	if var_32_3 > 0 then
		local var_32_12 = pg.activity_event_turning[var_32_5][var_32_3]
		local var_32_13 = pg.activity_event_turning[var_32_5].task_table[var_32_3]
		local var_32_14 = pg.activity_event_turning[var_32_5].story_list[var_32_3]

		var_32_11("当前的GroupID：" .. tostring(var_32_12))
		var_32_11("当前的任务列表：" .. table.concat(var_32_13, "-"))
		var_32_11("当前的剧情ID：" .. tostring(var_32_14))
	end

	setText(arg_32_0.logText, var_32_10)
	print(var_32_10)
end

return var_0_0
