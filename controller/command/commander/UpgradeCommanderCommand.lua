local var_0_0 = class("UpgradeCommanderCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.materialIds
	local var_1_3 = var_1_0.skillId
	local var_1_4 = getProxy(CommanderProxy)
	local var_1_5 = var_1_4:getCommanderById(var_1_1)

	if not var_1_5 then
		return
	end

	local var_1_6 = var_1_5:getSkill(var_1_3)

	if not var_1_6 then
		return
	end

	if var_1_5:isMaxLevel() and var_1_6:isMaxLevel() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_be_upgrade"))

		return
	end

	local var_1_7 = getProxy(FleetProxy):getCommandersInFleet()

	if _.any(var_1_2, function(arg_2_0)
		return table.contains(var_1_7, arg_2_0)
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_anyone_is_in_fleet"))

		return
	end

	local var_1_8 = getProxy(ChapterProxy):getActiveChapter()

	if var_1_8 then
		_.each(var_1_8.fleets, function(arg_3_0)
			local var_3_0 = arg_3_0:getCommanders()

			if _.any(_.values(var_3_0), function(arg_4_0)
				return arg_4_0.id == var_1_1
			end) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_battle"))

				return
			end
		end)
	end

	local var_1_9 = 0
	local var_1_10 = 0
	local var_1_11 = CommanderCatUtil.CalcCommanderConsume(var_1_2)

	for iter_1_0, iter_1_1 in ipairs(var_1_2) do
		local var_1_12 = var_1_4:getCommanderById(iter_1_1)

		if not var_1_12 or var_1_1 == iter_1_1 then
			return
		end

		var_1_9 = var_1_9 + var_1_12:getDestoryedSkillExp(var_1_5.groupId)
		var_1_10 = var_1_10 + var_1_12:getDestoryedExp(var_1_5.groupId)
	end

	local var_1_13 = math.floor(var_1_10)
	local var_1_14 = math.floor(var_1_9)
	local var_1_15 = getProxy(PlayerProxy)
	local var_1_16 = var_1_15:getData()

	if var_1_11 > var_1_16.gold then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(25008, {
		targetid = var_1_1,
		materialid = var_1_2
	}, 25009, function(arg_5_0)
		if arg_5_0.result == 0 then
			local var_5_0 = Clone(var_1_5)

			var_1_5:addExp(var_1_13)
			var_1_6:addExp(var_1_14)
			var_1_16:consume({
				gold = var_1_11
			})
			var_1_15:updatePlayer(var_1_16)
			var_1_4:updateCommander(var_1_5)
			arg_1_0:sendNotification(GAME.COMMANDER_UPGRADE_DONE, {
				commander = var_1_5,
				oldCommander = var_5_0
			})

			for iter_5_0, iter_5_1 in ipairs(var_1_2) do
				var_1_4:removeCommanderById(iter_5_1)
				arg_1_0:clearActivityCommanders(iter_5_1)
			end

			getProxy(ChapterProxy):RemoveEliteFleetCommander(var_1_2)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_play_erro", arg_5_0.result))
		end
	end)
end

function var_0_0.clearActivityCommanders(arg_6_0, arg_6_1)
	getProxy(FleetProxy):removeActivityFleetCommander(arg_6_1)
end

return var_0_0
