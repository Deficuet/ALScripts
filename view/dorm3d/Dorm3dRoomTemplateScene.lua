local var_0_0 = class("Dorm3dRoomTemplateScene", import("view.base.BaseUI"))

var_0_0.CAMERA = {
	GIFT = 8,
	PHOTO_FREE = 11,
	TALK = 4,
	PHOTO = 10,
	POV = 12,
	IK_WATCH = 13,
	CUSTOM = 15,
	ROLE = 3,
	AIM = 1,
	ROLE2 = 9,
	FURNITURE_WATCH = 7,
	SKIN = 14,
	AIM2 = 2
}
var_0_0.CAMERA_MAX_OPERATION = {
	RIGHT = "right",
	DOWN = "donw",
	ZOOMIN = "zoom_in",
	ZOOMOUT = "zoom_out",
	UP = "up",
	LEFT = "left"
}
var_0_0.ANIM = {
	IDLE = "Idle"
}
var_0_0.PLAY_EXPRESSION = "Dorm3dRoomTemplateScene.PLAY_EXPRESSION"
var_0_0.MOVE_PLAYER_TO_FURNITURE = "Dorm3dRoomTemplateScene.MOVE_PLAYER_TO_FURNITURE"
var_0_0.SHOW_BLOCK = "Dorm3dRoomTemplateScene.SHOW_BLOCK"
var_0_0.HIDE_BLOCK = "Dorm3dRoomTemplateScene.HIDE_BLOCK"
var_0_0.ON_TOUCH_CHARACTER = "Dorm3dRoomTemplateScene.ON_TOUCH_CHARACTER"
var_0_0.ON_ROLEWATCH_CAMERA_MAX = "Dorm3dRoomTemplateScene.ON_ROLEWATCH_CAMERA_MAX"
var_0_0.ON_STICK_MOVE = "Dorm3dRoomTemplateScene.ON_STICK_MOVE"
var_0_0.ENABLE_SCENEBLOCK = "Dorm3dRoomTemplateScene.ENABLE_SCENEBLOCK"
var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY = "Dorm3dRoomTemplateScene.ON_BEGIN_DRAG_CHARACTER_BODY"
var_0_0.ON_DRAG_CHARACTER_BODY = "Dorm3dRoomTemplateScene.ON_DRAG_CHARACTER_BODY"
var_0_0.ON_RELEASE_CHARACTER_BODY = "Dorm3dRoomTemplateScene.ON_RELEASE_CHARACTER_BODY"
var_0_0.ON_POV_STICK_MOVE_BEGIN = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE_BEGIN"
var_0_0.ON_POV_STICK_MOVE = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE"
var_0_0.ON_POV_STICK_MOVE_END = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE_END"
var_0_0.ON_POV_STICK_VIEW = "Dorm3dRoomTemplateScene.ON_POV_STICK_VIEW"
var_0_0.ON_ENTER_SECTOR = "Dorm3dRoomTemplateScene.ON_ENTER_SECTOR"
var_0_0.ON_CHANGE_DISTANCE = "Dorm3dRoomTemplateScene.ON_CHANGE_DISTANCE"
var_0_0.ON_IK_STATUS_CHANGED = "Dorm3dRoomTemplateScene.ON_IK_STATUS_CHANGED"
var_0_0.CLICK_CHARACTER = "Dorm3dRoomTemplateScene.CLICK_CHARACTER"
var_0_0.CLICK_CONTACT = "Dorm3dRoomTemplateScene.CLICK_CONTACT"
var_0_0.DISTANCE_TRIGGER = "Dorm3dRoomTemplateScene.DISTANCE_TRIGGER"
var_0_0.WALK_DISTANCE_TRIGGER = "Dorm3dRoomTemplateScene.WALK_DISTANCE_TRIGGER"
var_0_0.CHANGE_WATCH = "Dorm3dRoomTemplateScene.CHANGE_WATCH"
var_0_0.PHOTO_CALL = "Dorm3dRoomTemplateScene.PHOTO_CALL"
var_0_0.POV_CLOSE_DISTANCE = 1.5
var_0_0.POV_PENDING_CLOSE_DISTANCE = 2
var_0_0.IK_STATUS_DELTA = 0.5
var_0_0.IK_TIP_WAIT_TIME = 5

local var_0_1 = {
	map_siriushostel_01_base = {},
	map_dormitorycorridor_01_base = {
		Default = {
			Radius = 2,
			Angle = 120,
			Position = {
				1.571,
				0,
				38.647
			},
			Rotation = {
				0,
				180,
				0
			}
		}
	},
	map_noshirohostel_01_base = {},
	map_beach_02_base = {}
}

var_0_0.IK_STATUS = {
	RELEASE = 3,
	BEGIN = 1,
	TRIGGER = 4,
	DRAG = 2
}

function var_0_0.getUIName(arg_1_0)
	return nil
end

function var_0_0.forceGC(arg_2_0)
	return true
end

function var_0_0.loadingQueue(arg_3_0)
	return function(arg_4_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_5_0)
			return arg_4_0(arg_5_0)
		end)
	end
end

function var_0_0.getBGM(arg_6_0)
	local var_6_0 = pg.dorm3d_rooms[arg_6_0.contextData.roomId].room_bgm

	if var_6_0 and var_6_0 ~= "" then
		return var_6_0
	else
		return var_0_0.super.getBGM(arg_6_0)
	end
end

function var_0_0.lowerAdpter(arg_7_0)
	return true
end

function var_0_0.Ctor(arg_8_0, ...)
	var_0_0.super.Ctor(arg_8_0, ...)

	arg_8_0.loader = AutoLoader.New()
	arg_8_0.scene = arg_8_0
end

function var_0_0.SetRoom(arg_9_0, arg_9_1)
	arg_9_0.room = arg_9_1
end

function var_0_0.preload(arg_10_0, arg_10_1)
	tolua.loadassembly("MagicaClothV2")
	tolua.loadassembly("ParadoxNotion")
	tolua.loadassembly("Yongshi.BLRP.Runtime")

	for iter_10_0, iter_10_1 in pairs({
		_MonoManager = "ParadoxNotion.Services.MonoManager"
	}) do
		if not GameObject.Find(iter_10_0) then
			local var_10_0 = GameObject.New(iter_10_0)

			GetOrAddComponent(var_10_0, typeof(iter_10_1))
		end
	end

	arg_10_0.room = getProxy(ApartmentProxy):getRoom(arg_10_0.contextData.roomId)

	local var_10_1 = {}

	table.insert(var_10_1, function(arg_11_0)
		arg_10_0.dormSceneMgr = Dorm3dSceneMgr.New(arg_10_0.room:getConfig("scene_info"), arg_11_0)
	end)
	table.insert(var_10_1, function(arg_12_0)
		arg_10_0:LoadCharacter(arg_10_0.contextData.groupIds, arg_12_0)
	end)
	seriesAsync(var_10_1, arg_10_1)
end

function var_0_0.init(arg_13_0)
	arg_13_0:BindEvent()
	arg_13_0:InitData()
	arg_13_0:initScene()
	arg_13_0:initNodeCanvas()

	if arg_13_0.room:isPersonalRoom() then
		local var_13_0 = arg_13_0.contextData.groupIds[1]
		local var_13_1 = getProxy(ApartmentProxy):getApartment(var_13_0)
		local var_13_2 = var_13_1:GetCurSkinId()
		local var_13_3 = arg_13_0.ladyDict[var_13_0]

		setActive(var_13_3.ladyGameObject, false)

		var_13_3.skinId = var_13_2
		var_13_3.ladyGameObject = arg_13_0.skinDict[var_13_2].ladyGameObject

		setActive(var_13_3.ladyGameObject, true)
		var_13_3:HideCharacterPart(var_13_2, var_13_1:GetHiddenParts(var_13_2))
	end

	for iter_13_0, iter_13_1 in pairs(arg_13_0.ladyDict) do
		arg_13_0:InitCharacter(iter_13_1, iter_13_0)
	end

	if not arg_13_0.room:isPersonalRoom() then
		local var_13_4 = underscore.detect(arg_13_0.contextData.groupIds, function(arg_14_0)
			return arg_13_0.contextData.ladyZone[arg_14_0] == arg_13_0.contextData.inFurnitureName
		end) or arg_13_0.contextData.groupIds[1]

		if var_13_4 then
			arg_13_0:SyncInterestTransform(arg_13_0.ladyDict[var_13_4])
		end
	end

	arg_13_0.retainCount = 0
	arg_13_0.sceneBlockLayer = arg_13_0._tf:Find("SceneBlock")

	setActive(arg_13_0.sceneBlockLayer, false)

	arg_13_0.blockLayer = arg_13_0._tf:Find("Block")

	setActive(arg_13_0.blockLayer, false)

	arg_13_0.blackLayer = arg_13_0._tf:Find("BlackScreen")

	setActive(arg_13_0.blackLayer, false)
	arg_13_0:ChangePlayerPosition()

	arg_13_0.cacheSceneDic = {}
	arg_13_0.sceneGroupDic = {}
	arg_13_0.lastSceneRootDict = {}

	pg.ClickEffectMgr:GetInstance():SetClickEffect("DORM3D")
end

function var_0_0.BindEvent(arg_15_0)
	arg_15_0:bind(var_0_0.PLAY_EXPRESSION, function(arg_16_0, arg_16_1)
		arg_15_0:PlayExpression(arg_16_1)
	end)
	arg_15_0:bind(var_0_0.SHOW_BLOCK, function()
		arg_15_0.retainCount = arg_15_0.retainCount + 1

		setActive(arg_15_0.blockLayer, true)
	end)
	arg_15_0:bind(var_0_0.HIDE_BLOCK, function()
		arg_15_0.retainCount = math.max(arg_15_0.retainCount - 1, 0)

		if arg_15_0.retainCount > 0 then
			return
		end

		setActive(arg_15_0.blockLayer, false)
	end)
	arg_15_0:bind(var_0_0.ENABLE_SCENEBLOCK, function(arg_19_0, arg_19_1)
		setActive(arg_15_0.sceneBlockLayer, arg_19_1)
	end)
	arg_15_0:bind(var_0_0.ON_STICK_MOVE, function(arg_20_0, arg_20_1)
		arg_15_0:OnStickMove(arg_20_1)
	end)
	arg_15_0:bind(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, function(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
		if arg_15_0.blockIK then
			return
		end

		if arg_21_1.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():OnDragBegin(arg_21_2, arg_21_3)
	end)
	arg_15_0:bind(var_0_0.ON_DRAG_CHARACTER_BODY, function(arg_22_0, arg_22_1, arg_22_2)
		if not arg_22_1.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():HandleBodyDrag(arg_22_2)
	end)
	arg_15_0:bind(var_0_0.ON_RELEASE_CHARACTER_BODY, function(arg_23_0, arg_23_1)
		pg.IKMgr.GetInstance():ReleaseDrag()
	end)
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_BEGIN, function(arg_24_0, arg_24_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_15_0.moveStickOrigin = arg_24_1.position
		arg_15_0.moveStickPosition = arg_15_0.moveStickOrigin
		arg_15_0.moveStickDraging = true
	end)

	local function var_15_0()
		arg_15_0.moveStickOrigin = nil
		arg_15_0.moveStickPosition = nil
		arg_15_0.moveStickDraging = nil

		if isActive(arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_15_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, Vector2.zero)
		end
	end

	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_END, function(arg_26_0, arg_26_1)
		var_15_0()
	end)
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE, function(arg_27_0, arg_27_1)
		if arg_15_0.pinchMode then
			var_15_0()

			return
		end

		if not arg_15_0.moveStickDraging then
			return
		end

		arg_15_0.moveStickPosition = arg_15_0.moveStickPosition + arg_27_1

		if isActive(arg_15_0.povLayer:Find("Guide")) then
			setActive(arg_15_0.povLayer:Find("Guide"), false)
		end
	end)

	local var_15_1 = 32.4 / Screen.height

	arg_15_0:bind(var_0_0.ON_POV_STICK_VIEW, function(arg_28_0, arg_28_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_28_1 = arg_28_1 * var_15_1

		local var_28_0 = arg_28_1.x
		local var_28_1 = arg_28_1.y

		local function var_28_2(arg_29_0, arg_29_1, arg_29_2)
			local var_29_0 = arg_29_0[arg_29_1]

			var_29_0.m_InputAxisValue = arg_29_2
			arg_29_0[arg_29_1] = var_29_0
		end

		if isActive(arg_15_0.cameras[var_0_0.CAMERA.POV]) then
			var_28_2(arg_15_0.compPovAim, "m_HorizontalAxis", var_28_0)
			var_28_2(arg_15_0.compPovAim, "m_VerticalAxis", var_28_1)
		elseif isActive(arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			local var_28_3 = arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

			var_28_2(var_28_3, "m_HorizontalAxis", var_28_0)
			var_28_2(var_28_3, "m_VerticalAxis", var_28_1)
		end
	end)

	local var_15_2 = {
		HideCharacterBylayer = true,
		EnableHeadIK = true,
		RevertCharacterBylayer = true
	}

	arg_15_0:bind(var_0_0.PHOTO_CALL, function(arg_30_0, arg_30_1, ...)
		if var_15_2[arg_30_1] then
			local var_30_0 = arg_15_0.ladyDict[arg_15_0.apartment:GetConfigID()]

			arg_15_0[arg_30_1](arg_15_0, var_30_0, ...)
		else
			arg_15_0[arg_30_1](arg_15_0, ...)
		end
	end)
end

function var_0_0.RegisterIKFunc(arg_31_0)
	pg.IKMgr.GetInstance():RegisterOnIKLayerActive(function(arg_32_0)
		arg_31_0.blockIK = true

		local var_32_0 = arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()]

		var_32_0.ikHandler = arg_32_0

		local var_32_1 = _.detect(var_32_0.readyIKLayers, function(arg_33_0)
			return arg_33_0:GetControllerPath() == arg_32_0.ikData:GetControllerPath()
		end)

		arg_31_0:EnableIKLayer(var_32_1)

		arg_31_0.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_32_1:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDrag(function(arg_34_0)
		arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()].ikHandler = arg_34_0

		arg_31_0:ResetIKTipTimer()
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDeactive(function(arg_35_0, arg_35_1)
		local var_35_0 = arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()]
		local var_35_1 = _.detect(var_35_0.readyIKLayers, function(arg_36_0)
			return arg_36_0:GetControllerPath() == arg_35_0.ikData:GetControllerPath()
		end)

		arg_31_0:DeactiveIKLayer(var_35_1)

		var_35_0.ikHandler = nil
		arg_31_0.blockIK = arg_35_1

		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_35_1:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerAction(function(arg_37_0)
		local var_37_0 = arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()]

		arg_31_0.blockIK = nil

		local var_37_1 = _.detect(var_37_0.readyIKLayers, function(arg_38_0)
			return arg_38_0:GetControllerPath() == arg_37_0.ikData:GetControllerPath()
		end)

		arg_31_0:OnTriggerIK(var_37_1)
		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_37_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	end)
end

function var_0_0.initScene(arg_39_0)
	local var_39_0, var_39_1 = unpack(string.split(arg_39_0.dormSceneMgr.sceneInfo, "|"))
	local var_39_2 = SceneManager.GetSceneByName(var_39_0 .. "_base")

	arg_39_0:ResetSceneStructure(var_39_2)

	arg_39_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_39_0.camBrain = arg_39_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_39_0.camBrainEvenetHandler = arg_39_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_39_0.raycastCamera = arg_39_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_39_0.sceneRaycaster = arg_39_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_39_0.player = GameObject.Find("Player").transform
	arg_39_0.playerEye = arg_39_0.player:Find("Eye")
	arg_39_0.playerFoot = arg_39_0.player:Find("Foot")

	setActive(arg_39_0.playerFoot, false)

	arg_39_0.playerController = arg_39_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_39_0.attachedPoints = {}

	eachChild(arg_39_0.furnitures, function(arg_40_0)
		table.insert(arg_39_0.attachedPoints, 1, arg_40_0)
	end)

	arg_39_0.modelRoot = GameObject.Find("scene_root").transform
	arg_39_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_39_0.slotRoot, true)
	arg_39_0:InitSlots()
	tolua.loadassembly("Cinemachine")

	local var_39_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_39_3, function(arg_41_0)
		setActive(arg_41_0, false)
	end)

	arg_39_0.camBrain.enabled = false
	arg_39_0.camBrain.enabled = true
	arg_39_0.cameraAim = var_39_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameraAim2 = var_39_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameraFree = nil
	arg_39_0.cameraFurnitureWatch = nil
	arg_39_0.cameraRole = var_39_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameraRole2 = var_39_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	local var_39_4 = var_39_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	arg_39_0.cameraGift = var_39_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameras = {
		arg_39_0.cameraAim,
		arg_39_0.cameraAim2,
		arg_39_0.cameraRole,
		[var_0_0.CAMERA.TALK] = var_39_4,
		[var_0_0.CAMERA.GIFT] = arg_39_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_39_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_39_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_39_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_39_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)),
		[var_0_0.CAMERA.SKIN] = arg_39_0.room:isPersonalRoom() and var_39_3:Find("Skin Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)) or nil
	}

	setActive(arg_39_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"), true)

	arg_39_0.compPovAim = arg_39_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_39_0.cameraRoot = var_39_3
	arg_39_0.POVOriginalFOV = arg_39_0:GetPOVFOV()
	arg_39_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_39_0.restrictedBox, false)

	local var_39_5 = arg_39_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(CharacterController)).radius

	arg_39_0.restrictedHeightRange = {
		arg_39_0.restrictedBox:Find("Floor").position.y + var_39_5,
		arg_39_0.restrictedBox:Find("Celling").position.y - var_39_5
	}
	arg_39_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_39_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent("DayNightCtrl")

	arg_39_0:SwitchDayNight(arg_39_0.contextData.timeIndex)

	arg_39_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_39_0 .. "_base")).CutIn

	if arg_39_0.tfCutIn then
		arg_39_0.modelCutIn = {
			lady = arg_39_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_39_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_39_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_42_0, arg_42_1, arg_42_2)
	if arg_42_2 and not IsNil(arg_42_2) then
		arg_42_2:SwitcherToIndex(arg_42_1 - 1)
	elseif not IsNil(arg_42_0.daynightCtrlComp) then
		arg_42_0.daynightCtrlComp:SwitcherToIndex(arg_42_1 - 1)
	end

	arg_42_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_43_0)
	arg_43_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_43_0:RegisterGlobalVolume()

	arg_43_0.characterLight = GameObject.Find("CharacterLight")

	arg_43_0:RecordCharacterLight()

	local var_43_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_43_0:GetComponentsInChildren(typeof(Light), true), function(arg_44_0, arg_44_1)
		arg_44_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_45_0, arg_45_1)
	table.IpairsCArray(arg_45_1:GetRootGameObjects(), function(arg_46_0, arg_46_1)
		if arg_46_1.name == "Furnitures" then
			arg_45_0.furnitures = tf(arg_46_1)

			eachChild(arg_45_0.furnitures, function(arg_47_0)
				if arg_47_0:Find("FreeLook Camera") then
					setActive(arg_47_0:Find("FreeLook Camera"), false)
				end

				if arg_47_0:Find("FreeLook Camera") then
					setActive(arg_47_0:Find("RoleWatch Camera"), false)
				end

				if arg_47_0:Find("IKCamera") then
					setActive(arg_47_0:Find("IKCamera"), false)
				end

				local var_47_0 = arg_47_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_47_0 then
					return
				end

				var_47_0.enabled = false
			end)
		end
	end)

	arg_45_0.sectorsDic = arg_45_0.sectorsDic or {}

	if not arg_45_0.sectorsDic[arg_45_1.name] then
		arg_45_0.sectorsDic[arg_45_1.name] = table.shallowCopy(var_0_1[arg_45_1.name]) or {}

		setmetatable(arg_45_0.sectorsDic[arg_45_1.name], {
			__index = function(arg_48_0, arg_48_1)
				local var_48_0 = arg_45_0.furnitures:Find(arg_48_1 .. "/StayPoint")

				if var_48_0 then
					local var_48_1 = var_48_0.position
					local var_48_2 = var_48_0.eulerAngles

					arg_48_0[arg_48_1] = {
						Radius = 2,
						Angle = 120,
						Position = {
							var_48_1.x,
							var_48_1.y,
							var_48_1.z
						},
						Rotation = {
							var_48_2.x,
							var_48_2.y,
							var_48_2.z
						}
					}

					return arg_48_0[arg_48_1]
				else
					return nil
				end
			end
		})
	end

	arg_45_0.activeSectors = arg_45_0.sectorsDic[arg_45_1.name]
