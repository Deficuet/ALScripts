local var_0_0 = class("FireworkAndSpringScene", import("view.activity.BackHills.TemplateMV.BackHillTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "FireworkAndSpringUI"
end

var_0_0.edge2area = {
	default = "_SDPlace"
}
var_0_0.EffectPoolCnt = 3
var_0_0.Id2EffectName = {
	[65522] = "yanhua_02",
	[65521] = "yanhua_01",
	[65529] = "yanhua_xinxin",
	[65530] = "yanhua_xiaojiajia",
	[65528] = "yanhua_jiezhi",
	[70175] = "yanhua_2024",
	[65527] = "yanhua_huangji",
	[65524] = "yanhua_denglong",
	[65526] = "yanhua_chuanmao",
	[65523] = "yanhua_maomao",
	[65525] = "yanhua_2025",
	[65532] = "yanhua_she",
	[65531] = "yanhua_hongbao",
	[70178] = "yanhua_denglong"
}
var_0_0.FireworkRange = Vector2(300, 300)
var_0_0.EffectPosLimit = {
	limitX = {
		-700,
		700
	},
	limitY = {
		250,
		500
	}
}
var_0_0.EffectInterval = 1
var_0_0.DelayPop = 2.5
var_0_0.SFX_LIST = {
	"event:/ui/firework1",
	"event:/ui/firework2",
	"event:/ui/firework3",
	"event:/ui/firework4"
}

function var_0_0.init(arg_2_0)
	arg_2_0:InitData()
	var_0_0.super.init(arg_2_0)

	arg_2_0._map = arg_2_0:findTF("map")
	arg_2_0._shipTpl = arg_2_0:findTF("ship")
	arg_2_0.fireworksTF = arg_2_0:findTF("fireworks")
	arg_2_0._SDPlace = arg_2_0:findTF("SDPlace")
	arg_2_0.containers = {
		arg_2_0._SDPlace
	}
	arg_2_0.graphPath = GraphPath.New(import("GameCfg.BackHillGraphs.FireworkAndSpringGraph"))
	arg_2_0.backBtn = arg_2_0:findTF("panel/btn_back")
	arg_2_0.tipBtn = arg_2_0:findTF("panel/btn_tip")
	arg_2_0.ptBtn = arg_2_0:findTF("panel/btn_pt")
	arg_2_0.stage = arg_2_0:findTF("panel/btn_pt/stage")
	arg_2_0.pt = arg_2_0:findTF("panel/btn_pt/pt")
	arg_2_0.taskBtn = arg_2_0:findTF("panel/btn_task")
	arg_2_0.fireworkBtn = arg_2_0:findTF("panel/btn_firework")
	arg_2_0.springBtn = arg_2_0:findTF("panel/btn_spring")
	arg_2_0.subPanel = arg_2_0:findTF("subPanel")
	arg_2_0.subPanelPanel = arg_2_0:findTF("panel", arg_2_0.subPanel)
	arg_2_0.subLeft = arg_2_0:findTF("left", arg_2_0.subPanelPanel)
	arg_2_0.subRight = arg_2_0:findTF("right", arg_2_0.subPanelPanel)
	arg_2_0.subPtBtn = arg_2_0:findTF("ptBtn", arg_2_0.subLeft)
	arg_2_0.subTaskBtn = arg_2_0:findTF("taskBtn", arg_2_0.subLeft)
	arg_2_0.subFireworkBtn = arg_2_0:findTF("fireworkBtn", arg_2_0.subLeft)
	arg_2_0.subSpringBtn = arg_2_0:findTF("springBtn", arg_2_0.subLeft)
	arg_2_0.ptPanel = arg_2_0:findTF("ptPanel", arg_2_0.subRight)
	arg_2_0.taskPanel = arg_2_0:findTF("taskPanel", arg_2_0.subRight)
	arg_2_0.fireworkPanel = arg_2_0:findTF("fireworkPanel", arg_2_0.subRight)
	arg_2_0.springPanel = arg_2_0:findTF("springPanel", arg_2_0.subRight)
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:UpdateMainPt()

	arg_3_0.firePools = {}

	arg_3_0:PlayFireworks()
	arg_3_0:InitStudents()
	arg_3_0:SetTips()
	arg_3_0:CloseSubPanel()

	arg_3_0.hasClonedFireworkArrows = false

	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:closeView()
	end)
	onButton(arg_3_0, arg_3_0.tipBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.firework_2025_tip.tip
		})
	end)
	onButton(arg_3_0, arg_3_0.ptBtn, function()
		arg_3_0:OpenSubPanel(arg_3_0.ptPanel)
		arg_3_0:SetPtPanel()
	end)
	onButton(arg_3_0, arg_3_0.taskBtn, function()
		arg_3_0:OpenSubPanel(arg_3_0.taskPanel)
		arg_3_0:SetTaskPanel()
	end)
	onButton(arg_3_0, arg_3_0.fireworkBtn, function()
		arg_3_0:OpenSubPanel(arg_3_0.fireworkPanel)
		arg_3_0:SetFireWorkPanel()
	end)
	onButton(arg_3_0, arg_3_0.springBtn, function()
		arg_3_0:OpenSubPanel(arg_3_0.springPanel)
		arg_3_0:SetSpringPanel()
	end)
	onButton(arg_3_0, arg_3_0.subPanel, function()
		arg_3_0:CloseSubPanel()
		arg_3_0:PlayFireworks()
	end)
	onButton(arg_3_0, arg_3_0:findTF("btnClose", arg_3_0.ptPanel), function()
		arg_3_0:CloseSubPanel()
		arg_3_0:PlayFireworks()
	end)
	onButton(arg_3_0, arg_3_0:findTF("btnClose", arg_3_0.taskPanel), function()
		arg_3_0:CloseSubPanel()
		arg_3_0:PlayFireworks()
	end)
	onButton(arg_3_0, arg_3_0:findTF("btnClose", arg_3_0.fireworkPanel), function()
		arg_3_0:CloseSubPanel()
		arg_3_0:PlayFireworks()
	end)
	onButton(arg_3_0, arg_3_0:findTF("btnClose", arg_3_0.springPanel), function()
		arg_3_0:CloseSubPanel()
		arg_3_0:PlayFireworks()
	end)
	onButton(arg_3_0, arg_3_0.subPtBtn, function()
		arg_3_0:SetSubPanel(arg_3_0.ptPanel)
		arg_3_0:SetPtPanel()
	end)
	onButton(arg_3_0, arg_3_0.subTaskBtn, function()
		arg_3_0:SetSubPanel(arg_3_0.taskPanel)
		arg_3_0:SetTaskPanel()
	end)
	onButton(arg_3_0, arg_3_0.subFireworkBtn, function()
		arg_3_0:SetSubPanel(arg_3_0.fireworkPanel)
		arg_3_0:SetFireWorkPanel()
	end)
	onButton(arg_3_0, arg_3_0.subSpringBtn, function()
		arg_3_0:SetSubPanel(arg_3_0.springPanel)
		arg_3_0:SetSpringPanel()
	end)
