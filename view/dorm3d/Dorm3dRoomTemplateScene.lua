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
var_0_0.SHIFT_ZONE_SAFE = "Dorm3dRoomTemplateScene.SHIFT_ZONE_SAFE"
var_0_0.POV_CLOSE_DISTANCE = 1.5
var_0_0.POV_PENDING_CLOSE_DISTANCE = 2
var_0_0.IK_STATUS_DELTA = 0.5
var_0_0.IK_TIP_WAIT_TIME = 5
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

function var_0_0.Ctor(arg_7_0, ...)
	var_0_0.super.Ctor(arg_7_0, ...)

	arg_7_0.loader = AutoLoader.New()
	arg_7_0.scene = arg_7_0
end

function var_0_0.SetRoom(arg_8_0, arg_8_1)
	arg_8_0.room = arg_8_1
end

function var_0_0.preload(arg_9_0, arg_9_1)
	tolua.loadassembly("MagicaClothV2")
	tolua.loadassembly("ParadoxNotion")
	tolua.loadassembly("Yongshi.BLRP.Runtime")

	for iter_9_0, iter_9_1 in pairs({
		_MonoManager = "ParadoxNotion.Services.MonoManager"
	}) do
		if not GameObject.Find(iter_9_0) then
			local var_9_0 = GameObject.New(iter_9_0)

			GetOrAddComponent(var_9_0, typeof(iter_9_1))
		end
	end

	arg_9_0.room = getProxy(ApartmentProxy):getRoom(arg_9_0.contextData.roomId)

	local var_9_1 = {}

	table.insert(var_9_1, function(arg_10_0)
		arg_9_0.dormSceneMgr = Dorm3dSceneMgr.New(arg_9_0.room:getConfig("scene_info"), arg_10_0)
	end)
	table.insert(var_9_1, function(arg_11_0)
		arg_9_0:LoadCharacter(arg_9_0.contextData.groupIds, arg_11_0)
	end)
	seriesAsync(var_9_1, arg_9_1)
end

function var_0_0.init(arg_12_0)
	arg_12_0:BindEvent()
	arg_12_0:InitData()
	arg_12_0:initScene()
	arg_12_0:initNodeCanvas()

	if arg_12_0.room:isPersonalRoom() then
		local var_12_0 = arg_12_0.contextData.groupIds[1]
		local var_12_1 = getProxy(ApartmentProxy):getApartment(var_12_0)
		local var_12_2 = var_12_1:GetCurSkinId()
		local var_12_3 = arg_12_0.ladyDict[var_12_0]

		setActive(var_12_3.ladyGameObject, false)

		var_12_3.skinId = var_12_2
		var_12_3.ladyGameObject = arg_12_0.skinDict[var_12_2].ladyGameObject

		setActive(var_12_3.ladyGameObject, true)
		var_12_3:HideCharacterPart(var_12_2, var_12_1:GetHiddenParts(var_12_2))
	end

	for iter_12_0, iter_12_1 in pairs(arg_12_0.ladyDict) do
		arg_12_0:InitCharacter(iter_12_1, iter_12_0)
	end

	if not arg_12_0.room:isPersonalRoom() then
		local var_12_4 = underscore.detect(arg_12_0.contextData.groupIds, function(arg_13_0)
			return arg_12_0.contextData.ladyZone[arg_13_0] == arg_12_0.contextData.inFurnitureName
		end) or arg_12_0.contextData.groupIds[1]

		if var_12_4 then
			arg_12_0:SyncInterestTransform(arg_12_0.ladyDict[var_12_4])
		end

		if SlideExtraSystem.IsOpen(arg_12_0.room) and arg_12_0.contextData.inFurnitureName == SlideConst.SLIDE_ZONE then
			arg_12_0:SyncInterestTransformByTf(arg_12_0:GetFurnitureByName(arg_12_0.contextData.inFurnitureName):Find("StayPoint"))
		end
	end

	arg_12_0.retainCount = 0
	arg_12_0.sceneBlockLayer = arg_12_0._tf:Find("SceneBlock")

	setActive(arg_12_0.sceneBlockLayer, false)

	arg_12_0.blockLayer = arg_12_0._tf:Find("Block")

	setActive(arg_12_0.blockLayer, false)

	arg_12_0.blackLayer = arg_12_0._tf:Find("BlackScreen")

	setActive(arg_12_0.blackLayer, false)

	arg_12_0.holyLightRoot = arg_12_0._tf:Find("HolyLightRoot")

	arg_12_0:InitHolyLight()
	arg_12_0:ChangePlayerPosition()

	arg_12_0.cacheSceneDic = {}
	arg_12_0.sceneGroupDic = {}
	arg_12_0.lastSceneRootDict = {}

	pg.ClickEffectMgr.GetInstance():SetClickEffect("DORM3D")
end

