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

function var_0_0.Init(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:InitPlayer()
	arg_5_0:InitVisitor()
	arg_5_0:InitAgora(arg_5_2 or {})
	arg_5_0:InitWorldObject(arg_5_1)
	arg_5_0:InitSyncObj()
	arg_5_0.collectClientStateTimer:Start()
end

function var_0_0.Update(arg_6_0)
	xpcall(function()
		arg_6_0.syncDataDelayedProcessor:Update()
		arg_6_0.syncObjDelayedProcessor:Update()
		arg_6_0:UpdateVisitorUnit()
	end, function(...)
		errorMsg(debug.traceback(...))
	end)
end

function var_0_0.InitPlayer(arg_9_0)
	arg_9_0.player = SyncLocalPlayer.New(arg_9_0.playerId, arg_9_0.view.player)
end

function var_0_0.InitVisitor(arg_10_0)
	local var_10_0 = arg_10_0.island:GetVisitorAgency():GetMapVisitorList()

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		local var_10_1 = arg_10_0.view:GetUnitModule(iter_10_1.id)

		arg_10_0.visitorDic[iter_10_1.id] = SyncUnitVisitor.New(var_10_1)
	end
end

function var_0_0.OnVisitorEnter(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.visitorDic[arg_11_1] = SyncUnitVisitor.New(arg_11_2)
end

function var_0_0.OnVisitorExit(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.visitorDic[arg_12_1]

	if var_12_0 then
		local var_12_1 = var_12_0:GetLastInteract()

		if var_12_1 then
			arg_12_0:GetUnit(var_12_1.type, var_12_1.id):RemoveOwner(arg_12_1)

			if var_12_1.type == IslandConst.SYNC_TYPE_AGORA then
				arg_12_0.controller:InterActionEnd(var_12_1.id, arg_12_1, true)
			elseif var_12_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
				arg_12_0.controller:WorldObjectInterActionEnd(var_12_1.id, arg_12_1, true)
			end
		end

		arg_12_0.syncDataDelayedProcessor:RemoveDataById(arg_12_1)
		var_12_0:Dispose()

		arg_12_0.visitorDic[arg_12_1] = nil
	end
end

function var_0_0.UpdateLocalPlayer(arg_13_0)
	local var_13_0 = {}

	if arg_13_0.player:IsLoaded() and not arg_13_0.player:InTimeline() then
		local var_13_1 = arg_13_0.player:CreateSyncData()

		table.insert(var_13_0, var_13_1)
	end

	if #var_13_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_SYNC_DATA, {
			data = var_13_0,
			islandId = arg_13_0.island.id
		})
	end
end

function var_0_0.UpdateVisitorUnit(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.visitorDic) do
		iter_14_1:Update()
	end
end

function var_0_0.HandleSyncData(arg_15_0, arg_15_1)
	_.each(arg_15_1, function(arg_16_0)
		local var_16_0 = arg_16_0.id

		arg_15_0.syncDataDelayedProcessor:Add(var_16_0, arg_16_0)
	end)
end

function var_0_0.UpdateVisitorSyncData(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.id
	local var_17_1 = arg_17_0.visitorDic[var_17_0]

	if not var_17_1 then
		return
	end

	var_17_1:UpdateSyncData(arg_17_1)
end

function var_0_0.SyncVisitorExist(arg_18_0, arg_18_1)
	return arg_18_0.visitorDic[arg_18_1] ~= nil
end

function var_0_0.InitAgora(arg_19_0, arg_19_1)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_1) do
		var_19_0[iter_19_0] = SyncUnitInteract.New(iter_19_0, IslandConst.SYNC_TYPE_AGORA)
	end

	arg_19_0.unitDic[IslandConst.SYNC_TYPE_AGORA] = var_19_0
end

function var_0_0.OnClearAgora(arg_20_0)
	return
end

function var_0_0.InitWorldObject(arg_21_0, arg_21_1)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
		if iter_21_1.type == IslandConst.UNIT_TYPE_ITEM_INTERACT then
			var_21_0[iter_21_1.id] = SyncUnitInteract.New(iter_21_1.id, IslandConst.SYNC_TYPE_UNIT_STATIC)
		end
	end

	arg_21_0.unitDic[IslandConst.SYNC_TYPE_UNIT_STATIC] = var_21_0
end

function var_0_0.InitSyncObj(arg_22_0)
	local var_22_0 = getProxy(IslandProxy):GetSyncObjInitData()

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		local var_22_1 = arg_22_0:GetUnit(iter_22_1.type, iter_22_1.id)

		if var_22_1 then
			var_22_1:InitOwner(iter_22_1.slots)

			if iter_22_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
				if var_22_1:OwnerCount() > 0 then
					for iter_22_2, iter_22_3 in pairs(var_22_1.owners) do
						if iter_22_3 ~= arg_22_0.playerId then
							arg_22_0.controller:WorldObjectInterAction(iter_22_1.tid, iter_22_3, iter_22_1.status, true)
						end
					end
				elseif iter_22_1.status > 0 then
					arg_22_0.controller:WorldObjectInitStatus(iter_22_1.tid, iter_22_1.status)
				end
			elseif iter_22_1.type == IslandConst.SYNC_TYPE_AGORA and var_22_1:OwnerCount() > 0 then
				for iter_22_4, iter_22_5 in pairs(var_22_1.owners) do
					if iter_22_5 ~= arg_22_0.playerId then
						arg_22_0.controller:InterAction(iter_22_1.tid, iter_22_5, true)
					end
				end
			end
		end
	end
end

function var_0_0.GetUnit(arg_23_0, arg_23_1, arg_23_2)
	if not arg_23_0.unitDic[arg_23_1] then
		return nil
	end

	return arg_23_0.unitDic[arg_23_1][arg_23_2]
end

function var_0_0.HandleSyncObj(arg_24_0, arg_24_1)
	for iter_24_0, iter_24_1 in ipairs(arg_24_1) do
		arg_24_0.syncObjDelayedProcessor:Add(iter_24_1.id, iter_24_1)
	end
end

function var_0_0.UpdateSyncObj(arg_25_0, arg_25_1)
	if arg_25_1.type == IslandConst.SYNC_TYPE_AGORA then
		arg_25_0:OnVisitorInteract(arg_25_1, function(arg_26_0)
			if not arg_25_0:SyncVisitorExist(arg_26_0) then
				return
			end

			arg_25_0.controller:InterAction(arg_25_1.id, arg_26_0, true)
		end, function(arg_27_0)
			arg_25_0.controller:InterActionEnd(arg_25_1.id, arg_27_0, true)
		end)
	elseif arg_25_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
		arg_25_0:OnVisitorInteract(arg_25_1, function(arg_28_0)
			arg_25_0:GetUnit(arg_25_1.type, arg_25_1.id):SetStatus(arg_25_1.status)

			if not arg_25_0:SyncVisitorExist(arg_28_0) then
				return
			end

			arg_25_0.controller:WorldObjectInterAction(arg_25_1.id, arg_28_0, arg_25_1.status, true)
		end, function(arg_29_0)
			arg_25_0.controller:WorldObjectInterActionEnd(arg_25_1.id, arg_29_0, true)
		end)
	end
end

function var_0_0.OnVisitorInteract(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0, var_30_1 = arg_30_0:GetUnit(arg_30_1.type, arg_30_1.id):UpdateOwner(arg_30_1.slots)

	if var_30_1 == arg_30_0.playerId then
		return
	end

	local var_30_2 = arg_30_0.visitorDic[var_30_1]

	if var_30_0 then
		var_30_2:RecordLastInteract(arg_30_1.id, arg_30_1.type)
		arg_30_2(var_30_1)
	else
		var_30_2:ClearLastInteract()
		arg_30_3(var_30_1)
	end
end

function var_0_0.TryControlUnit(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4, arg_31_5)
	local var_31_0 = arg_31_0:GetUnit(arg_31_1, arg_31_2)

	arg_31_0:ControlUnit(arg_31_2, arg_31_3, 1, arg_31_4, arg_31_1, function(arg_32_0)
		if arg_32_0 then
			arg_31_0.player:SetInTimeline(true)
			var_31_0:SetStatus(arg_31_4)
		end

		arg_31_5(arg_32_0)
	end)
end

function var_0_0.EndControlUnit(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	local var_33_0 = arg_33_0:GetUnit(arg_33_1, arg_33_2)

	arg_33_0:ControlUnit(arg_33_2, arg_33_3, 0, var_33_0:GetStatus(), arg_33_1, function(arg_34_0)
		if arg_34_0 then
			arg_33_0.player:SetInTimeline(false)
		end

		arg_33_4(arg_34_0)
	end)
end

function var_0_0.ControlUnit(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4, arg_35_5, arg_35_6)
	if arg_35_0.controlResultDic[arg_35_1] then
		arg_35_6(false)

		return
	end

	arg_35_0.controlResultDic[arg_35_1] = arg_35_6

	pg.m02:sendNotification(GAME.ISLAND_SYNC_CONTROL, {
		islandId = arg_35_0.island.id,
		objId = arg_35_1,
		slotId = arg_35_2,
		op = arg_35_3,
		status = arg_35_4,
		type = arg_35_5,
		onResult = function(arg_36_0)
			local var_36_0 = arg_36_0 == 0

			existCall(arg_35_0.controlResultDic[arg_35_1], var_36_0)

			arg_35_0.controlResultDic[arg_35_1] = nil
		end
	})
end

function var_0_0.Dispose(arg_37_0)
	arg_37_0.collectClientStateTimer:Stop()
end

return var_0_0
