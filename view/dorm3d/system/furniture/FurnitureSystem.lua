local var_0_0 = class("FurnitureSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.REFRESH_SLOTS = "FurnitureSystem.REFRESH_SLOTS"
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
	arg_2_0:Bind(var_0_0.REFRESH_SLOTS_EMPTY, function(arg_4_0, arg_4_1)
		arg_2_0:RefreshSlotsEmpty(arg_4_1)
	end)
	arg_2_0:Bind(var_0_0.DISPLAY_SLOTS, function(arg_5_0, arg_5_1)
		arg_2_0:DisplayFurnitureSlots(arg_5_1)
	end)
	arg_2_0:Bind(var_0_0.HIDE_SLOTS, function()
		arg_2_0:HideFurnitureSlots()
	end)
	arg_2_0:Bind(var_0_0.UPDATE_DISPLAY_SLOTS, function(arg_7_0, arg_7_1)
		arg_2_0:UpdateDisplaySlots(arg_7_1)
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_WILL_CHANGE, function()
		arg_2_0.artSceneChanging = true

		for iter_8_0, iter_8_1 in pairs(arg_2_0.slotDict or {}) do
			iter_8_1.model = nil
			iter_8_1.sceneHides = {}
		end
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_CHANGED, function()
		arg_2_0.artSceneChanging = false

		arg_2_0:RebindModels()
	end)
end

function var_0_0.InitSlots(arg_10_0)
	local var_10_0 = arg_10_0:GetRoom()

	assert(var_10_0, "FurnitureSystem requires room")

	local var_10_1 = arg_10_0:GetModelRoot()
	local var_10_2 = var_10_0:GetSlots()
	local var_10_3 = var_10_1:GetComponentsInChildren(typeof(Transform), true):ToTable()

	_.each(var_10_2, function(arg_11_0)
		local var_11_0 = arg_11_0:GetFurnitureName()
		local var_11_1 = arg_11_0:GetConfigID()
		local var_11_2 = arg_10_0.slotRoot:Find(tostring(var_11_1))

		if not var_11_2 then
			errorMsg("Not Find Slot: " .. var_11_1)

			return
		end

		local var_11_3 = {
			trans = var_11_2,
			name = var_11_0,
			sceneHides = {}
		}
		local var_11_4 = var_11_2:Find("Selector")

		if var_11_4 then
			local var_11_5 = GetOrAddComponent(var_11_4, typeof(EventTriggerListener))

			var_11_5:AddPointClickFunc(function()
				arg_10_0:Emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_11_1)
			end)
			setActive(var_11_4, false)

			arg_10_0.slotTriggers[var_11_1] = var_11_5
		end

		for iter_11_0, iter_11_1 in ipairs(var_10_3) do
			if iter_11_1.name == var_11_0 then
				var_11_3.model = iter_11_1

				break
			end
		end

		arg_10_0.slotDict[var_11_1] = var_11_3
	end)
end

function var_0_0.RefreshSlots(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0.artSceneChanging then
		existCall(arg_13_2)

		return
	end

	arg_13_1 = arg_13_1 or arg_13_0:GetRoom()

	assert(arg_13_1, "FurnitureSystem requires room")

	local var_13_0 = arg_13_1:GetSlots()
	local var_13_1 = arg_13_1:GetFurnitures()
	local var_13_2 = arg_13_0:GetModelRoot()
	local var_13_3 = arg_13_0:GetLoader()

	arg_13_0:Emit(Dorm3dRoomTemplateScene.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_13_0, function(arg_14_0, arg_14_1, arg_14_2)
		local var_14_0 = arg_14_1:GetConfigID()
		local var_14_1 = arg_13_0.slotDict[var_14_0]

		if not var_14_1 then
			return arg_14_2()
		end

		local var_14_2 = _.detect(var_13_1, function(arg_15_0)
			return arg_15_0:GetSlotID() == var_14_0
		end)
		local var_14_3 = var_14_2 and var_14_2:GetModel(arg_13_0:GetTimeIndex()) or false
		local var_14_4 = var_14_1.model

		var_14_1.displayModelName = var_14_3
		var_14_1.furnitureId = var_14_2 and var_14_2:GetConfigID()

		local function var_14_5(arg_16_0)
			if var_14_4 then
				setActive(var_14_4, var_14_3 == "")
			end

			table.Foreach(var_14_1.sceneHides or {}, function(arg_17_0, arg_17_1)
				setActive(arg_17_1.trans, arg_17_1.visible)
			end)

			var_14_1.sceneHides = {}

			if not arg_16_0 then
				return
			end

			local var_16_0 = arg_16_0:getConfig("scene_hides")

			if type(var_16_0) == "table" and #var_16_0 > 0 then
				table.Ipairs(var_16_0, function(arg_18_0, arg_18_1)
					local var_18_0 = var_13_2:Find(arg_18_1)

					assert(var_18_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_16_0:GetConfigID(), arg_18_1))
					table.insert(var_14_1.sceneHides, {
						name = arg_18_1,
						trans = var_18_0,
						visible = isActive(var_18_0)
					})
					setActive(var_18_0, false)
				end)
			end
		end

		if var_14_3 == false or var_14_3 == "" then
			var_13_3:ClearRequest("slot_" .. var_14_0)
			var_14_5()

			return arg_14_2()
		end

		local var_14_6 = var_14_1.trans

		if var_13_3:GetLoadingRP("slot_" .. var_14_0) then
			arg_13_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)
		end

		var_13_3:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_14_3, "", function(arg_19_0)
			assert(arg_19_0)
			setParent(arg_19_0, var_14_6)
			var_14_5(var_14_2)
			arg_14_2()
		end, "slot_" .. var_14_0)
	end, function()
		arg_13_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)
		existCall(arg_13_2)
		warning("RefreshSlots", "Done")
		arg_13_0:Emit(var_0_0.REFRESH_DONE)
	end)
