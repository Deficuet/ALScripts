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
var_0_0.STOCKING_EVENT = "Dorm3dRoomTemplateScene.STOCKING_EVENT"
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

	arg_12_0.stockingMgr = Dorm3dStockingMgr.New(arg_12_0.event, arg_12_0)

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
		PlayEnterExtraItem = true,
		SetExtraAnimSpeed = true,
		EnableHeadIK = true,
		ResetCharacterExtraItem = true,
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
	arg_14_0:bind(var_0_0.STOCKING_EVENT, function(arg_30_0, arg_30_1, ...)
		arg_14_0.stockingMgr[arg_30_1](arg_14_0.stockingMgr, ...)
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

function var_0_0.InitCharacter(arg_76_0, arg_76_1, arg_76_2)
	arg_76_1:InitCharacter(arg_76_2)
	arg_76_0:HXCharacter(arg_76_1.lady)
	arg_76_1:SetZone(arg_76_0.contextData.ladyZone[arg_76_2])
	arg_76_0:ChangeCharacterPosition(arg_76_1)
end

function var_0_0.SetCameraLady(arg_77_0, arg_77_1)
	arg_77_0.cameraAim2.LookAt = arg_77_1.ladyInterestRoot
	arg_77_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_77_1.ladyInterestRoot
	arg_77_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_77_1.ladyInterestRoot
	arg_77_0.cameraGift.Follow = arg_77_0.ladyInterest
	arg_77_0.cameraGift.LookAt = arg_77_0.ladyInterest
	arg_77_0.cameraRole2.LookAt = arg_77_1.ladyInterestRoot
	arg_77_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_77_0.ladyInterest
	arg_77_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_77_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_78_0)
	local var_78_0 = pg.NodeCanvasMgr.GetInstance()

	var_78_0:Active()
	var_78_0:RegisterFunc("DistanceTrigger", function(arg_79_0)
		arg_78_0:emit(var_0_0.DISTANCE_TRIGGER, arg_79_0, arg_78_0.ladyDict[arg_79_0].dis)
	end)
	var_78_0:RegisterFunc("ShortWaitAction", function(arg_80_0)
		arg_78_0:DoShortWait(arg_80_0)
	end)
	var_78_0:RegisterFunc("WatchShortWaitAction", function(arg_81_0)
		arg_78_0:DoShortWait(arg_81_0)
	end)
	var_78_0:RegisterFunc("WalkDistanceTrigger", function(arg_82_0)
		arg_78_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_82_0, arg_78_0.ladyDict[arg_82_0].dis)
	end)
	var_78_0:RegisterFunc("ChangeWatch", function(arg_83_0)
		arg_78_0:emit(var_0_0.CHANGE_WATCH, arg_83_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_84_0, arg_84_1, arg_84_2)
	arg_84_0[arg_84_1] = arg_84_2

	for iter_84_0, iter_84_1 in pairs(arg_84_0.ladyDict) do
		arg_84_0:SetBlackboardValue(iter_84_1, arg_84_1, arg_84_2)
	end
end

function var_0_0.SetBlackboardValue(arg_85_0, arg_85_1, arg_85_2, arg_85_3)
	arg_85_1:SetBlackboardValue(arg_85_2, arg_85_3)
end

function var_0_0.GetBlackboardValue(arg_86_0, arg_86_1, arg_86_2)
	return arg_86_1:GetBlackboardValue(arg_86_2)
end

function var_0_0.didEnter(arg_87_0)
	local var_87_0 = -21.6 / Screen.height

	arg_87_0.joystickDelta = Vector2.zero
	arg_87_0.joystickTimer = FrameTimer.New(function()
		local var_88_0 = arg_87_0.joystickDelta * var_87_0
		local var_88_1 = var_88_0.x
		local var_88_2 = var_88_0.y

		local function var_88_3(arg_89_0, arg_89_1, arg_89_2)
			local var_89_0 = arg_89_0[arg_89_1]

			var_89_0.m_InputAxisValue = arg_89_2
			arg_89_0[arg_89_1] = var_89_0
		end

		if arg_87_0.surroudCamera and not arg_87_0.pinchMode then
			var_88_3(arg_87_0.surroudCamera, "m_XAxis", var_88_1)
			var_88_3(arg_87_0.surroudCamera, "m_YAxis", var_88_2)
		elseif arg_87_0.furniturePOV and arg_87_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] and isActive(arg_87_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH]) then
			var_88_3(arg_87_0.furniturePOV, "m_HorizontalAxis", var_88_1)
			var_88_3(arg_87_0.furniturePOV, "m_VerticalAxis", var_88_2)
		end

		arg_87_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_87_0.joystickTimer:Start()

	local var_87_1 = 1.75

	arg_87_0.moveStickTimer = FrameTimer.New(function()
		if not arg_87_0.moveStickDraging then
			return
		end

		local var_90_0 = arg_87_0.moveStickPosition
		local var_90_1 = 200
		local var_90_2 = (var_90_0 - arg_87_0.moveStickOrigin):ClampMagnitude(var_90_1)
		local var_90_3 = var_90_2 / var_90_1

		arg_87_0.moveStickPosition = arg_87_0.moveStickOrigin + var_90_2

		local var_90_4 = Vector3.New(var_90_3.x, 0, var_90_3.y)
		local var_90_5 = arg_87_0.mainCameraTF:TransformDirection(var_90_4)

		var_90_5.y = 0

		local var_90_6 = var_90_5:Normalize()

		var_90_6:Mul(var_87_1)

		if isActive(arg_87_0.cameras[var_0_0.CAMERA.POV]) then
			arg_87_0.playerController:SimpleMove(var_90_6)

			arg_87_0.tweenFOV = true
		elseif isActive(arg_87_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_87_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_90_6 * Time.deltaTime)
			arg_87_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, var_90_3:Normalize())
			onNextTick(function()
				local var_91_0 = arg_87_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_91_1 = arg_87_0:GetRestritedHeightRange()
				local var_91_2 = math.InverseLerp(var_91_1[1], var_91_1[2], var_91_0.position.y)

				arg_87_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_91_2)
			end)
		end
	end, 1, -1)

	arg_87_0.moveStickTimer:Start()

	arg_87_0.pinchMode = false
	arg_87_0.pinchSize = 0
	arg_87_0.pinchValue = 1
	arg_87_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_92_0, arg_92_1)
		if arg_87_0.surroudCamera and isActive(arg_87_0.surroudCamera) then
			arg_87_0.pinchMode = true
			arg_87_0.pinchSize = (arg_92_0 - arg_92_1):Magnitude()
			arg_87_0.pinchNodeOrder = arg_92_1.x < arg_92_0.x and -1 or 1

			return
		end

		if isActive(arg_87_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_92_0 - arg_92_1):Magnitude() < Screen.height * 0.5 then
				arg_87_0.pinchMode = true
				arg_87_0.pinchSize = (arg_92_0 - arg_92_1):Magnitude()
				arg_87_0.pinchNodeOrder = arg_92_1.x < arg_92_0.x and -1 or 1
			end

			return
		end
	end)

	local var_87_2 = 0.01

	if IsUnityEditor then
		var_87_2 = 0.1
	end

	local var_87_3 = var_87_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_93_0, arg_93_1)
		if not arg_87_0.pinchMode then
			return
		end

		local var_93_0 = (arg_93_0 - arg_93_1):Magnitude()
		local var_93_1 = arg_87_0.pinchSize - var_93_0
		local var_93_2 = arg_87_0.pinchNodeOrder * (arg_93_1.x < arg_93_0.x and -1 or 1)
		local var_93_3 = var_93_1 * var_87_3 * var_93_2

		if isActive(arg_87_0.cameras[var_0_0.CAMERA.POV]) then
			local var_93_4 = 0.5
			local var_93_5 = 1

			arg_87_0.pinchValue = math.clamp(arg_87_0.pinchValue + var_93_3, var_93_4, var_93_5)
			arg_87_0.pinchSize = var_93_0

			arg_87_0:SetPOVFOV(arg_87_0.POVOriginalFOV * arg_87_0.pinchValue)

			arg_87_0.tweenFOV = nil

			return
		end

		if isActive(arg_87_0.surroudCamera) and arg_87_0.surroudCamera == arg_87_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_93_6 = 0.5
			local var_93_7 = 1

			arg_87_0:SetPinchValue(math.clamp(arg_87_0.pinchValue + var_93_3, var_93_6, var_93_7))

			arg_87_0.pinchSize = var_93_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_87_0.pinchMode = false
		arg_87_0.pinchSize = 0
	end)

	arg_87_0.cameraBlendCallbacks = {}
	arg_87_0.activeCMCamera = nil

	function arg_87_0.camBrainEvenetHandler.OnBlendStarted(arg_95_0)
		if arg_87_0.activeCMCamera then
			arg_87_0:OnCameraBlendFinished(arg_87_0.activeCMCamera)
		end

		local var_95_0 = arg_87_0.camBrain.ActiveVirtualCamera

		arg_87_0.activeCMCamera = var_95_0
	end

	function arg_87_0.camBrainEvenetHandler.OnBlendFinished(arg_96_0)
		arg_87_0.activeCMCamera = nil

		arg_87_0:OnCameraBlendFinished(arg_96_0)
	end

	arg_87_0.expressionDict = {}

	arg_87_0:OverlayPanel(arg_87_0.blockLayer)
	arg_87_0:ActiveCamera(arg_87_0.cameras[var_0_0.CAMERA.POV])

	local var_87_4
	local var_87_5
	local var_87_6 = arg_87_0.resumeCallback

	function arg_87_0.resumeCallback()
		var_87_5 = true

		if var_87_4 then
			existCall(var_87_6)
		end
	end

	arg_87_0:RefreshSlots(nil, function()
		var_87_4 = true
		arg_87_0.doneFirstSlotFresh = true

		if var_87_5 then
			existCall(var_87_6)
		end
	end)

	arg_87_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_87_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_87_0.updateHandler)
	arg_87_0:InitExtraSystem()
end

function var_0_0.InitExtraSystem(arg_102_0, arg_102_1)
	arg_102_0.systemList = arg_102_0.systemList or {}
	arg_102_1 = arg_102_1 or DormConst.SYSTEM_LIST

	for iter_102_0, iter_102_1 in ipairs(arg_102_1) do
		switch(iter_102_1, {
			[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = function()
				if not SlideExtraSystem.IsOpen(arg_102_0.room) then
					return
				end

				if arg_102_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] then
					return
				end

				arg_102_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = SlideExtraSystem.New(arg_102_0.event, arg_102_0)

				arg_102_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide]:Init()
			end
		})
	end