function var_0_0.BindEvent(arg_14_0)
	arg_14_0:bind(var_0_0.PLAY_EXPRESSION, function(arg_15_0, arg_15_1)
		arg_14_0:PlayExpression(arg_15_1)
	end)
	arg_14_0:bind(var_0_0.SHOW_BLOCK, function()
		arg_14_0.retainCount = arg_14_0.retainCount + 1

		setActive(arg_14_0.blockLayer, true)
	end)
	arg_14_0:bind(var_0_0.HIDE_BLOCK, function()
		arg_14_0.retainCount = math.max(arg_14_0.retainCount - 1, 0)

		if arg_14_0.retainCount > 0 then
			return
		end

		setActive(arg_14_0.blockLayer, false)
	end)
	arg_14_0:bind(var_0_0.ENABLE_SCENEBLOCK, function(arg_18_0, arg_18_1)
		setActive(arg_14_0.sceneBlockLayer, arg_18_1)
	end)
	arg_14_0:bind(var_0_0.ON_STICK_MOVE, function(arg_19_0, arg_19_1)
		arg_14_0:OnStickMove(arg_19_1)
	end)
	arg_14_0:bind(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, function(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		if arg_14_0.blockIK then
			return
		end

		if arg_20_1.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():OnDragBegin(arg_20_2, arg_20_3)
	end)
	arg_14_0:bind(var_0_0.ON_DRAG_CHARACTER_BODY, function(arg_21_0, arg_21_1, arg_21_2)
		if not arg_21_1.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():HandleBodyDrag(arg_21_2)
	end)
	arg_14_0:bind(var_0_0.ON_RELEASE_CHARACTER_BODY, function(arg_22_0, arg_22_1)
		pg.IKMgr.GetInstance():ReleaseDrag()
	end)
	arg_14_0:bind(var_0_0.ON_POV_STICK_MOVE_BEGIN, function(arg_23_0, arg_23_1)
		if arg_14_0.pinchMode then
			return
		end

		arg_14_0.moveStickOrigin = arg_23_1.position
		arg_14_0.moveStickPosition = arg_14_0.moveStickOrigin
		arg_14_0.moveStickDraging = true
	end)

	local function var_14_0()
		arg_14_0.moveStickOrigin = nil
		arg_14_0.moveStickPosition = nil
		arg_14_0.moveStickDraging = nil

		if isActive(arg_14_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_14_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, Vector2.zero)
		end
	end

	arg_14_0:bind(var_0_0.ON_POV_STICK_MOVE_END, function(arg_25_0, arg_25_1)
		var_14_0()
	end)
	arg_14_0:bind(var_0_0.ON_POV_STICK_MOVE, function(arg_26_0, arg_26_1)
		if arg_14_0.pinchMode then
			var_14_0()

			return
		end

		if not arg_14_0.moveStickDraging then
			return
		end

		arg_14_0.moveStickPosition = arg_14_0.moveStickPosition + arg_26_1

		if isActive(arg_14_0.povLayer:Find("Guide")) then
			setActive(arg_14_0.povLayer:Find("Guide"), false)
		end
	end)

	local var_14_1 = 32.4 / Screen.height

	arg_14_0:bind(var_0_0.ON_POV_STICK_VIEW, function(arg_27_0, arg_27_1)
		if arg_14_0.pinchMode then
			return
		end

		arg_27_1 = arg_27_1 * var_14_1

		local var_27_0 = arg_27_1.x
		local var_27_1 = arg_27_1.y

		local function var_27_2(arg_28_0, arg_28_1, arg_28_2)
			local var_28_0 = arg_28_0[arg_28_1]

			var_28_0.m_InputAxisValue = arg_28_2
			arg_28_0[arg_28_1] = var_28_0
		end

		if isActive(arg_14_0.cameras[var_0_0.CAMERA.POV]) then
			var_27_2(arg_14_0.compPovAim, "m_HorizontalAxis", var_27_0)
			var_27_2(arg_14_0.compPovAim, "m_VerticalAxis", var_27_1)
		elseif isActive(arg_14_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			local var_27_3 = arg_14_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

			var_27_2(var_27_3, "m_HorizontalAxis", var_27_0)
			var_27_2(var_27_3, "m_VerticalAxis", var_27_1)
		end
	end)

	local var_14_2 = {
		HideSceneItem = true,
		SetExtraAnimSpeed = true,
		EnableHeadIK = true,
		PlayEnterExtraItem = true,
		ResetCharacterExtraItem = true,
		ResetTempHideSceneItems = true,
		HideCharacterBylayer = true,
		RevertCharacterBylayer = true
	}

	arg_14_0:bind(var_0_0.PHOTO_CALL, function(arg_29_0, arg_29_1, ...)
		if var_14_2[arg_29_1] then
			local var_29_0 = arg_14_0:GetCurrentLadyEnv()

			arg_14_0[arg_29_1](arg_14_0, var_29_0, ...)
		else
			arg_14_0[arg_29_1](arg_14_0, ...)
		end
	end)
	arg_14_0:bind(var_0_0.SHIFT_ZONE_SAFE, function(arg_30_0, arg_30_1)
		arg_14_0:ShiftZoneSafe(arg_30_1)
	end)
end

function var_0_0.RegisterIKFunc(arg_31_0)
	pg.IKMgr.GetInstance():RegisterOnIKLayerActive(function(arg_32_0)
		arg_31_0.blockIK = true

		local var_32_0 = arg_31_0:GetCurrentLadyEnv()

		var_32_0.ikHandler = arg_32_0

		local var_32_1 = _.detect(var_32_0.readyIKLayers, function(arg_33_0)
			return arg_33_0:GetControllerPath() == arg_32_0.ikData:GetControllerPath()
		end)

		arg_31_0:EnableIKLayer(var_32_1)

		arg_31_0.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_32_1:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDrag(function(arg_34_0)
		arg_31_0:GetCurrentLadyEnv().ikHandler = arg_34_0

		arg_31_0:ResetIKTipTimer()
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDeactive(function(arg_35_0, arg_35_1)
		local var_35_0 = arg_31_0:GetCurrentLadyEnv()
		local var_35_1 = _.detect(var_35_0.readyIKLayers, function(arg_36_0)
			return arg_36_0:GetControllerPath() == arg_35_0.ikData:GetControllerPath()
		end)

		arg_31_0:DeactiveIKLayer(var_35_1)

		var_35_0.ikHandler = nil
		arg_31_0.blockIK = arg_35_1

		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_35_1:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerAction(function(arg_37_0)
		local var_37_0 = arg_31_0:GetCurrentLadyEnv()

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

	arg_39_0.isMultiFloor = arg_39_0.restrictedBox.childCount > 2

	local var_39_6 = "Floor"
	local var_39_7 = "Celling"

	if arg_39_0.isMultiFloor then
		arg_39_0.restrictedHeightRange = {}

		for iter_39_0 = 0, math.floor(arg_39_0.restrictedBox.childCount / 2) - 1 do
			local var_39_8 = iter_39_0 == 0 and var_39_6 or var_39_6 .. "_" .. iter_39_0
			local var_39_9 = iter_39_0 == 0 and var_39_7 or var_39_7 .. "_" .. iter_39_0

			table.insert(arg_39_0.restrictedHeightRange, {
				arg_39_0.restrictedBox:Find(var_39_8).position.y + var_39_5,
				arg_39_0.restrictedBox:Find(var_39_9).position.y - var_39_5
			})
		end
	else
		arg_39_0.restrictedHeightRange = {
			arg_39_0.restrictedBox:Find(var_39_6).position.y + var_39_5,
			arg_39_0.restrictedBox:Find(var_39_7).position.y - var_39_5
		}
	end

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
end

function var_0_0.InitSlots(arg_48_0)
	local var_48_0 = arg_48_0.room:GetSlots()
	local var_48_1 = arg_48_0.modelRoot:GetComponentsInChildren(typeof(Transform), true):ToTable()

	arg_48_0.slotDict = {}

	_.each(var_48_0, function(arg_49_0)
		local var_49_0 = arg_49_0:GetFurnitureName()
		local var_49_1 = arg_49_0:GetConfigID()
		local var_49_2 = arg_48_0.slotRoot:Find(tostring(var_49_1))

		if not var_49_2 then
			errorMsg("Not Find Slot: " .. var_49_1)

			return
		end

		local var_49_3 = {
			trans = var_49_2,
			sceneHides = {}
		}
		local var_49_4 = var_49_2:Find("Selector")

		if var_49_4 then
			GetOrAddComponent(var_49_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_50_0, arg_50_1)
				arg_48_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_49_1)
			end)
			setActive(var_49_4, false)
		end

		local var_49_5

		for iter_49_0, iter_49_1 in ipairs(var_48_1) do
			if iter_49_1.name == var_49_0 then
				var_49_5 = iter_49_1

				break
			end
		end

		if var_49_5 then
			var_49_3.model = var_49_5
		end

		arg_48_0.slotDict[var_49_1] = var_49_3
	end)
end

function var_0_0.SetContactStateDic(arg_51_0, arg_51_1)
	arg_51_0.contactStateDic = arg_51_1
	arg_51_0.hideContactStateDic = {}
	arg_51_0.contactInRangeDic = {}
	arg_51_0.transRangeDic = {
		list = {}
	}
	arg_51_0.transformFilter = arg_51_0.transformFilter or BLHX.Rendering.TransformFilter.New()

	for iter_51_0, iter_51_1 in pairs(arg_51_0.contactStateDic) do
		arg_51_0.hideContactStateDic[iter_51_0] = math.min(iter_51_1, ApartmentRoom.ITEM_UNLOCK)
		arg_51_0.contactInRangeDic[iter_51_0] = false

		local var_51_0 = pg.dorm3d_collection_template[iter_51_0].vfx_prefab

		arg_51_0.transRangeDic[iter_51_0] = {
			#arg_51_0.transRangeDic.list + 1,
			#var_51_0
		}

		table.insertto(arg_51_0.transRangeDic.list, underscore.map(var_51_0, function(arg_52_0)
			return arg_51_0.modelRoot:Find(arg_52_0)
		end))
	end

	arg_51_0.transformFilter:Init(arg_51_0.mainCameraTF, arg_51_0.transRangeDic.list, 2, 60)
	arg_51_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_53_0, arg_53_1)
	arg_53_0.hideConcatFlag = arg_53_1

	arg_53_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_54_0)
	for iter_54_0, iter_54_1 in pairs(arg_54_0.contactInRangeDic) do
		arg_54_0:UpdateContactDisplay(iter_54_0, arg_54_0.contactInRangeDic[iter_54_0] and not arg_54_0.hideConcatFlag and arg_54_0.contactStateDic[iter_54_0] or arg_54_0.hideContactStateDic[iter_54_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = pg.dorm3d_collection_template[arg_55_1]

	for iter_55_0, iter_55_1 in ipairs(var_55_0.vfx_prefab) do
		local var_55_1 = arg_55_0.modelRoot:Find(iter_55_1)

		if arg_55_0:IsModeInHidePending(iter_55_1) then
			-- block empty
		elseif not arg_55_0.modelRoot:Find(iter_55_1) then
			warning(arg_55_1, iter_55_1)
		else
			setActive(var_55_1, arg_55_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_55_2, iter_55_3 in ipairs(var_55_0.model) do
		if arg_55_0:IsModeInHidePending(iter_55_3) then
			-- block empty
		elseif not arg_55_0.modelRoot:Find(iter_55_3) then
			warning(arg_55_1, iter_55_3)
		else
			local var_55_2 = arg_55_0.modelRoot:Find(iter_55_3)

			if arg_55_0:CheckSceneItemActive(var_55_2) then
				local var_55_3 = GetComponent(var_55_2, typeof(EventTriggerListener))

				if arg_55_2 == ApartmentRoom.ITEM_FIRST then
					var_55_3 = var_55_3 or GetOrAddComponent(var_55_2, typeof(EventTriggerListener))

					var_55_3:AddPointClickFunc(function(arg_56_0, arg_56_1)
						arg_55_0:emit(var_0_0.CLICK_CONTACT, arg_55_1)
					end)

					var_55_3.enabled = true
				elseif var_55_3 then
					var_55_3.enabled = false
				end

				setActive(var_55_2, arg_55_2 > ApartmentRoom.ITEM_LOCK)
			end
		end
	end
end

function var_0_0.SetFloatEnable(arg_57_0, arg_57_1)
	arg_57_0.enableFloatUpdate = arg_57_1

	if arg_57_1 then
		arg_57_0:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_58_0)
	local var_58_0 = arg_58_0:GetCurrentLadyEnv()
	local var_58_1 = arg_58_0:GetScreenPosition(var_58_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_58_2 = arg_58_0:GetLocalPosition(var_58_1, arg_58_0.rtFloatPage)

	setLocalPosition(arg_58_0.rtFloatPage:Find("lady"), var_58_2)
end

function var_0_0.LoadCharacter(arg_59_0, arg_59_1, arg_59_2)
	arg_59_0.hxMatDict = {}
	arg_59_0.ladyDict = {}
	arg_59_0.skinDict = {}

	local var_59_0 = {}

	for iter_59_0, iter_59_1 in ipairs(arg_59_1) do
		table.insert(var_59_0, function(arg_60_0)
			arg_59_0:LoadSingleCharacter(iter_59_1, arg_60_0)
		end)
	end

	parallelAsync(var_59_0, arg_59_2)
end

function var_0_0.LoadCharacterAdditionally(arg_61_0, arg_61_1, arg_61_2)
	local var_61_0 = {}

	for iter_61_0, iter_61_1 in ipairs(arg_61_1) do
		table.insert(var_61_0, function(arg_62_0)
			arg_61_0:LoadSingleCharacter(iter_61_1, function()
				arg_61_0:InitCharacter(arg_61_0.ladyDict[iter_61_1], iter_61_1)
				arg_62_0()
			end)
		end)
	end

	parallelAsync(var_61_0, arg_61_2)
end

function var_0_0.LoadSingleCharacter(arg_64_0, arg_64_1, arg_64_2)
	local var_64_0 = {}
	local var_64_1 = LadyEnv.New(arg_64_0)

	arg_64_0.ladyDict[arg_64_1] = var_64_1

	local var_64_2 = getProxy(ApartmentProxy):getApartment(arg_64_1)
	local var_64_3 = var_64_2:getConfig("asset_name")
	local var_64_4 = var_64_2:GetSkinModelID(arg_64_0.room:getConfig("tag"))
	local var_64_5 = Dorm3dSkin.New({
		configId = var_64_4
	}):GetModelName()

	assert(var_64_5)

	for iter_64_0, iter_64_1 in ipairs({
		"common",
		var_64_5
	}) do
		local var_64_6 = string.format("dorm3d/character/%s/res/%s", var_64_3, iter_64_1)

		if checkABExist(var_64_6) then
			table.insert(var_64_0, function(arg_65_0)
				arg_64_0.loader:LoadBundle(var_64_6, function(arg_66_0)
					for iter_66_0, iter_66_1 in ipairs(arg_66_0:GetAllAssetNames()) do
						local var_66_0, var_66_1, var_66_2 = string.find(string.lower(iter_66_1), "material_hx[/\\](.*).mat")

						if var_66_0 then
							arg_64_0.hxMatDict[var_66_2 .. " (Instance)"] = {
								arg_66_0,
								iter_66_1
							}
							arg_64_0.hxMatDict[var_66_2] = {
								arg_66_0,
								iter_66_1
							}
						end
					end

					arg_65_0()
				end)
			end)
		end
	end

	var_64_1.skinId = var_64_4
	var_64_1.skinIdList = {
		var_64_4
	}

	table.insert(var_64_0, function(arg_67_0)
		local var_67_0 = string.format("dorm3d/character/%s/prefabs/%s", var_64_3, var_64_5)

		arg_64_0.loader:GetPrefab(var_67_0, "", function(arg_68_0)
			var_64_1.ladyGameObject = arg_68_0
			arg_64_0.skinDict[var_64_4] = {
				ladyGameObject = arg_68_0
			}

			arg_67_0()
		end)
	end)

	if arg_64_0.room:isPersonalRoom() then
		for iter_64_2, iter_64_3 in ipairs(var_64_2:GetAllModelIds()) do
			if not table.contains(var_64_1.skinIdList, iter_64_3) then
				local var_64_7 = Dorm3dSkin.New({
					configId = iter_64_3
				}):GetModelName()
				local var_64_8 = string.format("dorm3d/character/%s/prefabs/%s", var_64_3, var_64_7)

				if checkABExist(var_64_8) then
					table.insert(var_64_1.skinIdList, iter_64_3)
					table.insert(var_64_0, function(arg_69_0)
						arg_64_0.loader:GetPrefab(var_64_8, "", function(arg_70_0)
							arg_64_0.skinDict[iter_64_3] = {
								ladyGameObject = arg_70_0
							}
							GetComponent(arg_70_0, "GraphOwner").enabled = false

							setActive(arg_70_0, false)
							arg_69_0()
						end)
					end)
				end
			end
		end
	end

	if arg_64_0.contextData.pendingDic[arg_64_1] then
		local var_64_9 = pg.dorm3d_welcome[arg_64_0.contextData.pendingDic[arg_64_1]]

		if var_64_9.item_prefab ~= "" then
			table.insert(var_64_0, function(arg_71_0)
				local var_71_0 = string.lower("dorm3d/furniture/item/" .. var_64_9.item_prefab)

				arg_64_0.loader:GetPrefab(var_71_0, "", function(arg_72_0)
					var_64_1.tfPendintItem = arg_72_0.transform

					setActive(arg_72_0, false)
					arg_71_0()
				end)
			end)
		end
	end

	parallelAsync(var_64_0, arg_64_2)
end

function var_0_0.HXCharacter(arg_73_0, arg_73_1)
	if not HXSet.isHx() then
		return
	end

	if Dorm3dHxHelper.ReplaceCharacterParts(arg_73_1) then
		return
	end

	local var_73_0 = arg_73_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_73_0, function(arg_74_0, arg_74_1)
		local var_74_0 = arg_74_1.sharedMaterials
		local var_74_1 = false

		table.IpairsCArray(var_74_0, function(arg_75_0, arg_75_1)
			if arg_75_1 == nil then
				return
			end

			local var_75_0 = arg_75_1.name

			if not arg_73_0.hxMatDict[var_75_0] then
				return
			end

			var_74_1 = true

			local var_75_1, var_75_2 = unpack(arg_73_0.hxMatDict[var_75_0])
			local var_75_3 = var_75_1:LoadAssetSync(var_75_2, typeof(Material), false, false)

			var_74_0[arg_75_0] = var_75_3

			warning("Replace HX Material", arg_73_0.hxMatDict[var_75_0][2])
		end)

		if var_74_1 then
			arg_74_1.sharedMaterials = var_74_0

			GraphicsInterface.Instance:UpdateCharacterMaterialLst(go(arg_73_1))
		end
	end)
end

function var_0_0.InitHolyLight(arg_76_0)
	local var_76_0 = {}

	for iter_76_0, iter_76_1 in pairs(arg_76_0.ladyDict) do
		table.insert(var_76_0, iter_76_1.lady)
	end

	Dorm3dHxHelper.ShowHolyLight(var_76_0, arg_76_0.holyLightRoot, true)
end

function var_0_0.InitCharacter(arg_77_0, arg_77_1, arg_77_2)
	arg_77_1:InitCharacter(arg_77_2)
	arg_77_0:HXCharacter(arg_77_1.lady)
	arg_77_1:SetZone(arg_77_0.contextData.ladyZone[arg_77_2])
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
				local var_92_1 = arg_88_0:GetRestritedHeightRange()
				local var_92_2 = math.InverseLerp(var_92_1[1], var_92_1[2], var_92_0.position.y)

				arg_88_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_92_2)
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

	arg_88_0:OverlayPanel(arg_88_0.blockLayer)
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
	arg_88_0:InitExtraSystem()
end

function var_0_0.InitExtraSystem(arg_103_0, arg_103_1)
	if not arg_103_0.systemManager then
		arg_103_0.systemManager = ExtraSystemManager.New(arg_103_0.event, arg_103_0)
	end

	arg_103_1 = arg_103_1 or DormConst.GetDefaultSystemClasses()

	for iter_103_0, iter_103_1 in ipairs(arg_103_1) do
		arg_103_0.systemManager:Register(iter_103_1)
	end
end

function var_0_0.RemoveExtraSystem(arg_104_0, arg_104_1)
	if not arg_104_0.systemManager then
		return
	end

	arg_104_1 = arg_104_1 or DormConst.GetDefaultSystemClasses()

	for iter_104_0, iter_104_1 in ipairs(arg_104_1) do
		arg_104_0.systemManager:Remove(iter_104_1)
	end
end

function var_0_0.GetExtraSystem(arg_105_0, arg_105_1)
	if not arg_105_0.systemManager then
		return nil
	end

	return arg_105_0.systemManager:Get(arg_105_1)
end

function var_0_0.InitData(arg_106_0)
	if not arg_106_0.contextData.ladyZone then
		arg_106_0.contextData.ladyZone = {}

		local var_106_0
		local var_106_1 = arg_106_0.room:getConfig("default_zone")

		for iter_106_0, iter_106_1 in ipairs(var_106_1) do
			arg_106_0.contextData.ladyZone[iter_106_1[1]] = iter_106_1[2]

			if table.contains(arg_106_0.contextData.groupIds, iter_106_1[1]) then
				var_106_0 = var_106_0 or arg_106_0.contextData.ladyZone[iter_106_1[1]]
			end
		end

		arg_106_0.contextData.inFurnitureName = var_106_0 or var_106_1[1][2]
	end

	arg_106_0.zoneDatas = _.select(arg_106_0.room:GetZones(), function(arg_107_0)
		return not arg_107_0:IsGlobal()
	end)
	arg_106_0.activeLady = {}
end

function var_0_0.Update(arg_108_0)
	arg_108_0.raycastCamera.fieldOfView = arg_108_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_108_0.tweenFOV then
		local var_108_0 = Damp(1, 1, Time.deltaTime)

		arg_108_0.pinchValue = Mathf.Lerp(arg_108_0.pinchValue, 1, var_108_0)

		arg_108_0:SetPOVFOV(arg_108_0.POVOriginalFOV * arg_108_0.pinchValue)

		if arg_108_0.pinchValue > 0.99 then
			arg_108_0.tweenFOV = nil
		end
	end

	if isActive(arg_108_0.cameras[var_0_0.CAMERA.POV]) then
		arg_108_0:TriggerLadyDistance()
	end

	if arg_108_0.contactInRangeDic then
		local var_108_1 = arg_108_0.transformFilter:Execute():ToTable()

		for iter_108_0, iter_108_1 in pairs(arg_108_0.contactInRangeDic) do
			local var_108_2 = pg.dorm3d_collection_template[iter_108_0]
			local var_108_3 = arg_108_0.transRangeDic[iter_108_0]
			local var_108_4 = underscore(var_108_1):chain():slice(unpack(var_108_3)):any(function(arg_109_0)
				return arg_109_0
			end):value()

			if tobool(iter_108_1) ~= var_108_4 then
				arg_108_0.contactInRangeDic[iter_108_0] = var_108_4

				arg_108_0:UpdateContactDisplay(iter_108_0, var_108_4 and not arg_108_0.hideConcatFlag and arg_108_0.contactStateDic[iter_108_0] or arg_108_0.hideContactStateDic[iter_108_0])
			end
		end
	end

	if arg_108_0.enableFloatUpdate then
		arg_108_0:UpdateFloatPosition()
	end

	arg_108_0:CheckInSector()

	if arg_108_0.apartment then
		(function(arg_110_0)
			(function()
				if not arg_110_0.ikHandler then
					return
				end

				local var_111_0 = arg_110_0.ikHandler.screenPosition
				local var_111_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
				local var_111_2 = var_111_0 - Vector2.New(var_111_1.width, var_111_1.height) * 0.5

				setAnchoredPosition(arg_108_0:GetIKHandTF(), var_111_2)

				if Time.time > arg_108_0.ikNextCheckStamp then
					arg_108_0.ikNextCheckStamp = arg_108_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					local var_111_3 = _.detect(arg_110_0.readyIKLayers, function(arg_112_0)
						return arg_112_0:GetControllerPath() == arg_110_0.ikHandler.ikData:GetControllerPath()
					end)

					arg_108_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_111_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end
			end)()

			if arg_108_0.enableIKTip then
				local var_110_0 = not arg_108_0.blockIK and Time.time > arg_108_0.nextTipIKTime

				if var_110_0 then
					local var_110_1 = _.filter(arg_110_0.readyIKLayers, function(arg_113_0)
						return not arg_113_0.ignoreDrag
					end)

					UIItemList.StaticAlign(arg_108_0.ikTipsRoot, arg_108_0.ikTipsRoot:GetChild(0), #var_110_1, function(arg_114_0, arg_114_1, arg_114_2)
						if arg_114_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_114_1 = arg_114_1 + 1

						local var_114_0
						local var_114_1 = Vector2.zero
						local var_114_2 = var_110_1[arg_114_1]
						local var_114_3 = var_114_2:GetTriggerBoneName()
						local var_114_4 = var_114_3 and arg_110_0.IKSettings.Colliders[var_114_3] or nil
						local var_114_5 = var_114_2:GetIKTipOffset()

						if var_114_4 then
							local function var_114_6()
								local var_115_0 = arg_110_0.IKSettings.CameraRaycaster.eventCamera:WorldToScreenPoint(var_114_4.position)
								local var_115_1 = CameraMgr.instance:Raycast(arg_110_0.IKSettings.CameraRaycaster, var_115_0)

								if var_115_1.Length == 0 then
									return
								end

								return var_114_4 == var_115_1[0].gameObject.transform
							end
						end

						if var_114_4 then
							local var_114_7 = var_114_4.position
							local var_114_8 = var_114_4:GetComponent(typeof(UnityEngine.Collider))

							if var_114_8 then
								var_114_7 = var_114_8.bounds.center
							end

							local var_114_9 = arg_108_0:GetLocalPosition(arg_108_0:GetScreenPosition(var_114_7, arg_110_0.IKSettings.CameraRaycaster.eventCamera), arg_108_0.ikTipsRoot) + var_114_5

							setLocalPosition(arg_114_2, var_114_9)

							local var_114_10 = var_114_2:GetTriggerRect()
							local var_114_11 = var_114_10:PointToNormalized(Vector2.zero)
							local var_114_12 = Vector2.zero

							if var_114_11.x < 0.5 and var_114_11.y < 0.5 then
								var_114_12 = var_114_10.max
							elseif var_114_11.x >= 0.5 and var_114_11.y < 0.5 then
								var_114_12 = Vector2.New(var_114_10.xMin, var_114_10.yMax)
							elseif var_114_11.x < 0.5 and var_114_11.y >= 0.5 then
								var_114_12 = Vector2.New(var_114_10.xMax, var_114_10.yMin)
							elseif var_114_11.x >= 0.5 and var_114_11.y >= 0.5 then
								var_114_12 = var_114_10.min
							end

							if var_114_11.x == 0.5 then
								if var_114_9.x < 0 then
									var_114_12.x = var_114_10.xMax
								else
									var_114_12.x = var_114_10.xMin
								end
							end

							if var_114_11.y == 0.5 then
								if var_114_9.y < 0 then
									var_114_12.y = var_114_10.yMax
								else
									var_114_12.y = var_114_10.yMin
								end
							end

							local var_114_13 = var_114_12 - var_114_10.center

							setLocalRotation(arg_114_2, Quaternion.LookRotation(Vector3.forward, Vector3.New(var_114_13.x, var_114_13.y, 0)))
						end

						setActive(arg_114_2, var_114_4)
					end)
					UIItemList.StaticAlign(arg_108_0.ikClickTipsRoot, arg_108_0.ikClickTipsRoot:GetChild(0), #arg_110_0.iKTouchDatas, function(arg_116_0, arg_116_1, arg_116_2)
						if arg_116_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_116_1 = arg_116_1 + 1

						local var_116_0
						local var_116_1 = Vector2.zero
						local var_116_2 = arg_116_1
						local var_116_3 = arg_110_0.iKTouchDatas[var_116_2][1]
						local var_116_4 = pg.dorm3d_ik_touch[var_116_3]

						if var_116_4.tip_offset and var_116_4.tip_offset ~= "" then
							var_116_1 = Vector2.New(unpack(var_116_4.tip_offset))
						end

						if #var_116_4.scene_item > 0 then
							var_116_0 = arg_108_0:GetSceneItem(var_116_4.scene_item)
						else
							var_116_0 = arg_110_0.IKSettings.Colliders[var_116_4.body]
						end

						if var_116_0 then
							local var_116_5 = var_116_0.position
							local var_116_6 = var_116_0:GetComponent(typeof(UnityEngine.Collider))

							if var_116_6 then
								var_116_5 = var_116_6.bounds.center
							end

							setLocalPosition(arg_116_2, arg_108_0:GetLocalPosition(arg_108_0:GetScreenPosition(var_116_5, arg_110_0.IKSettings.CameraRaycaster.eventCamera), arg_108_0.ikClickTipsRoot) + var_116_1)
						end

						setActive(arg_116_2, var_116_0)
					end)
				end

				setActive(arg_108_0.ikTipsRoot, var_110_0)
				setActive(arg_108_0.ikClickTipsRoot, var_110_0)
				setActive(arg_108_0.ikTextTipsRoot, var_110_0)
			end
		end)(arg_108_0:GetCurrentLadyEnv())
	end

	if arg_108_0.systemManager then
		arg_108_0.systemManager:Update(Time.deltaTime)
	end
end

function var_0_0.CheckInSector(arg_117_0)
	if not isActive(arg_117_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_117_0 = arg_117_0.mainCameraTF.position

	for iter_117_0, iter_117_1 in pairs(arg_117_0.ladyDict) do
		if iter_117_1.lady then
			local var_117_1 = tobool(arg_117_0.activeLady[iter_117_0])
			local var_117_2 = {
				Radius = 2,
				Angle = 120,
				Position = iter_117_1.lady.position,
				Rotation = iter_117_1.lady.rotation
			}

			if var_117_1 ~= tobool(var_0_0.IsPointInSector(var_117_2, var_117_0)) then
				arg_117_0.activeLady[iter_117_0] = not var_117_1

				arg_117_0:emit(var_0_0.ON_ENTER_SECTOR, iter_117_0)
			end
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_118_0)
	for iter_118_0, iter_118_1 in pairs(arg_118_0.ladyDict) do
		if iter_118_1.lady then
			iter_118_1.dis = (iter_118_1.lady.position - arg_118_0.player.position).magnitude

			if (arg_118_0:GetBlackboardValue(iter_118_1, "inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > iter_118_1.dis ~= arg_118_0:GetBlackboardValue(iter_118_1, "inDistance") then
				arg_118_0:SetBlackboardValue(iter_118_1, "inDistance", iter_118_1.dis < var_0_0.POV_CLOSE_DISTANCE)
				arg_118_0:emit(var_0_0.ON_CHANGE_DISTANCE, iter_118_0, iter_118_1.dis < var_0_0.POV_CLOSE_DISTANCE)
			end
		end
	end
end

function var_0_0.OnStickMove(arg_119_0, arg_119_1)
	arg_119_0.joystickDelta = arg_119_1
end

function var_0_0.SetPinchValue(arg_120_0, arg_120_1)
	arg_120_0.pinchValue = arg_120_1

	arg_120_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_121_0)
	local var_121_0 = arg_121_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_121_0)
end

function var_0_0.SetPOVFOV(arg_122_0, arg_122_1)
	local var_122_0 = arg_122_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_122_0, arg_122_1)

	arg_122_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_122_0
end

function var_0_0.RefreshSlots(arg_123_0, arg_123_1, arg_123_2)
	arg_123_1 = arg_123_1 or arg_123_0.room

	local var_123_0 = arg_123_1:GetSlots()
	local var_123_1 = arg_123_1:GetFurnitures()

	arg_123_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_123_0, function(arg_124_0, arg_124_1, arg_124_2)
		local var_124_0 = arg_124_1:GetConfigID()

		if not arg_123_0.slotDict[var_124_0] then
			return arg_124_2()
		end

		local var_124_1 = _.detect(var_123_1, function(arg_125_0)
			return arg_125_0:GetSlotID() == var_124_0
		end)
		local var_124_2 = var_124_1 and var_124_1:GetModel() or false
		local var_124_3 = arg_123_0.slotDict[var_124_0].model

		arg_123_0.slotDict[var_124_0].displayModelName = var_124_2
		arg_123_0.slotDict[var_124_0].furnitureId = var_124_1 and var_124_1:GetConfigID()

		local function var_124_4(arg_126_0)
			if var_124_3 then
				setActive(var_124_3, var_124_2 == "")
			end

			table.Foreach(arg_123_0.slotDict[var_124_0].sceneHides or {}, function(arg_127_0, arg_127_1)
				setActive(arg_127_1.trans, arg_127_1.visible)
			end)

			arg_123_0.slotDict[var_124_0].sceneHides = {}

			if arg_126_0 then
				local var_126_0 = arg_126_0:getConfig("scene_hides")

				if #var_126_0 > 0 then
					table.Ipairs(var_126_0, function(arg_128_0, arg_128_1)
						local var_128_0 = arg_123_0.modelRoot:Find(arg_128_1)

						assert(var_128_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_126_0:GetConfigID(), arg_128_1))

						local var_128_1 = isActive(var_128_0)

						table.insert(arg_123_0.slotDict[var_124_0].sceneHides, {
							name = arg_128_1,
							trans = var_128_0,
							visible = var_128_1
						})
						setActive(var_128_0, false)
					end)
				end
			end
		end

		if var_124_2 == false or var_124_2 == "" then
			arg_123_0.loader:ClearRequest("slot_" .. var_124_0)
			var_124_4()
			arg_124_2()

			return
		end

		local var_124_5 = arg_123_0.slotDict[var_124_0].trans

		if arg_123_0.loader:GetLoadingRP("slot_" .. var_124_0) then
			arg_123_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_123_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_124_2, "", function(arg_129_0)
			assert(arg_129_0)
			setParent(arg_129_0, var_124_5)
			var_124_4(var_124_1)
			arg_124_2()
		end, "slot_" .. var_124_0)
	end, function()
		arg_123_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_123_2)
		warning("RefreshSlots", "Done")
		arg_123_0:emit(Dorm3dRoomMediator.REFRESH_FURNITURE_AND_SLOTS_DONE)
	end)
