local var_0_0 = class("ApartmentCollectionItemCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.roomId
	local var_1_2 = var_1_0.groupId
	local var_1_3 = var_1_0.itemId
	local var_1_4 = pg.dorm3d_collection_template[var_1_3]
	local var_1_5 = var_1_4.award

	if var_1_2 == 0 and var_1_5 ~= 0 then
		pg.TipsMgr.GetInstance():ShowTips("error collection favor trigger link:" .. var_1_3)

		return
	end

	local var_1_6 = getProxy(ApartmentProxy)

	if var_1_6:getRoom(var_1_1).collectItemDic[var_1_3] then
		arg_1_0:sendNotification(GAME.APARTMENT_COLLECTION_ITEM_DONE, {
			itemId = var_1_3
		})

		return
	end

	local var_1_7 = var_1_6:getApartment(var_1_2)

	pg.ConnectionMgr.GetInstance():Send(28011, {
		room_id = var_1_1,
		collection_id = var_1_3,
		ship_group = var_1_2
	}, 28012, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_6:ModifyRoom(var_1_1, function(arg_3_0)
				arg_3_0.collectItemDic[var_1_3] = true
			end)

			local var_2_0 = var_1_4.award

			if var_2_0 > 0 then
				local var_2_1, var_2_2 = var_1_6:triggerFavor(var_1_2, var_2_0)

				arg_1_0:sendNotification(GAME.APARTMENT_TRIGGER_FAVOR_DONE, {
					triggerId = var_2_0,
					cost = var_2_2,
					delta = var_2_1,
					apartment = var_1_7
				})
			end

			PlayerPrefs.SetInt("apartment_collection_item", var_1_3)
			arg_1_0:sendNotification(GAME.APARTMENT_COLLECTION_ITEM_DONE, {
				isNew = true,
				itemId = var_1_3
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCollectionItem(var_1_3, 2))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