end

function var_0_0.RemoveExtraSystem(arg_104_0, arg_104_1)
	arg_104_1 = arg_104_1 or DormConst.SYSTEM_LIST

	for iter_104_0, iter_104_1 in ipairs(arg_104_1) do
		switch(iter_104_1, {
			[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = function()
				if not arg_104_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] then
					return
				end

				arg_104_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide]:Dispose()

				arg_104_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = nil
			end
		})
	end
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

function var_0_0.ShiftZone(arg_148_0, arg_148_1, arg_148_2)
	local var_148_0 = arg_148_0:GetFurnitureByName(arg_148_1)

	if not var_148_0 then
		errorMsg(arg_148_1 .. " Not Find")
		existCall(arg_148_2)

		return
	end

	seriesAsync({
		function(arg_149_0)
			arg_148_0:emit(var_0_0.SHOW_BLOCK)
			arg_148_0:ShowBlackScreen(true, arg_149_0)
		end,
		function(arg_150_0)
			if arg_148_0.shiftLady or arg_148_0.room:isPersonalRoom() then
				local var_150_0 = arg_148_0.shiftLady or arg_148_0.apartment:GetConfigID()

				arg_148_0.shiftLady = nil
				arg_148_0.contextData.ladyZone[var_150_0] = var_148_0.name

				local var_150_1 = arg_148_0.ladyDict[var_150_0]

				var_150_1:SetZone(arg_148_0.contextData.ladyZone[var_150_0])

				if arg_148_0:GetBlackboardValue(var_150_1, "inPending") then
					arg_148_0:SetOutPending(var_150_1)
					arg_148_0:SwitchAnim(var_150_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_148_0:ChangeCharacterPosition(var_150_1)
						arg_150_0()
					end)
				else
					arg_148_0:ChangeCharacterPosition(var_150_1)
					arg_150_0()
				end
			else
				arg_150_0()
			end
		end,
		function(arg_152_0)
			arg_148_0.contextData.inFurnitureName = var_148_0.name

			if SlideExtraSystem.IsOpen(arg_148_0.room) and arg_148_0.contextData.inFurnitureName == SlideConst.SLIDE_ZONE then
				arg_148_0:SyncInterestTransformByTf(var_148_0.transform:Find("StayPoint"))
			elseif not arg_148_0.apartment then
				for iter_152_0, iter_152_1 in pairs(arg_148_0.ladyDict) do
					if iter_152_1.ladyBaseZone == arg_148_0.contextData.inFurnitureName then
						arg_148_0:SyncInterestTransform(iter_152_1)

						break
					end
				end
			end

			arg_148_0:ChangePlayerPosition()
			arg_148_0:TriggerLadyDistance()
			arg_148_0:CheckInSector()
			arg_152_0()
		end,
		function(arg_153_0)
			arg_148_0:UpdateZoneList()
			arg_148_0:ShowBlackScreen(false, arg_153_0)
		end,
		function(arg_154_0)
			arg_148_0:emit(var_0_0.HIDE_BLOCK)
			arg_154_0()
		end
	}, arg_148_2)
end

function var_0_0.ActiveCamera(arg_155_0, arg_155_1)
	local var_155_0 = isActive(arg_155_1)

	table.Foreach(arg_155_0.cameras, function(arg_156_0, arg_156_1)
		setActive(arg_156_1, arg_156_1 == arg_155_1)
	end)

	if var_155_0 then
		arg_155_0:OnCameraBlendFinished(arg_155_1)
	end
end

function var_0_0.ActiveCameraByName(arg_157_0, arg_157_1)
	local var_157_0 = arg_157_0.cameraRoot:Find(arg_157_1)

	assert(var_157_0, "ActiveCameraByName: " .. arg_157_1 .. " not found")
	table.Foreach(arg_157_0.cameras, function(arg_158_0, arg_158_1)
		setActive(arg_158_1, false)
	end)
	setActive(var_157_0, true)

	arg_157_0.cameras[var_0_0.CAMERA.CUSTOM] = var_157_0
end

function var_0_0.ShowBlackScreen(arg_159_0, arg_159_1, arg_159_2)
	local var_159_0 = arg_159_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_159_1 and 0 or 0.3
	}

	setImageColor(arg_159_0.blackLayer, Color.NewHex(var_159_0.color))
	setActive(arg_159_0.blackLayer, true)
	setCanvasGroupAlpha(arg_159_0.blackLayer, arg_159_1 and 0 or 1)
	arg_159_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_159_1 then
			setActive(arg_159_0.blackLayer, false)
		end

		existCall(arg_159_2)
	end, GetComponent(arg_159_0.blackLayer, typeof(CanvasGroup)), arg_159_1 and 1 or 0, var_159_0.time):setDelay(var_159_0.delay)
end

function var_0_0.RegisterOrbits(arg_161_0, arg_161_1)
	arg_161_0 = arg_161_0.scene
	arg_161_0.orbits = {
		original = arg_161_1.m_Orbits
	}
	arg_161_0.orbits.current = _.range(3):map(function(arg_162_0)
		local var_162_0 = arg_161_0.orbits.original[arg_162_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_162_0.m_Height, var_162_0.m_Radius)
	end)
	arg_161_0.surroudCamera = arg_161_1
end

