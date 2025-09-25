local var_0_0 = class("MainNotificationWindowSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(PlayerProxy):getData()
	local var_1_1 = {}

	if #var_1_0.buildShipNotification > 0 then
		table.insert(var_1_1, function(arg_2_0)
			local var_2_0 = {}
			local var_2_1 = getProxy(BayProxy)

			for iter_2_0, iter_2_1 in ipairs(getProxy(PlayerProxy):getRawData().buildShipNotification) do
				local var_2_2 = var_2_1:getShipById(iter_2_1.uid)

				if var_2_2 then
					var_2_2.virgin = iter_2_1.new

					table.insert(var_2_0, var_2_2)
				else
					pg.TipsMgr.GetInstance():ShowTips("without ship data from uid:" .. iter_2_1.uid)
				end
			end

			pg.m02:sendNotification(GAME.CONFIRM_GET_SHIP, {
				ships = var_2_0,
				callback = arg_2_0
			})
		end)
	end

	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(getProxy(BagProxy):getItemsByType(Item.SKIN_ASSIGNED_TYPE)) do
		local var_1_3 = iter_1_1:getConfig("usage_arg")[1]

		var_1_2[var_1_3] = var_1_2[var_1_3] or {}

		table.insert(var_1_2[var_1_3], {
			type = DROP_TYPE_ITEM,
			id = iter_1_1.id,
			count = iter_1_1.count
		})
	end

	for iter_1_2, iter_1_3 in pairs(var_1_2) do
		local var_1_4 = getProxy(ActivityProxy):getActivityById(iter_1_2)

		if var_1_4 and not var_1_4:isEnd() then
			local var_1_5 = PlayerPrefs.GetInt(string.format("skin_select_item_act_%d_last_time", iter_1_2), 3)
			local var_1_6 = var_1_4.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

			if var_1_5 > math.floor(var_1_6 / 86400) then
				table.insert(var_1_1, function(arg_3_0)
					PlayerPrefs.SetInt(string.format("skin_select_item_act_%d_last_time", var_1_4.id), math.floor(var_1_6 / 86400))
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("skin_exchange_timelimit", pg.TimeMgr.GetInstance():STimeDescS(var_1_4.stopTime, "%m.%d")),
						items = iter_1_3,
						onYes = function()
							pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
								warp = StoreHouseConst.WARP_TO_MATERIAL
							})
						end,
						yesText = i18n("msgbox_text_forward"),
						onNo = arg_3_0
					})
				end)
			end
		end
	end

	local var_1_7 = getProxy(MailProxy)

	if not var_1_7.overTip and PlayerPrefs.GetString("mail_msg_tips", "") ~= pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") and var_1_7.total > MAIL_COUNT_LIMIT then
		PlayerPrefs.SetString("mail_msg_tips", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))
		table.insert(var_1_1, function(arg_5_0)
			pg.m02:sendNotification(GAME.LOAD_LAYERS, {
				parentContext = getProxy(ContextProxy):getCurrentContext(),
				context = Context.New({
					mediator = MailTipsWindowMediator,
					viewComponent = MailTipsLayer,
					data = {
						onYes = function()
							pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MAIL)
						end,
						content = i18n("warning_mail_max_3", var_1_7.total)
					}
				})
			})
		end)
	end

	var_1_7.overTip = true

	seriesAsync(var_1_1, arg_1_1)
end

return var_0_0
