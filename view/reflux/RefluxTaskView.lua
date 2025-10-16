local var_0_0 = class("RefluxTaskView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "RefluxTaskUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:updateUI()
end

function var_0_0.OnDestroy(arg_3_0)
	return
end

function var_0_0.OnBackPress(arg_4_0)
	arg_4_0:Hide()
end

function var_0_0.initData(arg_5_0)
	arg_5_0.taskProxy = getProxy(TaskProxy)
	arg_5_0.refluxProxy = getProxy(RefluxProxy)

	local var_5_0 = pg.return_task_template.all[#pg.return_task_template.all]

	arg_5_0.totalDayCount = pg.return_task_template[var_5_0].reward_date
	arg_5_0.taskVOList = nil
	arg_5_0.taskVOListForShow = nil
	arg_5_0.lastSubmitTaskIDList = {}
end

function var_0_0.initUI(arg_6_0)
	local var_6_0 = arg_6_0._tf:Find("DayImg")

	arg_6_0.daySpriteList = {}

	for iter_6_0 = 0, arg_6_0.totalDayCount - 1 do
		local var_6_1 = var_6_0:GetChild(iter_6_0)
		local var_6_2 = getImageSprite(var_6_1)

		table.insert(arg_6_0.daySpriteList, var_6_2)
	end

	arg_6_0.itemTpl = arg_6_0._tf:Find("ItemTpl")

	local var_6_3 = arg_6_0._tf:Find("TaskTpl")
	local var_6_4 = arg_6_0._tf:Find("ScrollRect/Container")

	arg_6_0.taskUIList = UIItemList.New(var_6_4, var_6_3)

	arg_6_0.taskUIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_7_1 = arg_7_1 + 1

			local var_7_0 = arg_6_0.taskVOListForShow[arg_7_1]

			arg_6_0:updateTask(arg_7_2, var_7_0)
		end
	end)

	arg_6_0.taskProgressText = arg_6_0._tf:Find("BG/ProgressText")
	arg_6_0.oneStepBtnDisable = arg_6_0._tf:Find("OneStepDisable")
	arg_6_0.oneStepBtn = arg_6_0._tf:Find("OneStepBtn")

	onButton(arg_6_0, arg_6_0.oneStepBtn, function()
		if arg_6_0:isTaskListOverflow() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("award_overflow_tip"))

			return
		else
			local var_8_0 = {}
			local var_8_1 = {}
			local var_8_2 = arg_6_0:getTaskVOList()

			for iter_8_0, iter_8_1 in ipairs(var_8_2) do
				local var_8_3 = iter_8_1:getTaskStatus()
				local var_8_4, var_8_5 = arg_6_0:isTaskOverflow(iter_8_1)

				if var_8_3 == 1 and arg_6_0:isTaskUnlocked(iter_8_1) and not var_8_4 then
					table.insert(var_8_0, iter_8_1)
					table.insert(var_8_1, iter_8_1.id)
				end
			end

			if #var_8_0 > 0 then
				arg_6_0:setLastSubmitTask(var_8_1)
				pg.m02:sendNotification(GAME.SUBMIT_TASK_ONESTEP, {
					resultList = var_8_0
				})
			end
		end
	end, SFX_PANEL)
end

function var_0_0.updateData(arg_9_0)
	arg_9_0.taskVOList = arg_9_0:getTaskVOList()
	arg_9_0.taskVOListForShow = arg_9_0:getTaskVOListForShow()
end

function var_0_0.updateUI(arg_10_0)
	arg_10_0:updateData()
	arg_10_0:updateTaskList()
	arg_10_0:updateTaskProgress()
	arg_10_0:updateOneStepBtn()
end

function var_0_0.updateOutline(arg_11_0)
	return
end

function var_0_0.updateItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_1:Find("Icon")
	local var_12_1 = arg_12_1:Find("Count")

	setText(var_12_1, arg_12_2.count)

	if arg_12_2.type ~= DROP_TYPE_SHIP then
		setImageSprite(var_12_0, LoadSprite(arg_12_2:getIcon()))
	else
		local var_12_2 = Ship.New({
			configId = arg_12_2.id
		}):getPainting()

		setImageSprite(var_12_0, LoadSprite("QIcon/" .. var_12_2))
	end
end

