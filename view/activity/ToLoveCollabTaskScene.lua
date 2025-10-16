local var_0_0 = class("ToLoveCollabTaskScene", import("view.base.BaseUI"))
local var_0_1 = {
	{
		6,
		9004
	},
	{
		16,
		1006
	}
}
local var_0_2 = 65011

function var_0_0.getUIName(arg_1_0)
	return "ToLoveCollabTaskPage"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("bg")
	arg_2_0.scrollPanel = arg_2_0._tf:Find("window/panel")
	arg_2_0.UIlist = UIItemList.New(arg_2_0._tf:Find("window/panel/list"), arg_2_0._tf:Find("window/panel/list/Tasktpl"))
	arg_2_0.closeBtn = arg_2_0._tf:Find("window/top/btnBack")
	arg_2_0.getBtn = arg_2_0._tf:Find("window/btn_get")
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:closeView()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.bg, function()
		arg_3_0:closeView()
	end, SFX_PANEL)
	arg_3_0:Show()
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.Show(arg_6_0)
	arg_6_0:UpdateTaskData()

	arg_6_0.canGetTaskVOs = {}
	arg_6_0.canGetTaskIds = {}

	arg_6_0:sort(arg_6_0.taskVOs)
	arg_6_0:UpdateList(arg_6_0.taskVOs)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.sort(arg_7_0, arg_7_1)
	local var_7_0 = {}

	arg_7_0.canGetAward = false

	for iter_7_0, iter_7_1 in pairs(arg_7_1) do
		if iter_7_1:getTaskStatus() == 1 then
			table.insert(var_7_0, iter_7_1)
			table.insert(arg_7_0.canGetTaskVOs, iter_7_1)
			table.insert(arg_7_0.canGetTaskIds, iter_7_1.id)

			arg_7_0.canGetAward = true
		end
	end

	for iter_7_2, iter_7_3 in pairs(arg_7_1) do
		if iter_7_3:getTaskStatus() == 0 then
			table.insert(var_7_0, iter_7_3)
		end
	end

	for iter_7_4, iter_7_5 in pairs(arg_7_1) do
		if iter_7_5:getTaskStatus() == 2 then
			table.insert(var_7_0, iter_7_5)
		end
	end

	arg_7_0.taskVOs = var_7_0
end

function var_0_0.UpdateList(arg_8_0, arg_8_1)
	arg_8_0.UIlist:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_8_1[arg_9_1 + 1]
			local var_9_1, var_9_2 = arg_8_0:getTaskProgress(var_9_0)
			local var_9_3, var_9_4 = arg_8_0:getTaskTarget(var_9_0)
			local var_9_5 = math.min(var_9_1, var_9_3)

			setText(arg_9_2:Find("frame/desc"), var_9_0:getConfig("desc") .. " (" .. tostring(var_9_5) .. "/" .. var_9_4 .. ")")

			arg_9_2:Find("frame/slider"):GetComponent(typeof(Slider)).value = var_9_5 / var_9_3

			local var_9_6 = arg_9_2:Find("frame/awards")
			local var_9_7 = var_9_6:GetChild(0)

			arg_8_0:updateAwards(var_9_0:getConfig("award_display"), var_9_6, var_9_7)

			local var_9_8 = arg_9_2:Find("frame/go_btn")
			local var_9_9 = arg_9_2:Find("frame/get_btn")
			local var_9_10 = arg_9_2:Find("frame/got_btn")
			local var_9_11 = arg_9_2:Find("frame/bg_go")
			local var_9_12 = arg_9_2:Find("frame/bg_get")
			local var_9_13 = arg_9_2:Find("frame/bg_got")

			setActive(var_9_8, var_9_0:getTaskStatus() == 0)
			setActive(var_9_11, var_9_0:getTaskStatus() == 0)
			setActive(var_9_9, var_9_0:getTaskStatus() == 1)
			setActive(var_9_12, var_9_0:getTaskStatus() == 1)
			setActive(var_9_10, var_9_0:getTaskStatus() == 2)
			setActive(var_9_13, var_9_0:getTaskStatus() == 2)
			onButton(arg_8_0, var_9_8, function()
				arg_8_0:emit(ToLoveCollabTaskMediator.ON_TASK_GO, var_9_0)
			end, SFX_PANEL)
			onButton(arg_8_0, var_9_9, function()
				arg_8_0:checkAwardOverFlow({
					var_9_0
				}, function()
					arg_8_0:emit(ToLoveCollabTaskMediator.ON_TASK_SUBMIT, var_9_0)
				end)
			end, SFX_PANEL)
		end
	end)
	arg_8_0.UIlist:align(#arg_8_1)

	if arg_8_0.canGetAward then
		setActive(arg_8_0.getBtn, true)
		onButton(arg_8_0, arg_8_0.getBtn, function()
			arg_8_0:checkAwardOverFlow(arg_8_0.canGetTaskVOs, function()
				arg_8_0:emit(ToLoveCollabTaskMediator.ON_TASK_SUBMIT_ONESTEP, arg_8_0.canGetTaskIds)
			end)
		end, SFX_PANEL)
	else
		setActive(arg_8_0.getBtn, false)
		removeOnButton(arg_8_0.getBtn)
	end
end

function var_0_0.checkAwardOverFlow(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {}
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in pairs(arg_15_1) do
		local var_15_2 = iter_15_1:getConfig("award_display")

		for iter_15_2, iter_15_3 in ipairs(var_15_2) do
			local var_15_3 = iter_15_3
			local var_15_4 = false

			for iter_15_4, iter_15_5 in pairs(var_15_1) do
				if iter_15_5[1] == var_15_3[1] and iter_15_5[2] == var_15_3[2] then
					var_15_4 = true
					iter_15_5[3] = iter_15_5[3] + var_15_3[3]

					break
				end
			end

			if not var_15_4 then
				table.insert(var_15_1, {
					var_15_3[1],
					var_15_3[2],
					var_15_3[3]
				})
			end
		end
	end

	local var_15_5 = getProxy(PlayerProxy):getRawData()
	local var_15_6 = pg.gameset.urpt_chapter_max.description[1]
	local var_15_7 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_15_6)
	local var_15_8, var_15_9 = Task.StaticJudgeOverflow(var_15_5.gold, var_15_5.oil, var_15_7, true, true, var_15_1)

	if var_15_8 then
		table.insert(var_15_0, function(arg_16_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("award_max_warning"),
				items = var_15_9,
				onYes = arg_16_0
			})
		end)
	end

	seriesAsync(var_15_0, arg_15_2)
