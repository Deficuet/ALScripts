local var_0_0 = class("NewNavalTacticsLayer", import("...base.BaseUI"))

var_0_0.ON_UNLOCK = "NewNavalTacticsLayer:ON_UNLOCK"
var_0_0.ON_ADD_STUDENT = "NewNavalTacticsLayer:ON_ADD_STUDENT"
var_0_0.ON_SKILL_SELECTED = "NewNavalTacticsLayer:ON_SKILL_SELECTED"
var_0_0.ON_RESEL_SKILL = "NewNavalTacticsLayer:ON_RESEL_SKILL"
var_0_0.ON_LESSON_SELECTED = "NewNavalTacticsLayer:ON_LESSON_SELECTED"
var_0_0.ON_CANCEL_ADD_STUDENT = "NewNavalTacticsLayer:ON_CANCEL_ADD_STUDENT"

function var_0_0.getUIName(arg_1_0)
	return "NewNavalTacticsUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/newnavaltacticsui"
	}

	local function var_2_1(arg_3_0, arg_3_1)
		if noEmptyStr(arg_3_1) and not table.contains(arg_3_0, arg_3_1) then
			table.insert(arg_3_0, arg_3_1)
		end
	end

	local var_2_2 = (function()
		local var_4_0 = {}

		local function var_4_1(arg_5_0)
			for iter_5_0, iter_5_1 in ipairs(arg_5_0:getSkillList() or {}) do
				local var_5_0 = ShipSkill.New(arg_5_0.skills[iter_5_1], arg_5_0.id)

				var_2_1(var_4_0, "skillicon/" .. var_5_0:GetIcon())
			end
		end

		local function var_4_2(arg_6_0)
			local var_6_0 = Item.getConfigData(arg_6_0.id)

			var_2_1(var_4_0, var_6_0.icon)
		end

		local var_4_3 = getProxy(NavalAcademyProxy)
		local var_4_4 = getProxy(BayProxy)

		for iter_4_0, iter_4_1 in pairs(var_4_3:RawGetStudentList() or {}) do
			local var_4_5 = var_4_4:RawGetShipById(iter_4_1.shipId)

			if var_4_5 then
				var_4_1(var_4_5)
				table.insertto(var_4_0, ResPathSupport.GetPaintingShipYardIconListByPaintingName(var_4_5:getPainting()))
				table.insert(var_4_0, string.format(ResPathSupport.ConstPath.BG.ShipCard, var_4_5:rarity2bgPrint()))
			end
		end

		for iter_4_2, iter_4_3 in pairs(var_4_4:getRawData() or {}) do
			var_4_1(iter_4_3)
		end

		for iter_4_4, iter_4_5 in ipairs(getProxy(BagProxy):getItemsByType(Item.LESSON_TYPE) or {}) do
			var_4_2(iter_4_5)
		end

		var_2_1(var_4_0, "template/shipcardtpl")
		var_2_1(var_4_0, "clutter/class_painting")

		return var_4_0
	end)()

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0, arg_2_1), var_2_0, var_2_2)
end

function var_0_0.OnUnlockSlot(arg_7_0)
	if arg_7_0.studentsPage:GetLoaded() then
		arg_7_0.studentsPage:OnUnlockSlot()
	end
end

function var_0_0.OnAddStudent(arg_8_0)
	if arg_8_0.studentsPage:GetLoaded() then
		arg_8_0.studentsPage:OnAddStudent()
	end

	if arg_8_0.selLessonPage:GetLoaded() and arg_8_0.selLessonPage:isShowing() then
		arg_8_0.selLessonPage:Hide()
	end
end

function var_0_0.ResendCancelOp(arg_9_0, arg_9_1)
	arg_9_0.inAddStudentProcess = false

	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		arg_9_0:emit(NewNavalTacticsMediator.ON_CANCEL, iter_9_1[1], iter_9_1[2])
	end
end

function var_0_0.OnExitStudent(arg_10_0)
	if arg_10_0.studentsPage:GetLoaded() then
		arg_10_0.studentsPage:OnExitStudent()
	end
end

function var_0_0.BlockEvents(arg_11_0)
	GetOrAddComponent(arg_11_0._tf, typeof(CanvasGroup)).blocksRaycasts = false
end

function var_0_0.UnblockEvents(arg_12_0)
	GetOrAddComponent(arg_12_0._tf, typeof(CanvasGroup)).blocksRaycasts = true