end

function var_0_0.InitData(arg_19_0)
	arg_19_0.ptActId = ActivityConst.FireworkAndSpring_PT_ID
	arg_19_0.taskActId = ActivityConst.FireworkAndSpring_TASK_ID
	arg_19_0.fireworkActId = ActivityConst.FireworkAndSpring_ACT_ID
	arg_19_0.springActId = ActivityConst.FireworkAndSpring_EMO_ID

	arg_19_0:UpdatePtData()
	arg_19_0:UpdateTaskData()
	arg_19_0:UpdateFireworkData()
	arg_19_0:UpdateSpringData()
end

function var_0_0.UpdatePtData(arg_20_0)
	arg_20_0.ptActivity = getProxy(ActivityProxy):getActivityById(arg_20_0.ptActId)
	arg_20_0.ptData = ActivityPtData.New(arg_20_0.ptActivity)
end

function var_0_0.UpdateTaskData(arg_21_0)
	arg_21_0.taskActivity = getProxy(ActivityProxy):getActivityById(arg_21_0.taskActId)
	arg_21_0.taskVOs = {}

	local var_21_0 = arg_21_0.taskActivity:getConfig("config_data")

	for iter_21_0, iter_21_1 in pairs(var_21_0) do
		table.insert(arg_21_0.taskVOs, getProxy(TaskProxy):getTaskVO(iter_21_1))
	end

	arg_21_0.canGetTaskVOs = {}
	arg_21_0.canGetTaskIds = {}

	arg_21_0:sort(arg_21_0.taskVOs)
end

function var_0_0.sort(arg_22_0, arg_22_1)
	local var_22_0 = {}

	arg_22_0.canGetTaskAward = false

	for iter_22_0, iter_22_1 in pairs(arg_22_1) do
		if iter_22_1:getTaskStatus() == 1 then
			table.insert(var_22_0, iter_22_1)
			table.insert(arg_22_0.canGetTaskVOs, iter_22_1)
			table.insert(arg_22_0.canGetTaskIds, iter_22_1.id)

			arg_22_0.canGetTaskAward = true
		end
	end

	for iter_22_2, iter_22_3 in pairs(arg_22_1) do
		if iter_22_3:getTaskStatus() == 0 then
			table.insert(var_22_0, iter_22_3)
		end
	end

	for iter_22_4, iter_22_5 in pairs(arg_22_1) do
		if iter_22_5:getTaskStatus() == 2 then
			table.insert(var_22_0, iter_22_5)
		end
	end

	arg_22_0.taskVOs = var_22_0
end

function var_0_0.UpdateFireworkData(arg_23_0)
	arg_23_0.fireworkActivity = getProxy(ActivityProxy):getActivityById(arg_23_0.fireworkActId)
	arg_23_0.fireworkUnlockIds = arg_23_0.fireworkActivity.data1_list
	arg_23_0.fireworkGotIds = arg_23_0.fireworkActivity.data2_list
	arg_23_0.fireworkAllIds = arg_23_0.fireworkActivity:GetPicturePuzzleIds()
	arg_23_0.playerId = getProxy(PlayerProxy):getData().id
	arg_23_0.fireworkOrderIds = arg_23_0:GetFireWorkLocalData()
end

function var_0_0.GetFireWorkLocalData(arg_24_0)
	local var_24_0 = {}

	for iter_24_0 = 1, #arg_24_0.fireworkAllIds do
		local var_24_1 = PlayerPrefs.GetInt("fireworks_" .. arg_24_0.fireworkActId .. "_" .. arg_24_0.playerId .. "_pos_" .. iter_24_0)

		if var_24_1 ~= 0 then
			table.insert(var_24_0, var_24_1)
		end
	end

	return var_24_0
end

function var_0_0.SetFireWorkLocalData(arg_25_0)
	for iter_25_0 = 1, #arg_25_0.fireworkAllIds do
		local var_25_0 = arg_25_0.fireworkOrderIds[iter_25_0] or 0

		PlayerPrefs.SetInt("fireworks_" .. arg_25_0.fireworkActId .. "_" .. arg_25_0.playerId .. "_pos_" .. iter_25_0, var_25_0)
	end
end

function var_0_0.UpdateSpringData(arg_26_0)
	arg_26_0.springActivity = getProxy(ActivityProxy):getActivityById(arg_26_0.springActId)
	arg_26_0.springShipIds = _.map(arg_26_0.springActivity:GetShipIds(), function(arg_27_0)
		if getProxy(BayProxy):RawGetShipById(arg_27_0) then
			return arg_27_0
		else
			return 0
		end
	end)
	arg_26_0.springMaxCnt = arg_26_0.springActivity:GetSlotCount()
	arg_26_0.springSlotLockList = {}
	arg_26_0.springUnlockSlotCount = arg_26_0.springActivity:getConfig("config_client").initialCount

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.springActivity:getConfig("config_client").unlockPt) do
		if iter_26_1 <= arg_26_0.ptData.count then
			arg_26_0.springUnlockSlotCount = arg_26_0.springUnlockSlotCount + 1
		end
	end

	for iter_26_2 = 1, arg_26_0.springMaxCnt do
		local var_26_0 = iter_26_2 > arg_26_0.springUnlockSlotCount

		arg_26_0.springSlotLockList[iter_26_2] = var_26_0
	end

	arg_26_0.energyRecoverAddition = arg_26_0.springActivity:GetEnergyRecoverAddition() * 10
