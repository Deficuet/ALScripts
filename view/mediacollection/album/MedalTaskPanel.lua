local var_0_0 = class("MedalTaskPanel")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0._parent = arg_1_2
	arg_1_0.UIMgr = pg.UIMgr.GetInstance()

	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._mask = findTF(arg_1_0._tf, "mask")
	arg_1_0._backBtn = findTF(arg_1_0._tf, "btnBack")
	arg_1_0.UIlist = UIItemList.New(findTF(arg_1_0._tf, "panel/list"), findTF(arg_1_0._tf, "panel/list/Tasktpl"))

	onButton(arg_1_0, arg_1_0._mask, function()
		arg_1_0:SetActive(false)
	end, SFX_CANCEL)
	onButton(arg_1_0, arg_1_0._backBtn, function()
		arg_1_0:SetActive(false)
	end, SFX_CANCEL)
end

function var_0_0.SetMedalGroup(arg_4_0, arg_4_1)
	arg_4_0._medalGroup = arg_4_1
	arg_4_0._taskList = {}

	local var_4_0 = arg_4_0._medalGroup:GetMedalGroupActivityConfig()[3]

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_1 = getProxy(TaskProxy):getTaskById(iter_4_1) or getProxy(TaskProxy):getFinishTaskById(iter_4_1)

		table.insert(arg_4_0._taskList, var_4_1)
	end
end

function var_0_0.ShowMedalTask(arg_5_0)
	Canvas.ForceUpdateCanvases()
	arg_5_0:sort(arg_5_0._taskList)
	arg_5_0:UpdateList(arg_5_0._taskList)
end

function var_0_0.getTaskProgress(arg_6_0, arg_6_1)
	return arg_6_1:getProgress(), tostring(arg_6_1:getProgress())
end

function var_0_0.getTaskTarget(arg_7_0, arg_7_1)
	return arg_7_1:getConfig("target_num"), tostring(arg_7_1:getConfig("target_num"))
end

function var_0_0.UpdateList(arg_8_0, arg_8_1)
	arg_8_0.UIlist:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_8_1[arg_9_1 + 1]
			local var_9_1 = arg_9_2:Find("frame/slider"):GetComponent(typeof(Slider))
			local var_9_2 = arg_9_2:Find("frame/progress")
			local var_9_3 = arg_9_2:Find("frame/progress_1")
			local var_9_4 = arg_9_2:Find("frame/awards")
			local var_9_5 = arg_9_2:Find("frame/desc")
			local var_9_6 = arg_9_2:Find("frame/get_btn")
			local var_9_7 = arg_9_2:Find("frame/got_btn")
			local var_9_8 = arg_9_2:Find("frame/go_btn")

			setText(var_9_5, var_9_0:getConfig("desc"))

			local var_9_9, var_9_10 = arg_8_0:getTaskProgress(var_9_0)
			local var_9_11, var_9_12 = arg_8_0:getTaskTarget(var_9_0)

			var_9_1.value = var_9_9 / var_9_11

			setText(var_9_2, var_9_10)
			setText(var_9_3, "/" .. var_9_12)

			local var_9_13 = var_9_4:GetChild(0)

			arg_8_0:updateAwards(var_9_0:getConfig("award_display"), var_9_4, var_9_13)
			setActive(var_9_7, var_9_0:getTaskStatus() == 2)
			setActive(var_9_6, var_9_0:getTaskStatus() == 1)
			setActive(var_9_8, var_9_0:getTaskStatus() == 0)
			onButton(arg_8_0, var_9_8, function()
				arg_8_0._parent:emit(MedalAlbumTemplateMediator.ON_TASK_GO, var_9_0)
			end, SFX_PANEL)
			onButton(arg_8_0, var_9_6, function()
				arg_8_0._parent:emit(MedalAlbumTemplateMediator.ON_TASK_SUBMIT, var_9_0)
			end, SFX_PANEL)
		end
	end)
	arg_8_0.UIlist:align(#arg_8_1)
end

function var_0_0.updateAwards(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = _.slice(arg_12_1, 1, 3)

	for iter_12_0 = arg_12_2.childCount, #var_12_0 - 1 do
		cloneTplTo(arg_12_3, arg_12_2)
	end

	local var_12_1 = arg_12_2.childCount

	for iter_12_1 = 1, var_12_1 do
		local var_12_2 = arg_12_2:GetChild(iter_12_1 - 1)
		local var_12_3 = iter_12_1 <= #var_12_0

		setActive(var_12_2, var_12_3)

		if var_12_3 then
			local var_12_4 = var_12_0[iter_12_1]
			local var_12_5 = {
				type = var_12_4[1],
				id = var_12_4[2],
				count = var_12_4[3]
			}

			updateDrop(findTF(var_12_2, "mask"), var_12_5)

			if var_12_5.type == DROP_TYPE_EQUIPMENT_SKIN then
				setActive(findTF(var_12_2, "specialFrame"), true)
			else
				setActive(findTF(var_12_2, "specialFrame"), false)
			end

			onButton(arg_12_0, var_12_2, function()
				arg_12_0._parent:emit(BaseUI.ON_DROP, var_12_5)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.sort(arg_14_0, arg_14_1)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_1) do
		if iter_14_1:getTaskStatus() == 1 then
			table.insert(var_14_0, iter_14_1)
		end
	end

	for iter_14_2, iter_14_3 in pairs(arg_14_1) do
		if iter_14_3:getTaskStatus() == 0 then
			table.insert(var_14_0, iter_14_3)
		end
	end

	for iter_14_4, iter_14_5 in pairs(arg_14_1) do
		if iter_14_5:getTaskStatus() == 2 then
			table.insert(var_14_0, iter_14_5)
		end
	end

	arg_14_0._taskList = var_14_0
end

function var_0_0.SetActive(arg_15_0, arg_15_1)
	SetActive(arg_15_0._go, arg_15_1)

	arg_15_0._active = arg_15_1

	if arg_15_1 then
		pg.UIMgr.GetInstance():BlurPanel(arg_15_0._go, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})
	else
		pg.UIMgr.GetInstance():UnblurPanel(arg_15_0._go, arg_15_0._parent._tf)
	end
end

function var_0_0.IsActive(arg_16_0)
	return arg_16_0._active
end

function var_0_0.Dispose(arg_17_0)
	pg.DelegateInfo.Dispose(arg_17_0)
end

return var_0_0
