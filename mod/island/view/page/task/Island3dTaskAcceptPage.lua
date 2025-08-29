local var_0_0 = class("Island3dTaskAcceptPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskAcceptUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.chapterText = arg_2_0._tf:Find("frame/chapter")
	arg_2_0.nameText = arg_2_0._tf:Find("frame/name")
	arg_2_0.tipText = arg_2_0:findTF("frame/tip/Text")

	setText(arg_2_0.tipText, i18n("island_task_open"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		local var_4_0 = arg_3_0._tf:GetComponent(typeof(Animation))
		local var_4_1 = arg_3_0._tf:GetComponent(typeof(DftAniEvent))

		var_4_1:SetEndEvent(function()
			var_4_1:SetEndEvent(nil)

			if arg_3_0.onExit then
				arg_3_0.onExit()

				arg_3_0.onExit = nil
			end

			if arg_3_0.taskId == IslandGuideChecker.FIRST_TASK_ID then
				IslandGuideChecker.CheckGuide("ISLAND_GUIDE_4")
			end

			arg_3_0:Hide()
		end)
		var_4_0:Play("Anim_Island3dTaskAcceptUI_out")
	end, SFX_PANEL)
end

function var_0_0.Show(arg_6_0, arg_6_1, arg_6_2)
	var_0_0.super.Show(arg_6_0)

	arg_6_0.taskId = arg_6_1

	local var_6_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_6_0.taskId)

	setText(arg_6_0.chapterText, var_6_0:getConfig("series"))
	setText(arg_6_0.nameText, var_6_0:getConfig("series_name"))

	arg_6_0.onExit = arg_6_2
end

function var_0_0.OnDestroy(arg_7_0)
	return
end

return var_0_0