end

function var_0_0.InitSlots(arg_49_0)
	local var_49_0 = arg_49_0.room:GetSlots()
	local var_49_1 = arg_49_0.modelRoot:GetComponentsInChildren(typeof(Transform), true):ToTable()

	arg_49_0.slotDict = {}

	_.each(var_49_0, function(arg_50_0)
		local var_50_0 = arg_50_0:GetFurnitureName()
		local var_50_1 = arg_50_0:GetConfigID()
		local var_50_2 = arg_49_0.slotRoot:Find(tostring(var_50_1))

		if not var_50_2 then
			errorMsg("Not Find Slot: " .. var_50_1)

			return
		end

		local var_50_3 = {
			trans = var_50_2,
			sceneHides = {}
		}
		local var_50_4 = var_50_2:Find("Selector")

		if var_50_4 then
			GetOrAddComponent(var_50_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_51_0, arg_51_1)
				arg_49_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_50_1)
			end)
			setActive(var_50_4, false)
		end

		local var_50_5

		for iter_50_0, iter_50_1 in ipairs(var_49_1) do
			if iter_50_1.name == var_50_0 then
				var_50_5 = iter_50_1

				break
			end
		end

		if var_50_5 then
			var_50_3.model = var_50_5
		end

		arg_49_0.slotDict[var_50_1] = var_50_3
	end)
end

function var_0_0.SetContactStateDic(arg_52_0, arg_52_1)
	arg_52_0.contactStateDic = arg_52_1
	arg_52_0.hideContactStateDic = {}
	arg_52_0.contactInRangeDic = {}
	arg_52_0.transRangeDic = {
		list = {}
	}
	arg_52_0.transformFilter = arg_52_0.transformFilter or BLHX.Rendering.TransformFilter.New()

	for iter_52_0, iter_52_1 in pairs(arg_52_0.contactStateDic) do
		arg_52_0.hideContactStateDic[iter_52_0] = math.min(iter_52_1, ApartmentRoom.ITEM_UNLOCK)
		arg_52_0.contactInRangeDic[iter_52_0] = false

		local var_52_0 = pg.dorm3d_collection_template[iter_52_0].vfx_prefab

		arg_52_0.transRangeDic[iter_52_0] = {
			#arg_52_0.transRangeDic.list + 1,
			#var_52_0
		}

		table.insertto(arg_52_0.transRangeDic.list, underscore.map(var_52_0, function(arg_53_0)
			return arg_52_0.modelRoot:Find(arg_53_0)
		end))
	end

	arg_52_0.transformFilter:Init(arg_52_0.mainCameraTF, arg_52_0.transRangeDic.list, 2, 60)
	arg_52_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_54_0, arg_54_1)
	arg_54_0.hideConcatFlag = arg_54_1

	arg_54_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_55_0)
	for iter_55_0, iter_55_1 in pairs(arg_55_0.contactInRangeDic) do
		arg_55_0:UpdateContactDisplay(iter_55_0, arg_55_0.contactInRangeDic[iter_55_0] and not arg_55_0.hideConcatFlag and arg_55_0.contactStateDic[iter_55_0] or arg_55_0.hideContactStateDic[iter_55_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = pg.dorm3d_collection_template[arg_56_1]

	for iter_56_0, iter_56_1 in ipairs(var_56_0.vfx_prefab) do
		local var_56_1 = arg_56_0.modelRoot:Find(iter_56_1)

		if arg_56_0:IsModeInHidePending(iter_56_1) then
			-- block empty
		elseif not arg_56_0.modelRoot:Find(iter_56_1) then
			warning(arg_56_1, iter_56_1)
		else
			setActive(var_56_1, arg_56_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_56_2, iter_56_3 in ipairs(var_56_0.model) do
		if arg_56_0:IsModeInHidePending(iter_56_3) then
			-- block empty
		elseif not arg_56_0.modelRoot:Find(iter_56_3) then
			warning(arg_56_1, iter_56_3)
		else
			local var_56_2 = arg_56_0.modelRoot:Find(iter_56_3)

			if arg_56_0:CheckSceneItemActive(var_56_2) then
				local var_56_3 = GetComponent(var_56_2, typeof(EventTriggerListener))

				if arg_56_2 == ApartmentRoom.ITEM_FIRST then
					var_56_3 = var_56_3 or GetOrAddComponent(var_56_2, typeof(EventTriggerListener))

					var_56_3:AddPointClickFunc(function(arg_57_0, arg_57_1)
						arg_56_0:emit(var_0_0.CLICK_CONTACT, arg_56_1)
					end)

					var_56_3.enabled = true
				elseif var_56_3 then
					var_56_3.enabled = false
				end

				setActive(var_56_2, arg_56_2 > ApartmentRoom.ITEM_LOCK)
			end
		end
	end
end

function var_0_0.SetFloatEnable(arg_58_0, arg_58_1)
	arg_58_0.enableFloatUpdate = arg_58_1

	if arg_58_1 then
		arg_58_0:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_59_0)
	local var_59_0 = arg_59_0.ladyDict[arg_59_0.apartment:GetConfigID()]
	local var_59_1 = arg_59_0:GetScreenPosition(var_59_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_59_2 = arg_59_0:GetLocalPosition(var_59_1, arg_59_0.rtFloatPage)

	setLocalPosition(arg_59_0.rtFloatPage:Find("lady"), var_59_2)
end

function var_0_0.LoadCharacter(arg_60_0, arg_60_1, arg_60_2)
	arg_60_0.hxMatDict = {}
	arg_60_0.ladyDict = {}
	arg_60_0.skinDict = {}

	local var_60_0 = {}

	for iter_60_0, iter_60_1 in ipairs(arg_60_1) do
		table.insert(var_60_0, function(arg_61_0)
			arg_60_0:LoadSingleCharacter(iter_60_1, arg_61_0)
		end)
	end

	parallelAsync(var_60_0, arg_60_2)
end

function var_0_0.LoadCharacterAdditionally(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = {}

	for iter_62_0, iter_62_1 in ipairs(arg_62_1) do
		table.insert(var_62_0, function(arg_63_0)
			arg_62_0:LoadSingleCharacter(iter_62_1, function()
				arg_62_0:InitCharacter(arg_62_0.ladyDict[iter_62_1], iter_62_1)
				arg_63_0()
			end)
		end)
	end

	parallelAsync(var_62_0, arg_62_2)
end

function var_0_0.LoadSingleCharacter(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = {}
	local var_65_1 = LadyEnv.New(arg_65_0)

	arg_65_0.ladyDict[arg_65_1] = var_65_1

	local var_65_2 = getProxy(ApartmentProxy):getApartment(arg_65_1)
	local var_65_3 = var_65_2:getConfig("asset_name")
	local var_65_4 = var_65_2:GetSkinModelID(arg_65_0.room:getConfig("tag"))
	local var_65_5 = pg.dorm3d_resource[var_65_4].model_id

	assert(var_65_5)

	for iter_65_0, iter_65_1 in ipairs({
		"common",
		var_65_5
	}) do
		local var_65_6 = string.format("dorm3d/character/%s/res/%s", var_65_3, iter_65_1)

		if checkABExist(var_65_6) then
			table.insert(var_65_0, function(arg_66_0)
				arg_65_0.loader:LoadBundle(var_65_6, function(arg_67_0)
					for iter_67_0, iter_67_1 in ipairs(arg_67_0:GetAllAssetNames()) do
						local var_67_0, var_67_1, var_67_2 = string.find(iter_67_1, "material_hx[/\\](.*).mat")

						if var_67_0 then
							arg_65_0.hxMatDict[var_67_2] = {
								arg_67_0,
								iter_67_1
							}
						end
					end

					arg_66_0()
				end)
			end)
		end
	end

	var_65_1.skinId = var_65_4
	var_65_1.skinIdList = {
		var_65_4
	}

	table.insert(var_65_0, function(arg_68_0)
		local var_68_0 = string.format("dorm3d/character/%s/prefabs/%s", var_65_3, var_65_5)

		arg_65_0.loader:GetPrefab(var_68_0, "", function(arg_69_0)
			var_65_1.ladyGameObject = arg_69_0
			arg_65_0.skinDict[var_65_4] = {
				ladyGameObject = arg_69_0
			}

			arg_68_0()
		end)
	end)

	if arg_65_0.room:isPersonalRoom() then
		for iter_65_2, iter_65_3 in ipairs(var_65_2:GetAllModelIds()) do
			if not table.contains(var_65_1.skinIdList, iter_65_3) then
				local var_65_7 = pg.dorm3d_resource[iter_65_3].model_id
				local var_65_8 = string.format("dorm3d/character/%s/prefabs/%s", var_65_3, var_65_7)

				if checkABExist(var_65_8) then
					table.insert(var_65_1.skinIdList, iter_65_3)
					table.insert(var_65_0, function(arg_70_0)
						arg_65_0.loader:GetPrefab(var_65_8, "", function(arg_71_0)
							arg_65_0.skinDict[iter_65_3] = {
								ladyGameObject = arg_71_0
							}
							GetComponent(arg_71_0, "GraphOwner").enabled = false

							setActive(arg_71_0, false)
							arg_70_0()
						end)
					end)
				end
			end
		end
	end

	if arg_65_0.contextData.pendingDic[arg_65_1] then
		local var_65_9 = pg.dorm3d_welcome[arg_65_0.contextData.pendingDic[arg_65_1]]

		if var_65_9.item_prefab ~= "" then
			table.insert(var_65_0, function(arg_72_0)
				local var_72_0 = string.lower("dorm3d/furniture/item/" .. var_65_9.item_prefab)

				arg_65_0.loader:GetPrefab(var_72_0, "", function(arg_73_0)
					var_65_1.tfPendintItem = arg_73_0.transform

					setActive(arg_73_0, false)
					arg_72_0()
				end)
			end)
		end
	end

	parallelAsync(var_65_0, arg_65_2)
end

function var_0_0.HXCharacter(arg_74_0, arg_74_1)
	if not HXSet.isHx() then
		return
	end

	local var_74_0 = arg_74_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_74_0, function(arg_75_0, arg_75_1)
		local var_75_0 = arg_75_1.sharedMaterials
		local var_75_1 = false

		table.IpairsCArray(var_75_0, function(arg_76_0, arg_76_1)
			if arg_76_1 == nil then
				return
			end

			local var_76_0 = arg_76_1.name

			if not arg_74_0.hxMatDict[var_76_0] then
				return
			end

			var_75_1 = true

			local var_76_1, var_76_2 = unpack(arg_74_0.hxMatDict[var_76_0])
			local var_76_3 = var_76_1:LoadAssetSync(var_76_2, typeof(Material), false, false)

			var_75_0[arg_76_0] = var_76_3

			warning("Replace HX Material", arg_74_0.hxMatDict[var_76_0][2])
		end)

		if var_75_1 then
			arg_75_1.sharedMaterials = var_75_0
		end
	end)
end

function var_0_0.InitCharacter(arg_77_0, arg_77_1, arg_77_2)
	arg_77_1:InitCharacter(arg_77_2)

	arg_77_1.ladyBaseZone = arg_77_0.contextData.ladyZone[arg_77_2]
	arg_77_1.ladyActiveZone = arg_77_1.ladyBaseZone

	arg_77_0:ChangeCharacterPosition(arg_77_1)
end

function var_0_0.SetCameraLady(arg_78_0, arg_78_1)
	arg_78_0.cameraAim2.LookAt = arg_78_1.ladyInterestRoot
	arg_78_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_78_1.ladyInterestRoot
	arg_78_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_78_1.ladyInterestRoot
	arg_78_0.cameraGift.Follow = arg_78_0.ladyInterest
	arg_78_0.cameraGift.LookAt = arg_78_0.ladyInterest
	arg_78_0.cameraRole2.LookAt = arg_78_1.ladyInterestRoot
	arg_78_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_78_0.ladyInterest
	arg_78_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_78_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_79_0)
	local var_79_0 = pg.NodeCanvasMgr.GetInstance()

	var_79_0:Active()
	var_79_0:RegisterFunc("DistanceTrigger", function(arg_80_0)
		arg_79_0:emit(var_0_0.DISTANCE_TRIGGER, arg_80_0, arg_79_0.ladyDict[arg_80_0].dis)
	end)
	var_79_0:RegisterFunc("ShortWaitAction", function(arg_81_0)
		arg_79_0:DoShortWait(arg_81_0)
	end)
	var_79_0:RegisterFunc("WatchShortWaitAction", function(arg_82_0)
		arg_79_0:DoShortWait(arg_82_0)
	end)
	var_79_0:RegisterFunc("WalkDistanceTrigger", function(arg_83_0)
		arg_79_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_83_0, arg_79_0.ladyDict[arg_83_0].dis)
	end)
	var_79_0:RegisterFunc("ChangeWatch", function(arg_84_0)
		arg_79_0:emit(var_0_0.CHANGE_WATCH, arg_84_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_85_0, arg_85_1, arg_85_2)
	arg_85_0[arg_85_1] = arg_85_2

	for iter_85_0, iter_85_1 in pairs(arg_85_0.ladyDict) do
		arg_85_0:SetBlackboardValue(iter_85_1, arg_85_1, arg_85_2)
	end
end

function var_0_0.SetBlackboardValue(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	arg_86_1:SetBlackboardValue(arg_86_2, arg_86_3)
end

function var_0_0.GetBlackboardValue(arg_87_0, arg_87_1, arg_87_2)
	return arg_87_1:GetBlackboardValue(arg_87_2)
end

function var_0_0.didEnter(arg_88_0)
	local var_88_0 = -21.6 / Screen.height

	arg_88_0.joystickDelta = Vector2.zero
	arg_88_0.joystickTimer = FrameTimer.New(function()
		local var_89_0 = arg_88_0.joystickDelta * var_88_0
		local var_89_1 = var_89_0.x
		local var_89_2 = var_89_0.y

		local function var_89_3(arg_90_0, arg_90_1, arg_90_2)
			local var_90_0 = arg_90_0[arg_90_1]

			var_90_0.m_InputAxisValue = arg_90_2
			arg_90_0[arg_90_1] = var_90_0
		end

		if arg_88_0.surroudCamera and not arg_88_0.pinchMode then
			var_89_3(arg_88_0.surroudCamera, "m_XAxis", var_89_1)
			var_89_3(arg_88_0.surroudCamera, "m_YAxis", var_89_2)
		elseif arg_88_0.furniturePOV and arg_88_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] and isActive(arg_88_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH]) then
			var_89_3(arg_88_0.furniturePOV, "m_HorizontalAxis", var_89_1)
			var_89_3(arg_88_0.furniturePOV, "m_VerticalAxis", var_89_2)
		end

		arg_88_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_88_0.joystickTimer:Start()

	local var_88_1 = 1.75

	arg_88_0.moveStickTimer = FrameTimer.New(function()
		if not arg_88_0.moveStickDraging then
			return
		end

		local var_91_0 = arg_88_0.moveStickPosition
		local var_91_1 = 200
		local var_91_2 = (var_91_0 - arg_88_0.moveStickOrigin):ClampMagnitude(var_91_1)
		local var_91_3 = var_91_2 / var_91_1

		arg_88_0.moveStickPosition = arg_88_0.moveStickOrigin + var_91_2

		local var_91_4 = Vector3.New(var_91_3.x, 0, var_91_3.y)
		local var_91_5 = arg_88_0.mainCameraTF:TransformDirection(var_91_4)

		var_91_5.y = 0

		local var_91_6 = var_91_5:Normalize()

		var_91_6:Mul(var_88_1)

		if isActive(arg_88_0.cameras[var_0_0.CAMERA.POV]) then
			arg_88_0.playerController:SimpleMove(var_91_6)

			arg_88_0.tweenFOV = true
		elseif isActive(arg_88_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_88_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_91_6 * Time.deltaTime)
			arg_88_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, var_91_3:Normalize())
			onNextTick(function()
				local var_92_0 = arg_88_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_92_1 = math.InverseLerp(arg_88_0.restrictedHeightRange[1], arg_88_0.restrictedHeightRange[2], var_92_0.position.y)

				arg_88_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_92_1)
			end)
		end
	end, 1, -1)

	arg_88_0.moveStickTimer:Start()

	arg_88_0.pinchMode = false
	arg_88_0.pinchSize = 0
	arg_88_0.pinchValue = 1
	arg_88_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_93_0, arg_93_1)
		if arg_88_0.surroudCamera and isActive(arg_88_0.surroudCamera) then
			arg_88_0.pinchMode = true
			arg_88_0.pinchSize = (arg_93_0 - arg_93_1):Magnitude()
			arg_88_0.pinchNodeOrder = arg_93_1.x < arg_93_0.x and -1 or 1

			return
		end

		if isActive(arg_88_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_93_0 - arg_93_1):Magnitude() < Screen.height * 0.5 then
				arg_88_0.pinchMode = true
				arg_88_0.pinchSize = (arg_93_0 - arg_93_1):Magnitude()
				arg_88_0.pinchNodeOrder = arg_93_1.x < arg_93_0.x and -1 or 1
			end

			return
		end
	end)

	local var_88_2 = 0.01

	if IsUnityEditor then
		var_88_2 = 0.1
	end

	local var_88_3 = var_88_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_94_0, arg_94_1)
		if not arg_88_0.pinchMode then
			return
		end

		local var_94_0 = (arg_94_0 - arg_94_1):Magnitude()
		local var_94_1 = arg_88_0.pinchSize - var_94_0
		local var_94_2 = arg_88_0.pinchNodeOrder * (arg_94_1.x < arg_94_0.x and -1 or 1)
		local var_94_3 = var_94_1 * var_88_3 * var_94_2

		if isActive(arg_88_0.cameras[var_0_0.CAMERA.POV]) then
			local var_94_4 = 0.5
			local var_94_5 = 1

			arg_88_0.pinchValue = math.clamp(arg_88_0.pinchValue + var_94_3, var_94_4, var_94_5)
			arg_88_0.pinchSize = var_94_0

			arg_88_0:SetPOVFOV(arg_88_0.POVOriginalFOV * arg_88_0.pinchValue)

			arg_88_0.tweenFOV = nil

			return
		end

		if isActive(arg_88_0.surroudCamera) and arg_88_0.surroudCamera == arg_88_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_94_6 = 0.5
			local var_94_7 = 1

			arg_88_0:SetPinchValue(math.clamp(arg_88_0.pinchValue + var_94_3, var_94_6, var_94_7))

			arg_88_0.pinchSize = var_94_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_88_0.pinchMode = false
		arg_88_0.pinchSize = 0
	end)

	arg_88_0.cameraBlendCallbacks = {}
	arg_88_0.activeCMCamera = nil

	function arg_88_0.camBrainEvenetHandler.OnBlendStarted(arg_96_0)
		if arg_88_0.activeCMCamera then
			arg_88_0:OnCameraBlendFinished(arg_88_0.activeCMCamera)
		end

		local var_96_0 = arg_88_0.camBrain.ActiveVirtualCamera

		arg_88_0.activeCMCamera = var_96_0
	end

	function arg_88_0.camBrainEvenetHandler.OnBlendFinished(arg_97_0)
		arg_88_0.activeCMCamera = nil

		arg_88_0:OnCameraBlendFinished(arg_97_0)
	end

	arg_88_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_88_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_88_0:ActiveCamera(arg_88_0.cameras[var_0_0.CAMERA.POV])

	local var_88_4
	local var_88_5
	local var_88_6 = arg_88_0.resumeCallback

	function arg_88_0.resumeCallback()
		var_88_5 = true

		if var_88_4 then
			existCall(var_88_6)
		end
	end

	arg_88_0:RefreshSlots(nil, function()
		var_88_4 = true
		arg_88_0.doneFirstSlotFresh = true

		if var_88_5 then
			existCall(var_88_6)
		end
	end)

	arg_88_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_88_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_88_0.updateHandler)
