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
var_0_0.CHAT_MSG_UPDATE = "IslandProxy:CHAT_MSG_UPDATE"

function var_0_0.register(arg_1_0)
	arg_1_0.cahce = {}
	arg_1_0.giftCache = {}
	arg_1_0.chatMsgs = {}
	arg_1_0.reconnectProcessing = false
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

function var_0_0.SetReconnectProcessing(arg_3_0, arg_3_1)
	arg_3_0.reconnectProcessing = arg_3_1 and true or false

	warning("IslandProxy:SetReconnectProcessing", arg_3_0.reconnectProcessing)
end

function var_0_0.IsReconnectProcessing(arg_4_0)
	return arg_4_0.reconnectProcessing == true
end

function var_0_0.AddChatMsg(arg_5_0, arg_5_1, arg_5_2)
	if not arg_5_0.chatMsgs[arg_5_1] then
		arg_5_0.chatMsgs[arg_5_1] = {}
	end

	table.insert(arg_5_0.chatMsgs[arg_5_1], arg_5_2)
	arg_5_0:sendNotification(IslandProxy.CHAT_MSG_UPDATE, {
		islandId = arg_5_1,
		msg = arg_5_2
	})
end

function var_0_0.GetChatMsgList(arg_6_0, arg_6_1)
	return arg_6_0.chatMsgs[arg_6_1] or {}
end

function var_0_0.SetIsland(arg_7_0, arg_7_1)
	arg_7_0.island = arg_7_1
end

function var_0_0.GetIsland(arg_8_0)
	return arg_8_0.island
end

function var_0_0.remove(arg_9_0)
	arg_9_0.island = nil
end

function var_0_0.ShouldTip(arg_10_0)
	local function var_10_0()
		local var_11_0 = arg_10_0:GetIsland()

		return var_11_0 and var_11_0:CanLevelUp()
	end

	local function var_10_1()
		local var_12_0 = arg_10_0:GetIsland()

		return var_12_0 and var_12_0:AnyProsperityAwardCanGet()
	end

	return var_10_0() or var_10_1()
end

function var_0_0.AddPlayerDataCache(arg_13_0, arg_13_1)
	arg_13_0.cahce[arg_13_1.id] = arg_13_1
end

function var_0_0.GetPlayerDataCache(arg_14_0, arg_14_1)
	return arg_14_0.cahce[arg_14_1]
end

function var_0_0.ClearAllPlayerDataCache(arg_15_0)
	arg_15_0.cahce = {}
end

function var_0_0.AddGiftTagInfoCache(arg_16_0, arg_16_1)
	arg_16_0.giftCache[arg_16_1.playerId] = arg_16_1
end

function var_0_0.GetGiftTagInfoCache(arg_17_0, arg_17_1)
	return arg_17_0.giftCache[arg_17_1]
end

function var_0_0.UpdateGiftTagCache(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0:GetGiftTagInfoCache(arg_18_1)

	if var_18_0 then
		var_18_0:Flush(arg_18_2, arg_18_3)
	else
		local var_18_1 = IslandGiftTagInfo.New({
			key = arg_18_1,
			value1 = arg_18_3,
			value2 = arg_18_2
		})

		arg_18_0:AddGiftTagInfoCache(var_18_1)
	end
end

function var_0_0.ClearAllGiftTagInfo(arg_19_0)
	arg_19_0.giftCache = {}
end

function var_0_0.SetSharedIsland(arg_20_0, arg_20_1)
	arg_20_0.sharedIsland = arg_20_1
end

function var_0_0.GetSharedIsland(arg_21_0)
	return arg_21_0.sharedIsland
end

function var_0_0.SetSyncObjInitData(arg_22_0, arg_22_1)
	arg_22_0.syncObjInitData = arg_22_1
end

function var_0_0.GetSyncObjInitData(arg_23_0)
	return arg_23_0.syncObjInitData and arg_23_0.syncObjInitData or {}
end

function var_0_0.timeCall(arg_24_0)
	return {
		[ProxyRegister.SecondCall] = function(arg_25_0)
			if not arg_24_0.island then
				return
			end

			arg_24_0.island:UpdatePerSecond()

			if not arg_24_0.sharedIsland then
				return
			end

			arg_24_0.sharedIsland:UpdatePerSecond()
		end,
		[ProxyRegister.HourCall] = function(arg_26_0)
			if not arg_24_0.island then
				return
			end

			arg_24_0.island:UpdatePerHour(arg_26_0)

			if not arg_24_0.sharedIsland then
				return
			end

			arg_24_0.sharedIsland:UpdatePerHour(arg_26_0)
		end,
		[ProxyRegister.DayCall] = function(arg_27_0)
			if not arg_24_0.island then
				return
			end

			arg_24_0.island:UpdatePerDay()
		end
	}
end

function var_0_0.RecordEnterTime(arg_28_0)
	arg_28_0.enterTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetEnterTime(arg_29_0)
	return arg_29_0.enterTimeStamp
end

function var_0_0.RecordTempPlayerPosition(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	arg_30_0.tempPlayerPosition = {
		arg_30_1,
		arg_30_2,
		arg_30_3
	}
end

function var_0_0.GetTempPlayerPosition(arg_31_0)
	return arg_31_0.tempPlayerPosition
end

function var_0_0.EnterIsland(arg_32_0, arg_32_1)
	arg_32_0.islandHeartBeatMgr:EnterIsland(arg_32_1)
end

function var_0_0.ExitIsland(arg_33_0)
	arg_33_0.islandHeartBeatMgr:ExitIsland()
end

function var_0_0.remove(arg_34_0)
	arg_34_0.islandHeartBeatMgr:Dispose()

	arg_34_0.islandHeartBeatMgr = nil
end

return var_0_0
