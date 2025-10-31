local var_0_0 = class("ClassLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ClassUI"
end

function var_0_0.SetStudents(arg_2_0, arg_2_1)
	arg_2_0.shipGroups = arg_2_1
end

function var_0_0.SetCourse(arg_3_0, arg_3_1)
	arg_3_0.course = arg_3_1
end

function var_0_0.SetClass(arg_4_0, arg_4_1)
	arg_4_0.resClass = arg_4_1
end

function var_0_0.OnUpdateResField(arg_5_0, arg_5_1)
	if not isa(arg_5_1, ClassResourceField) then
		return
	end

	arg_5_0:SetClass(arg_5_1)
	arg_5_0:InitClassInfo()

	if arg_5_0.resFieldPage:GetLoaded() and arg_5_0.resFieldPage:isShowing() then
		arg_5_0.resFieldPage:Update(arg_5_1)
	end
end

function var_0_0.init(arg_6_0)
	arg_6_0.backBtn = arg_6_0._tf:Find("blur_panel/adapt/top/back")
	arg_6_0.lessonTxt = arg_6_0._tf:Find("blur_panel/adapt/bottom/lesson/mask/Text"):GetComponent("ScrollText")
	arg_6_0.tranSpeedTxt = arg_6_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/value"):GetComponent(typeof(Text))
	arg_6_0.proficiencyProgressTxt = arg_6_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/Text"):GetComponent(typeof(Text))
	arg_6_0.proficiencyProgress = arg_6_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/slider/Image")
	arg_6_0.tranProgressTxt = arg_6_0._tf:Find("blur_panel/adapt/bottom/progress/book/Text/value"):GetComponent(typeof(Text))
	arg_6_0.tranProgress = arg_6_0._tf:Find("blur_panel/adapt/bottom/progress/book/slider/Image")
	arg_6_0.exp2ProficiencyRatioTxt = arg_6_0._tf:Find("blur_panel/adapt/top/proficiency/Text"):GetComponent(typeof(Text))
	arg_6_0.exp2ProficiencyRatio = arg_6_0._tf:Find("blur_panel/adapt/top/proficiency")
	arg_6_0.chatProficiency = arg_6_0._tf:Find("blur_panel/adapt/top/proficiency/chat")
	arg_6_0.chatProficiencyTxt = arg_6_0.chatProficiency:Find("Text"):GetComponent(typeof(Text))
	arg_6_0.helpBtn = arg_6_0._tf:Find("blur_panel/adapt/top/btn_help")
	arg_6_0.upgradeBtn = arg_6_0._tf:Find("blur_panel/adapt/bottom/upgarde")
	arg_6_0.teacherSeat = arg_6_0._tf:Find("scene/desk0")
	arg_6_0.studentSeats = {
		arg_6_0._tf:Find("scene/desk1"),
		arg_6_0._tf:Find("scene/desk2"),
		arg_6_0._tf:Find("scene/desk3"),
		arg_6_0._tf:Find("scene/desk4"),
		arg_6_0._tf:Find("scene/desk5")
	}

	setText(arg_6_0._tf:Find("blur_panel/adapt/bottom/progress/book/Text/label"), i18n("class_label_gen"))
	setText(arg_6_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/label"), i18n("class_label_tran"))
	setText(arg_6_0._tf:Find("blur_panel/adapt/bottom/upgarde/Text"), i18n("word_levelup"))

	arg_6_0.chars = {}
	arg_6_0.resFieldPage = ClassResourcePage.New(arg_6_0._tf, arg_6_0.event)
end

function var_0_0.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:emit(BaseUI.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("course_class_help")
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.upgradeBtn, function()
		arg_7_0.resFieldPage:ExecuteAction("Flush", arg_7_0.resClass)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.exp2ProficiencyRatio, function()
		arg_7_0.chatProficiencyTxt.text = i18n("course_proficiency_tip", pg.gameset.level_get_proficency.key_value, arg_7_0.resClass:GetExp2ProficiencyRatio() * arg_7_0.course:getExtraRate())

		arg_7_0:DisplayChatContent()
	end, SFX_PANEL)

	arg_7_0.students = arg_7_0:FilterStudents()

	arg_7_0:InitClassInfo()
	arg_7_0:LoadClassRoom()
end

function var_0_0.DisplayChatContent(arg_12_0)
	setActive(arg_12_0.chatProficiency, true)
	setButtonEnabled(arg_12_0.exp2ProficiencyRatio, false)
	LeanTween.scale(rtf(arg_12_0.chatProficiency), Vector3(1.5, 1.5, 1), 0.3):setFrom(Vector3.zero):setOnComplete(System.Action(function()
		LeanTween.scale(rtf(arg_12_0.chatProficiency), Vector3(0, 0, 0), 0.2):setDelay(2):setOnComplete(System.Action(function()
			if not IsNil(arg_12_0.exp2ProficiencyRatio) then
				setButtonEnabled(arg_12_0.exp2ProficiencyRatio, true)
				setActive(arg_12_0.chatProficiency, false)
			end
		end))
	end))
end

function var_0_0.FilterStudents(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = arg_15_0.course:getConfig("type")

	for iter_15_0, iter_15_1 in pairs(arg_15_0.shipGroups) do
		if table.contains(var_15_1, iter_15_1.shipConfig.type) then
			table.insert(var_15_0, iter_15_1)
		end
	end

	if #var_15_0 > #arg_15_0.studentSeats then
		shuffle(var_15_0)
	end

	return var_15_0
end

function var_0_0.InitClassInfo(arg_16_0)
	local var_16_0 = arg_16_0.resClass
	local var_16_1 = arg_16_0.course

	arg_16_0.lessonTxt:SetText(i18n("course_class_name", var_16_1:getConfig("name_show")))

	arg_16_0.tranSpeedTxt.text = "-" .. var_16_0:GetTranValuePreHour() .. "/h"

	local var_16_2 = var_16_1:GetProficiency()
	local var_16_3 = var_16_0:GetMaxProficiency()

	arg_16_0.proficiencyProgressTxt.text = var_16_2 .. "/" .. var_16_3

	setFillAmount(arg_16_0.proficiencyProgress, var_16_2 / var_16_3)

	local var_16_4 = var_16_0:GetPlayerRes()
	local var_16_5 = var_16_0:GetTarget()
	local var_16_6 = var_16_4 % var_16_5

	arg_16_0.tranProgressTxt.text = " <color=#92FC63FF>" .. var_16_6 .. "</color>/" .. var_16_5

	setFillAmount(arg_16_0.tranProgress, var_16_6 / var_16_5)

	local var_16_7 = var_16_0:GetExp2ProficiencyRatio() * var_16_1:getExtraRate()

	arg_16_0.exp2ProficiencyRatioTxt.text = var_16_7 .. "%"
end

function var_0_0.LoadClassRoom(arg_17_0)
	local var_17_0 = {}

	for iter_17_0 = 1, math.min(#arg_17_0.students, #arg_17_0.studentSeats) do
		table.insert(var_17_0, function(arg_18_0)
			local var_18_0 = arg_17_0.students[iter_17_0]:GetSkin().prefab

			arg_17_0:LoadChar(var_18_0, function(arg_19_0)
				arg_17_0:AddStudent(arg_19_0, arg_17_0.studentSeats[iter_17_0])
				arg_18_0()
			end)
		end)
	end

	table.insert(var_17_0, function(arg_20_0)
		local var_20_0 = Ship.New({
			configId = arg_17_0.course:getConfig("id")
		})

		arg_17_0:LoadChar(var_20_0:getPrefab(), function(arg_21_0)
			arg_17_0:AddTeacher(arg_21_0, arg_17_0.teacherSeat)
			arg_20_0()
		end)
	end)
	pg.UIMgr.GetInstance():LoadingOn()
	seriesAsync(var_17_0, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.AddStudent(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_1.transform

	var_23_0.localScale = Vector3(-0.9, 0.9, 1)
	var_23_0.localPosition = Vector3(37, 62, 0)

	setParent(var_23_0, arg_23_2)
	setActive(arg_23_2:Find("icon"), true)
	arg_23_1:GetComponent("SpineAnimUI"):SetAction("sit", 0)
	var_23_0:SetSiblingIndex(0)
end

function var_0_0.AddTeacher(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_1.transform

	var_24_0.localScale = Vector3(0.9, 0.9, 1)
	var_24_0.localPosition = Vector3(0, 0, 0)

	setParent(var_24_0, arg_24_2)
	arg_24_1:GetComponent("SpineAnimUI"):SetAction("stand2", 0)
end

function var_0_0.willExit(arg_25_0)
	arg_25_0:ClearChars()
	arg_25_0.resFieldPage:Destroy()

	arg_25_0.resFieldPage = nil
end

function var_0_0.LoadChar(arg_26_0, arg_26_1, arg_26_2)
	PoolMgr.GetInstance():GetSpineChar(arg_26_1, true, function(arg_27_0)
		if arg_26_0.exited then
			PoolMgr.GetInstance():ReturnSpineChar(arg_26_1, arg_27_0)

			return
		end

		pg.ViewUtils.SetLayer(arg_27_0.transform, Layer.UI)

		arg_26_0.chars[arg_26_1] = arg_27_0

		arg_26_2(arg_27_0)
	end)
end

function var_0_0.ClearChars(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.chars) do
		PoolMgr.GetInstance():ReturnSpineChar(iter_28_0, iter_28_1)
	end

	arg_28_0.chars = {}
end

function var_0_0.onBackPressed(arg_29_0)
	if arg_29_0.resFieldPage and arg_29_0.resFieldPage:GetLoaded() and arg_29_0.resFieldPage:isShowing() then
		arg_29_0.resFieldPage:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_29_0)
end

return var_0_0