end

function var_0_0.RefreshSlotsEmpty(arg_131_0, arg_131_1)
	local var_131_0 = Clone(arg_131_0.room)

	var_131_0.furnitures = {}

	arg_131_0:RefreshSlots(var_131_0, arg_131_1)
end

function var_0_0.CheckSceneItemActiveByPath(arg_132_0, arg_132_1)
	local var_132_0 = arg_132_0:GetSceneItem(arg_132_1)

	return arg_132_0:CheckSceneItemActive(var_132_0)
end

function var_0_0.CheckSceneItemActive(arg_133_0, arg_133_1)
	local var_133_0 = true
	local var_133_1

	table.Checkout(arg_133_0.slotDict, function(arg_134_0, arg_134_1)
		if underscore.detect(arg_134_1.sceneHides, function(arg_135_0)
			return arg_135_0.trans == arg_133_1
		end) then
			var_133_0 = false
			var_133_1 = arg_134_1.furnitureId

			return false
		end
	end)

	return var_133_0, var_133_1
end

function var_0_0.ChangeCharacterPosition(arg_136_0, arg_136_1)
	arg_136_0:ResetCharPoint(arg_136_1, arg_136_1.ladyActiveZone)
	arg_136_0:SyncInterestTransform(arg_136_1)
end

function var_0_0.SyncCurrentInterestTransform(arg_137_0)
	local var_137_0 = arg_137_0:GetCurrentLadyEnv()

	arg_137_0:SyncInterestTransform(var_137_0)
end

function var_0_0.SyncInterestTransform(arg_138_0, arg_138_1)
	arg_138_0.ladyInterest.position = arg_138_1.ladyInterestRoot.position
	arg_138_0.ladyInterest.rotation = arg_138_1.ladyInterestRoot.rotation
end

function var_0_0.SyncInterestTransformByTf(arg_139_0, arg_139_1)
	arg_139_0.ladyInterest.position = arg_139_1.position
	arg_139_0.ladyInterest.rotation = arg_139_1.rotation
end

function var_0_0.ChangePlayerPosition(arg_140_0, arg_140_1)
	arg_140_1 = arg_140_1 or arg_140_0.contextData.inFurnitureName

	local var_140_0 = arg_140_0.furnitures:Find(arg_140_1):Find("PlayerPoint").position

	arg_140_0.player.position = var_140_0
	arg_140_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_140_0.playerEye.position

	local var_140_1 = arg_140_0.ladyInterest.position - arg_140_0.playerEye.position
	local var_140_2 = Quaternion.LookRotation(var_140_1).eulerAngles
	local var_140_3 = var_140_2.y
	local var_140_4 = var_140_2.x
	local var_140_5 = arg_140_0.compPovAim.m_HorizontalAxis

	var_140_5.Value = arg_140_0:GetNearestAngle(var_140_3, var_140_5.m_MinValue, var_140_5.m_MaxValue)
	arg_140_0.compPovAim.m_HorizontalAxis = var_140_5

	local var_140_6 = arg_140_0.compPovAim.m_VerticalAxis

	var_140_6.Value = var_140_4
	arg_140_0.compPovAim.m_VerticalAxis = var_140_6
end

function var_0_0.GetAttachedFurnitureName(arg_141_0)
	return arg_141_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_142_0, arg_142_1)
	return underscore.detect(arg_142_0.attachedPoints, function(arg_143_0)
		return arg_143_0.name == arg_142_1
	end)
end

function var_0_0.GetSlotByID(arg_144_0, arg_144_1)
	return arg_144_0.displaySlots[arg_144_1] and arg_144_0.displaySlots[arg_144_1].trans
end

function var_0_0.GetScreenPosition(arg_145_0, arg_145_1, arg_145_2)
	arg_145_2 = arg_145_2 or arg_145_0.raycastCamera

	local var_145_0 = arg_145_2:WorldToScreenPoint(arg_145_1)

	if var_145_0.z < 0 then
		var_145_0.x = var_145_0.x + (var_145_0.x < 0 and -1 or 1) * Screen.width
		var_145_0.y = var_145_0.y + (var_145_0.y < 0 and -1 or 1) * Screen.height
		var_145_0.z = -var_145_0.z
	end

	return var_145_0
end

