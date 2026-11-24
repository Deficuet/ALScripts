local var_0_0 = class("FurnitureSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.REFRESH_SLOTS = "FurnitureSystem.REFRESH_SLOTS"
var_0_0.REFRESH_SLOTS_DEFAULT = "FurnitureSystem.REFRESH_SLOTS_DEFAULT"
var_0_0.REFRESH_SLOTS_EMPTY = "FurnitureSystem.REFRESH_SLOTS_EMPTY"
var_0_0.DISPLAY_SLOTS = "FurnitureSystem.DISPLAY_SLOTS"
var_0_0.HIDE_SLOTS = "FurnitureSystem.HIDE_SLOTS"
var_0_0.UPDATE_DISPLAY_SLOTS = "FurnitureSystem.UPDATE_DISPLAY_SLOTS"
var_0_0.REFRESH_DONE = "FurnitureSystem.REFRESH_DONE"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.slotRoot = arg_1_0:GetFurnitureSlotRoot()

	assert(arg_1_0.slotRoot, "FurnitureSystem requires FurnitureSlots root")

	arg_1_0.slotDict = {}
	arg_1_0.displaySlots = nil
	arg_1_0.slotTriggers = {}
	arg_1_0.artSceneChanging = false

	arg_1_0:InitSlots()
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.REFRESH_SLOTS, function(arg_3_0, arg_3_1, arg_3_2)
		arg_2_0:RefreshSlots(arg_3_1, arg_3_2)
	end)
	arg_2_0:Bind(var_0_0.REFRESH_SLOTS_DEFAULT, function(arg_4_0, arg_4_1)
		arg_2_0:RefreshSlotsDefault(arg_4_1)
	end)
	arg_2_0:Bind(var_0_0.REFRESH_SLOTS_EMPTY, function(arg_5_0, arg_5_1)
		arg_2_0:RefreshSlotsEmpty(arg_5_1)
	end)
	arg_2_0:Bind(var_0_0.DISPLAY_SLOTS, function(arg_6_0, arg_6_1)
		arg_2_0:DisplayFurnitureSlots(arg_6_1)
	end)
	arg_2_0:Bind(var_0_0.HIDE_SLOTS, function()
		arg_2_0:HideFurnitureSlots()
	end)
	arg_2_0:Bind(var_0_0.UPDATE_DISPLAY_SLOTS, function(arg_8_0, arg_8_1)
		arg_2_0:UpdateDisplaySlots(arg_8_1)
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_WILL_CHANGE, function()
		arg_2_0.artSceneChanging = true

		for iter_9_0, iter_9_1 in pairs(arg_2_0.slotDict or {}) do
			iter_9_1.model = nil
			iter_9_1.sceneHides = {}
		end
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_CHANGED, function()
		arg_2_0.artSceneChanging = false

		arg_2_0:RebindModels()
	end)
end

function var_0_0.InitSlots(arg_11_0)
	local var_11_0 = arg_11_0:GetRoom()

	assert(var_11_0, "FurnitureSystem requires room")

	local var_11_1 = arg_11_0:GetModelRoot()
	local var_11_2 = var_11_0:GetSlots()
	local var_11_3 = var_11_1:GetComponentsInChildren(typeof(Transform), true):ToTable()

	_.each(var_11_2, function(arg_12_0)
		local var_12_0 = arg_12_0:GetFurnitureName()
		local var_12_1 = arg_12_0:GetConfigID()
		local var_12_2 = arg_11_0.slotRoot:Find(tostring(var_12_1))

		if not var_12_2 then
			errorMsg("Not Find Slot: " .. var_12_1)

			return
		end

		local var_12_3 = {
			trans = var_12_2,
			name = var_12_0,
			sceneHides = {}
		}
		local var_12_4 = var_12_2:Find("Selector")

		if var_12_4 then
			local var_12_5 = GetOrAddComponent(var_12_4, typeof(EventTriggerListener))

			var_12_5:AddPointClickFunc(function()
				arg_11_0:Emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_12_1)
			end)
			setActive(var_12_4, false)

			arg_11_0.slotTriggers[var_12_1] = var_12_5
		end

		for iter_12_0, iter_12_1 in ipairs(var_11_3) do
			if iter_12_1.name == var_12_0 then
				var_12_3.model = iter_12_1

				break
			end
		end

		arg_11_0.slotDict[var_12_1] = var_12_3
	end)
