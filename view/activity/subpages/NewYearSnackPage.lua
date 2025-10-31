local var_0_0 = class("NewYearSnackPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.progressTpl = arg_1_0._tf:Find("ProgressTpl")
	arg_1_0.progressTplContainer = arg_1_0._tf:Find("ProgressList")
	arg_1_0.progressUIItemList = UIItemList.New(arg_1_0.progressTplContainer, arg_1_0.progressTpl)
	arg_1_0.helpBtn = arg_1_0._tf:Find("HelpBtn")
	arg_1_0.goBtn = arg_1_0._tf:Find("GoBtn")
end

function var_0_0.OnDataSetting(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_client").linkMiniGameID
	local var_2_1 = getProxy(MiniGameProxy):GetMiniGameData(var_2_0):getConfig("hub_id")
	local var_2_2 = getProxy(MiniGameProxy):GetHubByHubId(var_2_1)

	arg_2_0.needCount = var_2_2:getConfig("reward_need")
	arg_2_0.leftCount = var_2_2.count
	arg_2_0.playedCount = var_2_2.usedtime
	arg_2_0.isGotAward = var_2_2.ultimate > 0
	arg_2_0.curDay = arg_2_0.leftCount + arg_2_0.playedCount
end

function var_0_0.OnFirstFlush(arg_3_0)
	arg_3_0.progressUIItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_4_1 = arg_4_1 + 1

			local var_4_0 = arg_4_2:Find("Locked")
			local var_4_1 = arg_4_2:Find("Unlocked")
			local var_4_2 = arg_4_2:Find("Finished")
			local var_4_3 = arg_4_2:Find("FinalFinished")

			setActive(var_4_0, arg_4_1 > arg_3_0.curDay)

			if arg_4_1 <= arg_3_0.curDay then
				setActive(var_4_1, arg_4_1 > arg_3_0.playedCount)
				setActive(var_4_2, arg_4_1 <= arg_3_0.playedCount and arg_4_1 ~= arg_3_0.needCount)
				setActive(var_4_3, arg_4_1 <= arg_3_0.playedCount and arg_4_1 == arg_3_0.needCount)
			else
				setActive(var_4_1, false)
				setActive(var_4_2, false)
				setActive(var_4_3, false)
			end
		end
	end)
	arg_3_0.progressUIItemList:align(arg_3_0.needCount)
	onButton(arg_3_0, arg_3_0.goBtn, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 19, {
			callback = function()
				local var_6_0 = Context.New()

				SCENE.SetSceneInfo(var_6_0, SCENE.NEWYEAR_BACKHILL)
				getProxy(ContextProxy):PushContext2Prev(var_6_0)
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_xinnian2021__meishiyemian")
		})
	end, SFX_PANEL)
	arg_3_0:tryGetFinalAward()
end

function var_0_0.OnUpdateFlush(arg_8_0)
	return
end

function var_0_0.OnDestroy(arg_9_0)
	return
end

function var_0_0.tryGetFinalAward(arg_10_0)
	local var_10_0 = arg_10_0.activity:getConfig("config_client").linkMiniGameID
	local var_10_1 = getProxy(MiniGameProxy):GetMiniGameData(var_10_0):getConfig("hub_id")
	local var_10_2 = getProxy(MiniGameProxy):GetHubByHubId(var_10_1)
	local var_10_3 = var_10_2.usedtime
	local var_10_4 = var_10_2:getConfig("reward_need")
	local var_10_5 = var_10_2.ultimate > 0

	if var_10_4 <= var_10_3 and not var_10_5 then
		pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = var_10_2.id,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})
	end
end

function var_0_0.IsTip()
	local var_11_0 = getProxy(ActivityProxy):getActivityById(pg.activity_const.NEWYEAR_SNACK_PAGE_ID.act_id)

	if var_11_0 and not var_11_0:isEnd() then
		local var_11_1 = var_11_0:getConfig("config_client").linkMiniGameID
		local var_11_2 = getProxy(MiniGameProxy):GetMiniGameData(var_11_1):getConfig("hub_id")
		local var_11_3 = getProxy(MiniGameProxy):GetHubByHubId(var_11_2)
		local var_11_4 = var_11_3.usedtime
		local var_11_5 = var_11_3:getConfig("reward_need")
		local var_11_6 = var_11_3.ultimate > 0

		if var_11_5 <= var_11_4 and not var_11_6 then
			return true
		elseif var_11_3.count > 0 then
			return true
		else
			return false
		end
	end
end

return var_0_0
