local var_0_0 = class("WorldInformationLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "WorldInformationUI"
end

var_0_0.Listeners = {
	onUpdateDailyTask = "OnUpdateDailyTask",
	onUpdateTask = "OnUpdateTask"
}

function var_0_0.init(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(var_0_0.Listeners) do
		arg_2_0[iter_2_0] = function(...)
			var_0_0[iter_2_1](arg_2_0, ...)
		end
	end

	arg_2_0.rtLeftPanel = arg_2_0:findTF("adapt/left_panel")

	setText(arg_2_0.rtLeftPanel:Find("title/Text"), i18n("world_map_title_tips"))
	setText(arg_2_0.rtLeftPanel:Find("title/Text_en"), i18n("world_map_title_tips_en"))

	arg_2_0.wsWorldInfo = WSWorldInfo.New()
	arg_2_0.wsWorldInfo.transform = arg_2_0.rtLeftPanel:Find("world_info")

	arg_2_0.wsWorldInfo:Setup()
	setText(arg_2_0.wsWorldInfo.transform:Find("power/bg/Word"), i18n("world_total_power"))
	setText(arg_2_0.wsWorldInfo.transform:Find("explore/mileage/Text"), i18n("world_mileage"))
	setText(arg_2_0.wsWorldInfo.transform:Find("explore/pressing/Text"), i18n("world_pressing"))

	arg_2_0.rtRightPanel = arg_2_0:findTF("adapt/right_panel")
	arg_2_0.rtNothingTip = arg_2_0.rtRightPanel:Find("nothing_tip")
	arg_2_0.btnClose = arg_2_0.rtRightPanel:Find("title/close_btn")
	arg_2_0.toggleAll = arg_2_0.rtRightPanel:Find("title/task_all")
	arg_2_0.toggleMain = arg_2_0.rtRightPanel:Find("title/task_main")
	arg_2_0.rtContainer = arg_2_0.rtRightPanel:Find("main/viewport/content")
	arg_2_0.taskItemList = UIItemList.New(arg_2_0.rtContainer, arg_2_0.rtContainer:Find("task_tpl"))

	arg_2_0.taskItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateTaskTpl(arg_4_2, arg_2_0.filterTaskList[arg_4_1 + 1])
		end
	end)

	arg_2_0.btnDailyTask = arg_2_0.rtLeftPanel:Find("world_info/task_btn")
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.btnClose, function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0:findTF("bg"), function()
		triggerButton(arg_5_0.btnClose)
	end, SFX_CANCEL)
	onToggle(arg_5_0, arg_5_0.toggleAll, function(arg_8_0)
		if arg_8_0 then
			arg_5_0.filterType = nil

			arg_5_0:UpdateFilterTaskList()
		end

		setTextColor(arg_5_0.toggleAll, arg_8_0 and Color.white or Color.New(0.48627450980392156, 0.5215686274509804, 0.6431372549019608))
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0.toggleMain, function(arg_9_0)
		if arg_9_0 then
			arg_5_0.filterType = 0

			arg_5_0:UpdateFilterTaskList()
		end

		setTextColor(arg_5_0.toggleMain, arg_9_0 and Color.white or Color.New(0.48627450980392156, 0.5215686274509804, 0.6431372549019608))
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnDailyTask, function()
		if nowWorld():IsSystemOpen(WorldConst.SystemDailyTask) then
			arg_5_0:emit(WorldInformationMediator.OnOpenDailyTaskPanel)
		else
			pg.TipsMgr.GetInstance(i18n("world_daily_task_lock"))
		end
	end, SFX_PANEL)
	arg_5_0:OnUpdateDailyTask()
	triggerToggle(arg_5_0.toggleAll, true)
	arg_5_0:BlurPanel(arg_5_0._tf)
end

function var_0_0.willExit(arg_11_0)
	arg_11_0:UnOverlayPanel(arg_11_0._tf)
	arg_11_0.taskProxy:RemoveListener(WorldTaskProxy.EventUpdateTask, arg_11_0.onUpdateTask)
	arg_11_0.taskProxy:RemoveListener(WorldTaskProxy.EventUpdateDailyTaskIds, arg_11_0.onUpdateDailyTask)
	arg_11_0.wsWorldInfo:Dispose()
end

function var_0_0.setWorldTaskProxy(arg_12_0, arg_12_1)
	arg_12_0.taskProxy = arg_12_1

	arg_12_0.taskProxy:AddListener(WorldTaskProxy.EventUpdateTask, arg_12_0.onUpdateTask)
	arg_12_0.taskProxy:AddListener(WorldTaskProxy.EventUpdateDailyTaskIds, arg_12_0.onUpdateDailyTask)

	arg_12_0.taskList = arg_12_0.taskProxy:getDoingTaskVOs()
end

