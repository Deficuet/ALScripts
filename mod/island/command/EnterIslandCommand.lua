local var_0_0 = class("EnterIslandCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.code
	local var_1_3 = var_1_0.reconnect
	local var_1_4 = getProxy(PlayerProxy):getRawData()

	if var_1_4 then
		local var_1_5, var_1_6 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_1_4.level, IslandMediator.__cname)

		if not var_1_5 then
			pg.TipsMgr.GetInstance():ShowTips(var_1_6)

			return
		end
	end

	if var_1_2 and var_1_2 ~= "" then
		arg_1_0:Send(0, var_1_2, var_1_3)
	else
		arg_1_0:Send(var_1_1, 0, var_1_3)
	end
end

function var_0_0.Send(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	pg.ConnectionMgr.GetInstance():Send(21202, {
		island_id = arg_2_1,
		code = tostring(arg_2_2)
	}, 21203, function(arg_3_0)
		if arg_3_0.result == 0 then
			local var_3_0 = {}
			local var_3_1 = arg_2_0:IsSelf(arg_2_1)

			table.insert(var_3_0, function(arg_4_0)
				arg_2_0:sendNotification(GAME.ISLAND_GET_DATA, {
					id = arg_3_0.island_id,
					list = arg_3_0.player_list,
					reconnect = arg_2_3,
					checkCanEnterMap = arg_4_0
				})
			end)

			local var_3_2 = false

			table.insert(var_3_0, function(arg_5_0)
				if var_3_1 then
					var_3_2 = getProxy(IslandProxy):GetIsland():GetSeasonAgency():NeedReset()

					if var_3_2 then
						arg_2_0:sendNotification(GAME.ISLAND_RESET_SEASON, {
							callback = arg_5_0
						})
					else
						arg_5_0()
					end
				else
					arg_5_0()
				end
			end)
			table.insert(var_3_0, function(arg_6_0)
				if var_3_2 then
					arg_2_0:sendNotification(GAME.ISLAND_GET_DATA, {
						id = arg_3_0.island_id,
						list = arg_3_0.player_list,
						reconnect = arg_2_3,
						checkCanEnterMap = arg_6_0
					})
				else
					arg_6_0()
				end
			end)
			seriesAsync(var_3_0, function()
				local var_7_0 = var_3_1 and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()

				arg_2_0:sendNotification(GAME.ISLAND_ENTER_MAP, {
					islandId = arg_2_1,
					mapId = var_7_0:GetMapId(),
					callback = function()
						arg_2_0:GoScene(arg_2_1)
					end
				})
				getProxy(IslandProxy):EnterIsland(arg_3_0.island_id)
			end)
		elseif arg_3_0.result == 6 then
			arg_2_0:sendNotification(GAME.ISLAND_QUEUE_UP, {
				pos = arg_3_0.pos,
				id = arg_3_0.island_id
			})
		elseif arg_3_0.result == 19 then
			local var_3_3 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_3_4 = arg_3_0.cd - var_3_3
			local var_3_5 = pg.TimeMgr.GetInstance():DescCDTime(var_3_4)

			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip5", var_3_5))
		elseif arg_3_0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip1"))
		elseif arg_3_0.result == 20 or arg_3_0.result == 40 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip2"))
		elseif arg_3_0.result == 9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip3"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.result)
		end
	end)
end

function var_0_0.IsSelf(arg_9_0, arg_9_1)
	return getProxy(PlayerProxy):getRawData().id == arg_9_1
end

function var_0_0.GoScene(arg_10_0, arg_10_1)
	if arg_10_0:IsSelf(arg_10_1) then
		arg_10_0:sendNotification(GAME.GO_SCENE, SCENE.ISLAND, {
			id = arg_10_1
		})
	else
		arg_10_0:sendNotification(GAME.GO_SCENE, SCENE.SHARED_ISLAND, {
			id = arg_10_1
		})
	end
end

return var_0_0