end

function var_0_0.InitData(arg_103_0)
	if not arg_103_0.contextData.ladyZone then
		arg_103_0.contextData.ladyZone = {}

		local var_103_0
		local var_103_1 = arg_103_0.room:getConfig("default_zone")

		for iter_103_0, iter_103_1 in ipairs(arg_103_0.contextData.groupIds) do
			for iter_103_2, iter_103_3 in ipairs(var_103_1) do
				if iter_103_3[1] == iter_103_1 then
					arg_103_0.contextData.ladyZone[iter_103_1] = iter_103_3[2]

					break
				end
			end

			assert(arg_103_0.contextData.ladyZone[iter_103_1])

			var_103_0 = var_103_0 or arg_103_0.contextData.ladyZone[iter_103_1]
		end

		arg_103_0.contextData.inFurnitureName = var_103_0 or var_103_1[1][2]
	end

	arg_103_0.zoneDatas = _.select(arg_103_0.room:GetZones(), function(arg_104_0)
		return not arg_104_0:IsGlobal()
	end)
	arg_103_0.activeSectors = {}
	arg_103_0.activeLady = {}
end

function var_0_0.Update(arg_105_0)
	arg_105_0.raycastCamera.fieldOfView = arg_105_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_105_0.tweenFOV then
		local var_105_0 = Damp(1, 1, Time.deltaTime)

		arg_105_0.pinchValue = Mathf.Lerp(arg_105_0.pinchValue, 1, var_105_0)

		arg_105_0:SetPOVFOV(arg_105_0.POVOriginalFOV * arg_105_0.pinchValue)

		if arg_105_0.pinchValue > 0.99 then
			arg_105_0.tweenFOV = nil
		end
	end

	if isActive(arg_105_0.cameras[var_0_0.CAMERA.POV]) then
		arg_105_0:TriggerLadyDistance()
	end

	if arg_105_0.contactInRangeDic then
		local var_105_1 = arg_105_0.transformFilter:Execute():ToTable()

		for iter_105_0, iter_105_1 in pairs(arg_105_0.contactInRangeDic) do
			local var_105_2 = pg.dorm3d_collection_template[iter_105_0]
			local var_105_3 = arg_105_0.transRangeDic[iter_105_0]
			local var_105_4 = underscore(var_105_1):chain():slice(unpack(var_105_3)):any(function(arg_106_0)
				return arg_106_0
			end):value()

			if tobool(iter_105_1) ~= var_105_4 then
				arg_105_0.contactInRangeDic[iter_105_0] = var_105_4

				arg_105_0:UpdateContactDisplay(iter_105_0, var_105_4 and not arg_105_0.hideConcatFlag and arg_105_0.contactStateDic[iter_105_0] or arg_105_0.hideContactStateDic[iter_105_0])
			end
		end
	end

	if arg_105_0.enableFloatUpdate then
		arg_105_0:UpdateFloatPosition()
	end

	arg_105_0:CheckInSector()

	if arg_105_0.apartment then
		(function(arg_107_0)
			(function()
				if not arg_107_0.ikHandler then
					return
				end

				local var_108_0 = arg_107_0.ikHandler.screenPosition
				local var_108_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
				local var_108_2 = var_108_0 - Vector2.New(var_108_1.width, var_108_1.height) * 0.5

				setAnchoredPosition(arg_105_0:GetIKHandTF(), var_108_2)

				if Time.time > arg_105_0.ikNextCheckStamp then
					arg_105_0.ikNextCheckStamp = arg_105_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					local var_108_3 = _.detect(arg_107_0.readyIKLayers, function(arg_109_0)
						return arg_109_0:GetControllerPath() == arg_107_0.ikHandler.ikData:GetControllerPath()
					end)

					arg_105_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_108_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end
			end)()

			if arg_105_0.enableIKTip then
				local var_107_0 = not arg_105_0.blockIK and Time.time > arg_105_0.nextTipIKTime

				if var_107_0 then
					local var_107_1 = _.filter(arg_107_0.readyIKLayers, function(arg_110_0)
						return not arg_110_0.ignoreDrag
					end)

					UIItemList.StaticAlign(arg_105_0.ikTipsRoot, arg_105_0.ikTipsRoot:GetChild(0), #var_107_1, function(arg_111_0, arg_111_1, arg_111_2)
						if arg_111_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_111_1 = arg_111_1 + 1

						local var_111_0
						local var_111_1 = Vector2.zero
						local var_111_2 = var_107_1[arg_111_1]
						local var_111_3 = var_111_2:GetTriggerBoneName()
						local var_111_4 = var_111_3 and arg_107_0.IKSettings.Colliders[var_111_3] or nil
						local var_111_5 = var_111_2:GetIKTipOffset()

						if var_111_4 then
							local function var_111_6()
								local var_112_0 = arg_107_0.IKSettings.CameraRaycaster.eventCamera:WorldToScreenPoint(var_111_4.position)
								local var_112_1 = CameraMgr.instance:Raycast(arg_107_0.IKSettings.CameraRaycaster, var_112_0)

								if var_112_1.Length == 0 then
									return
								end

								return var_111_4 == var_112_1[0].gameObject.transform
							end
						end

						if var_111_4 then
							local var_111_7 = var_111_4.position
							local var_111_8 = var_111_4:GetComponent(typeof(UnityEngine.Collider))

							if var_111_8 then
								var_111_7 = var_111_8.bounds.center
							end

							local var_111_9 = arg_105_0:GetLocalPosition(arg_105_0:GetScreenPosition(var_111_7, arg_107_0.IKSettings.CameraRaycaster.eventCamera), arg_105_0.ikTipsRoot) + var_111_5

							setLocalPosition(arg_111_2, var_111_9)

							local var_111_10 = var_111_2:GetTriggerRect()
							local var_111_11 = var_111_10:PointToNormalized(Vector2.zero)
							local var_111_12 = Vector2.zero

							if var_111_11.x < 0.5 and var_111_11.y < 0.5 then
								var_111_12 = var_111_10.max
							elseif var_111_11.x >= 0.5 and var_111_11.y < 0.5 then
								var_111_12 = Vector2.New(var_111_10.xMin, var_111_10.yMax)
							elseif var_111_11.x < 0.5 and var_111_11.y >= 0.5 then
								var_111_12 = Vector2.New(var_111_10.xMax, var_111_10.yMin)
							elseif var_111_11.x >= 0.5 and var_111_11.y >= 0.5 then
								var_111_12 = var_111_10.min
							end

							if var_111_11.x == 0.5 then
								if var_111_9.x < 0 then
									var_111_12.x = var_111_10.xMax
								else
									var_111_12.x = var_111_10.xMin
								end
							end

							if var_111_11.y == 0.5 then
								if var_111_9.y < 0 then
									var_111_12.y = var_111_10.yMax
								else
									var_111_12.y = var_111_10.yMin
								end
							end

							local var_111_13 = var_111_12 - var_111_10.center

							setLocalRotation(arg_111_2, Quaternion.LookRotation(Vector3.forward, Vector3.New(var_111_13.x, var_111_13.y, 0)))
						end

						setActive(arg_111_2, var_111_4)
					end)
					UIItemList.StaticAlign(arg_105_0.ikClickTipsRoot, arg_105_0.ikClickTipsRoot:GetChild(0), #arg_107_0.iKTouchDatas, function(arg_113_0, arg_113_1, arg_113_2)
						if arg_113_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_113_1 = arg_113_1 + 1

						local var_113_0
						local var_113_1 = Vector2.zero
						local var_113_2 = arg_113_1
						local var_113_3 = arg_107_0.iKTouchDatas[var_113_2][1]
						local var_113_4 = pg.dorm3d_ik_touch[var_113_3]

						if #var_113_4.scene_item > 0 then
							var_113_0 = arg_105_0:GetSceneItem(var_113_4.scene_item)
						else
							var_113_0 = arg_107_0.IKSettings.Colliders[var_113_4.body]
						end

						if var_113_0 then
							local var_113_5 = var_113_0.position
							local var_113_6 = var_113_0:GetComponent(typeof(UnityEngine.Collider))

							if var_113_6 then
								var_113_5 = var_113_6.bounds.center
							end

							setLocalPosition(arg_113_2, arg_105_0:GetLocalPosition(arg_105_0:GetScreenPosition(var_113_5, arg_107_0.IKSettings.CameraRaycaster.eventCamera), arg_105_0.ikClickTipsRoot) + var_113_1)
						end

						setActive(arg_113_2, var_113_0)
					end)
				end

				setActive(arg_105_0.ikTipsRoot, var_107_0)
				setActive(arg_105_0.ikClickTipsRoot, var_107_0)
				setActive(arg_105_0.ikTextTipsRoot, var_107_0)
			end
		end)(arg_105_0.ladyDict[arg_105_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_114_0)
	if not isActive(arg_114_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_114_0 = arg_114_0.mainCameraTF.position

	for iter_114_0, iter_114_1 in pairs(arg_114_0.ladyDict) do
		local var_114_1 = tobool(arg_114_0.activeLady[iter_114_0])

		if var_114_1 ~= tobool(var_0_0.IsPointInSector(arg_114_0.activeSectors[iter_114_1.ladyActiveZone], var_114_0)) then
			arg_114_0.activeLady[iter_114_0] = not var_114_1

			arg_114_0:emit(var_0_0.ON_ENTER_SECTOR, iter_114_0)
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_115_0)
	for iter_115_0, iter_115_1 in pairs(arg_115_0.ladyDict) do
		iter_115_1.dis = (iter_115_1.lady.position - arg_115_0.player.position).magnitude

		if (arg_115_0:GetBlackboardValue(iter_115_1, "inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > iter_115_1.dis ~= arg_115_0:GetBlackboardValue(iter_115_1, "inDistance") then
			arg_115_0:SetBlackboardValue(iter_115_1, "inDistance", iter_115_1.dis < var_0_0.POV_CLOSE_DISTANCE)
			arg_115_0:emit(var_0_0.ON_CHANGE_DISTANCE, iter_115_0, iter_115_1.dis < var_0_0.POV_CLOSE_DISTANCE)
		end
	end
end

function var_0_0.OnStickMove(arg_116_0, arg_116_1)
	arg_116_0.joystickDelta = arg_116_1
end

function var_0_0.SetPinchValue(arg_117_0, arg_117_1)
	arg_117_0.pinchValue = arg_117_1

	arg_117_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_118_0)
	local var_118_0 = arg_118_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_118_0)
end

function var_0_0.SetPOVFOV(arg_119_0, arg_119_1)
	local var_119_0 = arg_119_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_119_0, arg_119_1)

	arg_119_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_119_0