function var_0_0.UpdateFilterTaskList(arg_13_0)
	arg_13_0.filterTaskList = _.filter(arg_13_0.taskList, function(arg_14_0)
		return not arg_13_0.filterType or arg_14_0.config.type == arg_13_0.filterType
	end)

	table.sort(arg_13_0.filterTaskList, CompareFuncs(WorldTask.sortDic))
	arg_13_0.taskItemList:align(#arg_13_0.filterTaskList)
	setActive(arg_13_0.rtNothingTip, #arg_13_0.filterTaskList == 0)
end

function var_0_0.UpdateTaskTpl(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_1:Find("base_panel")

	GetImageSpriteFromAtlasAsync("ui/worldtaskfloatui_atlas", pg.WorldToastMgr.Type2PictrueName[arg_15_2.config.type], var_15_0:Find("type"), true)
	setText(var_15_0:Find("extend_show/title/Text"), arg_15_2.config.name)
	setText(var_15_0:Find("base_show/title/Text"), arg_15_2.config.name)
	setText(var_15_0:Find("base_show/desc"), arg_15_2.config.description)

	local var_15_1 = var_15_0:Find("base_show/IconTpl")
	local var_15_2 = var_15_0:Find("base_show/award")

	removeAllChildren(var_15_2)

	local var_15_3 = arg_15_2.config.show

	for iter_15_0 = 1, math.min(#var_15_3, 2) do
		local var_15_4 = var_15_3[iter_15_0]
		local var_15_5 = cloneTplTo(var_15_1, var_15_2)
		local var_15_6 = {
			type = var_15_4[1],
			id = var_15_4[2],
			count = var_15_4[3]
		}

		updateDrop(var_15_5, var_15_6)
		onButton(arg_15_0, var_15_5, function()
			arg_15_0:emit(var_0_0.ON_DROP, var_15_6)
		end, SFX_PANEL)
		setActive(var_15_5, true)
	end

	setActive(var_15_1, false)
	setSlider(var_15_0:Find("base_show/title/progress"), 0, arg_15_2:getMaxProgress(), arg_15_2:getProgress())

	local var_15_7 = var_15_0:Find("btn_go")

	onButton(arg_15_0, var_15_7, function()
		arg_15_0:emit(WorldInformationMediator.OnTaskGoto, arg_15_2.id)
		arg_15_0:closeView()
	end, SFX_PANEL)
	setButtonEnabled(var_15_7, tobool(arg_15_2:GetFollowingAreaId() or arg_15_2:GetFollowingEntrance()))

	local var_15_8 = var_15_0:Find("btn_get")

	onButton(arg_15_0, var_15_8, function()
		arg_15_0:emit(WorldInformationMediator.OnSubmitTask, arg_15_2)
	end, SFX_CONFIRM)

	local var_15_9 = arg_15_2:getState()

	setActive(var_15_7, var_15_9 == WorldTask.STATE_ONGOING)
	setActive(var_15_8, var_15_9 == WorldTask.STATE_FINISHED)

	local var_15_10 = arg_15_1:Find("extend_panel")
	local var_15_11 = arg_15_2.config.rare_task_icon

	if #var_15_11 > 0 then
		GetImageSpriteFromAtlasAsync("shipyardicon/" .. var_15_11, "", var_15_10:Find("card"), true)
	else
		GetImageSpriteFromAtlasAsync("ui/worldinformationui_atlas", "nobody", var_15_10:Find("card"), true)
	end

	setText(var_15_10:Find("content/desc"), arg_15_2.config.rare_task_text)
	setText(var_15_10:Find("content/slider_progress/Text"), arg_15_2:getProgress() .. "/" .. arg_15_2:getMaxProgress())
	setSlider(var_15_10:Find("content/slider"), 0, arg_15_2:getMaxProgress(), arg_15_2:getProgress())

	local var_15_12 = var_15_10:Find("content/item_tpl")
	local var_15_13 = var_15_10:Find("content/award_bg/panel/content")
	local var_15_14 = arg_15_2.config.show

	removeAllChildren(var_15_13)

	for iter_15_1, iter_15_2 in ipairs(var_15_14) do
		local var_15_15 = cloneTplTo(var_15_12, var_15_13)
		local var_15_16 = {
			type = iter_15_2[1],
			id = iter_15_2[2],
			count = iter_15_2[3]
		}

		updateDrop(var_15_15, var_15_16)
		onButton(arg_15_0, var_15_15, function()
			arg_15_0:emit(var_0_0.ON_DROP, var_15_16)
		end, SFX_PANEL)
		setActive(var_15_15, true)
	end

	setActive(var_15_12, false)
	setActive(var_15_10:Find("content/award_bg/arror"), #var_15_14 > 3)
end

function var_0_0.OnUpdateTask(arg_20_0)
	arg_20_0.taskList = arg_20_0.taskProxy:getDoingTaskVOs()

	arg_20_0:UpdateFilterTaskList()
end

function var_0_0.OnUpdateDailyTask(arg_21_0)
	setActive(arg_21_0.btnDailyTask:Find("tip"), arg_21_0.taskProxy:canAcceptDailyTask())
	setActive(arg_21_0.btnDailyTask:Find("locked"), not nowWorld():IsSystemOpen(WorldConst.SystemDailyTask))
end

return var_0_0
