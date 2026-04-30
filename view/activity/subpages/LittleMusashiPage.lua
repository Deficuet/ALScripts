local var_0_0 = class("LittleMusashiPage", import(".TemplatePage.PtTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.helpBtn = arg_1_0.bg:Find("help_btn")

	onButton(arg_1_0, arg_1_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = arg_1_0:GetHelpTip()
		})
	end, SFX_PANEL)
end

function var_0_0.GetHelpTip(arg_3_0)
	return pg.gametip.littleMusashi_npc.tip
end

function var_0_0.OnUpdateFlush(arg_4_0)
	var_0_0.super.OnUpdateFlush(arg_4_0)
	setActive(arg_4_0.battleBtn, false)

	local var_4_0, var_4_1, var_4_2 = arg_4_0.ptData:GetLevelProgress()
	local var_4_3, var_4_4, var_4_5 = arg_4_0.ptData:GetResProgress()

	setText(arg_4_0.step, setColorStr(var_4_0, "#838fff") .. " / " .. setColorStr(var_4_1, "#666176"))
	setText(arg_4_0.progress, (var_4_5 >= 1 and setColorStr(var_4_3, COLOR_GREEN) or setColorStr(var_4_3, "#7780d3")) .. "/" .. setColorStr(var_4_4, "#666176"))

	if arg_4_0.firstSliderInit then
		if LeanTween.isTweening(go(arg_4_0.slider)) then
			LeanTween.cancel(go(arg_4_0.slider))
		end

		local var_4_6 = GetComponent(arg_4_0.slider, typeof(Slider)).value
		local var_4_7 = arg_4_0.l1 ~= var_4_0 and 0 or arg_4_0.sliderValue

		LeanTween.value(go(arg_4_0.slider), var_4_7, var_4_5, 1):setOnUpdate(System.Action_float(function(arg_5_0)
			setSlider(arg_4_0.slider, 0, 1, arg_5_0)

			arg_4_0.sliderValue = arg_5_0
		end))
	else
		setSlider(arg_4_0.slider, 0, 1, var_4_5)

		arg_4_0.firstSliderInit = true
		arg_4_0.sliderValue = var_4_5
	end

	arg_4_0.l1 = var_4_0

	arg_4_0:updataTask()
	arg_4_0:sortTaskGroups()
	arg_4_0:updateTaskUI()
end

function var_0_0.updataTask(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.taskGroups) do
		for iter_6_2, iter_6_3 in ipairs(iter_6_1.tasks) do
			local var_6_0 = arg_6_0.taskProxy:getFinishTaskById(iter_6_3.id) and 1 or 0
			local var_6_1 = arg_6_0.taskProxy:getTaskById(iter_6_3.id)
			local var_6_2 = 0

			if var_6_1 then
				var_6_2 = var_6_1:getProgress()
				iter_6_1.progress = var_6_2 == 0 and iter_6_1.progress or var_6_2
			else
				var_6_2 = iter_6_1.progress
			end

			iter_6_3.progress = var_6_2

			if iter_6_3.finish ~= var_6_0 then
				setActive(iter_6_3.tf, false)
				table.insert(arg_6_0.taskTplPool, iter_6_3.tf)

				iter_6_3.tf = nil
			end

			iter_6_3.finish = var_6_0
		end
	end
end

function var_0_0.OnFirstFlush(arg_7_0)
	var_0_0.super.OnFirstFlush(arg_7_0)
	onButton(arg_7_0, arg_7_0.displayBtn, function()
		arg_7_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			blur = true,
			type = 5,
			dropList = arg_7_0.ptData.dropList,
			targets = arg_7_0.ptData.targets,
			level = arg_7_0.ptData.level,
			count = arg_7_0.ptData.count,
			resId = arg_7_0.ptData.resId,
			resIcon = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = arg_7_0.ptData.resId
			}):getIcon()
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.battleBtn, function()
		arg_7_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.LEVEL)
	end, SFX_PANEL)
	arg_7_0:initTask()
	arg_7_0:sortTaskGroups()
	arg_7_0:updateTaskUI()
end

