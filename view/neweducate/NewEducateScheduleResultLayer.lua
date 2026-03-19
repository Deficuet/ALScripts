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
	arg_2_0.planIds = arg_2_0.contextData.char:GetFSM():GetState(NewEducateFSM.SYSTEM.PLAN):GetPlans()
end

function var_0_0.init(arg_3_0)
	arg_3_0.rootTF = arg_3_0._tf:Find("root")
	arg_3_0.anim = arg_3_0.rootTF:GetComponent(typeof(Animation))
	arg_3_0.animEvent = arg_3_0.rootTF:GetComponent(typeof(DftAniEvent))

	arg_3_0.animEvent:SetEndEvent(function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_3_0.plansTF = arg_3_0.rootTF:Find("window/plans/content")
	arg_3_0.planUIList = UIItemList.New(arg_3_0.plansTF, arg_3_0.plansTF:Find("tpl"))
	arg_3_0.attrsTF = arg_3_0.rootTF:Find("window/attr")
	arg_3_0.attrUIList = UIItemList.New(arg_3_0.attrsTF, arg_3_0.attrsTF:Find("tpl"))
	arg_3_0.resTF = arg_3_0.rootTF:Find("window/res/content")
	arg_3_0.resUIList = UIItemList.New(arg_3_0.resTF, arg_3_0.resTF:Find("tpl"))

	setText(arg_3_0.rootTF:Find("window/tip"), i18n("child_close_tip"))

	arg_3_0.moodTF = arg_3_0.rootTF:Find("window/benefit/mood")
	arg_3_0.moodStageTF = arg_3_0.moodTF:Find("left/Text")
	arg_3_0.moodEffectTF = arg_3_0.moodTF:Find("right/value")

	setText(arg_3_0.moodTF:Find("right/Text"), i18n("child2_mood_benefit"))
	arg_3_0:BlurPanel(arg_3_0._tf, {
		groupDelta = 1
	})
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:SetData()
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:_close()
	end, SFX_CANCEL)

	arg_5_0.result = {}
	arg_5_0.benefit = {}

	underscore.each(arg_5_0.contextData.drops, function(arg_7_0)
		if not arg_5_0.result[arg_7_0.id] then
			arg_5_0.result[arg_7_0.id] = 0
		end

		arg_5_0.result[arg_7_0.id] = arg_5_0.result[arg_7_0.id] + arg_7_0.number

		if arg_7_0.isBenefit then
			if not arg_5_0.benefit[arg_7_0.type] then
				arg_5_0.benefit[arg_7_0.type] = {}
			end

			if not arg_5_0.benefit[arg_7_0.type][arg_7_0.id] then
				arg_5_0.benefit[arg_7_0.type][arg_7_0.id] = 0
			end

			arg_5_0.benefit[arg_7_0.type][arg_7_0.id] = arg_5_0.benefit[arg_7_0.type][arg_7_0.id] + arg_7_0.number
		end
	end)

	local var_5_0 = arg_5_0.contextData.char:GetFSM():GetState(NewEducateFSM.SYSTEM.PLAN)

	arg_5_0.oldRes = var_5_0:GetResources() or {}
	arg_5_0.oldAttrs = var_5_0:GetAttrs() or {}

	arg_5_0:UpdataMood()
	arg_5_0.attrUIList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateAttr(arg_8_1, arg_8_2)
		end
	end)
	arg_5_0.attrUIList:align(#arg_5_0.attrIds)
	arg_5_0.resUIList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateRes(arg_9_1, arg_9_2)
		end
	end)
	arg_5_0.resUIList:align(#arg_5_0.resIds)
	arg_5_0.planUIList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			arg_5_0:UpdatePlan(arg_10_1, arg_10_2)
		end
	end)
	arg_5_0.planUIList:align(arg_5_0.unlockPlanNum)
end

function var_0_0.UpdataMood(arg_11_0)
	local var_11_0, var_11_1 = arg_11_0.contextData.char:GetMoodStage()

	setText(arg_11_0.moodStageTF, i18n("child2_mood_stage" .. var_11_0))
	setText(arg_11_0.moodEffectTF, var_11_1 / 100 .. "%")
	setActive(arg_11_0.moodTF:Find("buff"), var_11_1 >= 0)
	setActive(arg_11_0.moodTF:Find("debuff"), var_11_1 < 0)
end