function var_0_0.GetLocalPosition(arg_146_0, arg_146_1, arg_146_2)
	return LuaHelper.ScreenToLocal(arg_146_2, arg_146_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_147_0)
	return arg_147_0.modelRoot
end

function var_0_0.ShiftZoneSafe(arg_148_0, arg_148_1)
	local var_148_0 = {}

	if arg_148_0.room:isPersonalRoom() and not arg_148_0:GetBlackboardValue(arg_148_0:GetCurrentLadyEnv(), "inPending") then
		table.insert(var_148_0, function(arg_149_0)
			arg_148_0:OutOfLazy(arg_148_0.apartment:GetConfigID(), arg_149_0)
		end)
	end

	table.insert(var_148_0, function(arg_150_0)
		arg_148_0:ShiftZone(arg_148_1, arg_150_0)
	end)
	seriesAsync(var_148_0, function()
		arg_148_0:CheckQueue()
	end)
end

function var_0_0.ShiftZone(arg_152_0, arg_152_1, arg_152_2)
	local var_152_0 = arg_152_0:GetFurnitureByName(arg_152_1)

	if not var_152_0 then
		errorMsg(arg_152_1 .. " Not Find")
		existCall(arg_152_2)

		return
	end

	seriesAsync({
		function(arg_153_0)
			arg_152_0:emit(var_0_0.SHOW_BLOCK)
			arg_152_0:ShowBlackScreen(true, arg_153_0)
		end,
		function(arg_154_0)
			if arg_152_0.shiftLady or arg_152_0.room:isPersonalRoom() then
				local var_154_0 = arg_152_0.shiftLady or arg_152_0.apartment:GetConfigID()

				arg_152_0.shiftLady = nil
				arg_152_0.contextData.ladyZone[var_154_0] = var_152_0.name

				local var_154_1 = arg_152_0.ladyDict[var_154_0]

				var_154_1:SetZone(arg_152_0.contextData.ladyZone[var_154_0])

				if arg_152_0:GetBlackboardValue(var_154_1, "inPending") then
					arg_152_0:SetOutPending(var_154_1)
					arg_152_0:SwitchAnim(var_154_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_152_0:ChangeCharacterPosition(var_154_1)
						arg_154_0()
					end)
				else
					arg_152_0:ChangeCharacterPosition(var_154_1)
					arg_154_0()
				end
			else
				arg_154_0()
			end
		end,
		function(arg_156_0)
			arg_152_0.contextData.inFurnitureName = var_152_0.name

			if SlideExtraSystem.IsOpen(arg_152_0.room) and arg_152_0.contextData.inFurnitureName == SlideConst.SLIDE_ZONE then
				arg_152_0:SyncInterestTransformByTf(var_152_0.transform:Find("StayPoint"))
			elseif not arg_152_0.apartment then
				for iter_156_0, iter_156_1 in pairs(arg_152_0.ladyDict) do
					if iter_156_1.ladyBaseZone == arg_152_0.contextData.inFurnitureName then
						arg_152_0:SyncInterestTransform(iter_156_1)

						break
					end
				end
			end

			arg_152_0:ChangePlayerPosition()
			arg_152_0:TriggerLadyDistance()
			arg_152_0:CheckInSector()
			arg_156_0()
		end,
		function(arg_157_0)
			arg_152_0:UpdateZoneList()
			arg_152_0:ShowBlackScreen(false, arg_157_0)
		end,
		function(arg_158_0)
			arg_152_0:emit(var_0_0.HIDE_BLOCK)
			arg_158_0()
		end
	}, arg_152_2)
end

function var_0_0.ActiveCamera(arg_159_0, arg_159_1)
	local var_159_0 = isActive(arg_159_1)

	table.Foreach(arg_159_0.cameras, function(arg_160_0, arg_160_1)
		setActive(arg_160_1, arg_160_1 == arg_159_1)
	end)

	if var_159_0 then
		arg_159_0:OnCameraBlendFinished(arg_159_1)
	end
end

function var_0_0.ActiveCameraByName(arg_161_0, arg_161_1)
	local var_161_0 = arg_161_0.cameraRoot:Find(arg_161_1)

	assert(var_161_0, "ActiveCameraByName: " .. arg_161_1 .. " not found")
	table.Foreach(arg_161_0.cameras, function(arg_162_0, arg_162_1)
		setActive(arg_162_1, false)
	end)
	setActive(var_161_0, true)

	arg_161_0.cameras[var_0_0.CAMERA.CUSTOM] = var_161_0:GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
end

function var_0_0.ShowBlackScreen(arg_163_0, arg_163_1, arg_163_2)
	local var_163_0 = arg_163_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_163_1 and 0 or 0.3
	}

	setImageColor(arg_163_0.blackLayer, Color.NewHex(var_163_0.color))
	setActive(arg_163_0.blackLayer, true)
	setCanvasGroupAlpha(arg_163_0.blackLayer, arg_163_1 and 0 or 1)
	arg_163_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_163_1 then
			setActive(arg_163_0.blackLayer, false)
		end

		existCall(arg_163_2)
	end, GetComponent(arg_163_0.blackLayer, typeof(CanvasGroup)), arg_163_1 and 1 or 0, var_163_0.time):setDelay(var_163_0.delay)
end

function var_0_0.RegisterOrbits(arg_165_0, arg_165_1)
	arg_165_0 = arg_165_0.scene
	arg_165_0.orbits = {
		original = arg_165_1.m_Orbits
	}
	arg_165_0.orbits.current = _.range(3):map(function(arg_166_0)
		local var_166_0 = arg_165_0.orbits.original[arg_166_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_166_0.m_Height, var_166_0.m_Radius)
	end)
	arg_165_0.surroudCamera = arg_165_1
end

function var_0_0.SetCameraObrits(arg_167_0)
	arg_167_0 = arg_167_0.scene

	local var_167_0 = arg_167_0.surroudCamera

	if not var_167_0 then
		return
	end

	local var_167_1 = arg_167_0.orbits.original[1]

	for iter_167_0 = 0, #arg_167_0.orbits.current - 1 do
		local var_167_2 = arg_167_0.orbits.current[iter_167_0 + 1]
		local var_167_3 = arg_167_0.orbits.original[iter_167_0]

		var_167_2.m_Height = math.lerp(var_167_1.m_Height, var_167_3.m_Height, arg_167_0.pinchValue)
		var_167_2.m_Radius = var_167_3.m_Radius * arg_167_0.pinchValue
	end

	var_167_0.m_Orbits = arg_167_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_168_0)
	arg_168_0 = arg_168_0.scene

	local var_168_0 = arg_168_0.surroudCamera

	if not var_168_0 then
		return
	end

	for iter_168_0 = 0, #arg_168_0.orbits.current - 1 do
		local var_168_1 = arg_168_0.orbits.current[iter_168_0 + 1]
		local var_168_2 = arg_168_0.orbits.original[iter_168_0]

		var_168_1.m_Height = var_168_2.m_Height
		var_168_1.m_Radius = var_168_2.m_Radius
	end

	var_168_0.m_Orbits = arg_168_0.orbits.current
	arg_168_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_169_0, arg_169_1, arg_169_2)
	local var_169_0 = {
		base = function(arg_170_0)
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.POV], arg_170_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_171_0)
			assert(arg_169_0.apartment)
			arg_169_0:SyncInterestTransform(arg_169_0:GetCurrentLadyEnv())
			arg_169_0:SetCameraLady(arg_169_0:GetCurrentLadyEnv())
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.ROLE], arg_171_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_172_0)
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.POV], arg_172_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_173_0)
			arg_173_0()
		end,
		gift = function(arg_174_0)
			assert(arg_169_0.apartment)
			arg_169_0:SetCameraLady(arg_169_0:GetCurrentLadyEnv())
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.GIFT], arg_174_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_175_0)
			assert(arg_169_0.apartment)
			arg_169_0:SetCameraLady(arg_169_0:GetCurrentLadyEnv())

			arg_169_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_169_0.cameraRole.transform.position

			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.ROLE2], arg_175_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_176_0)
			assert(arg_169_0.apartment)
			arg_169_0:SetCameraLady(arg_169_0:GetCurrentLadyEnv())
			arg_169_0:SyncInterestTransform(arg_169_0:GetCurrentLadyEnv())
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.TALK], arg_176_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_169_1 = {}

	table.insert(var_169_1, function(arg_177_0)
		switch(arg_169_1, var_169_0, arg_177_0, arg_177_0)
	end)
	seriesAsync(var_169_1, arg_169_2)
end

function var_0_0.GetSceneItem(arg_178_0, arg_178_1)
	local var_178_0

	if string.find(arg_178_1, "FurnitureSlots/") == 1 then
		arg_178_1 = string.gsub(arg_178_1, "^FurnitureSlots/", "", 1)
		var_178_0 = arg_178_0.slotRoot:Find(arg_178_1)
	else
		var_178_0 = arg_178_0.modelRoot:Find(arg_178_1)
	end

	if not var_178_0 then
		warning(string.format("Missing scene item path: %s", arg_178_1))
	end

	return var_178_0
end

function var_0_0.SetSceneAnimSpeed(arg_179_0, arg_179_1, arg_179_2)
	table.Ipairs(arg_179_1 or {}, function(arg_180_0, arg_180_1)
		if arg_179_0.sceneAnimatorDict[arg_180_1] then
			arg_179_0.sceneAnimatorDict[arg_180_1].animator.speed = arg_179_2
		end
	end)
end

function var_0_0.SetExtraAnimSpeed(arg_181_0, arg_181_1, arg_181_2, arg_181_3)
	table.Ipairs(arg_181_2 or {}, function(arg_182_0, arg_182_1)
		local var_182_0 = arg_182_1[1]

		if arg_181_1.extraItems[var_182_0] then
			arg_181_1.extraItems[var_182_0].trans:GetComponent(typeof(Animator)).speed = arg_181_3
		end
	end)
end

function var_0_0.PlayEnterSceneAnim(arg_183_0, arg_183_1, arg_183_2, arg_183_3)
	arg_183_3 = arg_183_3 or 1

	local var_183_0 = {}

	if arg_183_1 and #arg_183_1 > 0 then
		table.Ipairs(arg_183_1, function(arg_184_0, arg_184_1)
			arg_183_0:PlaySceneItemAnim(arg_184_1[1], arg_184_1[2], arg_183_2)
			arg_183_0:SetSceneAnimSpeed({
				arg_184_1[1]
			}, arg_183_3)
			table.insert(var_183_0, arg_184_1[1])
		end)
	end

	arg_183_0:ResetSceneItemAnimators(var_183_0)
end

function var_0_0.PlayEnterExtraItem(arg_185_0, arg_185_1, arg_185_2, arg_185_3)
	arg_185_3 = arg_185_3 or 1

	local var_185_0 = {}

	if arg_185_2 and #arg_185_2 > 0 then
		table.Ipairs(arg_185_2, function(arg_186_0, arg_186_1)
			local var_186_0 = arg_186_1[3] and Vector3.New(unpack(arg_186_1[3]))
			local var_186_1 = arg_186_1[4] and Quaternion.Euler(unpack(arg_186_1[4]))
			local var_186_2 = #arg_186_1 > 4 and arg_186_1[5] or nil

			arg_185_0:LoadCharacterExtraItem(arg_185_1, arg_186_1[1], arg_186_1[2], var_186_0, var_186_1, var_186_2, arg_185_3)
			table.insert(var_185_0, arg_186_1[1])
		end)
	end

	arg_185_0:ResetCharacterExtraItem(arg_185_1, var_185_0)
end

function var_0_0.HideSceneItem(arg_187_0, arg_187_1, arg_187_2)
	if arg_187_2 and #arg_187_2 > 0 then
		if arg_187_1.tempHideSceneItems and #arg_187_1.tempHideSceneItems > 0 then
			arg_187_0:ResetTempHideSceneItems(arg_187_1, arg_187_2)
		end

		arg_187_1.tempHideSceneItems = {}

		table.Ipairs(arg_187_2, function(arg_188_0, arg_188_1)
			local var_188_0 = arg_187_0:GetSceneItem(arg_188_1)

			setActive(var_188_0, false)
			table.insert(arg_187_1.tempHideSceneItems, arg_188_1)
		end)
	end
end

function var_0_0.ResetTempHideSceneItems(arg_189_0, arg_189_1, arg_189_2)
	arg_189_2 = arg_189_2 or {}

	if arg_189_1.tempHideSceneItems and #arg_189_1.tempHideSceneItems > 0 then
		table.Ipairs(arg_189_1.tempHideSceneItems, function(arg_190_0, arg_190_1)
			if table.contains(arg_189_2, arg_190_1) then
				return
			end

			local var_190_0 = arg_189_0:GetSceneItem(arg_190_1)

			setActive(var_190_0, true)
		end)

		arg_189_1.tempHideSceneItems = nil
	end
end