function var_0_0.initTask(arg_10_0)
	arg_10_0.missionTpl = findTF(arg_10_0.bg, "missionTpl")

	setActive(arg_10_0.missionTpl, false)

	arg_10_0.missionContainer = findTF(arg_10_0.bg, "mission/content")

	local var_10_0 = arg_10_0.activity:getConfig("config_client").task_act_id
	local var_10_1 = pg.activity_template[var_10_0].config_data

	arg_10_0.taskProxy = getProxy(TaskProxy)
	arg_10_0.taskTplPool = {}
	arg_10_0.taskScroll = GetComponent(findTF(arg_10_0.bg, "mission"), typeof(ScrollRect))
	arg_10_0.taskGroups = {}

	for iter_10_0 = 1, #var_10_1 do
		local var_10_2 = var_10_1[iter_10_0]
		local var_10_3 = pg.task_data_template[var_10_2]
		local var_10_4 = var_10_3.type
		local var_10_5 = var_10_3.sub_type

		if var_10_4 == Task.TYPE_ACTIVITY or var_10_4 == Task.TYPE_ACTIVITY_BRANCH then
			local var_10_6 = arg_10_0:getTaskGroup(var_10_4, var_10_5)

			arg_10_0:insertTaskToGroup(var_10_2, var_10_3, var_10_6)
		end
	end
end

function var_0_0.updateTaskUI(arg_11_0)
	local var_11_0 = 0

	for iter_11_0 = 1, #arg_11_0.taskGroups do
		local var_11_1 = arg_11_0.taskGroups[iter_11_0]
		local var_11_2 = var_11_1.tasks

		for iter_11_1, iter_11_2 in ipairs(var_11_2) do
			arg_11_0:updateTaskList(iter_11_1, var_11_0, iter_11_2, var_11_1)

			var_11_0 = var_11_0 + 1
		end
	end

	local var_11_3 = 0
	local var_11_4 = 0

	if arg_11_0.scrollToGroup then
		for iter_11_3, iter_11_4 in ipairs(arg_11_0.taskGroups) do
			if iter_11_4 == arg_11_0.scrollToGroup then
				var_11_4 = var_11_3
			end

			if iter_11_4.opening then
				var_11_3 = var_11_3 + #iter_11_4.tasks
			else
				var_11_3 = var_11_3 + 1
			end
		end

		arg_11_0.scrollToGroup = nil
	end

	if var_11_4 ~= 0 and var_11_3 ~= 0 then
		scrollTo(arg_11_0.taskScroll, 0, 1 - var_11_4 / var_11_3)
	else
		scrollTo(arg_11_0.taskScroll, 0, 1)
	end
end

