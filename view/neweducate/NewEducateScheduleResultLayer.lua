local var_0_0 = class("NewEducateScheduleResultLayer", import("view.newEducate.base.NewEducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateScheduleResultUI"
end

function var_0_0.SetData(arg_2_0)
	arg_2_0.attrIds = arg_2_0.contextData.char:GetAttrIds()
	arg_2_0.moneyResId = arg_2_0.contextData.char:GetResIdByType(NewEducateChar.RES_TYPE.MONEY)
	arg_2_0.moodResId = arg_2_0.contextData.char:GetResIdByType(NewEducateChar.RES_TYPE.MOOD)
	arg_2_0.resIds = {
		arg_2_0.moneyResId,
		arg_2_0.moodResId
	}
	arg_2_0.unlockPlanNum = arg_2_0.contextData.char:GetRoundData():getConfig("plan_num")
	arg_2_0.planIds = arg_2_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.PLAN):GetPlans()
end

function var_0_0.init(arg_3_0)
	arg_3_0.rootTF = arg_3_0._tf:Find("root")
	arg_3_0.anim = arg_3_0.rootTF:GetComponent(typeof(Animation))
	arg_3_0.animEvent = arg_3_0.rootTF:GetComponent(typeof(DftAniEvent))
	arg_3_0.inAnimPlaying = false

	arg_3_0.animEvent:SetEndEvent(function()
		arg_3_0.inAnimPlaying = false

		arg_3_0.animEvent:SetEndEvent(function()
			arg_3_0:emit(var_0_0.ON_CLOSE)
		end)
	end)

	arg_3_0.plansTF = arg_3_0.rootTF:Find("window/plans/content")
	arg_3_0.planUIList = UIItemList.New(arg_3_0.plansTF, arg_3_0.plansTF:Find("tpl"))
	arg_3_0.attrsTF = arg_3_0.rootTF:Find("window/attr")
	arg_3_0.attrUIList = UIItemList.New(arg_3_0.attrsTF, arg_3_0.attrsTF:Find("tpl"))
	arg_3_0.resTF = arg_3_0.rootTF:Find("window/res/content")
	arg_3_0.resUIList = UIItemList.New(arg_3_0.resTF, arg_3_0.resTF:Find("tpl"))

	setText(arg_3_0.rootTF:Find("window/tip"), i18n("child_close_tip"))

	arg_3_0.effectTF = arg_3_0.rootTF:Find("window/effect")

	arg_3_0:BlurPanel(arg_3_0._tf, {
		groupDelta = 1
	})
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:SetData()
	onButton(arg_6_0, arg_6_0._tf, function()
		arg_6_0:closeView()
	end, SFX_CANCEL)

	arg_6_0.result = {}
	arg_6_0.benefit = {}

	underscore.each(arg_6_0.contextData.drops, function(arg_8_0)
		if not arg_6_0.result[arg_8_0.id] then
			arg_6_0.result[arg_8_0.id] = 0
		end

		arg_6_0.result[arg_8_0.id] = arg_6_0.result[arg_8_0.id] + arg_8_0.number

		if arg_8_0.isBenefit then
			if not arg_6_0.benefit[arg_8_0.id] then
				arg_6_0.benefit[arg_8_0.id] = 0
			end

			arg_6_0.benefit[arg_8_0.id] = arg_6_0.benefit[arg_8_0.id] + arg_8_0.number
		end
	end)

	local var_6_0 = arg_6_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.PLAN)

	arg_6_0.oldRes = var_6_0:GetResources() or {}
	arg_6_0.oldAttrs = var_6_0:GetAttrs() or {}

	local var_6_1 = arg_6_0.contextData.char:GetMoodStage()

	setText(arg_6_0.effectTF, string.gsub("$1", "$1", i18n("child2_mood_desc" .. var_6_1)))
	arg_6_0.attrUIList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateAttr(arg_9_1, arg_9_2)
		end
	end)
	arg_6_0.attrUIList:align(#arg_6_0.attrIds)
	arg_6_0.resUIList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateRes(arg_10_1, arg_10_2)
		end
	end)
	arg_6_0.resUIList:align(#arg_6_0.resIds)
	arg_6_0.planUIList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_6_0:UpdatePlan(arg_11_1, arg_11_2)
		end
	end)
	arg_6_0.planUIList:align(arg_6_0.unlockPlanNum)
