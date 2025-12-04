local var_0_0 = class("HelenaCoreActivityUI", import("view.activity.CorePage.PSS.PSSCoreActivityUI"))

function var_0_0.getUIName(arg_1_0)
	return "HelenaCoreActivityUI"
end

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)

	arg_2_0.topPage = arg_2_0._tf:Find("adapt/TopPage")
	arg_2_0.camEventId = nil

	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text"), i18n("HelenaCoreActivity_title"))
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text/Text_1"), i18n("HelenaCoreActivity_title2"))
end

function var_0_0.UpdateAdapt(arg_3_0)
	return
end

function var_0_0.ActiveScenarioLayer(arg_4_0, arg_4_1)
	arg_4_0.contextData.activeScenario = arg_4_1
end

function var_0_0.verifyTabs(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.activities[arg_5_0:getActivityIndex(arg_5_1) or arg_5_0:getActivityIndex(arg_5_0:GetActiveActivity()) or 1]

	if var_5_0 == nil then
		return
	end

	local var_5_1 = var_5_0:getConfig("is_show")
	local var_5_2 = arg_5_0.tabs:Find(tostring(var_5_1))

	if #arg_5_0.activities == 1 then
		setActive(arg_5_0._tf:Find("adapt/tabs"), false)
	else
		setActive(arg_5_0._tf:Find("adapt/tabs"), true)
	end

	triggerToggle(var_5_2, true)
end

function var_0_0.didEnter(arg_6_0)
	var_0_0.super.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0.btnBack, function()
		local var_7_0 = arg_6_0.pageDic[arg_6_0.activity.id]

		if var_7_0:IsShowingPopWindow() then
			var_7_0:ClosePopWindow()
		else
			arg_6_0:emit(var_0_0.ON_BACK)
		end
	end, SOUND_BACK)
end

function var_0_0.OnToggleName(arg_8_0, arg_8_1, arg_8_2)
	return
end

function var_0_0.OnAnimations(arg_9_0, arg_9_1, arg_9_2)
	SetActive(arg_9_0._tf:Find("adapt/decorate"), arg_9_2 == 50261 or arg_9_2 == 0)
end

function var_0_0.willExit(arg_10_0)
	var_0_0.super.willExit(arg_10_0)

	if arg_10_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_10_0.camEventId)

		arg_10_0.camEventId = nil
	end
end

return var_0_0