function var_0_0.updateTaskList(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	if not arg_12_3.show then
		return
	end

	local var_12_0 = arg_12_3.targetNum
	local var_12_1 = arg_12_3.progress
	local var_12_2 = arg_12_3.finish == 1
	local var_12_3 = arg_12_1 == 1
	local var_12_4 = arg_12_3.desc
	local var_12_5 = arg_12_3.drop
	local var_12_6 = arg_12_4.opening
	local var_12_7 = #arg_12_4.tasks == 1

	if not arg_12_3.tf then
		arg_12_3.tf = arg_12_0:getTaskTfFromPool()
	end

	local var_12_8 = findTF(arg_12_3.tf, "AD")

	if var_12_2 then
		setActive(findTF(var_12_8, "pahase"), false)
		setSlider(findTF(var_12_8, "slider"), 0, 1, 1)
	else
		setActive(findTF(var_12_8, "pahase"), true)
		setSlider(findTF(var_12_8, "slider"), 0, 1, var_12_1 / var_12_0)
	end

	setText(findTF(var_12_8, "desc"), var_12_4)

	if arg_12_4.subType ~= 33 then
		setText(findTF(var_12_8, "pahase"), setColorStr(var_12_1, "#19383") .. "/" .. setColorStr(var_12_0, "#5c5967"))
	else
		setText(findTF(var_12_8, "pahase"), "")
	end

	updateDrop(findTF(var_12_8, "award"), var_12_5)
	onButton(arg_12_0, findTF(var_12_8, "award"), function()
		arg_12_0:emit(BaseUI.ON_DROP, var_12_5)
	end, SFX_PANEL)
	setActive(findTF(var_12_8, "got"), false)
	setActive(findTF(var_12_8, "get"), false)
	setActive(findTF(var_12_8, "go"), false)

	if not var_12_3 then
		setActive(findTF(var_12_8, "go"), not var_12_2)
		onButton(arg_12_0, findTF(var_12_8, "go"), function()
			local var_14_0 = arg_12_0.taskProxy:getTaskById(arg_12_3.id) or Task.New({
				id = arg_12_3.id
			})

			if var_14_0 then
				arg_12_0:emit(ActivityMediator.ON_TASK_GO, var_14_0)
			end
		end, SFX_CONFIRM)
		setActive(findTF(var_12_8, "got"), var_12_2)
	elseif var_12_2 then
		setActive(findTF(var_12_8, "got"), true)
	elseif var_12_0 <= var_12_1 then
		setActive(findTF(var_12_8, "get"), true)
		onButton(arg_12_0, findTF(var_12_8, "get"), function()
			local var_15_0 = arg_12_0.taskProxy:getTaskById(arg_12_3.id)

			if var_15_0 then
				arg_12_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_15_0)
			end
		end, SFX_CONFIRM)
	else
		setActive(findTF(var_12_8, "go"), true)
		onButton(arg_12_0, findTF(var_12_8, "go"), function()
			local var_16_0 = arg_12_0.taskProxy:getTaskById(arg_12_3.id) or Task.New({
				id = arg_12_3.id
			})

			if var_16_0 then
				arg_12_0:emit(ActivityMediator.ON_TASK_GO, var_16_0)
			end
		end, SFX_CONFIRM)
	end

	if var_12_7 or not var_12_3 or var_12_2 and var_12_3 then
		setActive(findTF(var_12_8, "show"), false)
	else
		setActive(findTF(var_12_8, "show"), true)
		setActive(findTF(var_12_8, "show/on"), var_12_6)
		setActive(findTF(var_12_8, "show/off"), not var_12_6)
	end

	if var_12_3 then
		onButton(arg_12_0, findTF(var_12_8, "show"), function()
			arg_12_0:changeGroupOpening(arg_12_4)
		end, SFX_CONFIRM)
	end

	setActive(arg_12_3.tf, true)
	arg_12_3.tf:SetSiblingIndex(arg_12_2)
end

function var_0_0.changeGroupOpening(arg_18_0, arg_18_1)
	arg_18_1.opening = not arg_18_1.opening

	for iter_18_0 = 1, #arg_18_1.tasks do
		local var_18_0 = arg_18_1.tasks[iter_18_0]

		if iter_18_0 == 1 then
			var_18_0.show = true
		else
			var_18_0.show = arg_18_1.opening
		end

		if not var_18_0.show and var_18_0.tf then
			setActive(var_18_0.tf, false)
			table.insert(arg_18_0.taskTplPool, var_18_0.tf)

			var_18_0.tf = nil
		end
	end

	arg_18_0.scrollToGroup = arg_18_1

	arg_18_0:updateTaskUI()
end

function var_0_0.getTaskTfFromPool(arg_19_0)
	if #arg_19_0.taskTplPool > 0 then
		return table.remove(arg_19_0.taskTplPool, 1)
	end

	local var_19_0 = tf(Instantiate(arg_19_0.missionTpl))

	SetParent(var_19_0, arg_19_0.missionContainer)

	return var_19_0
end

function var_0_0.getTaskGroup(arg_20_0, arg_20_1, arg_20_2)
	for iter_20_0 = 1, #arg_20_0.taskGroups do
		local var_20_0 = arg_20_0.taskGroups[iter_20_0]

		if var_20_0.type == arg_20_1 and var_20_0.subType == arg_20_2 then
			return var_20_0
		end
	end

	local var_20_1 = {
		opening = false,
		progress = 0,
		type = arg_20_1,
		subType = arg_20_2,
		tasks = {}
	}

	table.insert(arg_20_0.taskGroups, var_20_1)

	return var_20_1
