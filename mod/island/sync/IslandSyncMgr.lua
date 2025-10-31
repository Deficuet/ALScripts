local var_0_0 = class("IslandSyncMgr")

var_0_0.ISLAND_SYNC_DATA_UPDATE = "IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE"
var_0_0.ISLAND_SYNC_OBJ_UPDATE = "IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE"

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.controlResultDic = {}
	arg_1_0.visitorDic = {}
	arg_1_0.unitDic = {}
	arg_1_0.controller = arg_1_1
	arg_1_0.island = arg_1_1.island
	arg_1_0.view = arg_1_1:GetCore().view
	arg_1_0.playerId = getProxy(PlayerProxy):getPlayerId()
	arg_1_0.syncDataDelayedProcessor = DelayedDataProcessor.New(IslandConst.SYNC_TIME_DELAY, IslandConst.SYNC_TIME_INTERVAL * 1000, function(arg_2_0)
		arg_1_0:UpdateVisitorSyncData(arg_2_0)
	end)
	arg_1_0.syncObjDelayedProcessor = DelayedDataProcessor.New(IslandConst.SYNC_TIME_DELAY, IslandConst.SYNC_TIME_INTERVAL * 1000, function(arg_3_0)
		arg_1_0:UpdateSyncObj(arg_3_0)
	end)
	arg_1_0.collectClientStateTimer = Timer.New(function()
		arg_1_0:UpdateLocalPlayer()
	end, IslandConst.SYNC_TIME_INTERVAL, -1)
end

function var_0_0.Op(arg_5_0, arg_5_1, ...)
	arg_5_0.controller:Receive(arg_5_1, ...)
end

function var_0_0.Init(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:InitPlayer()
	arg_6_0:InitVisitor()
	arg_6_0:InitAgora(arg_6_2 or {})
	arg_6_0:InitWorldObject(arg_6_1)
	arg_6_0:InitSyncObj()
	arg_6_0.collectClientStateTimer:Start()
end

function var_0_0.Update(arg_7_0)
	xpcall(function()
		arg_7_0.syncDataDelayedProcessor:Update()
		arg_7_0.syncObjDelayedProcessor:Update()
	end, function(...)
		errorMsg(debug.traceback(...))
	end)
end

function var_0_0.IsPlayerInTimeline(arg_10_0)
	return arg_10_0.player and arg_10_0.player:InTimeline()
end

function var_0_0.InitPlayer(arg_11_0)
	arg_11_0.player = SyncLocalPlayer.New(arg_11_0.playerId, arg_11_0.view.player)
end

function var_0_0.InitVisitor(arg_12_0)
	local var_12_0 = arg_12_0.island:GetVisitorAgency():GetMapVisitorList()

	for iter_12_0, iter_12_1 in pairs(var_12_0) do
		local var_12_1 = arg_12_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, iter_12_1.id)

		arg_12_0.visitorDic[iter_12_1.id] = SyncUnitVisitor.New(var_12_1)
	end
end

function var_0_0.OnVisitorEnter(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.visitorDic[arg_13_1] = SyncUnitVisitor.New(arg_13_2)
end

function var_0_0.OnVisitorExit(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.visitorDic[arg_14_1]

	if var_14_0 then
		local var_14_1 = var_14_0:GetLastInteract()

		if var_14_1 then
			arg_14_0:GetUnit(var_14_1.type, var_14_1.id):RemoveOwner(arg_14_1)

			if var_14_1.type == IslandConst.SYNC_TYPE_AGORA then
				arg_14_0:Op("InterActionEndSync", var_14_1.id, arg_14_1)
			elseif var_14_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
				arg_14_0:Op("WorldObjectInterActionEndSync", var_14_1.id, arg_14_1)
			end
		end

		arg_14_0.syncDataDelayedProcessor:RemoveDataById(arg_14_1)
		var_14_0:Dispose()

		arg_14_0.visitorDic[arg_14_1] = nil
	end
end

function var_0_0.UpdateLocalPlayer(arg_15_0)
	if table.getCount(arg_15_0.visitorDic) <= 1 then
		return
	end

	local var_15_0 = {}

	if arg_15_0.player:IsLoaded() and not arg_15_0.player:InTimeline() then
		local var_15_1 = arg_15_0.player:CreateSyncData()

		table.insert(var_15_0, var_15_1)
	end

	if #var_15_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_SYNC_DATA, {
			data = var_15_0,
			islandId = arg_15_0.island.id
		})
	end
end

