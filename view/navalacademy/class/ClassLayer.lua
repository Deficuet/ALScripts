local var_0_0 = class("ClassLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ClassUI"
end

function var_0_0.getResource(arg_2_0)
	return {
		"ui/classui"
	}
end

function var_0_0.SetStudents(arg_3_0, arg_3_1)
	arg_3_0.shipGroups = arg_3_1
end

function var_0_0.SetCourse(arg_4_0, arg_4_1)
	arg_4_0.course = arg_4_1
end

function var_0_0.SetClass(arg_5_0, arg_5_1)
	arg_5_0.resClass = arg_5_1
end

function var_0_0.OnUpdateResField(arg_6_0, arg_6_1)
	if not isa(arg_6_1, ClassResourceField) then
		return
	end

	arg_6_0:SetClass(arg_6_1)
	arg_6_0:InitClassInfo()

	if arg_6_0.resFieldPage:GetLoaded() and arg_6_0.resFieldPage:isShowing() then
		arg_6_0.resFieldPage:Update(arg_6_1)
	end
end

function var_0_0.init(arg_7_0)
	arg_7_0.backBtn = arg_7_0._tf:Find("blur_panel/adapt/top/back")
	arg_7_0.lessonTxt = arg_7_0._tf:Find("blur_panel/adapt/bottom/lesson/mask/Text"):GetComponent("ScrollText")
	arg_7_0.tranSpeedTxt = arg_7_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/value"):GetComponent(typeof(Text))
	arg_7_0.proficiencyProgressTxt = arg_7_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/Text"):GetComponent(typeof(Text))
	arg_7_0.proficiencyProgress = arg_7_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/slider/Image")
	arg_7_0.tranProgressTxt = arg_7_0._tf:Find("blur_panel/adapt/bottom/progress/book/Text/value"):GetComponent(typeof(Text))
	arg_7_0.tranProgress = arg_7_0._tf:Find("blur_panel/adapt/bottom/progress/book/slider/Image")
	arg_7_0.exp2ProficiencyRatioTxt = arg_7_0._tf:Find("blur_panel/adapt/top/proficiency/Text"):GetComponent(typeof(Text))
	arg_7_0.exp2ProficiencyRatio = arg_7_0._tf:Find("blur_panel/adapt/top/proficiency")
	arg_7_0.chatProficiency = arg_7_0._tf:Find("blur_panel/adapt/top/proficiency/chat")
	arg_7_0.chatProficiencyTxt = arg_7_0.chatProficiency:Find("Text"):GetComponent(typeof(Text))
	arg_7_0.helpBtn = arg_7_0._tf:Find("blur_panel/adapt/top/btn_help")
	arg_7_0.upgradeBtn = arg_7_0._tf:Find("blur_panel/adapt/bottom/upgarde")
	arg_7_0.teacherSeat = arg_7_0._tf:Find("scene/desk0")
	arg_7_0.studentSeats = {
		arg_7_0._tf:Find("scene/desk1"),
		arg_7_0._tf:Find("scene/desk2"),
		arg_7_0._tf:Find("scene/desk3"),
		arg_7_0._tf:Find("scene/desk4"),
		arg_7_0._tf:Find("scene/desk5")
	}

	setText(arg_7_0._tf:Find("blur_panel/adapt/bottom/progress/book/Text/label"), i18n("class_label_gen"))
	setText(arg_7_0._tf:Find("blur_panel/adapt/bottom/progress/proficiency/label"), i18n("class_label_tran"))
	setText(arg_7_0._tf:Find("blur_panel/adapt/bottom/upgarde/Text"), i18n("word_levelup"))

	arg_7_0.chars = {}
	arg_7_0.resFieldPage = ClassResourcePage.New(arg_7_0._tf, arg_7_0.event)
end

function var_0_0.didEnter(arg_8_0)
	onButton(arg_8_0, arg_8_0.backBtn, function()
		arg_8_0:emit(BaseUI.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("course_class_help")
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.upgradeBtn, function()
		arg_8_0.resFieldPage:ExecuteAction("Flush", arg_8_0.resClass)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.exp2ProficiencyRatio, function()
		arg_8_0.chatProficiencyTxt.text = i18n("course_proficiency_tip", pg.gameset.level_get_proficency.key_value, arg_8_0.resClass:GetExp2ProficiencyRatio() * arg_8_0.course:getExtraRate())

		arg_8_0:DisplayChatContent()
	end, SFX_PANEL)

	arg_8_0.students = arg_8_0:FilterStudents()

	arg_8_0:InitClassInfo()
	arg_8_0:DownloadClassRoomResList(function()
		arg_8_0:LoadClassRoom()
	end)
end

function var_0_0.DisplayChatContent(arg_14_0)
	setActive(arg_14_0.chatProficiency, true)
	setButtonEnabled(arg_14_0.exp2ProficiencyRatio, false)
	LeanTween.scale(rtf(arg_14_0.chatProficiency), Vector3(1.5, 1.5, 1), 0.3):setFrom(Vector3.zero):setOnComplete(System.Action(function()
		LeanTween.scale(rtf(arg_14_0.chatProficiency), Vector3(0, 0, 0), 0.2):setDelay(2):setOnComplete(System.Action(function()
			if not IsNil(arg_14_0.exp2ProficiencyRatio) then
				setButtonEnabled(arg_14_0.exp2ProficiencyRatio, true)
				setActive(arg_14_0.chatProficiency, false)
			end
		end))
	end))
end

function var_0_0.FilterStudents(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = arg_17_0.course:getConfig("type")

	for iter_17_0, iter_17_1 in pairs(arg_17_0.shipGroups) do
		if table.contains(var_17_1, iter_17_1.shipConfig.type) then
			table.insert(var_17_0, iter_17_1)
		end
	end

	if #var_17_0 > #arg_17_0.studentSeats then
		shuffle(var_17_0)
	end

	return var_17_0
end

function var_0_0.GetClassRoomResList(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = arg_18_0.students or {}

	for iter_18_0 = 1, math.min(#var_18_1, #arg_18_0.studentSeats) do
		local var_18_2 = var_18_1[iter_18_0]:GetSkin()

		if var_18_2 then
			arg_18_0:InsertClassRoomCharRes(var_18_0, var_18_2.prefab)
		end
	end

	if arg_18_0.course then
		local var_18_3 = Ship.New({
			configId = arg_18_0.course:getConfig("id")
		})

		arg_18_0:InsertClassRoomCharRes(var_18_0, var_18_3:getPrefab())
	end

	return var_18_0
end

function var_0_0.InsertClassRoomCharRes(arg_19_0, arg_19_1, arg_19_2)
	if not arg_19_2 or arg_19_2 == "" then
		return
	end

	local var_19_0 = {
		"char/" .. arg_19_2,
		"char/" .. arg_19_2 .. "_hx"
	}

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		iter_19_1 = string.lower(iter_19_1)

		if not table.contains(arg_19_1, iter_19_1) then
			table.insert(arg_19_1, iter_19_1)
		end
	end
end

function var_0_0.DownloadClassRoomResList(arg_20_0, arg_20_1)
	SplitPackConst.DownloadByLuaArr(arg_20_0:GetClassRoomResList(), function()
		if arg_20_0.exited then
			return
		end

		arg_20_1()
	end)
end

function var_0_0.InitClassInfo(arg_22_0)
	local var_22_0 = arg_22_0.resClass
	local var_22_1 = arg_22_0.course

	arg_22_0.lessonTxt:SetText(i18n("course_class_name", var_22_1:getConfig("name_show")))

	arg_22_0.tranSpeedTxt.text = "-" .. var_22_0:GetTranValuePreHour() .. "/h"

	local var_22_2 = var_22_1:GetProficiency()
	local var_22_3 = var_22_0:GetMaxProficiency()

	arg_22_0.proficiencyProgressTxt.text = var_22_2 .. "/" .. var_22_3

	setFillAmount(arg_22_0.proficiencyProgress, var_22_2 / var_22_3)

	local var_22_4 = var_22_0:GetPlayerRes()
	local var_22_5 = var_22_0:GetTarget()
	local var_22_6 = var_22_4 % var_22_5

	arg_22_0.tranProgressTxt.text = " <color=#92FC63FF>" .. var_22_6 .. "</color>/" .. var_22_5

	setFillAmount(arg_22_0.tranProgress, var_22_6 / var_22_5)

	local var_22_7 = var_22_0:GetExp2ProficiencyRatio() * var_22_1:getExtraRate()

	arg_22_0.exp2ProficiencyRatioTxt.text = var_22_7 .. "%"
end

function var_0_0.LoadClassRoom(arg_23_0)
	local var_23_0 = {}

	for iter_23_0 = 1, math.min(#arg_23_0.students, #arg_23_0.studentSeats) do
		table.insert(var_23_0, function(arg_24_0)
			local var_24_0 = arg_23_0.students[iter_23_0]:GetSkin().prefab

			arg_23_0:LoadChar(var_24_0, function(arg_25_0)
				arg_23_0:AddStudent(arg_25_0, arg_23_0.studentSeats[iter_23_0])
				arg_24_0()
			end)
		end)
	end

	table.insert(var_23_0, function(arg_26_0)
		local var_26_0 = Ship.New({
			configId = arg_23_0.course:getConfig("id")
		})

		arg_23_0:LoadChar(var_26_0:getPrefab(), function(arg_27_0)
			arg_23_0:AddTeacher(arg_27_0, arg_23_0.teacherSeat)
			arg_26_0()
		end)
	end)
	pg.UIMgr.GetInstance():LoadingOn()
	seriesAsync(var_23_0, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.AddStudent(arg_29_0, arg_29_1, arg_29_2)
	arg_29_1:SetLocalScale(Vector3(-0.9, 0.9, 1))
	arg_29_1:SetLocalPosition(Vector3(37, 62, 0))
	arg_29_1:SetParent(arg_29_2)
	setActive(arg_29_2:Find("icon"), true)
	arg_29_1:SetAction("sit", 0)
	arg_29_1:SetSiblingIndex(0)
end

function var_0_0.AddTeacher(arg_30_0, arg_30_1, arg_30_2)
	arg_30_1:SetLocalScale(Vector3(0.9, 0.9, 1))
	arg_30_1:SetLocalPosition(Vector3(0, 0, 0))
	arg_30_1:SetParent(arg_30_2)
	arg_30_1:SetAction("stand2", 0)
end

function var_0_0.willExit(arg_31_0)
	arg_31_0:ClearChars()
	arg_31_0.resFieldPage:Destroy()

	arg_31_0.resFieldPage = nil
end

function var_0_0.LoadChar(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = SpineAnimChar.New()

	var_32_0:SetPaint(arg_32_1)
	var_32_0:Load(true, function(arg_33_0)
		if arg_32_0.exited then
			arg_33_0:Dispose()

			return
		end

		arg_33_0:SetLayer(Layer.UI)

		arg_32_0.chars[arg_32_1] = arg_33_0

		arg_32_2(arg_33_0)
	end)
end

function var_0_0.ClearChars(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.chars) do
		iter_34_1:Dispose()
	end

	arg_34_0.chars = {}
end

function var_0_0.onBackPressed(arg_35_0)
	if arg_35_0.resFieldPage and arg_35_0.resFieldPage:GetLoaded() and arg_35_0.resFieldPage:isShowing() then
		arg_35_0.resFieldPage:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_35_0)
end

return var_0_0
