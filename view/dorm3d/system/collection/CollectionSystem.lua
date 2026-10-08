local var_0_0 = class("CollectionSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.TEMP_HIDE = "CollectionSystem.TEMP_HIDE"
var_0_0.UPDATE_CONTACT_STATE = "CollectionSystem.UPDATE_CONTACT_STATE"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.contactStateDic = {}
	arg_1_0.hideContactStateDic = {}
	arg_1_0.contactInRangeDic = {}
	arg_1_0.transRangeDic = {
		list = {}
	}
	arg_1_0.uiHidden = false
	arg_1_0.tempHidden = false
	arg_1_0.contactTriggers = {}
	arg_1_0.artSceneChanging = false
	arg_1_0.artSceneBlocked = false

	arg_1_0:UpdateContactState()
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.UPDATE_CONTACT_STATE, function(arg_3_0, arg_3_1)
		arg_2_0:UpdateContactState(arg_3_1)
	end)
	arg_2_0:Bind(var_0_0.TEMP_HIDE, function(arg_4_0, arg_4_1)
		arg_2_0.tempHidden = arg_4_1

		arg_2_0:ActiveContact()
	end)
	arg_2_0:Bind(FurnitureSystem.REFRESH_DONE, function()
		arg_2_0:ActiveContact()
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_WILL_CHANGE, function(arg_6_0, arg_6_1, arg_6_2)
		arg_2_0.artSceneChanging = true
		arg_2_0.artSceneBlocked = not arg_6_2

		arg_2_0:ClearContactBindings()
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_CHANGED, function(arg_7_0, arg_7_1, arg_7_2)
		arg_2_0.artSceneChanging = false
		arg_2_0.artSceneBlocked = not arg_7_2

		if arg_7_2 then
			arg_2_0:UpdateContactState()
		end
	end)
end