function var_0_0.SetCameraObrits(arg_163_0)
	arg_163_0 = arg_163_0.scene

	local var_163_0 = arg_163_0.surroudCamera

	if not var_163_0 then
		return
	end

	local var_163_1 = arg_163_0.orbits.original[1]

	for iter_163_0 = 0, #arg_163_0.orbits.current - 1 do
		local var_163_2 = arg_163_0.orbits.current[iter_163_0 + 1]
		local var_163_3 = arg_163_0.orbits.original[iter_163_0]

		var_163_2.m_Height = math.lerp(var_163_1.m_Height, var_163_3.m_Height, arg_163_0.pinchValue)
		var_163_2.m_Radius = var_163_3.m_Radius * arg_163_0.pinchValue
	end

	var_163_0.m_Orbits = arg_163_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_164_0)
	arg_164_0 = arg_164_0.scene

	local var_164_0 = arg_164_0.surroudCamera

	if not var_164_0 then
		return
	end

	for iter_164_0 = 0, #arg_164_0.orbits.current - 1 do
		local var_164_1 = arg_164_0.orbits.current[iter_164_0 + 1]
		local var_164_2 = arg_164_0.orbits.original[iter_164_0]

		var_164_1.m_Height = var_164_2.m_Height
		var_164_1.m_Radius = var_164_2.m_Radius
	end

	var_164_0.m_Orbits = arg_164_0.orbits.current
	arg_164_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_165_0, arg_165_1, arg_165_2)
	local var_165_0 = {
		base = function(arg_166_0)
			arg_165_0:RegisterCameraBlendFinished(arg_165_0.cameras[var_0_0.CAMERA.POV], arg_166_0)
			arg_165_0:ActiveCamera(arg_165_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_167_0)
			assert(arg_165_0.apartment)
			arg_165_0:SyncInterestTransform(arg_165_0:GetCurrentLadyEnv())
			arg_165_0:SetCameraLady(arg_165_0:GetCurrentLadyEnv())
			arg_165_0:RegisterCameraBlendFinished(arg_165_0.cameras[var_0_0.CAMERA.ROLE], arg_167_0)
			arg_165_0:ActiveCamera(arg_165_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_168_0)
			arg_165_0:RegisterCameraBlendFinished(arg_165_0.cameras[var_0_0.CAMERA.POV], arg_168_0)
			arg_165_0:ActiveCamera(arg_165_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_169_0)
			arg_169_0()
		end,
		gift = function(arg_170_0)
			assert(arg_165_0.apartment)
			arg_165_0:SetCameraLady(arg_165_0:GetCurrentLadyEnv())
			arg_165_0:RegisterCameraBlendFinished(arg_165_0.cameras[var_0_0.CAMERA.GIFT], arg_170_0)
			arg_165_0:ActiveCamera(arg_165_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_171_0)
			assert(arg_165_0.apartment)
			arg_165_0:SetCameraLady(arg_165_0:GetCurrentLadyEnv())

			arg_165_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_165_0.cameraRole.transform.position

			arg_165_0:RegisterCameraBlendFinished(arg_165_0.cameras[var_0_0.CAMERA.ROLE2], arg_171_0)
			arg_165_0:ActiveCamera(arg_165_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_172_0)
			assert(arg_165_0.apartment)
			arg_165_0:SetCameraLady(arg_165_0:GetCurrentLadyEnv())
			arg_165_0:SyncInterestTransform(arg_165_0:GetCurrentLadyEnv())
			arg_165_0:RegisterCameraBlendFinished(arg_165_0.cameras[var_0_0.CAMERA.TALK], arg_172_0)
			arg_165_0:ActiveCamera(arg_165_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_165_1 = {}

	table.insert(var_165_1, function(arg_173_0)
		switch(arg_165_1, var_165_0, arg_173_0, arg_173_0)
	end)
	seriesAsync(var_165_1, arg_165_2)
end

function var_0_0.GetSceneItem(arg_174_0, arg_174_1)
	local var_174_0

	if string.find(arg_174_1, "FurnitureSlots/") == 1 then
		arg_174_1 = string.gsub(arg_174_1, "^FurnitureSlots/", "", 1)
		var_174_0 = arg_174_0.slotRoot:Find(arg_174_1)
	else
		var_174_0 = arg_174_0.modelRoot:Find(arg_174_1)
	end

	if not var_174_0 then
		warning(string.format("Missing scene item path: %s", arg_174_1))
	end

	return var_174_0
end

function var_0_0.SetSceneAnimSpeed(arg_175_0, arg_175_1, arg_175_2)
	table.Ipairs(arg_175_1 or {}, function(arg_176_0, arg_176_1)
		if arg_175_0.sceneAnimatorDict[arg_176_1] then
			arg_175_0.sceneAnimatorDict[arg_176_1].animator.speed = arg_175_2
		end
	end)
end

function var_0_0.SetExtraAnimSpeed(arg_177_0, arg_177_1, arg_177_2, arg_177_3)
	table.Ipairs(arg_177_2 or {}, function(arg_178_0, arg_178_1)
		local var_178_0 = arg_178_1[1]

		if arg_177_1.extraItems[var_178_0] then
			arg_177_1.extraItems[var_178_0].trans:GetComponent(typeof(Animator)).speed = arg_177_3
		end
	end)
end

function var_0_0.PlayEnterSceneAnim(arg_179_0, arg_179_1, arg_179_2, arg_179_3)
	arg_179_3 = arg_179_3 or 1

	local var_179_0 = {}

	if arg_179_1 and #arg_179_1 > 0 then
		table.Ipairs(arg_179_1, function(arg_180_0, arg_180_1)
			arg_179_0:PlaySceneItemAnim(arg_180_1[1], arg_180_1[2], arg_179_2)
			arg_179_0:SetSceneAnimSpeed({
				arg_180_1[1]
			}, arg_179_3)
			table.insert(var_179_0, arg_180_1[1])
		end)
	end

	arg_179_0:ResetSceneItemAnimators(var_179_0)
end

function var_0_0.PlayEnterExtraItem(arg_181_0, arg_181_1, arg_181_2, arg_181_3)
	arg_181_3 = arg_181_3 or 1

	local var_181_0 = {}

	if arg_181_2 and #arg_181_2 > 0 then
		table.Ipairs(arg_181_2, function(arg_182_0, arg_182_1)
			local var_182_0 = arg_182_1[3] and Vector3.New(unpack(arg_182_1[3]))
			local var_182_1 = arg_182_1[4] and Quaternion.Euler(unpack(arg_182_1[4]))
			local var_182_2 = #arg_182_1 > 4 and arg_182_1[5] or nil

			arg_181_0:LoadCharacterExtraItem(arg_181_1, arg_182_1[1], arg_182_1[2], var_182_0, var_182_1, var_182_2, arg_181_3)
			table.insert(var_181_0, arg_182_1[1])
		end)
	end

	arg_181_0:ResetCharacterExtraItem(arg_181_1, var_181_0)
end

function var_0_0.HideSceneItem(arg_183_0, arg_183_1, arg_183_2)
	if arg_183_2 and #arg_183_2 > 0 then
		if arg_183_1.tempHideSceneItems and #arg_183_1.tempHideSceneItems > 0 then
			arg_183_0:ResetTempHideSceneItems(arg_183_1, arg_183_2)
		end

		arg_183_1.tempHideSceneItems = {}

		table.Ipairs(arg_183_2, function(arg_184_0, arg_184_1)
			local var_184_0 = arg_183_0:GetSceneItem(arg_184_1)

			setActive(var_184_0, false)
			table.insert(arg_183_1.tempHideSceneItems, arg_184_1)
		end)
	end
end

function var_0_0.ResetTempHideSceneItems(arg_185_0, arg_185_1, arg_185_2)
	arg_185_2 = arg_185_2 or {}

	if arg_185_1.tempHideSceneItems and #arg_185_1.tempHideSceneItems > 0 then
		table.Ipairs(arg_185_1.tempHideSceneItems, function(arg_186_0, arg_186_1)
			if table.contains(arg_185_2, arg_186_1) then
				return
			end

			local var_186_0 = arg_185_0:GetSceneItem(arg_186_1)

			setActive(var_186_0, true)
		end)

		arg_185_1.tempHideSceneItems = nil
	end
end

function var_0_0.SetIKStatus(arg_187_0, arg_187_1, arg_187_2, arg_187_3, arg_187_4)
	warning("Set IKStatus " .. (arg_187_2.id or "NIL"))

	arg_187_0.enableIKTip = true

	arg_187_0:ResetIKTipTimer()
	setActive(arg_187_1.ladyCollider, false)
	_.each(arg_187_1.ladyTouchColliders, function(arg_188_0)
		setActive(arg_188_0, true)
	end)

	arg_187_0.blockIK = nil

	arg_187_0:ClearIkTouchEvents(arg_187_1)

	arg_187_1.currentIkStatus = arg_187_2.id
	arg_187_1.ikActionDict = {}
	arg_187_1.readyIKLayers = {}
	arg_187_1.iKTouchDatas = arg_187_2.touch_data or {}
	arg_187_1.IKSettings = {
		Colliders = arg_187_1.ladyColliders,
		CameraRaycaster = arg_187_0.sceneRaycaster
	}

	local var_187_0 = table.shallowCopy(arg_187_2.ik_id)
	local var_187_1 = {}

	_.each(arg_187_1.iKTouchDatas, function(arg_189_0)
		local var_189_0 = arg_189_0[3]

		if var_189_0[1] == 7 then
			local var_189_1 = pg.dorm3d_ik_touch_move[var_189_0[2]]
			local var_189_2 = var_189_1.target_ik

			if not _.detect(var_187_0, function(arg_190_0)
				return arg_190_0[1] == var_189_2
			end) then
				var_187_1[var_189_2] = {
					back_time = var_189_1.back_time
				}

				local var_189_3 = {
					var_189_2,
					0,
					{}
				}

				if var_189_1.trigger_dialogue > 0 then
					var_189_3[3] = {
						4,
						0,
						var_189_1.trigger_dialogue
					}
				end

				table.insert(var_187_0, var_189_3)
			end
		end
	end)

	local var_187_2 = _.map(var_187_0, function(arg_191_0)
		local var_191_0 = Dorm3dIK.New({
			configId = arg_191_0[1]
		})
		local var_191_1 = arg_191_0[3]
		local var_191_2 = var_191_1[1]
		local var_191_3 = switch(var_191_2, {
			function(arg_192_0, arg_192_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_194_0, arg_194_1)
				return arg_194_0
			end,
			function(arg_195_0, arg_195_1)
				return arg_195_0
			end,
			function(arg_196_0, arg_196_1, arg_196_2, arg_196_3)
				return arg_196_0
			end,
			function(arg_197_0)
				return 0
			end
		}, function(arg_198_0)
			return type(arg_198_0) == "number" and arg_198_0 or 0
		end, unpack(var_191_1, 2))

		table.insert(arg_187_1.readyIKLayers, var_191_0)

		arg_187_1.ikActionDict[var_191_0:GetControllerPath()] = var_191_1

		local var_191_4 = var_191_0:GetRevertTime()
		local var_191_5 = var_187_1[var_191_0:GetConfigID()]
		local var_191_6 = tobool(var_191_5)

		if var_191_6 then
			var_191_3 = var_191_5.back_time
			var_191_4 = var_191_5.back_time
			var_191_0.ignoreDrag = true
		end

		local var_191_7 = var_191_0:GetSubTargets()
		local var_191_8 = var_191_0:GetPlaneRotations()
		local var_191_9 = var_191_0:GetPlaneScales()
		local var_191_10 = _.map(_.range(#var_191_7), function(arg_199_0)
			return {
				name = var_191_7[arg_199_0][1],
				planeRot = var_191_8[arg_199_0],
				planeScale = var_191_9[arg_199_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_191_0:getConfig("trigger_param")[2],
			controllerName = var_191_0:GetControllerPath(),
			subTargets = var_191_10,
			actionType = var_191_0:GetActionTriggerParams()[1],
			controlRect = var_191_0:GetRect(),
			actionRect = var_191_0:GetTriggerRect(),
			backTime = var_191_4,
			actionRevertTime = var_191_3,
			ignoreDrag = var_191_6
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_187_1.ladyIKRoot, arg_187_1.ladyBoneMaps)
	arg_187_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_187_2)

	local var_187_3 = _.map(arg_187_1.iKTouchDatas, function(arg_200_0)
		return arg_200_0[1]
	end)

	table.Foreach(var_187_3, function(arg_201_0, arg_201_1)
		local var_201_0 = pg.dorm3d_ik_touch[arg_201_1]

		if #var_201_0.scene_item == 0 then
			return
		end

		local var_201_1 = arg_187_0:GetSceneItem(var_201_0.scene_item)

		if not var_201_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_201_1, var_201_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_201_1, typeof(UnityEngine.Collider))) then
			go(var_201_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_201_2 = GetOrAddComponent(var_201_1, typeof(EventTriggerListener))

		var_201_2.enabled = true

		var_201_2:AddPointClickFunc(function()
			arg_187_0.blockIK = true

			local var_202_0 = arg_187_1.iKTouchDatas[arg_201_0]
			local var_202_1, var_202_2, var_202_3 = unpack(var_202_0)

			arg_187_0:TouchModeAction(arg_187_1, var_202_1, unpack(var_202_3))(function()
				arg_187_0.enableIKTip = true

				arg_187_0:ResetIKTipTimer()

				arg_187_0.blockIK = nil
			end)
		end)
	end)

	arg_187_0.camBrain.enabled = false

	if arg_187_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_187_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_187_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_187_4 = arg_187_0.cameraRoot:Find(arg_187_2.ik_camera)

	assert(var_187_4, "Missing IKCamera")

	arg_187_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_187_4

	arg_187_0:ActiveCamera(arg_187_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_187_0.camBrain.enabled = true

	local var_187_5 = var_187_4:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_187_5 then
		arg_187_0:RegisterOrbits(var_187_5)
	else
		arg_187_0:RevertCameraOrbit()
	end

	arg_187_0:SwitchAnim(arg_187_1, arg_187_2.character_action)
	arg_187_0:SettingHeadAimIK(arg_187_1, arg_187_2.head_track)
	arg_187_1:EnableCloth(false)
	arg_187_1:EnableCloth(arg_187_2.use_cloth, arg_187_2.cloth_colliders)
	arg_187_0:PlayEnterSceneAnim(arg_187_2.enter_scene_anim)
	arg_187_0:PlayEnterExtraItem(arg_187_1, arg_187_2.enter_extra_item)
	arg_187_0:HideSceneItem(arg_187_1, arg_187_2.hide_scene_item)
	eachChild(arg_187_0.ikTextTipsRoot, function(arg_204_0)
		setActive(arg_204_0, false)
	end)
	_.each(arg_187_1.readyIKLayers, function(arg_205_0)
		local var_205_0 = arg_205_0:getConfig("tip_text")

		if not var_205_0 or #var_205_0 == 0 then
			return
		end

		local var_205_1 = arg_187_0.ikTextTipsRoot:Find(var_205_0)

		if not IsNil(var_205_1) then
			setActive(var_205_1, true)
		end
	end)
	onNextTick(function()
		local var_206_0 = arg_187_0.furnitures:Find(arg_187_2.character_position)

		arg_187_1.lady.position = var_206_0:Find("StayPoint").position
		arg_187_1.lady.rotation = var_206_0:Find("StayPoint").rotation

		existCall(arg_187_3)
	end)
end

function var_0_0.ExitIKStatus(arg_207_0, arg_207_1, arg_207_2, arg_207_3, arg_207_4)
	arg_207_0.enableIKTip = false

	setActive(arg_207_1.ladyCollider, true)
	_.each(arg_207_1.ladyTouchColliders, function(arg_208_0)
		setActive(arg_208_0, false)
	end)

	arg_207_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()
	setActive(arg_207_0.ikTipsRoot, false)
	setActive(arg_207_0.ikClickTipsRoot, false)
	arg_207_0:ClearIkTouchEvents(arg_207_1)

	arg_207_1.currentIkStatus = nil
	arg_207_1.ikActionDict = nil
	arg_207_1.readyIKLayers = nil
	arg_207_1.iKTouchDatas = nil

	arg_207_0:RevertCameraOrbit()
	setActive(arg_207_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_207_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_207_1:EnableCloth(false)
	arg_207_0:ResetHeadAimIK(arg_207_1)
	arg_207_0:SwitchAnim(arg_207_1, arg_207_2.character_action)
	arg_207_0:ResetSceneItemAnimators()

	if not arg_207_4.ignoreResetExtraItem then
		arg_207_0:ResetCharacterExtraItem(arg_207_1)
		arg_207_0:ResetTempHideSceneItems(arg_207_1)
	end

	onNextTick(function()
		if arg_207_2.character_position then
			arg_207_1.ladyActiveZone = arg_207_2.character_position
		else
			arg_207_1.ladyActiveZone = arg_207_1.ladyBaseZone
		end

		arg_207_0:ChangeCharacterPosition(arg_207_1)
		arg_207_0:TriggerLadyDistance()
		arg_207_0:CheckInSector()
		existCall(arg_207_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_210_0, arg_210_1, arg_210_2, arg_210_3, arg_210_4, arg_210_5)
	warning("Set IKStatus " .. (arg_210_3 or "NIL"))
	arg_210_1:SetCurrentIkTimelineStatus(arg_210_3)

	arg_210_0.enableIKTip = true

	setActive(arg_210_0.ikControlUI, true)
	arg_210_0:ResetIKTipTimer()

	arg_210_0.blockIK = nil

	local var_210_0 = pg.dorm3d_ik_timeline_status[arg_210_3]

	arg_210_1.readyIKLayers = {}
	arg_210_1.iKTouchDatas = {}
	arg_210_1.IKSettings = {
		CameraRaycaster = GetOrAddComponent(arg_210_4, typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_210_1.IKSettings.CameraRaycaster)

	local var_210_1 = {}

	table.IpairsCArray(arg_210_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_211_0, arg_211_1)
		if arg_211_1.name == "SafeCollider" then
			setActive(arg_211_1, false)

			return
		end

		if arg_211_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		local var_211_0 = tf(arg_211_1)
		local var_211_1 = var_211_0.name
		local var_211_2 = var_211_1 and string.find(var_211_1, "Collider") or -1

		if var_211_2 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_211_1)

			return
		end

		local var_211_3 = string.sub(var_211_1, 1, var_211_2 - 1)

		if var_211_3 == "Body" or var_211_3 == "Safe" then
			setActive(var_211_0, false)

			return
		end

		if DormConst.BONE_TO_TOUCH[var_211_3] == nil then
			return
		end

		var_210_1[var_211_3] = var_211_0

		setActive(var_211_0, true)
	end)

	arg_210_1.IKSettings.Colliders = var_210_1

	local var_210_2 = GetOrAddComponent(arg_210_2, typeof(EventTriggerListener))

	arg_210_1.ikTimelineMode = true

	local var_210_3 = _.map(var_210_0.ik_id, function(arg_212_0)
		local var_212_0 = Dorm3dIK.New({
			configId = arg_212_0
		})

		table.insert(arg_210_1.readyIKLayers, var_212_0)

		local var_212_1 = var_212_0:GetSubTargets()
		local var_212_2 = var_212_0:GetPlaneRotations()
		local var_212_3 = var_212_0:GetPlaneScales()
		local var_212_4 = _.map(_.range(#var_212_1), function(arg_213_0)
			return {
				name = var_212_1[arg_213_0][1],
				planeRot = var_212_2[arg_213_0],
				planeScale = var_212_3[arg_213_0]
			}
		end)

		return Dorm3dIKController.New({
			ignoreDrag = false,
			triggerName = var_212_0:getConfig("trigger_param")[2],
			controllerName = var_212_0:GetControllerPath(),
			subTargets = var_212_4,
			actionType = var_212_0:GetActionTriggerParams()[1],
			controlRect = var_212_0:GetRect(),
			actionRect = var_212_0:GetTriggerRect(),
			backTime = var_212_0:GetRevertTime(),
			actionRevertTime = var_212_0:GetActionRevertTime(),
			timelineActionEvent = var_212_0:GetTimelineAction()
		})
	end)
	local var_210_4 = arg_210_2.transform:Find("IKLayers")
	local var_210_5 = {}
	local var_210_6 = {}

	table.Foreach(DormConst.boneMap, function(arg_214_0, arg_214_1)
		var_210_6[arg_214_1] = arg_214_0
	end)

	local var_210_7 = arg_210_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_210_7, function(arg_215_0, arg_215_1)
		if var_210_6[arg_215_1.name] then
			var_210_5[var_210_6[arg_215_1.name]] = arg_215_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_210_4, var_210_5)
	arg_210_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_210_3)
	eachChild(arg_210_0.ikTextTipsRoot, function(arg_216_0)
		setActive(arg_216_0, false)
	end)
	_.each(arg_210_1.readyIKLayers, function(arg_217_0)
		local var_217_0 = arg_217_0:getConfig("tip_text")

		if not var_217_0 or #var_217_0 == 0 then
			return
		end

		local var_217_1 = arg_210_0.ikTextTipsRoot:Find(var_217_0)

		if not IsNil(var_217_1) then
			setActive(var_217_1, true)
		end
	end)
	existCall(arg_210_5)
end

function var_0_0.ExitIKTimelineStatus(arg_218_0, arg_218_1, arg_218_2)
	arg_218_1:SetCurrentIkTimelineStatus(nil)

	arg_218_0.enableIKTip = false

	setActive(arg_218_0.ikControlUI, false)

	arg_218_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_218_1.readyIKLayers = nil
	arg_218_1.iKTouchDatas = nil
	arg_218_1.IKSettings = nil

	setActive(arg_218_0.ikTipsRoot, false)
	setActive(arg_218_0.ikClickTipsRoot, false)
	existCall(arg_218_2)
end

function var_0_0.ClearIkTouchEvents(arg_219_0, arg_219_1)
	local var_219_0 = _.map(arg_219_1.iKTouchDatas or {}, function(arg_220_0)
		return arg_220_0[1]
	end)

	table.Foreach(var_219_0, function(arg_221_0, arg_221_1)
		local var_221_0 = pg.dorm3d_ik_touch[arg_221_1]

		if #var_221_0.scene_item == 0 then
			return
		end

		local var_221_1 = arg_219_0:GetSceneItem(var_221_0.scene_item)

		if not var_221_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_221_1, var_221_0.scene_item))

			return
		end

		local var_221_2 = GetOrAddComponent(var_221_1, typeof(EventTriggerListener))

		var_221_2:ClearEvents()

		var_221_2.enabled = false
	end)
end

function var_0_0.EnableIKLayer(arg_222_0, arg_222_1)
	local var_222_0 = arg_222_0:GetCurrentLadyEnv()

	if #arg_222_1:GetHeadTrackPath() > 0 then
		arg_222_0:SettingHeadAimIK(var_222_0, {
			2,
			arg_222_1:GetHeadTrackPath()
		}, true)
	end

	local var_222_1 = arg_222_1:GetTriggerFaceAnim()

	if #var_222_1 > 0 then
		arg_222_0:PlayFaceAnim(var_222_0, var_222_1)
	end

	if not arg_222_1.ignoreDrag then
		setActive(arg_222_0:GetIKHandTF(), true)
		eachChild(arg_222_0:GetIKHandTF(), function(arg_223_0)
			setActive(arg_223_0, false)
		end)
		arg_222_0:StopIKHandTimer()
		setActive(arg_222_0:GetIKHandTF():Find("Begin"), true)

		arg_222_0.ikHandTimer = Timer.New(function()
			setActive(arg_222_0:GetIKHandTF():Find("Begin"), false)
			setActive(arg_222_0:GetIKHandTF():Find("Normal"), true)
		end, 0.5, 1)

		arg_222_0.ikHandTimer:Start()
	end

	if not var_222_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_222_0.apartment.configId, arg_222_0.apartment.level, var_222_0.ikConfig.character_action, arg_222_1:GetTriggerParams()[2], arg_222_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_225_0, arg_225_1)
	local var_225_0 = arg_225_0:GetCurrentLadyEnv()

	if not var_225_0.ikTimelineMode and #arg_225_1:GetHeadTrackPath() > 0 then
		arg_225_0:SettingHeadAimIK(var_225_0, var_225_0.ikConfig.head_track)
	end

	arg_225_0:StopIKHandTimer()

	if not arg_225_1.ignoreDrag then
		setActive(arg_225_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_225_0:GetIKHandTF():Find("Normal"), false)
		setActive(arg_225_0:GetIKHandTF():Find("End"), true)

		arg_225_0.ikHandTimer = Timer.New(function()
			setActive(arg_225_0:GetIKHandTF():Find("End"), false)
			setActive(arg_225_0:GetIKHandTF(), false)
		end, 0.5, 1)

		arg_225_0.ikHandTimer:Start()
	end
end

function var_0_0.StopIKHandTimer(arg_227_0)
	if not arg_227_0.ikHandTimer then
		return
	end

	arg_227_0.ikHandTimer:Stop()

	arg_227_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_228_0, arg_228_1, arg_228_2, arg_228_3)
	local var_228_0 = Time.time

	function arg_228_0.ikRevertHandler()
		local var_229_0 = Time.time - var_228_0

		_.each(arg_228_1.activeIKLayers, function(arg_230_0)
			local var_230_0 = 1

			if arg_228_2 > 0 then
				var_230_0 = var_229_0 / arg_228_2
			end

			local var_230_1 = arg_228_1.cacheIKInfos[arg_230_0].solvers
			local var_230_2 = arg_228_1.cacheIKInfos[arg_230_0].weights

			table.Foreach(var_230_1, function(arg_231_0, arg_231_1)
				arg_231_1.IKPositionWeight = math.lerp(var_230_2[arg_231_0], 0, var_230_0)
			end)
		end)

		if var_229_0 >= arg_228_2 then
			arg_228_0:ResetActiveIKs(arg_228_1)

			arg_228_0.ikRevertHandler = nil

			existCall(arg_228_3)
		end
	end

	arg_228_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_232_0, arg_232_1)
	table.insertto(arg_232_0.activeIKLayers, _.keys(arg_232_0.holdingStatus))
	table.clear(arg_232_0.holdingStatus)
	_.each(arg_232_1.activeIKLayers, function(arg_233_0)
		local var_233_0 = arg_233_0:GetControllerPath()
		local var_233_1 = arg_232_1.ladyIKRoot:Find(var_233_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_233_1, false)

		local var_233_2 = arg_232_1.cacheIKInfos[arg_233_0].solvers
		local var_233_3 = arg_232_1.cacheIKInfos[arg_233_0].weights

		table.Foreach(var_233_2, function(arg_234_0, arg_234_1)
			arg_234_1.IKPositionWeight = var_233_3[arg_234_0]
		end)
	end)
	table.clear(arg_232_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_235_0)
	if not arg_235_0.enableIKTip then
		return
	end

	arg_235_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_236_0, arg_236_1)
	local var_236_0 = arg_236_0:GetCurrentLadyEnv()

	arg_236_0:EnableHeadIK(var_236_0, arg_236_1)