end

function var_0_0.IsInAddStudentProcess(arg_13_0)
	return arg_13_0.inAddStudentProcess
end

function var_0_0.OnUpdateMetaSkillPanel(arg_14_0, arg_14_1)
	if arg_14_0.metaSkillPage then
		arg_14_0.metaSkillPage:reUpdate()
	end
end

function var_0_0.SetStudents(arg_15_0, arg_15_1)
	arg_15_0.students = arg_15_1
end

function var_0_0.init(arg_16_0)
	arg_16_0.painting = arg_16_0._tf:Find("painting"):GetComponent(typeof(Image))
	arg_16_0.backBtn = arg_16_0._tf:Find("adpter/frame/btnBack")
	arg_16_0.option = arg_16_0._tf:Find("adpter/frame/option")
	arg_16_0.stampBtn = arg_16_0._tf:Find("stamp")
	arg_16_0.quickFinishPanel = arg_16_0._tf:Find("painting/quick_finish")
	arg_16_0.quickFinishText = arg_16_0._tf:Find("painting/quick_finish/Text")

	local var_16_0 = arg_16_0._tf:Find("adpter")

	arg_16_0.studentsPage = NewNavalTacticsStudentsPage.New(var_16_0, arg_16_0.event)
	arg_16_0.unlockPage = NewNavalTacticsUnlockSlotPage.New(arg_16_0._tf, arg_16_0.event)
	arg_16_0.selSkillPage = NewNavalTacticsSelSkillsPage.New(arg_16_0._tf, arg_16_0.event, arg_16_0.contextData)
	arg_16_0.selLessonPage = NewNavalTacticsSelLessonPage.New(arg_16_0._tf, arg_16_0.event)
	arg_16_0.finishLessonUtil = NewNavalTacticsFinishLessonUtil.New(arg_16_0.studentsPage, arg_16_0.selLessonPage, arg_16_0.selSkillPage)
end

function var_0_0.didEnter(arg_17_0)
	arg_17_0:bind(var_0_0.ON_UNLOCK, function(arg_18_0, arg_18_1)
		arg_17_0.unlockPage:ExecuteAction("Show", arg_18_1, function()
			arg_17_0:emit(NewNavalTacticsMediator.ON_SHOPPING, arg_18_1)
		end)
	end)
	arg_17_0:bind(var_0_0.ON_ADD_STUDENT, function(arg_20_0, arg_20_1)
		if not getProxy(BagProxy):ExitTypeItems(Item.LESSON_TYPE) then
			if not ItemTipPanel.ShowItemTipbyID(16001, i18n("item_lack_title", i18n("ship_book"), i18n("ship_book"))) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_no_lesson"))
			end

			return
		end

		arg_17_0:emit(NewNavalTacticsMediator.ON_SELECT_SHIP, arg_20_1)
	end)
	arg_17_0:bind(var_0_0.ON_SKILL_SELECTED, function(arg_21_0, arg_21_1)
		arg_17_0.selLessonPage:ExecuteAction("Show", arg_21_1)
		arg_17_0.selSkillPage:Hide()
	end)
	arg_17_0:bind(var_0_0.ON_RESEL_SKILL, function(arg_22_0, arg_22_1)
		arg_17_0.selLessonPage:Hide()
		arg_17_0.selSkillPage:Show(arg_22_1)
	end)
	arg_17_0:bind(var_0_0.ON_LESSON_SELECTED, function(arg_23_0, arg_23_1)
		arg_17_0:AddStudentFinish(arg_23_1)
	end)
	setActive(arg_17_0.stampBtn, getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(arg_17_0.stampBtn, false)
	end

	onButton(arg_17_0, arg_17_0.stampBtn, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(3)
	end, SFX_CONFIRM)
	onButton(arg_17_0, arg_17_0.backBtn, function()
		arg_17_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0.option, function()
		arg_17_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	arg_17_0:SetPainting()
	arg_17_0:Init()
	arg_17_0:OnUpdateQuickFinishPanel()
	arg_17_0.studentsPage:ExecuteAction("Show", arg_17_0.students)
end

function var_0_0.Init(arg_27_0)
	if arg_27_0.contextData.shipToLesson then
		arg_27_0.inAddStudentProcess = true

		local var_27_0 = arg_27_0.contextData.shipToLesson.skillIndex
		local var_27_1 = arg_27_0.contextData.shipToLesson.shipId
		local var_27_2 = arg_27_0.contextData.shipToLesson.index

		arg_27_0:AddStudent(var_27_1, var_27_2, var_27_0)

		arg_27_0.contextData.shipToLesson = nil
	elseif arg_27_0.contextData.metaShipID then
		arg_27_0.inAddStudentProcess = true

		local var_27_3 = arg_27_0.contextData.metaShipID

		arg_27_0:ShowMetaShipSkill(var_27_3)

		arg_27_0.contextData.metaShipID = nil
	end
end

function var_0_0.OnUpdateQuickFinishPanel(arg_28_0)
	local var_28_0 = getProxy(NavalAcademyProxy):getDailyFinishCnt()

	setActive(arg_28_0.quickFinishPanel, var_28_0 > 0)
	setText(arg_28_0.quickFinishText, i18n("skill_learn_tip", var_28_0))
end

function var_0_0.SetPainting(arg_29_0)
	ResourceMgr.Inst:getAssetAsync("Clutter/class_painting", "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_30_0)
		arg_29_0.painting.sprite = arg_30_0

		arg_29_0.painting:SetNativeSize()
	end), true, true)
end

function var_0_0.ShowMetaShipSkill(arg_31_0, arg_31_1)
	arg_31_0.metaSkillPage = NavalTacticsMetaSkillsView.New(arg_31_0._tf, arg_31_0.event)

	arg_31_0.metaSkillPage:Reset()
	arg_31_0.metaSkillPage:Load()
	arg_31_0.metaSkillPage:setData(arg_31_1, function()
		arg_31_0.inAddStudentProcess = false

		arg_31_0.metaSkillPage:Destroy()

		arg_31_0.metaSkillPage = nil
	end)
end

function var_0_0.AddStudent(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = Student.New({
		id = arg_33_2,
		ship_id = arg_33_1
	})

	arg_33_0.selSkillPage:ExecuteAction("Show", var_33_0, arg_33_3)
end

function var_0_0.AddStudentFinish(arg_34_0, arg_34_1)
	local var_34_0 = getProxy(BayProxy):RawGetShipById(arg_34_1.shipId)

	if var_34_0:isActivityNpc() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("npc_learn_skill_tip"),
			onYes = function()
				arg_34_0:StartLesson(arg_34_1, var_34_0)
			end
		})
	else
		arg_34_0:StartLesson(arg_34_1, var_34_0)
	end