end

function var_0_0.RefreshSlots(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0.artSceneChanging then
		existCall(arg_14_2)

		return
	end

	arg_14_1 = arg_14_1 or arg_14_0:GetRoom()

	assert(arg_14_1, "FurnitureSystem requires room")

	local var_14_0 = arg_14_1:GetSlots()
	local var_14_1 = arg_14_1:GetFurnitures()
	local var_14_2 = arg_14_0:GetModelRoot()
	local var_14_3 = arg_14_0:GetLoader()

	arg_14_0:Emit(Dorm3dRoomTemplateScene.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_14_0, function(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = arg_15_1:GetConfigID()
		local var_15_1 = arg_14_0.slotDict[var_15_0]

		if not var_15_1 then
			return arg_15_2()
		end

		local var_15_2 = _.detect(var_14_1, function(arg_16_0)
			return arg_16_0:GetSlotID() == var_15_0
		end)
		local var_15_3 = var_15_2 and var_15_2:GetModel(arg_14_0:GetTimeIndex()) or false
		local var_15_4 = var_15_1.model

		var_15_1.displayModelName = var_15_3
		var_15_1.furnitureId = var_15_2 and var_15_2:GetConfigID()

		local function var_15_5(arg_17_0)
			if var_15_4 then
				setActive(var_15_4, var_15_3 == "")
			end

			table.Foreach(var_15_1.sceneHides or {}, function(arg_18_0, arg_18_1)
				setActive(arg_18_1.trans, arg_18_1.visible)
			end)

			var_15_1.sceneHides = {}

			if not arg_17_0 then
				return
			end

			local var_17_0 = arg_17_0:getConfig("scene_hides")

			if type(var_17_0) == "table" and #var_17_0 > 0 then
				table.Ipairs(var_17_0, function(arg_19_0, arg_19_1)
					local var_19_0 = var_14_2:Find(arg_19_1)

					assert(var_19_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_17_0:GetConfigID(), arg_19_1))
					table.insert(var_15_1.sceneHides, {
						name = arg_19_1,
						trans = var_19_0,
						visible = isActive(var_19_0)
					})
					setActive(var_19_0, false)
				end)
			end
		end

		if var_15_3 == false or var_15_3 == "" then
			var_14_3:ClearRequest("slot_" .. var_15_0)
			var_15_5()

			return arg_15_2()
		end

		local var_15_6 = var_15_1.trans

		if var_14_3:GetLoadingRP("slot_" .. var_15_0) then
			arg_14_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)
		end

		var_14_3:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_15_3, "", function(arg_20_0)
			assert(arg_20_0)
			setParent(arg_20_0, var_15_6)
			var_15_5(var_15_2)
			arg_15_2()
		end, "slot_" .. var_15_0)
	end, function()
		arg_14_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)
		existCall(arg_14_2)
		warning("RefreshSlots", "Done")
		arg_14_0:Emit(var_0_0.REFRESH_DONE)
	end)
end

function var_0_0.RefreshSlotsDefault(arg_22_0, arg_22_1)
	local var_22_0 = Clone(arg_22_0:GetRoom())

	var_22_0.furnitures = {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0:GetSlots()) do
		local var_22_1 = iter_22_1:GetDefaultFurniture()

		if var_22_1 > 0 then
			table.insert(var_22_0.furnitures, Dorm3dFurniture.New({
				configId = var_22_1,
				slotId = iter_22_1:GetConfigID()
			}))
		end
	end

	arg_22_0:RefreshSlots(var_22_0, arg_22_1)
end

function var_0_0.RefreshSlotsEmpty(arg_23_0, arg_23_1)
	local var_23_0 = Clone(arg_23_0:GetRoom())

	var_23_0.furnitures = {}

	arg_23_0:RefreshSlots(var_23_0, arg_23_1)
end

