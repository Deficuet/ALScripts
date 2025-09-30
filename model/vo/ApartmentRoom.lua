local var_0_0 = class("ApartmentRoom", import(".BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.unlockCharacter = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.ships or {}) do
		arg_1_0.unlockCharacter[iter_1_1] = true
	end

	arg_1_0.furnitures = {}

	table.Ipairs(arg_1_1.furnitures or {}, function(arg_2_0, arg_2_1)
		arg_1_0.furnitures[arg_2_0] = Dorm3dFurniture.New({
			configId = arg_2_1.furniture_id,
			slotId = arg_2_1.slot_id
		})
	end)

	arg_1_0.slotDic = {}

	table.Ipairs(arg_1_0:GetSlotIDList(), function(arg_3_0, arg_3_1)
		arg_1_0.slotDic[arg_3_1] = Dorm3dFurnitureSlot.New({
			configId = arg_3_1
		})
	end)

	arg_1_0.zoneDic = {}
	arg_1_0.zoneReplaceDic = {}

	table.Ipairs(arg_1_0:GetZoneIDList(), function(arg_4_0, arg_4_1)
		local var_4_0 = Dorm3dZone.New({
			configId = arg_4_1
		})
		local var_4_1 = var_4_0:GetWatchCameraName()

		arg_1_0.zoneDic[var_4_1] = var_4_0
		arg_1_0.zoneReplaceDic[var_4_1] = {}

		var_4_0:SetSlots(_.map(var_4_0:GetSlotIDList(), function(arg_5_0)
			return arg_1_0.slotDic[arg_5_0]
		end))
	end)
	arg_1_0:UpdateFurnitureReplaceConfig()

	arg_1_0.cameraZones = _.map(arg_1_0:GetCameraZoneIDList(), function(arg_6_0)
		return Dorm3dCameraZone.New({
			configId = arg_6_0
		})
	end)
	arg_1_0.collectItemDic = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.collections or {}) do
		arg_1_0.collectItemDic[iter_1_3] = true
	end

	arg_1_0.shipArAnimationDic = {}

	local var_1_0 = arg_1_0:getConfig("ar_anim")

	if var_1_0 then
		for iter_1_4, iter_1_5 in ipairs(var_1_0) do
			local var_1_1 = iter_1_5[1]
			local var_1_2 = iter_1_5[2]
			local var_1_3 = _.map(var_1_2, function(arg_7_0)
				return Dorm3dCameraAnim.New({
					configId = arg_7_0
				})
			end)

			arg_1_0.shipArAnimationDic[var_1_1] = var_1_3
		end
	end
end

function var_0_0.bindConfigTable(arg_8_0)
	return pg.dorm3d_rooms
end

function var_0_0.getDownloadNameList(arg_9_0)
	local var_9_0 = DormGroupConst.GetDownloadResourceDic()
	local var_9_1 = string.lower(arg_9_0:getConfig("resource_name"))
	local var_9_2 = {}

	switch(arg_9_0:getConfig("type"), {
		function()
			var_9_2 = {
				"room_" .. var_9_1,
				"common"
			}
		end,
		function()
			var_9_2 = {
				"room_" .. var_9_1,
				"apartment_" .. var_9_1,
				"common"
			}
		end
	}, function()
		assert(false, "without room type:" .. arg_9_0:getConfig("type"))
	end)

	local var_9_3 = {}

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		table.insertto(var_9_3, var_9_0[iter_9_1] or {})
	end

	return var_9_3
end

function var_0_0.needDownload(arg_13_0)
	return #arg_13_0:getDownloadNameList() > 0
end

function var_0_0.getDownloadNeedSize(arg_14_0)
	local var_14_0, var_14_1 = DormGroupConst.CalcDormListSize(arg_14_0:getDownloadNameList())

	return var_14_0, var_14_1
end

function var_0_0.getState(arg_15_0)
	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_15_0.configId then
		return "loading"
	elseif arg_15_0:needDownload() then
		return "download"
	else
		return "complete"
	end
end

function var_0_0.isPersonalRoom(arg_16_0)
	return arg_16_0:getConfig("type") == 2
end

function var_0_0.getPersonalGroupId(arg_17_0)
	assert(arg_17_0:isPersonalRoom())

	return arg_17_0:getConfig("character")[1]
end

function var_0_0.getInviteList(arg_18_0)
	return table.mergeArray(arg_18_0:getConfig("character"), arg_18_0:getConfig("character_pay"))
end

function var_0_0.getInteractRange(arg_19_0)
	local var_19_0, var_19_1 = unpack(arg_19_0:getConfig("character_range"))

	var_19_1 = var_19_1 or var_19_0

	return var_19_0, var_19_1
end

function var_0_0.getRoomName(arg_20_0)
	return arg_20_0:getConfig("room")
end

function var_0_0.GetZoneIDList(arg_21_0)
	return pg.dorm3d_zone_template.get_id_list_by_room_id[arg_21_0.configId] or {}
end

function var_0_0.GetSlotIDList(arg_22_0)
	return pg.dorm3d_furniture_slot_template.get_id_list_by_room_id[arg_22_0.configId] or {}
end

function var_0_0.GetFurnitureZoneIDList(arg_23_0)
	return arg_23_0:getConfig("furniture_zones")
end

function var_0_0.GetCameraZoneIDList(arg_24_0)
	return pg.dorm3d_camera_zone_template.get_id_list_by_room_id[arg_24_0.configId] or {}
end

function var_0_0.GetZones(arg_25_0)
	return underscore(arg_25_0.zoneDic):chain():values():sort(CompareFuncs({
		function(arg_26_0)
			return arg_26_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureZones(arg_27_0)
	local var_27_0 = arg_27_0:GetFurnitureZoneIDList()

	return underscore.map(var_27_0, function(arg_28_0)
		return (table.Find(arg_27_0.zoneDic, function(arg_29_0, arg_29_1)
			return arg_29_1:GetConfigID() == arg_28_0
		end))
	end)
end

function var_0_0.GetCameraZones(arg_30_0)
	return arg_30_0.cameraZones
end

function var_0_0.GetSlots(arg_31_0)
	return underscore(arg_31_0.slotDic):chain():values():sort(CompareFuncs({
		function(arg_32_0)
			return arg_32_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureIDList(arg_33_0)
	return pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_33_0.configId]
end

function var_0_0.GetFurnitures(arg_34_0)
	return arg_34_0.furnitures
end

function var_0_0.HasFurniture(arg_35_0, arg_35_1)
	return _.any(arg_35_0.furnitures, function(arg_36_0)
		return arg_36_0:GetConfigID() == arg_35_1
	end)
end

function var_0_0.AddFurnitureByID(arg_37_0, arg_37_1)
	table.insert(arg_37_0.furnitures, Dorm3dFurniture.New({
		configId = arg_37_1
	}))
end

function var_0_0.ReplaceFurnitures(arg_38_0, arg_38_1)
	_.each(arg_38_1, function(arg_39_0)
		arg_38_0:ReplaceFurniture(arg_39_0.slotId, arg_39_0.furnitureId)
	end)
	arg_38_0:UpdateFurnitureReplaceConfig()
end

function var_0_0.ReplaceFurniture(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_1 > 0 then
		local var_40_0 = _.detect(arg_40_0.furnitures, function(arg_41_0)
			return arg_41_0:GetSlotID() == arg_40_1
		end)

		if var_40_0 then
			var_40_0:SetSlotID(0)
		end
	end

	if arg_40_2 > 0 then
		local var_40_1 = _.detect(arg_40_0.furnitures, function(arg_42_0)
			return arg_42_0:GetConfigID() == arg_40_2 and arg_42_0:GetSlotID() == 0
		end)

		if var_40_1 then
			var_40_1:SetSlotID(arg_40_1)
		end
	end
end

function var_0_0.IsFurnitureSetIn(arg_43_0, arg_43_1)
	for iter_43_0, iter_43_1 in ipairs(arg_43_0.furnitures) do
		if iter_43_1:GetConfigID() == arg_43_1 and iter_43_1.slotId > 0 then
			return true
		end
	end

	return false
end

function var_0_0.UpdateFurnitureReplaceConfig(arg_44_0)
	local var_44_0 = {}

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.furnitures) do
		if iter_44_1.slotId ~= 0 then
			var_44_0[iter_44_1.slotId] = iter_44_1
		end
	end

	for iter_44_2, iter_44_3 in pairs(arg_44_0.zoneDic) do
		if iter_44_2 ~= "" then
			for iter_44_4, iter_44_5 in ipairs(iter_44_3:GetSlots()) do
				local var_44_1 = var_44_0[iter_44_5.configId]

				if var_44_1 and var_44_1:getConfig("touch_id") ~= "" then
					arg_44_0.zoneReplaceDic[iter_44_2].touch_id = var_44_1:getConfig("touch_id")
				end
			end
		end
	end
end

var_0_0.ITEM_LOCK = 0
var_0_0.ITEM_UNLOCK = 1
var_0_0.ITEM_ACTIVE = 2
var_0_0.ITEM_FIRST = 3

function var_0_0.getTriggerableCollectItemDic(arg_45_0, arg_45_1)
	local var_45_0 = {}

	for iter_45_0, iter_45_1 in ipairs(pg.dorm3d_collection_template.get_id_list_by_room_id[arg_45_0.configId] or {}) do
		local var_45_1 = pg.dorm3d_collection_template[iter_45_1]

		if var_45_1.time ~= 0 and var_45_1.time ~= arg_45_1 or not ApartmentProxy.CheckUnlockConfig(var_45_1.unlock) then
			var_45_0[iter_45_1] = var_0_0.ITEM_LOCK
		elseif arg_45_0.collectItemDic[iter_45_1] then
			var_45_0[iter_45_1] = var_0_0.ITEM_ACTIVE
		else
			var_45_0[iter_45_1] = var_0_0.ITEM_FIRST
		end
	end

	return var_45_0
end

function var_0_0.getNormalZoneNames(arg_46_0)
	return underscore(arg_46_0.zoneDic):chain():values():select(function(arg_47_0)
		return not arg_47_0:IsGlobal()
	end):map(function(arg_48_0)
		return arg_48_0:GetWatchCameraName()
	end):value()
end

function var_0_0.getZoneConfig(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = arg_49_0.zoneDic[arg_49_1]

	return arg_49_0.zoneReplaceDic[arg_49_1][arg_49_2] or var_49_0:getConfig(arg_49_2)
end

function var_0_0.getApartmentZoneConfig(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	return Apartment.getGroupConfig(arg_50_3, arg_50_0:getZoneConfig(arg_50_1, arg_50_2))
end

function var_0_0.getAllARAnimationListByShip(arg_51_0, arg_51_1)
	return arg_51_0.shipArAnimationDic[arg_51_1]
end

function var_0_0.getMiniGames(arg_52_0)
	return underscore.rest(pg.dorm3d_minigame.get_id_list_by_room_id[arg_52_0.configId] or {}, 1)
end

function var_0_0.unlockAllInvite(arg_53_0)
	for iter_53_0, iter_53_1 in ipairs(arg_53_0:getConfig("character_pay")) do
		if not arg_53_0.unlockCharacter[iter_53_1] then
			return false
		end
	end

	return true
end

return var_0_0
