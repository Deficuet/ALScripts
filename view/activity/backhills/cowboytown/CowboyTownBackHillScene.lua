local var_0_0 = class("CowboyTownBackHillScene", import("..TemplateMV.BackHillTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "CowboyTownBackHillUI"
end

function var_0_0.didEnter(arg_2_0)
	onButton(arg_2_0, arg_2_0:findTF("top/btn_back"), function()
		arg_2_0:emit(var_0_0.ON_BACK)
	end)
	onButton(arg_2_0, arg_2_0:findTF("top/btn_home"), function()
		arg_2_0:emit(var_0_0.ON_HOME)
	end)
	onButton(arg_2_0, arg_2_0:findTF("top/info/btn_help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip["0815_main_help"].tip
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0:findTF("btn/btn_game"), function()
		arg_2_0:emit(CowboyTownMediator.MINI_GAME)
	end)
	onButton(arg_2_0, arg_2_0:findTF("btn/btn_skin"), function()
		arg_2_0:emit(CowboyTownMediator.SKIN)
	end)
	onButton(arg_2_0, arg_2_0:findTF("btn/btn_expansion"), function()
		arg_2_0:emit(CowboyTownMediator.EXPANSION)
	end)
	onButton(arg_2_0, arg_2_0:findTF("btn/btn_task"), function()
		arg_2_0:emit(CowboyTownMediator.TASK)
	end)
	onButton(arg_2_0, arg_2_0:findTF("btn/btn_story"), function()
		arg_2_0:emit(CowboyTownMediator.STORY)
	end)
	arg_2_0:UpdateView()
end

function var_0_0.UpdateView(arg_11_0)
	setActive(arg_11_0:findTF("btn/btn_game/tip"), var_0_0.MiniGameTip())
	setActive(arg_11_0:findTF("btn/btn_expansion/tip"), var_0_0.ExpansionTips())
	arg_11_0:UpdateTaskTips()
	arg_11_0:UpdateStoryView()
end

function var_0_0.IsShowMainTip(arg_12_0)
	return var_0_0.MiniGameTip() or var_0_0.ExpansionTips() or SixYearUsTaskMediator.GetTaskRedTip() or var_0_0.StoryTips()
end

function var_0_0.UpdateStoryView(arg_13_0)
	setActive(arg_13_0:findTF("btn/btn_story/tip"), var_0_0.StoryTips())
end

function var_0_0.UpdateActivity(arg_14_0, arg_14_1)
	return
end

function var_0_0.MiniGameTip()
	return getProxy(MiniGameProxy):GetHubByGameId(CowboyTownMediator.MINI_GAME_ID).count > 0
end

function var_0_0.ExpansionTips()
	return TownScene.ShowEntranceTip()
end

function var_0_0.UpdateTaskTips(arg_17_0)
	setActive(arg_17_0:findTF("btn/btn_task/tip"), SixYearUsTaskMediator.GetTaskRedTip())
end

function var_0_0.StoryTips()
	if getProxy(ActivityProxy):getActivityById(5535).data1 > 0 then
		return true
	end

	return false
end

return var_0_0
