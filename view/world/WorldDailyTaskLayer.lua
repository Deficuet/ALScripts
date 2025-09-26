local var_0_0 = class("WorldDailyTaskLayer", import("view.base.BaseUI"))

var_0_0.Listeners = {
	onUpdateTasks = "OnUpdateTasks"
}
var_0_0.optionsPath = {
	"blur_panel/adapt/top/title/option"
}

function var_0_0.getUIName(arg_1_0)
	return "WorldDailyTaskUI"
end

function var_0_0.init(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(var_0_0.Listeners) do
		arg_2_0[iter_2_0] = function(...)
			var_0_0[iter_2_1](arg_2_0, ...)
		end
	end

	arg_2_0.rtBg = arg_2_0:findTF("bg")
	arg_2_0.rtBlurPanel = arg_2_0:findTF("blur_panel")
	arg_2_0.rtTasks = arg_2_0.rtBlurPanel:Find("adapt/tasks")

	setText(arg_2_0.rtTasks:Find("frame/empty/Text"), i18n("world_daily_task_none"))
	setText(arg_2_0.rtTasks:Find("frame/empty/Text_en"), i18n("world_daily_task_none_2"))

	arg_2_0.rtTop = arg_2_0.rtBlurPanel:Find("adapt/top")
	arg_2_0.btnBack = arg_2_0.rtTop:Find("title/back_button")
	arg_2_0.btnAllAccept = arg_2_0.rtTop:Find("title/btn_accept_all")
	arg_2_0.rtTopTitle = arg_2_0.rtTop:Find("title")
	arg_2_0.rtImageTitle = arg_2_0.rtTopTitle:Find("print/title")
	arg_2_0.rtImageTitleTask = arg_2_0.rtTopTitle:Find("print/title_task")
	arg_2_0.rtImageTitleShop = arg_2_0.rtTopTitle:Find("print/title_shop")
	arg_2_0.rtTaskWindow = arg_2_0:findTF("task_window")
	arg_2_0.wsTasks = {}

	local var_2_0 = arg_2_0.rtTasks:Find("frame/viewport/content")
	local var_2_1 = var_2_0:GetChild(0)

	arg_2_0.taskItemList = UIItemList.New(var_2_0, var_2_1)

	arg_2_0.taskItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_2_0.wsTasks[arg_4_1]

			if not var_4_0 then
				var_4_0 = WSPortTask.New(arg_4_2)

				onButton(arg_2_0, var_4_0.btnInactive, function()
					local var_5_0, var_5_1 = WorldTask.canTrigger(var_4_0.task.id)

					if var_5_0 then
						arg_2_0:emit(WorldDailyTaskMediator.OnAccepetTask, {
							var_4_0.task.id
						})
					else
						pg.TipsMgr.GetInstance():ShowTips(var_5_1)
					end
				end, SFX_PANEL)
				onButton(arg_2_0, var_4_0.btnOnGoing, function()
					arg_2_0:showTaskWindow(var_4_0.task)
				end, SFX_PANEL)
				onButton(arg_2_0, var_4_0.btnFinished, function()
					arg_2_0:emit(WorldDailyTaskMediator.OnSubmitTask, var_4_0.task)
				end, SFX_PANEL)

				function var_4_0.onDrop(arg_8_0)
					arg_2_0:emit(var_0_0.ON_DROP, arg_8_0)
				end

				arg_2_0.wsTasks[arg_4_1] = var_4_0
			end

			var_4_0:Setup(arg_2_0.taskVOs[arg_4_1])
		end
	end)
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:BlurPanel(arg_9_0._tf)
	arg_9_0:BlurPanel(arg_9_0.rtBlurPanel)
	onButton(arg_9_0, arg_9_0.btnBack, function()
		arg_9_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.btnAllAccept, function()
		arg_9_0:emit(WorldDailyTaskMediator.OnAccepetTask, underscore.map(arg_9_0.taskVOs, function(arg_12_0)
			return arg_12_0.id
		end))
	end, SFX_CONFIRM)
	arg_9_0:OnUpdateTasks()
end

function var_0_0.onBackPressed(arg_13_0)
	triggerButton(arg_13_0.btnBack)
end

function var_0_0.willExit(arg_14_0)
	arg_14_0:UnOverlayPanel(arg_14_0.rtBlurPanel, arg_14_0._tf)
	arg_14_0:UnOverlayPanel(arg_14_0._tf)
	arg_14_0:DisposeTasks()
	arg_14_0.taskProxy:RemoveListener(WorldTaskProxy.EventUpdateDailyTaskIds, arg_14_0.onUpdateTasks)

	arg_14_0.taskProxy = nil