end

function var_0_0.OpenSubPanel(arg_28_0, arg_28_1)
	setActive(arg_28_0.subPanel, true)
	arg_28_0:SetSubPanel(arg_28_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_28_0.subPanelPanel)
end

function var_0_0.CloseSubPanel(arg_29_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0.subPanelPanel, arg_29_0.subPanel)
	setActive(arg_29_0.subPanel, false)
end

function var_0_0.SetSubPanel(arg_30_0, arg_30_1)
	setActive(arg_30_0.ptPanel, false)
	setActive(arg_30_0.taskPanel, false)
	setActive(arg_30_0.fireworkPanel, false)
	setActive(arg_30_0.springPanel, false)
	setActive(arg_30_1, true)
	setActive(arg_30_0:findTF("selected", arg_30_0.subPtBtn), arg_30_1 == arg_30_0.ptPanel)
	setActive(arg_30_0:findTF("selected", arg_30_0.subTaskBtn), arg_30_1 == arg_30_0.taskPanel)
	setActive(arg_30_0:findTF("selected", arg_30_0.subFireworkBtn), arg_30_1 == arg_30_0.fireworkPanel)
	setActive(arg_30_0:findTF("selected", arg_30_0.subSpringBtn), arg_30_1 == arg_30_0.springPanel)
end

function var_0_0.UpdateMainPt(arg_31_0)
	setText(arg_31_0.stage, "Lv." .. arg_31_0.ptData:GetCurrLevel())

	if not arg_31_0.ptData:IsMaxLevel() then
		setText(arg_31_0.pt, arg_31_0.ptData.count .. "/" .. arg_31_0.ptData:GetNextLevelTarget())
	else
		setText(arg_31_0.pt, "MAX")
	end
end