end

function var_0_0.EnableHeadIK(arg_237_0, arg_237_1, arg_237_2)
	arg_237_1.ladyHeadIKComp.enableIk = arg_237_2
end

function var_0_0.SettingHeadAimIK(arg_238_0, arg_238_1, arg_238_2, arg_238_3)
	local var_238_0

	if arg_238_2[1] == 0 then
		arg_238_0:EnableHeadIK(arg_238_1, false)

		return
	elseif arg_238_2[1] == 1 then
		arg_238_0:EnableHeadIK(arg_238_1, true)

		var_238_0 = arg_238_0.mainCameraTF:Find("AimTarget")
	elseif arg_238_2[1] == 2 then
		arg_238_0:EnableHeadIK(arg_238_1, true)
		table.IpairsCArray(arg_238_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_239_0, arg_239_1)
			if arg_239_1.name ~= arg_238_2[2] then
				return
			end

			var_238_0 = arg_239_1
		end)
	end

	arg_238_1.ladyHeadIKComp.AimTarget = var_238_0

	if not arg_238_3 and arg_238_2[3] then
		arg_238_1.ladyHeadIKComp.BodyWeight = arg_238_2[3]
	end

	if not arg_238_3 and arg_238_2[4] then
		arg_238_1.ladyHeadIKComp.HeadWeight = arg_238_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_240_0, arg_240_1)
	arg_240_0:EnableHeadIK(arg_240_1, true)

	arg_240_1.ladyHeadIKComp.AimTarget = arg_240_0.mainCameraTF:Find("AimTarget")
	arg_240_1.ladyHeadIKComp.HeadWeight = arg_240_1.ladyHeadIKData.HeadWeight
	arg_240_1.ladyHeadIKComp.BodyWeight = arg_240_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_241_0, arg_241_1)
	for iter_241_0, iter_241_1 in pairs(arg_241_0.ladyDict) do
		if iter_241_0 ~= arg_241_1 then
			arg_241_0:HideCharacterBylayer(iter_241_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_242_0, arg_242_1)
	for iter_242_0, iter_242_1 in pairs(arg_242_0.ladyDict) do
		if iter_242_0 ~= arg_242_1 then
			arg_242_0:RevertCharacterBylayer(iter_242_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_243_0, arg_243_1)
	local var_243_0 = "Bip001"
	local var_243_1 = arg_243_1.lady:Find("all")

	for iter_243_0 = 0, var_243_1.childCount - 1 do
		local var_243_2 = var_243_1:GetChild(iter_243_0)

		if var_243_2.name ~= var_243_0 then
			pg.ViewUtils.SetLayer(var_243_2, Layer.Environment3D)
		end
	end

	if arg_243_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_243_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_243_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_243_1.ladyWatchFloat, Layer.Environment3D)
	end
