local var_0_0 = class("ChildishnessSchoolTaskPage", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ChildishnessSchoolTaskPage"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0:findTF("bg")
	arg_2_0.scrollPanel = arg_2_0:findTF("window/panel")
	arg_2_0.UIlist = UIItemList.New(arg_2_0:findTF("window/panel/list"), arg_2_0:findTF("window/panel/list/Tasktpl"))
	arg_2_0.closeBtn = arg_2_0:findTF("window/top/btnBack")
	arg_2_0.getBtn = arg_2_0:findTF("window/btn_get")
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0.anim:Play("anim_kinder_schoolPT_out")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.bg, function()
		arg_3_0.anim:Play("anim_kinder_schoolPT_out")
	end, SFX_PANEL)
	arg_3_0:Show()

	arg_3_0.anim = arg_3_0._tf:GetComponent(typeof(Animation))
	arg_3_0.animEvent = arg_3_0.anim:GetComponent(typeof(DftAniEvent))

	arg_3_0.animEvent:SetEndEvent(function()
		arg_3_0:closeView()
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.Show(arg_7_0)
	arg_7_0:UpdateTaskData()

	arg_7_0.canGetTaskVOs = {}
	arg_7_0.canGetTaskIds = {}

	arg_7_0:sort(arg_7_0.taskVOs)
	arg_7_0:UpdateList(arg_7_0.taskVOs)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.sort(arg_8_0, arg_8_1)
	local var_8_0 = {}

	arg_8_0.canGetAward = false

	for iter_8_0, iter_8_1 in pairs(arg_8_1) do
		if iter_8_1:getTaskStatus() == 1 then
			table.insert(var_8_0, iter_8_1)
			table.insert(arg_8_0.canGetTaskVOs, iter_8_1)
			table.insert(arg_8_0.canGetTaskIds, iter_8_1.id)

			arg_8_0.canGetAward = true
		end
	end

	for iter_8_2, iter_8_3 in pairs(arg_8_1) do
		if iter_8_3:getTaskStatus() == 0 then
			table.insert(var_8_0, iter_8_3)
		end
	end

	for iter_8_4, iter_8_5 in pairs(arg_8_1) do
		if iter_8_5:getTaskStatus() == 2 then
			table.insert(var_8_0, iter_8_5)
		end
	end

	arg_8_0.taskVOs = var_8_0
end

function var_0_0.UpdateList(arg_9_0, arg_9_1)
	arg_9_0.UIlist:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_9_1[arg_10_1 + 1]

			setText(arg_10_2:Find("frame/desc"), var_10_0:getConfig("desc"))

			local var_10_1 = var_10_0:getProgress()
			local var_10_2 = var_10_0:getConfig("target_num")
			local var_10_3 = math.min(var_10_1, var_10_2)

			setText(arg_10_2:Find("frame/progress"), var_10_3 .. "/" .. var_10_2)

			arg_10_2:Find("frame/slider"):GetComponent(typeof(Slider)).value = var_10_3 / var_10_2

			local var_10_4 = arg_10_2:Find("frame/awards")
			local var_10_5 = var_10_4:GetChild(0)

			arg_9_0:updateAwards(var_10_0:getConfig("award_display"), var_10_4, var_10_5)

			local var_10_6 = arg_10_2:Find("frame/go_btn")
			local var_10_7 = arg_10_2:Find("frame/get_btn")
			local var_10_8 = arg_10_2:Find("frame/got_btn")

			if var_10_0:getTaskStatus() == 0 then
				setActive(var_10_6, true)
				setActive(var_10_7, false)
				setActive(var_10_8, false)
			elseif var_10_0:getTaskStatus() == 1 then
				setActive(var_10_6, false)
				setActive(var_10_7, true)
				setActive(var_10_8, false)
			elseif var_10_0:getTaskStatus() == 2 then
				setActive(var_10_6, false)
				setActive(var_10_7, false)
				setActive(var_10_8, true)
			end

			onButton(arg_9_0, var_10_6, function()
				arg_9_0:emit(ChildishnessSchoolTaskMediator.ON_TASK_GO, var_10_0)
			end, SFX_PANEL)
			onButton(arg_9_0, var_10_7, function()
				arg_9_0:emit(ChildishnessSchoolTaskMediator.ON_TASK_SUBMIT, var_10_0)
			end, SFX_PANEL)
		end
	end)
	arg_9_0.UIlist:align(#arg_9_1)

	if arg_9_0.canGetAward then
		setActive(arg_9_0.getBtn, true)
		onButton(arg_9_0, arg_9_0.getBtn, function()
			local var_13_0 = {}
			local var_13_1 = {}

			for iter_13_0, iter_13_1 in pairs(arg_9_0.canGetTaskVOs) do
				local var_13_2 = iter_13_1:getConfig("award_display")

				for iter_13_2, iter_13_3 in ipairs(var_13_2) do
					local var_13_3 = iter_13_3
					local var_13_4 = false

					for iter_13_4, iter_13_5 in pairs(var_13_1) do
						if iter_13_5[1] == var_13_3[1] and iter_13_5[2] == var_13_3[2] then
							var_13_4 = true
							iter_13_5[3] = iter_13_5[3] + var_13_3[3]

							break
						end
					end

					if not var_13_4 then
						table.insert(var_13_1, var_13_3)
					end
				end
			end

			local var_13_5 = getProxy(PlayerProxy):getRawData()
			local var_13_6 = pg.gameset.urpt_chapter_max.description[1]
			local var_13_7 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_13_6)
			local var_13_8, var_13_9 = Task.StaticJudgeOverflow(var_13_5.gold, var_13_5.oil, var_13_7, true, true, var_13_1)

			if var_13_8 then
				table.insert(var_13_0, function(arg_14_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("award_max_warning"),
						items = var_13_9,
						onYes = arg_14_0
					})
				end)
			end

			seriesAsync(var_13_0, function()
				arg_9_0:emit(ChildishnessSchoolTaskMediator.ON_TASK_SUBMIT_ONESTEP, ActivityConst.ALVIT_TASK_ACT_ID, arg_9_0.canGetTaskIds)
			end)
		end, SFX_PANEL)
	else
		setActive(arg_9_0.getBtn, false)
		removeOnButton(arg_9_0.getBtn)
	end
