local var_0_0 = class("IslandSyncMgr")

var_0_0.ISLAND_SYNC_DATA_UPDATE = "IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE"

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.controlResultDic = {}
	arg_1_0.controller = arg_1_1
	arg_1_0.island = arg_1_1.island
	arg_1_0.agency = arg_1_1.island:GetInteractSyncAgency()
	arg_1_0.playerId = getProxy(PlayerProxy):getPlayerId()
	arg_1_0.presented = {}
	arg_1_0.readyVisitors = {}
	arg_1_0.editSuspended = false
	arg_1_0.syncDataDelayedProcessor = DelayedDataProcessor.New(IslandConst.SYNC_TIME_DELAY, IslandConst.SYNC_TIME_INTERVAL * 1000, function(arg_2_0)
		arg_1_0:UpdateVisitorSyncData(arg_2_0)
	end)
	arg_1_0.collectClientStateTimer = Timer.New(function()
		arg_1_0:UpdateLocalPlayer()
	end, IslandConst.SYNC_TIME_INTERVAL, -1)
end

function var_0_0.Op(arg_4_0, arg_4_1, ...)
	arg_4_0.controller:Receive(arg_4_1, ...)
end

function var_0_0.Init(arg_5_0, arg_5_1)
	arg_5_0.presented = {}
	arg_5_0.readyVisitors = {}
	arg_5_0.editSuspended = false

	arg_5_0.syncDataDelayedProcessor:Dispose()
	arg_5_0:InitPlayer(arg_5_1)
	arg_5_0:StartReconcile()
	arg_5_0.collectClientStateTimer:Start()
end

function var_0_0.StartReconcile(arg_6_0)
	arg_6_0:ClearLocalResidualOccupy()

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.agency:GetAllUnitIds()) do
		if arg_6_0.agency:AnySlotUsing(iter_6_1) then
			arg_6_0:ReconcileUnit(iter_6_1)
		else
			local var_6_0 = arg_6_0.agency:GetStatus(iter_6_1)

			if var_6_0 and var_6_0 > 0 then
				arg_6_0:OpInitStatus(arg_6_0.agency:GetSyncType(iter_6_1), iter_6_1, var_6_0)
			end
		end
	end
end

function var_0_0.ClearLocalResidualOccupy(arg_7_0)
	local var_7_0 = arg_7_0.agency:GetUnitsByOwner(arg_7_0.playerId)

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = arg_7_0.agency:GetSyncType(iter_7_1)

		arg_7_0:EndControlUnit(var_7_1, iter_7_1, function(arg_8_0)
			return
		end)
	end
end

function var_0_0.Update(arg_9_0)
	arg_9_0.syncDataDelayedProcessor:Update()
end

function var_0_0.IsPlayerInTimeline(arg_10_0)
	return arg_10_0.agency:IsLocalInteracting()
end

function var_0_0.InitPlayer(arg_11_0, arg_11_1)
	arg_11_0.player = SyncLocalPlayer.New(arg_11_0.playerId, arg_11_1)
end

function var_0_0.OnVisitorUnitReady(arg_12_0, arg_12_1)
	arg_12_0.readyVisitors[arg_12_1] = true

	local var_12_0 = arg_12_0.agency:GetUnitsByOwner(arg_12_1)

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		arg_12_0:ReconcileUnit(iter_12_1)
	end
end

function var_0_0.IsVisitorReady(arg_13_0, arg_13_1)
	return arg_13_0.readyVisitors[arg_13_1] == true
end

function var_0_0.OnVisitorExit(arg_14_0, arg_14_1)
	arg_14_0.readyVisitors[arg_14_1] = nil

	if arg_14_0.agency:OnVisitorExit(arg_14_1) then
		local var_14_0 = arg_14_0.agency:RemoveOwner(arg_14_1)

		for iter_14_0, iter_14_1 in ipairs(var_14_0) do
			arg_14_0:ReconcileUnit(iter_14_1.unitId)
		end
	end

	arg_14_0.syncDataDelayedProcessor:RemoveDataById(arg_14_1)
end

function var_0_0.UpdateLocalPlayer(arg_15_0)
	if table.getCount(arg_15_0.island:GetVisitorAgency():GetMapVisitorList()) <= 1 then
		return
	end

	local var_15_0 = {}

	if arg_15_0.player:IsLoaded() and not arg_15_0.agency:IsLocalInteracting() then
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

	if not arg_18_0.island:GetVisitorAgency():GetMapVisitorList()[var_18_0] then
		Debugger.LogWarning(string.format("访客不存在 id=%d", var_18_0))

		return
	end

	arg_18_0:Op("SetVisitorSyncData", var_18_0, arg_18_1)