end

function var_0_0.updateAwards(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = _.slice(arg_17_1, 1, 3)

	for iter_17_0 = arg_17_2.childCount, #var_17_0 - 1 do
		cloneTplTo(arg_17_3, arg_17_2)
	end

	local var_17_1 = arg_17_2.childCount

	for iter_17_1 = 1, var_17_1 do
		local var_17_2 = arg_17_2:GetChild(iter_17_1 - 1)
		local var_17_3 = iter_17_1 <= #var_17_0

		setActive(var_17_2, var_17_3)

		if var_17_3 then
			local var_17_4 = var_17_0[iter_17_1]
			local var_17_5 = {
				type = var_17_4[1],
				id = var_17_4[2],
				count = var_17_4[3]
			}

			updateDrop(var_17_2:Find("mask"), var_17_5)

			if var_17_5.type == DROP_TYPE_EQUIPMENT_SKIN then
				setActive(var_17_2:Find("specialFrame"), true)
			else
				setActive(var_17_2:Find("specialFrame"), false)
			end

			onButton(arg_17_0, var_17_2, function()
				arg_17_0:emit(BaseUI.ON_DROP, var_17_5)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.UpdateTaskData(arg_19_0)
	local var_19_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.TOLOVE_TASK_ID)

	arg_19_0.taskVOs = {}

	if var_19_0 and not var_19_0:isEnd() then
		local var_19_1 = var_19_0:getConfig("config_data")

		for iter_19_0, iter_19_1 in pairs(var_19_1) do
			table.insert(arg_19_0.taskVOs, getProxy(TaskProxy):getTaskVO(iter_19_1))
		end
	end
end

function var_0_0.getTaskProgress(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(var_0_1) do
		if iter_20_1[1] == arg_20_1:getConfig("type") and iter_20_1[2] == arg_20_1:getConfig("sub_type") then
			return arg_20_1:getProgress() / 1000, string.format("%.2d", arg_20_1:getProgress() / 1000)
		end
	end

	return arg_20_1:getProgress(), tostring(arg_20_1:getProgress())
end

function var_0_0.getTaskTarget(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(var_0_1) do
		if iter_21_1[1] == arg_21_1:getConfig("type") and iter_21_1[2] == arg_21_1:getConfig("sub_type") then
			return arg_21_1:getConfig("target_num") / 1000, string.format("%.2d", arg_21_1:getConfig("target_num") / 1000)
		end
	end

	return arg_21_1:getConfig("target_num"), tostring(arg_21_1:getConfig("target_num"))
end

function var_0_0.willExit(arg_22_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_22_0._tf)
end

return var_0_0