end

function var_0_0.RevertCharacterBylayer(arg_244_0, arg_244_1)
	local var_244_0 = "Bip001"
	local var_244_1 = arg_244_1.lady:Find("all")

	for iter_244_0 = 0, var_244_1.childCount - 1 do
		local var_244_2 = var_244_1:GetChild(iter_244_0)

		if var_244_2.name ~= var_244_0 then
			pg.ViewUtils.SetLayer(var_244_2, Layer.Character3D)
		end
	end

	if arg_244_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_244_1.tfPendintItem, Layer.Default)
	end

	if arg_244_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_244_1.ladyWatchFloat, Layer.Default)
	end
end

function var_0_0.EnterFurnitureWatchMode(arg_245_0)
	arg_245_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_245_0:EnableJoystick(true)
	arg_245_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_246_0, arg_246_1)
	arg_246_0:HideFurnitureSlots()

	local var_246_0 = arg_246_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_247_0)
			arg_246_0.furniturePOV = nil

			arg_246_0:EnableJoystick(false)
			arg_246_0:emit(var_0_0.SHOW_BLOCK)
			arg_246_0:ShowBlackScreen(true, arg_247_0)
		end,
		function(arg_248_0)
			existCall(arg_246_1)
			arg_246_0:RevertCharacter()
			arg_246_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_246_0:RegisterCameraBlendFinished(var_246_0, arg_248_0)
			arg_246_0:ActiveCamera(var_246_0)
		end,
		function(arg_249_0)
			arg_246_0:ShowBlackScreen(false, arg_249_0)
		end
	}, function()
		arg_246_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_246_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_251_0, arg_251_1)
	local var_251_0 = arg_251_0:GetFurnitureByName(arg_251_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_251_0.cameraFurnitureWatch and arg_251_0.cameraFurnitureWatch ~= var_251_0 then
		arg_251_0:UnRegisterCameraBlendFinished(arg_251_0.cameraFurnitureWatch)
		setActive(arg_251_0.cameraFurnitureWatch, false)
	end

	arg_251_0.cameraFurnitureWatch = var_251_0
	arg_251_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_251_0.cameraFurnitureWatch
	arg_251_0.furniturePOV = arg_251_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_251_0:RegisterCameraBlendFinished(arg_251_0.cameraFurnitureWatch, function()
		arg_251_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_251_0:emit(var_0_0.SHOW_BLOCK)
	arg_251_0:ActiveCamera(arg_251_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_253_0)
	if arg_253_0.displaySlots then
		arg_253_0:UpdateDisplaySlots({})
		table.Foreach(arg_253_0.displaySlots, function(arg_254_0, arg_254_1)
			local var_254_0 = arg_254_1.trans

			if IsNil(var_254_0:Find("Selector")) then
				return
			end

			setActive(var_254_0:Find("Selector"), false)
		end)

		arg_253_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_255_0, arg_255_1)
	arg_255_0:HideFurnitureSlots()

	arg_255_0.displaySlots = {}

	_.each(arg_255_1, function(arg_256_0)
		arg_255_0.displaySlots[arg_256_0] = arg_255_0.slotDict[arg_256_0]

		if not arg_255_0.displaySlots[arg_256_0] then
			errorMsg("Slot " .. arg_256_0 .. " Not Binding Scene Object")

			return
		end

		local var_256_0 = arg_255_0.displaySlots[arg_256_0].trans

		if var_256_0:Find("Selector") then
			setActive(var_256_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_257_0, arg_257_1)
	table.Foreach(arg_257_0.displaySlots, function(arg_258_0, arg_258_1)
		local var_258_0 = arg_258_1.trans

		if not IsNil(var_258_0:Find("Selector")) then
			setActive(var_258_0:Find("Selector/Normal"), arg_257_1[arg_258_0] == 0)
			setActive(var_258_0:Find("Selector/Active"), arg_257_1[arg_258_0] == 1)
			setActive(var_258_0:Find("Selector/Ban"), arg_257_1[arg_258_0] == 2)
		end

		local var_258_1 = arg_257_0.slotDict[arg_258_0].model
		local var_258_2 = arg_257_0.slotDict[arg_258_0].displayModelName

		if var_258_2 and var_258_2 ~= "" then
			var_258_1 = var_258_0:GetChild(var_258_0.childCount - 1)
		end

		local function var_258_3(arg_259_0, arg_259_1)
			local var_259_0 = arg_259_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_259_0, function(arg_260_0, arg_260_1)
				local var_260_0 = arg_260_1.material

				if var_260_0 and var_260_0:HasProperty("_FinalTint") then
					var_260_0:SetColor("_FinalTint", arg_259_1)
				end
			end)
		end

		if var_258_1 then
			if arg_257_1[arg_258_0] == 1 then
				var_258_3(var_258_1, Color.NewHex("3F83AE73"))
			else
				var_258_3(var_258_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_261_0, arg_261_1, arg_261_2)
	arg_261_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_261_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_262_0)
			arg_261_0:TempHideUI(true, arg_262_0)
		end,
		function(arg_263_0)
			arg_261_0:ShowBlackScreen(true, arg_263_0)
		end,
		function(arg_264_0)
			local var_264_0 = arg_261_0.apartment:GetConfigID()
			local var_264_1 = arg_261_0.ladyDict[var_264_0]

			arg_261_0:SwitchAnim(var_264_1, arg_261_2)
			var_264_1.ladyAnimator:Update(0)
			arg_261_0:ResetCharPoint(var_264_1, arg_261_1:GetWatchCameraName())
			arg_261_0:SyncInterestTransform(var_264_1)
			setActive(var_264_1.ladySafeCollider, true)
			arg_261_0:HideCharacter(var_264_0)

			local var_264_2 = arg_261_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_264_3 = var_264_2.m_XAxis

			var_264_3.Value = 180
			var_264_2.m_XAxis = var_264_3

			local var_264_4 = var_264_2.m_YAxis

			var_264_4.Value = 0.7
			var_264_2.m_YAxis = var_264_4
			arg_261_0.pinchValue = 1

			arg_261_0:RegisterOrbits(arg_261_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_261_0:SetCameraObrits()
			setActive(arg_261_0.restrictedBox, true)
			arg_261_0:RegisterCameraBlendFinished(var_264_2, arg_264_0)
			arg_261_0:ActiveCamera(var_264_2)
		end,
		function(arg_265_0)
			arg_261_0:ShowBlackScreen(false, arg_265_0)
		end
	}, function()
		arg_261_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_267_0)
	arg_267_0:emit(var_0_0.SHOW_BLOCK)
	arg_267_0:EnableJoystick(false)
	seriesAsync({
		function(arg_268_0)
			arg_267_0:ShowBlackScreen(true, arg_268_0)
		end,
		function(arg_269_0)
			arg_267_0:RevertCameraOrbit()

			local var_269_0 = arg_267_0:GetCurrentLadyEnv()

			arg_267_0:SwitchAnim(var_269_0, var_0_0.ANIM.IDLE)
			setActive(var_269_0.ladySafeCollider, false)
			onNextTick(function()
				arg_267_0:ChangeCharacterPosition(var_269_0)
			end)

			if arg_267_0.contextData.photoFreeMode then
				arg_267_0:EnablePOVLayer(false)

				arg_267_0.contextData.photoFreeMode = nil
			end

			setActive(arg_267_0.restrictedBox, false)

			local var_269_1 = arg_267_0.cameras[var_0_0.CAMERA.POV]

			arg_267_0:RegisterCameraBlendFinished(var_269_1, arg_269_0)
			arg_267_0:ActiveCamera(var_269_1)
		end,
		function(arg_271_0)
			arg_267_0:RevertCharacter(arg_267_0.apartment:GetConfigID())
			arg_267_0:ShowBlackScreen(false, arg_271_0)
		end
	}, function()
		arg_267_0:RefreshSlots()
		arg_267_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_267_0:emit(var_0_0.HIDE_BLOCK)
		arg_267_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_267_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_273_0, arg_273_1, arg_273_2, arg_273_3)
	arg_273_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_274_0)
			arg_273_0:ShowBlackScreen(true, arg_274_0)
		end,
		function(arg_275_0)
			local var_275_0 = arg_273_0:GetCurrentLadyEnv()

			arg_273_0:SwitchAnim(var_275_0, arg_273_2)
			onNextTick(function()
				arg_273_0:ResetCharPoint(var_275_0, arg_273_1:GetWatchCameraName())
				arg_273_0:SyncInterestTransform(var_275_0)

				if arg_273_0.contextData.photoFreeMode then
					arg_273_0.camBrain.enabled = false

					arg_273_0:SwitchPhotoCamera()

					arg_273_0.camBrain.enabled = true

					onDelayTick(function()
						arg_273_0.camBrain.enabled = false

						arg_273_0:SwitchPhotoCamera()

						arg_273_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_275_0()
			end)
		end,
		function(arg_278_0)
			arg_273_0:ShowBlackScreen(false, arg_278_0)
		end
	}, function()
		arg_273_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_273_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_280_0)
	if not arg_280_0.contextData.photoFreeMode then
		arg_280_0:EnableJoystick(false)
		arg_280_0:EnablePOVLayer(true)

		local var_280_0 = arg_280_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
		local var_280_1 = arg_280_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_280_2 = arg_280_0.mainCameraTF.rotation:ToEulerAngles()
		local var_280_3 = var_280_1.m_HorizontalAxis

		var_280_3.Value = var_280_2.y
		var_280_1.m_HorizontalAxis = var_280_3

		local var_280_4 = var_280_1.m_VerticalAxis

		var_280_4.Value = arg_280_0:GetNearestAngle(var_280_2.x, var_280_4.m_MinValue, var_280_4.m_MaxValue)
		var_280_1.m_VerticalAxis = var_280_4

		local var_280_5 = arg_280_0.mainCameraTF.position
		local var_280_6 = arg_280_0:GetRestritedHeightRange()
		local var_280_7 = math.InverseLerp(var_280_6[1], var_280_6[2], var_280_5.y)

		var_280_5.y = math.clamp(var_280_5.y, var_280_6[1], var_280_6[2])
		var_280_0.transform.position = var_280_5

		arg_280_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_280_7)
		arg_280_0:ActiveCamera(arg_280_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_280_0:EnableJoystick(true)
		arg_280_0:EnablePOVLayer(false)
		arg_280_0:ActiveCamera(arg_280_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_280_0.contextData.photoFreeMode = not arg_280_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_281_0, arg_281_1)
	local var_281_0 = arg_281_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
	local var_281_1 = arg_281_0:GetRestritedHeightRange()
	local var_281_2 = math.lerp(var_281_1[1], var_281_1[2], arg_281_1)

	var_281_0:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_281_2 - var_281_0.position.y, 0))
	onNextTick(function()
		local var_282_0 = arg_281_0:GetRestritedHeightRange()
		local var_282_1 = math.InverseLerp(var_282_0[1], var_282_0[2], var_281_0.position.y)

		arg_281_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_282_1)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_283_0)
	local var_283_0 = arg_283_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_283_1 = var_283_0.m_XAxis

	var_283_1.Value = 180
	var_283_0.m_XAxis = var_283_1

	local var_283_2 = var_283_0.m_YAxis

	var_283_2.Value = 0.7
	var_283_0.m_YAxis = var_283_2