end

function var_0_0.ReconcileUnit(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.agency:GetSyncType(arg_19_1)

	if not var_19_0 then
		return
	end

	if arg_19_0.editSuspended and var_19_0 == IslandConst.SYNC_TYPE_AGORA then
		return
	end

	local var_19_1 = arg_19_0.agency:GetOccupiedSlots(arg_19_1) or {}
	local var_19_2 = arg_19_0.presented[arg_19_1] or {}
	local var_19_3 = arg_19_0.agency:GetStatus(arg_19_1)

	for iter_19_0, iter_19_1 in pairs(var_19_2) do
		if var_19_1[iter_19_0] ~= iter_19_1 then
			arg_19_0.presented[arg_19_1][iter_19_0] = nil

			arg_19_0:OpInteractEnd(var_19_0, arg_19_1, iter_19_1, iter_19_0)
		end
	end

	for iter_19_2, iter_19_3 in pairs(var_19_1) do
		if var_19_2[iter_19_2] ~= iter_19_3 then
			if iter_19_2 == 0 then
				if iter_19_3 == arg_19_0.playerId and arg_19_2 == "local" then
					arg_19_0:MarkPresentedAndStart(arg_19_1, iter_19_2, iter_19_3, arg_19_2, var_19_3)
				end
			elseif iter_19_3 == arg_19_0.playerId then
				if arg_19_2 == "local" then
					arg_19_0:MarkPresentedAndStart(arg_19_1, iter_19_2, iter_19_3, arg_19_2, var_19_3)
				end
			elseif arg_19_0:IsVisitorReady(iter_19_3) then
				arg_19_0:MarkPresentedAndStart(arg_19_1, iter_19_2, iter_19_3, arg_19_2, var_19_3)
			end
		end
	end
end

function var_0_0.OnOccupancyChanged(arg_20_0, arg_20_1)
	arg_20_0:ReconcileUnit(arg_20_1)
end

function var_0_0.MarkPresentedAndStart(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4, arg_21_5)
	local var_21_0 = arg_21_0.agency:GetSyncType(arg_21_1)

	arg_21_0.presented[arg_21_1] = arg_21_0.presented[arg_21_1] or {}
	arg_21_0.presented[arg_21_1][arg_21_2] = arg_21_3

	arg_21_0:OpInteractStart(var_21_0, arg_21_1, arg_21_3, arg_21_5, arg_21_2)
end

function var_0_0.OpInteractStart(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5)
	if arg_22_5 == 0 then
		arg_22_0:Op("AgoraVirtualShipInterActionSync", arg_22_2, arg_22_3, arg_22_4, arg_22_5)

		return
	end

	if arg_22_1 == IslandConst.SYNC_TYPE_AGORA then
		arg_22_0:Op("AgoraVirtualInterActionSync", arg_22_2, arg_22_3, arg_22_4, arg_22_5)
	elseif arg_22_1 == IslandConst.SYNC_TYPE_UNIT_STATIC then
		arg_22_0:Op("WorldObjectInterActionSync", arg_22_2, arg_22_3, arg_22_4, arg_22_5)
	else
		return
	end

	arg_22_0.syncDataDelayedProcessor:RemoveDataById(arg_22_3)
end

function var_0_0.OpInteractEnd(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	if arg_23_4 == 0 then
		arg_23_0:Op("AgoraVirtualShipInterActionEndSync", arg_23_2, arg_23_3, arg_23_4)

		return
	end

	if arg_23_1 == IslandConst.SYNC_TYPE_AGORA then
		arg_23_0:Op("AgoraVirtualInterActionEndSync", arg_23_2, arg_23_3, arg_23_4)
	elseif arg_23_1 == IslandConst.SYNC_TYPE_UNIT_STATIC then
		arg_23_0:Op("WorldObjectInterActionEndSync", arg_23_2, arg_23_3, arg_23_4)
	end
end

function var_0_0.OpInitStatus(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if arg_24_1 == IslandConst.SYNC_TYPE_UNIT_STATIC then
		arg_24_0:Op("WorldObjectInitStatus", arg_24_2, arg_24_3)
	elseif arg_24_1 == IslandConst.SYNC_TYPE_AGORA then
		arg_24_0:Op("AgoraVirtualInitStatus", arg_24_2, arg_24_3)
	end
end

function var_0_0.TryControlUnit(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
	if arg_25_0.agency:IsLocalInteracting() then
		arg_25_5(false)

		return
	end

	if arg_25_0.agency:GetSyncType(arg_25_2) ~= arg_25_1 then
		arg_25_5(false)

		return
	end

	arg_25_0:ControlUnit(arg_25_2, arg_25_3, 1, arg_25_4, arg_25_1, function(arg_26_0)
		if arg_26_0 then
			arg_25_0.agency:ApplyLocalOccupy(arg_25_2, arg_25_3, arg_25_0.playerId, arg_25_4)
			arg_25_0:ReconcileUnit(arg_25_2, "local")
		end

		arg_25_5(arg_26_0)
	end)
end

function var_0_0.EndControlUnit(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = arg_27_0.agency:GetSlotByOwner(arg_27_2, arg_27_0.playerId)

	if not var_27_0 then
		arg_27_3(false)

		return
	end

	local var_27_1 = arg_27_0.agency:GetStatus(arg_27_2)

	arg_27_0:ControlUnit(arg_27_2, var_27_0, 0, var_27_1, arg_27_1, function(arg_28_0)
		if arg_28_0 then
			arg_27_0.agency:ApplyLocalRelease(arg_27_2, var_27_0, arg_27_0.playerId)
			arg_27_0:ReconcileUnit(arg_27_2, "local")
		end

		arg_27_3(arg_28_0)
	end)
end

function var_0_0.ControlUnit(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4, arg_29_5, arg_29_6)
	if arg_29_0.controlResultDic[arg_29_1] then
		arg_29_6(false)

		return
	end

	arg_29_0.controlResultDic[arg_29_1] = arg_29_6

	pg.m02:sendNotification(GAME.ISLAND_SYNC_CONTROL, {
		islandId = arg_29_0.island.id,
		objId = arg_29_1,
		slotId = arg_29_2,
		op = arg_29_3,
		status = arg_29_4,
		type = arg_29_5,
		onResult = function(arg_30_0)
			local var_30_0 = arg_30_0 == 0

			existCall(arg_29_0.controlResultDic[arg_29_1], var_30_0)

			arg_29_0.controlResultDic[arg_29_1] = nil
		end
	})
end

function var_0_0.StopAgoraPresentation(arg_31_0)
	local var_31_0 = IslandConst.SYNC_TYPE_AGORA

	for iter_31_0, iter_31_1 in pairs(arg_31_0.presented) do
		if arg_31_0.agency:GetSyncType(iter_31_0) == var_31_0 then
			for iter_31_2, iter_31_3 in pairs(iter_31_1) do
				arg_31_0:OpInteractEnd(var_31_0, iter_31_0, iter_31_3, iter_31_2)
			end

			arg_31_0.presented[iter_31_0] = nil
		end
	end
end

function var_0_0.SuspendAgoraInteract(arg_32_0)
	arg_32_0:StopAgoraPresentation()

	arg_32_0.editSuspended = true
end

function var_0_0.ResumeAgoraPresentation(arg_33_0)
	if not arg_33_0.editSuspended then
		return
	end

	arg_33_0.editSuspended = false

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.agency:GetUnitIdsByType(IslandConst.SYNC_TYPE_AGORA)) do
		arg_33_0:ReconcileUnit(iter_33_1)
	end
end

function var_0_0.StopAgoraInteraction(arg_34_0)
	arg_34_0:StopAgoraPresentation()
	arg_34_0.agency:ClearByType(IslandConst.SYNC_TYPE_AGORA, true)
end

function var_0_0.ClearAgoraInteractData(arg_35_0)
	arg_35_0.agency:ClearByType(IslandConst.SYNC_TYPE_AGORA, true)

	for iter_35_0 in pairs(arg_35_0.presented) do
		if arg_35_0.agency:GetSyncType(iter_35_0) == nil then
			arg_35_0.presented[iter_35_0] = nil
		end
	end
end

function var_0_0.Dispose(arg_36_0)
	arg_36_0.collectClientStateTimer:Stop()
	arg_36_0.syncDataDelayedProcessor:Dispose()
end

return var_0_0