function var_0_0.SetPtPanel(arg_32_0)
	setText(arg_32_0:findTF("lvText", arg_32_0.ptPanel), arg_32_0.ptData:GetCurrLevel())

	if not arg_32_0.ptData:IsMaxLevel() then
		setText(arg_32_0:findTF("pt", arg_32_0.ptPanel), arg_32_0.ptData.count .. "/" .. arg_32_0.ptData:GetNextLevelTarget())
		setSlider(arg_32_0:findTF("slider", arg_32_0.ptPanel), 0, arg_32_0.ptData:GetNextLevelTarget(), arg_32_0.ptData.count)
	else
		setText(arg_32_0:findTF("pt", arg_32_0.ptPanel), "MAX")
		setSlider(arg_32_0:findTF("slider", arg_32_0.ptPanel), 0, 1, 1)
	end

	setText(arg_32_0:findTF("ptScroll/Viewport/Content/tpl/get/Text", arg_32_0.ptPanel), i18n("firework_2025_get"))
	setText(arg_32_0:findTF("ptScroll/Viewport/Content/tpl/got/Text", arg_32_0.ptPanel), i18n("firework_2025_got"))

	local var_32_0 = UIItemList.New(arg_32_0:findTF("ptScroll/Viewport/Content", arg_32_0.ptPanel), arg_32_0:findTF("ptScroll/Viewport/Content/tpl", arg_32_0.ptPanel))

	var_32_0:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventUpdate then
			local var_33_0 = arg_32_0.ptData.dropList[arg_33_1 + 1]
			local var_33_1 = arg_32_0.ptData.targets[arg_33_1 + 1]

			setText(arg_33_2:Find("level"), i18n("firework_2025_level", arg_33_1 + 1))

			local var_33_2 = Drop.Create(var_33_0)

			updateDrop(arg_33_2:Find("award"), var_33_2)
			onButton(arg_32_0, arg_33_2:Find("award"), function()
				arg_32_0:emit(BaseUI.ON_DROP, var_33_2)
			end, SFX_PANEL)

			local var_33_3 = arg_32_0.ptData:GetDroptItemState(arg_33_1 + 1)

			if var_33_3 == ActivityPtData.STATE_LOCK then
				setActive(arg_33_2:Find("lock"), true)
				setActive(arg_33_2:Find("get"), false)
				setActive(arg_33_2:Find("got"), false)
			elseif var_33_3 == ActivityPtData.STATE_CAN_GET then
				setActive(arg_33_2:Find("lock"), false)
				setActive(arg_33_2:Find("get"), true)
				setActive(arg_33_2:Find("got"), false)
			else
				setActive(arg_33_2:Find("lock"), false)
				setActive(arg_33_2:Find("get"), false)
				setActive(arg_33_2:Find("got"), true)
			end
		end
	end)
	var_32_0:align(#arg_32_0.ptData.dropList)

	local var_32_1 = rtf(arg_32_0:findTF("ptScroll/Viewport/Content/tpl", arg_32_0.ptPanel)).rect.width
	local var_32_2 = arg_32_0:findTF("ptScroll/Viewport/Content", arg_32_0.ptPanel):GetComponent(typeof(HorizontalLayoutGroup)).spacing
	local var_32_3 = rtf(arg_32_0:findTF("ptScroll/Viewport", arg_32_0.ptPanel)).rect.width

	scrollTo(arg_32_0:findTF("ptScroll", arg_32_0.ptPanel), arg_32_0.ptData.level * (var_32_1 + var_32_2) / (#arg_32_0.ptData.targets * (var_32_1 + var_32_2) - var_32_2 - var_32_3), 0)

	local var_32_4 = 6

	arg_32_0.importants = arg_32_0.ptActivity:getConfig("config_client").highValueItemSort
	arg_32_0.importantsPos = {}

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.importants) do
		table.insert(arg_32_0.importantsPos, (iter_32_1 - var_32_4 - 1) * (var_32_1 + var_32_2) / (#arg_32_0.ptData.targets * (var_32_1 + var_32_2) - var_32_2 - var_32_3))
	end

	arg_32_0:PtScrollToDo(arg_32_0.ptData.level * (var_32_1 + var_32_2) / (#arg_32_0.ptData.targets * (var_32_1 + var_32_2) - var_32_2 - var_32_3))
	onScroll(arg_32_0, arg_32_0:findTF("ptScroll", arg_32_0.ptPanel), function(arg_35_0)
		arg_32_0:PtScrollToDo(arg_35_0.x)
	end)

	if arg_32_0.ptData:CanGetAward() then
		setActive(arg_32_0:findTF("btn_get", arg_32_0.ptPanel), true)
		onButton(arg_32_0, arg_32_0:findTF("btn_get", arg_32_0.ptPanel), function()
			local var_36_0 = {}
			local var_36_1 = arg_32_0.ptData:GetAllAvailableAwards()
			local var_36_2 = getProxy(PlayerProxy):getRawData()
			local var_36_3 = pg.gameset.urpt_chapter_max.description[1]
			local var_36_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_36_3)
			local var_36_5, var_36_6 = Task.StaticJudgeOverflow(var_36_2.gold, var_36_2.oil, var_36_4, true, true, var_36_1)

			if var_36_5 then
				table.insert(var_36_0, function(arg_37_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("award_max_warning"),
						items = var_36_6,
						onYes = arg_37_0
					})
				end)
			end

			seriesAsync(var_36_0, function()
				local var_38_0 = arg_32_0.ptData:GetCurrTarget()

				arg_32_0:emit(FireworkAndSpringMediator.EVENT_PT_OPERATION, {
					cmd = 4,
					activity_id = arg_32_0.ptData:GetId(),
					arg1 = var_38_0
				})
			end)
		end, SFX_PANEL)
	else
		setActive(arg_32_0:findTF("btn_get", arg_32_0.ptPanel), false)
		removeOnButton(arg_32_0:findTF("btn_get", arg_32_0.ptPanel))
	end

	setText(arg_32_0:findTF("ptName", arg_32_0.ptPanel), i18n("firework_2025_pt"))
end

function var_0_0.PtScrollToDo(arg_39_0, arg_39_1)
	local var_39_0 = 0

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.importantsPos) do
		if arg_39_1 < iter_39_1 or iter_39_0 == #arg_39_0.importants then
			var_39_0 = arg_39_0.importants[iter_39_0]

			break
		end
	end

	local var_39_1 = Drop.Create(arg_39_0.ptData.dropList[var_39_0])

	updateDrop(arg_39_0:findTF("award", arg_39_0.ptPanel), var_39_1)
	onButton(arg_39_0, arg_39_0:findTF("award", arg_39_0.ptPanel), function()
		arg_39_0:emit(BaseUI.ON_DROP, var_39_1)
	end, SFX_PANEL)
	setText(arg_39_0:findTF("awardInfo/Text", arg_39_0.ptPanel), i18n("firework_2025_level", var_39_0))
	setActive(arg_39_0:findTF("award/got", arg_39_0.ptPanel), var_39_0 <= arg_39_0.ptData.level)
end

function var_0_0.SetTaskPanel(arg_41_0)
	setText(arg_41_0:findTF("lvText", arg_41_0.taskPanel), arg_41_0.ptData:GetCurrLevel())

	if not arg_41_0.ptData:IsMaxLevel() then
		setText(arg_41_0:findTF("pt", arg_41_0.taskPanel), arg_41_0.ptData.count .. "/" .. arg_41_0.ptData:GetNextLevelTarget())
		setSlider(arg_41_0:findTF("slider", arg_41_0.taskPanel), 0, arg_41_0.ptData:GetNextLevelTarget(), arg_41_0.ptData.count)
	else
		setText(arg_41_0:findTF("pt", arg_41_0.taskPanel), "MAX")
		setSlider(arg_41_0:findTF("slider", arg_41_0.taskPanel), 0, 1, 1)
	end

	local var_41_0 = UIItemList.New(arg_41_0:findTF("taskScroll/Viewport/Content", arg_41_0.taskPanel), arg_41_0:findTF("taskScroll/Viewport/Content/Tasktpl", arg_41_0.taskPanel))

	var_41_0:make(function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_0 == UIItemList.EventUpdate then
			local var_42_0 = arg_41_0.taskVOs[arg_42_1 + 1]

			setText(arg_42_2:Find("frame/name"), var_42_0:getConfig("name"))
			setText(arg_42_2:Find("frame/desc"), var_42_0:getConfig("desc"))

			local var_42_1 = var_42_0:getProgress()
			local var_42_2 = var_42_0:getConfig("target_num")
			local var_42_3 = math.min(var_42_1, var_42_2)

			setText(arg_42_2:Find("frame/progress"), var_42_3 .. "/" .. var_42_2)

			arg_42_2:Find("frame/slider"):GetComponent(typeof(Slider)).value = var_42_3 / var_42_2

			local var_42_4 = arg_42_2:Find("frame/awards")
			local var_42_5 = var_42_4:GetChild(0)

			arg_41_0:updateTaskAwards(var_42_0:getConfig("award_display"), var_42_4, var_42_5)

			local var_42_6 = arg_42_2:Find("frame/go_btn")
			local var_42_7 = arg_42_2:Find("frame/get_btn")
			local var_42_8 = arg_42_2:Find("frame/got_btn")

			if var_42_0:getTaskStatus() == 0 then
				setActive(var_42_6, true)
				setActive(var_42_7, false)
				setActive(var_42_8, false)
			elseif var_42_0:getTaskStatus() == 1 then
				setActive(var_42_6, false)
				setActive(var_42_7, true)
				setActive(var_42_8, false)
			elseif var_42_0:getTaskStatus() == 2 then
				setActive(var_42_6, false)
				setActive(var_42_7, false)
				setActive(var_42_8, true)
			end

			onButton(arg_41_0, var_42_6, function()
				arg_41_0:emit(FireworkAndSpringMediator.ON_TASK_GO, var_42_0)
			end, SFX_PANEL)
			onButton(arg_41_0, var_42_7, function()
				arg_41_0:emit(FireworkAndSpringMediator.ON_TASK_SUBMIT, var_42_0)
			end, SFX_PANEL)
		end
	end)
	var_41_0:align(#arg_41_0.taskVOs)

	if arg_41_0.canGetTaskAward then
		setActive(arg_41_0:findTF("btn_get", arg_41_0.taskPanel), true)
		onButton(arg_41_0, arg_41_0:findTF("btn_get", arg_41_0.taskPanel), function()
			local var_45_0 = {}
			local var_45_1 = {}

			for iter_45_0, iter_45_1 in pairs(arg_41_0.canGetTaskVOs) do
				local var_45_2 = iter_45_1:getConfig("award_display")

				for iter_45_2, iter_45_3 in ipairs(var_45_2) do
					local var_45_3 = iter_45_3
					local var_45_4 = false

					for iter_45_4, iter_45_5 in pairs(var_45_1) do
						if iter_45_5[1] == var_45_3[1] and iter_45_5[2] == var_45_3[2] then
							var_45_4 = true
							iter_45_5[3] = iter_45_5[3] + var_45_3[3]

							break
						end
					end

					if not var_45_4 then
						table.insert(var_45_1, var_45_3)
					end
				end
			end

			local var_45_5 = getProxy(PlayerProxy):getRawData()
			local var_45_6 = pg.gameset.urpt_chapter_max.description[1]
			local var_45_7 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_45_6)
			local var_45_8, var_45_9 = Task.StaticJudgeOverflow(var_45_5.gold, var_45_5.oil, var_45_7, true, true, var_45_1)

			if var_45_8 then
				table.insert(var_45_0, function(arg_46_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("award_max_warning"),
						items = var_45_9,
						onYes = arg_46_0
					})
				end)
			end

			seriesAsync(var_45_0, function()
				arg_41_0:emit(FireworkAndSpringMediator.ON_TASK_SUBMIT_ONESTEP, arg_41_0.taskActId, arg_41_0.canGetTaskIds)
			end)
		end, SFX_PANEL)
	else
		setActive(arg_41_0:findTF("btn_get", arg_41_0.taskPanel), false)
		removeOnButton(arg_41_0:findTF("btn_get", arg_41_0.taskPanel))
	end

	setText(arg_41_0:findTF("ptName", arg_41_0.taskPanel), i18n("firework_2025_pt"))
end

function var_0_0.updateTaskAwards(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0 = _.slice(arg_48_1, 1, 3)

	for iter_48_0 = arg_48_2.childCount, #var_48_0 - 1 do
		cloneTplTo(arg_48_3, arg_48_2)
	end

	local var_48_1 = arg_48_2.childCount

	for iter_48_1 = 1, var_48_1 do
		local var_48_2 = arg_48_2:GetChild(iter_48_1 - 1)
		local var_48_3 = iter_48_1 <= #var_48_0

		setActive(var_48_2, var_48_3)

		if var_48_3 then
			local var_48_4 = var_48_0[iter_48_1]
			local var_48_5 = {
				type = var_48_4[1],
				id = var_48_4[2],
				count = var_48_4[3]
			}

			updateDrop(var_48_2, var_48_5)
			onButton(arg_48_0, var_48_2, function()
				arg_48_0:emit(BaseUI.ON_DROP, var_48_5)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetFireWorkPanel(arg_50_0)
	local var_50_0 = arg_50_0:findTF("left_panel", arg_50_0.fireworkPanel)
	local var_50_1 = arg_50_0:findTF("right_panel", arg_50_0.fireworkPanel)
	local var_50_2 = arg_50_0:findTF("fire_btn", var_50_1)
	local var_50_3 = arg_50_0:findTF("scrollrect/content/item_tpl", var_50_0)
	local var_50_4 = arg_50_0:findTF("scrollrect/content", var_50_0)

	arg_50_0.leftUIList = UIItemList.New(var_50_4, var_50_3)

	local var_50_5 = arg_50_0:findTF("content/item_tpl", var_50_1)
	local var_50_6 = arg_50_0:findTF("content", var_50_1)

	arg_50_0.rightUIList = UIItemList.New(var_50_6, var_50_5)

	local var_50_7 = arg_50_0:findTF("arrows", var_50_1)

	onButton(arg_50_0, var_50_2, function()
		arg_50_0:CloseSubPanel()
		arg_50_0:PlayFireworks()
	end)
	setText(arg_50_0:findTF("tip", var_50_1), i18n("activity_yanhua_tip7"))
	setText(arg_50_0:findTF("tip", var_50_0), i18n("firework_2025_tip1"))
	arg_50_0.leftUIList:make(function(arg_52_0, arg_52_1, arg_52_2)
		if arg_52_0 == UIItemList.EventUpdate then
			local var_52_0 = arg_50_0.fireworkAllIds[arg_52_1 + 1]
			local var_52_1 = arg_50_0:findTF("firework/icon", arg_52_2)

			GetImageSpriteFromAtlasAsync(Item.getConfigData(var_52_0).icon, "", var_52_1)

			local var_52_2 = arg_50_0:findTF("firework/selected", arg_52_2)
			local var_52_3 = table.contains(arg_50_0.fireworkOrderIds, var_52_0)

			setActive(var_52_2, var_52_3)

			if not table.contains(arg_50_0.fireworkUnlockIds, var_52_0) then
				setActive(arg_50_0:findTF("firework/lock", arg_52_2), true)
				setActive(arg_50_0:findTF("firework/get", arg_52_2), false)
			elseif not table.contains(arg_50_0.fireworkGotIds, var_52_0) then
				setActive(arg_50_0:findTF("firework/lock", arg_52_2), false)
				setActive(arg_50_0:findTF("firework/get", arg_52_2), true)
				onButton(arg_50_0, arg_52_2, function()
					arg_50_0:emit(FireworkAndSpringMediator.ACTIVITY_OPERATION, arg_50_0.fireworkActId, var_52_0)
				end, SFX_PANEL)
			else
				setActive(arg_50_0:findTF("firework/lock", arg_52_2), false)
				setActive(arg_50_0:findTF("firework/get", arg_52_2), false)
				onButton(arg_50_0, arg_52_2, function()
					arg_50_0:FireworkLeftClick(var_52_0, var_52_3)
				end, SFX_PANEL)
			end
		end
	end)
	arg_50_0.leftUIList:align(#arg_50_0.fireworkAllIds)

	if not arg_50_0.hasClonedFireworkArrows then
		arg_50_0.hasClonedFireworkArrows = true

		for iter_50_0 = 1, #arg_50_0.fireworkAllIds - 2 do
			cloneTplTo(arg_50_0:findTF("tpl", var_50_7), var_50_7)
		end
	end

	arg_50_0.rightUIList:make(function(arg_55_0, arg_55_1, arg_55_2)
		if arg_55_0 == UIItemList.EventUpdate then
			local var_55_0 = arg_55_1 + 1
			local var_55_1 = arg_50_0:findTF("icon", arg_55_2)

			setActive(arg_50_0:findTF("add", arg_55_2), var_55_0 > #arg_50_0.fireworkOrderIds)

			if var_55_0 > #arg_50_0.fireworkOrderIds then
				setActive(var_55_1, false)
			else
				local var_55_2 = arg_50_0.fireworkOrderIds[var_55_0]

				setActive(var_55_1, true)
				GetImageSpriteFromAtlasAsync(Item.getConfigData(var_55_2).icon, "", var_55_1)
				onButton(arg_50_0, var_55_1, function()
					arg_50_0:FireworkRightClick(var_55_2)
				end, SFX_PANEL)
			end
		end
	end)
	arg_50_0.rightUIList:align(#arg_50_0.fireworkAllIds)
end

function var_0_0.FireworkLeftClick(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_2 then
		table.removebyvalue(arg_57_0.fireworkOrderIds, arg_57_1)
	else
		table.insert(arg_57_0.fireworkOrderIds, arg_57_1)
	end

	arg_57_0:SetFireWorkLocalData()
	arg_57_0.leftUIList:align(#arg_57_0.fireworkAllIds)
	arg_57_0.rightUIList:align(#arg_57_0.fireworkAllIds)
end

function var_0_0.FireworkRightClick(arg_58_0, arg_58_1)
	table.removebyvalue(arg_58_0.fireworkOrderIds, arg_58_1)
	arg_58_0:SetFireWorkLocalData()
	arg_58_0.leftUIList:align(#arg_58_0.fireworkAllIds)
	arg_58_0.rightUIList:align(#arg_58_0.fireworkAllIds)
end

function var_0_0.SetSpringPanel(arg_59_0)
	arg_59_0:CreateSpringUI()
	arg_59_0:UpdateSpringUI()
end

function var_0_0.CreateSpringUI(arg_60_0)
	setText(arg_60_0:findTF("list/iconTpl/lock/Text", arg_60_0.springPanel), i18n("firework_2025_unlock_tip1"))

	arg_60_0.springList = UIItemList.New(arg_60_0:findTF("list", arg_60_0.springPanel), arg_60_0:findTF("list/iconTpl", arg_60_0.springPanel))

	arg_60_0.springList:make(function(arg_61_0, arg_61_1, arg_61_2)
		if arg_61_0 == UIItemList.EventUpdate then
			local var_61_0 = arg_60_0.springShipIds[arg_61_1 + 1]
			local var_61_1 = arg_60_0.springSlotLockList[arg_61_1 + 1]
			local var_61_2 = var_61_0 and var_61_0 > 0

			setActive(arg_61_2:Find("lock"), var_61_1)
			setActive(arg_61_2:Find("add"), not var_61_1 and not var_61_2)
			setActive(arg_61_2:Find("ship"), not var_61_1 and var_61_2)

			if var_61_1 then
				setText(arg_61_2:Find("lock/taskText"), i18n("firework_2025_unlock_tip2", arg_60_0.springActivity:getConfig("config_client").unlockPt[arg_61_1 + 1 - arg_60_0.springActivity:getConfig("config_client").initialCount]))
			end

			onButton(arg_60_0, arg_61_2, function()
				if var_61_1 then
					return
				end

				local var_62_0

				if var_61_2 then
					var_62_0 = getProxy(BayProxy):getShipById(var_61_0)
				end

				local var_62_1 = arg_60_0.springUnlockSlotCount

				arg_60_0:StopPlayFireworks()
				arg_60_0:emit(FireworkAndSpringMediator.OPEN_CHUANWU, arg_60_0.springActId, arg_61_1 + 1, var_62_0, arg_60_0.springUnlockSlotCount)
			end, SFX_PANEL)

			if not var_61_2 then
				return
			end

			local var_61_3 = getProxy(BayProxy):RawGetShipById(var_61_0)
			local var_61_4 = LoadSprite("shipyardicon/" .. var_61_3:getPainting())

			setImageSprite(arg_61_2:Find("ship/mask/icon"), var_61_4)
			setText(arg_61_2:Find("ship/name/Text"), var_61_3:getName())
		end
	end)
	setText(arg_60_0:findTF("tipText1", arg_60_0.springPanel), i18n("firework_2025_tip2"))
	setText(arg_60_0:findTF("tipText2", arg_60_0.springPanel), "+" .. arg_60_0.energyRecoverAddition .. "/h")
end

function var_0_0.UpdateSpringUI(arg_63_0)
	arg_63_0.springList:align(arg_63_0.springMaxCnt)
end

function var_0_0.UpdateSpringActivityAndUI(arg_64_0)
	arg_64_0:UpdateSpringData()
	arg_64_0:UpdateSpringUI()
	arg_64_0:clearStudents()
	arg_64_0:InitStudents()
end

function var_0_0.PlayFireworks(arg_65_0)
	arg_65_0.fireworks = Clone(arg_65_0.fireworkOrderIds)

	if #arg_65_0.fireworks == 0 then
		return
	end

	eachChild(arg_65_0.fireworksTF, function(arg_66_0)
		setActive(arg_66_0, false)
	end)
	setActive(arg_65_0.fireworksTF, true)
	arg_65_0:StopFireworksTimer()

	arg_65_0.fireworkIndex = 1
	arg_65_0.fireworksTimer = Timer.New(function()
		arg_65_0:PlayerOneFirework()
	end, var_0_0.EffectInterval, #arg_65_0.fireworks)

	arg_65_0.fireworksTimer:Start()
end

function var_0_0.PlayerOneFirework(arg_68_0)
	if arg_68_0.fireworkIndex == #arg_68_0.fireworks then
		arg_68_0:managedTween(LeanTween.delayedCall, function()
			if arg_68_0.fireworks then
				arg_68_0:StopPlayFireworks()
				arg_68_0:PlayFireworks()
			end
		end, var_0_0.DelayPop, nil)
	end

	local var_68_0 = arg_68_0.fireworks[arg_68_0.fireworkIndex]
	local var_68_1 = math.random(#var_0_0.SFX_LIST)

	if arg_68_0.firePools[var_68_0] and #arg_68_0.firePools[var_68_0] >= var_0_0.EffectPoolCnt then
		local var_68_2 = arg_68_0.firePools[var_68_0][1]

		setLocalPosition(var_68_2, arg_68_0:GetFireworkPos())
		setActive(var_68_2, true)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_0.SFX_LIST[var_68_1])
		table.removebyvalue(arg_68_0.firePools[var_68_0], var_68_2)
		table.insert(arg_68_0.firePools[var_68_0], var_68_2)
	else
		arg_68_0.loader:GetPrefab("ui/" .. var_0_0.Id2EffectName[var_68_0], "", function(arg_70_0)
			pg.ViewUtils.SetSortingOrder(arg_70_0, 1)
			setParent(arg_70_0, arg_68_0.fireworksTF)
			setLocalPosition(arg_70_0, arg_68_0:GetFireworkPos())
			setActive(arg_70_0, true)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_0.SFX_LIST[var_68_1])

			if not arg_68_0.firePools[var_68_0] then
				arg_68_0.firePools[var_68_0] = {}
			end

			table.insert(arg_68_0.firePools[var_68_0], arg_70_0)
		end)
	end

	arg_68_0.fireworkIndex = arg_68_0.fireworkIndex + 1
end

function var_0_0.GetFireworkPos(arg_71_0)
	local var_71_0 = Vector2(0, 0)

	if arg_71_0.lastPos then
		local var_71_1 = Vector2(arg_71_0.lastPos.x, arg_71_0.lastPos.y)
		local var_71_2 = math.abs(var_71_1.x - arg_71_0.lastPos.x)
		local var_71_3 = math.abs(var_71_1.y - arg_71_0.lastPos.y)

		while var_71_2 < var_0_0.FireworkRange.x / 2 and var_71_3 < var_0_0.FireworkRange.y or var_71_3 < var_0_0.FireworkRange.y / 2 and var_71_2 < var_0_0.FireworkRange.x do
			var_71_1.x = math.random(var_0_0.EffectPosLimit.limitX[1], var_0_0.EffectPosLimit.limitX[2])
			var_71_1.y = math.random(var_0_0.EffectPosLimit.limitY[1], var_0_0.EffectPosLimit.limitY[2])
			var_71_2 = math.abs(var_71_1.x - arg_71_0.lastPos.x)
			var_71_3 = math.abs(var_71_1.y - arg_71_0.lastPos.y)
		end

		var_71_0 = var_71_1
	else
		var_71_0.x = math.random(var_0_0.EffectPosLimit.limitX[1], var_0_0.EffectPosLimit.limitX[2])
		var_71_0.y = math.random(var_0_0.EffectPosLimit.limitY[1], var_0_0.EffectPosLimit.limitY[2])
	end

	arg_71_0.lastPos = var_71_0

	return var_71_0
end

function var_0_0.StopFireworksTimer(arg_72_0)
	if arg_72_0.fireworksTimer then
		arg_72_0.fireworksTimer:Stop()

		arg_72_0.fireworksTimer = nil
	end
end

function var_0_0.StopPlayFireworks(arg_73_0)
	arg_73_0:StopFireworksTimer()

	arg_73_0.fireworks = nil
	arg_73_0.fireworkIndex = nil

	setActive(arg_73_0.fireworksTF, false)
end

function var_0_0.getStudents(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = {}
	local var_74_1 = {}

	if not arg_74_0.springActivity then
		return var_74_0
	end

	local var_74_2 = arg_74_0.springActivity:GetShipIds()

	for iter_74_0 = 1, arg_74_0.springMaxCnt do
		if var_74_2[iter_74_0] and var_74_2[iter_74_0] ~= 0 then
			local var_74_3 = getProxy(BayProxy):RawGetShipById(var_74_2[iter_74_0])

			if var_74_3 then
				table.insert(var_74_1, var_74_3)
			end
		end
	end

	if not arg_74_1 or not arg_74_2 then
		arg_74_1 = #var_74_1
		arg_74_2 = #var_74_1
	end

	local var_74_4 = math.random(arg_74_1, arg_74_2)
	local var_74_5 = #var_74_1

	while var_74_4 > 0 and var_74_5 > 0 do
		local var_74_6 = math.random(1, var_74_5)

		table.insert(var_74_0, var_74_1[var_74_6]:getPrefab())

		var_74_1[var_74_6] = var_74_1[var_74_5]
		var_74_5 = var_74_5 - 1
		var_74_4 = var_74_4 - 1
	end

	return var_74_0
end

function var_0_0.InitStudents(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0:getStudents(arg_75_1, arg_75_2)
	local var_75_1 = {}

	for iter_75_0, iter_75_1 in pairs(arg_75_0.graphPath.points) do
		if not iter_75_1.outRandom then
			table.insert(var_75_1, iter_75_1)
		end
	end

	local var_75_2 = #var_75_1

	arg_75_0.academyStudents = {}

	local var_75_3 = {}

	for iter_75_2, iter_75_3 in pairs(var_75_0) do
		if not arg_75_0.academyStudents[iter_75_2] then
			local var_75_4 = cloneTplTo(arg_75_0._shipTpl, arg_75_0._map)

			var_75_4.gameObject.name = iter_75_2

			local var_75_5 = arg_75_0:ChooseRandomPos(var_75_1, var_75_2)

			var_75_2 = (var_75_2 - 2) % #var_75_1 + 1

			local var_75_6 = SummerFeastNavigationAgent.New(var_75_4.gameObject)

			var_75_6.normalSpeed = 100

			var_75_6:attach()
			var_75_6:setPathFinder(arg_75_0.graphPath)
			var_75_6:SetPositionTable(var_75_3)
			var_75_6:setCurrentIndex(var_75_5 and var_75_5.id)
			var_75_6:SetOnTransEdge(function(arg_76_0, arg_76_1, arg_76_2)
				arg_76_1, arg_76_2 = math.min(arg_76_1, arg_76_2), math.max(arg_76_1, arg_76_2)

				local var_76_0 = arg_75_0[arg_75_0.edge2area[arg_76_1 .. "_" .. arg_76_2] or arg_75_0.edge2area.default]

				arg_76_0._tf:SetParent(var_76_0)
			end)
			var_75_6:updateStudent(iter_75_3)

			arg_75_0.academyStudents[iter_75_2] = var_75_6
		end
	end

	if #var_75_0 > 0 then
		arg_75_0.sortTimer = Timer.New(function()
			arg_75_0:sortStudents()
		end, 0.2, -1)

		arg_75_0.sortTimer:Start()
		arg_75_0.sortTimer.func()
	end
end

function var_0_0.ChooseRandomPos(arg_78_0, arg_78_1, arg_78_2)
	local var_78_0 = math.random(1, arg_78_2)

	if not var_78_0 then
		return nil
	end

	pg.Tool.Swap(arg_78_1, var_78_0, arg_78_2)

	return arg_78_1[arg_78_2]
end

function var_0_0.SetTips(arg_79_0)
	arg_79_0:SetPtTip()
	arg_79_0:SetTaskTip()
	arg_79_0:SetFireworkTip()
	arg_79_0:SetSpringTip()
end

function var_0_0.SetPtTip(arg_80_0)
	local var_80_0 = arg_80_0.ptData:CanGetAward()

	setActive(arg_80_0:findTF("tip", arg_80_0.ptBtn), var_80_0)
	setActive(arg_80_0:findTF("tip", arg_80_0.subPtBtn), var_80_0)
end

function var_0_0.SetTaskTip(arg_81_0)
	local var_81_0 = arg_81_0.canGetTaskAward

	setActive(arg_81_0:findTF("tip", arg_81_0.taskBtn), var_81_0)
	setActive(arg_81_0:findTF("tip", arg_81_0.subTaskBtn), var_81_0)
end

function var_0_0.SetFireworkTip(arg_82_0)
	local var_82_0 = #arg_82_0.fireworkUnlockIds ~= #arg_82_0.fireworkGotIds

	setActive(arg_82_0:findTF("tip", arg_82_0.fireworkBtn), var_82_0)
	setActive(arg_82_0:findTF("tip", arg_82_0.subFireworkBtn), var_82_0)
end

function var_0_0.SetSpringTip(arg_83_0)
	local var_83_0 = false

	for iter_83_0 = 1, arg_83_0.springUnlockSlotCount do
		if arg_83_0.springShipIds[iter_83_0] == 0 then
			var_83_0 = true

			break
		end
	end

	setActive(arg_83_0:findTF("tip", arg_83_0.springBtn), var_83_0)
	setActive(arg_83_0:findTF("tip", arg_83_0.subSpringBtn), var_83_0)
end

function var_0_0.willExit(arg_84_0)
	arg_84_0:CloseSubPanel()
	arg_84_0:StopPlayFireworks()
	arg_84_0:clearStudents()
	var_0_0.super.willExit(arg_84_0)
end

function var_0_0.IsShowMainTip(arg_85_0)
	local var_85_0 = ActivityConst.FireworkAndSpring_PT_ID
	local var_85_1 = ActivityConst.FireworkAndSpring_TASK_ID
	local var_85_2 = ActivityConst.FireworkAndSpring_ACT_ID
	local var_85_3 = ActivityConst.FireworkAndSpring_EMO_ID
	local var_85_4 = getProxy(ActivityProxy)
	local var_85_5 = var_85_4:getActivityById(var_85_0)
	local var_85_6 = ActivityPtData.New(var_85_5)
	local var_85_7 = var_85_6:CanGetAward()
	local var_85_8 = var_85_4:getActivityById(var_85_1)
	local var_85_9 = {}
	local var_85_10 = var_85_8:getConfig("config_data")

	for iter_85_0, iter_85_1 in pairs(var_85_10) do
		table.insert(var_85_9, getProxy(TaskProxy):getTaskVO(iter_85_1))
	end

	local var_85_11 = false

	for iter_85_2, iter_85_3 in pairs(var_85_9) do
		if iter_85_3:getTaskStatus() == 1 then
			var_85_11 = true

			break
		end
	end

	local var_85_12 = var_85_4:getActivityById(var_85_2)
	local var_85_13 = var_85_12.data1_list
	local var_85_14 = var_85_12.data2_list
	local var_85_15 = #var_85_13 ~= #var_85_14
	local var_85_16 = var_85_4:getActivityById(var_85_3)
	local var_85_17 = _.map(var_85_16:GetShipIds(), function(arg_86_0)
		if getProxy(BayProxy):RawGetShipById(arg_86_0) then
			return arg_86_0
		else
			return 0
		end
	end)
	local var_85_18 = var_85_16:GetSlotCount()
	local var_85_19 = {}
	local var_85_20 = var_85_16:getConfig("config_client").initialCount

	for iter_85_4, iter_85_5 in ipairs(var_85_16:getConfig("config_client").unlockPt) do
		if iter_85_5 <= var_85_6.count then
			var_85_20 = var_85_20 + 1
		end
	end

	for iter_85_6 = 1, var_85_18 do
		var_85_19[iter_85_6] = var_85_20 < iter_85_6
	end

	local var_85_21 = false

	for iter_85_7 = 1, var_85_20 do
		if var_85_17[iter_85_7] == 0 then
			var_85_21 = true

			break
		end
	end

	return var_85_7 or var_85_11 or var_85_15 or var_85_21
end

return var_0_0
