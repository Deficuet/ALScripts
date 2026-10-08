local var_0_0 = class("BaseSystem")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.event = arg_1_1
	arg_1_0.scene = arg_1_2
	arg_1_0.context = arg_1_0:WrapContext(arg_1_2)
	arg_1_0.bindings = {}
	arg_1_0.isInitialized = false
end

function var_0_0.WrapContext(arg_2_0, arg_2_1)
	return {
		GetModelRoot = function()
			return arg_2_1:GetModelRoot()
		end,
		GetCurrentLadyEnv = function()
			return arg_2_1:GetCurrentLadyEnv()
		end,
		GetLadyBaseZone = function(arg_5_0)
			return arg_2_1:GetLadyBaseZone(arg_5_0)
		end,
		GetSceneItem = function(arg_6_0)
			return arg_2_1:GetSceneItem(arg_6_0)
		end,
		GetFurnitureSlotRoot = function()
			return arg_2_1.slotRoot
		end,
		GetZoneByName = function(arg_8_0)
			return arg_2_1:GetZoneByName(arg_8_0)
		end,
		GetIKPointByName = function(arg_9_0)
			return arg_2_1:GetIKPointByName(arg_9_0)
		end,
		GetLoader = function()
			return arg_2_1.loader
		end,
		GetRoom = function()
			return arg_2_1.room
		end,
		GetTimeIndex = function()
			return arg_2_1.contextData and arg_2_1.contextData.timeIndex
		end,
		CheckSceneItemActive = function(arg_13_0)
			if arg_2_1.CheckSceneItemActive then
				return arg_2_1:CheckSceneItemActive(arg_13_0)
			end

			return true
		end,
		IsModeInHidePending = function(arg_14_0)
			if arg_2_1.IsModeInHidePending then
				return arg_2_1:IsModeInHidePending(arg_14_0)
			end

			return false
		end,
		GetIsInFurnitureSelect = function()
			return arg_2_1.isInFurnitureSelect
		end,
		GetSceneRaycaster = function()
			return arg_2_1.sceneRaycaster
		end,
		GetPlayer = function()
			return arg_2_1.player
		end,
		GetLadyDict = function()
			return arg_2_1.ladyDict
		end,
		GetSkinDict = function()
			return arg_2_1.skinDict
		end,
		GetMainCameraTF = function()
			return arg_2_1.mainCameraTF
		end,
		GetPosConfigRoot = function()
			return arg_2_1.posConfigRoot
		end,
		GetCameraRoot = function()
			return arg_2_1.cameraRoot
		end,
		GetApartment = function()
			return arg_2_1.apartment
		end,
		GetUIState = function()
			return arg_2_1.uiState
		end,
		GetCamBrain = function()
			return arg_2_1.camBrain
		end,
		GetCameras = function()
			return arg_2_1.cameras
		end,
		GetRaycastCamera = function()
			return arg_2_1.raycastCamera
		end,
		GetNowTimelinePlayer = function()
			return arg_2_1.nowTimelinePlayer
		end,
		_raw = arg_2_1
	}
end

function var_0_0.Init(arg_29_0)
	if arg_29_0.isInitialized then
		warning(arg_29_0.__cname .. " already initialized")

		return
	end

	arg_29_0.isInitialized = true

	arg_29_0:OnInit()
	arg_29_0:RegisterEvents()
end

function var_0_0.OnInit(arg_30_0)
	return
end

function var_0_0.RegisterEvents(arg_31_0)
	return
end

function var_0_0.Emit(arg_32_0, arg_32_1, ...)
	arg_32_0.event:emit(arg_32_1, ...)
end