function var_0_0.SetIKStatus(arg_191_0, arg_191_1, arg_191_2, arg_191_3, arg_191_4)
	warning("Set IKStatus " .. (arg_191_2.id or "NIL"))

	arg_191_0.enableIKTip = true

	arg_191_0:ResetIKTipTimer()
	setActive(arg_191_1.ladyCollider, false)
	_.each(arg_191_1.ladyTouchColliders, function(arg_192_0)
		setActive(arg_192_0, true)
	end)

	arg_191_0.blockIK = nil

	arg_191_0:ClearIkTouchEvents(arg_191_1)

	arg_191_1.currentIkStatus = arg_191_2.id
	arg_191_1.ikActionDict = {}
	arg_191_1.readyIKLayers = {}
	arg_191_1.iKTouchDatas = arg_191_2.touch_data or {}
	arg_191_1.IKSettings = {
		Colliders = arg_191_1.ladyColliders,
		CameraRaycaster = arg_191_0.sceneRaycaster
	}

	local var_191_0 = table.shallowCopy(arg_191_2.ik_id)
	local var_191_1 = {}

	_.each(arg_191_1.iKTouchDatas, function(arg_193_0)
		local var_193_0 = arg_193_0[3]

		if var_193_0[1] == 7 then
			local var_193_1 = pg.dorm3d_ik_touch_move[var_193_0[2]]
			local var_193_2 = var_193_1.target_ik

			if not _.detect(var_191_0, function(arg_194_0)
				return arg_194_0[1] == var_193_2
			end) then
				var_191_1[var_193_2] = {
					back_time = var_193_1.back_time
				}

				local var_193_3 = {
					var_193_2,
					0,
					{}
				}

				if var_193_1.trigger_dialogue > 0 then
					var_193_3[3] = {
						4,
						0,
						var_193_1.trigger_dialogue
					}
				end

				table.insert(var_191_0, var_193_3)
			end
		end
	end)

	local var_191_2 = _.map(var_191_0, function(arg_195_0)
		local var_195_0 = Dorm3dIK.New({
			configId = arg_195_0[1]
		})
		local var_195_1 = arg_195_0[3]
		local var_195_2 = var_195_1[1]
		local var_195_3 = switch(var_195_2, {
			function(arg_196_0, arg_196_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_198_0, arg_198_1)
				return arg_198_0
			end,
			function(arg_199_0, arg_199_1)
				return arg_199_0
			end,
			function(arg_200_0, arg_200_1, arg_200_2, arg_200_3)
				return arg_200_0
			end,
			function(arg_201_0)
				return 0
			end
		}, function(arg_202_0)
			return type(arg_202_0) == "number" and arg_202_0 or 0
		end, unpack(var_195_1, 2))

		table.insert(arg_191_1.readyIKLayers, var_195_0)

		arg_191_1.ikActionDict[var_195_0:GetControllerPath()] = var_195_1

		local var_195_4 = var_195_0:GetRevertTime()
		local var_195_5 = var_191_1[var_195_0:GetConfigID()]
		local var_195_6 = tobool(var_195_5)

		if var_195_6 then
			var_195_3 = var_195_5.back_time
			var_195_4 = var_195_5.back_time
			var_195_0.ignoreDrag = true
		end

		local var_195_7 = var_195_0:GetSubTargets()
		local var_195_8 = var_195_0:GetPlaneRotations()
		local var_195_9 = var_195_0:GetPlaneScales()
		local var_195_10 = _.map(_.range(#var_195_7), function(arg_203_0)
			return {
				name = var_195_7[arg_203_0][1],
				planeRot = var_195_8[arg_203_0],
				planeScale = var_195_9[arg_203_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_195_0:getConfig("trigger_param")[2],
			controllerName = var_195_0:GetControllerPath(),
			subTargets = var_195_10,
			actionType = var_195_0:GetActionTriggerParams()[1],
			controlRect = var_195_0:GetRect(),
			actionRect = var_195_0:GetTriggerRect(),
			backTime = var_195_4,
			actionRevertTime = var_195_3,
			ignoreDrag = var_195_6
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_191_1.ladyIKRoot, arg_191_1.ladyBoneMaps)
	arg_191_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_191_2)

	local var_191_3 = _.map(arg_191_1.iKTouchDatas, function(arg_204_0)
		return arg_204_0[1]
	end)

	table.Foreach(var_191_3, function(arg_205_0, arg_205_1)
		local var_205_0 = pg.dorm3d_ik_touch[arg_205_1]

		if #var_205_0.scene_item == 0 then
			return
		end

		local var_205_1 = arg_191_0:GetSceneItem(var_205_0.scene_item)

		if not var_205_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_205_1, var_205_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_205_1, typeof(UnityEngine.Collider))) then
			go(var_205_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_205_2 = GetOrAddComponent(var_205_1, typeof(EventTriggerListener))

		var_205_2.enabled = true

		var_205_2:AddPointClickFunc(function()
			arg_191_0.blockIK = true

			local var_206_0 = arg_191_1.iKTouchDatas[arg_205_0]
			local var_206_1, var_206_2, var_206_3 = unpack(var_206_0)

			arg_191_0:TouchModeAction(arg_191_1, var_206_1, unpack(var_206_3))(function()
				arg_191_0.enableIKTip = true

				arg_191_0:ResetIKTipTimer()

				arg_191_0.blockIK = nil
			end)
		end)
	end)

	arg_191_0.camBrain.enabled = false

	if arg_191_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_191_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_191_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_191_4 = arg_191_0.cameraRoot:Find(arg_191_2.ik_camera)

	assert(var_191_4, "Missing IKCamera")

	arg_191_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_191_4

	arg_191_0:ActiveCamera(arg_191_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_191_0.camBrain.enabled = true

	local var_191_5 = var_191_4:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_191_5 then
		arg_191_0:RegisterOrbits(var_191_5)
	else
		arg_191_0:RevertCameraOrbit()
	end

	arg_191_0:SwitchAnim(arg_191_1, arg_191_2.character_action)
	arg_191_0:SettingHeadAimIK(arg_191_1, arg_191_2.head_track)
	arg_191_1:EnableCloth(false)
	arg_191_1:EnableCloth(arg_191_2.use_cloth, arg_191_2.cloth_colliders)
	arg_191_0:PlayEnterSceneAnim(arg_191_2.enter_scene_anim)
	arg_191_0:PlayEnterExtraItem(arg_191_1, arg_191_2.enter_extra_item)
	arg_191_0:HideSceneItem(arg_191_1, arg_191_2.hide_scene_item)
	eachChild(arg_191_0.ikTextTipsRoot, function(arg_208_0)
		setActive(arg_208_0, false)
	end)
	_.each(arg_191_1.readyIKLayers, function(arg_209_0)
		local var_209_0 = arg_209_0:getConfig("tip_text")

		if not var_209_0 or #var_209_0 == 0 then
			return
		end

		local var_209_1 = arg_191_0.ikTextTipsRoot:Find(var_209_0)

		if not IsNil(var_209_1) then
			setActive(var_209_1, true)
		end
	end)
	onNextTick(function()
		local var_210_0 = arg_191_0.furnitures:Find(arg_191_2.character_position)

		arg_191_1.lady.position = var_210_0:Find("StayPoint").position
		arg_191_1.lady.rotation = var_210_0:Find("StayPoint").rotation

		existCall(arg_191_3)
	end)
end

function var_0_0.ExitIKStatus(arg_211_0, arg_211_1, arg_211_2, arg_211_3, arg_211_4)
	arg_211_0.enableIKTip = false

	setActive(arg_211_1.ladyCollider, true)
	_.each(arg_211_1.ladyTouchColliders, function(arg_212_0)
		setActive(arg_212_0, false)
	end)

	arg_211_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()
	setActive(arg_211_0.ikTipsRoot, false)
	setActive(arg_211_0.ikClickTipsRoot, false)
	arg_211_0:ClearIkTouchEvents(arg_211_1)

	arg_211_1.currentIkStatus = nil
	arg_211_1.ikActionDict = nil
	arg_211_1.readyIKLayers = nil
	arg_211_1.iKTouchDatas = nil

	arg_211_0:RevertCameraOrbit()
	setActive(arg_211_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_211_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_211_1:EnableCloth(false)
	arg_211_0:ResetHeadAimIK(arg_211_1)
	arg_211_0:SwitchAnim(arg_211_1, arg_211_2.character_action)
	arg_211_0:ResetSceneItemAnimators()

	if not arg_211_4.ignoreResetExtraItem then
		arg_211_0:ResetCharacterExtraItem(arg_211_1)
		arg_211_0:ResetTempHideSceneItems(arg_211_1)
	end

	onNextTick(function()
		if arg_211_2.character_position then
			arg_211_1.ladyActiveZone = arg_211_2.character_position
		else
			arg_211_1.ladyActiveZone = arg_211_1.ladyBaseZone
		end

		arg_211_0:ChangeCharacterPosition(arg_211_1)
		arg_211_0:TriggerLadyDistance()
		arg_211_0:CheckInSector()
		existCall(arg_211_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_214_0, arg_214_1, arg_214_2, arg_214_3, arg_214_4, arg_214_5)
	warning("Set IKStatus " .. (arg_214_3 or "NIL"))
	arg_214_1:SetCurrentIkTimelineStatus(arg_214_3)

	arg_214_0.enableIKTip = true

	setActive(arg_214_0.ikControlUI, true)
	arg_214_0:ResetIKTipTimer()

	arg_214_0.blockIK = nil

	local var_214_0 = pg.dorm3d_ik_timeline_status[arg_214_3]

	arg_214_1.readyIKLayers = {}
	arg_214_1.iKTouchDatas = {}
	arg_214_1.IKSettings = {
		CameraRaycaster = GetOrAddComponent(arg_214_4, typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_214_1.IKSettings.CameraRaycaster)

	local var_214_1 = {}

	table.IpairsCArray(arg_214_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_215_0, arg_215_1)
		if arg_215_1.name == "SafeCollider" then
			setActive(arg_215_1, false)

			return
		end

		if arg_215_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		local var_215_0 = tf(arg_215_1)
		local var_215_1 = var_215_0.name
		local var_215_2 = var_215_1 and string.find(var_215_1, "Collider") or -1

		if var_215_2 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_215_1)

			return
		end

		local var_215_3 = string.sub(var_215_1, 1, var_215_2 - 1)

		if var_215_3 == "Body" or var_215_3 == "Safe" then
			setActive(var_215_0, false)

			return
		end

		if DormConst.BONE_TO_TOUCH[var_215_3] == nil then
			return
		end

		var_214_1[var_215_3] = var_215_0

		setActive(var_215_0, true)
	end)

	arg_214_1.IKSettings.Colliders = var_214_1

	local var_214_2 = GetOrAddComponent(arg_214_2, typeof(EventTriggerListener))

	arg_214_1.ikTimelineMode = true

	local var_214_3 = _.map(var_214_0.ik_id, function(arg_216_0)
		local var_216_0 = Dorm3dIK.New({
			configId = arg_216_0
		})

		table.insert(arg_214_1.readyIKLayers, var_216_0)

		local var_216_1 = var_216_0:GetSubTargets()
		local var_216_2 = var_216_0:GetPlaneRotations()
		local var_216_3 = var_216_0:GetPlaneScales()
		local var_216_4 = _.map(_.range(#var_216_1), function(arg_217_0)
			return {
				name = var_216_1[arg_217_0][1],
				planeRot = var_216_2[arg_217_0],
				planeScale = var_216_3[arg_217_0]
			}
		end)

		return Dorm3dIKController.New({
			ignoreDrag = false,
			triggerName = var_216_0:getConfig("trigger_param")[2],
			controllerName = var_216_0:GetControllerPath(),
			subTargets = var_216_4,
			actionType = var_216_0:GetActionTriggerParams()[1],
			controlRect = var_216_0:GetRect(),
			actionRect = var_216_0:GetTriggerRect(),
			backTime = var_216_0:GetRevertTime(),
			actionRevertTime = var_216_0:GetActionRevertTime(),
			timelineActionEvent = var_216_0:GetTimelineAction()
		})
	end)
	local var_214_4 = arg_214_2.transform:Find("IKLayers")
	local var_214_5 = {}
	local var_214_6 = {}

	table.Foreach(DormConst.boneMap, function(arg_218_0, arg_218_1)
		var_214_6[arg_218_1] = arg_218_0
	end)

	local var_214_7 = arg_214_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_214_7, function(arg_219_0, arg_219_1)
		if var_214_6[arg_219_1.name] then
			var_214_5[var_214_6[arg_219_1.name]] = arg_219_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_214_4, var_214_5)
	arg_214_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_214_3)
	eachChild(arg_214_0.ikTextTipsRoot, function(arg_220_0)
		setActive(arg_220_0, false)
	end)
	_.each(arg_214_1.readyIKLayers, function(arg_221_0)
		local var_221_0 = arg_221_0:getConfig("tip_text")

		if not var_221_0 or #var_221_0 == 0 then
			return
		end

		local var_221_1 = arg_214_0.ikTextTipsRoot:Find(var_221_0)

		if not IsNil(var_221_1) then
			setActive(var_221_1, true)
		end
	end)
	existCall(arg_214_5)
end

function var_0_0.ExitIKTimelineStatus(arg_222_0, arg_222_1, arg_222_2)
	arg_222_1:SetCurrentIkTimelineStatus(nil)

	arg_222_0.enableIKTip = false

	setActive(arg_222_0.ikControlUI, false)

	arg_222_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_222_1.readyIKLayers = nil
	arg_222_1.iKTouchDatas = nil
	arg_222_1.IKSettings = nil

	setActive(arg_222_0.ikTipsRoot, false)
	setActive(arg_222_0.ikClickTipsRoot, false)
	existCall(arg_222_2)
end

function var_0_0.ClearIkTouchEvents(arg_223_0, arg_223_1)
	local var_223_0 = _.map(arg_223_1.iKTouchDatas or {}, function(arg_224_0)
		return arg_224_0[1]
	end)

	table.Foreach(var_223_0, function(arg_225_0, arg_225_1)
		local var_225_0 = pg.dorm3d_ik_touch[arg_225_1]

		if #var_225_0.scene_item == 0 then
			return
		end

		local var_225_1 = arg_223_0:GetSceneItem(var_225_0.scene_item)

		if not var_225_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_225_1, var_225_0.scene_item))

			return
		end

		local var_225_2 = GetOrAddComponent(var_225_1, typeof(EventTriggerListener))

		var_225_2:ClearEvents()

		var_225_2.enabled = false
	end)
end

function var_0_0.EnableIKLayer(arg_226_0, arg_226_1)
	local var_226_0 = arg_226_0:GetCurrentLadyEnv()

	if #arg_226_1:GetHeadTrackPath() > 0 then
		arg_226_0:SettingHeadAimIK(var_226_0, {
			2,
			arg_226_1:GetHeadTrackPath()
		}, true)
	end

	local var_226_1 = arg_226_1:GetTriggerFaceAnim()

	if #var_226_1 > 0 then
		arg_226_0:PlayFaceAnim(var_226_0, var_226_1)
	end

	if not arg_226_1.ignoreDrag then
		setActive(arg_226_0:GetIKHandTF(), true)
		eachChild(arg_226_0:GetIKHandTF(), function(arg_227_0)
			setActive(arg_227_0, false)
		end)
		arg_226_0:StopIKHandTimer()
		setActive(arg_226_0:GetIKHandTF():Find("Begin"), true)

		arg_226_0.ikHandTimer = Timer.New(function()
			setActive(arg_226_0:GetIKHandTF():Find("Begin"), false)
			setActive(arg_226_0:GetIKHandTF():Find("Normal"), true)
		end, 0.5, 1)

		arg_226_0.ikHandTimer:Start()
	end

	if not var_226_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_226_0.apartment.configId, arg_226_0.apartment.level, var_226_0.ikConfig.character_action, arg_226_1:GetTriggerParams()[2], arg_226_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_229_0, arg_229_1)
	local var_229_0 = arg_229_0:GetCurrentLadyEnv()

	if not var_229_0.ikTimelineMode and #arg_229_1:GetHeadTrackPath() > 0 then
		arg_229_0:SettingHeadAimIK(var_229_0, var_229_0.ikConfig.head_track)
	end

	arg_229_0:StopIKHandTimer()

	if not arg_229_1.ignoreDrag then
		setActive(arg_229_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_229_0:GetIKHandTF():Find("Normal"), false)
		setActive(arg_229_0:GetIKHandTF():Find("End"), true)

		arg_229_0.ikHandTimer = Timer.New(function()
			setActive(arg_229_0:GetIKHandTF():Find("End"), false)
			setActive(arg_229_0:GetIKHandTF(), false)
		end, 0.5, 1)

		arg_229_0.ikHandTimer:Start()
	end
