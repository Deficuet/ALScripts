local var_0_0 = class("Dorm3dInsCharRoom", import(".Dorm3dInsRoom"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.groupId = arg_1_0:GetConfig("character")[1]
	arg_1_0.isCare = getProxy(Dorm3dChatProxy):GetChatCare(arg_1_0.groupId) == 1
end

function var_0_0.GetName(arg_2_0)
	return ShipGroup.getDefaultShipNameByGroupID(arg_2_0.groupId)
end

function var_0_0.GetFurnitureNum(arg_3_0)
	local var_3_0 = getProxy(ApartmentProxy):getRoom(arg_3_0.id)

	if not var_3_0 then
		return 0
	end

	return #_.keys(var_3_0:GetFurnitures())
end

function var_0_0.GetGiftNum(arg_4_0)
	local var_4_0 = pg.dorm3d_gift.get_id_list_by_ship_group_id[arg_4_0.groupId]
	local var_4_1 = getProxy(ApartmentProxy)

	return _.reduce(var_4_0, 0, function(arg_5_0, arg_5_1)
		return arg_5_0 + var_4_1:GetGiftShopCount(arg_5_1)
	end)
end

function var_0_0.GetLastVisit(arg_6_0)
	local var_6_0 = getProxy(ApartmentProxy):getApartment(arg_6_0.groupId)
	local var_6_1 = var_6_0 and var_6_0.visitTime or 0

	if var_6_1 == 0 then
		return i18n("dorm3d_privatechat_no_visit_time")
	end

	local var_6_2 = math.floor((pg.TimeMgr.GetInstance():GetServerTime() - var_6_1) / 86400)

	return var_6_2 == 0 and i18n("dorm3d_privatechat_visit_time_now") or i18n("dorm3d_privatechat_visit_time", var_6_2)
end

function var_0_0.GetFavorLevel(arg_7_0)
	local var_7_0 = getProxy(ApartmentProxy):getApartment(arg_7_0.groupId)

	return var_7_0 and var_7_0.level or 0
end

function var_0_0.GetCard(arg_8_0)
	local var_8_0 = Apartment.New({
		ship_group = arg_8_0.groupId
	}):GetSkinModelID(arg_8_0:GetConfig("tag"))

	return string.format("dorm3dselect/apartment_skin_%d", var_8_0)
end

function var_0_0.IsCare(arg_9_0)
	return arg_9_0.isCare
end

function var_0_0.SetCare(arg_10_0, arg_10_1)
	arg_10_0.isCare = arg_10_1 == 1

	getProxy(Dorm3dChatProxy):SetChatCare(arg_10_0.groupId, arg_10_1)
end

function var_0_0.ShouldTip(arg_11_0)
	if not arg_11_0:IsDownloaded() then
		return false
	end

	return getProxy(Dorm3dInsProxy):AnyInstagramShouldTip(arg_11_0.groupId) or getProxy(Dorm3dInsProxy):ShoudTipPhoneById(arg_11_0.groupId) or getProxy(Dorm3dChatProxy):ShouldShowShipTip(arg_11_0.groupId)
end

function var_0_0.GetInsContent(arg_12_0)
	if arg_12_0:IsDownloaded() and getProxy(Dorm3dInsProxy):AnyInstagramShouldTip(arg_12_0.groupId) then
		return true, i18n("dorm3d_privatechat_new_topics", arg_12_0:GetConfig("room"))
	else
		return false, i18n("dorm3d_privatechat_nonew_topics")
	end
end

function var_0_0.GetPhoneContent(arg_13_0)
	if arg_13_0:IsDownloaded() and getProxy(Dorm3dInsProxy):ShoudTipPhoneById(arg_13_0.groupId) then
		return true, i18n("dorm3d_privatechat_new_calls")
	else
		return false, i18n("dorm3d_privatechat_nonew_calls")
	end
end

function var_0_0.GetChatContent(arg_14_0)
	if arg_14_0:IsDownloaded() and getProxy(Dorm3dChatProxy):ShouldShowShipTip(arg_14_0.groupId) then
		return true, i18n("dorm3d_privatechat_nonew_messages")
	else
		return false, i18n("dorm3d_privatechat_new_messages")
	end
end

return var_0_0