function var_0_0.Bind(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0.bindings[arg_33_1] = arg_33_0.bindings[arg_33_1] or {}

	table.insert(arg_33_0.bindings[arg_33_1], arg_33_2)
	arg_33_0.event:connect(arg_33_1, arg_33_2)
end

function var_0_0.Unbind(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0.bindings[arg_34_1]

	if not var_34_0 then
		return
	end

	for iter_34_0, iter_34_1 in ipairs(var_34_0) do
		arg_34_0.event:disconnect(arg_34_1, iter_34_1)
	end

	arg_34_0.bindings[arg_34_1] = nil
end

function var_0_0.UnbindAll(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.bindings) do
		arg_35_0:Unbind(iter_35_0)
	end

	arg_35_0.bindings = {}
end

function var_0_0.Update(arg_36_0, arg_36_1)
	if not arg_36_0.isInitialized then
		return
	end

	arg_36_0:OnUpdate(arg_36_1)
end

function var_0_0.OnUpdate(arg_37_0, arg_37_1)
	return
end

function var_0_0.LateUpdate(arg_38_0, arg_38_1)
	if not arg_38_0.isInitialized then
		return
	end

	arg_38_0:OnLateUpdate(arg_38_1)
end

function var_0_0.OnLateUpdate(arg_39_0, arg_39_1)
	return
end

function var_0_0.HandleNotification(arg_40_0, arg_40_1, arg_40_2)
	if not arg_40_0.isInitialized then
		return
	end

	arg_40_0:OnHandleNotification(arg_40_1, arg_40_2)
end

function var_0_0.OnHandleNotification(arg_41_0, arg_41_1, arg_41_2)
	return
end

function var_0_0.GetInterests()
	return {}
end

function var_0_0.Func(arg_43_0, arg_43_1, ...)
	if not arg_43_0.isInitialized then
		return nil
	end

	local var_43_0 = arg_43_0.scene

	if not var_43_0 then
		warning("Scene is nil")

		return nil
	end

	local var_43_1 = var_43_0[arg_43_1]

	if not var_43_1 then
		warning("Method " .. arg_43_1 .. " not found in scene")

		return nil
	end

	return var_43_1(var_43_0, ...)
end

function var_0_0.Get(arg_44_0, arg_44_1)
	if not arg_44_0.isInitialized then
		return nil
	end

	return arg_44_0.scene[arg_44_1]
end

function var_0_0.GetModelRoot(arg_45_0)
	return arg_45_0.context.GetModelRoot()
end

function var_0_0.GetCurrentLadyEnv(arg_46_0)
	return arg_46_0.context.GetCurrentLadyEnv()
end

function var_0_0.GetLadyBaseZone(arg_47_0, arg_47_1)
	return arg_47_0.context.GetLadyBaseZone(arg_47_1)
end

function var_0_0.GetSceneItem(arg_48_0, arg_48_1)
	return arg_48_0.context.GetSceneItem(arg_48_1)
end

function var_0_0.GetFurnitureSlotRoot(arg_49_0)
	return arg_49_0.context.GetFurnitureSlotRoot()
end

function var_0_0.GetZoneByName(arg_50_0, arg_50_1)
	return arg_50_0.context.GetZoneByName(arg_50_1)
end

function var_0_0.GetIKPointByName(arg_51_0, arg_51_1)
	return arg_51_0.context.GetIKPointByName(arg_51_1)
end

function var_0_0.GetLoader(arg_52_0)
	return arg_52_0.context.GetLoader()
end

function var_0_0.GetRoom(arg_53_0)
	return arg_53_0.context.GetRoom()
end

function var_0_0.GetTimeIndex(arg_54_0)
	return arg_54_0.context.GetTimeIndex()
end

function var_0_0.CheckSceneItemActive(arg_55_0, arg_55_1)
	return arg_55_0.context.CheckSceneItemActive(arg_55_1)
end

function var_0_0.IsModeInHidePending(arg_56_0, arg_56_1)
	return arg_56_0.context.IsModeInHidePending(arg_56_1)
end

function var_0_0.GetIsInFurnitureSelect(arg_57_0)
	return arg_57_0.context.GetIsInFurnitureSelect()
end

function var_0_0.GetSceneRaycaster(arg_58_0)
	return arg_58_0.context.GetSceneRaycaster()
end

function var_0_0.GetPlayer(arg_59_0)
	return arg_59_0.context.GetPlayer()
end

function var_0_0.GetLadyDict(arg_60_0)
	return arg_60_0.context.GetLadyDict()
end

function var_0_0.GetSkinDict(arg_61_0)
	return arg_61_0.context.GetSkinDict()
end

function var_0_0.GetMainCameraTF(arg_62_0)
	return arg_62_0.context.GetMainCameraTF()
end

function var_0_0.GetPosConfigRoot(arg_63_0)
	return arg_63_0.context.GetPosConfigRoot()
end

function var_0_0.GetCameraRoot(arg_64_0)
	return arg_64_0.context.GetCameraRoot()
end

function var_0_0.GetApartment(arg_65_0)
	return arg_65_0.context.GetApartment()
end

function var_0_0.GetUIState(arg_66_0)
	return arg_66_0.context.GetUIState()
end

function var_0_0.GetCamBrain(arg_67_0)
	return arg_67_0.context.GetCamBrain()
end

function var_0_0.GetCameras(arg_68_0)
	return arg_68_0.context.GetCameras()
end

function var_0_0.GetRaycastCamera(arg_69_0)
	return arg_69_0.context.GetRaycastCamera()
end

function var_0_0.GetNowTimelinePlayer(arg_70_0)
	return arg_70_0.context.GetNowTimelinePlayer()
end

function var_0_0.IsOpen()
	return true
end

function var_0_0.GetName(arg_72_0)
	return arg_72_0.__cname or "BaseSystem"
end

function var_0_0.Dispose(arg_73_0)
	arg_73_0:OnDispose()
	arg_73_0:UnbindAll()

	arg_73_0.event = nil
	arg_73_0.context = nil
	arg_73_0.scene = nil
	arg_73_0.isInitialized = false
end

function var_0_0.OnDispose(arg_74_0)
	return
end

return var_0_0
