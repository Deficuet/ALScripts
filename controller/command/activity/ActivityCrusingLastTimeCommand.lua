local var_0_0 = class("ActivityCrusingLastTimeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.awards
	local var_1_2 = var_1_0.time
	local var_1_3 = var_1_0.closeFunc

	if var_1_2 < 86400 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("battlepass_acquire_attention", math.floor(var_1_2 / 86400), math.floor(var_1_2 % 86400 / 3600)),
			items = var_1_1,
			onYes = function()
				arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
			end,
			yesText = i18n("msgbox_text_forward"),
			onNo = function()
				arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
			end
		})
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("battlepass_acquire_attention", math.floor(var_1_2 / 86400), math.floor(var_1_2 % 86400 / 3600)),
			items = var_1_1,
			onYes = function()
				arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
			end,
			yesText = i18n("msgbox_text_forward"),
			onNo = var_1_3
		})
	end
end

return var_0_0
