local var_0_0 = class("MainCrusingActSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)
	local var_1_1 = {}

	if var_1_0 and not var_1_0:isEnd() then
		table.insert(var_1_1, function(arg_2_0)
			arg_1_0:CheckCrusingAct(var_1_0, arg_2_0)
		end)

		if PlayerPrefs.GetInt("cursing_first_enter_scene:" .. var_1_0.id, 0) == 0 then
			table.insert(var_1_1, function(arg_3_0)
				PlayerPrefs.SetInt("cursing_first_enter_scene:" .. var_1_0.id, 1)
				arg_1_0:ShowWindow(arg_3_0)
			end)
		end
	end

	seriesAsync(var_1_1, arg_1_1)
end

function var_0_0.ShowWindow(arg_4_0, arg_4_1)
	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = getProxy(ContextProxy):getCurrentContext(),
		context = Context.New({
			mediator = CrusingWindowMediator,
			viewComponent = CrusingWindowLayer2,
			data = {
				onClose = arg_4_1
			}
		})
	})
end

function var_0_0.CheckCrusingAct(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = PlayerPrefs.GetInt(string.format("crusing_%d_last_time", arg_5_1.id), 3)
	local var_5_1 = arg_5_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime()
	local var_5_2 = arg_5_1:GetCrusingUnreceiveAward()

	if #var_5_2 > 0 and var_5_0 > math.floor(var_5_1 / 86400) then
		PlayerPrefs.SetInt(string.format("crusing_%d_last_time", arg_5_1.id), math.floor(var_5_1 / 86400))
		arg_5_0:ShowMsg(var_5_2, var_5_1, arg_5_2)
	else
		arg_5_2()
	end
end

function var_0_0.ShowMsg(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_2 < 86400 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("battlepass_acquire_attention", math.floor(arg_6_2 / 86400), math.floor(arg_6_2 % 86400 / 3600)),
			items = arg_6_1,
			onYes = function()
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
			end,
			yesText = i18n("msgbox_text_forward"),
			onNo = function()
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
			end
		})
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("battlepass_acquire_attention", math.floor(arg_6_2 / 86400), math.floor(arg_6_2 % 86400 / 3600)),
			items = arg_6_1,
			onYes = function()
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
			end,
			yesText = i18n("msgbox_text_forward"),
			onNo = arg_6_3
		})
	end
end

return var_0_0