function var_0_0.OnHandleNotification(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 == GAME.APARTMENT_COLLECTION_ITEM_DONE then
		arg_8_0:UpdateContactState()
	elseif arg_8_1 == Dorm3dRoomScene.NOTIFY_UI_STATE then
		arg_8_0.uiHidden = arg_8_2 ~= "base"

		arg_8_0:ActiveContact()
	end
end

function var_0_0.GetInterests()
	return {
		GAME.APARTMENT_COLLECTION_ITEM_DONE,
		Dorm3dRoomScene.NOTIFY_UI_STATE
	}
end

function var_0_0.OnUpdate(arg_10_0)
	if arg_10_0.artSceneChanging or arg_10_0.artSceneBlocked or not arg_10_0.transformFilter or not arg_10_0.contactInRangeDic then
		return
	end

	local var_10_0 = arg_10_0.transformFilter:Execute():ToTable()

	for iter_10_0, iter_10_1 in pairs(arg_10_0.contactInRangeDic) do
		local var_10_1 = arg_10_0.transRangeDic[iter_10_0]
		local var_10_2 = false

		if var_10_1 then
			var_10_2 = underscore(var_10_0):chain():slice(unpack(var_10_1)):any(function(arg_11_0)
				return arg_11_0
			end):value()
		end

		if tobool(iter_10_1) ~= var_10_2 then
			arg_10_0.contactInRangeDic[iter_10_0] = var_10_2

			arg_10_0:UpdateContactDisplay(iter_10_0, arg_10_0:GetDisplayState(iter_10_0))
		end
	end
end

function var_0_0.UpdateContactState(arg_12_0, arg_12_1)
	if arg_12_0.artSceneChanging or arg_12_0.artSceneBlocked then
		return
	end

	local var_12_0 = arg_12_0:GetRoom()

	if not var_12_0 then
		warning("CollectionSystem cannot update without room")

		return
	end

	arg_12_1 = arg_12_1 or arg_12_0:GetTimeIndex()

	arg_12_0:SetContactStateDic(var_12_0:getTriggerableCollectItemDic(arg_12_1))
end

function var_0_0.SetContactStateDic(arg_13_0, arg_13_1)
	arg_13_0.contactStateDic = arg_13_1 or {}
	arg_13_0.hideContactStateDic = {}
	arg_13_0.contactInRangeDic = {}
	arg_13_0.transRangeDic = {
		list = {}
	}
	arg_13_0.transformFilter = arg_13_0.transformFilter or BLHX.Rendering.TransformFilter.New()

	local var_13_0 = arg_13_0:GetModelRoot()

	for iter_13_0, iter_13_1 in pairs(arg_13_0.contactStateDic) do
		arg_13_0.hideContactStateDic[iter_13_0] = math.min(iter_13_1, ApartmentRoom.ITEM_UNLOCK)
		arg_13_0.contactInRangeDic[iter_13_0] = false

		local var_13_1 = pg.dorm3d_collection_template[iter_13_0].vfx_prefab or {}

		arg_13_0.transRangeDic[iter_13_0] = {
			#arg_13_0.transRangeDic.list + 1,
			#arg_13_0.transRangeDic.list + #var_13_1
		}

		table.insertto(arg_13_0.transRangeDic.list, underscore.map(var_13_1, function(arg_14_0)
			return var_13_0:Find(arg_14_0)
		end))
	end

	arg_13_0.transformFilter:Init(arg_13_0:GetMainCameraTF(), arg_13_0.transRangeDic.list, 2, 60)
	arg_13_0:ActiveContact()
end

function var_0_0.GetDisplayState(arg_15_0, arg_15_1)
	if arg_15_0.contactInRangeDic[arg_15_1] and not arg_15_0.uiHidden and not arg_15_0.tempHidden then
		return arg_15_0.contactStateDic[arg_15_1]
	end

	return arg_15_0.hideContactStateDic[arg_15_1]
end

function var_0_0.ActiveContact(arg_16_0)
	if arg_16_0.artSceneChanging or arg_16_0.artSceneBlocked then
		return
	end

	for iter_16_0 in pairs(arg_16_0.contactInRangeDic) do
		arg_16_0:UpdateContactDisplay(iter_16_0, arg_16_0:GetDisplayState(iter_16_0))
	end
end

function var_0_0.UpdateContactDisplay(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = pg.dorm3d_collection_template[arg_17_1]
	local var_17_1 = arg_17_0:GetModelRoot()

	for iter_17_0, iter_17_1 in ipairs(var_17_0.vfx_prefab or {}) do
		local var_17_2 = var_17_1:Find(iter_17_1)

		if arg_17_0:IsModeInHidePending(iter_17_1) then
			-- block empty
		elseif not var_17_2 then
			warning("cannot find", arg_17_1, iter_17_1)
		else
			setActive(var_17_2, arg_17_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_17_2, iter_17_3 in ipairs(var_17_0.model or {}) do
		local var_17_3 = var_17_1:Find(iter_17_3)

		if arg_17_0:IsModeInHidePending(iter_17_3) then
			arg_17_0:DisableContactTrigger(var_17_3)
		elseif not var_17_3 then
			warning("cannot find", arg_17_1, iter_17_3)
		elseif not arg_17_0:CheckSceneItemActive(var_17_3) then
			arg_17_0:DisableContactTrigger(var_17_3)
		else
			if arg_17_2 == ApartmentRoom.ITEM_FIRST then
				arg_17_0:GetContactTrigger(var_17_3, arg_17_1).enabled = true
			else
				arg_17_0:DisableContactTrigger(var_17_3)
			end

			setActive(var_17_3, arg_17_2 > ApartmentRoom.ITEM_LOCK)
		end
	end
end

function var_0_0.GetContactTrigger(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.contactTriggers[arg_18_1]

	if var_18_0 then
		return var_18_0
	end

	local var_18_1 = GetComponent(arg_18_1, typeof(EventTriggerListener)) or GetOrAddComponent(arg_18_1, typeof(EventTriggerListener))

	var_18_1:AddPointClickFunc(function()
		arg_18_0:OnContactClick(arg_18_2)
	end)

	arg_18_0.contactTriggers[arg_18_1] = var_18_1

	return var_18_1
end

function var_0_0.DisableContactTrigger(arg_20_0, arg_20_1)
	if not arg_20_1 then
		return
	end

	local var_20_0 = arg_20_0.contactTriggers[arg_20_1]

	if var_20_0 then
		var_20_0.enabled = false
	end
end

function var_0_0.OnContactClick(arg_21_0, arg_21_1)
	if arg_21_0.uiHidden or arg_21_0.tempHidden then
		return
	end

	local var_21_0 = arg_21_0:GetRoom()

	if not var_21_0 then
		return
	end

	local var_21_1 = arg_21_0:GetApartment()

	arg_21_0:Emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_21_1,
		roomId = var_21_0:GetConfigID(),
		groupId = var_21_0:isPersonalRoom() and var_21_1:GetConfigID() or 0
	})
end

function var_0_0.OnDispose(arg_22_0)
	arg_22_0:ClearContactBindings()

	arg_22_0.artSceneChanging = true
	arg_22_0.contactTriggers = nil
	arg_22_0.transformFilter = nil
end

function var_0_0.ClearContactBindings(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.contactTriggers or {}) do
		iter_23_1.enabled = false

		iter_23_1:RemovePointClickFunc()
	end

	arg_23_0.contactTriggers = {}
	arg_23_0.transformFilter = nil
end

return var_0_0
