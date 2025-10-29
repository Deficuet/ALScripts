local var_0_0 = class("BlackFridayWithSignInPage", import(".BlackFridayPage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.signInUIlist = UIItemList.New(arg_1_0._tf:Find("AD/signIn"), arg_1_0._tf:Find("AD/signIn/award"))
	arg_1_0.toggles = {
		arg_1_0._tf:Find("AD/toggles/skin"),
		arg_1_0._tf:Find("AD/toggles/sign")
	}
	arg_1_0.lockSignBtn = arg_1_0._tf:Find("AD/toggles/sign/lock")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.lockSignBtn, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
	end, SFX_PANEL)

	arg_2_0.signInActId = arg_2_0.activity:getConfig("config_client")[2]

	arg_2_0:FlushSignInInfo()

	if arg_2_0.contextData.showByNextAct then
		arg_2_0.contextData.showByNextAct = nil

		triggerToggle(arg_2_0.toggles[2], true)
	end
end

function var_0_0.GetSignInAct(arg_4_0)
	return (getProxy(ActivityProxy):getActivityById(arg_4_0.signInActId))
end

function var_0_0.ClientSignInActIsEnd(arg_5_0)
	local var_5_0 = pg.activity_template[arg_5_0.signInActId]
	local var_5_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_5_0.time[3])
	local var_5_2 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_5_0.time[2])
	local var_5_3 = pg.TimeMgr.GetInstance():GetServerTime()

	return var_5_1 < var_5_3 or var_5_3 < var_5_2
end

function var_0_0.FlushSignInInfo(arg_6_0)
	local var_6_0 = arg_6_0:GetSignInAct()
	local var_6_1 = var_6_0 and not var_6_0:isEnd()
	local var_6_2 = pg.activity_template[arg_6_0.signInActId]
	local var_6_3 = arg_6_0:ClientSignInActIsEnd()
	local var_6_4 = not var_6_1 and var_6_3

	if var_6_4 then
		triggerToggle(arg_6_0.toggles[1], true)
		setToggleEnabled(arg_6_0.toggles[2], false)
	end

	setActive(arg_6_0.lockSignBtn, var_6_4)

	local var_6_5 = var_6_2.config_id
	local var_6_6 = pg.activity_7_day_sign[var_6_5].front_drops

	arg_6_0.signInUIlist:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = var_6_6[arg_7_1 + 1]
			local var_7_1 = {
				type = var_7_0[1],
				id = var_7_0[2],
				count = var_7_0[3]
			}

			updateDrop(arg_7_2, var_7_1)
			onButton(arg_6_0, arg_7_2, function()
				arg_6_0:emit(BaseUI.ON_DROP, var_7_1)
			end, SFX_PANEL)
		end
	end)
	arg_6_0.signInUIlist:align(#var_6_6)
end

function var_0_0.FlushSignAwardsState(arg_9_0)
	local var_9_0 = arg_9_0:GetSignInAct()
	local var_9_1 = var_9_0 and not var_9_0:isEnd()
	local var_9_2 = var_9_1 and var_9_0.data1 or 0
	local var_9_3 = arg_9_0:ClientSignInActIsEnd()

	arg_9_0.signInUIlist:each(function(arg_10_0, arg_10_1)
		if not var_9_3 and not var_9_1 then
			setActive(arg_10_1:Find("got"), true)
		else
			setActive(arg_10_1:Find("got"), arg_10_0 + 1 <= var_9_2)
		end
	end)
end

function var_0_0.OnUpdateFlush(arg_11_0)
	var_0_0.super.OnUpdateFlush(arg_11_0)
	arg_11_0:FlushSignAwardsState()
end

return var_0_0
