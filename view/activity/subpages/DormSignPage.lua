local var_0_0 = class("DormSignPage", import("view.base.BaseActivityPage"))

function var_0_0.getResource(arg_1_0)
	return {
		"ui/activityuipage/dormsignpage_atlas"
	}
end

function var_0_0.getUIName(arg_2_0)
	return "DormSignPage"
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.bg = arg_3_0._tf:Find("AD")
	arg_3_0.items = arg_3_0.bg:Find("items")
	arg_3_0.uilist = UIItemList.New(arg_3_0.items, arg_3_0.items:Find("tpl"))
	arg_3_0.goBtn = arg_3_0.bg:Find("btn_go")
	arg_3_0.lockTF = arg_3_0.bg:Find("lock")
end

function var_0_0.OnDataSetting(arg_4_0)
	arg_4_0.actTaskProxy = getProxy(ActivityTaskProxy)
	arg_4_0.taskGroup = underscore.flatten(arg_4_0.activity:getConfig("config_data"))
	arg_4_0.taskConfig = pg.task_data_template
end

function var_0_0.UpdateTaskData(arg_5_0)
	arg_5_0.taskVOs = arg_5_0.actTaskProxy:getTaskById(arg_5_0.activity.id)
	arg_5_0.finishTaksVOs = arg_5_0.actTaskProxy:getFinishTaskById(arg_5_0.activity.id)
	arg_5_0.taskDic = {}

	_.each(arg_5_0.taskVOs, function(arg_6_0)
		arg_5_0.taskDic[arg_6_0.id] = arg_6_0
	end)
	_.each(arg_5_0.finishTaksVOs, function(arg_7_0)
		arg_5_0.taskDic[arg_7_0.id] = arg_7_0
	end)
end

function var_0_0.OnFirstFlush(arg_8_0)
	arg_8_0.uilist:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventInit then
			local var_9_0 = arg_9_1 + 1
			local var_9_1 = arg_8_0.taskGroup[var_9_0]
			local var_9_2 = arg_9_2:Find("item")
			local var_9_3 = Drop.Create(arg_8_0.taskConfig[var_9_1].award_display[1])

			if var_9_0 > 1 then
				updateDrop(var_9_2, var_9_3)
			end

			onButton(arg_8_0, arg_9_2, function()
				if arg_8_0.taskDic[var_9_1] and arg_8_0.taskDic[var_9_1]:getTaskStatus() == 1 and not arg_8_0.taskDic[var_9_1]:isOver() then
					arg_8_0:emit(ActivityMediator.ON_ACTIVITY_TASK_SUBMIT, {
						activityId = arg_8_0.activity.id,
						id = var_9_1
					})
				else
					arg_8_0:emit(BaseUI.ON_DROP, var_9_3)
				end
			end, SFX_PANEL)
		elseif arg_9_0 == UIItemList.EventUpdate then
			local var_9_4 = arg_9_1 + 1
			local var_9_5 = arg_8_0.taskGroup[var_9_4]
			local var_9_6 = arg_8_0.taskDic[var_9_5]

			setActive(arg_9_2:Find("got"), var_9_6 and var_9_6:isOver())
			setActive(arg_9_2:Find("tip"), var_9_6 and var_9_6:getTaskStatus() == 1 and not var_9_6:isOver())
		end
	end)
	onButton(arg_8_0, arg_8_0.goBtn, function()
		arg_8_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.DORM3DSELECT)
	end, SFX_PANEL)

	local var_8_0 = pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "SelectDorm3DMediator")

	setActive(arg_8_0.goBtn, var_8_0)
	setActive(arg_8_0.lockTF, not var_8_0)
	setActive(arg_8_0.goBtn:Find("tip"), var_0_0.IsShowGoRed())
	PlayerPrefs.SetString("DormSignPage", var_0_0.GetDate())
end

function var_0_0.OnUpdateFlush(arg_12_0)
	arg_12_0:UpdateTaskData()
	arg_12_0.uilist:align(#arg_12_0.taskGroup)
end

function var_0_0.GetDate()
	return pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
end

function var_0_0.IsShowRed()
	return var_0_0.IsShowGoRed() or var_0_0.IsShowAwardRed()
end

function var_0_0.IsShowGoRed()
	return PlayerPrefs.GetString("DormSignPage", "") ~= var_0_0.GetDate()
end

function var_0_0.IsShowAwardRed()
	local var_16_0 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.DORM_SIGN_ID)

	return _.any(var_16_0, function(arg_17_0)
		return arg_17_0:getTaskStatus() == 1
	end)
end

function var_0_0.GetBgParams(arg_18_0)
	return arg_18_0.bg:Find("bg"), "ui/activityuipage/dormsignpage_atlas", "bg"
end

return var_0_0