end

function var_0_0.insertTaskToGroup(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = arg_21_3.tasks

	for iter_21_0 = 1, #var_21_0 do
		if var_21_0[iter_21_0].id == arg_21_1 then
			return
		end
	end

	local var_21_1 = arg_21_2.target_num
	local var_21_2 = arg_21_2.desc
	local var_21_3 = {
		type = arg_21_2.award_display[1][1],
		id = arg_21_2.award_display[1][2],
		count = arg_21_2.award_display[1][3]
	}
	local var_21_4 = false

	if #arg_21_3.tasks == 0 then
		var_21_4 = true
	end

	local var_21_5 = arg_21_0.taskProxy:getFinishTaskById(arg_21_1) and 1 or 0
	local var_21_6 = arg_21_0.taskProxy:getTaskById(arg_21_1)
	local var_21_7 = 0

	if var_21_6 then
		var_21_7 = var_21_6:getProgress()
		arg_21_3.progress = var_21_7 == 0 and arg_21_3.progress or var_21_7
	else
		var_21_7 = arg_21_3.progress
	end

	table.insert(arg_21_3.tasks, {
		id = arg_21_1,
		targetNum = var_21_1,
		show = var_21_4,
		finish = var_21_5,
		progress = var_21_7,
		desc = var_21_2,
		drop = var_21_3
	})
end

function var_0_0.sortTaskGroups(arg_22_0)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.taskGroups) do
		table.sort(iter_22_1.tasks, function(arg_23_0, arg_23_1)
			if arg_23_0.finish ~= arg_23_1.finish then
				return arg_23_0.finish < arg_23_1.finish
			end

			return arg_23_0.targetNum < arg_23_1.targetNum
		end)
	end

	table.sort(arg_22_0.taskGroups, function(arg_24_0, arg_24_1)
		local var_24_0 = arg_24_0.tasks
		local var_24_1 = arg_24_1.tasks
		local var_24_2 = 0
		local var_24_3 = arg_24_0.tasks[1].id
		local var_24_4 = 0
		local var_24_5 = 0
		local var_24_6 = 0
		local var_24_7 = arg_24_1.tasks[1].id
		local var_24_8 = 0
		local var_24_9 = 0

		for iter_24_0, iter_24_1 in ipairs(var_24_0) do
			if var_24_2 == 0 and iter_24_1.finish == 0 and iter_24_1.progress >= iter_24_1.targetNum then
				var_24_2 = 1
				var_24_3 = iter_24_1.id
			end

			var_24_4 = iter_24_1.finish == 1 and var_24_4 + 1 or var_24_4
		end

		local var_24_10 = var_24_4 == #var_24_0 and 1 or 0

		for iter_24_2, iter_24_3 in ipairs(var_24_1) do
			if var_24_6 == 0 and iter_24_3.finish == 0 and iter_24_3.progress >= iter_24_3.targetNum then
				var_24_6 = 1
				var_24_7 = iter_24_3.id
			end

			var_24_8 = iter_24_3.finish == 1 and var_24_8 + 1 or var_24_8
		end

		local var_24_11 = var_24_8 == #var_24_1 and 1 or 0

		if var_24_2 ~= var_24_6 then
			return var_24_6 < var_24_2
		elseif var_24_10 ~= var_24_11 then
			return var_24_10 < var_24_11
		else
			return var_24_3 < var_24_7
		end
	end)

	for iter_22_2, iter_22_3 in ipairs(arg_22_0.taskGroups) do
		local var_22_0 = iter_22_3.opening
		local var_22_1 = iter_22_3.tasks

		for iter_22_4 = 1, #var_22_1 do
			local var_22_2 = var_22_1[iter_22_4]

			if iter_22_4 == 1 then
				var_22_2.show = true
			elseif var_22_0 then
				var_22_2.show = true
			else
				var_22_2.show = false
			end
		end
	end
end

function var_0_0.OnDestroy(arg_25_0)
	if LeanTween.isTweening(go(arg_25_0.slider)) then
		LeanTween.cancel(go(arg_25_0.slider))
	end
end

return var_0_0