end

function var_0_0.ResetCurrentCharPoint(arg_284_0, arg_284_1)
	local var_284_0 = arg_284_0:GetCurrentLadyEnv()

	arg_284_0:ResetCharPoint(var_284_0, arg_284_1)
end

function var_0_0.ResetCharPoint(arg_285_0, arg_285_1, arg_285_2)
	local var_285_0 = arg_285_0.furnitures:Find(arg_285_2 .. "/StayPoint")

	arg_285_1.lady.position = var_285_0.position
	arg_285_1.lady.rotation = var_285_0.rotation
end

function var_0_0.GetNearestAngle(arg_286_0, arg_286_1, arg_286_2, arg_286_3)
	if arg_286_3 < arg_286_2 then
		arg_286_3 = arg_286_3 + 360
	end

	if arg_286_2 <= arg_286_1 and arg_286_1 <= arg_286_3 then
		return arg_286_1
	end

	local var_286_0 = (arg_286_2 + arg_286_3) / 2

	arg_286_1 = var_286_0 - Mathf.DeltaAngle(arg_286_1, var_286_0)
	arg_286_1 = math.clamp(arg_286_1, arg_286_2, arg_286_3)

	return arg_286_1
end

function var_0_0.PlayTimeline(arg_287_0, arg_287_1, arg_287_2)
	local var_287_0 = {}

	if arg_287_0.waitForTimeline then
		table.insert(var_287_0, function(arg_288_0)
			local var_288_0 = arg_287_0.waitForTimeline

			arg_287_0.waitForTimeline = nil

			var_288_0()
			arg_288_0()
		end)
	end

	table.insert(var_287_0, function(arg_289_0)
		arg_287_0:LoadTimelineScene(arg_287_1.name, false, nil, arg_289_0)
	end)

	if arg_287_1.scene and arg_287_1.sceneRoot then
		table.insert(var_287_0, function(arg_290_0)
			arg_287_0:ChangeArtScene(arg_287_1.scene .. "|" .. arg_287_1.sceneRoot, arg_290_0)
		end)
	end

	table.insert(var_287_0, function(arg_291_0)
		local var_291_0 = GameObject.Find("[actor]").transform
		local var_291_1 = var_291_0:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_291_1, function(arg_292_0, arg_292_1)
			GetOrAddComponent(arg_292_1.transform, typeof(DftAniEvent))
		end)

		local var_291_2 = var_291_0:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform
		local var_291_3

		eachChild(GameObject.Find("[camera]").transform, function(arg_293_0)
			if arg_293_0.tag == "MainCamera" then
				var_291_3 = arg_293_0
			end
		end)
		assert(var_291_3, "Missing MainCamera")

		local var_291_4 = GameObject.Find("[sequence]").transform

		arg_287_0.nowTimelinePlayer = TimelinePlayer.New(var_291_4)

		TimelineSupport.InitSubtitle(arg_287_0.nowTimelinePlayer.comDirector, arg_287_0.apartment:GetCallName())
		arg_287_0.nowTimelinePlayer:Register(arg_287_1.time, function(arg_294_0, arg_294_1, arg_294_2)
			switch(arg_294_1.stringParameter, {
				TimelinePause = function()
					arg_294_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_294_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_294_1.intParameter == 0 or arg_294_1.intParameter == arg_294_2.selectIndex then
						arg_294_0:SetTime(arg_294_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_294_2.selectIndex = nil

					if arg_287_1.options then
						local var_298_0 = arg_287_1.options[arg_294_1.intParameter]

						arg_287_0:DoTimelineOption(var_298_0, function(arg_299_0)
							arg_294_2.selectIndex = arg_299_0
							arg_294_2.optionIndex = var_298_0[arg_299_0].flag

							arg_294_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_294_2.selectIndex = nil

					if arg_287_1.touchs then
						local var_300_0 = arg_287_1.touchs[arg_294_1.intParameter]

						arg_287_0:DoTimelineTouch(arg_287_1.touchs[arg_294_1.intParameter], function(arg_301_0)
							arg_294_2.selectIndex = arg_301_0
							arg_294_2.optionIndex = var_300_0[arg_301_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_294_2.selectIndex then
						arg_294_0:RawSetTime(arg_294_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_294_2.selectIndex = arg_294_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_287_0.canTriggerAccompanyPerformance then
						arg_287_0.canTriggerAccompanyPerformance = false

						local var_304_0 = arg_287_1.accompanys[arg_294_1.intParameter]
						local var_304_1 = var_304_0[math.random(#var_304_0)]

						arg_294_0:SetTime(var_304_1)
					end
				end,
				TimelineIKStart = function()
					arg_294_2.selectIndex = nil

					local var_305_0 = arg_294_1.intParameter
					local var_305_1 = arg_287_0:GetCurrentLadyEnv()

					if var_305_1:CheckIkTimelineStatus(var_305_0) then
						arg_287_0:SetIKTimelineStatus(var_305_1, var_291_2.gameObject, var_305_0, var_291_3)
					end
				end,
				TimelineEnd = function()
					arg_294_2.finish = true

					arg_294_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_294_1.stringParameter)
			end)

			if arg_294_2.finish then
				arg_287_0.timelineMark = arg_294_2
				arg_287_0.timelineFinishCall = nil

				local var_294_0 = arg_287_0:GetCurrentLadyEnv()

				if var_294_0.ikTimelineMode then
					arg_287_0:ExitIKTimelineStatus(var_294_0)
				end

				arg_291_0()
			end
		end)

		function arg_287_0.timelineFinishCall()
			arg_287_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_287_0:HideCharacter()
		setActive(arg_287_0.mainCameraTF, false)
		setActive(var_291_3, true)
		eachChild(arg_287_0.rtTimelineScreen, function(arg_309_0)
			setActive(arg_309_0, false)
		end)
		setActive(arg_287_0.rtTimelineScreen, true)
		setActive(arg_287_0.rtTimelineScreen:Find("btn_skip"), arg_287_0.inReplayTalk)
		arg_287_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_287_0, function(arg_310_0)
		arg_287_0:ShowBlackScreen(true, function()
			arg_287_0.nowTimelinePlayer:Stop()
			arg_287_0.nowTimelinePlayer:Dispose()

			arg_287_0.nowTimelinePlayer = nil

			arg_287_0:UnloadTimelineScene(arg_287_1.name, false, arg_310_0)
		end)
	end)

	local var_287_1 = arg_287_0.dormSceneMgr.artSceneInfo

	table.insert(var_287_0, function(arg_312_0)
		arg_287_0:RevertArtScene(var_287_1, arg_312_0)
	end)
	seriesAsync(var_287_0, function()
		setActive(arg_287_0.rtTimelineScreen, false)
		arg_287_0:RevertCharacter()
		setActive(arg_287_0.mainCameraTF, true)

		local var_313_0 = arg_287_0.timelineMark

		arg_287_0.timelineMark = nil

		existCall(arg_287_2, var_313_0, function(arg_314_0)
			arg_287_0:ShowBlackScreen(false, arg_314_0)
		end)
	end)
end

function var_0_0.GetCurrentLadyEnv(arg_315_0)
	return arg_315_0.ladyDict[arg_315_0.apartment:GetConfigID()]
end

function var_0_0.PlayCurrentSingleAction(arg_316_0, ...)
	local var_316_0 = arg_316_0:GetCurrentLadyEnv()

	return arg_316_0:PlaySingleAction(var_316_0, ...)
end

function var_0_0.PlaySingleAction(arg_317_0, arg_317_1, arg_317_2, arg_317_3, arg_317_4)
	arg_317_1:PlaySingleAction(arg_317_2, arg_317_3, arg_317_4)
end

function var_0_0.SwitchCurrentAnim(arg_318_0, ...)
	local var_318_0 = arg_318_0:GetCurrentLadyEnv()

	return arg_318_0:SwitchAnim(var_318_0, ...)
end

function var_0_0.SwitchAnim(arg_319_0, arg_319_1, arg_319_2, arg_319_3)
	arg_319_1:SwitchAnim(arg_319_2, arg_319_3)
end

function var_0_0.PlayFaceAnim(arg_320_0, arg_320_1, arg_320_2, arg_320_3)
	arg_320_1:PlayFaceAnim(arg_320_2, arg_320_3)
end

function var_0_0.RegisterAnimCallback(arg_321_0, arg_321_1, arg_321_2)
	arg_321_0:GetCurrentLadyEnv().animCallbacks[arg_321_1] = arg_321_2
end

function var_0_0.SetCharacterAnimSpeed(arg_322_0, arg_322_1)
	local var_322_0 = arg_322_0:GetCurrentLadyEnv()

	var_322_0.ladyAnimator.speed = arg_322_1
	var_322_0.ladyHeadIKComp.blinkSpeed = var_322_0.ladyHeadIKData.blinkSpeed * arg_322_1

	if arg_322_1 > 0 then
		var_322_0.ladyHeadIKComp.DampTime = var_322_0.ladyHeadIKData.DampTime / arg_322_1
	else
		var_322_0.ladyHeadIKComp.DampTime = var_322_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_323_0, arg_323_1)
	if arg_323_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_323_0 = arg_323_1.stringParameter
	local var_323_1 = table.removebykey(arg_323_0.animEventCallbacks, var_323_0)

	existCall(var_323_1)
end

function var_0_0.RegisterAnimEventCallback(arg_324_0, arg_324_1, arg_324_2)
	arg_324_0.animEventCallbacks[arg_324_1] = arg_324_2
end

function var_0_0.PlaySceneItemAnim(arg_325_0, arg_325_1, arg_325_2, arg_325_3)
	arg_325_0.sceneAnimatorDict = arg_325_0.sceneAnimatorDict or {}

	if not arg_325_0.sceneAnimatorDict[arg_325_1] then
		local var_325_0 = pg.dorm3d_scene_animator[arg_325_1]
		local var_325_1 = arg_325_0:GetSceneItem(var_325_0.item_name)

		assert(var_325_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_325_1 .. " " .. var_325_0.item_name)

		if not var_325_1 then
			return
		end

		local var_325_2 = var_325_1:GetComponent(typeof(Animator))

		if not var_325_2 then
			return
		end

		arg_325_0.sceneAnimatorDict[arg_325_1] = {
			trans = var_325_1,
			animator = var_325_2
		}
	end

	if not arg_325_3 and arg_325_0.sceneAnimatorDict[arg_325_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_325_2) then
		return
	end

	arg_325_0.sceneAnimatorDict[arg_325_1].animator:PlayInFixedTime(arg_325_2)
end

function var_0_0.ResetSceneItemAnimators(arg_326_0, arg_326_1)
	if not arg_326_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_326_0.sceneAnimatorDict, function(arg_327_0, arg_327_1)
		if arg_326_1 and table.contains(arg_326_1, arg_327_0) then
			return
		end

		setActive(arg_327_1.trans, false)
		setActive(arg_327_1.trans, true)

		arg_326_0.sceneAnimatorDict[arg_327_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_328_0, arg_328_1, arg_328_2, arg_328_3, arg_328_4, arg_328_5, arg_328_6, arg_328_7)
	local function var_328_0(arg_329_0)
		if arg_328_6 then
			local var_329_0 = arg_329_0:GetComponent(typeof(Animator))

			if var_329_0 then
				var_329_0:Play(arg_328_6)

				var_329_0.speed = arg_328_7
			end
		end
	end

	arg_328_1.extraItems = arg_328_1.extraItems or {}

	if arg_328_1.extraItems[arg_328_2] then
		var_328_0(arg_328_1.extraItems[arg_328_2].trans)

		return
	end

	local var_328_1

	if arg_328_3 == "" then
		var_328_1 = arg_328_1.lady
	elseif arg_328_3 == "scene_root" then
		var_328_1 = arg_328_0.modelRoot
	else
		table.IpairsCArray(arg_328_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_330_0, arg_330_1)
			if arg_330_1.name == arg_328_3 then
				var_328_1 = arg_330_1
			end
		end)
	end

	if not var_328_1 then
		return
	end

	arg_328_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_328_2), "", function(arg_331_0)
		setParent(arg_331_0, var_328_1)

		if arg_328_4 then
			setLocalPosition(arg_331_0, arg_328_4)
		end

		if arg_328_5 then
			setLocalRotation(arg_331_0, arg_328_5)
		end

		var_328_0(arg_331_0)

		arg_328_1.extraItems[arg_328_2] = {
			trans = arg_331_0.transform,
			handler = var_328_1
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_332_0, arg_332_1, arg_332_2)
	if not arg_332_1.extraItems then
		return
	end

	table.Foreach(arg_332_1.extraItems, function(arg_333_0, arg_333_1)
		if arg_332_2 and table.contains(arg_332_2, arg_333_0) then
			return
		end

		arg_332_0.loader:ReturnPrefab(arg_333_1.trans.gameObject)

		arg_332_1.extraItems[arg_333_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_334_0, arg_334_1, arg_334_2)
	arg_334_0.cameraBlendCallbacks[arg_334_1] = arg_334_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_335_0, arg_335_1)
	arg_335_0.cameraBlendCallbacks[arg_335_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_336_0, arg_336_1)
	if not arg_336_1 then
		return
	end

	local var_336_0 = table.removebykey(arg_336_0.cameraBlendCallbacks, arg_336_1)

	existCall(var_336_0)
end

function var_0_0.PlayHeartFX(arg_337_0, arg_337_1)
	local var_337_0 = arg_337_0.ladyDict[arg_337_1]

	setActive(var_337_0.effectHeart, false)
	setActive(var_337_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_338_0, arg_338_1)
	local var_338_0 = arg_338_1.name
	local var_338_1 = arg_338_0.expressionDict[var_338_0]
	local var_338_2 = 5

	if var_338_1 then
		local var_338_3 = var_338_1.timer

		var_338_3:Reset(nil, var_338_2)
		var_338_3:Start()

		if var_338_1.instance then
			setActive(var_338_1.instance, false)
			setActive(var_338_1.instance, true)
		end

		return
	end

	local var_338_4 = {
		name = var_338_0,
		timer = Timer.New(function()
			arg_338_0:RemoveExpression(var_338_0)
		end, var_338_2, 1, true)
	}

	arg_338_0.expressionDict[var_338_0] = var_338_4

	arg_338_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_338_0, var_338_0, function(arg_340_0)
		var_338_4.instance = arg_340_0

		onNextTick(function()
			local var_341_0 = arg_338_0:GetCurrentLadyEnv()

			setParent(arg_340_0, var_341_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_340_0, Vector3(0, 0, -0.2))
		setActive(arg_340_0, false)
		setActive(arg_340_0, true)
	end, var_338_4)
end

function var_0_0.RemoveExpression(arg_342_0, arg_342_1)
	local var_342_0 = arg_342_0.expressionDict[arg_342_1]

	if not var_342_0 then
		return
	end

	arg_342_0.loader:ClearRequest(var_342_0)

	if var_342_0.instance then
		arg_342_0.loader:ReturnPrefab(var_342_0.instance)
	end

	arg_342_0.expressionDict[arg_342_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_343_0, arg_343_1, arg_343_2)
	setActive(arg_343_1.ladyWatchFloat, arg_343_2)
end

function var_0_0.RegisterGlobalVolume(arg_344_0)
	local var_344_0 = arg_344_0.globalVolume
	local var_344_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_344_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_344_2 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_344_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	arg_344_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_344_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_344_1.gaussianStart.min,
				value = var_344_1.gaussianStart.value
			},
			blurRadius = {
				min = var_344_1.blurRadius.min,
				max = var_344_1.blurRadius.max,
				value = var_344_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_344_2.postExposure.value
		},
		contrast = {
			min = var_344_2.contrast.min,
			max = var_344_2.contrast.max,
			value = var_344_2.contrast.value
		},
		saturate = {
			min = var_344_2.saturation.min,
			max = var_344_2.saturation.max,
			value = var_344_2.saturation.value
		}
	}
	arg_344_0.originalCameraSettings.depthOfField.enabled = true

	local var_344_3 = var_344_0:GetComponent(typeof(UnityEngine.Rendering.Volume))

	arg_344_0.originalVolume = {
		profile = var_344_3.sharedProfile,
		weight = var_344_3.weight
	}
end

function var_0_0.SettingCamera(arg_345_0, arg_345_1)
	arg_345_0.activeCameraSettings = arg_345_1

	local var_345_0 = arg_345_0.globalVolume
	local var_345_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_345_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_345_2 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_345_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	var_345_1.enabled:Override(arg_345_1.depthOfField.enabled)
	var_345_1.gaussianStart:Override(arg_345_1.depthOfField.focusDistance.value)
	var_345_1.gaussianEnd:Override(arg_345_1.depthOfField.focusDistance.value + arg_345_1.depthOfField.focusDistance.length)
	var_345_1.blurRadius:Override(arg_345_1.depthOfField.blurRadius.value)
	var_345_2.postExposure:Override(arg_345_1.postExposure.value)
	var_345_2.contrast:Override(arg_345_1.contrast.value)
	var_345_2.saturation:Override(arg_345_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_346_0)
	return arg_346_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_347_0)
	arg_347_0:SettingCamera(arg_347_0.originalCameraSettings)

	arg_347_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_348_0, arg_348_1, arg_348_2)
	if arg_348_0.cameraVolume then
		arg_348_0:RevertVolumeProfile()
	end

	arg_348_0.loader:GetPrefab("dorm3d/effect/volume/" .. arg_348_1, "", function(arg_349_0)
		arg_348_0.cameraVolume = arg_349_0
	end)
