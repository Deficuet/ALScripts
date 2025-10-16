local var_0_0 = class("WarspiteTransformationPage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.btn = arg_1_0.bg:Find("battle_btn")
	arg_1_0.tip = arg_1_0.bg:Find("help")
	arg_1_0.mainAward = arg_1_0.bg:Find("award")
	arg_1_0.subAwards = CustomIndexLayer.Clone2Full(arg_1_0.bg:Find("list"), 7)
	arg_1_0.step = arg_1_0.bg:Find("receivetimes")
	arg_1_0.score = arg_1_0.bg:Find("highscore")
end

function var_0_0.OnDataSetting(arg_2_0)
	local var_2_0 = arg_2_0.activity

	if var_2_0.data4 == 0 and var_2_0.data2 >= 7 then
		arg_2_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 3,
			activity_id = var_2_0.id
		})

		return true
	elseif defaultValue(var_2_0.data2_list[1], 0) > 0 or defaultValue(var_2_0.data2_list[2], 0) > 0 then
		arg_2_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 2,
			activity_id = var_2_0.id
		})

		return true
	end
end

function var_0_0.OnFirstFlush(arg_3_0)
	local var_3_0 = arg_3_0.activity
	local var_3_1 = var_3_0:getConfig("config_client")[2]
	local var_3_2 = {
		type = var_3_1[1],
		id = var_3_1[2],
		count = var_3_1[3]
	}

	onButton(arg_3_0, arg_3_0.mainAward, function()
		arg_3_0:emit(BaseUI.ON_DROP, var_3_2)
	end, SFX_PANEL)

	for iter_3_0 = 1, 7 do
		local var_3_3 = arg_3_0.subAwards[iter_3_0]
		local var_3_4 = var_3_0:getConfig("config_client")[1]
		local var_3_5 = {
			type = var_3_4[1],
			id = var_3_4[2],
			count = var_3_4[3]
		}

		onButton(arg_3_0, var_3_3, function()
			arg_3_0:emit(BaseUI.ON_DROP, var_3_5)
		end, SFX_PANEL)
	end

	onButton(arg_3_0, arg_3_0.tip, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.goldship_help_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.btn, function()
		arg_3_0:emit(ActivityMediator.GO_DODGEM)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_8_0)
	local var_8_0 = arg_8_0.activity
	local var_8_1 = pg.TimeMgr.GetInstance()
	local var_8_2 = var_8_1:DiffDay(var_8_0.data1, var_8_1:GetServerTime()) + 1

	setActive(findTF(arg_8_0.mainAward, "get"), var_8_0.data4 > 0)

	for iter_8_0 = 1, 7 do
		local var_8_3 = arg_8_0.subAwards[iter_8_0]

		setActive(findTF(var_8_3, "get"), iter_8_0 <= var_8_0.data2)
		setActive(findTF(var_8_3, "lock"), var_8_2 < iter_8_0)
	end

	setText(arg_8_0.step, var_8_0.data2)
	setText(arg_8_0.score, var_8_0.data1_list[1])
end

return var_0_0