function var_0_0.GetExtraStr(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = ""

	if arg_12_3 ~= 0 then
		local var_12_1 = arg_12_3 > 0 and "#22AFFF" or "#FF6767"

		var_12_0 = setColorStr((arg_12_3 > 0 and "+" or "") .. arg_12_3, var_12_1)
	end

	local var_12_2 = ""
	local var_12_3 = arg_12_2 - arg_12_3 - arg_12_1

	if var_12_3 ~= 0 then
		local var_12_4 = var_12_3 > 0 and "#393A3C" or "#FF6767"

		var_12_2 = setColorStr((var_12_3 > 0 and "+" or "") .. var_12_3, var_12_4)
	end

	return var_12_2 .. var_12_0
end

function var_0_0.UpdateAttr(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.attrIds[arg_13_1 + 1]
	local var_13_1 = pg.child2_attr[var_13_0]

	LoadImageSpriteAsync("neweducateicon/" .. var_13_1.icon, arg_13_2:Find("icon_bg/icon"))
	setScrollText(arg_13_2:Find("name_mask/name"), var_13_1.name)

	local var_13_2 = arg_13_0.attrIds[arg_13_1 + 1]
	local var_13_3 = arg_13_0.contextData.char:GetAttr(var_13_2)
	local var_13_4, var_13_5 = NewEducateInfoPanel.GetArrtInfo(pg.child2_attr[var_13_2].rank, var_13_3)

	setText(arg_13_2:Find("rank/Text"), var_13_4)
	setText(arg_13_2:Find("value_new"), var_13_3)

	local var_13_6 = EducateConst.GRADE_2_COLOR[var_13_4][1]
	local var_13_7 = EducateConst.GRADE_2_COLOR[var_13_4][2]

	setImageColor(arg_13_2:Find("gradient"), Color.NewHex(var_13_6))
	setImageColor(arg_13_2:Find("rank"), Color.NewHex(var_13_7))

	local var_13_8 = arg_13_0.oldAttrs[var_13_2] or var_13_3
	local var_13_9 = var_13_3 - var_13_8
	local var_13_10 = var_13_9 > 0 and "16CF99" or "FF6767"

	if var_13_9 == 0 then
		var_13_10 = "393A3C"
	end

	setImageColor(arg_13_2:Find("arrow"), Color.NewHex(var_13_10))
	setTextColor(arg_13_2:Find("value_new"), Color.NewHex(var_13_10))

	local var_13_11 = arg_13_0.benefit[NewEducateConst.DROP_TYPE.ATTR]
	local var_13_12 = var_13_11 and var_13_11[var_13_2] or 0
	local var_13_13 = arg_13_0:GetExtraStr(var_13_8, var_13_3, var_13_12)

	setText(arg_13_2:Find("value_old"), math.max(var_13_8, 0) .. var_13_13)
	setActive(arg_13_2:Find("VX"), var_13_8 ~= var_13_3)
end

function var_0_0.UpdateRes(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.resIds[arg_14_1 + 1]

	LoadImageSpriteAsync("neweducateicon/" .. pg.child2_resource[var_14_0].icon, arg_14_2:Find("icon"))
	setText(arg_14_2:Find("name"), pg.child2_resource[var_14_0].name)

	local var_14_1 = arg_14_0.contextData.char:GetRes(var_14_0)
	local var_14_2 = arg_14_0.oldRes[var_14_0] or var_14_1
	local var_14_3 = var_14_1 - var_14_2
	local var_14_4 = var_14_3 > 0 and "16CF99" or "FF6767"

	if var_14_3 == 0 then
		var_14_4 = "393A3C"
	end

	setText(arg_14_2:Find("value_new"), var_14_1)
	setImageColor(arg_14_2:Find("arrow"), Color.NewHex(var_14_4))
	setTextColor(arg_14_2:Find("value_new"), Color.NewHex(var_14_4))

	local var_14_5 = arg_14_0.benefit[NewEducateConst.DROP_TYPE.RES]
	local var_14_6 = var_14_5 and var_14_5[var_14_0] or 0
	local var_14_7 = arg_14_0:GetExtraStr(var_14_2, var_14_1, var_14_6)

	setText(arg_14_2:Find("value_old"), math.max(var_14_2, 0) .. var_14_7)
end

function var_0_0.UpdatePlan(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.planIds[arg_15_1 + 1]

	setActive(arg_15_2:Find("bg/icon"), var_15_0)
	setActive(arg_15_2:Find("bg/empty"), not var_15_0)

	if var_15_0 then
		local var_15_1 = "plan_type" .. pg.child2_plan[var_15_0].replace_type_show

		LoadImageSpriteAtlasAsync("ui/neweducatecommonui_atlas", var_15_1, arg_15_2:Find("bg/icon"))
	end

	setActive(arg_15_2:Find("dot"), arg_15_1 + 1 ~= arg_15_0.unlockPlanNum)
end

function var_0_0._close(arg_16_0)
	arg_16_0.anim:Play("anim_educate_result_out")
end

function var_0_0.onBackPressed(arg_17_0)
	arg_17_0:_close()
end

function var_0_0.willExit(arg_18_0)
	arg_18_0:UnOverlayPanel(arg_18_0._tf)
	existCall(arg_18_0.contextData.onExit)
	arg_18_0.animEvent:SetEndEvent(nil)
end

return var_0_0