end

function var_0_0.StartLesson(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = Item.getConfigData(arg_36_1.lessonId).name
	local var_36_1 = arg_36_1:getSkillId(arg_36_2)
	local var_36_2 = arg_36_2:getName()
	local var_36_3 = ShipSkill.New(arg_36_2.skills[var_36_1], arg_36_2.id)
	local var_36_4 = var_36_3:GetName()

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("tactics_lesson_start_tip", var_36_0, var_36_2, var_36_4),
		onYes = function()
			if var_36_3:IsMaxLevel() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_max_level"))

				return
			end

			arg_36_0:emit(NewNavalTacticsMediator.ON_START, {
				shipId = arg_36_1.shipId,
				skillPos = arg_36_1:getSkillId(arg_36_2),
				lessonId = arg_36_1.lessonId,
				roomId = arg_36_1.id
			})
		end
	})
end

function var_0_0.onBackPressed(arg_38_0)
	if arg_38_0.finishLessonUtil:IsWorking() then
		return
	end

	var_0_0.super.onBackPressed(arg_38_0)
end

function var_0_0.willExit(arg_39_0)
	if arg_39_0.studentsPage then
		arg_39_0.studentsPage:Destroy()

		arg_39_0.studentsPage = nil
	end

	if arg_39_0.unlockPage then
		arg_39_0.unlockPage:Destroy()

		arg_39_0.unlockPage = nil
	end

	if arg_39_0.selSkillPage then
		arg_39_0.selSkillPage:Destroy()

		arg_39_0.selSkillPage = nil
	end

	if arg_39_0.selLessonPage then
		arg_39_0.selLessonPage:Destroy()

		arg_39_0.selLessonPage = nil
	end

	if arg_39_0.finishLessonUtil then
		arg_39_0.finishLessonUtil:Dispose()

		arg_39_0.finishLessonUtil = nil
	end

	if arg_39_0.metaSkillPage then
		arg_39_0.metaSkillPage:Destroy()

		arg_39_0.metaSkillPage = nil
	end
end

return var_0_0