end

function var_0_0.SetTaskProxy(arg_15_0, arg_15_1)
	arg_15_0.taskProxy = arg_15_1

	arg_15_0.taskProxy:AddListener(WorldTaskProxy.EventUpdateDailyTaskIds, arg_15_0.onUpdateTasks)
end

function var_0_0.OnUpdateTasks(arg_16_0)
	arg_16_0.taskVOs = underscore.map(arg_16_0.taskProxy:getDailyTaskIds(), function(arg_17_0)
		return WorldTask.New({
			id = arg_17_0
		})
	end)

	table.sort(arg_16_0.taskVOs, CompareFuncs(WorldTask.sortDic))
	arg_16_0.taskItemList:align(#arg_16_0.taskVOs)

	local var_16_0 = arg_16_0.rtTasks:Find("frame/empty")

	setActive(var_16_0, #arg_16_0.taskVOs == 0)
	setActive(arg_16_0.btnAllAccept, arg_16_0.taskProxy:canAcceptDailyTask())
end

function var_0_0.DisposeTasks(arg_18_0)
	_.each(arg_18_0.wsTasks, function(arg_19_0)
		arg_19_0:Dispose()
	end)

	arg_18_0.wsTasks = nil
end

function var_0_0.showTaskWindow(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1.config.rare_task_icon
	local var_20_1 = arg_20_0.rtTaskWindow:Find("main_window/left_panel")

	setActive(var_20_1:Find("bg"), arg_20_1:IsSpecialType())

	if #var_20_0 > 0 then
		GetImageSpriteFromAtlasAsync("shipyardicon/" .. var_20_0, "", var_20_1:Find("card"), true)
	else
		GetImageSpriteFromAtlasAsync("ui/worldportui_atlas", "nobody", var_20_1:Find("card"), true)
	end

	local var_20_2 = arg_20_0.rtTaskWindow:Find("main_window/right_panel")

	setText(var_20_2:Find("title/Text"), arg_20_1.config.name)
	setText(var_20_2:Find("content/desc"), arg_20_1.config.rare_task_text)
	setText(var_20_2:Find("content/slider_progress/Text"), arg_20_1:getProgress() .. "/" .. arg_20_1:getMaxProgress())
	setSlider(var_20_2:Find("content/slider"), 0, arg_20_1:getMaxProgress(), arg_20_1:getProgress())

	local var_20_3 = var_20_2:Find("content/item_tpl")
	local var_20_4 = var_20_2:Find("content/award_bg/panel/content")
	local var_20_5 = arg_20_1.config.show

	removeAllChildren(var_20_4)

	for iter_20_0, iter_20_1 in ipairs(var_20_5) do
		local var_20_6 = cloneTplTo(var_20_3, var_20_4)
		local var_20_7 = {
			type = iter_20_1[1],
			id = iter_20_1[2],
			count = iter_20_1[3]
		}

		updateDrop(var_20_6, var_20_7)
		onButton(arg_20_0, var_20_6, function()
			arg_20_0:emit(var_0_0.ON_DROP, var_20_7)
		end, SFX_PANEL)
		setActive(var_20_6, true)
	end

	setActive(var_20_3, false)
	setActive(var_20_2:Find("content/award_bg/arror"), #var_20_5 > 3)
	onButton(arg_20_0, var_20_2:Find("btn_close"), function()
		arg_20_0:hideTaskWindow()
	end, SFX_CANCEL)
	onButton(arg_20_0, arg_20_0.rtTaskWindow:Find("bg"), function()
		arg_20_0:hideTaskWindow()
	end, SFX_CANCEL)
	onButton(arg_20_0, var_20_2:Find("btn_go"), function()
		arg_20_0:hideTaskWindow()
		arg_20_0:emit(WorldDailyTaskMediator.OnTaskGoto, arg_20_1.id)
	end, SFX_PANEL)
	setButtonEnabled(var_20_2:Find("btn_go"), arg_20_1:GetFollowingAreaId() or arg_20_1:GetFollowingEntrance())
	setActive(arg_20_0.rtTaskWindow, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_20_0.rtTaskWindow)
end

function var_0_0.hideTaskWindow(arg_25_0)
	setActive(arg_25_0.rtTaskWindow, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_25_0.rtTaskWindow, arg_25_0._tf)
end

return var_0_0
