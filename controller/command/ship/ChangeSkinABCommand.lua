local var_0_0 = class("ChangeSkinABCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.ship_id
	local var_1_2 = var_1_0.skin_id
	local var_1_3 = ShipGroup.GetChangeSkinNextId(var_1_2)
	local var_1_4 = ShipGroup.GetChangeSkinGroupId(var_1_2)
	local var_1_5 = getProxy(PlayerProxy):getRawData():GetFlagShip()

	if var_1_2 ~= var_1_5:getSkinId() then
		return
	end

	if not pg.ChangeSkinMgr.GetInstance():isAble() then
		return
	end

	pg.ChangeSkinMgr.GetInstance():preloadChangeAction(var_1_3, function()
		arg_1_0:startChangeAction(var_1_1, var_1_2, var_1_3, var_1_4, var_1_5)
	end)
end

function var_0_0.startChangeAction(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	arg_3_0:sendNotification(GAME.PLAY_CHANGE_SKIN_OUT, {
		callback = function(arg_4_0)
			local var_4_0 = arg_4_0.flag
			local var_4_1 = arg_4_0.tip

			if var_4_0 then
				ShipGroup.SetStoreChangeSkinId(arg_3_4, arg_3_1, arg_3_3)
				arg_3_5:updateSkinId(arg_3_3)
				getProxy(BayProxy):updateShip(arg_3_5)

				if not getProxy(SettingsProxy):getCharacterSetting(arg_3_1, SHIP_FLAG_L2D) then
					arg_3_0:sendNotification(GAME.CHANGE_SKIN_EXCHANGE, {
						callback = function()
							return
						end
					})
					arg_3_0:sendNotification(GAME.PLAY_CHANGE_SKIN_IN)
					arg_3_0:sendNotification(GAME.PLAY_CHANGE_SKIN_FINISH)
				else
					pg.ChangeSkinMgr.GetInstance():play(arg_3_3, function()
						arg_3_0:sendNotification(GAME.CHANGE_SKIN_EXCHANGE, {
							callback = function()
								return
							end
						})
					end, function()
						arg_3_0:sendNotification(GAME.PLAY_CHANGE_SKIN_IN)
					end, function()
						arg_3_0:sendNotification(GAME.PLAY_CHANGE_SKIN_FINISH)
					end)
				end
			end

			if var_4_1 then
				pg.TipsMgr.GetInstance():ShowTips(arg_3_2)
			end
		end
	})
end

return var_0_0