function var_0_0.CheckSceneItemActive(arg_24_0, arg_24_1)
	local var_24_0 = true
	local var_24_1

	table.Checkout(arg_24_0.slotDict, function(arg_25_0, arg_25_1)
		if underscore.detect(arg_25_1.sceneHides, function(arg_26_0)
			return arg_26_0.trans == arg_24_1
		end) then
			var_24_0 = false
			var_24_1 = arg_25_1.furnitureId

			return false
		end
	end)

	return var_24_0, var_24_1
end

function var_0_0.GetSlotByID(arg_27_0, arg_27_1)
	assert(arg_27_0.isInitialized, "FurnitureSystem is not initialized")

	return arg_27_0.displaySlots and arg_27_0.displaySlots[arg_27_1] and arg_27_0.displaySlots[arg_27_1].trans
end

function var_0_0.HideFurnitureSlots(arg_28_0)
	if not arg_28_0.displaySlots then
		return
	end

	arg_28_0:UpdateDisplaySlots({})
	table.Foreach(arg_28_0.displaySlots, function(arg_29_0, arg_29_1)
		local var_29_0 = arg_29_1.trans:Find("Selector")

		if not IsNil(var_29_0) then
			setActive(var_29_0, false)
		end
	end)

	arg_28_0.displaySlots = nil
end

function var_0_0.DisplayFurnitureSlots(arg_30_0, arg_30_1)
	arg_30_0:HideFurnitureSlots()

	arg_30_0.displaySlots = {}

	_.each(arg_30_1, function(arg_31_0)
		local var_31_0 = arg_30_0.slotDict[arg_31_0]

		arg_30_0.displaySlots[arg_31_0] = var_31_0

		if not var_31_0 then
			errorMsg("Slot " .. arg_31_0 .. " Not Binding Scene Object")

			return
		end

		local var_31_1 = var_31_0.trans:Find("Selector")

		if var_31_1 then
			setActive(var_31_1, true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_32_0, arg_32_1)
	table.Foreach(arg_32_0.displaySlots, function(arg_33_0, arg_33_1)
		local var_33_0 = arg_33_1.trans
		local var_33_1 = var_33_0:Find("Selector")

		if not IsNil(var_33_1) then
			setActive(var_33_0:Find("Selector/Normal"), arg_32_1[arg_33_0] == 0)
			setActive(var_33_0:Find("Selector/Active"), arg_32_1[arg_33_0] == 1)
			setActive(var_33_0:Find("Selector/Ban"), arg_32_1[arg_33_0] == 2)
		end

		local var_33_2 = arg_33_1.model

		if arg_33_1.displayModelName and arg_33_1.displayModelName ~= "" then
			var_33_2 = var_33_0:GetChild(var_33_0.childCount - 1)
		end

		if not var_33_2 then
			return
		end

		local var_33_3 = arg_32_1[arg_33_0] == 1 and Color.NewHex("3F83AE73") or Color.New(0, 0, 0, 0)
		local var_33_4 = var_33_2:GetComponentsInChildren(typeof(Renderer), true)

		table.IpairsCArray(var_33_4, function(arg_34_0, arg_34_1)
			local var_34_0 = arg_34_1.material

			if var_34_0 and var_34_0:HasProperty("_FinalTint") then
				var_34_0:SetColor("_FinalTint", var_33_3)
			end
		end)
	end)
end

function var_0_0.OnDispose(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.slotTriggers or {}) do
		iter_35_1:RemovePointClickFunc()
	end

	arg_35_0.slotTriggers = nil
	arg_35_0.displaySlots = nil
	arg_35_0.slotDict = nil
	arg_35_0.slotRoot = nil
end

function var_0_0.RebindModels(arg_36_0)
	if not arg_36_0.slotDict then
		return
	end

	local var_36_0 = arg_36_0:GetModelRoot():GetComponentsInChildren(typeof(Transform), true):ToTable()

	table.Foreach(arg_36_0.slotDict, function(arg_37_0, arg_37_1)
		arg_37_1.model = nil
		arg_37_1.sceneHides = {}

		for iter_37_0, iter_37_1 in ipairs(var_36_0) do
			if iter_37_1.name == arg_37_1.name then
				arg_37_1.model = iter_37_1

				break
			end
		end
	end)
end

return var_0_0