end

function var_0_0.StopIKHandTimer(arg_231_0)
	if not arg_231_0.ikHandTimer then
		return
	end

	arg_231_0.ikHandTimer:Stop()

	arg_231_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_232_0, arg_232_1, arg_232_2, arg_232_3)
	local var_232_0 = Time.time

	function arg_232_0.ikRevertHandler()
		local var_233_0 = Time.time - var_232_0

		_.each(arg_232_1.activeIKLayers, function(arg_234_0)
			local var_234_0 = 1

			if arg_232_2 > 0 then
				var_234_0 = var_233_0 / arg_232_2
			end

			local var_234_1 = arg_232_1.cacheIKInfos[arg_234_0].solvers
			local var_234_2 = arg_232_1.cacheIKInfos[arg_234_0].weights

			table.Foreach(var_234_1, function(arg_235_0, arg_235_1)
				arg_235_1.IKPositionWeight = math.lerp(var_234_2[arg_235_0], 0, var_234_0)
			end)
		end)

		if var_233_0 >= arg_232_2 then
			arg_232_0:ResetActiveIKs(arg_232_1)

			arg_232_0.ikRevertHandler = nil

			existCall(arg_232_3)
		end
	end

	arg_232_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_236_0, arg_236_1)
	table.insertto(arg_236_0.activeIKLayers, _.keys(arg_236_0.holdingStatus))
	table.clear(arg_236_0.holdingStatus)
	_.each(arg_236_1.activeIKLayers, function(arg_237_0)
		local var_237_0 = arg_237_0:GetControllerPath()
		local var_237_1 = arg_236_1.ladyIKRoot:Find(var_237_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_237_1, false)

		local var_237_2 = arg_236_1.cacheIKInfos[arg_237_0].solvers
		local var_237_3 = arg_236_1.cacheIKInfos[arg_237_0].weights

		table.Foreach(var_237_2, function(arg_238_0, arg_238_1)
			arg_238_1.IKPositionWeight = var_237_3[arg_238_0]
		end)
	end)
	table.clear(arg_236_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_239_0)
	if not arg_239_0.enableIKTip then
		return
	end

	arg_239_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_240_0, arg_240_1)
	local var_240_0 = arg_240_0:GetCurrentLadyEnv()

	arg_240_0:EnableHeadIK(var_240_0, arg_240_1)
end

function var_0_0.EnableHeadIK(arg_241_0, arg_241_1, arg_241_2)
	arg_241_1.ladyHeadIKComp.enableIk = arg_241_2
end

function var_0_0.SettingHeadAimIK(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
	local var_242_0

	if arg_242_2[1] == 0 then
		arg_242_0:EnableHeadIK(arg_242_1, false)

		return
	elseif arg_242_2[1] == 1 then
		arg_242_0:EnableHeadIK(arg_242_1, true)

		var_242_0 = arg_242_0.mainCameraTF:Find("AimTarget")
	elseif arg_242_2[1] == 2 then
		arg_242_0:EnableHeadIK(arg_242_1, true)
		table.IpairsCArray(arg_242_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_243_0, arg_243_1)
			if arg_243_1.name ~= arg_242_2[2] then
				return
			end

			var_242_0 = arg_243_1
		end)
	end

	arg_242_1.ladyHeadIKComp.AimTarget = var_242_0

	if not arg_242_3 and arg_242_2[3] then
		arg_242_1.ladyHeadIKComp.BodyWeight = arg_242_2[3]
	end

	if not arg_242_3 and arg_242_2[4] then
		arg_242_1.ladyHeadIKComp.HeadWeight = arg_242_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_244_0, arg_244_1)
	arg_244_0:EnableHeadIK(arg_244_1, true)

	arg_244_1.ladyHeadIKComp.AimTarget = arg_244_0.mainCameraTF:Find("AimTarget")
	arg_244_1.ladyHeadIKComp.HeadWeight = arg_244_1.ladyHeadIKData.HeadWeight
	arg_244_1.ladyHeadIKComp.BodyWeight = arg_244_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_245_0, arg_245_1)
	for iter_245_0, iter_245_1 in pairs(arg_245_0.ladyDict) do
		if iter_245_0 ~= arg_245_1 then
			arg_245_0:HideCharacterBylayer(iter_245_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_246_0, arg_246_1)
	for iter_246_0, iter_246_1 in pairs(arg_246_0.ladyDict) do
		if iter_246_0 ~= arg_246_1 then
			arg_246_0:RevertCharacterBylayer(iter_246_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_247_0, arg_247_1)
	local var_247_0 = "Bip001"
	local var_247_1 = arg_247_1.lady:Find("all")

	for iter_247_0 = 0, var_247_1.childCount - 1 do
		local var_247_2 = var_247_1:GetChild(iter_247_0)

		if var_247_2.name ~= var_247_0 then
			pg.ViewUtils.SetLayer(var_247_2, Layer.Environment3D)
		end
	end

	if arg_247_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_247_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_247_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_247_1.ladyWatchFloat, Layer.Environment3D)
	end
end

function var_0_0.RevertCharacterBylayer(arg_248_0, arg_248_1)
	local var_248_0 = "Bip001"
	local var_248_1 = arg_248_1.lady:Find("all")

	for iter_248_0 = 0, var_248_1.childCount - 1 do
		local var_248_2 = var_248_1:GetChild(iter_248_0)

		if var_248_2.name ~= var_248_0 then
			pg.ViewUtils.SetLayer(var_248_2, Layer.Character3D)
		end
	end

	if arg_248_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_248_1.tfPendintItem, Layer.Default)
	end

	if arg_248_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_248_1.ladyWatchFloat, Layer.Default)
	end
end

function var_0_0.EnterFurnitureWatchMode(arg_249_0)
	arg_249_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_249_0:EnableJoystick(true)
	arg_249_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_250_0, arg_250_1)
	arg_250_0:HideFurnitureSlots()

	local var_250_0 = arg_250_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_251_0)
			arg_250_0.furniturePOV = nil

			arg_250_0:EnableJoystick(false)
			arg_250_0:emit(var_0_0.SHOW_BLOCK)
			arg_250_0:ShowBlackScreen(true, arg_251_0)
		end,
		function(arg_252_0)
			existCall(arg_250_1)
			arg_250_0:RevertCharacter()
			arg_250_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_250_0:RegisterCameraBlendFinished(var_250_0, arg_252_0)
			arg_250_0:ActiveCamera(var_250_0)
		end,
		function(arg_253_0)
			arg_250_0:ShowBlackScreen(false, arg_253_0)
		end
	}, function()
		arg_250_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_250_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_255_0, arg_255_1)
	local var_255_0 = arg_255_0:GetFurnitureByName(arg_255_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_255_0.cameraFurnitureWatch and arg_255_0.cameraFurnitureWatch ~= var_255_0 then
		arg_255_0:UnRegisterCameraBlendFinished(arg_255_0.cameraFurnitureWatch)
		setActive(arg_255_0.cameraFurnitureWatch, false)
	end

	arg_255_0.cameraFurnitureWatch = var_255_0
	arg_255_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_255_0.cameraFurnitureWatch
	arg_255_0.furniturePOV = arg_255_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_255_0:RegisterCameraBlendFinished(arg_255_0.cameraFurnitureWatch, function()
		arg_255_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_255_0:emit(var_0_0.SHOW_BLOCK)
	arg_255_0:ActiveCamera(arg_255_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_257_0)
	if arg_257_0.displaySlots then
		arg_257_0:UpdateDisplaySlots({})
		table.Foreach(arg_257_0.displaySlots, function(arg_258_0, arg_258_1)
			local var_258_0 = arg_258_1.trans

			if IsNil(var_258_0:Find("Selector")) then
				return
			end

			setActive(var_258_0:Find("Selector"), false)
		end)

		arg_257_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_259_0, arg_259_1)
	arg_259_0:HideFurnitureSlots()

	arg_259_0.displaySlots = {}

	_.each(arg_259_1, function(arg_260_0)
		arg_259_0.displaySlots[arg_260_0] = arg_259_0.slotDict[arg_260_0]

		if not arg_259_0.displaySlots[arg_260_0] then
			errorMsg("Slot " .. arg_260_0 .. " Not Binding Scene Object")

			return
		end

		local var_260_0 = arg_259_0.displaySlots[arg_260_0].trans

		if var_260_0:Find("Selector") then
			setActive(var_260_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_261_0, arg_261_1)
	table.Foreach(arg_261_0.displaySlots, function(arg_262_0, arg_262_1)
		local var_262_0 = arg_262_1.trans

		if not IsNil(var_262_0:Find("Selector")) then
			setActive(var_262_0:Find("Selector/Normal"), arg_261_1[arg_262_0] == 0)
			setActive(var_262_0:Find("Selector/Active"), arg_261_1[arg_262_0] == 1)
			setActive(var_262_0:Find("Selector/Ban"), arg_261_1[arg_262_0] == 2)
		end

		local var_262_1 = arg_261_0.slotDict[arg_262_0].model
		local var_262_2 = arg_261_0.slotDict[arg_262_0].displayModelName

		if var_262_2 and var_262_2 ~= "" then
			var_262_1 = var_262_0:GetChild(var_262_0.childCount - 1)
		end

		local function var_262_3(arg_263_0, arg_263_1)
			local var_263_0 = arg_263_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_263_0, function(arg_264_0, arg_264_1)
				local var_264_0 = arg_264_1.material

				if var_264_0 and var_264_0:HasProperty("_FinalTint") then
					var_264_0:SetColor("_FinalTint", arg_263_1)
				end
			end)
		end

		if var_262_1 then
			if arg_261_1[arg_262_0] == 1 then
				var_262_3(var_262_1, Color.NewHex("3F83AE73"))
			else
				var_262_3(var_262_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_265_0, arg_265_1, arg_265_2)
	arg_265_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_265_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_266_0)
			arg_265_0:TempHideUI(true, arg_266_0)
		end,
		function(arg_267_0)
			arg_265_0:ShowBlackScreen(true, arg_267_0)
		end,
		function(arg_268_0)
			local var_268_0 = arg_265_0.apartment:GetConfigID()
			local var_268_1 = arg_265_0.ladyDict[var_268_0]

			arg_265_0:SwitchAnim(var_268_1, arg_265_2)
			var_268_1.ladyAnimator:Update(0)
			arg_265_0:ResetCharPoint(var_268_1, arg_265_1:GetWatchCameraName())
			arg_265_0:SyncInterestTransform(var_268_1)
			setActive(var_268_1.ladySafeCollider, true)
			arg_265_0:HideCharacter(var_268_0)

			local var_268_2 = arg_265_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_268_3 = var_268_2.m_XAxis

			var_268_3.Value = 180
			var_268_2.m_XAxis = var_268_3

			local var_268_4 = var_268_2.m_YAxis

			var_268_4.Value = 0.7
			var_268_2.m_YAxis = var_268_4
			arg_265_0.pinchValue = 1

			arg_265_0:RegisterOrbits(arg_265_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_265_0:SetCameraObrits()
			setActive(arg_265_0.restrictedBox, true)
			arg_265_0:RegisterCameraBlendFinished(var_268_2, arg_268_0)
			arg_265_0:ActiveCamera(var_268_2)
		end,
		function(arg_269_0)
			arg_265_0:ShowBlackScreen(false, arg_269_0)
		end
	}, function()
		arg_265_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_271_0)
	arg_271_0:emit(var_0_0.SHOW_BLOCK)
	arg_271_0:EnableJoystick(false)
	seriesAsync({
		function(arg_272_0)
			arg_271_0:ShowBlackScreen(true, arg_272_0)
		end,
		function(arg_273_0)
			arg_271_0:RevertCameraOrbit()

			local var_273_0 = arg_271_0:GetCurrentLadyEnv()

			arg_271_0:SwitchAnim(var_273_0, var_0_0.ANIM.IDLE)
			setActive(var_273_0.ladySafeCollider, false)
			onNextTick(function()
				arg_271_0:ChangeCharacterPosition(var_273_0)
			end)

			if arg_271_0.contextData.photoFreeMode then
				arg_271_0:EnablePOVLayer(false)

				arg_271_0.contextData.photoFreeMode = nil
			end

			setActive(arg_271_0.restrictedBox, false)

			local var_273_1 = arg_271_0.cameras[var_0_0.CAMERA.POV]

			arg_271_0:RegisterCameraBlendFinished(var_273_1, arg_273_0)
			arg_271_0:ActiveCamera(var_273_1)
		end,
		function(arg_275_0)
			arg_271_0:RevertCharacter(arg_271_0.apartment:GetConfigID())
			arg_271_0:ShowBlackScreen(false, arg_275_0)
		end
	}, function()
		arg_271_0:RefreshSlots()
		arg_271_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_271_0:emit(var_0_0.HIDE_BLOCK)
		arg_271_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_271_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_277_0, arg_277_1, arg_277_2, arg_277_3)
	arg_277_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_278_0)
			arg_277_0:ShowBlackScreen(true, arg_278_0)
		end,
		function(arg_279_0)
			local var_279_0 = arg_277_0:GetCurrentLadyEnv()

			arg_277_0:SwitchAnim(var_279_0, arg_277_2)
			onNextTick(function()
				arg_277_0:ResetCharPoint(var_279_0, arg_277_1:GetWatchCameraName())
				arg_277_0:SyncInterestTransform(var_279_0)

				if arg_277_0.contextData.photoFreeMode then
					arg_277_0.camBrain.enabled = false

					arg_277_0:SwitchPhotoCamera()

					arg_277_0.camBrain.enabled = true

					onDelayTick(function()
						arg_277_0.camBrain.enabled = false

						arg_277_0:SwitchPhotoCamera()

						arg_277_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_279_0()
			end)
		end,
		function(arg_282_0)
			arg_277_0:ShowBlackScreen(false, arg_282_0)
		end
	}, function()
		arg_277_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_277_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_284_0)
	if not arg_284_0.contextData.photoFreeMode then
		arg_284_0:EnableJoystick(false)
		arg_284_0:EnablePOVLayer(true)

		local var_284_0 = arg_284_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
		local var_284_1 = arg_284_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_284_2 = arg_284_0.mainCameraTF.rotation:ToEulerAngles()
		local var_284_3 = var_284_1.m_HorizontalAxis

		var_284_3.Value = var_284_2.y
		var_284_1.m_HorizontalAxis = var_284_3

		local var_284_4 = var_284_1.m_VerticalAxis

		var_284_4.Value = arg_284_0:GetNearestAngle(var_284_2.x, var_284_4.m_MinValue, var_284_4.m_MaxValue)
		var_284_1.m_VerticalAxis = var_284_4

		local var_284_5 = arg_284_0.mainCameraTF.position
		local var_284_6 = arg_284_0:GetRestritedHeightRange()
		local var_284_7 = math.InverseLerp(var_284_6[1], var_284_6[2], var_284_5.y)

		var_284_5.y = math.clamp(var_284_5.y, var_284_6[1], var_284_6[2])
		var_284_0.transform.position = var_284_5

		arg_284_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_284_7)
		arg_284_0:ActiveCamera(arg_284_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_284_0:EnableJoystick(true)
		arg_284_0:EnablePOVLayer(false)
		arg_284_0:ActiveCamera(arg_284_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_284_0.contextData.photoFreeMode = not arg_284_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_285_0, arg_285_1)
	local var_285_0 = arg_285_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
	local var_285_1 = arg_285_0:GetRestritedHeightRange()
	local var_285_2 = math.lerp(var_285_1[1], var_285_1[2], arg_285_1)

	var_285_0:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_285_2 - var_285_0.position.y, 0))
	onNextTick(function()
		local var_286_0 = arg_285_0:GetRestritedHeightRange()
		local var_286_1 = math.InverseLerp(var_286_0[1], var_286_0[2], var_285_0.position.y)

		arg_285_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_286_1)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_287_0)
	local var_287_0 = arg_287_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_287_1 = var_287_0.m_XAxis

	var_287_1.Value = 180
	var_287_0.m_XAxis = var_287_1

	local var_287_2 = var_287_0.m_YAxis

	var_287_2.Value = 0.7
	var_287_0.m_YAxis = var_287_2
