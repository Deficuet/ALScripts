local var_0_0 = class("WorldItemUseCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.itemID
	local var_1_2 = var_1_0.count
	local var_1_3 = var_1_0.args

	pg.ConnectionMgr.GetInstance():Send(33301, {
		id = var_1_1,
		count = var_1_2,
		arg = var_1_3
	}, 33302, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = {}
			local var_2_1 = nowWorld()

			var_2_1:GetInventoryProxy():RemoveItem(var_1_1, var_1_2)

			local var_2_2 = WorldItem.New({
				id = var_1_1,
				count = var_1_2
			})

			switch(var_2_2:getWorldItemType(), {
				[WorldItem.UsageBuff] = function()
					local var_3_0 = var_2_2:getItemBuffID()

					for iter_3_0, iter_3_1 in ipairs(var_1_3) do
						var_2_1:GetShip(iter_3_1):AddBuff(var_3_0, var_2_2.count)
					end
				end,
				[WorldItem.UsageHPRegenerate] = function()
					local var_4_0 = var_2_2:getItemRegenerate() * var_2_2.count

					for iter_4_0, iter_4_1 in ipairs(var_1_3) do
						var_2_1:GetShip(iter_4_1):Regenerate(var_4_0)
					end
				end,
				[WorldItem.UsageHPRegenerateValue] = function()
					local var_5_0 = var_2_2:getItemRegenerate() * var_2_2.count

					for iter_5_0, iter_5_1 in ipairs(var_1_3) do
						var_2_1:GetShip(iter_5_1):RegenerateValue(var_5_0)
					end
				end,
				[WorldItem.UsageRecoverAp] = function()
					local var_6_0 = var_2_2:getItemStaminaRecover() * var_2_2.count

					var_2_1.staminaMgr:ExchangeStamina(var_6_0)
					arg_1_0:sendNotification(GAME.WORLD_STAMINA_EXCHANGE_DONE)
				end,
				[WorldItem.UsageWorldFlag] = function()
					switch(var_2_2:getItemFlagKey(), {
						function()
							var_2_1:SetGlobalFlag("treasure_flag", true)

							var_2_0 = PlayerConst.addTranDrop(arg_2_0.drop_list)
						end
					})
				end
			}, function()
				var_2_0 = PlayerConst.addTranDrop(arg_2_0.drop_list)
			end)
			arg_1_0:sendNotification(GAME.WORLD_ITEM_USE_DONE, {
				drops = var_2_0,
				item = var_2_2
			})
		elseif PLATFORM_CODE == PLATFORM_CHT then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("Operation Siren item usage failure:" .. arg_2_0.result))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n1("Operation Siren item usage failure:" .. arg_2_0.result))
		end
	end)
end

return var_0_0
