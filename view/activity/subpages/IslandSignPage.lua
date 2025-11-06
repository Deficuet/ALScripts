local var_0_0 = class("IslandSignPage", import("view.base.BaseActivityPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSignPage"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.uilist = UIItemList.New(arg_2_0.uiItemsTf, arg_2_0.uiItemTf)
	arg_2_0.uiGotList = UIItemList.New(arg_2_0.uiItemsGetTf, arg_2_0.uiGotItemTf)

	setText(arg_2_0.uiText, i18n("island_sign_text"))
end

function var_0_0.OnDataSetting(arg_3_0)
	arg_3_0.actTaskProxy = getProxy(ActivityTaskProxy)
	arg_3_0.taskGroup = underscore.flatten(arg_3_0.activity:getConfig("config_data"))
	arg_3_0.taskConfig = pg.task_data_template
end

function var_0_0.UpdateTaskData(arg_4_0)
	arg_4_0.taskVOs = arg_4_0.actTaskProxy:getTaskById(arg_4_0.activity.id)
	arg_4_0.finishTaksVOs = arg_4_0.actTaskProxy:getFinishTaskById(arg_4_0.activity.id)
	arg_4_0.taskDic = {}

	_.each(arg_4_0.taskVOs, function(arg_5_0)
		arg_4_0.taskDic[arg_5_0.id] = arg_5_0
	end)
	_.each(arg_4_0.finishTaksVOs, function(arg_6_0)
		arg_4_0.taskDic[arg_6_0.id] = arg_6_0
	end)
end

function var_0_0.OnFirstFlush(arg_7_0)
	arg_7_0.uilist:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventInit then
			local var_8_0 = arg_8_1 + 1
			local var_8_1 = arg_7_0.taskGroup[var_8_0]
			local var_8_2 = Drop.Create(arg_7_0.taskConfig[var_8_1].award_display[1])

			if var_8_0 < 7 then
				local var_8_3 = arg_8_2:Find("item")

				updateDrop(var_8_3, var_8_2)
			end

			onButton(arg_7_0, arg_8_2, function()
				arg_7_0:emit(BaseUI.ON_DROP, var_8_2)
			end, SFX_PANEL)
		end
	end)
	arg_7_0.uiGotList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_10_1 + 1
			local var_10_1 = arg_7_0.taskGroup[var_10_0]
			local var_10_2 = arg_7_0.taskDic[var_10_1]

			setActive(arg_10_2:Find("get_bg"), var_10_2 and var_10_2:isOver())
			setActive(arg_10_2:Find("tip"), var_10_2 and var_10_2:getTaskStatus() == 0 and not var_10_2:isOver())
		end
	end)

	local var_7_0 = arg_7_0:GetCanReceiveTaskList()

	setActive(arg_7_0.uiGoBtn:Find("tip"), #var_7_0 > 0)
	onButton(arg_7_0, arg_7_0.uiGoBtn, function()
		if arg_7_0.liveAreaPage == nil then
			arg_7_0.liveAreaPage = MainLiveAreaPage.New(arg_7_0._parentTf, arg_7_0.event)
		end

		arg_7_0.liveAreaPage:ExecuteAction("Show", true, function()
			local var_12_0 = arg_7_0:GetCanReceiveTaskList()

			if #var_12_0 > 0 then
				arg_7_0:emit(ActivityMediator.ON_ACTIVITY_TASK_LIST_SUBMIT, {
					activityId = arg_7_0.activity.id,
					ids = var_12_0
				})
			end
		end)
	end, SFX_PANEL)
	PlayerPrefs.SetString("IslandSignPage", var_0_0.GetDate())
end

function var_0_0.OnUpdateFlush(arg_13_0)
	arg_13_0:UpdateTaskData()
	arg_13_0.uilist:align(#arg_13_0.taskGroup)
	arg_13_0.uiGotList:align(#arg_13_0.taskGroup)

	local var_13_0 = arg_13_0:GetCanReceiveTaskList()

	setActive(arg_13_0.uiGoBtn:Find("tip"), #var_13_0 > 0)
end

function var_0_0.GetDate()
	return pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
end

function var_0_0.IsShowRed()
	return var_0_0.IsShowAwardRed()
end

function var_0_0.IsShowGoRed()
	return PlayerPrefs.GetString("IslandSignPage", "") ~= var_0_0.GetDate()
end

function var_0_0.IsShowAwardRed()
	local var_17_0 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.ISLAND_SIGN_ID)

	return _.any(var_17_0, function(arg_18_0)
		return arg_18_0:getTaskStatus() == 0
	end)
end

function var_0_0.GetCanReceiveTaskList(arg_19_0)
	local var_19_0 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.ISLAND_SIGN_ID)
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		if iter_19_1:getTaskStatus() == 0 then
			table.insert(var_19_1, iter_19_1.id)
		end
	end

	return var_19_1
end

function var_0_0.Destroy(arg_20_0)
	if arg_20_0.liveAreaPage then
		arg_20_0.liveAreaPage:Destroy()

		arg_20_0.liveAreaPage = nil
	end

	var_0_0.super.Destroy(arg_20_0)
end

function var_0_0.onBackPressed(arg_21_0)
	if arg_21_0.liveAreaPage and arg_21_0.liveAreaPage:GetLoaded() and arg_21_0.liveAreaPage:isShowing() then
		arg_21_0.liveAreaPage:Hide()

		return true
	end

	return false
end

return var_0_0