function var_0_0.updateTaskList(arg_13_0)
	arg_13_0.taskUIList:align(#arg_13_0.taskVOListForShow)
end

function var_0_0.updateTask(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1:Find("Go")
	local var_14_1 = var_14_0:Find("Btn")
	local var_14_2 = var_14_0:Find("Progress")
	local var_14_3 = var_14_2:Find("Text")
	local var_14_4 = arg_14_1:Find("Get")
	local var_14_5 = var_14_4:Find("Btn")
	local var_14_6 = var_14_4:Find("Progress")
	local var_14_7 = var_14_6:Find("Text")
	local var_14_8 = arg_14_1:Find("Got")
	local var_14_9 = arg_14_2:getTaskStatus()

	setActive(var_14_0, var_14_9 == 0)
	setActive(var_14_4, var_14_9 == 1)
	setActive(var_14_8, var_14_9 == 2)

	local var_14_10 = arg_14_1:Find("DayImg")
	local var_14_11 = arg_14_0:getTaskUnlockSignCount(arg_14_2)

	setImageSprite(var_14_10, arg_14_0.daySpriteList[var_14_11])

	local var_14_12 = arg_14_1:Find("Lock")

	setActive(var_14_12, not arg_14_0:isTaskUnlocked(arg_14_2))

	local var_14_13 = arg_14_1:Find("DescText")

	setText(var_14_13, arg_14_2:getConfig("desc"))

	local var_14_14 = arg_14_2:getProgress()
	local var_14_15 = arg_14_2:getConfig("target_num")

	setSlider(var_14_2, 0, var_14_15, var_14_14)
	setText(var_14_3, var_14_14 .. "/" .. var_14_15)
	setSlider(var_14_6, 0, var_14_15, var_14_14)
	setText(var_14_7, var_14_14 .. "/" .. var_14_15)

	local var_14_16 = arg_14_1:Find("Drops")
	local var_14_17 = arg_14_0:getTaskAwardForShow(arg_14_2)
	local var_14_18 = UIItemList.New(var_14_16, arg_14_0.itemTpl)

	var_14_18:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			arg_15_1 = arg_15_1 + 1

			local var_15_0 = var_14_17[arg_15_1]

			arg_14_0:updateItem(arg_15_2, var_15_0)
		end
	end)
	var_14_18:align(#var_14_17)
	onButton(arg_14_0, var_14_1, function()
		pg.m02:sendNotification(GAME.TASK_GO, {
			taskVO = arg_14_2
		})
	end, SFX_PANEL)
	onButton(arg_14_0, var_14_5, function()
		local function var_17_0()
			pg.m02:sendNotification(GAME.SUBMIT_TASK, arg_14_2.id)
			arg_14_0:setLastSubmitTask({
				arg_14_2.id
			})
		end

		local var_17_1, var_17_2 = arg_14_0:isTaskOverflow(arg_14_2)

		if var_17_1 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("award_max_warning"),
				items = var_17_2,
				onYes = var_17_0
			})
		else
			var_17_0()
		end
	end, SFX_PANEL)
end

function var_0_0.updateTaskProgress(arg_19_0)
	local var_19_0 = arg_19_0:getTaskVOList()
	local var_19_1 = 0
	local var_19_2 = #var_19_0

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		if arg_19_0:isTaskUnlocked(iter_19_1) then
			var_19_1 = var_19_1 + 1
		end
	end

	setText(arg_19_0.taskProgressText, var_19_1 .. "/" .. var_19_2)
end

function var_0_0.updateOneStepBtn(arg_20_0)
	local var_20_0 = 0
	local var_20_1 = arg_20_0:getTaskVOList()

	for iter_20_0, iter_20_1 in ipairs(var_20_1) do
		if iter_20_1:getTaskStatus() == 1 and arg_20_0:isTaskUnlocked(iter_20_1) then
			var_20_0 = var_20_0 + 1
		end
	end

	setActive(arg_20_0.oneStepBtnDisable, not (var_20_0 > 1))
end

function var_0_0.getTaskVOList(arg_21_0)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(pg.return_task_template.all) do
		local var_21_1 = arg_21_0.taskProxy:getTaskVO(iter_21_1)

		table.insert(var_21_0, var_21_1)
	end

	return var_21_0
end

function var_0_0.getTaskVOListForShow(arg_22_0)
	local var_22_0 = {}
	local var_22_1 = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.taskVOList) do
		if arg_22_0:isTaskUnlocked(iter_22_1) then
			table.insert(var_22_0, iter_22_1)
		else
			table.insert(var_22_1, iter_22_1)
		end
	end

	local function var_22_2(arg_23_0, arg_23_1)
		local var_23_0 = arg_23_0:getTaskStatus()
		local var_23_1 = arg_23_1:getTaskStatus()

		if var_23_0 == 2 then
			var_23_0 = -1
		end

		if var_23_1 == 2 then
			var_23_1 = -1
		end

		if var_23_0 == var_23_1 then
			return arg_22_0:getTaskUnlockSignCount(arg_23_0) < arg_22_0:getTaskUnlockSignCount(arg_23_1)
		else
			return var_23_1 < var_23_0
		end
	end

	table.sort(var_22_0, var_22_2)

	local function var_22_3(arg_24_0, arg_24_1)
		return arg_24_0.id < arg_24_1.id
	end

	table.sort(var_22_1, var_22_3)

	local var_22_4 = {}

	for iter_22_2, iter_22_3 in ipairs(var_22_0) do
		table.insert(var_22_4, iter_22_3)
	end

	for iter_22_4, iter_22_5 in ipairs(var_22_1) do
		table.insert(var_22_4, iter_22_5)
	end

	return var_22_4
end

