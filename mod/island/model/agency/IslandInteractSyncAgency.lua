local var_0_0 = class("IslandInteractSyncAgency", import(".IslandBaseAgency"))

var_0_0.OCCUPANCY_CHANGED = "IslandInteractSyncAgency:OCCUPANCY_CHANGED"
var_0_0.PHASE_INIT = "init"
var_0_0.PHASE_SYNC = "sync"
var_0_0.PHASE_LOCAL = "local"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.playerId = nil
	arg_1_0.slotMeta = {}
	arg_1_0.owners = {}
	arg_1_0.status = {}
	arg_1_0.lastInteract = {}
	arg_1_0.localInteracting = false
end

function var_0_0.Register(arg_2_0)
	arg_2_0:GetHost():AddListener(IslandAgoraAgency.PLACEMENT_UPDATE, function()
		arg_2_0:RebuildAgoraSlotMeta()
	end)
end

function var_0_0.ApplyMapSnapshot(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:ResetMapData()
	arg_4_0:RebuildWorldSlotMeta(arg_4_2)
	arg_4_0:RebuildAgoraSlotMeta()

	local var_4_0 = arg_4_0:GetHost():GetVisitorAgency():GetMapVisitorList()

	for iter_4_0, iter_4_1 in ipairs(arg_4_1 or {}) do
		if arg_4_0:GetSyncType(iter_4_1.id) == iter_4_1.type then
			arg_4_0:ApplyServerSlots(iter_4_1.id, iter_4_1.slots, iter_4_1.status, var_0_0.PHASE_INIT)

			local var_4_1 = arg_4_0:GetOccupiedSlots(iter_4_1.id) or {}

			for iter_4_2, iter_4_3 in pairs(var_4_1) do
				if iter_4_3 ~= arg_4_0:GetLocalPlayerId() and var_4_0[iter_4_3] then
					arg_4_0:RecordLastInteract(iter_4_3, iter_4_1.id, iter_4_1.type)
				end
			end
		end
	end
end

function var_0_0.ResetMapData(arg_5_0)
	arg_5_0.slotMeta = {}
	arg_5_0.owners = {}
	arg_5_0.status = {}
	arg_5_0.lastInteract = {}

	arg_5_0:RefreshLocalInteracting()
end

function var_0_0.RebuildAgoraSlotMeta(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = arg_6_0:GetHost():GetAgoraAgency():GetPlacedData().placedList or {}

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		local var_6_2 = AgoraCalc.RevertFormUniqueId(iter_6_1.id)
		local var_6_3 = pg.island_furniture_template[var_6_2]
		local var_6_4 = var_6_3 and var_6_3.interact_point

		if var_6_4 and var_6_4 ~= "" and #var_6_4 > 0 then
			for iter_6_2, iter_6_3 in ipairs(var_6_4) do
				local var_6_5 = pg.island_interact_point[iter_6_3]

				if var_6_5 then
					table.insert(var_6_0, {
						id = AgoraCalc.GetVirtualInteractUnitId(iter_6_1.id, iter_6_2),
						slotCnt = var_6_5.slot_cnt,
						pointId = iter_6_3
					})
				end
			end
		end
	end

	arg_6_0:ResetByType(IslandConst.SYNC_TYPE_AGORA, var_6_0)
end

function var_0_0.RebuildWorldSlotMeta(arg_7_0, arg_7_1)
	local var_7_0 = {}
	local var_7_1 = pg.island_world_objects.get_id_list_by_mapId[arg_7_1] or {}

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		local var_7_2 = pg.island_world_objects[iter_7_1]

		if var_7_2 and var_7_2.type == IslandConst.UNIT_TYPE_ITEM_INTERACT then
			local var_7_3 = pg.island_unit_interactive_item[var_7_2.unitId]

			if var_7_3 then
				table.insert(var_7_0, {
					id = iter_7_1,
					slotCnt = var_7_3.slot_cnt
				})
			end
		end
	end

	arg_7_0:ResetByType(IslandConst.SYNC_TYPE_UNIT_STATIC, var_7_0)
end

function var_0_0.ResetByType(arg_8_0, arg_8_1, arg_8_2)
	for iter_8_0, iter_8_1 in pairs(arg_8_0.slotMeta) do
		if iter_8_1.type == arg_8_1 then
			arg_8_0.slotMeta[iter_8_0] = nil
			arg_8_0.owners[iter_8_0] = nil
			arg_8_0.status[iter_8_0] = nil
		end
	end

	for iter_8_2, iter_8_3 in ipairs(arg_8_2) do
		arg_8_0.slotMeta[iter_8_3.id] = {
			type = arg_8_1,
			slotCnt = iter_8_3.slotCnt,
			pointId = iter_8_3.pointId
		}
		arg_8_0.owners[iter_8_3.id] = {}
	end

	arg_8_0:RefreshLocalInteracting()
end

function var_0_0.ClearByType(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.slotMeta) do
		if iter_9_1.type == arg_9_1 then
			if not arg_9_2 then
				local var_9_0 = arg_9_0.owners[iter_9_0] or {}

				for iter_9_2, iter_9_3 in pairs(var_9_0) do
					arg_9_0:DispatchEvent(var_0_0.OCCUPANCY_CHANGED, iter_9_0, iter_9_2, iter_9_3, false, var_0_0.PHASE_SYNC)
				end
			end

			arg_9_0.slotMeta[iter_9_0] = nil
			arg_9_0.owners[iter_9_0] = nil
			arg_9_0.status[iter_9_0] = nil
		end
	end

	arg_9_0:RefreshLocalInteracting()
end

function var_0_0.ApplyServerSlots(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	if not arg_10_0.slotMeta[arg_10_1] then
		return nil
	end

	if arg_10_3 ~= nil then
		arg_10_0.status[arg_10_1] = arg_10_3
	end

	local var_10_0 = arg_10_0.owners[arg_10_1] or {}
	local var_10_1 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_2 or {}) do
		var_10_1[iter_10_1.slot_id] = iter_10_1.owner_id
	end

	local var_10_2 = arg_10_0:DiffOwners(var_10_0, var_10_1)

	arg_10_0.owners[arg_10_1] = var_10_1

	arg_10_0:DispatchChanges(arg_10_1, var_10_2, arg_10_4)
	arg_10_0:RefreshLocalInteracting()

	return var_10_2
end

function var_0_0.ApplyLocalOccupy(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = arg_11_0.owners[arg_11_1]

	if not var_11_0 then
		return nil
	end

	if arg_11_4 ~= nil then
		arg_11_0.status[arg_11_1] = arg_11_4
	end

	local var_11_1 = var_11_0[arg_11_2]

	var_11_0[arg_11_2] = arg_11_3

	local var_11_2 = {
		added = {
			{
				slotId = arg_11_2,
				ownerId = arg_11_3
			}
		},
		removed = {}
	}

	if var_11_1 ~= nil and var_11_1 ~= arg_11_3 then
		table.insert(var_11_2.removed, {
			slotId = arg_11_2,
			ownerId = var_11_1
		})
	end

	arg_11_0:DispatchChanges(arg_11_1, var_11_2, var_0_0.PHASE_LOCAL)
	arg_11_0:RefreshLocalInteracting()

	return var_11_2
end

function var_0_0.ApplyLocalRelease(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = arg_12_0.owners[arg_12_1]
	local var_12_1 = var_12_0 ~= nil and var_12_0[arg_12_2] ~= nil

	if var_12_1 and arg_12_3 ~= nil and var_12_0[arg_12_2] ~= arg_12_3 then
		return nil
	end

	if var_12_1 then
		var_12_0[arg_12_2] = nil
	end

	local var_12_2 = {
		added = {},
		removed = {
			{
				slotId = arg_12_2,
				ownerId = arg_12_3 or arg_12_0:GetLocalPlayerId()
			}
		}
	}

	arg_12_0:DispatchChanges(arg_12_1, var_12_2, var_0_0.PHASE_LOCAL)
	arg_12_0:RefreshLocalInteracting()

	return var_12_2
end

function var_0_0.RemoveOwner(arg_13_0, arg_13_1)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0.owners) do
		for iter_13_2, iter_13_3 in pairs(iter_13_1) do
			if iter_13_3 == arg_13_1 then
				iter_13_1[iter_13_2] = nil

				table.insert(var_13_0, {
					unitId = iter_13_0,
					slotId = iter_13_2
				})
				arg_13_0:DispatchEvent(var_0_0.OCCUPANCY_CHANGED, iter_13_0, iter_13_2, arg_13_1, false, var_0_0.PHASE_SYNC)
			end
		end
	end

	arg_13_0:RefreshLocalInteracting()

	return var_13_0
end

function var_0_0.SetStatus(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0.slotMeta[arg_14_1] then
		arg_14_0.status[arg_14_1] = arg_14_2
	end
end

function var_0_0.GetStatus(arg_15_0, arg_15_1)
	return arg_15_0.status[arg_15_1]
end

function var_0_0.OnVisitorExit(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.lastInteract[arg_16_1]

	arg_16_0.lastInteract[arg_16_1] = nil

	return var_16_0
end

function var_0_0.RecordLastInteract(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	arg_17_0.lastInteract[arg_17_1] = {
		id = arg_17_2,
		type = arg_17_3
	}
end

function var_0_0.ClearLastInteract(arg_18_0, arg_18_1)
	arg_18_0.lastInteract[arg_18_1] = nil
end

function var_0_0.IsLocalInteracting(arg_19_0)
	return arg_19_0.localInteracting
end

function var_0_0.GetLocalPlayerId(arg_20_0)
	if not arg_20_0.playerId then
		arg_20_0.playerId = getProxy(PlayerProxy):getPlayerId()
	end

	return arg_20_0.playerId
end

function var_0_0.RefreshLocalInteracting(arg_21_0)
	local var_21_0 = arg_21_0:GetLocalPlayerId()

	for iter_21_0, iter_21_1 in pairs(arg_21_0.owners) do
		for iter_21_2, iter_21_3 in pairs(iter_21_1) do
			if iter_21_3 == var_21_0 then
				arg_21_0.localInteracting = true

				return
			end
		end
	end

	arg_21_0.localInteracting = false
end

function var_0_0.GetSyncType(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.slotMeta[arg_22_1]

	return var_22_0 and var_22_0.type or nil
end

function var_0_0.GetPointId(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.slotMeta[arg_23_1]

	return var_23_0 and var_23_0.pointId or nil
end

function var_0_0.GetUnitIdsByType(arg_24_0, arg_24_1)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.slotMeta) do
		if iter_24_1.type == arg_24_1 then
			table.insert(var_24_0, iter_24_0)
		end
	end

	return var_24_0
end

function var_0_0.GetAllUnitIds(arg_25_0)
	local var_25_0 = {}

	for iter_25_0 in pairs(arg_25_0.slotMeta) do
		table.insert(var_25_0, iter_25_0)
	end

	return var_25_0
end

function var_0_0.GetSlotCnt(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.slotMeta[arg_26_1]

	return var_26_0 and var_26_0.slotCnt or 0
end

function var_0_0.GetOccupiedSlots(arg_27_0, arg_27_1)
	return arg_27_0.owners[arg_27_1]
end

function var_0_0.AnySlotUsing(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.owners[arg_28_1]

	return var_28_0 ~= nil and next(var_28_0) ~= nil
end

function var_0_0.GetFreeSlot(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.slotMeta[arg_29_1]
	local var_29_1 = arg_29_0.owners[arg_29_1]

	if not var_29_0 or not var_29_1 then
		return nil
	end

	for iter_29_0 = 1, var_29_0.slotCnt do
		if var_29_1[iter_29_0] == nil then
			return iter_29_0
		end
	end

	return nil
end

function var_0_0.GetSlotByOwner(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0.owners[arg_30_1]

	if not var_30_0 then
		return nil
	end

	for iter_30_0, iter_30_1 in pairs(var_30_0) do
		if iter_30_1 == arg_30_2 then
			return iter_30_0
		end
	end

	return nil
end

function var_0_0.GetUnitsByOwner(arg_31_0, arg_31_1)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in pairs(arg_31_0.owners) do
		for iter_31_2, iter_31_3 in pairs(iter_31_1) do
			if iter_31_3 == arg_31_1 then
				table.insert(var_31_0, iter_31_0)

				break
			end
		end
	end

	return var_31_0
end

function var_0_0.HasOwner(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.owners[arg_32_1]

	if not var_32_0 then
		return false
	end

	for iter_32_0, iter_32_1 in pairs(var_32_0) do
		if iter_32_1 ~= arg_32_2 then
			return true
		end
	end

	return false
end

function var_0_0.IsSpecialOccupied(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.owners[arg_33_1]

	return var_33_0 ~= nil and var_33_0[0] ~= nil
end

function var_0_0.CanAcquireNormalSlot(arg_34_0, arg_34_1)
	return not arg_34_0:IsSpecialOccupied(arg_34_1) and arg_34_0:GetFreeSlot(arg_34_1) ~= nil
end

function var_0_0.DiffOwners(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = {
		added = {},
		removed = {}
	}

	for iter_35_0, iter_35_1 in pairs(arg_35_2) do
		if arg_35_1[iter_35_0] ~= iter_35_1 then
			table.insert(var_35_0.added, {
				slotId = iter_35_0,
				ownerId = iter_35_1
			})
		end
	end

	for iter_35_2, iter_35_3 in pairs(arg_35_1) do
		if arg_35_2[iter_35_2] == nil then
			table.insert(var_35_0.removed, {
				slotId = iter_35_2,
				ownerId = iter_35_3
			})
		end
	end

	return var_35_0
end

function var_0_0.DispatchChanges(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	for iter_36_0, iter_36_1 in ipairs(arg_36_2.removed) do
		arg_36_0:DispatchEvent(var_0_0.OCCUPANCY_CHANGED, arg_36_1, iter_36_1.slotId, iter_36_1.ownerId, false, arg_36_3)
	end

	for iter_36_2, iter_36_3 in ipairs(arg_36_2.added) do
		arg_36_0:DispatchEvent(var_0_0.OCCUPANCY_CHANGED, arg_36_1, iter_36_3.slotId, iter_36_3.ownerId, true, arg_36_3)
	end
end

function var_0_0.Clear(arg_37_0)
	arg_37_0.slotMeta = {}
	arg_37_0.owners = {}
	arg_37_0.status = {}
	arg_37_0.lastInteract = {}

	arg_37_0:RefreshLocalInteracting()
end

return var_0_0
