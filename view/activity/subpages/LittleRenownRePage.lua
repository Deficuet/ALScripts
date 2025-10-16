local var_0_0 = class("LittleRenownRePage", import(".TemplatePage.PtTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.heartTpl = arg_1_0.bg:Find("HeartTpl")
	arg_1_0.heartContainer = arg_1_0.bg:Find("HeartContainer")
	arg_1_0.heartUIItemList = UIItemList.New(arg_1_0.heartContainer, arg_1_0.heartTpl)

	arg_1_0.heartUIItemList:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_2_1 + 1
			local var_2_1 = arg_1_0.ptData:GetLevelProgress()
			local var_2_2 = arg_2_2:Find("Full")

			setActive(var_2_2, not (var_2_1 < var_2_0))
		end
	end)

	arg_1_0.helpBtn = arg_1_0.bg:Find("help_btn")

	onButton(arg_1_0, arg_1_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.littleRenown_npc.tip
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_4_0)
	var_0_0.super.OnUpdateFlush(arg_4_0)

	local var_4_0, var_4_1 = arg_4_0.ptData:GetLevelProgress()

	arg_4_0.heartUIItemList:align(var_4_1)
end

function var_0_0.OnFirstFlush(arg_5_0)
	var_0_0.super.OnFirstFlush(arg_5_0)
	onButton(arg_5_0, arg_5_0.battleBtn, function()
		arg_5_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.LEVEL)
	end, SFX_PANEL)
end

return var_0_0