function var_0_0.getTaskUnlockSignCount(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1.id

	return pg.return_task_template[var_25_0].reward_date
end

function var_0_0.isTaskUnlocked(arg_26_0, arg_26_1)
	return arg_26_0:getTaskUnlockSignCount(arg_26_1) <= arg_26_0.refluxProxy.signCount
end

function var_0_0.isTaskOverflow(arg_27_0, arg_27_1)
	local var_27_0 = getProxy(PlayerProxy):getRawData()
	local var_27_1 = pg.gameset.urpt_chapter_max.description[1]
	local var_27_2

	var_27_2 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_27_1)

	local var_27_3 = arg_27_0:getTaskAwardForShow(arg_27_1)
	local var_27_4 = {
		var_27_3[1].type,
		var_27_3[1].id,
		var_27_3[1].count
	}
	local var_27_5 = {
		var_27_4
	}
	local var_27_6, var_27_7 = Task.StaticJudgeOverflow(false, false, false, true, true, var_27_5)

	return var_27_6, var_27_7
end

function var_0_0.isTaskListOverflow(arg_28_0)
	local var_28_0 = {}
	local var_28_1 = arg_28_0:getTaskVOList()

	for iter_28_0, iter_28_1 in ipairs(var_28_1) do
		if iter_28_1:getTaskStatus() == 1 and arg_28_0:isTaskUnlocked(iter_28_1) then
			local var_28_2 = arg_28_0:getTaskAwardForShow(iter_28_1)
			local var_28_3 = var_28_2[1].type
			local var_28_4 = var_28_2[1].id
			local var_28_5 = var_28_2[1].count
			local var_28_6 = var_28_0[var_28_4]

			if not var_28_6 then
				var_28_6 = {
					var_28_3,
					var_28_4,
					var_28_5
				}
			else
				var_28_6[3] = var_28_6[3] + var_28_5
			end

			var_28_0[var_28_4] = var_28_6
		end
	end

	local var_28_7 = {}

	for iter_28_2, iter_28_3 in pairs(var_28_0) do
		table.insert(var_28_7, iter_28_3)
	end

	local var_28_8, var_28_9 = Task.StaticJudgeOverflow(false, false, false, true, true, var_28_7)

	return var_28_8, var_28_9
end

function var_0_0.setLastSubmitTask(arg_29_0, arg_29_1)
	arg_29_0.lastSubmitTaskIDList = arg_29_1
end

function var_0_0.clearLastSubmitTask(arg_30_0)
	arg_30_0.lastSubmitTaskIDList = {}
end

function var_0_0.calcLastSubmitTaskPT(arg_31_0)
	local var_31_0 = 0
	local var_31_1 = 0

	for iter_31_0, iter_31_1 in ipairs(arg_31_0.lastSubmitTaskIDList) do
		local var_31_2 = pg.return_task_template[iter_31_1]

		var_31_0 = var_31_0 + var_31_2.pt_award
		var_31_1 = var_31_2.pt_item
	end

	arg_31_0:clearLastSubmitTask()

	return {
		type = DROP_TYPE_ITEM,
		id = var_31_1,
		count = var_31_0
	}
end

function var_0_0.getTaskAwardForShow(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1.id
	local var_32_1 = pg.return_task_template[var_32_0]
	local var_32_2 = var_32_1.level
	local var_32_3 = arg_32_0.refluxProxy.returnLV
	local var_32_4

	for iter_32_0, iter_32_1 in ipairs(var_32_2) do
		local var_32_5 = iter_32_1[1]
		local var_32_6 = iter_32_1[2]

		if var_32_5 <= var_32_3 and var_32_3 <= var_32_6 then
			var_32_4 = iter_32_0
		end
	end

	local var_32_7 = {}
	local var_32_8 = var_32_1.award_display[var_32_4]
	local var_32_9 = Drop.New({
		type = var_32_8[1],
		id = var_32_8[2],
		count = var_32_8[3]
	})

	table.insert(var_32_7, var_32_9)

	local var_32_10 = var_32_1.pt_award
	local var_32_11 = var_32_1.pt_item
	local var_32_12 = Drop.New({
		type = DROP_TYPE_ITEM,
		id = var_32_11,
		count = var_32_10
	})

	table.insert(var_32_7, var_32_12)

	return var_32_7
end

function var_0_0.isAnyTaskCanGetAward()
	local var_33_0 = getProxy(TaskProxy)
	local var_33_1 = getProxy(RefluxProxy)
	local var_33_2 = {}

	for iter_33_0, iter_33_1 in ipairs(pg.return_task_template.all) do
		local var_33_3 = var_33_0:getTaskVO(iter_33_1)

		table.insert(var_33_2, var_33_3)
	end

	local function var_33_4(arg_34_0)
		local var_34_0 = arg_34_0.id

		return pg.return_task_template[var_34_0].reward_date
	end

	local function var_33_5(arg_35_0)
		return var_33_4(arg_35_0) <= var_33_1.signCount
	end

	for iter_33_2, iter_33_3 in ipairs(var_33_2) do
		if iter_33_3:getTaskStatus() == 1 and var_33_5(iter_33_3) then
			return true
		end
	end

	return false
end

return var_0_0