function var_0_0.HandleSyncData(arg_16_0, arg_16_1)
	_.each(arg_16_1, function(arg_17_0)
		local var_17_0 = arg_17_0.id

		arg_16_0.syncDataDelayedProcessor:Add(var_17_0, arg_17_0)
	end)
end

function var_0_0.UpdateVisitorSyncData(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.id

	if not arg_18_0.visitorDic[var_18_0] then
		Debugger.LogWarning(string.format("访客不存在 id=%d", var_18_0))

		return
	end

	arg_18_0:Op("SetVisitorSyncData", var_18_0, arg_18_1)
end

function var_0_0.SyncVisitorExist(arg_19_0, arg_19_1)
	return arg_19_0.visitorDic[arg_19_1] ~= nil
end

function var_0_0.InitAgora(arg_20_0, arg_20_1)
	local var_20_0 = {}

	for iter_20_0, iter_20_1 in pairs(arg_20_1) do
		var_20_0[iter_20_0] = SyncUnitInteract.New(iter_20_0, IslandConst.SYNC_TYPE_AGORA)
	end

	arg_20_0.unitDic[IslandConst.SYNC_TYPE_AGORA] = var_20_0
end

function var_0_0.CancelAgoraInteract(arg_21_0)
	local var_21_0 = arg_21_0.unitDic[IslandConst.SYNC_TYPE_AGORA]

	if not var_21_0 then
		return
	end

	for iter_21_0, iter_21_1 in pairs(var_21_0) do
		if iter_21_1:OwnerCount() > 0 then
			for iter_21_2, iter_21_3 in pairs(iter_21_1.owners) do
				arg_21_0:Op("InterActionEndSync", iter_21_0, iter_21_3)

				if iter_21_3 == arg_21_0.playerId then
					arg_21_0.player:SetInTimeline(false)
				end
			end
		end
	end
end

function var_0_0.ResumeAgoraInteract(arg_22_0)
	local var_22_0 = arg_22_0.unitDic[IslandConst.SYNC_TYPE_AGORA]

	if not var_22_0 then
		return
	end

	for iter_22_0, iter_22_1 in pairs(var_22_0) do
		if iter_22_1:OwnerCount() > 0 then
			for iter_22_2, iter_22_3 in pairs(iter_22_1.owners) do
				arg_22_0:Op("InterActionSync", iter_22_0, iter_22_3, iter_22_2)
			end
		end
	end
end

function var_0_0.ClearAgoraInteractData(arg_23_0)
	arg_23_0.unitDic[IslandConst.SYNC_TYPE_AGORA] = {}
end

function var_0_0.InitWorldObject(arg_24_0, arg_24_1)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in ipairs(arg_24_1) do
		if iter_24_1.type == IslandConst.UNIT_TYPE_ITEM_INTERACT then
			var_24_0[iter_24_1.id] = SyncUnitInteract.New(iter_24_1.id, IslandConst.SYNC_TYPE_UNIT_STATIC)
		end
	end

	arg_24_0.unitDic[IslandConst.SYNC_TYPE_UNIT_STATIC] = var_24_0
end

function var_0_0.InitSyncObj(arg_25_0)
	local var_25_0 = getProxy(IslandProxy):GetSyncObjInitData()

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		local var_25_1 = arg_25_0:GetUnit(iter_25_1.type, iter_25_1.id)

		if var_25_1 then
			var_25_1:InitOwner(iter_25_1.slots)

			if iter_25_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
				if var_25_1:OwnerCount() > 0 then
					for iter_25_2, iter_25_3 in pairs(var_25_1.owners) do
						if iter_25_3 ~= arg_25_0.playerId and arg_25_0.visitorDic[iter_25_3] then
							arg_25_0.visitorDic[iter_25_3]:RecordLastInteract(iter_25_1.id, iter_25_1.type)
							arg_25_0:Op("WorldObjectInterActionSync", iter_25_1.id, iter_25_3, iter_25_1.status, iter_25_2)
						end
					end
				elseif iter_25_1.status > 0 then
					arg_25_0:Op("WorldObjectInitStatus", iter_25_1.id, iter_25_1.status)
				end
			elseif iter_25_1.type == IslandConst.SYNC_TYPE_AGORA and var_25_1:OwnerCount() > 0 then
				for iter_25_4, iter_25_5 in pairs(var_25_1.owners) do
					if iter_25_5 ~= arg_25_0.playerId and arg_25_0.visitorDic[iter_25_5] then
						arg_25_0.visitorDic[iter_25_5]:RecordLastInteract(iter_25_1.id, iter_25_1.type)
						arg_25_0:Op("InterActionSync", iter_25_1.id, iter_25_5, iter_25_4)
					end
				end
			end
		end
	end
end

function var_0_0.GetUnit(arg_26_0, arg_26_1, arg_26_2)
	if not arg_26_0.unitDic[arg_26_1] then
		return nil
	end

	return arg_26_0.unitDic[arg_26_1][arg_26_2]
end

function var_0_0.HandleSyncObj(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in ipairs(arg_27_1) do
		arg_27_0.syncObjDelayedProcessor:Add(iter_27_1.id, iter_27_1)
	end
end

function var_0_0.UpdateSyncObj(arg_28_0, arg_28_1)
	if arg_28_1.type == IslandConst.SYNC_TYPE_AGORA then
		arg_28_0:OnVisitorInteract(arg_28_1, function(arg_29_0, arg_29_1)
			if not arg_28_0:SyncVisitorExist(arg_29_0) then
				return
			end

			arg_28_0:Op("InterActionSync", arg_28_1.id, arg_29_0, arg_29_1)
		end, function(arg_30_0)
			arg_28_0:Op("InterActionEndSync", arg_28_1.id, arg_30_0)
		end)
	elseif arg_28_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
		arg_28_0:OnVisitorInteract(arg_28_1, function(arg_31_0, arg_31_1)
			local var_31_0 = arg_28_0:GetUnit(arg_28_1.type, arg_28_1.id)

			if not var_31_0 then
				return
			end

			var_31_0:SetStatus(arg_28_1.status)

			if not arg_28_0:SyncVisitorExist(arg_31_0) then
				return
			end

			arg_28_0:Op("WorldObjectInterActionSync", arg_28_1.id, arg_31_0, arg_28_1.status, arg_31_1)
		end, function(arg_32_0)
			arg_28_0:Op("WorldObjectInterActionEndSync", arg_28_1.id, arg_32_0)
		end)
	end
end

function var_0_0.OnVisitorInteract(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = arg_33_0:GetUnit(arg_33_1.type, arg_33_1.id)

	if not var_33_0 then
		return
	end

	local var_33_1, var_33_2, var_33_3 = var_33_0:UpdateOwner(arg_33_1.slots)

	if var_33_2 == arg_33_0.playerId then
		return
	end

	local var_33_4 = arg_33_0.visitorDic[var_33_2]

	if not var_33_4 then
		Debugger.LogWarning(string.format("访客不存在 id=%d", var_33_2))

		return
	end

	if var_33_1 then
		var_33_4:RecordLastInteract(arg_33_1.id, arg_33_1.type)
		arg_33_2(var_33_2, var_33_3)
	else
		var_33_4:ClearLastInteract()
		arg_33_3(var_33_2)
	end
end

function var_0_0.TryControlUnit(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4, arg_34_5)
	if arg_34_0:IsPlayerInTimeline() then
		arg_34_5(false)

		return
	end

	local var_34_0 = arg_34_0:GetUnit(arg_34_1, arg_34_2)

	arg_34_0:ControlUnit(arg_34_2, arg_34_3, 1, arg_34_4, arg_34_1, function(arg_35_0)
		if arg_35_0 then
			arg_34_0.player:SetInTimeline(true)
			var_34_0:SetStatus(arg_34_4)
		end

		arg_34_5(arg_35_0)
	end)
end

function var_0_0.EndControlUnit(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	local var_36_0 = arg_36_0:GetUnit(arg_36_1, arg_36_2)

	arg_36_0:ControlUnit(arg_36_2, arg_36_3, 0, var_36_0:GetStatus(), arg_36_1, function(arg_37_0)
		if arg_37_0 then
			arg_36_0.player:SetInTimeline(false)
		end

		arg_36_4(arg_37_0)
	end)
end

function var_0_0.ControlUnit(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4, arg_38_5, arg_38_6)
	if arg_38_0.controlResultDic[arg_38_1] then
		arg_38_6(false)

		return
	end

	arg_38_0.controlResultDic[arg_38_1] = arg_38_6

	pg.m02:sendNotification(GAME.ISLAND_SYNC_CONTROL, {
		islandId = arg_38_0.island.id,
		objId = arg_38_1,
		slotId = arg_38_2,
		op = arg_38_3,
		status = arg_38_4,
		type = arg_38_5,
		onResult = function(arg_39_0)
			local var_39_0 = arg_39_0 == 0

			existCall(arg_38_0.controlResultDic[arg_38_1], var_39_0)

			arg_38_0.controlResultDic[arg_38_1] = nil
		end
	})
end

function var_0_0.Dispose(arg_40_0)
	arg_40_0.collectClientStateTimer:Stop()
end

return var_0_0
