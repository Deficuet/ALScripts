local var_0_0 = class("IslandProxy", import("model.proxy.NetProxy"))

var_0_0.STORY_START = "IslandProxy:STORY_START"
var_0_0.STORY_END = "IslandProxy:STORY_END"
var_0_0.PERFORMANCE_START = "IslandProxy:PERFORMANCE_START"
var_0_0.PERFORMANCE_END = "IslandProxy:PERFORMANCE_END"
var_0_0.START_PATHFINDER = "IslandProxy:START_PATHFINDER"
var_0_0.END_PATHFINDER = "IslandProxy:END_PATHFINDER"
var_0_0.ACTIVE_OR_DISABLE_UNIT = "IslandProxy:ACTIVE_OR_DISABLE_UNIT"
var_0_0.LINK_CORE = "IslandProxy:LINK_CORE"

function var_0_0.register(arg_1_0)
	arg_1_0.cahce = {}
	arg_1_0.giftCache = {}
	arg_1_0.islandHeartBeatMgr = IslandHearBeatMgr.New()

	arg_1_0:on(21216, function(arg_2_0)
		local var_2_0 = arg_1_0:GetIsland()

		if not var_2_0 then
			return
		end

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.visitor_list) do
			local var_2_1 = IslandVisitorLog.New(iter_2_1)

			if not var_2_1:IsSelf() then
				var_2_0:GetAccessAgency():AddVisitorLog(var_2_1)
				pg.IslandVisitorNotificationMgr.GetInstance():Enqueue(var_2_1)
			end
		end
	end)
end

function var_0_0.SetIsland(arg_3_0, arg_3_1)
	arg_3_0.island = arg_3_1
end

function var_0_0.GetIsland(arg_4_0)
	return arg_4_0.island
end

function var_0_0.remove(arg_5_0)
	arg_5_0.island = nil
end

function var_0_0.ShouldTip(arg_6_0)
	local function var_6_0()
		local var_7_0 = arg_6_0:GetIsland()

		return var_7_0 and var_7_0:CanLevelUp()
	end

	local function var_6_1()
		local var_8_0 = arg_6_0:GetIsland()

		return var_8_0 and var_8_0:AnyProsperityAwardCanGet()
	end

	return var_6_0() or var_6_1()
end

function var_0_0.AddPlayerDataCache(arg_9_0, arg_9_1)
	arg_9_0.cahce[arg_9_1.id] = arg_9_1
end

function var_0_0.GetPlayerDataCache(arg_10_0, arg_10_1)
	return arg_10_0.cahce[arg_10_1]
end

function var_0_0.ClearAllPlayerDataCache(arg_11_0)
	arg_11_0.cahce = {}
end

function var_0_0.AddGiftTagInfoCache(arg_12_0, arg_12_1)
	arg_12_0.giftCache[arg_12_1.playerId] = arg_12_1
end

function var_0_0.GetGiftTagInfoCache(arg_13_0, arg_13_1)
	return arg_13_0.giftCache[arg_13_1]
end

function var_0_0.UpdateGiftTagCache(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_0:GetGiftTagInfoCache(arg_14_1)

	if var_14_0 then
		var_14_0:Flush(arg_14_2, arg_14_3)
	else
		local var_14_1 = IslandGiftTagInfo.New({
			key = arg_14_1,
			value1 = arg_14_3,
			value2 = arg_14_2
		})

		arg_14_0:AddGiftTagInfoCache(var_14_1)
	end
end

function var_0_0.ClearAllGiftTagInfo(arg_15_0)
	arg_15_0.giftCache = {}
end

function var_0_0.SetSharedIsland(arg_16_0, arg_16_1)
	arg_16_0.sharedIsland = arg_16_1
end

function var_0_0.GetSharedIsland(arg_17_0)
	return arg_17_0.sharedIsland
end

function var_0_0.SetSyncObjInitData(arg_18_0, arg_18_1)
	arg_18_0.syncObjInitData = arg_18_1
end

function var_0_0.GetSyncObjInitData(arg_19_0)
	return arg_19_0.syncObjInitData and arg_19_0.syncObjInitData or {}
end

function var_0_0.timeCall(arg_20_0)
	return {
		[ProxyRegister.SecondCall] = function(arg_21_0)
			if not arg_20_0.island then
				return
			end

			arg_20_0.island:UpdatePerSecond()

			if not arg_20_0.sharedIsland then
				return
			end

			arg_20_0.sharedIsland:UpdatePerSecond()
		end,
		[ProxyRegister.DayCall] = function(arg_22_0)
			if not arg_20_0.island then
				return
			end

			arg_20_0.island:UpdatePerDay()
		end
	}
end

function var_0_0.RecordEnterTime(arg_23_0)
	arg_23_0.enterTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetEnterTime(arg_24_0)
	return arg_24_0.enterTimeStamp
end

function var_0_0.EnterIsland(arg_25_0, arg_25_1)
	arg_25_0.islandHeartBeatMgr:EnterIsland(arg_25_1)
end

function var_0_0.ExitIsland(arg_26_0)
	arg_26_0.islandHeartBeatMgr:ExitIsland()
end

function var_0_0.remove(arg_27_0)
	arg_27_0.islandHeartBeatMgr:Dispose()

	arg_27_0.islandHeartBeatMgr = nil
end

return var_0_0
