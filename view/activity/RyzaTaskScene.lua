local var_0_0 = class("RyzaTaskScene", import("..base.BaseUI"))
local var_0_1 = "ryza_task_level_desc"
local var_0_2 = "ryza_task_tag_explore"
local var_0_3 = "ryza_task_tag_battle"
local var_0_4 = "ryza_task_tag_dalegate"
local var_0_5 = "ryza_task_tag_develop"
local var_0_6 = {
	var_0_2,
	var_0_3,
	var_0_4,
	var_0_5
}
local var_0_7 = "ryza_task_detail_content"
local var_0_8 = "ryza_task_detail_award"
local var_0_9 = "ryza_task_go"
local var_0_10 = "ryza_task_get"
local var_0_11 = "ryza_task_detail"
local var_0_12 = "ryza_task_submit"
local var_0_13 = "ryza_task_get_all"
local var_0_14 = "ryza_task_confirm"
local var_0_15 = "ryza_task_cancel"
local var_0_16 = "ryza_task_level_num"
local var_0_17 = "ryza_task_level_add"
local var_0_18 = "ryza_task_empty_tag"
local var_0_19 = "sub_item_warning"
local var_0_20 = "ui/ryzaicon_atlas"

function var_0_0.getUIName(arg_1_0)
	return "RyzaTaskUI"
end

local var_0_21 = 4
local var_0_22 = 5
local var_0_23 = 4

