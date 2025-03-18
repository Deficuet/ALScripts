local var_0_0 = class("SelectCommanderCatForPlayScene", import(".CommanderCatScene"))

function var_0_0.emit(arg_1_0, ...)
	if unpack({
		...
	}) == var_0_0.ON_BACK then
		var_0_0.super.emit(arg_1_0, var_0_0.ON_CLOSE)
	else
		var_0_0.super.emit(arg_1_0, ...)
	end
end

function var_0_0.didEnter(arg_2_0)
	local var_2_0 = arg_2_0.contextData.activeCommander

	arg_2_0.contextData.mode = var_0_0.MODE_SELECT
	arg_2_0.contextData.maxCount = 10
	arg_2_0.contextData.fleetType = CommanderCatScene.FLEET_TYPE_COMMON
	arg_2_0.contextData.activeGroupId = var_2_0.groupId
	arg_2_0.contextData.ignoredIds = {}

	table.insert(arg_2_0.contextData.ignoredIds, var_2_0.id)
	arg_2_0:CollectIgnoredIdsForPlay(arg_2_0.contextData.ignoredIds)

	function arg_2_0.contextData.onCommander(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		return arg_2_0:IsLegalForPlay(var_2_0, arg_3_0, arg_3_1, arg_3_2)
	end

	var_0_0.super.didEnter(arg_2_0)
end

function var_0_0.RegisterEvent(arg_4_0)
	var_0_0.super.RegisterEvent(arg_4_0)
	arg_4_0:bind(CommanderCatDockPage.ON_SORT, function(arg_5_0)
		onNextTick(function()
			local var_6_0 = arg_4_0.pages[CommanderCatScene.PAGE_DOCK]

			if var_6_0 and var_6_0:GetLoaded() then
				local var_6_1 = Clone(var_6_0.sortData)

				if arg_4_0.contextData.OnSort then
					arg_4_0.contextData.OnSort(var_6_1)
				end
			end
		end)
	end)
end

function var_0_0.CollectIgnoredIdsForPlay(arg_7_0, arg_7_1)
	local var_7_0 = getProxy(CommanderProxy):getRawData()

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		if iter_7_1:isLocked() then
			table.insert(arg_7_1, iter_7_1.id)
		end
	end

	local var_7_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_7_1 then
		_.each(var_7_1.fleets, function(arg_8_0)
			local var_8_0 = arg_8_0:getCommanders()

			for iter_8_0, iter_8_1 in pairs(var_8_0) do
				table.insert(arg_7_1, iter_8_1.id)
			end
		end)
	end
end

function var_0_0.IsLegalForPlay(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	if nowWorld():CheckCommanderInFleet(arg_9_2.id) then
		return false, i18n("commander_is_in_bigworld")
	end

	if arg_9_1:isMaxLevel() and not arg_9_1:isSameGroup(arg_9_2.groupId) then
		return false, i18n("commander_select_matiral_erro")
	end

	if getProxy(CommanderProxy):IsHome(arg_9_2.id) then
		return false, i18n("cat_sleep_notplay")
	end

	if not arg_9_0:CheckFormation(arg_9_2, arg_9_4, arg_9_3) then
		return false, nil
	end

	if not arg_9_0:CheckGuild(arg_9_2, arg_9_4, arg_9_3) then
		return false, nil
	end

	if not arg_9_0:CheckExtra(arg_9_2, arg_9_4, arg_9_3) then
		return false, nil
	end

	if not arg_9_0:CheckFullExp(arg_9_1, arg_9_2) and not arg_9_1:isSameGroup(arg_9_2.groupId) then
		return false, i18n("commander_exp_limit")
	end

	return true
end

function var_0_0.SimulateAddCommanderExp(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = Clone(arg_10_1)

	var_10_0:addExp(arg_10_2)

	return var_10_0, arg_10_1
end

function var_0_0.CheckFullExp(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {}
	local var_11_1 = arg_11_0.pages[CommanderCatScene.PAGE_DOCK]

	if var_11_1 and var_11_1.selectedList then
		var_11_0 = var_11_1.selectedList
	end

	local var_11_2, var_11_3 = CommanderCatUtil.GetSkillExpAndCommanderExp(arg_11_1, var_11_0)

	if arg_11_0:SimulateAddCommanderExp(arg_11_1, var_11_2):isMaxLevel() then
		return false
	end

	return true
end

function var_0_0.CheckFormation(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = getProxy(FleetProxy)
	local var_12_1 = var_12_0:getCommanders()
	local var_12_2 = _.detect(var_12_1, function(arg_13_0)
		return arg_12_1.id == arg_13_0.commanderId
	end)

	if not var_12_2 then
		return true
	end

	arg_12_0.contextData.msgBox:ExecuteAction("Show", {
		content = i18n("commander_material_is_in_fleet_tip"),
		onYes = function()
			pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				commanderId = 0,
				fleetId = var_12_2.fleetId,
				pos = var_12_2.pos,
				callback = function()
					var_12_1 = var_12_0:getCommanders()

					if arg_12_2 then
						arg_12_2()
					end
				end
			})
		end,
		onNo = arg_12_3,
		onClose = arg_12_3
	})

	return false
end

function var_0_0.CheckGuild(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = getProxy(GuildProxy):getRawData()

	if not var_16_0 or not var_16_0:ExistCommander(arg_16_1.id) then
		return true
	end

	arg_16_0.contextData.msgBox:ExecuteAction("Show", {
		content = i18n("commander_is_in_guild"),
		onYes = function()
			local var_17_0 = var_16_0:GetActiveEvent()

			if not var_17_0 then
				return
			end

			local var_17_1 = var_17_0:GetBossMission()

			if not var_17_1 or not var_17_1:IsActive() then
				return
			end

			local var_17_2 = var_17_1:GetFleetCommanderId(arg_16_1.id)

			if not var_17_2 then
				return
			end

			local var_17_3 = Clone(var_17_2)
			local var_17_4 = var_17_3:GetCommanderPos(arg_16_1.id)

			if not var_17_4 then
				return
			end

			var_17_3:RemoveCommander(var_17_4)
			pg.m02:sendNotification(GAME.GUILD_UPDATE_BOSS_FORMATION, {
				force = true,
				editFleet = {
					[var_17_3.id] = var_17_3
				},
				callback = arg_16_2
			})
		end,
		onNo = arg_16_3,
		onClose = arg_16_3
	})

	return false
end

function var_0_0.CheckExtra(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = getProxy(FleetProxy)
	local var_18_1 = var_18_0:getCommanders()
	local var_18_2 = var_18_0:GetExtraCommanders()
	local var_18_3 = _.detect(var_18_2, function(arg_19_0)
		return arg_18_1.id == arg_19_0.commanderId
	end)

	if not var_18_3 then
		return true
	end

	arg_18_0.contextData.msgBox:ExecuteAction("Show", {
		content = i18n("commander_material_is_in_fleet_tip"),
		onYes = function()
			pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				commanderId = 0,
				fleetId = var_18_3.fleetId,
				pos = var_18_3.pos,
				callback = function()
					var_18_1 = var_18_0:getCommanders()

					if arg_18_2 then
						arg_18_2()
					end
				end
			})
		end,
		onNo = arg_18_3,
		onClose = arg_18_3
	})

	return false
end

return var_0_0
