local var_0_0 = class("USSkirmishRePage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0:initUI()
	arg_1_0:initData()
	arg_1_0:addListener()
end

function var_0_0.OnFirstFlush(arg_2_0)
	return
end

function var_0_0.OnUpdateFlush(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.taskVOList) do
		local var_3_0 = iter_3_1.state
		local var_3_1 = arg_3_0.progress:GetChild(iter_3_0 - 1)
		local var_3_2 = var_3_1:Find("Empty")
		local var_3_3 = var_3_1:Find("Full")

		if var_3_0 < SkirmishVO.StateClear then
			setActive(var_3_2, true)
			setActive(var_3_3, false)
		else
			setActive(var_3_2, false)
			setActive(var_3_3, true)
		end
	end
end

function var_0_0.initUI(arg_4_0)
	arg_4_0.bg = arg_4_0._tf:Find("AD")
	arg_4_0.progress = arg_4_0._tf:Find("Progress")
	arg_4_0.helpBtn = arg_4_0._tf:Find("HelpBtn")
	arg_4_0.battleBtn = arg_4_0._tf:Find("BattleBtn")
end

function var_0_0.initData(arg_5_0)
	arg_5_0.taskGroup = Clone(pg.activity_template[ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE].config_data)
	arg_5_0.taskCount = #arg_5_0.taskGroup
	arg_5_0.skirmishProxy = getProxy(SkirmishProxy)

	arg_5_0.skirmishProxy:UpdateSkirmishProgress()

	arg_5_0.taskVOList = Clone(arg_5_0.skirmishProxy.data)
end

function var_0_0.addListener(arg_6_0)
	onButton(arg_6_0, arg_6_0.helpBtn, function()
		if pg.gametip.help_tempesteve then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_tempesteve.tip
			})
		end
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.battleBtn, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			mapIdx = SkirmishProxy.SkirmishMap
		})
	end, SFX_PANEL)
end

return var_0_0