end

function var_0_0.ResetCurrentCharPoint(arg_288_0, arg_288_1)
	local var_288_0 = arg_288_0:GetCurrentLadyEnv()

	arg_288_0:ResetCharPoint(var_288_0, arg_288_1)
end

function var_0_0.ResetCharPoint(arg_289_0, arg_289_1, arg_289_2)
	local var_289_0 = arg_289_0.furnitures:Find(arg_289_2 .. "/StayPoint")

	arg_289_1.lady.position = var_289_0.position
	arg_289_1.lady.rotation = var_289_0.rotation
end

function var_0_0.GetNearestAngle(arg_290_0, arg_290_1, arg_290_2, arg_290_3)
	if arg_290_3 < arg_290_2 then
		arg_290_3 = arg_290_3 + 360
	end

	if arg_290_2 <= arg_290_1 and arg_290_1 <= arg_290_3 then
		return arg_290_1
	end

	local var_290_0 = (arg_290_2 + arg_290_3) / 2

	arg_290_1 = var_290_0 - Mathf.DeltaAngle(arg_290_1, var_290_0)
	arg_290_1 = math.clamp(arg_290_1, arg_290_2, arg_290_3)

	return arg_290_1
end

function var_0_0.PlayTimeline(arg_291_0, arg_291_1, arg_291_2)
	local var_291_0 = {}

	if arg_291_0.waitForTimeline then
		table.insert(var_291_0, function(arg_292_0)
			local var_292_0 = arg_291_0.waitForTimeline

			arg_291_0.waitForTimeline = nil

			var_292_0()
			arg_292_0()
		end)
	end

	table.insert(var_291_0, function(arg_293_0)
		arg_291_0:LoadTimelineScene(arg_291_1.name, false, nil, arg_293_0)
	end)

	if arg_291_1.scene and arg_291_1.sceneRoot then
		table.insert(var_291_0, function(arg_294_0)
			arg_291_0:ChangeArtScene(arg_291_1.scene .. "|" .. arg_291_1.sceneRoot, arg_294_0)
		end)
	end

	table.insert(var_291_0, function(arg_295_0)
		local var_295_0 = Dorm3dHxHelper.GetTimelineMainCharacter()

		Dorm3dHxHelper.ShowHolyLight({
			var_295_0
		}, arg_291_0.holyLightRoot)

		local var_295_1 = GameObject.Find("[actor]").transform
		local var_295_2 = var_295_1:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_295_2, function(arg_296_0, arg_296_1)
			GetOrAddComponent(arg_296_1.transform, typeof(DftAniEvent))
		end)

		var_295_0 = var_295_0 or var_295_1:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform

		local var_295_3

		eachChild(GameObject.Find("[camera]").transform, function(arg_297_0)
			if arg_297_0.tag == "MainCamera" then
				var_295_3 = arg_297_0
			end
		end)
		assert(var_295_3, "Missing MainCamera")

		local var_295_4 = GameObject.Find("[sequence]").transform

		arg_291_0.nowTimelinePlayer = TimelinePlayer.New(var_295_4)

		TimelineSupport.InitSubtitle(arg_291_0.nowTimelinePlayer.comDirector, arg_291_0.apartment:GetCallName())
		arg_291_0.nowTimelinePlayer:Register(arg_291_1.time, function(arg_298_0, arg_298_1, arg_298_2)
			switch(arg_298_1.stringParameter, {
				TimelinePause = function()
					arg_298_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_298_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_298_1.intParameter == 0 or arg_298_1.intParameter == arg_298_2.selectIndex then
						arg_298_0:SetTime(arg_298_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_298_2.selectIndex = nil

					if arg_291_1.options then
						local var_302_0 = arg_291_1.options[arg_298_1.intParameter]

						arg_291_0:DoTimelineOption(var_302_0, function(arg_303_0)
							arg_298_2.selectIndex = arg_303_0
							arg_298_2.optionIndex = var_302_0[arg_303_0].flag

							arg_298_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_298_2.selectIndex = nil

					if arg_291_1.touchs then
						local var_304_0 = arg_291_1.touchs[arg_298_1.intParameter]

						arg_291_0:DoTimelineTouch(arg_291_1.touchs[arg_298_1.intParameter], function(arg_305_0)
							arg_298_2.selectIndex = arg_305_0
							arg_298_2.optionIndex = var_304_0[arg_305_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_298_2.selectIndex then
						arg_298_0:RawSetTime(arg_298_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_298_2.selectIndex = arg_298_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_291_0.canTriggerAccompanyPerformance then
						arg_291_0.canTriggerAccompanyPerformance = false

						local var_308_0 = arg_291_1.accompanys[arg_298_1.intParameter]
						local var_308_1 = var_308_0[math.random(#var_308_0)]

						arg_298_0:SetTime(var_308_1)
					end
				end,
				TimelineIKStart = function()
					arg_298_2.selectIndex = nil

					local var_309_0 = arg_298_1.intParameter
					local var_309_1 = arg_291_0:GetCurrentLadyEnv()

					if var_309_1:CheckIkTimelineStatus(var_309_0) then
						arg_291_0:SetIKTimelineStatus(var_309_1, var_295_0.gameObject, var_309_0, var_295_3)
					end
				end,
				TimelineEnd = function()
					arg_298_2.finish = true

					arg_298_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_298_1.stringParameter)
			end)

			if arg_298_2.finish then
				arg_291_0.timelineMark = arg_298_2
				arg_291_0.timelineFinishCall = nil

				local var_298_0 = arg_291_0:GetCurrentLadyEnv()

				if var_298_0.ikTimelineMode then
					arg_291_0:ExitIKTimelineStatus(var_298_0)
				end

				arg_295_0()
			end
		end)

		function arg_291_0.timelineFinishCall()
			arg_291_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_291_0:HideCharacter()
		setActive(arg_291_0.mainCameraTF, false)
		setActive(var_295_3, true)
		eachChild(arg_291_0.rtTimelineScreen, function(arg_313_0)
			setActive(arg_313_0, false)
		end)
		setActive(arg_291_0.rtTimelineScreen, true)
		setActive(arg_291_0.rtTimelineScreen:Find("btn_skip"), arg_291_0.inReplayTalk)
		arg_291_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_291_0, function(arg_314_0)
		arg_291_0:ShowBlackScreen(true, function()
			arg_291_0.nowTimelinePlayer:Stop()
			arg_291_0.nowTimelinePlayer:Dispose()

			arg_291_0.nowTimelinePlayer = nil

			arg_291_0:UnloadTimelineScene(arg_291_1.name, false, arg_314_0)
		end)
	end)

	local var_291_1 = arg_291_0.dormSceneMgr.artSceneInfo

	table.insert(var_291_0, function(arg_316_0)
		arg_291_0:RevertArtScene(var_291_1, arg_316_0)
	end)
	seriesAsync(var_291_0, function()
		setActive(arg_291_0.rtTimelineScreen, false)
		arg_291_0:RevertCharacter()
		setActive(arg_291_0.mainCameraTF, true)
		arg_291_0:InitHolyLight()

		local var_317_0 = arg_291_0.timelineMark

		arg_291_0.timelineMark = nil

		existCall(arg_291_2, var_317_0, function(arg_318_0)
			arg_291_0:ShowBlackScreen(false, arg_318_0)
		end)
	end)
end

function var_0_0.GetCurrentLadyEnv(arg_319_0)
	if not arg_319_0.apartment then
		return nil
	end

	return arg_319_0.ladyDict[arg_319_0.apartment:GetConfigID()]
end

function var_0_0.PlayCurrentSingleAction(arg_320_0, ...)
	local var_320_0 = arg_320_0:GetCurrentLadyEnv()

	return arg_320_0:PlaySingleAction(var_320_0, ...)
end

function var_0_0.PlaySingleAction(arg_321_0, arg_321_1, arg_321_2, arg_321_3, arg_321_4)
	arg_321_1:PlaySingleAction(arg_321_2, arg_321_3, arg_321_4)
end

function var_0_0.SwitchCurrentAnim(arg_322_0, ...)
	local var_322_0 = arg_322_0:GetCurrentLadyEnv()

	return arg_322_0:SwitchAnim(var_322_0, ...)
end

function var_0_0.SwitchAnim(arg_323_0, arg_323_1, arg_323_2, arg_323_3)
	arg_323_1:SwitchAnim(arg_323_2, arg_323_3)
end

function var_0_0.PlayFaceAnim(arg_324_0, arg_324_1, arg_324_2, arg_324_3)
	arg_324_1:PlayFaceAnim(arg_324_2, arg_324_3)
end

function var_0_0.RegisterAnimCallback(arg_325_0, arg_325_1, arg_325_2)
	arg_325_0:GetCurrentLadyEnv().animCallbacks[arg_325_1] = arg_325_2
end

function var_0_0.SetCharacterAnimSpeed(arg_326_0, arg_326_1)
	local var_326_0 = arg_326_0:GetCurrentLadyEnv()

	var_326_0.ladyAnimator.speed = arg_326_1
	var_326_0.ladyHeadIKComp.blinkSpeed = var_326_0.ladyHeadIKData.blinkSpeed * arg_326_1

	if arg_326_1 > 0 then
		var_326_0.ladyHeadIKComp.DampTime = var_326_0.ladyHeadIKData.DampTime / arg_326_1
	else
		var_326_0.ladyHeadIKComp.DampTime = var_326_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_327_0, arg_327_1)
	if arg_327_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_327_0 = arg_327_1.stringParameter
	local var_327_1 = table.removebykey(arg_327_0.animEventCallbacks, var_327_0)

	existCall(var_327_1)
end

function var_0_0.RegisterAnimEventCallback(arg_328_0, arg_328_1, arg_328_2)
	arg_328_0.animEventCallbacks[arg_328_1] = arg_328_2
end

function var_0_0.PlaySceneItemAnim(arg_329_0, arg_329_1, arg_329_2, arg_329_3)
	arg_329_0.sceneAnimatorDict = arg_329_0.sceneAnimatorDict or {}

	if not arg_329_0.sceneAnimatorDict[arg_329_1] then
		local var_329_0 = pg.dorm3d_scene_animator[arg_329_1]
		local var_329_1 = arg_329_0:GetSceneItem(var_329_0.item_name)

		assert(var_329_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_329_1 .. " " .. var_329_0.item_name)

		if not var_329_1 then
			return
		end

		local var_329_2 = var_329_1:GetComponent(typeof(Animator))

		if not var_329_2 then
			return
		end

		arg_329_0.sceneAnimatorDict[arg_329_1] = {
			trans = var_329_1,
			animator = var_329_2
		}
	end

	if not arg_329_3 and arg_329_0.sceneAnimatorDict[arg_329_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_329_2) then
		return
	end

	arg_329_0.sceneAnimatorDict[arg_329_1].animator:PlayInFixedTime(arg_329_2)
end

function var_0_0.ResetSceneItemAnimators(arg_330_0, arg_330_1)
	if not arg_330_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_330_0.sceneAnimatorDict, function(arg_331_0, arg_331_1)
		if arg_330_1 and table.contains(arg_330_1, arg_331_0) then
			return
		end

		setActive(arg_331_1.trans, false)
		setActive(arg_331_1.trans, true)

		arg_330_0.sceneAnimatorDict[arg_331_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_332_0, arg_332_1, arg_332_2, arg_332_3, arg_332_4, arg_332_5, arg_332_6, arg_332_7)
	local function var_332_0(arg_333_0)
		if arg_332_6 then
			local var_333_0 = arg_333_0:GetComponent(typeof(Animator))

			if var_333_0 then
				var_333_0:Play(arg_332_6)

				var_333_0.speed = arg_332_7
			end
		end
	end

	arg_332_1.extraItems = arg_332_1.extraItems or {}

	if arg_332_1.extraItems[arg_332_2] then
		var_332_0(arg_332_1.extraItems[arg_332_2].trans)

		return
	end

	local var_332_1

	if arg_332_3 == "" then
		var_332_1 = arg_332_1.lady
	elseif arg_332_3 == "scene_root" then
		var_332_1 = arg_332_0.modelRoot
	else
		table.IpairsCArray(arg_332_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_334_0, arg_334_1)
			if arg_334_1.name == arg_332_3 then
				var_332_1 = arg_334_1
			end
		end)
	end

	if not var_332_1 then
		return
	end

	arg_332_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_332_2), "", function(arg_335_0)
		setParent(arg_335_0, var_332_1)

		if arg_332_4 then
			setLocalPosition(arg_335_0, arg_332_4)
		end

		if arg_332_5 then
			setLocalRotation(arg_335_0, arg_332_5)
		end

		var_332_0(arg_335_0)

		arg_332_1.extraItems[arg_332_2] = {
			trans = arg_335_0.transform,
			handler = var_332_1
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_336_0, arg_336_1, arg_336_2)
	if not arg_336_1.extraItems then
		return
	end

	table.Foreach(arg_336_1.extraItems, function(arg_337_0, arg_337_1)
		if arg_336_2 and table.contains(arg_336_2, arg_337_0) then
			return
		end

		arg_336_0.loader:ReturnPrefab(arg_337_1.trans.gameObject)

		arg_336_1.extraItems[arg_337_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_338_0, arg_338_1, arg_338_2)
	arg_338_0.cameraBlendCallbacks[arg_338_1] = arg_338_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_339_0, arg_339_1)
	arg_339_0.cameraBlendCallbacks[arg_339_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_340_0, arg_340_1)
	if not arg_340_1 then
		return
	end

	local var_340_0 = table.removebykey(arg_340_0.cameraBlendCallbacks, arg_340_1)

	existCall(var_340_0)
end

function var_0_0.PlayHeartFX(arg_341_0, arg_341_1)
	local var_341_0 = arg_341_0.ladyDict[arg_341_1]

	setActive(var_341_0.effectHeart, false)
	setActive(var_341_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_342_0, arg_342_1)
	local var_342_0 = arg_342_1.name
	local var_342_1 = arg_342_0.expressionDict[var_342_0]
	local var_342_2 = 5

	if var_342_1 then
		local var_342_3 = var_342_1.timer

		var_342_3:Reset(nil, var_342_2)
		var_342_3:Start()

		if var_342_1.instance then
			setActive(var_342_1.instance, false)
			setActive(var_342_1.instance, true)
		end

		return
	end

	local var_342_4 = {
		name = var_342_0,
		timer = Timer.New(function()
			arg_342_0:RemoveExpression(var_342_0)
		end, var_342_2, 1, true)
	}

	arg_342_0.expressionDict[var_342_0] = var_342_4

	arg_342_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_342_0, var_342_0, function(arg_344_0)
		var_342_4.instance = arg_344_0

		onNextTick(function()
			local var_345_0 = arg_342_0:GetCurrentLadyEnv()

			setParent(arg_344_0, var_345_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_344_0, Vector3(0, 0, -0.2))
		setActive(arg_344_0, false)
		setActive(arg_344_0, true)
	end, var_342_4)
end

function var_0_0.RemoveExpression(arg_346_0, arg_346_1)
	local var_346_0 = arg_346_0.expressionDict[arg_346_1]

	if not var_346_0 then
		return
	end

	arg_346_0.loader:ClearRequest(var_346_0)

	if var_346_0.instance then
		arg_346_0.loader:ReturnPrefab(var_346_0.instance)
	end

	arg_346_0.expressionDict[arg_346_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_347_0, arg_347_1, arg_347_2)
	setActive(arg_347_1.ladyWatchFloat, arg_347_2)
end

function var_0_0.RegisterGlobalVolume(arg_348_0)
	local var_348_0 = arg_348_0.globalVolume
	local var_348_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_348_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_348_2 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_348_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	arg_348_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_348_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_348_1.gaussianStart.min,
				value = var_348_1.gaussianStart.value
			},
			blurRadius = {
				min = var_348_1.blurRadius.min,
				max = var_348_1.blurRadius.max,
				value = var_348_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_348_2.postExposure.value
		},
		contrast = {
			min = var_348_2.contrast.min,
			max = var_348_2.contrast.max,
			value = var_348_2.contrast.value
		},
		saturate = {
			min = var_348_2.saturation.min,
			max = var_348_2.saturation.max,
			value = var_348_2.saturation.value
		}
	}
	arg_348_0.originalCameraSettings.depthOfField.enabled = true

	local var_348_3 = var_348_0:GetComponent(typeof(UnityEngine.Rendering.Volume))

	arg_348_0.originalVolume = {
		profile = var_348_3.sharedProfile,
		weight = var_348_3.weight
	}
end

function var_0_0.SettingCamera(arg_349_0, arg_349_1)
	arg_349_0.activeCameraSettings = arg_349_1

	local var_349_0 = arg_349_0.globalVolume
	local var_349_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_349_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_349_2 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_349_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	var_349_1.enabled:Override(arg_349_1.depthOfField.enabled)
	var_349_1.gaussianStart:Override(arg_349_1.depthOfField.focusDistance.value)
	var_349_1.gaussianEnd:Override(arg_349_1.depthOfField.focusDistance.value + arg_349_1.depthOfField.focusDistance.length)
	var_349_1.blurRadius:Override(arg_349_1.depthOfField.blurRadius.value)
	var_349_2.postExposure:Override(arg_349_1.postExposure.value)
	var_349_2.contrast:Override(arg_349_1.contrast.value)
	var_349_2.saturation:Override(arg_349_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_350_0)
	return arg_350_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_351_0)
	arg_351_0:SettingCamera(arg_351_0.originalCameraSettings)

	arg_351_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_352_0, arg_352_1, arg_352_2)
	if arg_352_0.cameraVolume then
		arg_352_0:RevertVolumeProfile()
	end

	arg_352_0.loader:GetPrefab("dorm3d/effect/volume/" .. arg_352_1, "", function(arg_353_0)
		arg_352_0.cameraVolume = arg_353_0
	end)
