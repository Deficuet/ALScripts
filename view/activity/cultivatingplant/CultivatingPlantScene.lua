local var_0_0 = class("CultivatingPlantScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CultivatingPlantPartUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:closeView()
	end, SFX_CANCLE)
	onButton(arg_2_0, arg_2_0.uiCultivatingBtn, function()
		arg_2_0:emit(CultivatingPlantMediator.GO_SCENE)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiIslandBtn, function()
		local var_5_0 = getProxy(TaskProxy):getTaskVO(arg_2_0.taskList[arg_2_0.index])

		if var_5_0 == nil or not var_5_0:isFinish() then
			return
		end

		if not var_5_0:isReceive() then
			arg_2_0:emit(CultivatingPlantMediator.ON_TASK_SUBMIT, var_5_0)
		else
			arg_2_0:OpenLiveArea()
		end
	end, SFX_PANEL)

	for iter_2_0 = 1, arg_2_0.uiList.childCount do
		local var_2_0 = arg_2_0.uiList:GetChild(iter_2_0 - 1)

		onButton(arg_2_0, var_2_0, function()
			arg_2_0:SelectPage(iter_2_0)
		end, SFX_PANEL)
	end

	setText(arg_2_0.uiTaskTitle, i18n("cultivating_plant_task_title"))
	setText(arg_2_0.uiIslandText, i18n("cultivating_plant_island_task"))
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:BlurPanel(arg_7_0._tf)

	arg_7_0.taskList = CultivatingPlantTools.GetTaskIDList()

	arg_7_0:SelectPage(arg_7_0.contextData.id and arg_7_0.contextData.id + 1 or 1)
end

function var_0_0.willExit(arg_8_0)
	arg_8_0:UnOverlayPanel(arg_8_0._tf)

	if arg_8_0.liveAreaPage then
		arg_8_0.liveAreaPage:Destroy()

		arg_8_0.liveAreaPage = nil
	end
end

function var_0_0.SelectPage(arg_9_0, arg_9_1)
	if arg_9_0.index == arg_9_1 then
		return
	end

	local var_9_0 = 216
	local var_9_1 = 1238

	arg_9_0.index = arg_9_1

	for iter_9_0 = 1, arg_9_0.uiList.childCount do
		local var_9_2 = arg_9_0.uiList:GetChild(iter_9_0 - 1)

		var_9_2:GetComponent(typeof(LayoutElement)).preferredWidth = iter_9_0 == arg_9_1 and var_9_1 or var_9_0

		setActive(var_9_2:Find("Image"), iter_9_0 ~= arg_9_1)
		setActive(var_9_2:Find("main"), iter_9_0 == arg_9_1)

		local var_9_3 = getProxy(TaskProxy):getTaskVO(arg_9_0.taskList[iter_9_0])
		local var_9_4 = var_9_3 and var_9_3:isFinish() or false

		setActive(var_9_2:Find("Image/got"), var_9_4)
		setActive(var_9_2:Find("main/got"), var_9_4)
	end

	arg_9_0:RefreshTask()
	setText(arg_9_0.uiCultivatingText, i18n(string.format("cultivating_plant_part_" .. arg_9_0.index)))
end

function var_0_0.RefreshTask(arg_10_0)
	local var_10_0 = arg_10_0.taskList[arg_10_0.index]
	local var_10_1 = pg.task_data_template[var_10_0]
	local var_10_2 = getProxy(TaskProxy):getTaskVO(arg_10_0.taskList[arg_10_0.index])
	local var_10_3 = Drop.Create(var_10_1.award_display[1])

	updateDrop(arg_10_0.uiRewardItem, var_10_3)
	onButton(arg_10_0, arg_10_0.uiRewardItem, function()
		arg_10_0:emit(BaseUI.ON_DROP, var_10_3)
	end, SFX_PANEL)

	local var_10_4 = var_10_2 and var_10_2:isReceive() or false
	local var_10_5 = var_10_2 and var_10_2:isFinish() or false

	setActive(arg_10_0.uiRewardGot, var_10_4)
	setActive(arg_10_0.uiRed, var_10_5 and not var_10_4)
	setGray(arg_10_0.uiIslandBtn, not var_10_5)
	setText(arg_10_0.uiTaskDesc, var_10_1.desc)

	local var_10_6 = var_10_2 and var_10_2:getProgress() or 0

	setText(arg_10_0.uiTaskCnt, string.format("<color=#268BC5>%s</color>/%s", var_10_6, var_10_1.target_num))

	arg_10_0.uiSlider.fillAmount = var_10_6 / var_10_1.target_num

	setActive(arg_10_0.uiTask, false)
	setActive(arg_10_0.uiTask, true)
end

function var_0_0.OpenLiveArea(arg_12_0)
	if arg_12_0.liveAreaPage == nil then
		arg_12_0.liveAreaPage = MainLiveAreaPage.New(arg_12_0._parentTf, arg_12_0.event)
	end

	arg_12_0.liveAreaPage:ExecuteAction("Show", true, function()
		return
	end)
end

function var_0_0.RefreshSubmitTaskDone(arg_14_0)
	setActive(arg_14_0.uiRewardGot, true)
	setActive(arg_14_0.uiRed, false)
	arg_14_0:OpenLiveArea()
end

function var_0_0.onBackPressed(arg_15_0)
	if arg_15_0.liveAreaPage and arg_15_0.liveAreaPage:GetLoaded() and arg_15_0.liveAreaPage:isShowing() then
		arg_15_0.liveAreaPage:Hide()

		return true
	end

	return false
end

return var_0_0