end

function var_0_0.RefreshSlots(arg_120_0, arg_120_1, arg_120_2)
	arg_120_1 = arg_120_1 or arg_120_0.room

	local var_120_0 = arg_120_1:GetSlots()
	local var_120_1 = arg_120_1:GetFurnitures()

	arg_120_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_120_0, function(arg_121_0, arg_121_1, arg_121_2)
		local var_121_0 = arg_121_1:GetConfigID()

		if not arg_120_0.slotDict[var_121_0] then
			return arg_121_2()
		end

		local var_121_1 = _.detect(var_120_1, function(arg_122_0)
			return arg_122_0:GetSlotID() == var_121_0
		end)
		local var_121_2 = var_121_1 and var_121_1:GetModel() or false
		local var_121_3 = arg_120_0.slotDict[var_121_0].model

		arg_120_0.slotDict[var_121_0].displayModelName = var_121_2
		arg_120_0.slotDict[var_121_0].furnitureId = var_121_1 and var_121_1:GetConfigID()

		local function var_121_4(arg_123_0)
			if var_121_3 then
				setActive(var_121_3, var_121_2 == "")
			end

			table.Foreach(arg_120_0.slotDict[var_121_0].sceneHides or {}, function(arg_124_0, arg_124_1)
				setActive(arg_124_1.trans, arg_124_1.visible)
			end)

			arg_120_0.slotDict[var_121_0].sceneHides = {}

			if arg_123_0 then
				local var_123_0 = arg_123_0:getConfig("scene_hides")

				if #var_123_0 > 0 then
					table.Ipairs(var_123_0, function(arg_125_0, arg_125_1)
						local var_125_0 = arg_120_0.modelRoot:Find(arg_125_1)

						assert(var_125_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_123_0:GetConfigID(), arg_125_1))

						local var_125_1 = isActive(var_125_0)

						table.insert(arg_120_0.slotDict[var_121_0].sceneHides, {
							name = arg_125_1,
							trans = var_125_0,
							visible = var_125_1
						})
						setActive(var_125_0, false)
					end)
				end
			end
		end

		if var_121_2 == false or var_121_2 == "" then
			arg_120_0.loader:ClearRequest("slot_" .. var_121_0)
			var_121_4()
			arg_121_2()

			return
		end

		local var_121_5 = arg_120_0.slotDict[var_121_0].trans

		if arg_120_0.loader:GetLoadingRP("slot_" .. var_121_0) then
			arg_120_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_120_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_121_2, "", function(arg_126_0)
			assert(arg_126_0)
			setParent(arg_126_0, var_121_5)
			var_121_4(var_121_1)
			arg_121_2()
		end, "slot_" .. var_121_0)
	end, function()
		arg_120_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_120_2)
		arg_120_0:emit(Dorm3dRoomMediator.REFRESH_FURNITURE_AND_SLOTS_DONE)
	end)
end

function var_0_0.CheckSceneItemActiveByPath(arg_128_0, arg_128_1)
	local var_128_0 = arg_128_0:GetSceneItem(arg_128_1)

	return arg_128_0:CheckSceneItemActive(var_128_0)
end

function var_0_0.CheckSceneItemActive(arg_129_0, arg_129_1)
	local var_129_0 = true
	local var_129_1

	table.Checkout(arg_129_0.slotDict, function(arg_130_0, arg_130_1)
		if underscore.detect(arg_130_1.sceneHides, function(arg_131_0)
			return arg_131_0.trans == arg_129_1
		end) then
			var_129_0 = false
			var_129_1 = arg_130_1.furnitureId

			return false
		end
	end)

	return var_129_0, var_129_1
end

function var_0_0.ChangeCharacterPosition(arg_132_0, arg_132_1)
	arg_132_0:ResetCharPoint(arg_132_1, arg_132_1.ladyActiveZone)
	arg_132_0:SyncInterestTransform(arg_132_1)
end

function var_0_0.SyncCurrentInterestTransform(arg_133_0)
	local var_133_0 = arg_133_0.ladyDict[arg_133_0.apartment:GetConfigID()]

	arg_133_0:SyncInterestTransform(var_133_0)
end

function var_0_0.SyncInterestTransform(arg_134_0, arg_134_1)
	arg_134_0.ladyInterest.position = arg_134_1.ladyInterestRoot.position
	arg_134_0.ladyInterest.rotation = arg_134_1.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_135_0, arg_135_1)
	arg_135_1 = arg_135_1 or arg_135_0.contextData.inFurnitureName

	local var_135_0 = arg_135_0.furnitures:Find(arg_135_1):Find("PlayerPoint").position

	arg_135_0.player.position = var_135_0
	arg_135_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_135_0.playerEye.position

	local var_135_1 = arg_135_0.ladyInterest.position - arg_135_0.playerEye.position
	local var_135_2 = Quaternion.LookRotation(var_135_1).eulerAngles
	local var_135_3 = var_135_2.y
	local var_135_4 = var_135_2.x
	local var_135_5 = arg_135_0.compPovAim.m_HorizontalAxis

	var_135_5.Value = arg_135_0:GetNearestAngle(var_135_3, var_135_5.m_MinValue, var_135_5.m_MaxValue)
	arg_135_0.compPovAim.m_HorizontalAxis = var_135_5

	local var_135_6 = arg_135_0.compPovAim.m_VerticalAxis

	var_135_6.Value = var_135_4
	arg_135_0.compPovAim.m_VerticalAxis = var_135_6
end

function var_0_0.GetAttachedFurnitureName(arg_136_0)
	return arg_136_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_137_0, arg_137_1)
	return underscore.detect(arg_137_0.attachedPoints, function(arg_138_0)
		return arg_138_0.name == arg_137_1
	end)
end

function var_0_0.GetSlotByID(arg_139_0, arg_139_1)
	return arg_139_0.displaySlots[arg_139_1] and arg_139_0.displaySlots[arg_139_1].trans
end

function var_0_0.GetScreenPosition(arg_140_0, arg_140_1, arg_140_2)
	arg_140_2 = arg_140_2 or arg_140_0.raycastCamera

	local var_140_0 = arg_140_2:WorldToScreenPoint(arg_140_1)

	if var_140_0.z < 0 then
		var_140_0.x = var_140_0.x + (var_140_0.x < 0 and -1 or 1) * Screen.width
		var_140_0.y = var_140_0.y + (var_140_0.y < 0 and -1 or 1) * Screen.height
		var_140_0.z = -var_140_0.z
	end

	return var_140_0
end

function var_0_0.GetLocalPosition(arg_141_0, arg_141_1, arg_141_2)
	return LuaHelper.ScreenToLocal(arg_141_2, arg_141_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_142_0)
	return arg_142_0.modelRoot
end

function var_0_0.ShiftZone(arg_143_0, arg_143_1, arg_143_2)
	local var_143_0 = arg_143_0:GetFurnitureByName(arg_143_1)

	if not var_143_0 then
		errorMsg(arg_143_1 .. " Not Find")
		existCall(arg_143_2)

		return
	end

	seriesAsync({
		function(arg_144_0)
			arg_143_0:emit(var_0_0.SHOW_BLOCK)
			arg_143_0:ShowBlackScreen(true, arg_144_0)
		end,
		function(arg_145_0)
			if arg_143_0.shiftLady or arg_143_0.room:isPersonalRoom() then
				local var_145_0 = arg_143_0.shiftLady or arg_143_0.apartment:GetConfigID()

				arg_143_0.shiftLady = nil
				arg_143_0.contextData.ladyZone[var_145_0] = var_143_0.name

				local var_145_1 = arg_143_0.ladyDict[var_145_0]

				var_145_1.ladyBaseZone = arg_143_0.contextData.ladyZone[var_145_0]
				var_145_1.ladyActiveZone = arg_143_0.contextData.ladyZone[var_145_0]

				if arg_143_0:GetBlackboardValue(var_145_1, "inPending") then
					arg_143_0:SetOutPending(var_145_1)
					arg_143_0:SwitchAnim(var_145_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_143_0:ChangeCharacterPosition(var_145_1)
						arg_145_0()
					end)
				else
					arg_143_0:ChangeCharacterPosition(var_145_1)
					arg_145_0()
				end
			else
				arg_145_0()
			end
		end,
		function(arg_147_0)
			arg_143_0.contextData.inFurnitureName = var_143_0.name

			if not arg_143_0.apartment then
				for iter_147_0, iter_147_1 in pairs(arg_143_0.ladyDict) do
					if iter_147_1.ladyBaseZone == arg_143_0.contextData.inFurnitureName then
						arg_143_0:SyncInterestTransform(iter_147_1)

						break
					end
				end
			end

			arg_143_0:ChangePlayerPosition()
			arg_143_0:TriggerLadyDistance()
			arg_143_0:CheckInSector()
			arg_147_0()
		end,
		function(arg_148_0)
			arg_143_0:UpdateZoneList()
			arg_143_0:ShowBlackScreen(false, arg_148_0)
		end,
		function(arg_149_0)
			arg_143_0:emit(var_0_0.HIDE_BLOCK)
			arg_149_0()
		end
	}, arg_143_2)
end

function var_0_0.ActiveCamera(arg_150_0, arg_150_1)
	local var_150_0 = isActive(arg_150_1)

	table.Foreach(arg_150_0.cameras, function(arg_151_0, arg_151_1)
		setActive(arg_151_1, arg_151_1 == arg_150_1)
	end)

	if var_150_0 then
		arg_150_0:OnCameraBlendFinished(arg_150_1)
	end
end

function var_0_0.ActiveCameraByName(arg_152_0, arg_152_1)
	local var_152_0 = arg_152_0.cameraRoot:Find(arg_152_1)

	assert(var_152_0, "ActiveCameraByName: " .. arg_152_1 .. " not found")
	table.Foreach(arg_152_0.cameras, function(arg_153_0, arg_153_1)
		setActive(arg_153_1, false)
	end)
	setActive(var_152_0, true)

	arg_152_0.cameras[var_0_0.CAMERA.CUSTOM] = var_152_0
end

function var_0_0.ShowBlackScreen(arg_154_0, arg_154_1, arg_154_2)
	local var_154_0 = arg_154_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_154_1 and 0 or 0.3
	}

	setImageColor(arg_154_0.blackLayer, Color.NewHex(var_154_0.color))
	setActive(arg_154_0.blackLayer, true)
	setCanvasGroupAlpha(arg_154_0.blackLayer, arg_154_1 and 0 or 1)
	arg_154_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_154_1 then
			setActive(arg_154_0.blackLayer, false)
		end

		existCall(arg_154_2)
	end, GetComponent(arg_154_0.blackLayer, typeof(CanvasGroup)), arg_154_1 and 1 or 0, var_154_0.time):setDelay(var_154_0.delay)
end

function var_0_0.RegisterOrbits(arg_156_0, arg_156_1)
	arg_156_0 = arg_156_0.scene
	arg_156_0.orbits = {
		original = arg_156_1.m_Orbits
	}
	arg_156_0.orbits.current = _.range(3):map(function(arg_157_0)
		local var_157_0 = arg_156_0.orbits.original[arg_157_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_157_0.m_Height, var_157_0.m_Radius)
	end)
	arg_156_0.surroudCamera = arg_156_1
end