end

function var_0_0.RevertVolumeProfile(arg_354_0)
	if arg_354_0.cameraVolume then
		arg_354_0.loader:ReturnPrefab(arg_354_0.cameraVolume)

		arg_354_0.cameraVolume = nil
	end
end

function var_0_0.RecordCharacterLight(arg_355_0)
	tolua.loadassembly("Yongshi.BLRP.Runtime.AOT")

	local var_355_0 = arg_355_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	arg_355_0.originalCharacterColor = {
		color = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_355_0),
		intensity = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_355_0)
	}
end

function var_0_0.SetCharacterLight(arg_356_0, arg_356_1, arg_356_2, arg_356_3)
	local var_356_0 = arg_356_0.characterLight:GetComponent(typeof(Light))
	local var_356_1 = Color.Lerp(arg_356_0.originalCharacterColor.color, arg_356_1, arg_356_3)
	local var_356_2 = math.lerp(arg_356_0.originalCharacterColor.intensity, arg_356_2, arg_356_3)
	local var_356_3 = arg_356_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_356_3, var_356_1)
	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_356_3, var_356_2)
end

function var_0_0.RevertCharacterLight(arg_357_0)
	arg_357_0:SetCharacterLight(arg_357_0.originalCharacterColor.color, arg_357_0.originalCharacterColor.intensity, 1)
end

function var_0_0.onBackPressed(arg_358_0)
	if arg_358_0.exited or arg_358_0.retainCount > 0 then
		-- block empty
	else
		arg_358_0:closeView()
	end
end

function var_0_0.LoadTimelineScene(arg_359_0, arg_359_1, arg_359_2, arg_359_3, arg_359_4)
	arg_359_0.dormSceneMgr:LoadTimelineScene({
		name = arg_359_1,
		assetRootName = arg_359_0.apartment:getConfig("asset_name"),
		isCache = arg_359_2,
		waitForTimeline = arg_359_3,
		loadSceneFunc = function(arg_360_0, arg_360_1)
			local var_360_0 = Dorm3dHxHelper.GetTimelineMainCharacter()

			arg_359_0:HXCharacter(var_360_0)
		end
	}, arg_359_4)
end

function var_0_0.UnloadTimelineScene(arg_361_0, arg_361_1, arg_361_2, arg_361_3)
	arg_361_0.dormSceneMgr:UnloadTimelineScene(arg_361_1, arg_361_2, arg_361_3)
end

function var_0_0.ChangeArtScene(arg_362_0, arg_362_1, arg_362_2)
	local var_362_0 = {}

	table.insert(var_362_0, function(arg_363_0)
		arg_362_0.dormSceneMgr:ChangeArtScene(arg_362_1, arg_363_0)
	end)
	table.insert(var_362_0, function(arg_364_0)
		setActive(arg_362_0.slotRoot, false)
		arg_364_0()
	end)
	warning(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", arg_362_1, arg_362_0.dormSceneMgr.sceneInfo, Dorm3dSceneMgr.IsSameSceneInfo(arg_362_1, arg_362_0.dormSceneMgr.sceneInfo))

	if Dorm3dSceneMgr.IsSameSceneInfo(arg_362_1, arg_362_0.dormSceneMgr.sceneInfo) then
		table.insert(var_362_0, function(arg_365_0)
			arg_362_0:SwitchDayNight(1)
			arg_362_0:TempHideContact(true)
			arg_365_0()
		end)
	end

	seriesAsync(var_362_0, arg_362_2)
end

function var_0_0.RevertArtScene(arg_366_0, arg_366_1, arg_366_2)
	local var_366_0 = {}

	table.insert(var_366_0, function(arg_367_0)
		arg_366_0.dormSceneMgr:ChangeArtScene(arg_366_1, arg_367_0)
	end)
	table.insert(var_366_0, function(arg_368_0)
		setActive(arg_366_0.slotRoot, true)
		arg_368_0()
	end)
	table.insert(var_366_0, function(arg_369_0)
		arg_366_0:SwitchDayNight(arg_366_0.contextData.timeIndex)
		onNextTick(function()
			arg_366_0:RefreshSlots()
			arg_366_0:TempHideContact(false)
			arg_369_0()
		end)
	end)
	seriesAsync(var_366_0, arg_366_2)
end

function var_0_0.ChangeSubScene(arg_371_0, arg_371_1, arg_371_2)
	local var_371_0 = {}

	table.insert(var_371_0, function(arg_372_0)
		arg_371_0.dormSceneMgr:ChangeSubScene(arg_371_1, arg_372_0)
	end)

	local var_371_1 = arg_371_0:GetCurrentLadyEnv()

	table.insert(var_371_0, function(arg_373_0)
		if Dorm3dSceneMgr.IsSameSceneInfo(arg_371_1, arg_371_0.dormSceneMgr.sceneInfo) then
			var_371_1.ladyActiveZone = var_371_1.walkBornPoint or var_371_1.ladyBaseZone
		else
			var_371_1.ladyActiveZone = var_371_1.walkBornPoint or "Default"
		end

		arg_373_0()
	end)

	if not Dorm3dSceneMgr.IsSameSceneInfo(arg_371_1, arg_371_0.dormSceneMgr.subSceneInfo) then
		table.insert(var_371_0, function(arg_374_0)
			local var_374_0, var_374_1 = Dorm3dSceneMgr.ParseInfo(arg_371_1)
			local var_374_2 = var_374_0 .. "_base"

			arg_371_0:ResetSceneStructure(SceneManager.GetSceneByName(var_374_2))

			if Dorm3dSceneMgr.IsSameSceneInfo(arg_371_1, arg_371_0.dormSceneMgr.sceneInfo) then
				arg_371_0:RefreshSlots()
			else
				arg_371_0:SwitchAnim(var_371_1, var_0_0.ANIM.IDLE)
			end

			if not Dorm3dSceneMgr.IsSameSceneInfo(arg_371_0.dormSceneMgr.subSceneInfo, arg_371_0.dormSceneMgr.sceneInfo) then
				arg_371_0:RefreshSlotsEmpty()
			end

			arg_374_0()
		end)
	end

	table.insert(var_371_0, function(arg_375_0)
		onNextTick(function()
			arg_371_0:ChangeCharacterPosition(var_371_1)
			arg_371_0:ChangePlayerPosition(var_371_1.ladyActiveZone)
			arg_371_0:TriggerLadyDistance()
			arg_371_0:CheckInSector()
			arg_375_0()
		end)
	end)
	seriesAsync(var_371_0, arg_371_2)
end

function var_0_0.IsPointInSector(arg_377_0, arg_377_1)
	local var_377_0 = arg_377_1 - arg_377_0.Position

	if var_377_0.y > arg_377_0.Radius then
		return false
	end

	var_377_0.y = 0

	if var_377_0.magnitude > arg_377_0.Radius then
		return false
	end

	local var_377_1 = arg_377_0.Rotation

	return Vector3.Angle(var_377_1 * Vector3.forward, var_377_0) <= arg_377_0.Angle / 2
end

function var_0_0.GetRestritedHeightRange(arg_378_0)
	if not arg_378_0.isMultiFloor then
		return arg_378_0.restrictedHeightRange
	else
		for iter_378_0 = #arg_378_0.restrictedHeightRange, 1, -1 do
			local var_378_0 = arg_378_0.restrictedHeightRange[iter_378_0]

			if arg_378_0.mainCameraTF.position.y >= var_378_0[1] then
				return var_378_0
			end
		end

		return arg_378_0.restrictedHeightRange[1]
	end
end

function var_0_0.willExit(arg_379_0)
	arg_379_0:RemoveExtraSystem()

	if arg_379_0.systemManager then
		arg_379_0.systemManager:Dispose()

		arg_379_0.systemManager = nil
	end

	arg_379_0.joystickTimer:Stop()
	arg_379_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_379_0.updateHandler)
	arg_379_0:StopIKHandTimer()

	if arg_379_0.moveTimer then
		arg_379_0.moveTimer:Stop()

		arg_379_0.moveTimer = nil
	end

	if arg_379_0.moveWaitTimer then
		arg_379_0.moveWaitTimer:Stop()

		arg_379_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_379_0.furnitures) then
		eachChild(arg_379_0.furnitures, function(arg_380_0)
			local var_380_0 = GetComponent(arg_380_0, typeof(EventTriggerListener))

			if not var_380_0 then
				return
			end

			var_380_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_379_0, iter_379_1 in pairs(arg_379_0.ladyDict) do
		GetComponent(iter_379_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_379_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_379_0.camBrainEvenetHandler.OnBlendFinished = nil

	arg_379_0:UnOverlayPanel(arg_379_0.blockLayer, arg_379_0._tf)
	table.Foreach(arg_379_0.expressionDict, function(arg_381_0)
		arg_379_0:RemoveExpression(arg_381_0)
	end)
	arg_379_0.loader:Clear()
	pg.ClickEffectMgr.GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()
	arg_379_0.dormSceneMgr:Dispose()

	arg_379_0.dormSceneMgr = nil

	ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)

	if arg_379_0.transformFilter then
		arg_379_0.transformFilter:Dispose()
	end
end

return var_0_0