function var_0_0.init(arg_2_0)
	arg_2_0.activityId = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_RYZA).id
	arg_2_0.enterTaskId = arg_2_0.contextData.task_id or nil
	arg_2_0.taskGroups = pg.activity_template[arg_2_0.activityId].config_data
	arg_2_0.leanTweens = {}
	arg_2_0.exitFlag = false

	local var_2_0 = pg.activity_template[arg_2_0.activityId].config_client

	arg_2_0.ptName = pg.player_resource[var_2_0.pt_id].name
	arg_2_0.ptBuffs = var_2_0.pt_buff
	arg_2_0.maxNum = arg_2_0.ptBuffs[#arg_2_0.ptBuffs].pt[1]

	local var_2_1 = findTF(arg_2_0._tf, "ad")

	arg_2_0.btnBack = findTF(var_2_1, "btnBack")
	arg_2_0.btnMain = findTF(var_2_1, "btnMain")
	arg_2_0.btnHelp = findTF(var_2_1, "btnHelp")
	arg_2_0.btnGetAll = findTF(var_2_1, "btnGetAll")
	arg_2_0.btnPoint = findTF(var_2_1, "btnPoint")
	arg_2_0.imgPoint = findTF(var_2_1, "btnPoint/imgPoint")
	arg_2_0.taskTagPanel = findTF(var_2_1, "taskTagPanel")
	arg_2_0.taskListPanel = findTF(var_2_1, "taskListPanel")
	arg_2_0.scrollRect = findTF(var_2_1, "taskListPanel/Content"):GetComponent("LScrollRect")
	arg_2_0.taskDetailPanel = findTF(var_2_1, "taskDetailPanel")
	arg_2_0.detailTag = findTF(arg_2_0.taskDetailPanel, "tag")
	arg_2_0.detailTitleText = findTF(arg_2_0.taskDetailPanel, "title/text")
	arg_2_0.detailIcon = findTF(arg_2_0.taskDetailPanel, "icon/image")
	arg_2_0.detailDescText = findTF(arg_2_0.taskDetailPanel, "desc/text")
	arg_2_0.detaiProgressText = findTF(arg_2_0.taskDetailPanel, "progress/text")
	arg_2_0.detailAwardContent = findTF(arg_2_0.taskDetailPanel, "awardDisplay/viewport/content")
	arg_2_0.detailBtnGo = findTF(arg_2_0.taskDetailPanel, "btnGo")
	arg_2_0.detailBtnGet = findTF(arg_2_0.taskDetailPanel, "btnGet")
	arg_2_0.detailBtnSubmit = findTF(arg_2_0.taskDetailPanel, "btnSubmit")
	arg_2_0.detailBtnDetail = findTF(arg_2_0.taskDetailPanel, "btnDetail")
	arg_2_0.detailActive = findTF(arg_2_0.taskDetailPanel, "active")
	arg_2_0.taskItemTpl = findTF(var_2_1, "tpl/taskItemTpl")
	arg_2_0.IconTpl = findTF(var_2_1, "tpl/IconTpl")

	local var_2_2 = findTF(arg_2_0._tf, "pop")

	arg_2_0.pointPanel = findTF(var_2_2, "pointPanel")

	setActive(arg_2_0.pointPanel, false)

	arg_2_0.pointProgressText = findTF(arg_2_0.pointPanel, "progressContent/progress")
	arg_2_0.pointProgressSlider = findTF(arg_2_0.pointPanel, "slider")
	arg_2_0.pointLevelStar = findTF(arg_2_0.pointPanel, "levelStar")
	arg_2_0.pointStarTpl = findTF(arg_2_0.pointPanel, "levelStar/starTpl")
	arg_2_0.pointAdd = findTF(arg_2_0.pointPanel, "add")
	arg_2_0.pointClose = findTF(arg_2_0.pointPanel, "btnClose")
	arg_2_0.pointMask = findTF(arg_2_0.pointPanel, "mask")
	arg_2_0.submitPanel = findTF(var_2_2, "submitPanel")
	arg_2_0.submitDisplayContent = findTF(arg_2_0.submitPanel, "itemDisplay/viewport/content")
	arg_2_0.submitConfirm = findTF(arg_2_0.submitPanel, "btnComfirm")
	arg_2_0.submitCancel = findTF(arg_2_0.submitPanel, "btnCancel")
	arg_2_0.subimtItem = findTF(arg_2_0.submitPanel, "itemDisplay/viewport/content/item")
	arg_2_0.submitItemDesc = findTF(arg_2_0.submitPanel, "itemDesc")
	arg_2_0.btnCancel = findTF(arg_2_0.submitPanel, "btnCancel")

	setText(findTF(arg_2_0.btnPoint, "text"), i18n(var_0_1))

	for iter_2_0 = 1, var_0_21 do
		local var_2_3 = findTF(arg_2_0.taskTagPanel, "btn" .. iter_2_0)

		setText(findTF(var_2_3, "off/text"), i18n(var_0_6[iter_2_0]))
		setText(findTF(var_2_3, "on/text"), i18n(var_0_6[iter_2_0]))
	end

	setText(findTF(arg_2_0.taskDetailPanel, "desc/title"), i18n(var_0_7))
	setText(findTF(arg_2_0.taskDetailPanel, "awardText"), i18n(var_0_8))
	setText(findTF(arg_2_0.taskDetailPanel, "btnGet/text"), i18n(var_0_10))
	setText(findTF(arg_2_0.taskDetailPanel, "btnGo/text"), i18n(var_0_9))
	setText(findTF(arg_2_0.taskDetailPanel, "btnSubmit/text"), i18n(var_0_12))
	setText(findTF(arg_2_0.taskDetailPanel, "btnDetail/text"), i18n(var_0_11))
	setText(findTF(arg_2_0.btnGetAll, "text"), i18n(var_0_13))
	setText(findTF(arg_2_0.submitPanel, "btnComfirm/text"), i18n(var_0_14))
	setText(findTF(arg_2_0.submitPanel, "btnCancel/text"), i18n(var_0_15))
	setText(findTF(arg_2_0.submitPanel, "bg/text"), i18n(var_0_19))
	setText(findTF(arg_2_0.pointPanel, "title"), i18n(var_0_1))
	setText(findTF(arg_2_0.pointPanel, "levelNum/text"), i18n(var_0_16))
	setText(findTF(arg_2_0.pointPanel, "levelBuff/text"), i18n(var_0_17))

	arg_2_0.pointStarTfs = {}

	local var_2_4 = arg_2_0.pointLevelStar.sizeDelta.x

	for iter_2_1 = 1, #arg_2_0.ptBuffs do
		local var_2_5 = tf(Instantiate(arg_2_0.pointStarTpl))

		SetParent(var_2_5, arg_2_0.pointLevelStar)
		setActive(var_2_5, true)
		setText(findTF(var_2_5, "bg/text"), iter_2_1)
		setText(findTF(var_2_5, "img/text"), iter_2_1)

		local var_2_6 = arg_2_0.ptBuffs[iter_2_1].pt[1]

		var_2_5.anchoredPosition = Vector3(var_2_6 / arg_2_0.maxNum * var_2_4, -18, 0)

		table.insert(arg_2_0.pointStarTfs, var_2_5)

		if iter_2_1 == 1 then
			setActive(var_2_5, false)
		end
	end

	arg_2_0:updateTask()
end

function var_0_0.updateTask(arg_3_0, arg_3_1)
	arg_3_0.displayTask = {}
	arg_3_0.allDisplayTask = {}

	local var_3_0 = getProxy(ActivityTaskProxy):getTaskById(arg_3_0.activityId)

	arg_3_0.getAllTasks = {}

	for iter_3_0 = 1, #var_3_0 do
		local var_3_1 = var_3_0[iter_3_0]
		local var_3_2 = var_3_1.id
		local var_3_3 = var_3_1:getProgress()
		local var_3_4 = var_3_1:getTarget()
		local var_3_5 = var_3_1:getConfig("ryza_type")
		local var_3_6 = var_3_1:getConfig("type")
		local var_3_7 = var_3_1:getConfig("sub_type")

		if var_3_5 > 0 then
			if not arg_3_0.displayTask[var_3_5] then
				arg_3_0.displayTask[var_3_5] = {}
			end

			table.insert(arg_3_0.displayTask[var_3_5], var_3_1)
			table.insert(arg_3_0.allDisplayTask, var_3_1)

			if not var_3_1:isFinish() or var_3_1:isOver() or var_3_7 == 1006 then
				-- block empty
			else
				table.insert(arg_3_0.getAllTasks, var_3_2)
			end
		end
	end

	local var_3_8 = getProxy(ActivityProxy):getActivityById(arg_3_0.activityId)
	local var_3_9 = {}

	if var_3_8 then
		var_3_9 = var_3_8.data1_list
	end

	if var_3_9 and #var_3_9 > 0 then
		for iter_3_1 = 1, #var_3_9 do
			local var_3_10 = var_3_9[iter_3_1]
			local var_3_11 = ActivityTask.New(arg_3_0.activityId, {
				progress = 0,
				id = var_3_10
			})

			var_3_11:setOver()

			local var_3_12 = var_3_11:getConfig("ryza_type")

			if var_3_12 > 0 then
				if not arg_3_0.displayTask[var_3_12] then
					arg_3_0.displayTask[var_3_12] = {}
				end

				table.insert(arg_3_0.displayTask[var_3_12], var_3_11)
				table.insert(arg_3_0.allDisplayTask, var_3_11)
			end
		end
	end

	local function var_3_13(arg_4_0, arg_4_1)
		if arg_4_0:isOver() and not arg_4_1:isOver() then
			return false
		elseif not arg_4_0:isOver() and arg_4_1:isOver() then
			return true
		end

		if arg_4_0:isFinish() and not arg_4_1:isFinish() then
			return true
		elseif not arg_4_0:isFinish() and arg_4_1:isFinish() then
			return false
		end

		if arg_4_0:isNew() and not arg_4_1:isNew() then
			return true
		elseif not arg_4_0:isNew() and arg_4_1:isNew() then
			return false
		end

		if arg_4_0.id > arg_4_1.id then
			return false
		elseif arg_4_0.id < arg_4_1.id then
			return true
		end
	end

	for iter_3_2, iter_3_3 in pairs(arg_3_0.displayTask) do
		table.sort(iter_3_3, var_3_13)
	end

	table.sort(arg_3_0.allDisplayTask, var_3_13)

	if arg_3_1 then
		arg_3_0:onClickTag()
	end

	if #arg_3_0.getAllTasks > 0 then
		setActive(arg_3_0.btnGetAll, true)
	else
		setActive(arg_3_0.btnGetAll, false)
	end

	local var_3_14 = getProxy(PlayerProxy):getData()[arg_3_0.ptName] or 0
	local var_3_15 = 1

	if var_3_14 > arg_3_0.maxNum then
		var_3_14 = arg_3_0.maxNum
	end

	for iter_3_4 = #arg_3_0.ptBuffs, 1, -1 do
		var_3_15 = var_3_14 >= arg_3_0.ptBuffs[iter_3_4].pt[1] and var_3_15 < iter_3_4 and iter_3_4 or var_3_15
	end

	for iter_3_5 = 1, #arg_3_0.pointStarTfs do
		local var_3_16 = arg_3_0.pointStarTfs[iter_3_5]

		if iter_3_5 <= var_3_15 then
			setActive(findTF(var_3_16, "img"), true)
		else
			setActive(findTF(var_3_16, "img"), false)
		end
	end

	local var_3_17 = arg_3_0.ptBuffs[var_3_15].benefit

	for iter_3_6 = 1, #var_3_17 do
		local var_3_18 = var_3_17[iter_3_6]
		local var_3_19 = pg.benefit_buff_template[var_3_18].desc
		local var_3_20 = findTF(arg_3_0.pointPanel, "add/" .. iter_3_6)

		if PLATFORM_CODE == PLATFORM_JP then
			findTF(var_3_20, "img").sizeDelta = Vector2(450, 70)

			setText(findTF(var_3_20, "text_jp"), var_3_19)
		else
			setText(findTF(var_3_20, "text"), var_3_19)
		end
	end

	setSlider(arg_3_0.pointProgressSlider, 0, arg_3_0.maxNum, var_3_14)
	setText(arg_3_0.pointProgressText, var_3_14 .. "/" .. arg_3_0.maxNum)
	setText(findTF(arg_3_0.btnPoint, "text"), i18n(var_0_1) .. "Lv." .. var_3_15)
	setText(findTF(arg_3_0.pointPanel, "levelNum/num"), "Lv." .. var_3_15)
	setText(findTF(arg_3_0.pointPanel, "levelBuff/num"), "Lv." .. var_3_15)
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.btnBack, function()
		arg_5_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.btnGetAll, function()
		local var_7_0 = arg_5_0.getAllTasks

		arg_5_0:emit(RyzaTaskMediator.SUBMIT_TASK_ALL, {
			activityId = arg_5_0.activityId,
			ids = var_7_0
		})
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.btnPoint, function()
		if isActive(arg_5_0.pointPanel) then
			setActive(arg_5_0.pointPanel, false)
		else
			setActive(arg_5_0.pointPanel, true)
		end
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.btnMain, function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("ryza_task_help_tip")
		})
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.detailBtnGo, function()
		local var_11_0 = Task.New(arg_5_0.selectTask)

		arg_5_0:emit(RyzaTaskMediator.TASK_GO, {
			taskVO = var_11_0
		})
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.pointMask, function()
		setActive(arg_5_0.pointPanel, false)
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.pointClose, function()
		setActive(arg_5_0.pointPanel, false)
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.detailBtnSubmit, function()
		local var_14_0 = arg_5_0.selectTask:getConfig("type")

		if arg_5_0.selectTask:getConfig("sub_type") == 1006 then
			arg_5_0:openSubmitPanel(arg_5_0.selectTask)
		else
			arg_5_0:emit(RyzaTaskMediator.SUBMIT_TASK, {
				activityId = arg_5_0.activityId,
				id = arg_5_0.selectTask.id
			})
		end
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.detailBtnGet, function()
		local var_15_0 = arg_5_0.selectTask:getConfig("type")

		if arg_5_0.selectTask:getConfig("sub_type") == 1006 then
			arg_5_0:openSubmitPanel(arg_5_0.selectTask)
		else
			arg_5_0:emit(RyzaTaskMediator.SUBMIT_TASK, {
				activityId = arg_5_0.activityId,
				id = arg_5_0.selectTask.id
			})
		end
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.detailBtnDetail, function()
		if arg_5_0.selectTask then
			local var_16_0 = tonumber(arg_5_0.selectTask:getConfig("target_id_2"))

			if var_16_0 and var_16_0 > 0 then
				local var_16_1 = AtelierMaterial.New({
					configId = var_16_0,
					count = arg_5_0.selectTask:getConfig("target_num")
				})

				arg_5_0:emit(RyzaTaskMediator.SHOW_DETAIL, var_16_1)
			end
		end
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.submitConfirm, function()
		arg_5_0:emit(RyzaTaskMediator.SUBMIT_TASK, {
			activityId = arg_5_0.activityId,
			id = arg_5_0.selectTask.id
		})
		setActive(arg_5_0.submitPanel, false)
	end, SOUND_BACK)
	onButton(arg_5_0, arg_5_0.submitCancel, function()
		setActive(arg_5_0.submitPanel, false)
	end, SOUND_BACK)

	arg_5_0.btnTags = {}

	for iter_5_0 = 1, var_0_21 do
		local var_5_0 = iter_5_0
		local var_5_1 = findTF(arg_5_0.taskTagPanel, "btn" .. var_5_0)

		onButton(arg_5_0, var_5_1, function()
			if arg_5_0.showTagIndex then
				setActive(findTF(arg_5_0.btnTags[arg_5_0.showTagIndex], "on"), false)

				if arg_5_0.showTagIndex == var_5_0 then
					arg_5_0.showTagIndex = nil
				else
					arg_5_0.showTagIndex = var_5_0

					setActive(findTF(arg_5_0.btnTags[arg_5_0.showTagIndex], "on"), true)
				end
			else
				arg_5_0.showTagIndex = var_5_0

				setActive(findTF(arg_5_0.btnTags[arg_5_0.showTagIndex], "on"), true)
			end

			arg_5_0:onClickTag()
		end)
		table.insert(arg_5_0.btnTags, var_5_1)
	end

	function arg_5_0.scrollRect.onUpdateItem(arg_20_0, arg_20_1)
		arg_5_0:onUpdateTaskItem(arg_20_0, arg_20_1)
	end

	arg_5_0.iconTfs = {}
	arg_5_0.awards = {}

	arg_5_0:onClickTag()

	local var_5_2 = false

	if PlayerPrefs.GetInt("ryza_task_help_" .. getProxy(PlayerProxy):getRawData().id) ~= 1 then
		var_5_2 = true
	end

	if var_5_2 then
		PlayerPrefs.SetInt("ryza_task_help_" .. getProxy(PlayerProxy):getRawData().id, 1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("ryza_task_help_tip")
		})
	end
