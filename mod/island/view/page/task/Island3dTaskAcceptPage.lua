local var_0_0 = class("Island3dTaskAcceptPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskAcceptUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.chapterText = arg_2_0._tf:Find("frame/chapter")
	arg_2_0.nameText = arg_2_0._tf:Find("frame/name")
	arg_2_0.tipText = arg_2_0._tf:Find("frame/tip/Text")

	setText(arg_2_0.tipText, i18n("island_task_open"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:TouchEvent()
	end, SFX_PANEL)
end

function var_0_0.TouchEvent(arg_5_0)
	local var_5_0 = arg_5_0._tf:GetComponent(typeof(Animation))
	local var_5_1 = arg_5_0._tf:GetComponent(typeof(DftAniEvent))

	var_5_1:SetEndEvent(function()
		var_5_1:SetEndEvent(nil)

		if arg_5_0.onExit then
			arg_5_0.onExit()

			arg_5_0.onExit = nil
		end

		if arg_5_0.taskId == IslandGuideChecker.FIRST_TASK_ID then
			IslandGuideChecker.CheckGuide("ISLAND_GUIDE_4")
		end

		arg_5_0:Hide()
	end)
	var_5_0:Play("Anim_Island3dTaskAcceptUI_out")
end

function var_0_0.Show(arg_7_0, arg_7_1, arg_7_2)
	var_0_0.super.Show(arg_7_0)

	arg_7_0.taskId = arg_7_1

	local var_7_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_7_0.taskId)

	setText(arg_7_0.chapterText, var_7_0:getConfig("series"))
	setText(arg_7_0.nameText, var_7_0:getConfig("series_name"))

	arg_7_0.onExit = arg_7_2
end

function var_0_0.OnDestroy(arg_8_0)
	return
end

return var_0_0