function var_0_0.SetCameraObrits(arg_158_0)
	arg_158_0 = arg_158_0.scene

	local var_158_0 = arg_158_0.surroudCamera

	if not var_158_0 then
		return
	end

	local var_158_1 = arg_158_0.orbits.original[1]

	for iter_158_0 = 0, #arg_158_0.orbits.current - 1 do
		local var_158_2 = arg_158_0.orbits.current[iter_158_0 + 1]
		local var_158_3 = arg_158_0.orbits.original[iter_158_0]

		var_158_2.m_Height = math.lerp(var_158_1.m_Height, var_158_3.m_Height, arg_158_0.pinchValue)
		var_158_2.m_Radius = var_158_3.m_Radius * arg_158_0.pinchValue
	end

	var_158_0.m_Orbits = arg_158_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_159_0)
	arg_159_0 = arg_159_0.scene

	local var_159_0 = arg_159_0.surroudCamera

	if not var_159_0 then
		return
	end

	for iter_159_0 = 0, #arg_159_0.orbits.current - 1 do
		local var_159_1 = arg_159_0.orbits.current[iter_159_0 + 1]
		local var_159_2 = arg_159_0.orbits.original[iter_159_0]

		var_159_1.m_Height = var_159_2.m_Height
		var_159_1.m_Radius = var_159_2.m_Radius
	end

	var_159_0.m_Orbits = arg_159_0.orbits.current
	arg_159_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_160_0, arg_160_1, arg_160_2)
	local var_160_0 = {
		base = function(arg_161_0)
			arg_160_0:RegisterCameraBlendFinished(arg_160_0.cameras[var_0_0.CAMERA.POV], arg_161_0)
			arg_160_0:ActiveCamera(arg_160_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_162_0)
			assert(arg_160_0.apartment)
			arg_160_0:SyncInterestTransform(arg_160_0.ladyDict[arg_160_0.apartment:GetConfigID()])
			arg_160_0:SetCameraLady(arg_160_0.ladyDict[arg_160_0.apartment:GetConfigID()])
			arg_160_0:RegisterCameraBlendFinished(arg_160_0.cameras[var_0_0.CAMERA.ROLE], arg_162_0)
			arg_160_0:ActiveCamera(arg_160_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_163_0)
			arg_160_0:RegisterCameraBlendFinished(arg_160_0.cameras[var_0_0.CAMERA.POV], arg_163_0)
			arg_160_0:ActiveCamera(arg_160_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_164_0)
			arg_164_0()
		end,
		gift = function(arg_165_0)
			assert(arg_160_0.apartment)
			arg_160_0:SetCameraLady(arg_160_0.ladyDict[arg_160_0.apartment:GetConfigID()])
			arg_160_0:RegisterCameraBlendFinished(arg_160_0.cameras[var_0_0.CAMERA.GIFT], arg_165_0)
			arg_160_0:ActiveCamera(arg_160_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_166_0)
			assert(arg_160_0.apartment)
			arg_160_0:SetCameraLady(arg_160_0.ladyDict[arg_160_0.apartment:GetConfigID()])

			arg_160_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_160_0.cameraRole.transform.position

			arg_160_0:RegisterCameraBlendFinished(arg_160_0.cameras[var_0_0.CAMERA.ROLE2], arg_166_0)
			arg_160_0:ActiveCamera(arg_160_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_167_0)
			assert(arg_160_0.apartment)
			arg_160_0:SetCameraLady(arg_160_0.ladyDict[arg_160_0.apartment:GetConfigID()])
			arg_160_0:SyncInterestTransform(arg_160_0.ladyDict[arg_160_0.apartment:GetConfigID()])
			arg_160_0:RegisterCameraBlendFinished(arg_160_0.cameras[var_0_0.CAMERA.TALK], arg_167_0)
			arg_160_0:ActiveCamera(arg_160_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_160_1 = {}

	table.insert(var_160_1, function(arg_168_0)
		switch(arg_160_1, var_160_0, arg_168_0, arg_168_0)
	end)
	seriesAsync(var_160_1, arg_160_2)
end

function var_0_0.GetSceneItem(arg_169_0, arg_169_1)
	local var_169_0

	if string.find(arg_169_1, "FurnitureSlots/") == 1 then
		arg_169_1 = string.gsub(arg_169_1, "^FurnitureSlots/", "", 1)
		var_169_0 = arg_169_0.slotRoot:Find(arg_169_1)
	else
		var_169_0 = arg_169_0.modelRoot:Find(arg_169_1)
	end

	if not var_169_0 then
		warning(string.format("Missing scene item path: %s", arg_169_1))
	end

	return var_169_0
end

function var_0_0.SetIKStatus(arg_170_0, arg_170_1, arg_170_2, arg_170_3)
	warning("Set IKStatus " .. (arg_170_2.id or "NIL"))

	arg_170_0.enableIKTip = true

	arg_170_0:ResetIKTipTimer()
	setActive(arg_170_1.ladyCollider, false)
	_.each(arg_170_1.ladyTouchColliders, function(arg_171_0)
		setActive(arg_171_0, true)
	end)

	arg_170_0.blockIK = nil
	arg_170_1.ikActionDict = {}
	arg_170_1.readyIKLayers = {}
	arg_170_1.iKTouchDatas = arg_170_2.touch_data or {}
	arg_170_1.IKSettings = {
		Colliders = arg_170_1.ladyColliders,
		CameraRaycaster = arg_170_0.sceneRaycaster
	}

	local var_170_0 = table.shallowCopy(arg_170_2.ik_id)
	local var_170_1 = {}

	_.each(arg_170_1.iKTouchDatas, function(arg_172_0)
		local var_172_0 = arg_172_0[3]

		if var_172_0[1] == 7 then
			local var_172_1 = pg.dorm3d_ik_touch_move[var_172_0[2]]
			local var_172_2 = var_172_1.target_ik

			if not _.detect(var_170_0, function(arg_173_0)
				return arg_173_0[1] == var_172_2
			end) then
				var_170_1[var_172_2] = {
					back_time = var_172_1.back_time
				}

				local var_172_3 = {
					var_172_2,
					0,
					{}
				}

				if var_172_1.trigger_dialogue > 0 then
					var_172_3[3] = {
						4,
						0,
						var_172_1.trigger_dialogue
					}
				end

				table.insert(var_170_0, var_172_3)
			end
		end
	end)

	local var_170_2 = _.map(var_170_0, function(arg_174_0)
		local var_174_0 = Dorm3dIK.New({
			configId = arg_174_0[1]
		})
		local var_174_1 = arg_174_0[3]
		local var_174_2 = var_174_1[1]
		local var_174_3 = switch(var_174_2, {
			function(arg_175_0, arg_175_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_177_0, arg_177_1)
				return arg_177_0
			end,
			function(arg_178_0, arg_178_1)
				return arg_178_0
			end,
			function(arg_179_0, arg_179_1, arg_179_2, arg_179_3)
				return arg_179_0
			end,
			function(arg_180_0)
				return 0
			end
		}, function(arg_181_0)
			return type(arg_181_0) == "number" and arg_181_0 or 0
		end, unpack(var_174_1, 2))

		table.insert(arg_170_1.readyIKLayers, var_174_0)

		arg_170_1.ikActionDict[var_174_0:GetControllerPath()] = var_174_1

		local var_174_4 = var_174_0:GetRevertTime()
		local var_174_5 = var_170_1[var_174_0:GetConfigID()]
		local var_174_6 = tobool(var_174_5)

		if var_174_6 then
			var_174_3 = var_174_5.back_time
			var_174_4 = var_174_5.back_time
			var_174_0.ignoreDrag = true
		end

		local var_174_7 = var_174_0:GetSubTargets()
		local var_174_8 = var_174_0:GetPlaneRotations()
		local var_174_9 = var_174_0:GetPlaneScales()
		local var_174_10 = _.map(_.range(#var_174_7), function(arg_182_0)
			return {
				name = var_174_7[arg_182_0][1],
				planeRot = var_174_8[arg_182_0],
				planeScale = var_174_9[arg_182_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_174_0:getConfig("trigger_param")[2],
			controllerName = var_174_0:GetControllerPath(),
			subTargets = var_174_10,
			actionType = var_174_0:GetActionTriggerParams()[1],
			controlRect = var_174_0:GetRect(),
			actionRect = var_174_0:GetTriggerRect(),
			backTime = var_174_4,
			actionRevertTime = var_174_3,
			ignoreDrag = var_174_6
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_170_1.ladyIKRoot, arg_170_1.ladyBoneMaps)
	arg_170_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_170_2)

	local var_170_3 = _.map(arg_170_1.iKTouchDatas, function(arg_183_0)
		return arg_183_0[1]
	end)

	table.Foreach(var_170_3, function(arg_184_0, arg_184_1)
		local var_184_0 = pg.dorm3d_ik_touch[arg_184_1]

		if #var_184_0.scene_item == 0 then
			return
		end

		local var_184_1 = arg_170_0:GetSceneItem(var_184_0.scene_item)

		if not var_184_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_184_1, var_184_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_184_1, typeof(UnityEngine.Collider))) then
			go(var_184_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_184_2 = GetOrAddComponent(var_184_1, typeof(EventTriggerListener))

		var_184_2.enabled = true

		var_184_2:AddPointClickFunc(function()
			arg_170_0.blockIK = true

			local var_185_0 = arg_170_1.iKTouchDatas[arg_184_0]
			local var_185_1, var_185_2, var_185_3 = unpack(var_185_0)

			arg_170_0:TouchModeAction(arg_170_1, var_185_1, unpack(var_185_3))(function()
				arg_170_0.enableIKTip = true

				arg_170_0:ResetIKTipTimer()

				arg_170_0.blockIK = nil
			end)
		end)
	end)

	arg_170_0.camBrain.enabled = false

	if arg_170_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_170_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_170_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_170_4 = arg_170_0.cameraRoot:Find(arg_170_2.ik_camera)

	assert(var_170_4, "Missing IKCamera")

	arg_170_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_170_4

	arg_170_0:ActiveCamera(arg_170_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_170_0.camBrain.enabled = true

	local var_170_5 = var_170_4:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_170_5 then
		arg_170_0:RegisterOrbits(var_170_5)
	else
		arg_170_0:RevertCameraOrbit()
	end

	arg_170_0:SwitchAnim(arg_170_1, arg_170_2.character_action)
	arg_170_0:SettingHeadAimIK(arg_170_1, arg_170_2.head_track)
	arg_170_1:EnableCloth(false)
	arg_170_1:EnableCloth(arg_170_2.use_cloth, arg_170_2.cloth_colliders)
	;(function()
		local var_187_0 = arg_170_2.enter_scene_anim
		local var_187_1 = {}

		if var_187_0 and #var_187_0 > 0 then
			table.Ipairs(var_187_0, function(arg_188_0, arg_188_1)
				arg_170_0:PlaySceneItemAnim(arg_188_1[1], arg_188_1[2])
				table.insert(var_187_1, arg_188_1[1])
			end)
		end

		arg_170_0:ResetSceneItemAnimators(var_187_1)
	end)()
	;(function()
		local var_189_0 = arg_170_2.enter_extra_item
		local var_189_1 = {}

		if var_189_0 and #var_189_0 > 0 then
			table.Ipairs(var_189_0, function(arg_190_0, arg_190_1)
				local var_190_0 = arg_190_1[3] and Vector3.New(unpack(arg_190_1[3]))
				local var_190_1 = arg_190_1[4] and Quaternion.Euler(unpack(arg_190_1[4]))
				local var_190_2 = #arg_190_1 > 4 and arg_190_1[5] or nil

				arg_170_0:LoadCharacterExtraItem(arg_170_1, arg_190_1[1], arg_190_1[2], var_190_0, var_190_1, var_190_2)
				table.insert(var_189_1, arg_190_1[1])
			end)
		end

		arg_170_0:ResetCharacterExtraItem(arg_170_1, var_189_1)
	end)()
	;(function()
		local var_191_0 = arg_170_2.hide_scene_item

		if var_191_0 and #var_191_0 > 0 then
			arg_170_1.tempHideSceneItems = {}

			table.Ipairs(var_191_0, function(arg_192_0, arg_192_1)
				local var_192_0 = arg_170_0:GetSceneItem(arg_192_1)

				setActive(var_192_0, false)
				table.insert(arg_170_1.tempHideSceneItems, arg_192_1)
			end)
		end
	end)()
	eachChild(arg_170_0.ikTextTipsRoot, function(arg_193_0)
		setActive(arg_193_0, false)
	end)
	_.each(arg_170_1.readyIKLayers, function(arg_194_0)
		local var_194_0 = arg_194_0:getConfig("tip_text")

		if not var_194_0 or #var_194_0 == 0 then
			return
		end

		local var_194_1 = arg_170_0.ikTextTipsRoot:Find(var_194_0)

		if not IsNil(var_194_1) then
			setActive(var_194_1, true)
		end
	end)
	onNextTick(function()
		local var_195_0 = arg_170_0.furnitures:Find(arg_170_2.character_position)

		arg_170_1.lady.position = var_195_0:Find("StayPoint").position
		arg_170_1.lady.rotation = var_195_0:Find("StayPoint").rotation

		existCall(arg_170_3)
	end)
end

function var_0_0.ExitIKStatus(arg_196_0, arg_196_1, arg_196_2, arg_196_3)
	arg_196_0.enableIKTip = false

	setActive(arg_196_1.ladyCollider, true)
	_.each(arg_196_1.ladyTouchColliders, function(arg_197_0)
		setActive(arg_197_0, false)
	end)

	arg_196_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()
	setActive(arg_196_0.ikTipsRoot, false)
	setActive(arg_196_0.ikClickTipsRoot, false)

	local var_196_0 = _.map(arg_196_1.iKTouchDatas, function(arg_198_0)
		return arg_198_0[1]
	end)

	table.Foreach(var_196_0, function(arg_199_0, arg_199_1)
		local var_199_0 = pg.dorm3d_ik_touch[arg_199_1]

		if #var_199_0.scene_item == 0 then
			return
		end

		local var_199_1 = arg_196_0.modelRoot:Find(var_199_0.scene_item)

		if not var_199_1 then
			return
		end

		local var_199_2 = GetOrAddComponent(var_199_1, typeof(EventTriggerListener))

		var_199_2:ClearEvents()

		var_199_2.enabled = false
	end)

	arg_196_1.ikActionDict = nil
	arg_196_1.readyIKLayers = nil
	arg_196_1.iKTouchDatas = nil

	arg_196_0:RevertCameraOrbit()
	setActive(arg_196_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_196_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_196_1:EnableCloth(false)
	arg_196_0:ResetHeadAimIK(arg_196_1)
	arg_196_0:SwitchAnim(arg_196_1, arg_196_2.character_action)
	arg_196_0:ResetSceneItemAnimators()
	arg_196_0:ResetCharacterExtraItem(arg_196_1)
	;(function()
		if arg_196_1.tempHideSceneItems and #arg_196_1.tempHideSceneItems > 0 then
			table.Ipairs(arg_196_1.tempHideSceneItems, function(arg_201_0, arg_201_1)
				local var_201_0 = arg_196_0:GetSceneItem(arg_201_1)

				setActive(var_201_0, true)
			end)

			arg_196_1.tempHideSceneItems = nil
		end
	end)()
	onNextTick(function()
		if arg_196_2.character_position then
			arg_196_1.ladyActiveZone = arg_196_2.character_position
		else
			arg_196_1.ladyActiveZone = arg_196_1.ladyBaseZone
		end

		arg_196_0:ChangeCharacterPosition(arg_196_1)
		arg_196_0:TriggerLadyDistance()
		arg_196_0:CheckInSector()
		existCall(arg_196_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_203_0, arg_203_1, arg_203_2, arg_203_3, arg_203_4, arg_203_5)
	warning("Set IKStatus " .. (arg_203_3 or "NIL"))

	arg_203_0.enableIKTip = true

	setActive(arg_203_0.ikControlUI, true)
	arg_203_0:ResetIKTipTimer()

	arg_203_0.blockIK = nil

	local var_203_0 = pg.dorm3d_ik_timeline_status[arg_203_3]

	arg_203_1.readyIKLayers = {}
	arg_203_1.iKTouchDatas = {}
	arg_203_1.IKSettings = {
		CameraRaycaster = GetOrAddComponent(arg_203_4, typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_203_1.IKSettings.CameraRaycaster)

	local var_203_1 = {}

	table.IpairsCArray(arg_203_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_204_0, arg_204_1)
		if arg_204_1.name == "SafeCollider" then
			setActive(arg_204_1, false)

			return
		end

		if arg_204_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		local var_204_0 = tf(arg_204_1)
		local var_204_1 = var_204_0.name
		local var_204_2 = var_204_1 and string.find(var_204_1, "Collider") or -1

		if var_204_2 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_204_1)

			return
		end

		local var_204_3 = string.sub(var_204_1, 1, var_204_2 - 1)

		if var_204_3 == "Body" or var_204_3 == "Safe" then
			setActive(var_204_0, false)

			return
		end

		if DormConst.BONE_TO_TOUCH[var_204_3] == nil then
			return
		end

		var_203_1[var_204_3] = var_204_0

		setActive(var_204_0, true)
	end)

	arg_203_1.IKSettings.Colliders = var_203_1

	local var_203_2 = GetOrAddComponent(arg_203_2, typeof(EventTriggerListener))

	arg_203_1.ikTimelineMode = true

	local var_203_3 = _.map(var_203_0.ik_id, function(arg_205_0)
		local var_205_0 = Dorm3dIK.New({
			configId = arg_205_0
		})

		table.insert(arg_203_1.readyIKLayers, var_205_0)

		local var_205_1 = var_205_0:GetSubTargets()
		local var_205_2 = var_205_0:GetPlaneRotations()
		local var_205_3 = var_205_0:GetPlaneScales()
		local var_205_4 = _.map(_.range(#var_205_1), function(arg_206_0)
			return {
				name = var_205_1[arg_206_0][1],
				planeRot = var_205_2[arg_206_0],
				planeScale = var_205_3[arg_206_0]
			}
		end)

		return Dorm3dIKController.New({
			ignoreDrag = false,
			triggerName = var_205_0:getConfig("trigger_param")[2],
			controllerName = var_205_0:GetControllerPath(),
			subTargets = var_205_4,
			actionType = var_205_0:GetActionTriggerParams()[1],
			controlRect = var_205_0:GetRect(),
			actionRect = var_205_0:GetTriggerRect(),
			backTime = var_205_0:GetRevertTime(),
			actionRevertTime = var_205_0:GetActionRevertTime(),
			timelineActionEvent = var_205_0:GetTimelineAction()
		})
	end)
	local var_203_4 = arg_203_2.transform:Find("IKLayers")
	local var_203_5 = {}
	local var_203_6 = {}

	table.Foreach(DormConst.boneMap, function(arg_207_0, arg_207_1)
		var_203_6[arg_207_1] = arg_207_0
	end)

	local var_203_7 = arg_203_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_203_7, function(arg_208_0, arg_208_1)
		if var_203_6[arg_208_1.name] then
			var_203_5[var_203_6[arg_208_1.name]] = arg_208_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_203_4, var_203_5)
	arg_203_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_203_3)
	eachChild(arg_203_0.ikTextTipsRoot, function(arg_209_0)
		setActive(arg_209_0, false)
	end)
	_.each(arg_203_1.readyIKLayers, function(arg_210_0)
		local var_210_0 = arg_210_0:getConfig("tip_text")

		if not var_210_0 or #var_210_0 == 0 then
			return
		end

		local var_210_1 = arg_203_0.ikTextTipsRoot:Find(var_210_0)

		if not IsNil(var_210_1) then
			setActive(var_210_1, true)
		end
	end)
	existCall(arg_203_5)
end

function var_0_0.ExitIKTimelineStatus(arg_211_0, arg_211_1, arg_211_2)
	arg_211_0.enableIKTip = false

	setActive(arg_211_0.ikControlUI, false)

	arg_211_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_211_1.readyIKLayers = nil
	arg_211_1.iKTouchDatas = nil
	arg_211_1.IKSettings = nil

	setActive(arg_211_0.ikTipsRoot, false)
	setActive(arg_211_0.ikClickTipsRoot, false)
	existCall(arg_211_2)
end

function var_0_0.EnableIKLayer(arg_212_0, arg_212_1)
	local var_212_0 = arg_212_0.ladyDict[arg_212_0.apartment:GetConfigID()]

	if #arg_212_1:GetHeadTrackPath() > 0 then
		arg_212_0:SettingHeadAimIK(var_212_0, {
			2,
			arg_212_1:GetHeadTrackPath()
		}, true)
	end

	local var_212_1 = arg_212_1:GetTriggerFaceAnim()

	if #var_212_1 > 0 then
		arg_212_0:PlayFaceAnim(var_212_0, var_212_1)
	end

	if not arg_212_1.ignoreDrag then
		setActive(arg_212_0:GetIKHandTF(), true)
		eachChild(arg_212_0:GetIKHandTF(), function(arg_213_0)
			setActive(arg_213_0, false)
		end)
		arg_212_0:StopIKHandTimer()
		setActive(arg_212_0:GetIKHandTF():Find("Begin"), true)

		arg_212_0.ikHandTimer = Timer.New(function()
			setActive(arg_212_0:GetIKHandTF():Find("Begin"), false)
			setActive(arg_212_0:GetIKHandTF():Find("Normal"), true)
		end, 0.5, 1)

		arg_212_0.ikHandTimer:Start()
	end

	if not var_212_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_212_0.apartment.configId, arg_212_0.apartment.level, var_212_0.ikConfig.character_action, arg_212_1:GetTriggerParams()[2], arg_212_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_215_0, arg_215_1)
	local var_215_0 = arg_215_0.ladyDict[arg_215_0.apartment:GetConfigID()]

	if not var_215_0.ikTimelineMode and #arg_215_1:GetHeadTrackPath() > 0 then
		arg_215_0:SettingHeadAimIK(var_215_0, var_215_0.ikConfig.head_track)
	end

	arg_215_0:StopIKHandTimer()

	if not arg_215_1.ignoreDrag then
		setActive(arg_215_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_215_0:GetIKHandTF():Find("Normal"), false)
		setActive(arg_215_0:GetIKHandTF():Find("End"), true)

		arg_215_0.ikHandTimer = Timer.New(function()
			setActive(arg_215_0:GetIKHandTF():Find("End"), false)
			setActive(arg_215_0:GetIKHandTF(), false)
		end, 0.5, 1)

		arg_215_0.ikHandTimer:Start()
	end
end

function var_0_0.StopIKHandTimer(arg_217_0)
	if not arg_217_0.ikHandTimer then
		return
	end

	arg_217_0.ikHandTimer:Stop()

	arg_217_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_218_0, arg_218_1, arg_218_2, arg_218_3)
	local var_218_0 = Time.time

	function arg_218_0.ikRevertHandler()
		local var_219_0 = Time.time - var_218_0

		_.each(arg_218_1.activeIKLayers, function(arg_220_0)
			local var_220_0 = 1

			if arg_218_2 > 0 then
				var_220_0 = var_219_0 / arg_218_2
			end

			local var_220_1 = arg_218_1.cacheIKInfos[arg_220_0].solvers
			local var_220_2 = arg_218_1.cacheIKInfos[arg_220_0].weights

			table.Foreach(var_220_1, function(arg_221_0, arg_221_1)
				arg_221_1.IKPositionWeight = math.lerp(var_220_2[arg_221_0], 0, var_220_0)
			end)
		end)

		if var_219_0 >= arg_218_2 then
			arg_218_0:ResetActiveIKs(arg_218_1)

			arg_218_0.ikRevertHandler = nil

			existCall(arg_218_3)
		end
	end

	arg_218_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_222_0, arg_222_1)
	table.insertto(arg_222_0.activeIKLayers, _.keys(arg_222_0.holdingStatus))
	table.clear(arg_222_0.holdingStatus)
	_.each(arg_222_1.activeIKLayers, function(arg_223_0)
		local var_223_0 = arg_223_0:GetControllerPath()
		local var_223_1 = arg_222_1.ladyIKRoot:Find(var_223_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_223_1, false)

		local var_223_2 = arg_222_1.cacheIKInfos[arg_223_0].solvers
		local var_223_3 = arg_222_1.cacheIKInfos[arg_223_0].weights

		table.Foreach(var_223_2, function(arg_224_0, arg_224_1)
			arg_224_1.IKPositionWeight = var_223_3[arg_224_0]
		end)
	end)
	table.clear(arg_222_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_225_0)
	if not arg_225_0.enableIKTip then
		return
	end

	arg_225_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_226_0, arg_226_1)
	local var_226_0 = arg_226_0.ladyDict[arg_226_0.apartment:GetConfigID()]

	arg_226_0:EnableHeadIK(var_226_0, arg_226_1)
end

function var_0_0.EnableHeadIK(arg_227_0, arg_227_1, arg_227_2)
	arg_227_1.ladyHeadIKComp.enableIk = arg_227_2
end

function var_0_0.SettingHeadAimIK(arg_228_0, arg_228_1, arg_228_2, arg_228_3)
	local var_228_0

	if arg_228_2[1] == 1 then
		var_228_0 = arg_228_0.mainCameraTF:Find("AimTarget")
	elseif arg_228_2[1] == 2 then
		table.IpairsCArray(arg_228_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_229_0, arg_229_1)
			if arg_229_1.name ~= arg_228_2[2] then
				return
			end

			var_228_0 = arg_229_1
		end)
	end

	arg_228_1.ladyHeadIKComp.AimTarget = var_228_0

	if not arg_228_3 and arg_228_2[3] then
		arg_228_1.ladyHeadIKComp.BodyWeight = arg_228_2[3]
	end

	if not arg_228_3 and arg_228_2[4] then
		arg_228_1.ladyHeadIKComp.HeadWeight = arg_228_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_230_0, arg_230_1)
	arg_230_1.ladyHeadIKComp.AimTarget = arg_230_0.mainCameraTF:Find("AimTarget")
	arg_230_1.ladyHeadIKComp.HeadWeight = arg_230_1.ladyHeadIKData.HeadWeight
	arg_230_1.ladyHeadIKComp.BodyWeight = arg_230_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_231_0, arg_231_1)
	for iter_231_0, iter_231_1 in pairs(arg_231_0.ladyDict) do
		if iter_231_0 ~= arg_231_1 then
			arg_231_0:HideCharacterBylayer(iter_231_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_232_0, arg_232_1)
	for iter_232_0, iter_232_1 in pairs(arg_232_0.ladyDict) do
		if iter_232_0 ~= arg_232_1 then
			arg_232_0:RevertCharacterBylayer(iter_232_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_233_0, arg_233_1)
	local var_233_0 = "Bip001"
	local var_233_1 = arg_233_1.lady:Find("all")

	for iter_233_0 = 0, var_233_1.childCount - 1 do
		local var_233_2 = var_233_1:GetChild(iter_233_0)

		if var_233_2.name ~= var_233_0 then
			pg.ViewUtils.SetLayer(var_233_2, Layer.Environment3D)
		end
	end

	if arg_233_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_233_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_233_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_233_1.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_233_1.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_234_0, arg_234_1)
	local var_234_0 = "Bip001"
	local var_234_1 = arg_234_1.lady:Find("all")

	for iter_234_0 = 0, var_234_1.childCount - 1 do
		local var_234_2 = var_234_1:GetChild(iter_234_0)

		if var_234_2.name ~= var_234_0 then
			pg.ViewUtils.SetLayer(var_234_2, Layer.Default)
		end
	end

	if arg_234_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_234_1.tfPendintItem, Layer.Default)
	end

	if arg_234_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_234_1.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_234_1.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_235_0)
	arg_235_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_235_0:EnableJoystick(true)
	arg_235_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_236_0, arg_236_1)
	arg_236_0:HideFurnitureSlots()

	local var_236_0 = arg_236_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_237_0)
			arg_236_0.furniturePOV = nil

			arg_236_0:EnableJoystick(false)
			arg_236_0:emit(var_0_0.SHOW_BLOCK)
			arg_236_0:ShowBlackScreen(true, arg_237_0)
		end,
		function(arg_238_0)
			existCall(arg_236_1)
			arg_236_0:RevertCharacter()
			arg_236_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_236_0:RegisterCameraBlendFinished(var_236_0, arg_238_0)
			arg_236_0:ActiveCamera(var_236_0)
		end,
		function(arg_239_0)
			arg_236_0:ShowBlackScreen(false, arg_239_0)
		end
	}, function()
		arg_236_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_236_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_241_0, arg_241_1)
	local var_241_0 = arg_241_0:GetFurnitureByName(arg_241_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_241_0.cameraFurnitureWatch and arg_241_0.cameraFurnitureWatch ~= var_241_0 then
		arg_241_0:UnRegisterCameraBlendFinished(arg_241_0.cameraFurnitureWatch)
		setActive(arg_241_0.cameraFurnitureWatch, false)
	end

	arg_241_0.cameraFurnitureWatch = var_241_0
	arg_241_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_241_0.cameraFurnitureWatch
	arg_241_0.furniturePOV = arg_241_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_241_0:RegisterCameraBlendFinished(arg_241_0.cameraFurnitureWatch, function()
		arg_241_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_241_0:emit(var_0_0.SHOW_BLOCK)
	arg_241_0:ActiveCamera(arg_241_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_243_0)
	if arg_243_0.displaySlots then
		arg_243_0:UpdateDisplaySlots({})
		table.Foreach(arg_243_0.displaySlots, function(arg_244_0, arg_244_1)
			local var_244_0 = arg_244_1.trans

			if IsNil(var_244_0:Find("Selector")) then
				return
			end

			setActive(var_244_0:Find("Selector"), false)
		end)

		arg_243_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_245_0, arg_245_1)
	arg_245_0:HideFurnitureSlots()

	arg_245_0.displaySlots = {}

	_.each(arg_245_1, function(arg_246_0)
		arg_245_0.displaySlots[arg_246_0] = arg_245_0.slotDict[arg_246_0]

		if not arg_245_0.displaySlots[arg_246_0] then
			errorMsg("Slot " .. arg_246_0 .. " Not Binding Scene Object")

			return
		end

		local var_246_0 = arg_245_0.displaySlots[arg_246_0].trans

		if var_246_0:Find("Selector") then
			setActive(var_246_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_247_0, arg_247_1)
	table.Foreach(arg_247_0.displaySlots, function(arg_248_0, arg_248_1)
		local var_248_0 = arg_248_1.trans

		if not IsNil(var_248_0:Find("Selector")) then
			setActive(var_248_0:Find("Selector/Normal"), arg_247_1[arg_248_0] == 0)
			setActive(var_248_0:Find("Selector/Active"), arg_247_1[arg_248_0] == 1)
			setActive(var_248_0:Find("Selector/Ban"), arg_247_1[arg_248_0] == 2)
		end

		local var_248_1 = arg_247_0.slotDict[arg_248_0].model
		local var_248_2 = arg_247_0.slotDict[arg_248_0].displayModelName

		if var_248_2 and var_248_2 ~= "" then
			var_248_1 = var_248_0:GetChild(var_248_0.childCount - 1)
		end

		local function var_248_3(arg_249_0, arg_249_1)
			local var_249_0 = arg_249_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_249_0, function(arg_250_0, arg_250_1)
				local var_250_0 = arg_250_1.material

				if var_250_0 and var_250_0:HasProperty("_FinalTint") then
					var_250_0:SetColor("_FinalTint", arg_249_1)
				end
			end)
		end

		if var_248_1 then
			if arg_247_1[arg_248_0] == 1 then
				var_248_3(var_248_1, Color.NewHex("3F83AE73"))
			else
				var_248_3(var_248_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_251_0, arg_251_1, arg_251_2)
	arg_251_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_251_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_252_0)
			arg_251_0:TempHideUI(true, arg_252_0)
		end,
		function(arg_253_0)
			arg_251_0:ShowBlackScreen(true, arg_253_0)
		end,
		function(arg_254_0)
			local var_254_0 = arg_251_0.apartment:GetConfigID()
			local var_254_1 = arg_251_0.ladyDict[var_254_0]

			arg_251_0:SwitchAnim(var_254_1, arg_251_2)
			var_254_1.ladyAnimator:Update(0)
			arg_251_0:ResetCharPoint(var_254_1, arg_251_1:GetWatchCameraName())
			arg_251_0:SyncInterestTransform(var_254_1)
			setActive(var_254_1.ladySafeCollider, true)
			arg_251_0:HideCharacter(var_254_0)

			local var_254_2 = arg_251_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_254_3 = var_254_2.m_XAxis

			var_254_3.Value = 180
			var_254_2.m_XAxis = var_254_3

			local var_254_4 = var_254_2.m_YAxis

			var_254_4.Value = 0.7
			var_254_2.m_YAxis = var_254_4
			arg_251_0.pinchValue = 1

			arg_251_0:RegisterOrbits(arg_251_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_251_0:SetCameraObrits()
			setActive(arg_251_0.restrictedBox, true)
			arg_251_0:RegisterCameraBlendFinished(var_254_2, arg_254_0)
			arg_251_0:ActiveCamera(var_254_2)
		end,
		function(arg_255_0)
			arg_251_0:ShowBlackScreen(false, arg_255_0)
		end
	}, function()
		arg_251_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_257_0)
	arg_257_0:emit(var_0_0.SHOW_BLOCK)
	arg_257_0:EnableJoystick(false)
	seriesAsync({
		function(arg_258_0)
			arg_257_0:ShowBlackScreen(true, arg_258_0)
		end,
		function(arg_259_0)
			arg_257_0:RevertCameraOrbit()

			local var_259_0 = arg_257_0.ladyDict[arg_257_0.apartment:GetConfigID()]

			arg_257_0:SwitchAnim(var_259_0, var_0_0.ANIM.IDLE)
			setActive(var_259_0.ladySafeCollider, false)
			onNextTick(function()
				arg_257_0:ChangeCharacterPosition(var_259_0)
			end)

			if arg_257_0.contextData.photoFreeMode then
				arg_257_0:EnablePOVLayer(false)

				arg_257_0.contextData.photoFreeMode = nil
			end

			setActive(arg_257_0.restrictedBox, false)

			local var_259_1 = arg_257_0.cameras[var_0_0.CAMERA.POV]

			arg_257_0:RegisterCameraBlendFinished(var_259_1, arg_259_0)
			arg_257_0:ActiveCamera(var_259_1)
		end,
		function(arg_261_0)
			arg_257_0:RevertCharacter(arg_257_0.apartment:GetConfigID())
			arg_257_0:ShowBlackScreen(false, arg_261_0)
		end
	}, function()
		arg_257_0:RefreshSlots()
		arg_257_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_257_0:emit(var_0_0.HIDE_BLOCK)
		arg_257_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_257_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_263_0, arg_263_1, arg_263_2, arg_263_3)
	arg_263_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_264_0)
			arg_263_0:ShowBlackScreen(true, arg_264_0)
		end,
		function(arg_265_0)
			local var_265_0 = arg_263_0.ladyDict[arg_263_0.apartment:GetConfigID()]

			arg_263_0:SwitchAnim(var_265_0, arg_263_2)
			onNextTick(function()
				arg_263_0:ResetCharPoint(var_265_0, arg_263_1:GetWatchCameraName())
				arg_263_0:SyncInterestTransform(var_265_0)

				if arg_263_0.contextData.photoFreeMode then
					arg_263_0.camBrain.enabled = false

					arg_263_0:SwitchPhotoCamera()

					arg_263_0.camBrain.enabled = true

					onDelayTick(function()
						arg_263_0.camBrain.enabled = false

						arg_263_0:SwitchPhotoCamera()

						arg_263_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_265_0()
			end)
		end,
		function(arg_268_0)
			arg_263_0:ShowBlackScreen(false, arg_268_0)
		end
	}, function()
		arg_263_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_263_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_270_0)
	if not arg_270_0.contextData.photoFreeMode then
		arg_270_0:EnableJoystick(false)
		arg_270_0:EnablePOVLayer(true)

		local var_270_0 = arg_270_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
		local var_270_1 = arg_270_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_270_2 = arg_270_0.mainCameraTF.rotation:ToEulerAngles()
		local var_270_3 = var_270_1.m_HorizontalAxis

		var_270_3.Value = var_270_2.y
		var_270_1.m_HorizontalAxis = var_270_3

		local var_270_4 = var_270_1.m_VerticalAxis

		var_270_4.Value = arg_270_0:GetNearestAngle(var_270_2.x, var_270_4.m_MinValue, var_270_4.m_MaxValue)
		var_270_1.m_VerticalAxis = var_270_4

		local var_270_5 = arg_270_0.mainCameraTF.position
		local var_270_6 = math.InverseLerp(arg_270_0.restrictedHeightRange[1], arg_270_0.restrictedHeightRange[2], var_270_5.y)

		var_270_5.y = math.clamp(var_270_5.y, arg_270_0.restrictedHeightRange[1], arg_270_0.restrictedHeightRange[2])
		var_270_0.transform.position = var_270_5

		arg_270_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_270_6)
		arg_270_0:ActiveCamera(arg_270_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_270_0:EnableJoystick(true)
		arg_270_0:EnablePOVLayer(false)
		arg_270_0:ActiveCamera(arg_270_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_270_0.contextData.photoFreeMode = not arg_270_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_271_0, arg_271_1)
	local var_271_0 = math.lerp(arg_271_0.restrictedHeightRange[1], arg_271_0.restrictedHeightRange[2], arg_271_1)
	local var_271_1 = arg_271_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_271_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_271_0 - var_271_1.position.y, 0))
	onNextTick(function()
		local var_272_0 = math.InverseLerp(arg_271_0.restrictedHeightRange[1], arg_271_0.restrictedHeightRange[2], var_271_1.position.y)

		arg_271_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_272_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_273_0)
	local var_273_0 = arg_273_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_273_1 = var_273_0.m_XAxis

	var_273_1.Value = 180
	var_273_0.m_XAxis = var_273_1

	local var_273_2 = var_273_0.m_YAxis

	var_273_2.Value = 0.7
	var_273_0.m_YAxis = var_273_2
