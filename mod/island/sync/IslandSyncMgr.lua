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

function var_0_0.InitPlayer(arg_10_0)
	arg_10_0.player = SyncLocalPlayer.New(arg_10_0.playerId, arg_10_0.view.player)
end

function var_0_0.InitVisitor(arg_11_0)
	local var_11_0 = arg_11_0.island:GetVisitorAgency():GetMapVisitorList()

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		local var_11_1 = arg_11_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, iter_11_1.id)

		arg_11_0.visitorDic[iter_11_1.id] = SyncUnitVisitor.New(var_11_1)
	end
end

function var_0_0.OnVisitorEnter(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.visitorDic[arg_12_1] = SyncUnitVisitor.New(arg_12_2)
end

function var_0_0.OnVisitorExit(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.visitorDic[arg_13_1]

	if var_13_0 then
		local var_13_1 = var_13_0:GetLastInteract()

		if var_13_1 then
			arg_13_0:GetUnit(var_13_1.type, var_13_1.id):RemoveOwner(arg_13_1)

			if var_13_1.type == IslandConst.SYNC_TYPE_AGORA then
				arg_13_0:Op("InterActionEndSync", var_13_1.id, arg_13_1)
			elseif var_13_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
				arg_13_0:Op("WorldObjectInterActionEndSync", var_13_1.id, arg_13_1)
			end
		end

		arg_13_0.syncDataDelayedProcessor:RemoveDataById(arg_13_1)
		var_13_0:Dispose()

		arg_13_0.visitorDic[arg_13_1] = nil
	end
end

function var_0_0.UpdateLocalPlayer(arg_14_0)
	if table.getCount(arg_14_0.visitorDic) <= 1 then
		return
	end

	local var_14_0 = {}

	if arg_14_0.player:IsLoaded() and not arg_14_0.player:InTimeline() then
		local var_14_1 = arg_14_0.player:CreateSyncData()

		table.insert(var_14_0, var_14_1)
	end

	if #var_14_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_SYNC_DATA, {
			data = var_14_0,
			islandId = arg_14_0.island.id
		})
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

	if not arg_17_0.visitorDic[var_17_0] then
		Debugger.LogWarning(string.format("访客不存在 id=%d", var_17_0))

		return
	end

	arg_17_0:Op("SetVisitorSyncData", var_17_0, arg_17_1)
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

function var_0_0.CancelAgoraInteract(arg_20_0)
	local var_20_0 = arg_20_0.unitDic[IslandConst.SYNC_TYPE_AGORA]

	if not var_20_0 then
		return
	end

	for iter_20_0, iter_20_1 in pairs(var_20_0) do
		if iter_20_1:OwnerCount() > 0 then
			for iter_20_2, iter_20_3 in pairs(iter_20_1.owners) do
				arg_20_0:Op("InterActionEndSync", iter_20_0, iter_20_3)

				if iter_20_3 == arg_20_0.playerId then
					arg_20_0.player:SetInTimeline(false)
				end
			end
		end
	end
end

function var_0_0.ResumeAgoraInteract(arg_21_0)
	local var_21_0 = arg_21_0.unitDic[IslandConst.SYNC_TYPE_AGORA]

	if not var_21_0 then
		return
	end

	for iter_21_0, iter_21_1 in pairs(var_21_0) do
		if iter_21_1:OwnerCount() > 0 then
			for iter_21_2, iter_21_3 in pairs(iter_21_1.owners) do
				arg_21_0:Op("InterActionSync", iter_21_0, iter_21_3, iter_21_2)
			end
		end
	end
end

function var_0_0.ClearAgoraInteractData(arg_22_0)
	arg_22_0.unitDic[IslandConst.SYNC_TYPE_AGORA] = {}
end

function var_0_0.InitWorldObject(arg_23_0, arg_23_1)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		if iter_23_1.type == IslandConst.UNIT_TYPE_ITEM_INTERACT then
			var_23_0[iter_23_1.id] = SyncUnitInteract.New(iter_23_1.id, IslandConst.SYNC_TYPE_UNIT_STATIC)
		end
	end

	arg_23_0.unitDic[IslandConst.SYNC_TYPE_UNIT_STATIC] = var_23_0
end

function var_0_0.InitSyncObj(arg_24_0)
	local var_24_0 = getProxy(IslandProxy):GetSyncObjInitData()

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		local var_24_1 = arg_24_0:GetUnit(iter_24_1.type, iter_24_1.id)

		if var_24_1 then
			var_24_1:InitOwner(iter_24_1.slots)

			if iter_24_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
				if var_24_1:OwnerCount() > 0 then
					for iter_24_2, iter_24_3 in pairs(var_24_1.owners) do
						if iter_24_3 ~= arg_24_0.playerId and arg_24_0.visitorDic[iter_24_3] then
							arg_24_0.visitorDic[iter_24_3]:RecordLastInteract(iter_24_1.id, iter_24_1.type)
							arg_24_0:Op("WorldObjectInterActionSync", iter_24_1.id, iter_24_3, iter_24_1.status, iter_24_2)
						end
					end
				elseif iter_24_1.status > 0 then
					arg_24_0:Op("WorldObjectInitStatus", iter_24_1.id, iter_24_1.status)
				end
			elseif iter_24_1.type == IslandConst.SYNC_TYPE_AGORA and var_24_1:OwnerCount() > 0 then
				for iter_24_4, iter_24_5 in pairs(var_24_1.owners) do
					if iter_24_5 ~= arg_24_0.playerId and arg_24_0.visitorDic[iter_24_5] then
						arg_24_0.visitorDic[iter_24_5]:RecordLastInteract(iter_24_1.id, iter_24_1.type)
						arg_24_0:Op("InterActionSync", iter_24_1.id, iter_24_5, iter_24_4)
					end
				end
			end
		end
	end