end

function var_0_0.updateAwards(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = _.slice(arg_16_1, 1, 3)

	for iter_16_0 = arg_16_2.childCount, #var_16_0 - 1 do
		cloneTplTo(arg_16_3, arg_16_2)
	end

	local var_16_1 = arg_16_2.childCount

	for iter_16_1 = 1, var_16_1 do
		local var_16_2 = arg_16_2:GetChild(iter_16_1 - 1)
		local var_16_3 = iter_16_1 <= #var_16_0

		setActive(var_16_2, var_16_3)

		if var_16_3 then
			local var_16_4 = var_16_0[iter_16_1]
			local var_16_5 = {
				type = var_16_4[1],
				id = var_16_4[2],
				count = var_16_4[3]
			}

			updateDrop(arg_16_0:findTF("mask", var_16_2), var_16_5)

			if var_16_5.type == DROP_TYPE_EQUIPMENT_SKIN then
				setActive(arg_16_0:findTF("specialFrame", var_16_2), true)
			else
				setActive(arg_16_0:findTF("specialFrame", var_16_2), false)
			end

			onButton(arg_16_0, var_16_2, function()
				arg_16_0:emit(BaseUI.ON_DROP, var_16_5)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.UpdateTaskData(arg_18_0)
	local var_18_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_TASK_ACT_ID)

	arg_18_0.taskVOs = {}

	local var_18_1 = var_18_0:getConfig("config_data")

	for iter_18_0, iter_18_1 in pairs(var_18_1) do
		table.insert(arg_18_0.taskVOs, getProxy(TaskProxy):getTaskVO(iter_18_1))
	end
end

function var_0_0.willExit(arg_19_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_19_0._tf)
end

return var_0_0