end

function var_0_0.ResetCurrentCharPoint(arg_274_0, arg_274_1)
	local var_274_0 = arg_274_0.ladyDict[arg_274_0.apartment:GetConfigID()]

	arg_274_0:ResetCharPoint(var_274_0, arg_274_1)
end

function var_0_0.ResetCharPoint(arg_275_0, arg_275_1, arg_275_2)
	local var_275_0 = arg_275_0.furnitures:Find(arg_275_2 .. "/StayPoint")

	arg_275_1.lady.position = var_275_0.position
	arg_275_1.lady.rotation = var_275_0.rotation
end

function var_0_0.GetNearestAngle(arg_276_0, arg_276_1, arg_276_2, arg_276_3)
	if arg_276_3 < arg_276_2 then
		arg_276_3 = arg_276_3 + 360
	end

	if arg_276_2 <= arg_276_1 and arg_276_1 <= arg_276_3 then
		return arg_276_1
	end

	local var_276_0 = (arg_276_2 + arg_276_3) / 2

	arg_276_1 = var_276_0 - Mathf.DeltaAngle(arg_276_1, var_276_0)
	arg_276_1 = math.clamp(arg_276_1, arg_276_2, arg_276_3)

	return arg_276_1
end

function var_0_0.PlayTimeline(arg_277_0, arg_277_1, arg_277_2)
	local var_277_0 = {}

	if arg_277_0.waitForTimeline then
		table.insert(var_277_0, function(arg_278_0)
			local var_278_0 = arg_277_0.waitForTimeline

			arg_277_0.waitForTimeline = nil

			var_278_0()
			arg_278_0()
		end)
	end

	table.insert(var_277_0, function(arg_279_0)
		arg_277_0:LoadTimelineScene(arg_277_1.name, false, nil, arg_279_0)
	end)

	if arg_277_1.scene and arg_277_1.sceneRoot then
		table.insert(var_277_0, function(arg_280_0)
			arg_277_0:ChangeArtScene(arg_277_1.scene .. "|" .. arg_277_1.sceneRoot, arg_280_0)
		end)
	end

	table.insert(var_277_0, function(arg_281_0)
		local var_281_0 = GameObject.Find("[actor]").transform
		local var_281_1 = var_281_0:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_281_1, function(arg_282_0, arg_282_1)
			GetOrAddComponent(arg_282_1.transform, typeof(DftAniEvent))
		end)

		local var_281_2 = var_281_0:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform
		local var_281_3

		eachChild(GameObject.Find("[camera]").transform, function(arg_283_0)
			if arg_283_0.tag == "MainCamera" then
				var_281_3 = arg_283_0
			end
		end)
		assert(var_281_3, "Missing MainCamera")

		local var_281_4 = GameObject.Find("[sequence]").transform

		arg_277_0.nowTimelinePlayer = TimelinePlayer.New(var_281_4)

		arg_277_0.nowTimelinePlayer:Register(arg_277_1.time, function(arg_284_0, arg_284_1, arg_284_2)
			switch(arg_284_1.stringParameter, {
				TimelinePause = function()
					arg_284_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_284_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_284_1.intParameter == 0 or arg_284_1.intParameter == arg_284_2.selectIndex then
						arg_284_0:SetTime(arg_284_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_284_2.selectIndex = nil

					if arg_277_1.options then
						local var_288_0 = arg_277_1.options[arg_284_1.intParameter]

						arg_277_0:DoTimelineOption(var_288_0, function(arg_289_0)
							arg_284_2.selectIndex = arg_289_0
							arg_284_2.optionIndex = var_288_0[arg_289_0].flag

							arg_284_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_284_2.selectIndex = nil

					if arg_277_1.touchs then
						local var_290_0 = arg_277_1.touchs[arg_284_1.intParameter]

						arg_277_0:DoTimelineTouch(arg_277_1.touchs[arg_284_1.intParameter], function(arg_291_0)
							arg_284_2.selectIndex = arg_291_0
							arg_284_2.optionIndex = var_290_0[arg_291_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_284_2.selectIndex then
						arg_284_0:RawSetTime(arg_284_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_284_2.selectIndex = arg_284_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_277_0.canTriggerAccompanyPerformance then
						arg_277_0.canTriggerAccompanyPerformance = false

						local var_294_0 = arg_277_1.accompanys[arg_284_1.intParameter]
						local var_294_1 = var_294_0[math.random(#var_294_0)]

						arg_284_0:SetTime(var_294_1)
					end
				end,
				TimelineIKStart = function()
					arg_284_2.selectIndex = nil

					local var_295_0 = arg_284_1.intParameter
					local var_295_1 = arg_277_0.ladyDict[arg_277_0.apartment:GetConfigID()]

					arg_277_0:SetIKTimelineStatus(var_295_1, var_281_2.gameObject, var_295_0, var_281_3)
				end,
				TimelineEnd = function()
					arg_284_2.finish = true

					arg_284_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_284_1.stringParameter)
			end)

			if arg_284_2.finish then
				arg_277_0.timelineMark = arg_284_2
				arg_277_0.timelineFinishCall = nil

				local var_284_0 = arg_277_0.ladyDict[arg_277_0.apartment:GetConfigID()]

				if var_284_0.ikTimelineMode then
					arg_277_0:ExitIKTimelineStatus(var_284_0)
				end

				arg_281_0()
			end
		end)

		function arg_277_0.timelineFinishCall()
			arg_277_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_277_0:HideCharacter()
		setActive(arg_277_0.mainCameraTF, false)
		setActive(var_281_3, true)
		eachChild(arg_277_0.rtTimelineScreen, function(arg_299_0)
			setActive(arg_299_0, false)
		end)
		setActive(arg_277_0.rtTimelineScreen, true)
		setActive(arg_277_0.rtTimelineScreen:Find("btn_skip"), arg_277_0.inReplayTalk)
		arg_277_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_277_0, function(arg_300_0)
		arg_277_0:ShowBlackScreen(true, function()
			arg_277_0.nowTimelinePlayer:Stop()
			arg_277_0.nowTimelinePlayer:Dispose()

			arg_277_0.nowTimelinePlayer = nil

			arg_277_0:UnloadTimelineScene(arg_277_1.name, false, arg_300_0)
		end)
	end)

	local var_277_1 = arg_277_0.dormSceneMgr.artSceneInfo

	table.insert(var_277_0, function(arg_302_0)
		arg_277_0:ChangeArtScene(var_277_1, arg_302_0)
	end)
	seriesAsync(var_277_0, function()
		setActive(arg_277_0.rtTimelineScreen, false)
		arg_277_0:RevertCharacter()
		setActive(arg_277_0.mainCameraTF, true)

		local var_303_0 = arg_277_0.timelineMark

		arg_277_0.timelineMark = nil

		existCall(arg_277_2, var_303_0, function(arg_304_0)
			arg_277_0:ShowBlackScreen(false, arg_304_0)
		end)
	end)
end

function var_0_0.PlayCurrentSingleAction(arg_305_0, ...)
	local var_305_0 = arg_305_0.ladyDict[arg_305_0.apartment:GetConfigID()]

	return arg_305_0:PlaySingleAction(var_305_0, ...)
end

function var_0_0.PlaySingleAction(arg_306_0, arg_306_1, arg_306_2, arg_306_3)
	arg_306_1:PlaySingleAction(arg_306_2, arg_306_3)
end

function var_0_0.SwitchCurrentAnim(arg_307_0, ...)
	local var_307_0 = arg_307_0.ladyDict[arg_307_0.apartment:GetConfigID()]

	return arg_307_0:SwitchAnim(var_307_0, ...)
end

function var_0_0.SwitchAnim(arg_308_0, arg_308_1, arg_308_2, arg_308_3)
	arg_308_1:SwitchAnim(arg_308_2, arg_308_3)
end

function var_0_0.PlayFaceAnim(arg_309_0, arg_309_1, arg_309_2, arg_309_3)
	arg_309_1:PlayFaceAnim(arg_309_2, arg_309_3)
end

function var_0_0.GetCurrentAnim(arg_310_0)
	return arg_310_0.ladyDict[arg_310_0.apartment:GetConfigID()]:GetCurrentAnim()
end

function var_0_0.RegisterAnimCallback(arg_311_0, arg_311_1, arg_311_2)
	arg_311_0.ladyDict[arg_311_0.apartment:GetConfigID()].animCallbacks[arg_311_1] = arg_311_2
end

function var_0_0.SetCharacterAnimSpeed(arg_312_0, arg_312_1)
	local var_312_0 = arg_312_0.ladyDict[arg_312_0.apartment:GetConfigID()]

	var_312_0.ladyAnimator.speed = arg_312_1
	var_312_0.ladyHeadIKComp.blinkSpeed = var_312_0.ladyHeadIKData.blinkSpeed * arg_312_1

	if arg_312_1 > 0 then
		var_312_0.ladyHeadIKComp.DampTime = var_312_0.ladyHeadIKData.DampTime / arg_312_1
	else
		var_312_0.ladyHeadIKComp.DampTime = var_312_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_313_0, arg_313_1)
	if arg_313_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_313_0 = arg_313_1.stringParameter
	local var_313_1 = table.removebykey(arg_313_0.animEventCallbacks, var_313_0)

	existCall(var_313_1)
end

function var_0_0.RegisterAnimEventCallback(arg_314_0, arg_314_1, arg_314_2)
	arg_314_0.animEventCallbacks[arg_314_1] = arg_314_2
end

function var_0_0.PlaySceneItemAnim(arg_315_0, arg_315_1, arg_315_2)
	arg_315_0.sceneAnimatorDict = arg_315_0.sceneAnimatorDict or {}

	if not arg_315_0.sceneAnimatorDict[arg_315_1] then
		local var_315_0 = pg.dorm3d_scene_animator[arg_315_1]
		local var_315_1 = arg_315_0:GetSceneItem(var_315_0.item_name)

		assert(var_315_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_315_1 .. " " .. var_315_0.item_name)

		if not var_315_1 then
			return
		end

		local var_315_2 = var_315_1:GetComponent(typeof(Animator))

		if not var_315_2 then
			return
		end

		arg_315_0.sceneAnimatorDict[arg_315_1] = {
			trans = var_315_1,
			animator = var_315_2
		}
	end

	if arg_315_0.sceneAnimatorDict[arg_315_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_315_2) then
		return
	end

	arg_315_0.sceneAnimatorDict[arg_315_1].animator:PlayInFixedTime(arg_315_2)
end

function var_0_0.ResetSceneItemAnimators(arg_316_0, arg_316_1)
	if not arg_316_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_316_0.sceneAnimatorDict, function(arg_317_0, arg_317_1)
		if arg_316_1 and table.contains(arg_316_1, arg_317_0) then
			return
		end

		setActive(arg_317_1.trans, false)
		setActive(arg_317_1.trans, true)

		arg_316_0.sceneAnimatorDict[arg_317_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_318_0, arg_318_1, arg_318_2, arg_318_3, arg_318_4, arg_318_5, arg_318_6)
	arg_318_1.extraItems = arg_318_1.extraItems or {}

	if arg_318_1.extraItems[arg_318_2] then
		return
	end

	local var_318_0

	if arg_318_3 == "" then
		var_318_0 = arg_318_1.lady
	elseif arg_318_3 == "scene_root" then
		var_318_0 = arg_318_0.modelRoot
	else
		table.IpairsCArray(arg_318_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_319_0, arg_319_1)
			if arg_319_1.name == arg_318_3 then
				var_318_0 = arg_319_1
			end
		end)
	end

	if not var_318_0 then
		return
	end

	arg_318_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_318_2), "", function(arg_320_0)
		setParent(arg_320_0, var_318_0)

		if arg_318_4 then
			setLocalPosition(arg_320_0, arg_318_4)
		end

		if arg_318_5 then
			setLocalRotation(arg_320_0, arg_318_5)
		end

		if arg_318_6 then
			local var_320_0 = arg_320_0:GetComponent(typeof(Animator))

			if var_320_0 then
				var_320_0:Play(arg_318_6)
			end
		end

		arg_318_1.extraItems[arg_318_2] = {
			trans = arg_320_0.transform,
			handler = var_318_0
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_321_0, arg_321_1, arg_321_2)
	if not arg_321_1.extraItems then
		return
	end

	table.Foreach(arg_321_1.extraItems, function(arg_322_0, arg_322_1)
		if arg_321_2 and table.contains(arg_321_2, arg_322_0) then
			return
		end

		arg_321_0.loader:ReturnPrefab(arg_322_1.trans.gameObject)

		arg_321_1.extraItems[arg_322_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_323_0, arg_323_1, arg_323_2)
	arg_323_0.cameraBlendCallbacks[arg_323_1] = arg_323_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_324_0, arg_324_1)
	arg_324_0.cameraBlendCallbacks[arg_324_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_325_0, arg_325_1)
	if not arg_325_1 then
		return
	end

	local var_325_0 = table.removebykey(arg_325_0.cameraBlendCallbacks, arg_325_1)

	existCall(var_325_0)
end

function var_0_0.PlayHeartFX(arg_326_0, arg_326_1)
	local var_326_0 = arg_326_0.ladyDict[arg_326_1]

	setActive(var_326_0.effectHeart, false)
	setActive(var_326_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_327_0, arg_327_1)
	local var_327_0 = arg_327_1.name
	local var_327_1 = arg_327_0.expressionDict[var_327_0]
	local var_327_2 = 5

	if var_327_1 then
		local var_327_3 = var_327_1.timer

		var_327_3:Reset(nil, var_327_2)
		var_327_3:Start()

		if var_327_1.instance then
			setActive(var_327_1.instance, false)
			setActive(var_327_1.instance, true)
		end

		return
	end

	local var_327_4 = {
		name = var_327_0,
		timer = Timer.New(function()
			arg_327_0:RemoveExpression(var_327_0)
		end, var_327_2, 1, true)
	}

	arg_327_0.expressionDict[var_327_0] = var_327_4

	arg_327_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_327_0, var_327_0, function(arg_329_0)
		var_327_4.instance = arg_329_0

		onNextTick(function()
			local var_330_0 = arg_327_0.ladyDict[arg_327_0.apartment:GetConfigID()]

			setParent(arg_329_0, var_330_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_329_0, Vector3(0, 0, -0.2))
		setActive(arg_329_0, false)
		setActive(arg_329_0, true)
	end, var_327_4)
end

function var_0_0.RemoveExpression(arg_331_0, arg_331_1)
	local var_331_0 = arg_331_0.expressionDict[arg_331_1]

	if not var_331_0 then
		return
	end

	arg_331_0.loader:ClearRequest(var_331_0)

	if var_331_0.instance then
		arg_331_0.loader:ReturnPrefab(var_331_0.instance)
	end

	arg_331_0.expressionDict[arg_331_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_332_0, arg_332_1, arg_332_2)
	setActive(arg_332_1.ladyWatchFloat, arg_332_2)
end

function var_0_0.RegisterGlobalVolume(arg_333_0)
	local var_333_0 = arg_333_0.globalVolume
	local var_333_1 = LuaHelper.GetOrAddVolumeComponent(var_333_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_333_2 = LuaHelper.GetOrAddVolumeComponent(var_333_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	arg_333_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_333_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_333_1.gaussianStart.min,
				value = var_333_1.gaussianStart.value
			},
			blurRadius = {
				min = var_333_1.blurRadius.min,
				max = var_333_1.blurRadius.max,
				value = var_333_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_333_2.postExposure.value
		},
		contrast = {
			min = var_333_2.contrast.min,
			max = var_333_2.contrast.max,
			value = var_333_2.contrast.value
		},
		saturate = {
			min = var_333_2.saturation.min,
			max = var_333_2.saturation.max,
			value = var_333_2.saturation.value
		}
	}
	arg_333_0.originalCameraSettings.depthOfField.enabled = true

	local var_333_3 = var_333_0:GetComponent(typeof(UnityEngine.Rendering.Volume))

	arg_333_0.originalVolume = {
		profile = var_333_3.sharedProfile,
		weight = var_333_3.weight
	}
end

function var_0_0.SettingCamera(arg_334_0, arg_334_1)
	arg_334_0.activeCameraSettings = arg_334_1

	local var_334_0 = arg_334_0.globalVolume
	local var_334_1 = LuaHelper.GetOrAddVolumeComponent(var_334_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_334_2 = LuaHelper.GetOrAddVolumeComponent(var_334_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	var_334_1.enabled:Override(arg_334_1.depthOfField.enabled)
	var_334_1.gaussianStart:Override(arg_334_1.depthOfField.focusDistance.value)
	var_334_1.gaussianEnd:Override(arg_334_1.depthOfField.focusDistance.value + arg_334_1.depthOfField.focusDistance.length)
	var_334_1.blurRadius:Override(arg_334_1.depthOfField.blurRadius.value)
	var_334_2.postExposure:Override(arg_334_1.postExposure.value)
	var_334_2.contrast:Override(arg_334_1.contrast.value)
	var_334_2.saturation:Override(arg_334_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_335_0)
	return arg_335_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_336_0)
	arg_336_0:SettingCamera(arg_336_0.originalCameraSettings)

	arg_336_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_337_0, arg_337_1, arg_337_2)
	local var_337_0 = arg_337_0.globalVolume:GetComponent(typeof(UnityEngine.Rendering.Volume))

	arg_337_0.activeProfileWeight = arg_337_2

	if arg_337_0.activeProfileName ~= arg_337_1 then
		arg_337_0.activeProfileName = arg_337_1

		arg_337_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_337_1, nil, function(arg_338_0)
			var_337_0.profile = arg_338_0
			var_337_0.weight = arg_337_0.activeProfileWeight

			if arg_337_0.activeCameraSettings then
				arg_337_0:SettingCamera(arg_337_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_337_0.weight = arg_337_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_339_0)
	local var_339_0 = arg_339_0.globalVolume:GetComponent(typeof(UnityEngine.Rendering.Volume))

	var_339_0.profile = arg_339_0.originalVolume.profile
	var_339_0.weight = arg_339_0.originalVolume.weight

	if arg_339_0.activeCameraSettings then
		arg_339_0:SettingCamera(arg_339_0.activeCameraSettings)
	end

	arg_339_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_340_0)
	local var_340_0 = arg_340_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	arg_340_0.originalCharacterColor = {
		color = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_340_0),
		intensity = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_340_0)
	}