end

function var_0_0.RevertVolumeProfile(arg_350_0)
	if arg_350_0.cameraVolume then
		arg_350_0.loader:ReturnPrefab(arg_350_0.cameraVolume)

		arg_350_0.cameraVolume = nil
	end
end

function var_0_0.RecordCharacterLight(arg_351_0)
	tolua.loadassembly("Yongshi.BLRP.Runtime.AOT")

	local var_351_0 = arg_351_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	arg_351_0.originalCharacterColor = {
		color = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_351_0),
		intensity = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_351_0)
	}
end

function var_0_0.SetCharacterLight(arg_352_0, arg_352_1, arg_352_2, arg_352_3)
	local var_352_0 = arg_352_0.characterLight:GetComponent(typeof(Light))
	local var_352_1 = Color.Lerp(arg_352_0.originalCharacterColor.color, arg_352_1, arg_352_3)
	local var_352_2 = math.lerp(arg_352_0.originalCharacterColor.intensity, arg_352_2, arg_352_3)
	local var_352_3 = arg_352_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_352_3, var_352_1)
	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_352_3, var_352_2)
end

function var_0_0.RevertCharacterLight(arg_353_0)
	arg_353_0:SetCharacterLight(arg_353_0.originalCharacterColor.color, arg_353_0.originalCharacterColor.intensity, 1)
