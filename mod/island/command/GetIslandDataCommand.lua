local var_0_0 = class("GetIslandDataCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.list
	local var_1_3 = var_1_0.isCardRequest
	local var_1_4 = var_1_0.callback
	local var_1_5 = var_1_0.reconnect

	arg_1_0:GetIslandData(var_1_1, var_1_2, var_1_3, var_1_4, var_1_5)
end

function var_0_0.GetIslandData(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	if LOCK_ISLAND_DISPLAY then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21200, {
		island_id = arg_2_1
	}, 21201, function(arg_3_0)
		local var_3_0 = arg_2_0:IsSelf(arg_2_1)
		local var_3_1 = (var_3_0 and Island or SharedIsland).New(arg_3_0.island)

		if arg_3_0.player_position then
			local var_3_2 = arg_3_0.player_position.map_id
			local var_3_3 = Vector3(arg_3_0.player_position.position.x, arg_3_0.player_position.position.y, arg_3_0.player_position.position.z)
			local var_3_4 = Vector3(arg_3_0.player_position.rotation.x, arg_3_0.player_position.rotation.y, arg_3_0.player_position.rotation.z)

			var_3_1:SetMapId(var_3_2)
			var_3_1:SetLastExitPosition(var_3_2, var_3_3, var_3_4)
		end

		if arg_2_5 then
			local var_3_5 = getProxy(IslandProxy):GetTempPlayerPosition()

			if var_3_5 then
				local var_3_6, var_3_7, var_3_8 = unpack(var_3_5)

				var_3_1:SetMapId(var_3_6)
				var_3_1:SetLastExitPosition(var_3_6, var_3_7, var_3_8)
			end
		end

		local var_3_9 = {}

		for iter_3_0, iter_3_1 in ipairs(arg_2_2) do
			local var_3_10 = IslandPlayer.New(iter_3_1)

			var_3_9[iter_3_1.id] = var_3_10
		end

		var_3_1:GetVisitorAgency():SetPlayerList(var_3_9)

		if var_3_0 then
			getProxy(IslandProxy):SetIsland(var_3_1)
		else
			getProxy(IslandProxy):SetSharedIsland(var_3_1)
		end

		if arg_2_3 then
			existCall(arg_2_4)

			return
		end

		arg_2_0:AfterIslandInit()
		arg_2_0:sendNotification(GAME.ISLAND_ENTER_MAP, {
			islandId = arg_2_1,
			mapId = var_3_1:GetMapId(),
			callback = function()
				arg_2_0:GoScene(arg_2_1)
			end
		})
	end)
end

function var_0_0.IsSelf(arg_5_0, arg_5_1)
	return getProxy(PlayerProxy):getRawData().id == arg_5_1
end

function var_0_0.GoScene(arg_6_0, arg_6_1)
	if arg_6_0:IsSelf(arg_6_1) then
		arg_6_0:sendNotification(GAME.GO_SCENE, SCENE.ISLAND, {
			id = arg_6_1
		})
	else
		arg_6_0:sendNotification(GAME.GO_SCENE, SCENE.SHARED_ISLAND, {
			id = arg_6_1
		})
	end
end

function var_0_0.AfterIslandInit(arg_7_0)
	local var_7_0 = getProxy(IslandProxy):GetIsland()

	var_7_0:GetAchievementAgency():InitRuntimeRecords()
	var_7_0:GetTechnologyAgency():InitLockData()
	var_7_0:GetGlobalBuffAgency():InitShipSkillGlobalBuff()
	var_7_0:GetBookAgency():InitShipTypeData()
end

return var_0_0