end

function var_0_0.SetCharacterLight(arg_341_0, arg_341_1, arg_341_2, arg_341_3)
	local var_341_0 = arg_341_0.characterLight:GetComponent(typeof(Light))
	local var_341_1 = Color.Lerp(arg_341_0.originalCharacterColor.color, arg_341_1, arg_341_3)
	local var_341_2 = math.lerp(arg_341_0.originalCharacterColor.intensity, arg_341_2, arg_341_3)
	local var_341_3 = arg_341_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_341_3, var_341_1)
	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_341_3, var_341_2)
end

function var_0_0.RevertCharacterLight(arg_342_0)
	arg_342_0:SetCharacterLight(arg_342_0.originalCharacterColor.color, arg_342_0.originalCharacterColor.intensity, 1)
end

function var_0_0.onBackPressed(arg_343_0)
	if arg_343_0.exited or arg_343_0.retainCount > 0 then
		-- block empty
	else
		arg_343_0:closeView()
	end
end

function var_0_0.LoadTimelineScene(arg_344_0, arg_344_1, arg_344_2, arg_344_3, arg_344_4)
	arg_344_0.dormSceneMgr:LoadTimelineScene({
		name = arg_344_1,
		assetRootName = arg_344_0.apartment:getConfig("asset_name"),
		isCache = arg_344_2,
		waitForTimeline = arg_344_3,
		callName = arg_344_0.apartment:GetCallName(),
		loadSceneFunc = function(arg_345_0, arg_345_1)
			local var_345_0 = GameObject.Find("[actor]").transform

			arg_344_0:HXCharacter(tf(var_345_0))
		end
	}, arg_344_4)