end

function var_0_0.RefreshSlotsEmpty(arg_21_0, arg_21_1)
	local var_21_0 = Clone(arg_21_0:GetRoom())

	var_21_0.furnitures = {}

	arg_21_0:RefreshSlots(var_21_0, arg_21_1)
end

function var_0_0.CheckSceneItemActive(arg_22_0, arg_22_1)
	local var_22_0 = true
	local var_22_1

	table.Checkout(arg_22_0.slotDict, function(arg_23_0, arg_23_1)
		if underscore.detect(arg_23_1.sceneHides, function(arg_24_0)
			return arg_24_0.trans == arg_22_1
		end) then
			var_22_0 = false
			var_22_1 = arg_23_1.furnitureId

			return false
		end
	end)

	return var_22_0, var_22_1
end

function var_0_0.GetSlotByID(arg_25_0, arg_25_1)
	assert(arg_25_0.isInitialized, "FurnitureSystem is not initialized")

	return arg_25_0.displaySlots and arg_25_0.displaySlots[arg_25_1] and arg_25_0.displaySlots[arg_25_1].trans
end

function var_0_0.HideFurnitureSlots(arg_26_0)
	if not arg_26_0.displaySlots then
		return
	end

	arg_26_0:UpdateDisplaySlots({})
	table.Foreach(arg_26_0.displaySlots, function(arg_27_0, arg_27_1)
		local var_27_0 = arg_27_1.trans:Find("Selector")

		if not IsNil(var_27_0) then
			setActive(var_27_0, false)
		end
	end)

	arg_26_0.displaySlots = nil
end

function var_0_0.DisplayFurnitureSlots(arg_28_0, arg_28_1)
	arg_28_0:HideFurnitureSlots()

	arg_28_0.displaySlots = {}

	_.each(arg_28_1, function(arg_29_0)
		local var_29_0 = arg_28_0.slotDict[arg_29_0]

		arg_28_0.displaySlots[arg_29_0] = var_29_0

		if not var_29_0 then
			errorMsg("Slot " .. arg_29_0 .. " Not Binding Scene Object")

			return
		end

		local var_29_1 = var_29_0.trans:Find("Selector")

		if var_29_1 then
			setActive(var_29_1, true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_30_0, arg_30_1)
	table.Foreach(arg_30_0.displaySlots, function(arg_31_0, arg_31_1)
		local var_31_0 = arg_31_1.trans
		local var_31_1 = var_31_0:Find("Selector")

		if not IsNil(var_31_1) then
			setActive(var_31_0:Find("Selector/Normal"), arg_30_1[arg_31_0] == 0)
			setActive(var_31_0:Find("Selector/Active"), arg_30_1[arg_31_0] == 1)
			setActive(var_31_0:Find("Selector/Ban"), arg_30_1[arg_31_0] == 2)
		end

		local var_31_2 = arg_31_1.model

		if arg_31_1.displayModelName and arg_31_1.displayModelName ~= "" then
			var_31_2 = var_31_0:GetChild(var_31_0.childCount - 1)
		end

		if not var_31_2 then
			return
		end

		local var_31_3 = arg_30_1[arg_31_0] == 1 and Color.NewHex("3F83AE73") or Color.New(0, 0, 0, 0)
		local var_31_4 = var_31_2:GetComponentsInChildren(typeof(Renderer), true)

		table.IpairsCArray(var_31_4, function(arg_32_0, arg_32_1)
			local var_32_0 = arg_32_1.material

			if var_32_0 and var_32_0:HasProperty("_FinalTint") then
				var_32_0:SetColor("_FinalTint", var_31_3)
			end
		end)
	end)
end

function var_0_0.OnDispose(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.slotTriggers or {}) do
		iter_33_1:RemovePointClickFunc()
	end

	arg_33_0.slotTriggers = nil
	arg_33_0.displaySlots = nil
	arg_33_0.slotDict = nil
	arg_33_0.slotRoot = nil
end

function var_0_0.RebindModels(arg_34_0)
	if not arg_34_0.slotDict then
		return
	end

	local var_34_0 = arg_34_0:GetModelRoot():GetComponentsInChildren(typeof(Transform), true):ToTable()

	table.Foreach(arg_34_0.slotDict, function(arg_35_0, arg_35_1)
		arg_35_1.model = nil
		arg_35_1.sceneHides = {}

		for iter_35_0, iter_35_1 in ipairs(var_34_0) do
			if iter_35_1.name == arg_35_1.name then
				arg_35_1.model = iter_35_1

				break
			end
		end
	end)
end

return var_0_0
