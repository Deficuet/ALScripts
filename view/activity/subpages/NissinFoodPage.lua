local var_0_0 = class("NissinFoodPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.helpBtn = arg_1_0.bg:Find("help_btn")
	arg_1_0.startBtn = arg_1_0.bg:Find("start_btn")
	arg_1_0.cupList = arg_1_0.bg:Find("cup_list")
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.hubID = arg_2_0.activity:getConfig("config_id")
	arg_2_0.drop_list = arg_2_0.activity:getConfig("config_client")

	onButton(arg_2_0, arg_2_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("chazi_tips")
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.startBtn, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 29)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_5_0)
	local var_5_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_5_0.hubID)

	eachChild(arg_5_0.cupList, function(arg_6_0)
		local var_6_0 = tonumber(arg_6_0.name)

		setActive(arg_6_0:Find("lock"), var_6_0 > var_5_0.count + var_5_0.usedtime)
		setActive(arg_6_0:Find("got"), var_6_0 <= var_5_0.usedtime)

		local var_6_1 = arg_6_0:Find("mask/award")
		local var_6_2 = arg_5_0.drop_list[var_6_0]
		local var_6_3 = {
			type = var_6_2[1],
			id = var_6_2[2],
			count = var_6_2[3]
		}

		updateDrop(var_6_1, var_6_3)
		onButton(arg_5_0, var_6_1, function()
			arg_5_0:emit(BaseUI.ON_DROP, var_6_3)
		end, SFX_PANEL)
	end)

	if var_5_0.ultimate == 0 and var_5_0.usedtime >= var_5_0:getConfig("reward_need") then
		pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = var_5_0.id,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})
	end
end

return var_0_0