end

function var_0_0.UpdateAttr(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.attrIds[arg_12_1 + 1]
	local var_12_1 = pg.child2_attr[var_12_0]

	LoadImageSpriteAsync("neweducateicon/" .. var_12_1.icon, arg_12_2:Find("icon_bg/icon"))
	setScrollText(arg_12_2:Find("name_mask/name"), var_12_1.name)

	local var_12_2 = arg_12_0.attrIds[arg_12_1 + 1]
	local var_12_3 = arg_12_0.contextData.char:GetAttr(var_12_2)
	local var_12_4, var_12_5 = NewEducateInfoPanel.GetArrtInfo(pg.child2_attr[var_12_2].rank, var_12_3)

	setText(arg_12_2:Find("rank/Text"), var_12_4)
	setText(arg_12_2:Find("value_new"), var_12_3)

	local var_12_6 = EducateConst.GRADE_2_COLOR[var_12_4][1]
	local var_12_7 = EducateConst.GRADE_2_COLOR[var_12_4][2]

	setImageColor(arg_12_2:Find("gradient"), Color.NewHex(var_12_6))
	setImageColor(arg_12_2:Find("rank"), Color.NewHex(var_12_7))

	local var_12_8 = arg_12_0.oldAttrs[var_12_2] or var_12_3
	local var_12_9 = var_12_3 - var_12_8
	local var_12_10 = var_12_9 > 0 and "16CF99" or "FF6767"

	if var_12_9 == 0 then
		var_12_10 = "393A3C"
	end

	setText(arg_12_2:Find("value_old"), math.max(var_12_8, 0))
	setImageColor(arg_12_2:Find("arrow"), Color.NewHex(var_12_10))
	setTextColor(arg_12_2:Find("value_new"), Color.NewHex(var_12_10))
	setActive(arg_12_2:Find("VX"), var_12_8 ~= var_12_3)
end

function var_0_0.UpdateRes(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.resIds[arg_13_1 + 1]

	LoadImageSpriteAsync("neweducateicon/" .. pg.child2_resource[var_13_0].icon, arg_13_2:Find("icon"))
	setText(arg_13_2:Find("name"), pg.child2_resource[var_13_0].name)

	local var_13_1 = arg_13_0.contextData.char:GetRes(var_13_0)
	local var_13_2 = arg_13_0.oldRes[var_13_0] or var_13_1
	local var_13_3 = var_13_1 - var_13_2
	local var_13_4 = var_13_3 > 0 and "16CF99" or "FF6767"

	if var_13_3 == 0 then
		var_13_4 = "393A3C"
	end

	setText(arg_13_2:Find("value_old"), math.max(var_13_2, 0))
	setText(arg_13_2:Find("value_new"), var_13_1)
	setImageColor(arg_13_2:Find("arrow"), Color.NewHex(var_13_4))
	setTextColor(arg_13_2:Find("value_new"), Color.NewHex(var_13_4))
end

function var_0_0.UpdatePlan(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.planIds[arg_14_1 + 1]

	setActive(arg_14_2:Find("bg/icon"), var_14_0)
	setActive(arg_14_2:Find("bg/empty"), not var_14_0)

	if var_14_0 then
		local var_14_1 = "plan_type" .. pg.child2_plan[var_14_0].replace_type_show

		LoadImageSpriteAtlasAsync("ui/neweducatecommonui_atlas", var_14_1, arg_14_2:Find("bg/icon"))
	end

	setActive(arg_14_2:Find("dot"), arg_14_1 + 1 ~= arg_14_0.unlockPlanNum)
end

function var_0_0._close(arg_15_0)
	if arg_15_0.inAnimPlaying then
		return
	end

	arg_15_0.anim:Play("anim_educate_result_out")

	arg_15_0.inAnimPlaying = true
end

function var_0_0.onBackPressed(arg_16_0)
	arg_16_0:_close()
end

function var_0_0.willExit(arg_17_0)
	arg_17_0:UnOverlayPanel(arg_17_0._tf)
	existCall(arg_17_0.contextData.onExit)
end

return var_0_0
