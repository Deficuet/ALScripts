local var_0_0 = class("IslandProxy", import("model.proxy.NetProxy"))

var_0_0.STORY_START = "IslandProxy:STORY_START"
var_0_0.STORY_END = "IslandProxy:STORY_END"
var_0_0.PERFORMANCE_START = "IslandProxy:PERFORMANCE_START"
var_0_0.PERFORMANCE_END = "IslandProxy:PERFORMANCE_END"
var_0_0.START_PATHFINDER = "IslandProxy:START_PATHFINDER"
var_0_0.END_PATHFINDER = "IslandProxy:END_PATHFINDER"
var_0_0.ACTIVE_OR_DISABLE_UNIT = "IslandProxy:ACTIVE_OR_DISABLE_UNIT"
var_0_0.LINK_CORE = "IslandProxy:LINK_CORE"
var_0_0.GEN_RECYCLEITEM = "IslandProxy:GEN_RECYCLEITEM"
var_0_0.LOCK_NPC_REFRESH = "IslandProxy:LOCK_NPC_REFRESH"
var_0_0.RELEASE_NPC_REFRESH = "IslandProxy:RELEASE_NPC_REFRESH"
var_0_0.RESET_SP = "IslandProxy:RESET_SP"
var_0_0.PRESS_BACK = "IslandProxy:PRESS_BACK"
var_0_0.CHAT_MSG_UPDATE = "IslandProxy:CHAT_MSG_UPDATE"

function var_0_0.register(arg_1_0)
	arg_1_0.cahce = {}
	arg_1_0.giftCache = {}
	arg_1_0.chatMsgs = {}
	arg_1_0.islandHeartBeatMgr = IslandHeartBeatMgr.New()

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

function var_0_0.AddChatMsg(arg_3_0, arg_3_1, arg_3_2)
	if not arg_3_0.chatMsgs[arg_3_1] then
		arg_3_0.chatMsgs[arg_3_1] = {}
	end

	table.insert(arg_3_0.chatMsgs[arg_3_1], arg_3_2)
	arg_3_0:sendNotification(IslandProxy.CHAT_MSG_UPDATE, {
		islandId = arg_3_1,
		msg = arg_3_2
	})
end

function var_0_0.GetChatMsgList(arg_4_0, arg_4_1)
	return arg_4_0.chatMsgs[arg_4_1] or {}
end

function var_0_0.SetIsland(arg_5_0, arg_5_1)
	arg_5_0.island = arg_5_1
end

function var_0_0.GetIsland(arg_6_0)
	return arg_6_0.island
end

function var_0_0.ShouldTip(arg_7_0)
	local function var_7_0()
		local var_8_0 = arg_7_0:GetIsland()

		return var_8_0 and var_8_0:CanLevelUp()
	end

	local function var_7_1()
		local var_9_0 = arg_7_0:GetIsland()

		return var_9_0 and var_9_0:AnyProsperityAwardCanGet()
	end

	return var_7_0() or var_7_1()
end

function var_0_0.AddPlayerDataCache(arg_10_0, arg_10_1)
	arg_10_0.cahce[arg_10_1.id] = arg_10_1
end

function var_0_0.GetPlayerDataCache(arg_11_0, arg_11_1)
	return arg_11_0.cahce[arg_11_1]
end

function var_0_0.ClearAllPlayerDataCache(arg_12_0)
	arg_12_0.cahce = {}
end

function var_0_0.AddGiftTagInfoCache(arg_13_0, arg_13_1)
	arg_13_0.giftCache[arg_13_1.playerId] = arg_13_1
end

function var_0_0.GetGiftTagInfoCache(arg_14_0, arg_14_1)
	return arg_14_0.giftCache[arg_14_1]
end

function var_0_0.UpdateGiftTagCache(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_0:GetGiftTagInfoCache(arg_15_1)

	if var_15_0 then
		var_15_0:Flush(arg_15_2, arg_15_3)
	else
		local var_15_1 = IslandGiftTagInfo.New({
			key = arg_15_1,
			value1 = arg_15_3,
			value2 = arg_15_2
		})

		arg_15_0:AddGiftTagInfoCache(var_15_1)
	end
end

function var_0_0.ClearAllGiftTagInfo(arg_16_0)
	arg_16_0.giftCache = {}
end

function var_0_0.SetSharedIsland(arg_17_0, arg_17_1)
	arg_17_0.sharedIsland = arg_17_1
end

function var_0_0.GetSharedIsland(arg_18_0)
	return arg_18_0.sharedIsland
end

function var_0_0.timeCall(arg_19_0)
	return {
		[ProxyRegister.SecondCall] = function(arg_20_0)
			if not arg_19_0.island then
				return
			end

			arg_19_0.island:UpdatePerSecond()

			if not arg_19_0.sharedIsland then
				return
			end

			arg_19_0.sharedIsland:UpdatePerSecond()
		end,
		[ProxyRegister.HourCall] = function(arg_21_0)
			if not arg_19_0.island then
				return
			end

			arg_19_0.island:UpdatePerHour(arg_21_0)

			if not arg_19_0.sharedIsland then
				return
			end

			arg_19_0.sharedIsland:UpdatePerHour(arg_21_0)
		end,
		[ProxyRegister.DayCall] = function(arg_22_0)
			if not arg_19_0.island then
				return
			end

			arg_19_0.island:UpdatePerDay()
		end
	}
end

function var_0_0.RecordEnterTime(arg_23_0)
	arg_23_0.enterTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetEnterTime(arg_24_0)
	return arg_24_0.enterTimeStamp
end

function var_0_0.RecordTempPlayerPosition(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	arg_25_0.tempPlayerPosition = {
		arg_25_1,
		arg_25_2,
		arg_25_3
	}
end

function var_0_0.GetTempPlayerPosition(arg_26_0)
	return arg_26_0.tempPlayerPosition
end

function var_0_0.EnterIsland(arg_27_0, arg_27_1)
	arg_27_0.islandHeartBeatMgr:EnterIsland(arg_27_1)
end

function var_0_0.ExitIsland(arg_28_0)
	arg_28_0.islandHeartBeatMgr:ExitIsland()
end

function var_0_0.remove(arg_29_0)
	arg_29_0.island = nil

	arg_29_0.islandHeartBeatMgr:Dispose()

	arg_29_0.islandHeartBeatMgr = nil
end

return var_0_0