end

function var_0_0.UnloadTimelineScene(arg_346_0, arg_346_1, arg_346_2, arg_346_3)
	arg_346_0.dormSceneMgr:UnloadTimelineScene(arg_346_1, arg_346_2, arg_346_3)
end

function var_0_0.ChangeArtScene(arg_347_0, arg_347_1, arg_347_2)
	warning(arg_347_0.dormSceneMgr.artSceneInfo, "->", arg_347_1, arg_347_1 == arg_347_0.dormSceneMgr.sceneInfo)

	local var_347_0 = {}

	table.insert(var_347_0, function(arg_348_0)
		arg_347_0.dormSceneMgr:ChangeArtScene(arg_347_1, arg_348_0)
	end)

	if arg_347_1 == arg_347_0.dormSceneMgr.sceneInfo or arg_347_0.dormSceneMgr.artSceneInfo == arg_347_0.dormSceneMgr.sceneInfo then
		table.insert(var_347_0, function(arg_349_0)
			setActive(arg_347_0.slotRoot, arg_347_1 == arg_347_0.dormSceneMgr.sceneInfo)
			arg_349_0()
		end)
	end

	if arg_347_1 == arg_347_0.dormSceneMgr.sceneInfo then
		table.insert(var_347_0, function(arg_350_0)
			arg_347_0:SwitchDayNight(arg_347_0.contextData.timeIndex)
			onNextTick(function()
				arg_347_0:RefreshSlots()
				arg_350_0()
			end)
		end)
	end

	seriesAsync(var_347_0, arg_347_2)
end

function var_0_0.ChangeSubScene(arg_352_0, arg_352_1, arg_352_2)
	warning(arg_352_0.dormSceneMgr.subSceneInfo, "->", arg_352_1, arg_352_1 == arg_352_0.dormSceneMgr.subSceneInfo)

	local var_352_0 = {}

	table.insert(var_352_0, function(arg_353_0)
		arg_352_0.dormSceneMgr:ChangeSubScene(arg_352_1, arg_353_0)
	end)

	local var_352_1 = arg_352_0.ladyDict[arg_352_0.apartment:GetConfigID()]

	table.insert(var_352_0, function(arg_354_0)
		if arg_352_1 == arg_352_0.dormSceneMgr.sceneInfo then
			var_352_1.ladyActiveZone = var_352_1.walkBornPoint or var_352_1.ladyBaseZone
		else
			var_352_1.ladyActiveZone = var_352_1.walkBornPoint or "Default"
		end

		arg_354_0()
	end)

	if arg_352_1 ~= arg_352_0.dormSceneMgr.subSceneInfo then
		table.insert(var_352_0, function(arg_355_0)
			local var_355_0, var_355_1 = Dorm3dSceneMgr.ParseInfo(arg_352_1)
			local var_355_2 = var_355_0 .. "_base"

			arg_352_0:ResetSceneStructure(SceneManager.GetSceneByName(var_355_2))

			if arg_352_1 == arg_352_0.dormSceneMgr.sceneInfo then
				arg_352_0:RefreshSlots()
			else
				arg_352_0:SwitchAnim(var_352_1, var_0_0.ANIM.IDLE)
			end

			if arg_352_0.dormSceneMgr.subSceneInfo == arg_352_0.dormSceneMgr.sceneInfo then
				local var_355_3 = Clone(arg_352_0.room)

				var_355_3.furnitures = {}

				arg_352_0:RefreshSlots(var_355_3)
			end

			arg_355_0()
		end)
	end

	table.insert(var_352_0, function(arg_356_0)
		onNextTick(function()
			arg_352_0:ChangeCharacterPosition(var_352_1)
			arg_352_0:ChangePlayerPosition(var_352_1.ladyActiveZone)
			arg_352_0:TriggerLadyDistance()
			arg_352_0:CheckInSector()
			arg_356_0()
		end)
	end)
	seriesAsync(var_352_0, arg_352_2)
end

function var_0_0.IsPointInSector(arg_358_0, arg_358_1)
	local var_358_0 = arg_358_1 - Vector3.New(unpack(arg_358_0.Position))

	if var_358_0.y > arg_358_0.Radius then
		return false
	end

	var_358_0.y = 0

	if var_358_0.magnitude > arg_358_0.Radius then
		return false
	end

	local var_358_1 = Quaternion.Euler(unpack(arg_358_0.Rotation))

	return Vector3.Angle(var_358_1 * Vector3.forward, var_358_0) <= arg_358_0.Angle / 2
end

function var_0_0.willExit(arg_359_0)
	arg_359_0.joystickTimer:Stop()
	arg_359_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_359_0.updateHandler)
	arg_359_0:StopIKHandTimer()

	if arg_359_0.moveTimer then
		arg_359_0.moveTimer:Stop()

		arg_359_0.moveTimer = nil
	end

	if arg_359_0.moveWaitTimer then
		arg_359_0.moveWaitTimer:Stop()

		arg_359_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_359_0.furnitures) then
		eachChild(arg_359_0.furnitures, function(arg_360_0)
			local var_360_0 = GetComponent(arg_360_0, typeof(EventTriggerListener))

			if not var_360_0 then
				return
			end

			var_360_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_359_0, iter_359_1 in pairs(arg_359_0.ladyDict) do
		GetComponent(iter_359_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_359_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_359_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_359_0.blockLayer, arg_359_0._tf)
	table.Foreach(arg_359_0.expressionDict, function(arg_361_0)
		arg_359_0:RemoveExpression(arg_361_0)
	end)
	arg_359_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()
	arg_359_0.dormSceneMgr:Dispose()

	arg_359_0.dormSceneMgr = nil

	ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)

	if arg_359_0.transformFilter then
		arg_359_0.transformFilter:Dispose()
	end
end

return var_0_0