end

function var_0_0.onClickTag(arg_21_0)
	print("点击了Tag")

	local var_21_0 = arg_21_0.showTagIndex

	if var_21_0 and var_21_0 > 0 then
		if arg_21_0.displayTask[var_21_0] and #arg_21_0.displayTask[var_21_0] > 0 then
			arg_21_0.showTasks = arg_21_0.displayTask[var_21_0]
		else
			triggerButton(arg_21_0.btnTags[arg_21_0.showTagIndex])

			return
		end
	else
		arg_21_0.showTasks = arg_21_0.allDisplayTask
	end

	if arg_21_0.enterTaskId and arg_21_0.enterTaskId > 0 then
		for iter_21_0 = 1, #arg_21_0.showTasks do
			if arg_21_0.showTasks[iter_21_0].id == arg_21_0.enterTaskId then
				arg_21_0.scrollIndex = iter_21_0
			end
		end
	end

	arg_21_0.scrollRect:SetTotalCount(#arg_21_0.showTasks, 0)

	if arg_21_0.scrollIndex ~= nil then
		local var_21_1 = arg_21_0.scrollRect:HeadIndexToValue(arg_21_0.scrollIndex - 1)

		arg_21_0.scrollRect:ScrollTo(var_21_1)
	end
end

function var_0_0.onUpdateTaskItem(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.exitFlag then
		return
	end

	arg_22_0.leanTweens[arg_22_2] = arg_22_2

	table.insert(arg_22_0.leanTweens, arg_22_2)

	local var_22_0 = GetComponent(arg_22_2, typeof(CanvasGroup))

	var_22_0.alpha = 0

	LeanTween.value(arg_22_2, 0, 1, 0.3):setEase(LeanTweenType.linear):setOnUpdate(System.Action_float(function(arg_23_0)
		var_22_0.alpha = arg_23_0
	end)):setOnComplete(System.Action(function()
		arg_22_0.leanTweens[arg_22_2] = nil
	end))

	arg_22_1 = arg_22_1 + 1

	local var_22_1 = arg_22_0.showTasks[arg_22_1]
	local var_22_2 = var_22_1.id
	local var_22_3 = var_22_1:getProgress()
	local var_22_4 = var_22_1:getConfig("name")
	local var_22_5 = var_22_1:getConfig("ryza_icon")
	local var_22_6 = var_22_1:isOver()
	local var_22_7 = var_22_1:isFinish()
	local var_22_8 = var_22_1:isCircle()

	setActive(findTF(arg_22_2, "selected"), arg_22_0.selectIndex == arg_22_1)
	setActive(findTF(arg_22_2, "typeNew"), var_22_1:isNew())
	setActive(findTF(arg_22_2, "typeCircle"), var_22_1:isCircle())
	setActive(findTF(arg_22_2, "finish"), var_22_6)
	setActive(findTF(arg_22_2, "mask"), var_22_6)
	setActive(findTF(arg_22_2, "complete"), not var_22_6 and var_22_7 and not var_22_8)
	setText(findTF(arg_22_2, "desc/text"), shortenString(var_22_4, 10))

	if not var_22_5 or var_22_5 == 0 then
		var_22_5 = "attack"
	end

	setImageSprite(findTF(arg_22_2, "icon/image"), LoadSprite(var_0_20, var_22_5))
	onButton(arg_22_0, tf(arg_22_2), function()
		if arg_22_0.selectItem then
			setActive(findTF(arg_22_0.selectItem, "selected"), false)
		end

		setActive(findTF(arg_22_2, "selected"), true)

		arg_22_0.selectIndex = arg_22_1
		arg_22_0.selectItem = arg_22_2
		arg_22_0.selectTask = var_22_1

		arg_22_0:updateDetail()
	end)

	if arg_22_0.enterTaskId ~= nil and arg_22_0.enterTaskId > 0 then
		if var_22_2 == arg_22_0.enterTaskId then
			triggerButton(arg_22_2)

			arg_22_0.enterTaskId = nil
			arg_22_0.scrollIndex = nil
		end
	elseif arg_22_1 == 1 then
		triggerButton(arg_22_2)

		arg_22_0.scrollIndex = nil
	end
end

function var_0_0.updateDetail(arg_26_0)
	local var_26_0 = arg_26_0.showTasks[arg_26_0.selectIndex]
	local var_26_1 = var_26_0.id
	local var_26_2 = var_26_0:getProgress()
	local var_26_3 = var_26_0.target
	local var_26_4 = pg.task_data_template[var_26_1]
	local var_26_5 = var_26_0:isFinish()
	local var_26_6 = var_26_0:isOver()
	local var_26_7 = var_26_0:isCircle()
	local var_26_8 = var_26_0:isSubmit()

	arg_26_0.awards = var_26_4.award_display

	local var_26_9 = var_26_4.desc
	local var_26_10 = var_26_4.ryza_icon
	local var_26_11 = var_26_0:getConfig("sub_type")

	if not var_26_10 or var_26_10 == 0 then
		var_26_10 = "attack"
	end

	if not var_26_8 and var_26_3 < var_26_2 then
		var_26_2 = var_26_3
	end

	setText(arg_26_0.detailDescText, var_26_9)

	if not var_26_6 then
		setText(arg_26_0.detaiProgressText, var_26_2 .. "/" .. var_26_3)
	else
		setText(arg_26_0.detaiProgressText, "--/--")
	end

	setText(arg_26_0.detailTitleText, var_26_4.name)
	setActive(arg_26_0.detailBtnDetail, var_26_11 == 1006 and not var_26_5 and not var_26_6)
	setActive(arg_26_0.detailBtnGo, not var_26_6 and not var_26_5 and var_26_11 ~= 1006)
	setActive(arg_26_0.detailBtnGet, not var_26_6 and var_26_5 and not var_26_8)
	setActive(arg_26_0.detailBtnSubmit, not var_26_6 and var_26_5 and var_26_8)
	setActive(arg_26_0.detailActive, not var_26_6 and not var_26_5 and not var_26_7)
	setImageSprite(arg_26_0.detailIcon, LoadSprite(var_0_20, var_26_10))

	if #arg_26_0.iconTfs < #arg_26_0.awards then
		local var_26_12 = #arg_26_0.awards - #arg_26_0.iconTfs

		for iter_26_0 = 1, var_26_12 do
			local var_26_13 = tf(Instantiate(arg_26_0.IconTpl))

			setParent(var_26_13, arg_26_0.detailAwardContent)
			setActive(var_26_13, true)
			table.insert(arg_26_0.iconTfs, var_26_13)
		end
	end

	for iter_26_1 = 1, #arg_26_0.iconTfs do
		if iter_26_1 <= #arg_26_0.awards then
			local var_26_14 = arg_26_0.awards[iter_26_1]
			local var_26_15 = {
				type = var_26_14[1],
				id = var_26_14[2],
				count = var_26_14[3]
			}

			updateDrop(arg_26_0.iconTfs[iter_26_1], var_26_15)
			onButton(arg_26_0, arg_26_0.iconTfs[iter_26_1], function()
				arg_26_0:emit(BaseUI.ON_DROP, var_26_15)
			end, SFX_PANEL)
			setActive(arg_26_0.iconTfs[iter_26_1], true)
		else
			setActive(arg_26_0.iconTfs[iter_26_1], false)
		end
	end
end

function var_0_0.openSubmitPanel(arg_28_0, arg_28_1)
	setActive(arg_28_0.submitPanel, true)

	local var_28_0 = tonumber(arg_28_1:getConfig("target_id_2"))
	local var_28_1 = pg.activity_ryza_item[var_28_0].name

	updateDrop(arg_28_0.subimtItem, {
		type = DROP_TYPE_RYZA_DROP,
		id = tonumber(var_28_0),
		count = arg_28_1:getConfig("target_num")
	})
	setText(arg_28_0.submitItemDesc, var_28_1)
end

function var_0_0.willExit(arg_29_0)
	arg_29_0.exitFlag = true

	if arg_29_0.leanTweens and #arg_29_0.leanTweens > 0 then
		for iter_29_0, iter_29_1 in pairs(arg_29_0.leanTweens) do
			if LeanTween.isTweening(iter_29_1) then
				LeanTween.cancel(iter_29_1)
			end
		end

		arg_29_0.leanTweens = {}
	end

	for iter_29_2 = 1, #arg_29_0.allDisplayTask do
		local var_29_0 = arg_29_0.allDisplayTask[iter_29_2]

		if var_29_0:isNew() then
			var_29_0:changeNew()
		end
	end
end

return var_0_0