end

function var_0_0.GetUnit(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_0.unitDic[arg_25_1] then
		return nil
	end

	return arg_25_0.unitDic[arg_25_1][arg_25_2]
end

function var_0_0.HandleSyncObj(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_1) do
		arg_26_0.syncObjDelayedProcessor:Add(iter_26_1.id, iter_26_1)
	end
end

function var_0_0.UpdateSyncObj(arg_27_0, arg_27_1)
	if arg_27_1.type == IslandConst.SYNC_TYPE_AGORA then
		arg_27_0:OnVisitorInteract(arg_27_1, function(arg_28_0, arg_28_1)
			if not arg_27_0:SyncVisitorExist(arg_28_0) then
				return
			end

			arg_27_0:Op("InterActionSync", arg_27_1.id, arg_28_0, arg_28_1)
		end, function(arg_29_0)
			arg_27_0:Op("InterActionEndSync", arg_27_1.id, arg_29_0)
		end)
	elseif arg_27_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
		arg_27_0:OnVisitorInteract(arg_27_1, function(arg_30_0, arg_30_1)
			local var_30_0 = arg_27_0:GetUnit(arg_27_1.type, arg_27_1.id)

			if not var_30_0 then
				return
			end

			var_30_0:SetStatus(arg_27_1.status)

			if not arg_27_0:SyncVisitorExist(arg_30_0) then
				return
			end

			arg_27_0:Op("WorldObjectInterActionSync", arg_27_1.id, arg_30_0, arg_27_1.status, arg_30_1)
		end, function(arg_31_0)
			arg_27_0:Op("WorldObjectInterActionEndSync", arg_27_1.id, arg_31_0)
		end)
	end
end

function var_0_0.OnVisitorInteract(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = arg_32_0:GetUnit(arg_32_1.type, arg_32_1.id)

	if not var_32_0 then
		return
	end

	local var_32_1, var_32_2, var_32_3 = var_32_0:UpdateOwner(arg_32_1.slots)

	if var_32_2 == arg_32_0.playerId then
		return
	end

	local var_32_4 = arg_32_0.visitorDic[var_32_2]

	if not var_32_4 then
		Debugger.LogWarning(string.format("访客不存在 id=%d", var_32_2))

		return
	end

	if var_32_1 then
		var_32_4:RecordLastInteract(arg_32_1.id, arg_32_1.type)
		arg_32_2(var_32_2, var_32_3)
	else
		var_32_4:ClearLastInteract()
		arg_32_3(var_32_2)
	end
end

function var_0_0.TryControlUnit(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4, arg_33_5)
	local var_33_0 = arg_33_0:GetUnit(arg_33_1, arg_33_2)

	arg_33_0:ControlUnit(arg_33_2, arg_33_3, 1, arg_33_4, arg_33_1, function(arg_34_0)
		if arg_34_0 then
			arg_33_0.player:SetInTimeline(true)
			var_33_0:SetStatus(arg_33_4)
		end

		arg_33_5(arg_34_0)
	end)
end

function var_0_0.EndControlUnit(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	local var_35_0 = arg_35_0:GetUnit(arg_35_1, arg_35_2)

	arg_35_0:ControlUnit(arg_35_2, arg_35_3, 0, var_35_0:GetStatus(), arg_35_1, function(arg_36_0)
		if arg_36_0 then
			arg_35_0.player:SetInTimeline(false)
		end

		arg_35_4(arg_36_0)
	end)
end

function var_0_0.ControlUnit(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4, arg_37_5, arg_37_6)
	if arg_37_0.controlResultDic[arg_37_1] then
		arg_37_6(false)

		return
	end

	arg_37_0.controlResultDic[arg_37_1] = arg_37_6

	pg.m02:sendNotification(GAME.ISLAND_SYNC_CONTROL, {
		islandId = arg_37_0.island.id,
		objId = arg_37_1,
		slotId = arg_37_2,
		op = arg_37_3,
		status = arg_37_4,
		type = arg_37_5,
		onResult = function(arg_38_0)
			local var_38_0 = arg_38_0 == 0

			existCall(arg_37_0.controlResultDic[arg_37_1], var_38_0)

			arg_37_0.controlResultDic[arg_37_1] = nil
		end
	})
end

function var_0_0.Dispose(arg_39_0)
	arg_39_0.collectClientStateTimer:Stop()
end

return var_0_0