end

function var_0_0.onBackPressed(arg_354_0)
	if arg_354_0.exited or arg_354_0.retainCount > 0 then
		-- block empty
	else
		arg_354_0:closeView()
	end
end

function var_0_0.LoadTimelineScene(arg_355_0, arg_355_1, arg_355_2, arg_355_3, arg_355_4)
	arg_355_0.dormSceneMgr:LoadTimelineScene({
		name = arg_355_1,
		assetRootName = arg_355_0.apartment:getConfig("asset_name"),
		isCache = arg_355_2,
		waitForTimeline = arg_355_3,
		loadSceneFunc = function(arg_356_0, arg_356_1)
			local var_356_0 = GameObject.Find("[actor]").transform

			arg_355_0:HXCharacter(tf(var_356_0))
		end
	}, arg_355_4)
end

function var_0_0.UnloadTimelineScene(arg_357_0, arg_357_1, arg_357_2, arg_357_3)
	arg_357_0.dormSceneMgr:UnloadTimelineScene(arg_357_1, arg_357_2, arg_357_3)
end

function var_0_0.ChangeArtScene(arg_358_0, arg_358_1, arg_358_2)
	local var_358_0 = {}

	table.insert(var_358_0, function(arg_359_0)
		arg_358_0.dormSceneMgr:ChangeArtScene(arg_358_1, arg_359_0)
	end)
	table.insert(var_358_0, function(arg_360_0)
		setActive(arg_358_0.slotRoot, false)
		arg_360_0()
	end)
	warning(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", arg_358_1, arg_358_0.dormSceneMgr.sceneInfo, Dorm3dSceneMgr.IsSameSceneInfo(arg_358_1, arg_358_0.dormSceneMgr.sceneInfo))

	if Dorm3dSceneMgr.IsSameSceneInfo(arg_358_1, arg_358_0.dormSceneMgr.sceneInfo) then
		table.insert(var_358_0, function(arg_361_0)
			arg_358_0:SwitchDayNight(1)
			arg_358_0:TempHideContact(true)
			arg_361_0()
		end)
	end

	seriesAsync(var_358_0, arg_358_2)
end

function var_0_0.RevertArtScene(arg_362_0, arg_362_1, arg_362_2)
	local var_362_0 = {}

	table.insert(var_362_0, function(arg_363_0)
		arg_362_0.dormSceneMgr:ChangeArtScene(arg_362_1, arg_363_0)
	end)
	table.insert(var_362_0, function(arg_364_0)
		setActive(arg_362_0.slotRoot, true)
		arg_364_0()
	end)
	table.insert(var_362_0, function(arg_365_0)
		arg_362_0:SwitchDayNight(arg_362_0.contextData.timeIndex)
		onNextTick(function()
			arg_362_0:RefreshSlots()
			arg_362_0:TempHideContact(false)
			arg_365_0()
		end)
	end)
	seriesAsync(var_362_0, arg_362_2)
end

function var_0_0.ChangeSubScene(arg_367_0, arg_367_1, arg_367_2)
	local var_367_0 = {}

	table.insert(var_367_0, function(arg_368_0)
		arg_367_0.dormSceneMgr:ChangeSubScene(arg_367_1, arg_368_0)
	end)

	local var_367_1 = arg_367_0:GetCurrentLadyEnv()

	table.insert(var_367_0, function(arg_369_0)
		if Dorm3dSceneMgr.IsSameSceneInfo(arg_367_1, arg_367_0.dormSceneMgr.sceneInfo) then
			var_367_1.ladyActiveZone = var_367_1.walkBornPoint or var_367_1.ladyBaseZone
		else
			var_367_1.ladyActiveZone = var_367_1.walkBornPoint or "Default"
		end

		arg_369_0()
	end)

	if not Dorm3dSceneMgr.IsSameSceneInfo(arg_367_1, arg_367_0.dormSceneMgr.subSceneInfo) then
		table.insert(var_367_0, function(arg_370_0)
			local var_370_0, var_370_1 = Dorm3dSceneMgr.ParseInfo(arg_367_1)
			local var_370_2 = var_370_0 .. "_base"

			arg_367_0:ResetSceneStructure(SceneManager.GetSceneByName(var_370_2))

			if Dorm3dSceneMgr.IsSameSceneInfo(arg_367_1, arg_367_0.dormSceneMgr.sceneInfo) then
				arg_367_0:RefreshSlots()
			else
				arg_367_0:SwitchAnim(var_367_1, var_0_0.ANIM.IDLE)
			end

			if not Dorm3dSceneMgr.IsSameSceneInfo(arg_367_0.dormSceneMgr.subSceneInfo, arg_367_0.dormSceneMgr.sceneInfo) then
				arg_367_0:RefreshSlotsEmpty()
			end

			arg_370_0()
		end)
	end

	table.insert(var_367_0, function(arg_371_0)
		onNextTick(function()
			arg_367_0:ChangeCharacterPosition(var_367_1)
			arg_367_0:ChangePlayerPosition(var_367_1.ladyActiveZone)
			arg_367_0:TriggerLadyDistance()
			arg_367_0:CheckInSector()
			arg_371_0()
		end)
	end)
	seriesAsync(var_367_0, arg_367_2)
end

function var_0_0.IsPointInSector(arg_373_0, arg_373_1)
	local var_373_0 = arg_373_1 - arg_373_0.Position

	if var_373_0.y > arg_373_0.Radius then
		return false
	end

	var_373_0.y = 0

	if var_373_0.magnitude > arg_373_0.Radius then
		return false
	end

	local var_373_1 = arg_373_0.Rotation

	return Vector3.Angle(var_373_1 * Vector3.forward, var_373_0) <= arg_373_0.Angle / 2
end

function var_0_0.GetRestritedHeightRange(arg_374_0)
	if not arg_374_0.isMultiFloor then
		return arg_374_0.restrictedHeightRange
	else
		for iter_374_0 = #arg_374_0.restrictedHeightRange, 1, -1 do
			local var_374_0 = arg_374_0.restrictedHeightRange[iter_374_0]

			if arg_374_0.mainCameraTF.position.y >= var_374_0[1] then
				return var_374_0
			end
		end

		return arg_374_0.restrictedHeightRange[1]
	end
end

function var_0_0.willExit(arg_375_0)
	arg_375_0:RemoveExtraSystem()
	arg_375_0.joystickTimer:Stop()
	arg_375_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_375_0.updateHandler)
	arg_375_0:StopIKHandTimer()

	if arg_375_0.moveTimer then
		arg_375_0.moveTimer:Stop()

		arg_375_0.moveTimer = nil
	end

	if arg_375_0.moveWaitTimer then
		arg_375_0.moveWaitTimer:Stop()

		arg_375_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_375_0.furnitures) then
		eachChild(arg_375_0.furnitures, function(arg_376_0)
			local var_376_0 = GetComponent(arg_376_0, typeof(EventTriggerListener))

			if not var_376_0 then
				return
			end

			var_376_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_375_0, iter_375_1 in pairs(arg_375_0.ladyDict) do
		GetComponent(iter_375_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_375_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_375_0.camBrainEvenetHandler.OnBlendFinished = nil

	arg_375_0:UnOverlayPanel(arg_375_0.blockLayer, arg_375_0._tf)
	table.Foreach(arg_375_0.expressionDict, function(arg_377_0)
		arg_375_0:RemoveExpression(arg_377_0)
	end)
	arg_375_0.loader:Clear()
	pg.ClickEffectMgr.GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()
	arg_375_0.dormSceneMgr:Dispose()

	arg_375_0.dormSceneMgr = nil

	ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)

	if arg_375_0.transformFilter then
		arg_375_0.transformFilter:Dispose()
	end
end

return var_0_0
