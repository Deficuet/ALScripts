local var_0_0 = class("ToLoveCollabBackHillScene", import("..TemplateMV.BackHillTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "ToLoveCollabBackHillUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.top = arg_2_0:findTF("top")
	arg_2_0._map = arg_2_0:findTF("map")
	arg_2_0._upper = arg_2_0:findTF("upper")
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0:findTF("upper/task"), function()
		arg_3_0:emit(ToLoveCollabBackHillMediator.TASK)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("upper/jinianzhang"), function()
		arg_3_0:emit(ToLoveCollabBackHillMediator.TROPHY)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("upper/help"), function()
		arg_3_0:emit(ToLoveCollabBackHillMediator.PUZZLE)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("top/return_btn"), function()
		arg_3_0:emit(var_0_0.ON_BACK)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("top/return_main_btn"), function()
		arg_3_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("top/help_btn"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.tolove_main_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("upper/xiaoyouxi"), function()
		arg_3_0:emit(ToLoveCollabBackHillMediator.MINI_GAME)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("upper/tebiezuozhan"), function()
		local var_11_0 = getProxy(ChapterProxy)
		local var_11_1, var_11_2 = var_11_0:getLastMapForActivity()

		if not var_11_1 or not var_11_0:getMapById(var_11_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_11_2,
				mapIdx = var_11_1
			})
		end
	end, SFX_PANEL)
	arg_3_0:UpdateView()
end

function var_0_0.UpdateView(arg_12_0)
	local var_12_0 = getProxy(ActivityProxy)

	setActive(arg_12_0:findTF("upper/task/tips"), ToLoveCollabTaskMediator.GetTaskRedTip())

	local var_12_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
	local var_12_2 = false

	for iter_12_0, iter_12_1 in ipairs(var_12_1.data1_list) do
		if not table.contains(var_12_1.data2_list, iter_12_1) then
			var_12_2 = true

			break
		end
	end

	if #var_12_1:GetPicturePuzzleIds() == #var_12_1.data2_list and var_12_1.data1 ~= 1 then
		var_12_2 = true
	end

	setActive(arg_12_0:findTF("upper/jinianzhang/tips"), var_12_2)
	setActive(arg_12_0:findTF("upper/help/tips"), PuzzleConnectMediator.GetRedTip())
	setActive(arg_12_0:findTF("upper/xiaoyouxi/tips"), ToLoveGameVo.ShouldShowTip())
end

function var_0_0.willExit(arg_13_0)
	return
end

function var_0_0.IsShowMainTip()
	local var_14_0 = getProxy(ActivityProxy)

	local function var_14_1()
		return ToLoveCollabTaskMediator.GetTaskRedTip()
	end

	local function var_14_2()
		local var_16_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
		local var_16_1 = false

		for iter_16_0, iter_16_1 in ipairs(var_16_0.data1_list) do
			if not table.contains(var_16_0.data2_list, iter_16_1) then
				var_16_1 = true

				break
			end
		end

		if #var_16_0:GetPicturePuzzleIds() == #var_16_0.data2_list and var_16_0.data1 ~= 1 then
			var_16_1 = true
		end

		return var_16_1
	end

	local function var_14_3()
		return PuzzleConnectMediator.GetRedTip()
	end

	local function var_14_4()
		return ToLoveGameVo.ShouldShowTip()
	end

	return var_14_1() or var_14_2() or var_14_3() or var_14_4()
end

return var_0_0
