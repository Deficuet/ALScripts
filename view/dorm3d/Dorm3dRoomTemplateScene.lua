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
			local var_29_0 = arg_14_0.ladyDict[arg_14_0.apartment:GetConfigID()]

			arg_14_0[arg_29_1](arg_14_0, var_29_0, ...)
		else
			arg_14_0[arg_29_1](arg_14_0, ...)
		end
	end)
end

function var_0_0.RegisterIKFunc(arg_30_0)
	pg.IKMgr.GetInstance():RegisterOnIKLayerActive(function(arg_31_0)
		arg_30_0.blockIK = true

		local var_31_0 = arg_30_0.ladyDict[arg_30_0.apartment:GetConfigID()]

		var_31_0.ikHandler = arg_31_0

		local var_31_1 = _.detect(var_31_0.readyIKLayers, function(arg_32_0)
			return arg_32_0:GetControllerPath() == arg_31_0.ikData:GetControllerPath()
		end)

		arg_30_0:EnableIKLayer(var_31_1)

		arg_30_0.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

		arg_30_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_31_1:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDrag(function(arg_33_0)
		arg_30_0.ladyDict[arg_30_0.apartment:GetConfigID()].ikHandler = arg_33_0

		arg_30_0:ResetIKTipTimer()
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDeactive(function(arg_34_0, arg_34_1)
		local var_34_0 = arg_30_0.ladyDict[arg_30_0.apartment:GetConfigID()]
		local var_34_1 = _.detect(var_34_0.readyIKLayers, function(arg_35_0)
			return arg_35_0:GetControllerPath() == arg_34_0.ikData:GetControllerPath()
		end)

		arg_30_0:DeactiveIKLayer(var_34_1)

		var_34_0.ikHandler = nil
		arg_30_0.blockIK = arg_34_1

		arg_30_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_34_1:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerAction(function(arg_36_0)
		local var_36_0 = arg_30_0.ladyDict[arg_30_0.apartment:GetConfigID()]

		arg_30_0.blockIK = nil

		local var_36_1 = _.detect(var_36_0.readyIKLayers, function(arg_37_0)
			return arg_37_0:GetControllerPath() == arg_36_0.ikData:GetControllerPath()
		end)

		arg_30_0:OnTriggerIK(var_36_1)
		arg_30_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_36_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	end)
end

function var_0_0.initScene(arg_38_0)
	local var_38_0, var_38_1 = unpack(string.split(arg_38_0.dormSceneMgr.sceneInfo, "|"))
	local var_38_2 = SceneManager.GetSceneByName(var_38_0 .. "_base")

	arg_38_0:ResetSceneStructure(var_38_2)

	arg_38_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_38_0.camBrain = arg_38_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_38_0.camBrainEvenetHandler = arg_38_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_38_0.raycastCamera = arg_38_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_38_0.sceneRaycaster = arg_38_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_38_0.player = GameObject.Find("Player").transform
	arg_38_0.playerEye = arg_38_0.player:Find("Eye")
	arg_38_0.playerFoot = arg_38_0.player:Find("Foot")

	setActive(arg_38_0.playerFoot, false)

	arg_38_0.playerController = arg_38_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_38_0.attachedPoints = {}

	eachChild(arg_38_0.furnitures, function(arg_39_0)
		table.insert(arg_38_0.attachedPoints, 1, arg_39_0)
	end)

	arg_38_0.modelRoot = GameObject.Find("scene_root").transform
	arg_38_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_38_0.slotRoot, true)
	arg_38_0:InitSlots()
	tolua.loadassembly("Cinemachine")

	local var_38_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_38_3, function(arg_40_0)
		setActive(arg_40_0, false)
	end)

	arg_38_0.camBrain.enabled = false
	arg_38_0.camBrain.enabled = true
	arg_38_0.cameraAim = var_38_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameraAim2 = var_38_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameraFree = nil
	arg_38_0.cameraFurnitureWatch = nil
	arg_38_0.cameraRole = var_38_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameraRole2 = var_38_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	local var_38_4 = var_38_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	arg_38_0.cameraGift = var_38_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameras = {
		arg_38_0.cameraAim,
		arg_38_0.cameraAim2,
		arg_38_0.cameraRole,
		[var_0_0.CAMERA.TALK] = var_38_4,
		[var_0_0.CAMERA.GIFT] = arg_38_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_38_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_38_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_38_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_38_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)),
		[var_0_0.CAMERA.SKIN] = arg_38_0.room:isPersonalRoom() and var_38_3:Find("Skin Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)) or nil
	}

	setActive(arg_38_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"), true)

	arg_38_0.compPovAim = arg_38_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_38_0.cameraRoot = var_38_3
	arg_38_0.POVOriginalFOV = arg_38_0:GetPOVFOV()
	arg_38_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_38_0.restrictedBox, false)

	local var_38_5 = arg_38_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(CharacterController)).radius

	arg_38_0.isMultiFloor = arg_38_0.restrictedBox.childCount > 2

	local var_38_6 = "Floor"
	local var_38_7 = "Celling"

	if arg_38_0.isMultiFloor then
		arg_38_0.restrictedHeightRange = {}

		for iter_38_0 = 0, math.floor(arg_38_0.restrictedBox.childCount / 2) - 1 do
			local var_38_8 = iter_38_0 == 0 and var_38_6 or var_38_6 .. "_" .. iter_38_0
			local var_38_9 = iter_38_0 == 0 and var_38_7 or var_38_7 .. "_" .. iter_38_0

			table.insert(arg_38_0.restrictedHeightRange, {
				arg_38_0.restrictedBox:Find(var_38_8).position.y + var_38_5,
				arg_38_0.restrictedBox:Find(var_38_9).position.y - var_38_5
			})
		end
	else
		arg_38_0.restrictedHeightRange = {
			arg_38_0.restrictedBox:Find(var_38_6).position.y + var_38_5,
			arg_38_0.restrictedBox:Find(var_38_7).position.y - var_38_5
		}
	end

	arg_38_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_38_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent("DayNightCtrl")

	arg_38_0:SwitchDayNight(arg_38_0.contextData.timeIndex)

	arg_38_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_38_0 .. "_base")).CutIn

	if arg_38_0.tfCutIn then
		arg_38_0.modelCutIn = {
			lady = arg_38_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_38_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_38_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_41_0, arg_41_1, arg_41_2)
	if arg_41_2 and not IsNil(arg_41_2) then
		arg_41_2:SwitcherToIndex(arg_41_1 - 1)
	elseif not IsNil(arg_41_0.daynightCtrlComp) then
		arg_41_0.daynightCtrlComp:SwitcherToIndex(arg_41_1 - 1)
	end

	arg_41_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_42_0)
	arg_42_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_42_0:RegisterGlobalVolume()

	arg_42_0.characterLight = GameObject.Find("CharacterLight")

	arg_42_0:RecordCharacterLight()

	local var_42_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_42_0:GetComponentsInChildren(typeof(Light), true), function(arg_43_0, arg_43_1)
		arg_43_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_44_0, arg_44_1)
	table.IpairsCArray(arg_44_1:GetRootGameObjects(), function(arg_45_0, arg_45_1)
		if arg_45_1.name == "Furnitures" then
			arg_44_0.furnitures = tf(arg_45_1)

			eachChild(arg_44_0.furnitures, function(arg_46_0)
				if arg_46_0:Find("FreeLook Camera") then
					setActive(arg_46_0:Find("FreeLook Camera"), false)
				end

				if arg_46_0:Find("FreeLook Camera") then
					setActive(arg_46_0:Find("RoleWatch Camera"), false)
				end

				if arg_46_0:Find("IKCamera") then
					setActive(arg_46_0:Find("IKCamera"), false)
				end

				local var_46_0 = arg_46_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_46_0 then
					return
				end

				var_46_0.enabled = false
			end)
		end
	end)
end

function var_0_0.InitSlots(arg_47_0)
	local var_47_0 = arg_47_0.room:GetSlots()
	local var_47_1 = arg_47_0.modelRoot:GetComponentsInChildren(typeof(Transform), true):ToTable()

	arg_47_0.slotDict = {}

	_.each(var_47_0, function(arg_48_0)
		local var_48_0 = arg_48_0:GetFurnitureName()
		local var_48_1 = arg_48_0:GetConfigID()
		local var_48_2 = arg_47_0.slotRoot:Find(tostring(var_48_1))

		if not var_48_2 then
			errorMsg("Not Find Slot: " .. var_48_1)

			return
		end

		local var_48_3 = {
			trans = var_48_2,
			sceneHides = {}
		}
		local var_48_4 = var_48_2:Find("Selector")

		if var_48_4 then
			GetOrAddComponent(var_48_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_49_0, arg_49_1)
				arg_47_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_48_1)
			end)
			setActive(var_48_4, false)
		end

		local var_48_5

		for iter_48_0, iter_48_1 in ipairs(var_47_1) do
			if iter_48_1.name == var_48_0 then
				var_48_5 = iter_48_1

				break
			end
		end

		if var_48_5 then
			var_48_3.model = var_48_5
		end

		arg_47_0.slotDict[var_48_1] = var_48_3
	end)
end

function var_0_0.SetContactStateDic(arg_50_0, arg_50_1)
	arg_50_0.contactStateDic = arg_50_1
	arg_50_0.hideContactStateDic = {}
	arg_50_0.contactInRangeDic = {}
	arg_50_0.transRangeDic = {
		list = {}
	}
	arg_50_0.transformFilter = arg_50_0.transformFilter or BLHX.Rendering.TransformFilter.New()

	for iter_50_0, iter_50_1 in pairs(arg_50_0.contactStateDic) do
		arg_50_0.hideContactStateDic[iter_50_0] = math.min(iter_50_1, ApartmentRoom.ITEM_UNLOCK)
		arg_50_0.contactInRangeDic[iter_50_0] = false

		local var_50_0 = pg.dorm3d_collection_template[iter_50_0].vfx_prefab

		arg_50_0.transRangeDic[iter_50_0] = {
			#arg_50_0.transRangeDic.list + 1,
			#var_50_0
		}

		table.insertto(arg_50_0.transRangeDic.list, underscore.map(var_50_0, function(arg_51_0)
			return arg_50_0.modelRoot:Find(arg_51_0)
		end))
	end

	arg_50_0.transformFilter:Init(arg_50_0.mainCameraTF, arg_50_0.transRangeDic.list, 2, 60)
	arg_50_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_52_0, arg_52_1)
	arg_52_0.hideConcatFlag = arg_52_1

	arg_52_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_53_0)
	for iter_53_0, iter_53_1 in pairs(arg_53_0.contactInRangeDic) do
		arg_53_0:UpdateContactDisplay(iter_53_0, arg_53_0.contactInRangeDic[iter_53_0] and not arg_53_0.hideConcatFlag and arg_53_0.contactStateDic[iter_53_0] or arg_53_0.hideContactStateDic[iter_53_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = pg.dorm3d_collection_template[arg_54_1]

	for iter_54_0, iter_54_1 in ipairs(var_54_0.vfx_prefab) do
		local var_54_1 = arg_54_0.modelRoot:Find(iter_54_1)

		if arg_54_0:IsModeInHidePending(iter_54_1) then
			-- block empty
		elseif not arg_54_0.modelRoot:Find(iter_54_1) then
			warning(arg_54_1, iter_54_1)
		else
			setActive(var_54_1, arg_54_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_54_2, iter_54_3 in ipairs(var_54_0.model) do
		if arg_54_0:IsModeInHidePending(iter_54_3) then
			-- block empty
		elseif not arg_54_0.modelRoot:Find(iter_54_3) then
			warning(arg_54_1, iter_54_3)
		else
			local var_54_2 = arg_54_0.modelRoot:Find(iter_54_3)

			if arg_54_0:CheckSceneItemActive(var_54_2) then
				local var_54_3 = GetComponent(var_54_2, typeof(EventTriggerListener))

				if arg_54_2 == ApartmentRoom.ITEM_FIRST then
					var_54_3 = var_54_3 or GetOrAddComponent(var_54_2, typeof(EventTriggerListener))

					var_54_3:AddPointClickFunc(function(arg_55_0, arg_55_1)
						arg_54_0:emit(var_0_0.CLICK_CONTACT, arg_54_1)
					end)

					var_54_3.enabled = true
				elseif var_54_3 then
					var_54_3.enabled = false
				end

				setActive(var_54_2, arg_54_2 > ApartmentRoom.ITEM_LOCK)
			end
		end
	end
end

function var_0_0.SetFloatEnable(arg_56_0, arg_56_1)
	arg_56_0.enableFloatUpdate = arg_56_1

	if arg_56_1 then
		arg_56_0:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_57_0)
	local var_57_0 = arg_57_0.ladyDict[arg_57_0.apartment:GetConfigID()]
	local var_57_1 = arg_57_0:GetScreenPosition(var_57_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_57_2 = arg_57_0:GetLocalPosition(var_57_1, arg_57_0.rtFloatPage)

	setLocalPosition(arg_57_0.rtFloatPage:Find("lady"), var_57_2)
end

function var_0_0.LoadCharacter(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0.hxMatDict = {}
	arg_58_0.ladyDict = {}
	arg_58_0.skinDict = {}

	local var_58_0 = {}

	for iter_58_0, iter_58_1 in ipairs(arg_58_1) do
		table.insert(var_58_0, function(arg_59_0)
			arg_58_0:LoadSingleCharacter(iter_58_1, arg_59_0)
		end)
	end

	parallelAsync(var_58_0, arg_58_2)
end

function var_0_0.LoadCharacterAdditionally(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = {}

	for iter_60_0, iter_60_1 in ipairs(arg_60_1) do
		table.insert(var_60_0, function(arg_61_0)
			arg_60_0:LoadSingleCharacter(iter_60_1, function()
				arg_60_0:InitCharacter(arg_60_0.ladyDict[iter_60_1], iter_60_1)
				arg_61_0()
			end)
		end)
	end

	parallelAsync(var_60_0, arg_60_2)
end

function var_0_0.LoadSingleCharacter(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = {}
	local var_63_1 = LadyEnv.New(arg_63_0)

	arg_63_0.ladyDict[arg_63_1] = var_63_1

	local var_63_2 = getProxy(ApartmentProxy):getApartment(arg_63_1)
	local var_63_3 = var_63_2:getConfig("asset_name")
	local var_63_4 = var_63_2:GetSkinModelID(arg_63_0.room:getConfig("tag"))
	local var_63_5 = Dorm3dSkin.New({
		configId = var_63_4
	}):GetModelName()

	assert(var_63_5)

	for iter_63_0, iter_63_1 in ipairs({
		"common",
		var_63_5
	}) do
		local var_63_6 = string.format("dorm3d/character/%s/res/%s", var_63_3, iter_63_1)

		if checkABExist(var_63_6) then
			table.insert(var_63_0, function(arg_64_0)
				arg_63_0.loader:LoadBundle(var_63_6, function(arg_65_0)
					for iter_65_0, iter_65_1 in ipairs(arg_65_0:GetAllAssetNames()) do
						local var_65_0, var_65_1, var_65_2 = string.find(string.lower(iter_65_1), "material_hx[/\\](.*).mat")

						if var_65_0 then
							arg_63_0.hxMatDict[var_65_2 .. " (Instance)"] = {
								arg_65_0,
								iter_65_1
							}
							arg_63_0.hxMatDict[var_65_2] = {
								arg_65_0,
								iter_65_1
							}
						end
					end

					arg_64_0()
				end)
			end)
		end
	end

	var_63_1.skinId = var_63_4
	var_63_1.skinIdList = {
		var_63_4
	}

	table.insert(var_63_0, function(arg_66_0)
		local var_66_0 = string.format("dorm3d/character/%s/prefabs/%s", var_63_3, var_63_5)

		arg_63_0.loader:GetPrefab(var_66_0, "", function(arg_67_0)
			var_63_1.ladyGameObject = arg_67_0
			arg_63_0.skinDict[var_63_4] = {
				ladyGameObject = arg_67_0
			}

			arg_66_0()
		end)
	end)

	if arg_63_0.room:isPersonalRoom() then
		for iter_63_2, iter_63_3 in ipairs(var_63_2:GetAllModelIds()) do
			if not table.contains(var_63_1.skinIdList, iter_63_3) then
				local var_63_7 = Dorm3dSkin.New({
					configId = iter_63_3
				}):GetModelName()
				local var_63_8 = string.format("dorm3d/character/%s/prefabs/%s", var_63_3, var_63_7)

				if checkABExist(var_63_8) then
					table.insert(var_63_1.skinIdList, iter_63_3)
					table.insert(var_63_0, function(arg_68_0)
						arg_63_0.loader:GetPrefab(var_63_8, "", function(arg_69_0)
							arg_63_0.skinDict[iter_63_3] = {
								ladyGameObject = arg_69_0
							}
							GetComponent(arg_69_0, "GraphOwner").enabled = false

							setActive(arg_69_0, false)
							arg_68_0()
						end)
					end)
				end
			end
		end
	end

	if arg_63_0.contextData.pendingDic[arg_63_1] then
		local var_63_9 = pg.dorm3d_welcome[arg_63_0.contextData.pendingDic[arg_63_1]]

		if var_63_9.item_prefab ~= "" then
			table.insert(var_63_0, function(arg_70_0)
				local var_70_0 = string.lower("dorm3d/furniture/item/" .. var_63_9.item_prefab)

				arg_63_0.loader:GetPrefab(var_70_0, "", function(arg_71_0)
					var_63_1.tfPendintItem = arg_71_0.transform

					setActive(arg_71_0, false)
					arg_70_0()
				end)
			end)
		end
	end

	parallelAsync(var_63_0, arg_63_2)
end

function var_0_0.HXCharacter(arg_72_0, arg_72_1)
	if not HXSet.isHx() then
		return
	end

	local var_72_0 = arg_72_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_72_0, function(arg_73_0, arg_73_1)
		local var_73_0 = arg_73_1.sharedMaterials
		local var_73_1 = false

		table.IpairsCArray(var_73_0, function(arg_74_0, arg_74_1)
			if arg_74_1 == nil then
				return
			end

			local var_74_0 = arg_74_1.name

			if not arg_72_0.hxMatDict[var_74_0] then
				return
			end

			var_73_1 = true

			local var_74_1, var_74_2 = unpack(arg_72_0.hxMatDict[var_74_0])
			local var_74_3 = var_74_1:LoadAssetSync(var_74_2, typeof(Material), false, false)

			var_73_0[arg_74_0] = var_74_3

			warning("Replace HX Material", arg_72_0.hxMatDict[var_74_0][2])
		end)

		if var_73_1 then
			arg_73_1.sharedMaterials = var_73_0

			GraphicsInterface.Instance:UpdateCharacterMaterialLst(go(arg_72_1))
		end
	end)
end

function var_0_0.InitCharacter(arg_75_0, arg_75_1, arg_75_2)
	arg_75_1:InitCharacter(arg_75_2)
	arg_75_0:HXCharacter(arg_75_1.lady)
	arg_75_1:SetZone(arg_75_0.contextData.ladyZone[arg_75_2])
	arg_75_0:ChangeCharacterPosition(arg_75_1)
end

function var_0_0.SetCameraLady(arg_76_0, arg_76_1)
	arg_76_0.cameraAim2.LookAt = arg_76_1.ladyInterestRoot
	arg_76_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_76_1.ladyInterestRoot
	arg_76_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_76_1.ladyInterestRoot
	arg_76_0.cameraGift.Follow = arg_76_0.ladyInterest
	arg_76_0.cameraGift.LookAt = arg_76_0.ladyInterest
	arg_76_0.cameraRole2.LookAt = arg_76_1.ladyInterestRoot
	arg_76_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_76_0.ladyInterest
	arg_76_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_76_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_77_0)
	local var_77_0 = pg.NodeCanvasMgr.GetInstance()

	var_77_0:Active()
	var_77_0:RegisterFunc("DistanceTrigger", function(arg_78_0)
		arg_77_0:emit(var_0_0.DISTANCE_TRIGGER, arg_78_0, arg_77_0.ladyDict[arg_78_0].dis)
	end)
	var_77_0:RegisterFunc("ShortWaitAction", function(arg_79_0)
		arg_77_0:DoShortWait(arg_79_0)
	end)
	var_77_0:RegisterFunc("WatchShortWaitAction", function(arg_80_0)
		arg_77_0:DoShortWait(arg_80_0)
	end)
	var_77_0:RegisterFunc("WalkDistanceTrigger", function(arg_81_0)
		arg_77_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_81_0, arg_77_0.ladyDict[arg_81_0].dis)
	end)
	var_77_0:RegisterFunc("ChangeWatch", function(arg_82_0)
		arg_77_0:emit(var_0_0.CHANGE_WATCH, arg_82_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_83_0, arg_83_1, arg_83_2)
	arg_83_0[arg_83_1] = arg_83_2

	for iter_83_0, iter_83_1 in pairs(arg_83_0.ladyDict) do
		arg_83_0:SetBlackboardValue(iter_83_1, arg_83_1, arg_83_2)
	end
end

function var_0_0.SetBlackboardValue(arg_84_0, arg_84_1, arg_84_2, arg_84_3)
	arg_84_1:SetBlackboardValue(arg_84_2, arg_84_3)
end

function var_0_0.GetBlackboardValue(arg_85_0, arg_85_1, arg_85_2)
	return arg_85_1:GetBlackboardValue(arg_85_2)
end

function var_0_0.didEnter(arg_86_0)
	local var_86_0 = -21.6 / Screen.height

	arg_86_0.joystickDelta = Vector2.zero
	arg_86_0.joystickTimer = FrameTimer.New(function()
		local var_87_0 = arg_86_0.joystickDelta * var_86_0
		local var_87_1 = var_87_0.x
		local var_87_2 = var_87_0.y

		local function var_87_3(arg_88_0, arg_88_1, arg_88_2)
			local var_88_0 = arg_88_0[arg_88_1]

			var_88_0.m_InputAxisValue = arg_88_2
			arg_88_0[arg_88_1] = var_88_0
		end

		if arg_86_0.surroudCamera and not arg_86_0.pinchMode then
			var_87_3(arg_86_0.surroudCamera, "m_XAxis", var_87_1)
			var_87_3(arg_86_0.surroudCamera, "m_YAxis", var_87_2)
		elseif arg_86_0.furniturePOV and arg_86_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] and isActive(arg_86_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH]) then
			var_87_3(arg_86_0.furniturePOV, "m_HorizontalAxis", var_87_1)
			var_87_3(arg_86_0.furniturePOV, "m_VerticalAxis", var_87_2)
		end

		arg_86_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_86_0.joystickTimer:Start()

	local var_86_1 = 1.75

	arg_86_0.moveStickTimer = FrameTimer.New(function()
		if not arg_86_0.moveStickDraging then
			return
		end

		local var_89_0 = arg_86_0.moveStickPosition
		local var_89_1 = 200
		local var_89_2 = (var_89_0 - arg_86_0.moveStickOrigin):ClampMagnitude(var_89_1)
		local var_89_3 = var_89_2 / var_89_1

		arg_86_0.moveStickPosition = arg_86_0.moveStickOrigin + var_89_2

		local var_89_4 = Vector3.New(var_89_3.x, 0, var_89_3.y)
		local var_89_5 = arg_86_0.mainCameraTF:TransformDirection(var_89_4)

		var_89_5.y = 0

		local var_89_6 = var_89_5:Normalize()

		var_89_6:Mul(var_86_1)

		if isActive(arg_86_0.cameras[var_0_0.CAMERA.POV]) then
			arg_86_0.playerController:SimpleMove(var_89_6)

			arg_86_0.tweenFOV = true
		elseif isActive(arg_86_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_86_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_89_6 * Time.deltaTime)
			arg_86_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, var_89_3:Normalize())
			onNextTick(function()
				local var_90_0 = arg_86_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_90_1 = arg_86_0:GetRestritedHeightRange()
				local var_90_2 = math.InverseLerp(var_90_1[1], var_90_1[2], var_90_0.position.y)

				arg_86_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_90_2)
			end)
		end
	end, 1, -1)

	arg_86_0.moveStickTimer:Start()

	arg_86_0.pinchMode = false
	arg_86_0.pinchSize = 0
	arg_86_0.pinchValue = 1
	arg_86_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_91_0, arg_91_1)
		if arg_86_0.surroudCamera and isActive(arg_86_0.surroudCamera) then
			arg_86_0.pinchMode = true
			arg_86_0.pinchSize = (arg_91_0 - arg_91_1):Magnitude()
			arg_86_0.pinchNodeOrder = arg_91_1.x < arg_91_0.x and -1 or 1

			return
		end

		if isActive(arg_86_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_91_0 - arg_91_1):Magnitude() < Screen.height * 0.5 then
				arg_86_0.pinchMode = true
				arg_86_0.pinchSize = (arg_91_0 - arg_91_1):Magnitude()
				arg_86_0.pinchNodeOrder = arg_91_1.x < arg_91_0.x and -1 or 1
			end

			return
		end
	end)

	local var_86_2 = 0.01

	if IsUnityEditor then
		var_86_2 = 0.1
	end

	local var_86_3 = var_86_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_92_0, arg_92_1)
		if not arg_86_0.pinchMode then
			return
		end

		local var_92_0 = (arg_92_0 - arg_92_1):Magnitude()
		local var_92_1 = arg_86_0.pinchSize - var_92_0
		local var_92_2 = arg_86_0.pinchNodeOrder * (arg_92_1.x < arg_92_0.x and -1 or 1)
		local var_92_3 = var_92_1 * var_86_3 * var_92_2

		if isActive(arg_86_0.cameras[var_0_0.CAMERA.POV]) then
			local var_92_4 = 0.5
			local var_92_5 = 1

			arg_86_0.pinchValue = math.clamp(arg_86_0.pinchValue + var_92_3, var_92_4, var_92_5)
			arg_86_0.pinchSize = var_92_0

			arg_86_0:SetPOVFOV(arg_86_0.POVOriginalFOV * arg_86_0.pinchValue)

			arg_86_0.tweenFOV = nil

			return
		end

		if isActive(arg_86_0.surroudCamera) and arg_86_0.surroudCamera == arg_86_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_92_6 = 0.5
			local var_92_7 = 1

			arg_86_0:SetPinchValue(math.clamp(arg_86_0.pinchValue + var_92_3, var_92_6, var_92_7))

			arg_86_0.pinchSize = var_92_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_86_0.pinchMode = false
		arg_86_0.pinchSize = 0
	end)

	arg_86_0.cameraBlendCallbacks = {}
	arg_86_0.activeCMCamera = nil

	function arg_86_0.camBrainEvenetHandler.OnBlendStarted(arg_94_0)
		if arg_86_0.activeCMCamera then
			arg_86_0:OnCameraBlendFinished(arg_86_0.activeCMCamera)
		end

		local var_94_0 = arg_86_0.camBrain.ActiveVirtualCamera

		arg_86_0.activeCMCamera = var_94_0
	end

	function arg_86_0.camBrainEvenetHandler.OnBlendFinished(arg_95_0)
		arg_86_0.activeCMCamera = nil

		arg_86_0:OnCameraBlendFinished(arg_95_0)
	end

	arg_86_0.expressionDict = {}

	arg_86_0:OverlayPanel(arg_86_0.blockLayer)
	arg_86_0:ActiveCamera(arg_86_0.cameras[var_0_0.CAMERA.POV])

	local var_86_4
	local var_86_5
	local var_86_6 = arg_86_0.resumeCallback

	function arg_86_0.resumeCallback()
		var_86_5 = true

		if var_86_4 then
			existCall(var_86_6)
		end
	end

	arg_86_0:RefreshSlots(nil, function()
		var_86_4 = true
		arg_86_0.doneFirstSlotFresh = true

		if var_86_5 then
			existCall(var_86_6)
		end
	end)

	arg_86_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_86_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_86_0.updateHandler)
	arg_86_0:InitExtraSystem()
end

function var_0_0.InitExtraSystem(arg_101_0, arg_101_1)
	arg_101_0.systemList = arg_101_0.systemList or {}
	arg_101_1 = arg_101_1 or DormConst.SYSTEM_LIST

	for iter_101_0, iter_101_1 in ipairs(arg_101_1) do
		switch(iter_101_1, {
			[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = function()
				if not SlideExtraSystem.IsOpen(arg_101_0.room) then
					return
				end

				if arg_101_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] then
					return
				end

				arg_101_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = SlideExtraSystem.New(arg_101_0.event, arg_101_0)

				arg_101_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide]:Init()
			end
		})
	end
end

function var_0_0.RemoveExtraSystem(arg_103_0, arg_103_1)
	arg_103_1 = arg_103_1 or DormConst.SYSTEM_LIST

	for iter_103_0, iter_103_1 in ipairs(arg_103_1) do
		switch(iter_103_1, {
			[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = function()
				if not arg_103_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] then
					return
				end

				arg_103_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide]:Dispose()

				arg_103_0.systemList[DormConst.EXTRA_SYSTEMS.FurnitureSlide] = nil
			end
		})
	end
end

function var_0_0.InitData(arg_105_0)
	if not arg_105_0.contextData.ladyZone then
		arg_105_0.contextData.ladyZone = {}

		local var_105_0
		local var_105_1 = arg_105_0.room:getConfig("default_zone")

		for iter_105_0, iter_105_1 in ipairs(var_105_1) do
			arg_105_0.contextData.ladyZone[iter_105_1[1]] = iter_105_1[2]

			if table.contains(arg_105_0.contextData.groupIds, iter_105_1[1]) then
				var_105_0 = var_105_0 or arg_105_0.contextData.ladyZone[iter_105_1[1]]
			end
		end

		arg_105_0.contextData.inFurnitureName = var_105_0 or var_105_1[1][2]
	end

	arg_105_0.zoneDatas = _.select(arg_105_0.room:GetZones(), function(arg_106_0)
		return not arg_106_0:IsGlobal()
	end)
	arg_105_0.activeLady = {}
end

function var_0_0.Update(arg_107_0)
	arg_107_0.raycastCamera.fieldOfView = arg_107_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_107_0.tweenFOV then
		local var_107_0 = Damp(1, 1, Time.deltaTime)

		arg_107_0.pinchValue = Mathf.Lerp(arg_107_0.pinchValue, 1, var_107_0)

		arg_107_0:SetPOVFOV(arg_107_0.POVOriginalFOV * arg_107_0.pinchValue)

		if arg_107_0.pinchValue > 0.99 then
			arg_107_0.tweenFOV = nil
		end
	end

	if isActive(arg_107_0.cameras[var_0_0.CAMERA.POV]) then
		arg_107_0:TriggerLadyDistance()
	end

	if arg_107_0.contactInRangeDic then
		local var_107_1 = arg_107_0.transformFilter:Execute():ToTable()

		for iter_107_0, iter_107_1 in pairs(arg_107_0.contactInRangeDic) do
			local var_107_2 = pg.dorm3d_collection_template[iter_107_0]
			local var_107_3 = arg_107_0.transRangeDic[iter_107_0]
			local var_107_4 = underscore(var_107_1):chain():slice(unpack(var_107_3)):any(function(arg_108_0)
				return arg_108_0
			end):value()

			if tobool(iter_107_1) ~= var_107_4 then
				arg_107_0.contactInRangeDic[iter_107_0] = var_107_4

				arg_107_0:UpdateContactDisplay(iter_107_0, var_107_4 and not arg_107_0.hideConcatFlag and arg_107_0.contactStateDic[iter_107_0] or arg_107_0.hideContactStateDic[iter_107_0])
			end
		end
	end

	if arg_107_0.enableFloatUpdate then
		arg_107_0:UpdateFloatPosition()
	end

	arg_107_0:CheckInSector()

	if arg_107_0.apartment then
		(function(arg_109_0)
			(function()
				if not arg_109_0.ikHandler then
					return
				end

				local var_110_0 = arg_109_0.ikHandler.screenPosition
				local var_110_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
				local var_110_2 = var_110_0 - Vector2.New(var_110_1.width, var_110_1.height) * 0.5

				setAnchoredPosition(arg_107_0:GetIKHandTF(), var_110_2)

				if Time.time > arg_107_0.ikNextCheckStamp then
					arg_107_0.ikNextCheckStamp = arg_107_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					local var_110_3 = _.detect(arg_109_0.readyIKLayers, function(arg_111_0)
						return arg_111_0:GetControllerPath() == arg_109_0.ikHandler.ikData:GetControllerPath()
					end)

					arg_107_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_110_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end
			end)()

			if arg_107_0.enableIKTip then
				local var_109_0 = not arg_107_0.blockIK and Time.time > arg_107_0.nextTipIKTime

				if var_109_0 then
					local var_109_1 = _.filter(arg_109_0.readyIKLayers, function(arg_112_0)
						return not arg_112_0.ignoreDrag
					end)

					UIItemList.StaticAlign(arg_107_0.ikTipsRoot, arg_107_0.ikTipsRoot:GetChild(0), #var_109_1, function(arg_113_0, arg_113_1, arg_113_2)
						if arg_113_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_113_1 = arg_113_1 + 1

						local var_113_0
						local var_113_1 = Vector2.zero
						local var_113_2 = var_109_1[arg_113_1]
						local var_113_3 = var_113_2:GetTriggerBoneName()
						local var_113_4 = var_113_3 and arg_109_0.IKSettings.Colliders[var_113_3] or nil
						local var_113_5 = var_113_2:GetIKTipOffset()

						if var_113_4 then
							local function var_113_6()
								local var_114_0 = arg_109_0.IKSettings.CameraRaycaster.eventCamera:WorldToScreenPoint(var_113_4.position)
								local var_114_1 = CameraMgr.instance:Raycast(arg_109_0.IKSettings.CameraRaycaster, var_114_0)

								if var_114_1.Length == 0 then
									return
								end

								return var_113_4 == var_114_1[0].gameObject.transform
							end
						end

						if var_113_4 then
							local var_113_7 = var_113_4.position
							local var_113_8 = var_113_4:GetComponent(typeof(UnityEngine.Collider))

							if var_113_8 then
								var_113_7 = var_113_8.bounds.center
							end

							local var_113_9 = arg_107_0:GetLocalPosition(arg_107_0:GetScreenPosition(var_113_7, arg_109_0.IKSettings.CameraRaycaster.eventCamera), arg_107_0.ikTipsRoot) + var_113_5

							setLocalPosition(arg_113_2, var_113_9)

							local var_113_10 = var_113_2:GetTriggerRect()
							local var_113_11 = var_113_10:PointToNormalized(Vector2.zero)
							local var_113_12 = Vector2.zero

							if var_113_11.x < 0.5 and var_113_11.y < 0.5 then
								var_113_12 = var_113_10.max
							elseif var_113_11.x >= 0.5 and var_113_11.y < 0.5 then
								var_113_12 = Vector2.New(var_113_10.xMin, var_113_10.yMax)
							elseif var_113_11.x < 0.5 and var_113_11.y >= 0.5 then
								var_113_12 = Vector2.New(var_113_10.xMax, var_113_10.yMin)
							elseif var_113_11.x >= 0.5 and var_113_11.y >= 0.5 then
								var_113_12 = var_113_10.min
							end

							if var_113_11.x == 0.5 then
								if var_113_9.x < 0 then
									var_113_12.x = var_113_10.xMax
								else
									var_113_12.x = var_113_10.xMin
								end
							end

							if var_113_11.y == 0.5 then
								if var_113_9.y < 0 then
									var_113_12.y = var_113_10.yMax
								else
									var_113_12.y = var_113_10.yMin
								end
							end

							local var_113_13 = var_113_12 - var_113_10.center

							setLocalRotation(arg_113_2, Quaternion.LookRotation(Vector3.forward, Vector3.New(var_113_13.x, var_113_13.y, 0)))
						end

						setActive(arg_113_2, var_113_4)
					end)
					UIItemList.StaticAlign(arg_107_0.ikClickTipsRoot, arg_107_0.ikClickTipsRoot:GetChild(0), #arg_109_0.iKTouchDatas, function(arg_115_0, arg_115_1, arg_115_2)
						if arg_115_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_115_1 = arg_115_1 + 1

						local var_115_0
						local var_115_1 = Vector2.zero
						local var_115_2 = arg_115_1
						local var_115_3 = arg_109_0.iKTouchDatas[var_115_2][1]
						local var_115_4 = pg.dorm3d_ik_touch[var_115_3]

						if var_115_4.tip_offset and var_115_4.tip_offset ~= "" then
							var_115_1 = Vector2.New(unpack(var_115_4.tip_offset))
						end

						if #var_115_4.scene_item > 0 then
							var_115_0 = arg_107_0:GetSceneItem(var_115_4.scene_item)
						else
							var_115_0 = arg_109_0.IKSettings.Colliders[var_115_4.body]
						end

						if var_115_0 then
							local var_115_5 = var_115_0.position
							local var_115_6 = var_115_0:GetComponent(typeof(UnityEngine.Collider))

							if var_115_6 then
								var_115_5 = var_115_6.bounds.center
							end

							setLocalPosition(arg_115_2, arg_107_0:GetLocalPosition(arg_107_0:GetScreenPosition(var_115_5, arg_109_0.IKSettings.CameraRaycaster.eventCamera), arg_107_0.ikClickTipsRoot) + var_115_1)
						end

						setActive(arg_115_2, var_115_0)
					end)
				end

				setActive(arg_107_0.ikTipsRoot, var_109_0)
				setActive(arg_107_0.ikClickTipsRoot, var_109_0)
				setActive(arg_107_0.ikTextTipsRoot, var_109_0)
			end
		end)(arg_107_0.ladyDict[arg_107_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_116_0)
	if not isActive(arg_116_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_116_0 = arg_116_0.mainCameraTF.position

	for iter_116_0, iter_116_1 in pairs(arg_116_0.ladyDict) do
		if iter_116_1.lady then
			local var_116_1 = tobool(arg_116_0.activeLady[iter_116_0])
			local var_116_2 = {
				Radius = 2,
				Angle = 120,
				Position = iter_116_1.lady.position,
				Rotation = iter_116_1.lady.rotation
			}

			if var_116_1 ~= tobool(var_0_0.IsPointInSector(var_116_2, var_116_0)) then
				arg_116_0.activeLady[iter_116_0] = not var_116_1

				arg_116_0:emit(var_0_0.ON_ENTER_SECTOR, iter_116_0)
			end
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_117_0)
	for iter_117_0, iter_117_1 in pairs(arg_117_0.ladyDict) do
		if iter_117_1.lady then
			iter_117_1.dis = (iter_117_1.lady.position - arg_117_0.player.position).magnitude

			if (arg_117_0:GetBlackboardValue(iter_117_1, "inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > iter_117_1.dis ~= arg_117_0:GetBlackboardValue(iter_117_1, "inDistance") then
				arg_117_0:SetBlackboardValue(iter_117_1, "inDistance", iter_117_1.dis < var_0_0.POV_CLOSE_DISTANCE)
				arg_117_0:emit(var_0_0.ON_CHANGE_DISTANCE, iter_117_0, iter_117_1.dis < var_0_0.POV_CLOSE_DISTANCE)
			end
		end
	end
end

function var_0_0.OnStickMove(arg_118_0, arg_118_1)
	arg_118_0.joystickDelta = arg_118_1
end

function var_0_0.SetPinchValue(arg_119_0, arg_119_1)
	arg_119_0.pinchValue = arg_119_1

	arg_119_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_120_0)
	local var_120_0 = arg_120_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_120_0)
end

function var_0_0.SetPOVFOV(arg_121_0, arg_121_1)
	local var_121_0 = arg_121_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_121_0, arg_121_1)

	arg_121_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_121_0
end

function var_0_0.RefreshSlots(arg_122_0, arg_122_1, arg_122_2)
	arg_122_1 = arg_122_1 or arg_122_0.room

	local var_122_0 = arg_122_1:GetSlots()
	local var_122_1 = arg_122_1:GetFurnitures()

	arg_122_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_122_0, function(arg_123_0, arg_123_1, arg_123_2)
		local var_123_0 = arg_123_1:GetConfigID()

		if not arg_122_0.slotDict[var_123_0] then
			return arg_123_2()
		end

		local var_123_1 = _.detect(var_122_1, function(arg_124_0)
			return arg_124_0:GetSlotID() == var_123_0
		end)
		local var_123_2 = var_123_1 and var_123_1:GetModel() or false
		local var_123_3 = arg_122_0.slotDict[var_123_0].model

		arg_122_0.slotDict[var_123_0].displayModelName = var_123_2
		arg_122_0.slotDict[var_123_0].furnitureId = var_123_1 and var_123_1:GetConfigID()

		local function var_123_4(arg_125_0)
			if var_123_3 then
				setActive(var_123_3, var_123_2 == "")
			end

			table.Foreach(arg_122_0.slotDict[var_123_0].sceneHides or {}, function(arg_126_0, arg_126_1)
				setActive(arg_126_1.trans, arg_126_1.visible)
			end)

			arg_122_0.slotDict[var_123_0].sceneHides = {}

			if arg_125_0 then
				local var_125_0 = arg_125_0:getConfig("scene_hides")

				if #var_125_0 > 0 then
					table.Ipairs(var_125_0, function(arg_127_0, arg_127_1)
						local var_127_0 = arg_122_0.modelRoot:Find(arg_127_1)

						assert(var_127_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_125_0:GetConfigID(), arg_127_1))

						local var_127_1 = isActive(var_127_0)

						table.insert(arg_122_0.slotDict[var_123_0].sceneHides, {
							name = arg_127_1,
							trans = var_127_0,
							visible = var_127_1
						})
						setActive(var_127_0, false)
					end)
				end
			end
		end

		if var_123_2 == false or var_123_2 == "" then
			arg_122_0.loader:ClearRequest("slot_" .. var_123_0)
			var_123_4()
			arg_123_2()

			return
		end

		local var_123_5 = arg_122_0.slotDict[var_123_0].trans

		if arg_122_0.loader:GetLoadingRP("slot_" .. var_123_0) then
			arg_122_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_122_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_123_2, "", function(arg_128_0)
			assert(arg_128_0)
			setParent(arg_128_0, var_123_5)
			var_123_4(var_123_1)
			arg_123_2()
		end, "slot_" .. var_123_0)
	end, function()
		arg_122_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_122_2)
		warning("RefreshSlots", "Done")
		arg_122_0:emit(Dorm3dRoomMediator.REFRESH_FURNITURE_AND_SLOTS_DONE)
	end)
end

function var_0_0.RefreshSlotsEmpty(arg_130_0, arg_130_1)
	local var_130_0 = Clone(arg_130_0.room)

	var_130_0.furnitures = {}

	arg_130_0:RefreshSlots(var_130_0, arg_130_1)
end

function var_0_0.CheckSceneItemActiveByPath(arg_131_0, arg_131_1)
	local var_131_0 = arg_131_0:GetSceneItem(arg_131_1)

	return arg_131_0:CheckSceneItemActive(var_131_0)
end

function var_0_0.CheckSceneItemActive(arg_132_0, arg_132_1)
	local var_132_0 = true
	local var_132_1

	table.Checkout(arg_132_0.slotDict, function(arg_133_0, arg_133_1)
		if underscore.detect(arg_133_1.sceneHides, function(arg_134_0)
			return arg_134_0.trans == arg_132_1
		end) then
			var_132_0 = false
			var_132_1 = arg_133_1.furnitureId

			return false
		end
	end)

	return var_132_0, var_132_1
end

function var_0_0.ChangeCharacterPosition(arg_135_0, arg_135_1)
	arg_135_0:ResetCharPoint(arg_135_1, arg_135_1.ladyActiveZone)
	arg_135_0:SyncInterestTransform(arg_135_1)
end

function var_0_0.SyncCurrentInterestTransform(arg_136_0)
	local var_136_0 = arg_136_0.ladyDict[arg_136_0.apartment:GetConfigID()]

	arg_136_0:SyncInterestTransform(var_136_0)
end

function var_0_0.SyncInterestTransform(arg_137_0, arg_137_1)
	arg_137_0.ladyInterest.position = arg_137_1.ladyInterestRoot.position
	arg_137_0.ladyInterest.rotation = arg_137_1.ladyInterestRoot.rotation
end

function var_0_0.SyncInterestTransformByTf(arg_138_0, arg_138_1)
	arg_138_0.ladyInterest.position = arg_138_1.position
	arg_138_0.ladyInterest.rotation = arg_138_1.rotation
end

function var_0_0.ChangePlayerPosition(arg_139_0, arg_139_1)
	arg_139_1 = arg_139_1 or arg_139_0.contextData.inFurnitureName

	local var_139_0 = arg_139_0.furnitures:Find(arg_139_1):Find("PlayerPoint").position

	arg_139_0.player.position = var_139_0
	arg_139_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_139_0.playerEye.position

	local var_139_1 = arg_139_0.ladyInterest.position - arg_139_0.playerEye.position
	local var_139_2 = Quaternion.LookRotation(var_139_1).eulerAngles
	local var_139_3 = var_139_2.y
	local var_139_4 = var_139_2.x
	local var_139_5 = arg_139_0.compPovAim.m_HorizontalAxis

	var_139_5.Value = arg_139_0:GetNearestAngle(var_139_3, var_139_5.m_MinValue, var_139_5.m_MaxValue)
	arg_139_0.compPovAim.m_HorizontalAxis = var_139_5

	local var_139_6 = arg_139_0.compPovAim.m_VerticalAxis

	var_139_6.Value = var_139_4
	arg_139_0.compPovAim.m_VerticalAxis = var_139_6
end

function var_0_0.GetAttachedFurnitureName(arg_140_0)
	return arg_140_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_141_0, arg_141_1)
	return underscore.detect(arg_141_0.attachedPoints, function(arg_142_0)
		return arg_142_0.name == arg_141_1
	end)
end

function var_0_0.GetSlotByID(arg_143_0, arg_143_1)
	return arg_143_0.displaySlots[arg_143_1] and arg_143_0.displaySlots[arg_143_1].trans
end

function var_0_0.GetScreenPosition(arg_144_0, arg_144_1, arg_144_2)
	arg_144_2 = arg_144_2 or arg_144_0.raycastCamera

	local var_144_0 = arg_144_2:WorldToScreenPoint(arg_144_1)

	if var_144_0.z < 0 then
		var_144_0.x = var_144_0.x + (var_144_0.x < 0 and -1 or 1) * Screen.width
		var_144_0.y = var_144_0.y + (var_144_0.y < 0 and -1 or 1) * Screen.height
		var_144_0.z = -var_144_0.z
	end

	return var_144_0
end

function var_0_0.GetLocalPosition(arg_145_0, arg_145_1, arg_145_2)
	return LuaHelper.ScreenToLocal(arg_145_2, arg_145_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_146_0)
	return arg_146_0.modelRoot
end

function var_0_0.ShiftZone(arg_147_0, arg_147_1, arg_147_2)
	local var_147_0 = arg_147_0:GetFurnitureByName(arg_147_1)

	if not var_147_0 then
		errorMsg(arg_147_1 .. " Not Find")
		existCall(arg_147_2)

		return
	end

	seriesAsync({
		function(arg_148_0)
			arg_147_0:emit(var_0_0.SHOW_BLOCK)
			arg_147_0:ShowBlackScreen(true, arg_148_0)
		end,
		function(arg_149_0)
			if arg_147_0.shiftLady or arg_147_0.room:isPersonalRoom() then
				local var_149_0 = arg_147_0.shiftLady or arg_147_0.apartment:GetConfigID()

				arg_147_0.shiftLady = nil
				arg_147_0.contextData.ladyZone[var_149_0] = var_147_0.name

				local var_149_1 = arg_147_0.ladyDict[var_149_0]

				var_149_1:SetZone(arg_147_0.contextData.ladyZone[var_149_0])

				if arg_147_0:GetBlackboardValue(var_149_1, "inPending") then
					arg_147_0:SetOutPending(var_149_1)
					arg_147_0:SwitchAnim(var_149_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_147_0:ChangeCharacterPosition(var_149_1)
						arg_149_0()
					end)
				else
					arg_147_0:ChangeCharacterPosition(var_149_1)
					arg_149_0()
				end
			else
				arg_149_0()
			end
		end,
		function(arg_151_0)
			arg_147_0.contextData.inFurnitureName = var_147_0.name

			if SlideExtraSystem.IsOpen(arg_147_0.room) and arg_147_0.contextData.inFurnitureName == SlideConst.SLIDE_ZONE then
				arg_147_0:SyncInterestTransformByTf(var_147_0.transform:Find("StayPoint"))
			elseif not arg_147_0.apartment then
				for iter_151_0, iter_151_1 in pairs(arg_147_0.ladyDict) do
					if iter_151_1.ladyBaseZone == arg_147_0.contextData.inFurnitureName then
						arg_147_0:SyncInterestTransform(iter_151_1)

						break
					end
				end
			end

			arg_147_0:ChangePlayerPosition()
			arg_147_0:TriggerLadyDistance()
			arg_147_0:CheckInSector()
			arg_151_0()
		end,
		function(arg_152_0)
			arg_147_0:UpdateZoneList()
			arg_147_0:ShowBlackScreen(false, arg_152_0)
		end,
		function(arg_153_0)
			arg_147_0:emit(var_0_0.HIDE_BLOCK)
			arg_153_0()
		end
	}, arg_147_2)
end

function var_0_0.ActiveCamera(arg_154_0, arg_154_1)
	local var_154_0 = isActive(arg_154_1)

	table.Foreach(arg_154_0.cameras, function(arg_155_0, arg_155_1)
		setActive(arg_155_1, arg_155_1 == arg_154_1)
	end)

	if var_154_0 then
		arg_154_0:OnCameraBlendFinished(arg_154_1)
	end
end

function var_0_0.ActiveCameraByName(arg_156_0, arg_156_1)
	local var_156_0 = arg_156_0.cameraRoot:Find(arg_156_1)

	assert(var_156_0, "ActiveCameraByName: " .. arg_156_1 .. " not found")
	table.Foreach(arg_156_0.cameras, function(arg_157_0, arg_157_1)
		setActive(arg_157_1, false)
	end)
	setActive(var_156_0, true)

	arg_156_0.cameras[var_0_0.CAMERA.CUSTOM] = var_156_0:GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
end

function var_0_0.ShowBlackScreen(arg_158_0, arg_158_1, arg_158_2)
	local var_158_0 = arg_158_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_158_1 and 0 or 0.3
	}

	setImageColor(arg_158_0.blackLayer, Color.NewHex(var_158_0.color))
	setActive(arg_158_0.blackLayer, true)
	setCanvasGroupAlpha(arg_158_0.blackLayer, arg_158_1 and 0 or 1)
	arg_158_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_158_1 then
			setActive(arg_158_0.blackLayer, false)
		end

		existCall(arg_158_2)
	end, GetComponent(arg_158_0.blackLayer, typeof(CanvasGroup)), arg_158_1 and 1 or 0, var_158_0.time):setDelay(var_158_0.delay)
end

function var_0_0.RegisterOrbits(arg_160_0, arg_160_1)
	arg_160_0 = arg_160_0.scene
	arg_160_0.orbits = {
		original = arg_160_1.m_Orbits
	}
	arg_160_0.orbits.current = _.range(3):map(function(arg_161_0)
		local var_161_0 = arg_160_0.orbits.original[arg_161_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_161_0.m_Height, var_161_0.m_Radius)
	end)
	arg_160_0.surroudCamera = arg_160_1
end

function var_0_0.SetCameraObrits(arg_162_0)
	arg_162_0 = arg_162_0.scene

	local var_162_0 = arg_162_0.surroudCamera

	if not var_162_0 then
		return
	end

	local var_162_1 = arg_162_0.orbits.original[1]

	for iter_162_0 = 0, #arg_162_0.orbits.current - 1 do
		local var_162_2 = arg_162_0.orbits.current[iter_162_0 + 1]
		local var_162_3 = arg_162_0.orbits.original[iter_162_0]

		var_162_2.m_Height = math.lerp(var_162_1.m_Height, var_162_3.m_Height, arg_162_0.pinchValue)
		var_162_2.m_Radius = var_162_3.m_Radius * arg_162_0.pinchValue
	end

	var_162_0.m_Orbits = arg_162_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_163_0)
	arg_163_0 = arg_163_0.scene

	local var_163_0 = arg_163_0.surroudCamera

	if not var_163_0 then
		return
	end

	for iter_163_0 = 0, #arg_163_0.orbits.current - 1 do
		local var_163_1 = arg_163_0.orbits.current[iter_163_0 + 1]
		local var_163_2 = arg_163_0.orbits.original[iter_163_0]

		var_163_1.m_Height = var_163_2.m_Height
		var_163_1.m_Radius = var_163_2.m_Radius
	end

	var_163_0.m_Orbits = arg_163_0.orbits.current
	arg_163_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_164_0, arg_164_1, arg_164_2)
	local var_164_0 = {
		base = function(arg_165_0)
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.POV], arg_165_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_166_0)
			assert(arg_164_0.apartment)
			arg_164_0:SyncInterestTransform(arg_164_0.ladyDict[arg_164_0.apartment:GetConfigID()])
			arg_164_0:SetCameraLady(arg_164_0.ladyDict[arg_164_0.apartment:GetConfigID()])
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.ROLE], arg_166_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_167_0)
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.POV], arg_167_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_168_0)
			arg_168_0()
		end,
		gift = function(arg_169_0)
			assert(arg_164_0.apartment)
			arg_164_0:SetCameraLady(arg_164_0.ladyDict[arg_164_0.apartment:GetConfigID()])
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.GIFT], arg_169_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_170_0)
			assert(arg_164_0.apartment)
			arg_164_0:SetCameraLady(arg_164_0.ladyDict[arg_164_0.apartment:GetConfigID()])

			arg_164_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_164_0.cameraRole.transform.position

			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.ROLE2], arg_170_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_171_0)
			assert(arg_164_0.apartment)
			arg_164_0:SetCameraLady(arg_164_0.ladyDict[arg_164_0.apartment:GetConfigID()])
			arg_164_0:SyncInterestTransform(arg_164_0.ladyDict[arg_164_0.apartment:GetConfigID()])
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.TALK], arg_171_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_164_1 = {}

	table.insert(var_164_1, function(arg_172_0)
		switch(arg_164_1, var_164_0, arg_172_0, arg_172_0)
	end)
	seriesAsync(var_164_1, arg_164_2)
end

function var_0_0.GetSceneItem(arg_173_0, arg_173_1)
	local var_173_0

	if string.find(arg_173_1, "FurnitureSlots/") == 1 then
		arg_173_1 = string.gsub(arg_173_1, "^FurnitureSlots/", "", 1)
		var_173_0 = arg_173_0.slotRoot:Find(arg_173_1)
	else
		var_173_0 = arg_173_0.modelRoot:Find(arg_173_1)
	end

	if not var_173_0 then
		warning(string.format("Missing scene item path: %s", arg_173_1))
	end

	return var_173_0
end

function var_0_0.SetSceneAnimSpeed(arg_174_0, arg_174_1, arg_174_2)
	table.Ipairs(arg_174_1 or {}, function(arg_175_0, arg_175_1)
		if arg_174_0.sceneAnimatorDict[arg_175_1] then
			arg_174_0.sceneAnimatorDict[arg_175_1].animator.speed = arg_174_2
		end
	end)
end

function var_0_0.SetExtraAnimSpeed(arg_176_0, arg_176_1, arg_176_2, arg_176_3)
	table.Ipairs(arg_176_2 or {}, function(arg_177_0, arg_177_1)
		local var_177_0 = arg_177_1[1]

		if arg_176_1.extraItems[var_177_0] then
			arg_176_1.extraItems[var_177_0].trans:GetComponent(typeof(Animator)).speed = arg_176_3
		end
	end)
end

function var_0_0.PlayEnterSceneAnim(arg_178_0, arg_178_1, arg_178_2, arg_178_3)
	arg_178_3 = arg_178_3 or 1

	local var_178_0 = {}

	if arg_178_1 and #arg_178_1 > 0 then
		table.Ipairs(arg_178_1, function(arg_179_0, arg_179_1)
			arg_178_0:PlaySceneItemAnim(arg_179_1[1], arg_179_1[2], arg_178_2)
			arg_178_0:SetSceneAnimSpeed({
				arg_179_1[1]
			}, arg_178_3)
			table.insert(var_178_0, arg_179_1[1])
		end)
	end

	arg_178_0:ResetSceneItemAnimators(var_178_0)
end

function var_0_0.PlayEnterExtraItem(arg_180_0, arg_180_1, arg_180_2, arg_180_3)
	arg_180_3 = arg_180_3 or 1

	local var_180_0 = {}

	if arg_180_2 and #arg_180_2 > 0 then
		table.Ipairs(arg_180_2, function(arg_181_0, arg_181_1)
			local var_181_0 = arg_181_1[3] and Vector3.New(unpack(arg_181_1[3]))
			local var_181_1 = arg_181_1[4] and Quaternion.Euler(unpack(arg_181_1[4]))
			local var_181_2 = #arg_181_1 > 4 and arg_181_1[5] or nil

			arg_180_0:LoadCharacterExtraItem(arg_180_1, arg_181_1[1], arg_181_1[2], var_181_0, var_181_1, var_181_2, arg_180_3)
			table.insert(var_180_0, arg_181_1[1])
		end)
	end

	arg_180_0:ResetCharacterExtraItem(arg_180_1, var_180_0)
end

function var_0_0.SetIKStatus(arg_182_0, arg_182_1, arg_182_2, arg_182_3)
	warning("Set IKStatus " .. (arg_182_2.id or "NIL"))

	arg_182_0.enableIKTip = true

	arg_182_0:ResetIKTipTimer()
	setActive(arg_182_1.ladyCollider, false)
	_.each(arg_182_1.ladyTouchColliders, function(arg_183_0)
		setActive(arg_183_0, true)
	end)

	arg_182_0.blockIK = nil

	arg_182_0:ClearIkTouchEvents(arg_182_1)

	arg_182_1.ikActionDict = {}
	arg_182_1.readyIKLayers = {}
	arg_182_1.iKTouchDatas = arg_182_2.touch_data or {}
	arg_182_1.IKSettings = {
		Colliders = arg_182_1.ladyColliders,
		CameraRaycaster = arg_182_0.sceneRaycaster
	}

	local var_182_0 = table.shallowCopy(arg_182_2.ik_id)
	local var_182_1 = {}

	_.each(arg_182_1.iKTouchDatas, function(arg_184_0)
		local var_184_0 = arg_184_0[3]

		if var_184_0[1] == 7 then
			local var_184_1 = pg.dorm3d_ik_touch_move[var_184_0[2]]
			local var_184_2 = var_184_1.target_ik

			if not _.detect(var_182_0, function(arg_185_0)
				return arg_185_0[1] == var_184_2
			end) then
				var_182_1[var_184_2] = {
					back_time = var_184_1.back_time
				}

				local var_184_3 = {
					var_184_2,
					0,
					{}
				}

				if var_184_1.trigger_dialogue > 0 then
					var_184_3[3] = {
						4,
						0,
						var_184_1.trigger_dialogue
					}
				end

				table.insert(var_182_0, var_184_3)
			end
		end
	end)

	local var_182_2 = _.map(var_182_0, function(arg_186_0)
		local var_186_0 = Dorm3dIK.New({
			configId = arg_186_0[1]
		})
		local var_186_1 = arg_186_0[3]
		local var_186_2 = var_186_1[1]
		local var_186_3 = switch(var_186_2, {
			function(arg_187_0, arg_187_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_189_0, arg_189_1)
				return arg_189_0
			end,
			function(arg_190_0, arg_190_1)
				return arg_190_0
			end,
			function(arg_191_0, arg_191_1, arg_191_2, arg_191_3)
				return arg_191_0
			end,
			function(arg_192_0)
				return 0
			end
		}, function(arg_193_0)
			return type(arg_193_0) == "number" and arg_193_0 or 0
		end, unpack(var_186_1, 2))

		table.insert(arg_182_1.readyIKLayers, var_186_0)

		arg_182_1.ikActionDict[var_186_0:GetControllerPath()] = var_186_1

		local var_186_4 = var_186_0:GetRevertTime()
		local var_186_5 = var_182_1[var_186_0:GetConfigID()]
		local var_186_6 = tobool(var_186_5)

		if var_186_6 then
			var_186_3 = var_186_5.back_time
			var_186_4 = var_186_5.back_time
			var_186_0.ignoreDrag = true
		end

		local var_186_7 = var_186_0:GetSubTargets()
		local var_186_8 = var_186_0:GetPlaneRotations()
		local var_186_9 = var_186_0:GetPlaneScales()
		local var_186_10 = _.map(_.range(#var_186_7), function(arg_194_0)
			return {
				name = var_186_7[arg_194_0][1],
				planeRot = var_186_8[arg_194_0],
				planeScale = var_186_9[arg_194_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_186_0:getConfig("trigger_param")[2],
			controllerName = var_186_0:GetControllerPath(),
			subTargets = var_186_10,
			actionType = var_186_0:GetActionTriggerParams()[1],
			controlRect = var_186_0:GetRect(),
			actionRect = var_186_0:GetTriggerRect(),
			backTime = var_186_4,
			actionRevertTime = var_186_3,
			ignoreDrag = var_186_6
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_182_1.ladyIKRoot, arg_182_1.ladyBoneMaps)
	arg_182_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_182_2)

	local var_182_3 = _.map(arg_182_1.iKTouchDatas, function(arg_195_0)
		return arg_195_0[1]
	end)

	table.Foreach(var_182_3, function(arg_196_0, arg_196_1)
		local var_196_0 = pg.dorm3d_ik_touch[arg_196_1]

		if #var_196_0.scene_item == 0 then
			return
		end

		local var_196_1 = arg_182_0:GetSceneItem(var_196_0.scene_item)

		if not var_196_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_196_1, var_196_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_196_1, typeof(UnityEngine.Collider))) then
			go(var_196_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_196_2 = GetOrAddComponent(var_196_1, typeof(EventTriggerListener))

		var_196_2.enabled = true

		var_196_2:AddPointClickFunc(function()
			arg_182_0.blockIK = true

			local var_197_0 = arg_182_1.iKTouchDatas[arg_196_0]
			local var_197_1, var_197_2, var_197_3 = unpack(var_197_0)

			arg_182_0:TouchModeAction(arg_182_1, var_197_1, unpack(var_197_3))(function()
				arg_182_0.enableIKTip = true

				arg_182_0:ResetIKTipTimer()

				arg_182_0.blockIK = nil
			end)
		end)
	end)

	arg_182_0.camBrain.enabled = false

	if arg_182_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_182_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_182_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_182_4 = arg_182_0.cameraRoot:Find(arg_182_2.ik_camera)

	assert(var_182_4, "Missing IKCamera")

	arg_182_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_182_4

	arg_182_0:ActiveCamera(arg_182_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_182_0.camBrain.enabled = true

	local var_182_5 = var_182_4:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_182_5 then
		arg_182_0:RegisterOrbits(var_182_5)
	else
		arg_182_0:RevertCameraOrbit()
	end

	arg_182_0:SwitchAnim(arg_182_1, arg_182_2.character_action)
	arg_182_0:SettingHeadAimIK(arg_182_1, arg_182_2.head_track)
	arg_182_1:EnableCloth(false)
	arg_182_1:EnableCloth(arg_182_2.use_cloth, arg_182_2.cloth_colliders)
	arg_182_0:PlayEnterSceneAnim(arg_182_2.enter_scene_anim)
	arg_182_0:PlayEnterExtraItem(arg_182_1, arg_182_2.enter_extra_item)
	;(function()
		local var_199_0 = arg_182_2.hide_scene_item

		if var_199_0 and #var_199_0 > 0 then
			arg_182_1.tempHideSceneItems = {}

			table.Ipairs(var_199_0, function(arg_200_0, arg_200_1)
				local var_200_0 = arg_182_0:GetSceneItem(arg_200_1)

				setActive(var_200_0, false)
				table.insert(arg_182_1.tempHideSceneItems, arg_200_1)
			end)
		end
	end)()
	eachChild(arg_182_0.ikTextTipsRoot, function(arg_201_0)
		setActive(arg_201_0, false)
	end)
	_.each(arg_182_1.readyIKLayers, function(arg_202_0)
		local var_202_0 = arg_202_0:getConfig("tip_text")

		if not var_202_0 or #var_202_0 == 0 then
			return
		end

		local var_202_1 = arg_182_0.ikTextTipsRoot:Find(var_202_0)

		if not IsNil(var_202_1) then
			setActive(var_202_1, true)
		end
	end)
	onNextTick(function()
		local var_203_0 = arg_182_0.furnitures:Find(arg_182_2.character_position)

		arg_182_1.lady.position = var_203_0:Find("StayPoint").position
		arg_182_1.lady.rotation = var_203_0:Find("StayPoint").rotation

		existCall(arg_182_3)
	end)
end

function var_0_0.ExitIKStatus(arg_204_0, arg_204_1, arg_204_2, arg_204_3)
	arg_204_0.enableIKTip = false

	setActive(arg_204_1.ladyCollider, true)
	_.each(arg_204_1.ladyTouchColliders, function(arg_205_0)
		setActive(arg_205_0, false)
	end)

	arg_204_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()
	setActive(arg_204_0.ikTipsRoot, false)
	setActive(arg_204_0.ikClickTipsRoot, false)
	arg_204_0:ClearIkTouchEvents(arg_204_1)

	arg_204_1.ikActionDict = nil
	arg_204_1.readyIKLayers = nil
	arg_204_1.iKTouchDatas = nil

	arg_204_0:RevertCameraOrbit()
	setActive(arg_204_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_204_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_204_1:EnableCloth(false)
	arg_204_0:ResetHeadAimIK(arg_204_1)
	arg_204_0:SwitchAnim(arg_204_1, arg_204_2.character_action)
	arg_204_0:ResetSceneItemAnimators()
	arg_204_0:ResetCharacterExtraItem(arg_204_1)
	;(function()
		if arg_204_1.tempHideSceneItems and #arg_204_1.tempHideSceneItems > 0 then
			table.Ipairs(arg_204_1.tempHideSceneItems, function(arg_207_0, arg_207_1)
				local var_207_0 = arg_204_0:GetSceneItem(arg_207_1)

				setActive(var_207_0, true)
			end)

			arg_204_1.tempHideSceneItems = nil
		end
	end)()
	onNextTick(function()
		if arg_204_2.character_position then
			arg_204_1.ladyActiveZone = arg_204_2.character_position
		else
			arg_204_1.ladyActiveZone = arg_204_1.ladyBaseZone
		end

		arg_204_0:ChangeCharacterPosition(arg_204_1)
		arg_204_0:TriggerLadyDistance()
		arg_204_0:CheckInSector()
		existCall(arg_204_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_209_0, arg_209_1, arg_209_2, arg_209_3, arg_209_4, arg_209_5)
	warning("Set IKStatus " .. (arg_209_3 or "NIL"))
	arg_209_1:SetCurrentIkTimelineStatus(arg_209_3)

	arg_209_0.enableIKTip = true

	setActive(arg_209_0.ikControlUI, true)
	arg_209_0:ResetIKTipTimer()

	arg_209_0.blockIK = nil

	local var_209_0 = pg.dorm3d_ik_timeline_status[arg_209_3]

	arg_209_1.readyIKLayers = {}
	arg_209_1.iKTouchDatas = {}
	arg_209_1.IKSettings = {
		CameraRaycaster = GetOrAddComponent(arg_209_4, typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_209_1.IKSettings.CameraRaycaster)

	local var_209_1 = {}

	table.IpairsCArray(arg_209_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_210_0, arg_210_1)
		if arg_210_1.name == "SafeCollider" then
			setActive(arg_210_1, false)

			return
		end

		if arg_210_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		local var_210_0 = tf(arg_210_1)
		local var_210_1 = var_210_0.name
		local var_210_2 = var_210_1 and string.find(var_210_1, "Collider") or -1

		if var_210_2 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_210_1)

			return
		end

		local var_210_3 = string.sub(var_210_1, 1, var_210_2 - 1)

		if var_210_3 == "Body" or var_210_3 == "Safe" then
			setActive(var_210_0, false)

			return
		end

		if DormConst.BONE_TO_TOUCH[var_210_3] == nil then
			return
		end

		var_209_1[var_210_3] = var_210_0

		setActive(var_210_0, true)
	end)

	arg_209_1.IKSettings.Colliders = var_209_1

	local var_209_2 = GetOrAddComponent(arg_209_2, typeof(EventTriggerListener))

	arg_209_1.ikTimelineMode = true

	local var_209_3 = _.map(var_209_0.ik_id, function(arg_211_0)
		local var_211_0 = Dorm3dIK.New({
			configId = arg_211_0
		})

		table.insert(arg_209_1.readyIKLayers, var_211_0)

		local var_211_1 = var_211_0:GetSubTargets()
		local var_211_2 = var_211_0:GetPlaneRotations()
		local var_211_3 = var_211_0:GetPlaneScales()
		local var_211_4 = _.map(_.range(#var_211_1), function(arg_212_0)
			return {
				name = var_211_1[arg_212_0][1],
				planeRot = var_211_2[arg_212_0],
				planeScale = var_211_3[arg_212_0]
			}
		end)

		return Dorm3dIKController.New({
			ignoreDrag = false,
			triggerName = var_211_0:getConfig("trigger_param")[2],
			controllerName = var_211_0:GetControllerPath(),
			subTargets = var_211_4,
			actionType = var_211_0:GetActionTriggerParams()[1],
			controlRect = var_211_0:GetRect(),
			actionRect = var_211_0:GetTriggerRect(),
			backTime = var_211_0:GetRevertTime(),
			actionRevertTime = var_211_0:GetActionRevertTime(),
			timelineActionEvent = var_211_0:GetTimelineAction()
		})
	end)
	local var_209_4 = arg_209_2.transform:Find("IKLayers")
	local var_209_5 = {}
	local var_209_6 = {}

	table.Foreach(DormConst.boneMap, function(arg_213_0, arg_213_1)
		var_209_6[arg_213_1] = arg_213_0
	end)

	local var_209_7 = arg_209_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_209_7, function(arg_214_0, arg_214_1)
		if var_209_6[arg_214_1.name] then
			var_209_5[var_209_6[arg_214_1.name]] = arg_214_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_209_4, var_209_5)
	arg_209_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_209_3)
	eachChild(arg_209_0.ikTextTipsRoot, function(arg_215_0)
		setActive(arg_215_0, false)
	end)
	_.each(arg_209_1.readyIKLayers, function(arg_216_0)
		local var_216_0 = arg_216_0:getConfig("tip_text")

		if not var_216_0 or #var_216_0 == 0 then
			return
		end

		local var_216_1 = arg_209_0.ikTextTipsRoot:Find(var_216_0)

		if not IsNil(var_216_1) then
			setActive(var_216_1, true)
		end
	end)
	existCall(arg_209_5)
end

function var_0_0.ExitIKTimelineStatus(arg_217_0, arg_217_1, arg_217_2)
	arg_217_1:SetCurrentIkTimelineStatus(nil)

	arg_217_0.enableIKTip = false

	setActive(arg_217_0.ikControlUI, false)

	arg_217_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_217_1.readyIKLayers = nil
	arg_217_1.iKTouchDatas = nil
	arg_217_1.IKSettings = nil

	setActive(arg_217_0.ikTipsRoot, false)
	setActive(arg_217_0.ikClickTipsRoot, false)
	existCall(arg_217_2)
end

function var_0_0.ClearIkTouchEvents(arg_218_0, arg_218_1)
	local var_218_0 = _.map(arg_218_1.iKTouchDatas or {}, function(arg_219_0)
		return arg_219_0[1]
	end)

	table.Foreach(var_218_0, function(arg_220_0, arg_220_1)
		local var_220_0 = pg.dorm3d_ik_touch[arg_220_1]

		if #var_220_0.scene_item == 0 then
			return
		end

		local var_220_1 = arg_218_0:GetSceneItem(var_220_0.scene_item)

		if not var_220_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_220_1, var_220_0.scene_item))

			return
		end

		local var_220_2 = GetOrAddComponent(var_220_1, typeof(EventTriggerListener))

		var_220_2:ClearEvents()

		var_220_2.enabled = false
	end)
end

function var_0_0.EnableIKLayer(arg_221_0, arg_221_1)
	local var_221_0 = arg_221_0.ladyDict[arg_221_0.apartment:GetConfigID()]

	if #arg_221_1:GetHeadTrackPath() > 0 then
		arg_221_0:SettingHeadAimIK(var_221_0, {
			2,
			arg_221_1:GetHeadTrackPath()
		}, true)
	end

	local var_221_1 = arg_221_1:GetTriggerFaceAnim()

	if #var_221_1 > 0 then
		arg_221_0:PlayFaceAnim(var_221_0, var_221_1)
	end

	if not arg_221_1.ignoreDrag then
		setActive(arg_221_0:GetIKHandTF(), true)
		eachChild(arg_221_0:GetIKHandTF(), function(arg_222_0)
			setActive(arg_222_0, false)
		end)
		arg_221_0:StopIKHandTimer()
		setActive(arg_221_0:GetIKHandTF():Find("Begin"), true)

		arg_221_0.ikHandTimer = Timer.New(function()
			setActive(arg_221_0:GetIKHandTF():Find("Begin"), false)
			setActive(arg_221_0:GetIKHandTF():Find("Normal"), true)
		end, 0.5, 1)

		arg_221_0.ikHandTimer:Start()
	end

	if not var_221_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_221_0.apartment.configId, arg_221_0.apartment.level, var_221_0.ikConfig.character_action, arg_221_1:GetTriggerParams()[2], arg_221_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_224_0, arg_224_1)
	local var_224_0 = arg_224_0.ladyDict[arg_224_0.apartment:GetConfigID()]

	if not var_224_0.ikTimelineMode and #arg_224_1:GetHeadTrackPath() > 0 then
		arg_224_0:SettingHeadAimIK(var_224_0, var_224_0.ikConfig.head_track)
	end

	arg_224_0:StopIKHandTimer()

	if not arg_224_1.ignoreDrag then
		setActive(arg_224_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_224_0:GetIKHandTF():Find("Normal"), false)
		setActive(arg_224_0:GetIKHandTF():Find("End"), true)

		arg_224_0.ikHandTimer = Timer.New(function()
			setActive(arg_224_0:GetIKHandTF():Find("End"), false)
			setActive(arg_224_0:GetIKHandTF(), false)
		end, 0.5, 1)

		arg_224_0.ikHandTimer:Start()
	end
end

function var_0_0.StopIKHandTimer(arg_226_0)
	if not arg_226_0.ikHandTimer then
		return
	end

	arg_226_0.ikHandTimer:Stop()

	arg_226_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_227_0, arg_227_1, arg_227_2, arg_227_3)
	local var_227_0 = Time.time

	function arg_227_0.ikRevertHandler()
		local var_228_0 = Time.time - var_227_0

		_.each(arg_227_1.activeIKLayers, function(arg_229_0)
			local var_229_0 = 1

			if arg_227_2 > 0 then
				var_229_0 = var_228_0 / arg_227_2
			end

			local var_229_1 = arg_227_1.cacheIKInfos[arg_229_0].solvers
			local var_229_2 = arg_227_1.cacheIKInfos[arg_229_0].weights

			table.Foreach(var_229_1, function(arg_230_0, arg_230_1)
				arg_230_1.IKPositionWeight = math.lerp(var_229_2[arg_230_0], 0, var_229_0)
			end)
		end)

		if var_228_0 >= arg_227_2 then
			arg_227_0:ResetActiveIKs(arg_227_1)

			arg_227_0.ikRevertHandler = nil

			existCall(arg_227_3)
		end
	end

	arg_227_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_231_0, arg_231_1)
	table.insertto(arg_231_0.activeIKLayers, _.keys(arg_231_0.holdingStatus))
	table.clear(arg_231_0.holdingStatus)
	_.each(arg_231_1.activeIKLayers, function(arg_232_0)
		local var_232_0 = arg_232_0:GetControllerPath()
		local var_232_1 = arg_231_1.ladyIKRoot:Find(var_232_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_232_1, false)

		local var_232_2 = arg_231_1.cacheIKInfos[arg_232_0].solvers
		local var_232_3 = arg_231_1.cacheIKInfos[arg_232_0].weights

		table.Foreach(var_232_2, function(arg_233_0, arg_233_1)
			arg_233_1.IKPositionWeight = var_232_3[arg_233_0]
		end)
	end)
	table.clear(arg_231_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_234_0)
	if not arg_234_0.enableIKTip then
		return
	end

	arg_234_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_235_0, arg_235_1)
	local var_235_0 = arg_235_0.ladyDict[arg_235_0.apartment:GetConfigID()]

	arg_235_0:EnableHeadIK(var_235_0, arg_235_1)
end

function var_0_0.EnableHeadIK(arg_236_0, arg_236_1, arg_236_2)
	arg_236_1.ladyHeadIKComp.enableIk = arg_236_2
end

function var_0_0.SettingHeadAimIK(arg_237_0, arg_237_1, arg_237_2, arg_237_3)
	local var_237_0

	if arg_237_2[1] == 0 then
		arg_237_0:EnableHeadIK(arg_237_1, false)

		return
	elseif arg_237_2[1] == 1 then
		arg_237_0:EnableHeadIK(arg_237_1, true)

		var_237_0 = arg_237_0.mainCameraTF:Find("AimTarget")
	elseif arg_237_2[1] == 2 then
		arg_237_0:EnableHeadIK(arg_237_1, true)
		table.IpairsCArray(arg_237_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_238_0, arg_238_1)
			if arg_238_1.name ~= arg_237_2[2] then
				return
			end

			var_237_0 = arg_238_1
		end)
	end

	arg_237_1.ladyHeadIKComp.AimTarget = var_237_0

	if not arg_237_3 and arg_237_2[3] then
		arg_237_1.ladyHeadIKComp.BodyWeight = arg_237_2[3]
	end

	if not arg_237_3 and arg_237_2[4] then
		arg_237_1.ladyHeadIKComp.HeadWeight = arg_237_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_239_0, arg_239_1)
	arg_239_0:EnableHeadIK(arg_239_1, true)

	arg_239_1.ladyHeadIKComp.AimTarget = arg_239_0.mainCameraTF:Find("AimTarget")
	arg_239_1.ladyHeadIKComp.HeadWeight = arg_239_1.ladyHeadIKData.HeadWeight
	arg_239_1.ladyHeadIKComp.BodyWeight = arg_239_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_240_0, arg_240_1)
	for iter_240_0, iter_240_1 in pairs(arg_240_0.ladyDict) do
		if iter_240_0 ~= arg_240_1 then
			arg_240_0:HideCharacterBylayer(iter_240_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_241_0, arg_241_1)
	for iter_241_0, iter_241_1 in pairs(arg_241_0.ladyDict) do
		if iter_241_0 ~= arg_241_1 then
			arg_241_0:RevertCharacterBylayer(iter_241_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_242_0, arg_242_1)
	local var_242_0 = "Bip001"
	local var_242_1 = arg_242_1.lady:Find("all")

	for iter_242_0 = 0, var_242_1.childCount - 1 do
		local var_242_2 = var_242_1:GetChild(iter_242_0)

		if var_242_2.name ~= var_242_0 then
			pg.ViewUtils.SetLayer(var_242_2, Layer.Environment3D)
		end
	end

	if arg_242_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_242_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_242_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_242_1.ladyWatchFloat, Layer.Environment3D)
	end
end

function var_0_0.RevertCharacterBylayer(arg_243_0, arg_243_1)
	local var_243_0 = "Bip001"
	local var_243_1 = arg_243_1.lady:Find("all")

	for iter_243_0 = 0, var_243_1.childCount - 1 do
		local var_243_2 = var_243_1:GetChild(iter_243_0)

		if var_243_2.name ~= var_243_0 then
			pg.ViewUtils.SetLayer(var_243_2, Layer.Character3D)
		end
	end

	if arg_243_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_243_1.tfPendintItem, Layer.Default)
	end

	if arg_243_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_243_1.ladyWatchFloat, Layer.Default)
	end
end

function var_0_0.EnterFurnitureWatchMode(arg_244_0)
	arg_244_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_244_0:EnableJoystick(true)
	arg_244_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_245_0, arg_245_1)
	arg_245_0:HideFurnitureSlots()

	local var_245_0 = arg_245_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_246_0)
			arg_245_0.furniturePOV = nil

			arg_245_0:EnableJoystick(false)
			arg_245_0:emit(var_0_0.SHOW_BLOCK)
			arg_245_0:ShowBlackScreen(true, arg_246_0)
		end,
		function(arg_247_0)
			existCall(arg_245_1)
			arg_245_0:RevertCharacter()
			arg_245_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_245_0:RegisterCameraBlendFinished(var_245_0, arg_247_0)
			arg_245_0:ActiveCamera(var_245_0)
		end,
		function(arg_248_0)
			arg_245_0:ShowBlackScreen(false, arg_248_0)
		end
	}, function()
		arg_245_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_245_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_250_0, arg_250_1)
	local var_250_0 = arg_250_0:GetFurnitureByName(arg_250_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_250_0.cameraFurnitureWatch and arg_250_0.cameraFurnitureWatch ~= var_250_0 then
		arg_250_0:UnRegisterCameraBlendFinished(arg_250_0.cameraFurnitureWatch)
		setActive(arg_250_0.cameraFurnitureWatch, false)
	end

	arg_250_0.cameraFurnitureWatch = var_250_0
	arg_250_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_250_0.cameraFurnitureWatch
	arg_250_0.furniturePOV = arg_250_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_250_0:RegisterCameraBlendFinished(arg_250_0.cameraFurnitureWatch, function()
		arg_250_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_250_0:emit(var_0_0.SHOW_BLOCK)
	arg_250_0:ActiveCamera(arg_250_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_252_0)
	if arg_252_0.displaySlots then
		arg_252_0:UpdateDisplaySlots({})
		table.Foreach(arg_252_0.displaySlots, function(arg_253_0, arg_253_1)
			local var_253_0 = arg_253_1.trans

			if IsNil(var_253_0:Find("Selector")) then
				return
			end

			setActive(var_253_0:Find("Selector"), false)
		end)

		arg_252_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_254_0, arg_254_1)
	arg_254_0:HideFurnitureSlots()

	arg_254_0.displaySlots = {}

	_.each(arg_254_1, function(arg_255_0)
		arg_254_0.displaySlots[arg_255_0] = arg_254_0.slotDict[arg_255_0]

		if not arg_254_0.displaySlots[arg_255_0] then
			errorMsg("Slot " .. arg_255_0 .. " Not Binding Scene Object")

			return
		end

		local var_255_0 = arg_254_0.displaySlots[arg_255_0].trans

		if var_255_0:Find("Selector") then
			setActive(var_255_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_256_0, arg_256_1)
	table.Foreach(arg_256_0.displaySlots, function(arg_257_0, arg_257_1)
		local var_257_0 = arg_257_1.trans

		if not IsNil(var_257_0:Find("Selector")) then
			setActive(var_257_0:Find("Selector/Normal"), arg_256_1[arg_257_0] == 0)
			setActive(var_257_0:Find("Selector/Active"), arg_256_1[arg_257_0] == 1)
			setActive(var_257_0:Find("Selector/Ban"), arg_256_1[arg_257_0] == 2)
		end

		local var_257_1 = arg_256_0.slotDict[arg_257_0].model
		local var_257_2 = arg_256_0.slotDict[arg_257_0].displayModelName

		if var_257_2 and var_257_2 ~= "" then
			var_257_1 = var_257_0:GetChild(var_257_0.childCount - 1)
		end

		local function var_257_3(arg_258_0, arg_258_1)
			local var_258_0 = arg_258_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_258_0, function(arg_259_0, arg_259_1)
				local var_259_0 = arg_259_1.material

				if var_259_0 and var_259_0:HasProperty("_FinalTint") then
					var_259_0:SetColor("_FinalTint", arg_258_1)
				end
			end)
		end

		if var_257_1 then
			if arg_256_1[arg_257_0] == 1 then
				var_257_3(var_257_1, Color.NewHex("3F83AE73"))
			else
				var_257_3(var_257_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_260_0, arg_260_1, arg_260_2)
	arg_260_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_260_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_261_0)
			arg_260_0:TempHideUI(true, arg_261_0)
		end,
		function(arg_262_0)
			arg_260_0:ShowBlackScreen(true, arg_262_0)
		end,
		function(arg_263_0)
			local var_263_0 = arg_260_0.apartment:GetConfigID()
			local var_263_1 = arg_260_0.ladyDict[var_263_0]

			arg_260_0:SwitchAnim(var_263_1, arg_260_2)
			var_263_1.ladyAnimator:Update(0)
			arg_260_0:ResetCharPoint(var_263_1, arg_260_1:GetWatchCameraName())
			arg_260_0:SyncInterestTransform(var_263_1)
			setActive(var_263_1.ladySafeCollider, true)
			arg_260_0:HideCharacter(var_263_0)

			local var_263_2 = arg_260_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_263_3 = var_263_2.m_XAxis

			var_263_3.Value = 180
			var_263_2.m_XAxis = var_263_3

			local var_263_4 = var_263_2.m_YAxis

			var_263_4.Value = 0.7
			var_263_2.m_YAxis = var_263_4
			arg_260_0.pinchValue = 1

			arg_260_0:RegisterOrbits(arg_260_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_260_0:SetCameraObrits()
			setActive(arg_260_0.restrictedBox, true)
			arg_260_0:RegisterCameraBlendFinished(var_263_2, arg_263_0)
			arg_260_0:ActiveCamera(var_263_2)
		end,
		function(arg_264_0)
			arg_260_0:ShowBlackScreen(false, arg_264_0)
		end
	}, function()
		arg_260_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_266_0)
	arg_266_0:emit(var_0_0.SHOW_BLOCK)
	arg_266_0:EnableJoystick(false)
	seriesAsync({
		function(arg_267_0)
			arg_266_0:ShowBlackScreen(true, arg_267_0)
		end,
		function(arg_268_0)
			arg_266_0:RevertCameraOrbit()

			local var_268_0 = arg_266_0.ladyDict[arg_266_0.apartment:GetConfigID()]

			arg_266_0:SwitchAnim(var_268_0, var_0_0.ANIM.IDLE)
			setActive(var_268_0.ladySafeCollider, false)
			onNextTick(function()
				arg_266_0:ChangeCharacterPosition(var_268_0)
			end)

			if arg_266_0.contextData.photoFreeMode then
				arg_266_0:EnablePOVLayer(false)

				arg_266_0.contextData.photoFreeMode = nil
			end

			setActive(arg_266_0.restrictedBox, false)

			local var_268_1 = arg_266_0.cameras[var_0_0.CAMERA.POV]

			arg_266_0:RegisterCameraBlendFinished(var_268_1, arg_268_0)
			arg_266_0:ActiveCamera(var_268_1)
		end,
		function(arg_270_0)
			arg_266_0:RevertCharacter(arg_266_0.apartment:GetConfigID())
			arg_266_0:ShowBlackScreen(false, arg_270_0)
		end
	}, function()
		arg_266_0:RefreshSlots()
		arg_266_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_266_0:emit(var_0_0.HIDE_BLOCK)
		arg_266_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_266_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_272_0, arg_272_1, arg_272_2, arg_272_3)
	arg_272_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_273_0)
			arg_272_0:ShowBlackScreen(true, arg_273_0)
		end,
		function(arg_274_0)
			local var_274_0 = arg_272_0.ladyDict[arg_272_0.apartment:GetConfigID()]

			arg_272_0:SwitchAnim(var_274_0, arg_272_2)
			onNextTick(function()
				arg_272_0:ResetCharPoint(var_274_0, arg_272_1:GetWatchCameraName())
				arg_272_0:SyncInterestTransform(var_274_0)

				if arg_272_0.contextData.photoFreeMode then
					arg_272_0.camBrain.enabled = false

					arg_272_0:SwitchPhotoCamera()

					arg_272_0.camBrain.enabled = true

					onDelayTick(function()
						arg_272_0.camBrain.enabled = false

						arg_272_0:SwitchPhotoCamera()

						arg_272_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_274_0()
			end)
		end,
		function(arg_277_0)
			arg_272_0:ShowBlackScreen(false, arg_277_0)
		end
	}, function()
		arg_272_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_272_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_279_0)
	if not arg_279_0.contextData.photoFreeMode then
		arg_279_0:EnableJoystick(false)
		arg_279_0:EnablePOVLayer(true)

		local var_279_0 = arg_279_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
		local var_279_1 = arg_279_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_279_2 = arg_279_0.mainCameraTF.rotation:ToEulerAngles()
		local var_279_3 = var_279_1.m_HorizontalAxis

		var_279_3.Value = var_279_2.y
		var_279_1.m_HorizontalAxis = var_279_3

		local var_279_4 = var_279_1.m_VerticalAxis

		var_279_4.Value = arg_279_0:GetNearestAngle(var_279_2.x, var_279_4.m_MinValue, var_279_4.m_MaxValue)
		var_279_1.m_VerticalAxis = var_279_4

		local var_279_5 = arg_279_0.mainCameraTF.position
		local var_279_6 = arg_279_0:GetRestritedHeightRange()
		local var_279_7 = math.InverseLerp(var_279_6[1], var_279_6[2], var_279_5.y)

		var_279_5.y = math.clamp(var_279_5.y, var_279_6[1], var_279_6[2])
		var_279_0.transform.position = var_279_5

		arg_279_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_279_7)
		arg_279_0:ActiveCamera(arg_279_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_279_0:EnableJoystick(true)
		arg_279_0:EnablePOVLayer(false)
		arg_279_0:ActiveCamera(arg_279_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_279_0.contextData.photoFreeMode = not arg_279_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_280_0, arg_280_1)
	local var_280_0 = arg_280_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
	local var_280_1 = arg_280_0:GetRestritedHeightRange()
	local var_280_2 = math.lerp(var_280_1[1], var_280_1[2], arg_280_1)

	var_280_0:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_280_2 - var_280_0.position.y, 0))
	onNextTick(function()
		local var_281_0 = arg_280_0:GetRestritedHeightRange()
		local var_281_1 = math.InverseLerp(var_281_0[1], var_281_0[2], var_280_0.position.y)

		arg_280_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_281_1)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_282_0)
	local var_282_0 = arg_282_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_282_1 = var_282_0.m_XAxis

	var_282_1.Value = 180
	var_282_0.m_XAxis = var_282_1

	local var_282_2 = var_282_0.m_YAxis

	var_282_2.Value = 0.7
	var_282_0.m_YAxis = var_282_2
end

function var_0_0.ResetCurrentCharPoint(arg_283_0, arg_283_1)
	local var_283_0 = arg_283_0.ladyDict[arg_283_0.apartment:GetConfigID()]

	arg_283_0:ResetCharPoint(var_283_0, arg_283_1)
end

function var_0_0.ResetCharPoint(arg_284_0, arg_284_1, arg_284_2)
	local var_284_0 = arg_284_0.furnitures:Find(arg_284_2 .. "/StayPoint")

	arg_284_1.lady.position = var_284_0.position
	arg_284_1.lady.rotation = var_284_0.rotation
end

function var_0_0.GetNearestAngle(arg_285_0, arg_285_1, arg_285_2, arg_285_3)
	if arg_285_3 < arg_285_2 then
		arg_285_3 = arg_285_3 + 360
	end

	if arg_285_2 <= arg_285_1 and arg_285_1 <= arg_285_3 then
		return arg_285_1
	end

	local var_285_0 = (arg_285_2 + arg_285_3) / 2

	arg_285_1 = var_285_0 - Mathf.DeltaAngle(arg_285_1, var_285_0)
	arg_285_1 = math.clamp(arg_285_1, arg_285_2, arg_285_3)

	return arg_285_1
end

function var_0_0.PlayTimeline(arg_286_0, arg_286_1, arg_286_2)
	local var_286_0 = {}

	if arg_286_0.waitForTimeline then
		table.insert(var_286_0, function(arg_287_0)
			local var_287_0 = arg_286_0.waitForTimeline

			arg_286_0.waitForTimeline = nil

			var_287_0()
			arg_287_0()
		end)
	end

	table.insert(var_286_0, function(arg_288_0)
		arg_286_0:LoadTimelineScene(arg_286_1.name, false, nil, arg_288_0)
	end)

	if arg_286_1.scene and arg_286_1.sceneRoot then
		table.insert(var_286_0, function(arg_289_0)
			arg_286_0:ChangeArtScene(arg_286_1.scene .. "|" .. arg_286_1.sceneRoot, arg_289_0)
		end)
	end

	table.insert(var_286_0, function(arg_290_0)
		local var_290_0 = GameObject.Find("[actor]").transform
		local var_290_1 = var_290_0:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_290_1, function(arg_291_0, arg_291_1)
			GetOrAddComponent(arg_291_1.transform, typeof(DftAniEvent))
		end)

		local var_290_2 = var_290_0:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform
		local var_290_3

		eachChild(GameObject.Find("[camera]").transform, function(arg_292_0)
			if arg_292_0.tag == "MainCamera" then
				var_290_3 = arg_292_0
			end
		end)
		assert(var_290_3, "Missing MainCamera")

		local var_290_4 = GameObject.Find("[sequence]").transform

		arg_286_0.nowTimelinePlayer = TimelinePlayer.New(var_290_4)

		TimelineSupport.InitSubtitle(arg_286_0.nowTimelinePlayer.comDirector, arg_286_0.apartment:GetCallName())
		arg_286_0.nowTimelinePlayer:Register(arg_286_1.time, function(arg_293_0, arg_293_1, arg_293_2)
			switch(arg_293_1.stringParameter, {
				TimelinePause = function()
					arg_293_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_293_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_293_1.intParameter == 0 or arg_293_1.intParameter == arg_293_2.selectIndex then
						arg_293_0:SetTime(arg_293_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_293_2.selectIndex = nil

					if arg_286_1.options then
						local var_297_0 = arg_286_1.options[arg_293_1.intParameter]

						arg_286_0:DoTimelineOption(var_297_0, function(arg_298_0)
							arg_293_2.selectIndex = arg_298_0
							arg_293_2.optionIndex = var_297_0[arg_298_0].flag

							arg_293_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_293_2.selectIndex = nil

					if arg_286_1.touchs then
						local var_299_0 = arg_286_1.touchs[arg_293_1.intParameter]

						arg_286_0:DoTimelineTouch(arg_286_1.touchs[arg_293_1.intParameter], function(arg_300_0)
							arg_293_2.selectIndex = arg_300_0
							arg_293_2.optionIndex = var_299_0[arg_300_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_293_2.selectIndex then
						arg_293_0:RawSetTime(arg_293_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_293_2.selectIndex = arg_293_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_286_0.canTriggerAccompanyPerformance then
						arg_286_0.canTriggerAccompanyPerformance = false

						local var_303_0 = arg_286_1.accompanys[arg_293_1.intParameter]
						local var_303_1 = var_303_0[math.random(#var_303_0)]

						arg_293_0:SetTime(var_303_1)
					end
				end,
				TimelineIKStart = function()
					arg_293_2.selectIndex = nil

					local var_304_0 = arg_293_1.intParameter
					local var_304_1 = arg_286_0.ladyDict[arg_286_0.apartment:GetConfigID()]

					if var_304_1:CheckIkTimelineStatus(var_304_0) then
						arg_286_0:SetIKTimelineStatus(var_304_1, var_290_2.gameObject, var_304_0, var_290_3)
					end
				end,
				TimelineEnd = function()
					arg_293_2.finish = true

					arg_293_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_293_1.stringParameter)
			end)

			if arg_293_2.finish then
				arg_286_0.timelineMark = arg_293_2
				arg_286_0.timelineFinishCall = nil

				local var_293_0 = arg_286_0.ladyDict[arg_286_0.apartment:GetConfigID()]

				if var_293_0.ikTimelineMode then
					arg_286_0:ExitIKTimelineStatus(var_293_0)
				end

				arg_290_0()
			end
		end)

		function arg_286_0.timelineFinishCall()
			arg_286_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_286_0:HideCharacter()
		setActive(arg_286_0.mainCameraTF, false)
		setActive(var_290_3, true)
		eachChild(arg_286_0.rtTimelineScreen, function(arg_308_0)
			setActive(arg_308_0, false)
		end)
		setActive(arg_286_0.rtTimelineScreen, true)
		setActive(arg_286_0.rtTimelineScreen:Find("btn_skip"), arg_286_0.inReplayTalk)
		arg_286_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_286_0, function(arg_309_0)
		arg_286_0:ShowBlackScreen(true, function()
			arg_286_0.nowTimelinePlayer:Stop()
			arg_286_0.nowTimelinePlayer:Dispose()

			arg_286_0.nowTimelinePlayer = nil

			arg_286_0:UnloadTimelineScene(arg_286_1.name, false, arg_309_0)
		end)
	end)

	local var_286_1 = arg_286_0.dormSceneMgr.artSceneInfo

	table.insert(var_286_0, function(arg_311_0)
		arg_286_0:RevertArtScene(var_286_1, arg_311_0)
	end)
	seriesAsync(var_286_0, function()
		setActive(arg_286_0.rtTimelineScreen, false)
		arg_286_0:RevertCharacter()
		setActive(arg_286_0.mainCameraTF, true)

		local var_312_0 = arg_286_0.timelineMark

		arg_286_0.timelineMark = nil

		existCall(arg_286_2, var_312_0, function(arg_313_0)
			arg_286_0:ShowBlackScreen(false, arg_313_0)
		end)
	end)
end

function var_0_0.PlayCurrentSingleAction(arg_314_0, ...)
	local var_314_0 = arg_314_0.ladyDict[arg_314_0.apartment:GetConfigID()]

	return arg_314_0:PlaySingleAction(var_314_0, ...)
end

function var_0_0.PlaySingleAction(arg_315_0, arg_315_1, arg_315_2, arg_315_3, arg_315_4)
	arg_315_1:PlaySingleAction(arg_315_2, arg_315_3, arg_315_4)
end

function var_0_0.SwitchCurrentAnim(arg_316_0, ...)
	local var_316_0 = arg_316_0.ladyDict[arg_316_0.apartment:GetConfigID()]

	return arg_316_0:SwitchAnim(var_316_0, ...)
end

function var_0_0.SwitchAnim(arg_317_0, arg_317_1, arg_317_2, arg_317_3)
	arg_317_1:SwitchAnim(arg_317_2, arg_317_3)
end

function var_0_0.PlayFaceAnim(arg_318_0, arg_318_1, arg_318_2, arg_318_3)
	arg_318_1:PlayFaceAnim(arg_318_2, arg_318_3)
end

function var_0_0.RegisterAnimCallback(arg_319_0, arg_319_1, arg_319_2)
	arg_319_0.ladyDict[arg_319_0.apartment:GetConfigID()].animCallbacks[arg_319_1] = arg_319_2
end

function var_0_0.SetCharacterAnimSpeed(arg_320_0, arg_320_1)
	local var_320_0 = arg_320_0.ladyDict[arg_320_0.apartment:GetConfigID()]

	var_320_0.ladyAnimator.speed = arg_320_1
	var_320_0.ladyHeadIKComp.blinkSpeed = var_320_0.ladyHeadIKData.blinkSpeed * arg_320_1

	if arg_320_1 > 0 then
		var_320_0.ladyHeadIKComp.DampTime = var_320_0.ladyHeadIKData.DampTime / arg_320_1
	else
		var_320_0.ladyHeadIKComp.DampTime = var_320_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_321_0, arg_321_1)
	if arg_321_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_321_0 = arg_321_1.stringParameter
	local var_321_1 = table.removebykey(arg_321_0.animEventCallbacks, var_321_0)

	existCall(var_321_1)
end

function var_0_0.RegisterAnimEventCallback(arg_322_0, arg_322_1, arg_322_2)
	arg_322_0.animEventCallbacks[arg_322_1] = arg_322_2
end

function var_0_0.PlaySceneItemAnim(arg_323_0, arg_323_1, arg_323_2, arg_323_3)
	arg_323_0.sceneAnimatorDict = arg_323_0.sceneAnimatorDict or {}

	if not arg_323_0.sceneAnimatorDict[arg_323_1] then
		local var_323_0 = pg.dorm3d_scene_animator[arg_323_1]
		local var_323_1 = arg_323_0:GetSceneItem(var_323_0.item_name)

		assert(var_323_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_323_1 .. " " .. var_323_0.item_name)

		if not var_323_1 then
			return
		end

		local var_323_2 = var_323_1:GetComponent(typeof(Animator))

		if not var_323_2 then
			return
		end

		arg_323_0.sceneAnimatorDict[arg_323_1] = {
			trans = var_323_1,
			animator = var_323_2
		}
	end

	if not arg_323_3 and arg_323_0.sceneAnimatorDict[arg_323_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_323_2) then
		return
	end

	arg_323_0.sceneAnimatorDict[arg_323_1].animator:PlayInFixedTime(arg_323_2)
end

function var_0_0.ResetSceneItemAnimators(arg_324_0, arg_324_1)
	if not arg_324_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_324_0.sceneAnimatorDict, function(arg_325_0, arg_325_1)
		if arg_324_1 and table.contains(arg_324_1, arg_325_0) then
			return
		end

		setActive(arg_325_1.trans, false)
		setActive(arg_325_1.trans, true)

		arg_324_0.sceneAnimatorDict[arg_325_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_326_0, arg_326_1, arg_326_2, arg_326_3, arg_326_4, arg_326_5, arg_326_6, arg_326_7)
	local function var_326_0(arg_327_0)
		if arg_326_6 then
			local var_327_0 = arg_327_0:GetComponent(typeof(Animator))

			if var_327_0 then
				var_327_0:Play(arg_326_6)

				var_327_0.speed = arg_326_7
			end
		end
	end

	arg_326_1.extraItems = arg_326_1.extraItems or {}

	if arg_326_1.extraItems[arg_326_2] then
		var_326_0(arg_326_1.extraItems[arg_326_2].trans)

		return
	end

	local var_326_1

	if arg_326_3 == "" then
		var_326_1 = arg_326_1.lady
	elseif arg_326_3 == "scene_root" then
		var_326_1 = arg_326_0.modelRoot
	else
		table.IpairsCArray(arg_326_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_328_0, arg_328_1)
			if arg_328_1.name == arg_326_3 then
				var_326_1 = arg_328_1
			end
		end)
	end

	if not var_326_1 then
		return
	end

	arg_326_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_326_2), "", function(arg_329_0)
		setParent(arg_329_0, var_326_1)

		if arg_326_4 then
			setLocalPosition(arg_329_0, arg_326_4)
		end

		if arg_326_5 then
			setLocalRotation(arg_329_0, arg_326_5)
		end

		var_326_0(arg_329_0)

		arg_326_1.extraItems[arg_326_2] = {
			trans = arg_329_0.transform,
			handler = var_326_1
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_330_0, arg_330_1, arg_330_2)
	if not arg_330_1.extraItems then
		return
	end

	table.Foreach(arg_330_1.extraItems, function(arg_331_0, arg_331_1)
		if arg_330_2 and table.contains(arg_330_2, arg_331_0) then
			return
		end

		arg_330_0.loader:ReturnPrefab(arg_331_1.trans.gameObject)

		arg_330_1.extraItems[arg_331_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_332_0, arg_332_1, arg_332_2)
	arg_332_0.cameraBlendCallbacks[arg_332_1] = arg_332_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_333_0, arg_333_1)
	arg_333_0.cameraBlendCallbacks[arg_333_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_334_0, arg_334_1)
	if not arg_334_1 then
		return
	end

	local var_334_0 = table.removebykey(arg_334_0.cameraBlendCallbacks, arg_334_1)

	existCall(var_334_0)
end

function var_0_0.PlayHeartFX(arg_335_0, arg_335_1)
	local var_335_0 = arg_335_0.ladyDict[arg_335_1]

	setActive(var_335_0.effectHeart, false)
	setActive(var_335_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_336_0, arg_336_1)
	local var_336_0 = arg_336_1.name
	local var_336_1 = arg_336_0.expressionDict[var_336_0]
	local var_336_2 = 5

	if var_336_1 then
		local var_336_3 = var_336_1.timer

		var_336_3:Reset(nil, var_336_2)
		var_336_3:Start()

		if var_336_1.instance then
			setActive(var_336_1.instance, false)
			setActive(var_336_1.instance, true)
		end

		return
	end

	local var_336_4 = {
		name = var_336_0,
		timer = Timer.New(function()
			arg_336_0:RemoveExpression(var_336_0)
		end, var_336_2, 1, true)
	}

	arg_336_0.expressionDict[var_336_0] = var_336_4

	arg_336_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_336_0, var_336_0, function(arg_338_0)
		var_336_4.instance = arg_338_0

		onNextTick(function()
			local var_339_0 = arg_336_0.ladyDict[arg_336_0.apartment:GetConfigID()]

			setParent(arg_338_0, var_339_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_338_0, Vector3(0, 0, -0.2))
		setActive(arg_338_0, false)
		setActive(arg_338_0, true)
	end, var_336_4)
end

function var_0_0.RemoveExpression(arg_340_0, arg_340_1)
	local var_340_0 = arg_340_0.expressionDict[arg_340_1]

	if not var_340_0 then
		return
	end

	arg_340_0.loader:ClearRequest(var_340_0)

	if var_340_0.instance then
		arg_340_0.loader:ReturnPrefab(var_340_0.instance)
	end

	arg_340_0.expressionDict[arg_340_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_341_0, arg_341_1, arg_341_2)
	setActive(arg_341_1.ladyWatchFloat, arg_341_2)
end

function var_0_0.RegisterGlobalVolume(arg_342_0)
	local var_342_0 = arg_342_0.globalVolume
	local var_342_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_342_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_342_2 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_342_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	arg_342_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_342_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_342_1.gaussianStart.min,
				value = var_342_1.gaussianStart.value
			},
			blurRadius = {
				min = var_342_1.blurRadius.min,
				max = var_342_1.blurRadius.max,
				value = var_342_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_342_2.postExposure.value
		},
		contrast = {
			min = var_342_2.contrast.min,
			max = var_342_2.contrast.max,
			value = var_342_2.contrast.value
		},
		saturate = {
			min = var_342_2.saturation.min,
			max = var_342_2.saturation.max,
			value = var_342_2.saturation.value
		}
	}
	arg_342_0.originalCameraSettings.depthOfField.enabled = true

	local var_342_3 = var_342_0:GetComponent(typeof(UnityEngine.Rendering.Volume))

	arg_342_0.originalVolume = {
		profile = var_342_3.sharedProfile,
		weight = var_342_3.weight
	}
end

function var_0_0.SettingCamera(arg_343_0, arg_343_1)
	arg_343_0.activeCameraSettings = arg_343_1

	local var_343_0 = arg_343_0.globalVolume
	local var_343_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_343_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_343_2 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_343_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	var_343_1.enabled:Override(arg_343_1.depthOfField.enabled)
	var_343_1.gaussianStart:Override(arg_343_1.depthOfField.focusDistance.value)
	var_343_1.gaussianEnd:Override(arg_343_1.depthOfField.focusDistance.value + arg_343_1.depthOfField.focusDistance.length)
	var_343_1.blurRadius:Override(arg_343_1.depthOfField.blurRadius.value)
	var_343_2.postExposure:Override(arg_343_1.postExposure.value)
	var_343_2.contrast:Override(arg_343_1.contrast.value)
	var_343_2.saturation:Override(arg_343_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_344_0)
	return arg_344_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_345_0)
	arg_345_0:SettingCamera(arg_345_0.originalCameraSettings)

	arg_345_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_346_0, arg_346_1, arg_346_2)
	if arg_346_0.cameraVolume then
		arg_346_0:RevertVolumeProfile()
	end

	arg_346_0.loader:GetPrefab("dorm3d/effect/volume/" .. arg_346_1, "", function(arg_347_0)
		arg_346_0.cameraVolume = arg_347_0
	end)
end

function var_0_0.RevertVolumeProfile(arg_348_0)
	if arg_348_0.cameraVolume then
		arg_348_0.loader:ReturnPrefab(arg_348_0.cameraVolume)

		arg_348_0.cameraVolume = nil
	end
end

function var_0_0.RecordCharacterLight(arg_349_0)
	tolua.loadassembly("Yongshi.BLRP.Runtime.AOT")

	local var_349_0 = arg_349_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	arg_349_0.originalCharacterColor = {
		color = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_349_0),
		intensity = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_349_0)
	}
end

function var_0_0.SetCharacterLight(arg_350_0, arg_350_1, arg_350_2, arg_350_3)
	local var_350_0 = arg_350_0.characterLight:GetComponent(typeof(Light))
	local var_350_1 = Color.Lerp(arg_350_0.originalCharacterColor.color, arg_350_1, arg_350_3)
	local var_350_2 = math.lerp(arg_350_0.originalCharacterColor.intensity, arg_350_2, arg_350_3)
	local var_350_3 = arg_350_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_350_3, var_350_1)
	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_350_3, var_350_2)
end

function var_0_0.RevertCharacterLight(arg_351_0)
	arg_351_0:SetCharacterLight(arg_351_0.originalCharacterColor.color, arg_351_0.originalCharacterColor.intensity, 1)
end

function var_0_0.onBackPressed(arg_352_0)
	if arg_352_0.exited or arg_352_0.retainCount > 0 then
		-- block empty
	else
		arg_352_0:closeView()
	end
end

function var_0_0.LoadTimelineScene(arg_353_0, arg_353_1, arg_353_2, arg_353_3, arg_353_4)
	arg_353_0.dormSceneMgr:LoadTimelineScene({
		name = arg_353_1,
		assetRootName = arg_353_0.apartment:getConfig("asset_name"),
		isCache = arg_353_2,
		waitForTimeline = arg_353_3,
		loadSceneFunc = function(arg_354_0, arg_354_1)
			local var_354_0 = GameObject.Find("[actor]").transform

			arg_353_0:HXCharacter(tf(var_354_0))
		end
	}, arg_353_4)
end

function var_0_0.UnloadTimelineScene(arg_355_0, arg_355_1, arg_355_2, arg_355_3)
	arg_355_0.dormSceneMgr:UnloadTimelineScene(arg_355_1, arg_355_2, arg_355_3)
end

function var_0_0.ChangeArtScene(arg_356_0, arg_356_1, arg_356_2)
	local var_356_0 = {}

	table.insert(var_356_0, function(arg_357_0)
		arg_356_0.dormSceneMgr:ChangeArtScene(arg_356_1, arg_357_0)
	end)
	table.insert(var_356_0, function(arg_358_0)
		setActive(arg_356_0.slotRoot, false)
		arg_358_0()
	end)
	warning(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", arg_356_1, arg_356_0.dormSceneMgr.sceneInfo, Dorm3dSceneMgr.IsSameSceneInfo(arg_356_1, arg_356_0.dormSceneMgr.sceneInfo))

	if Dorm3dSceneMgr.IsSameSceneInfo(arg_356_1, arg_356_0.dormSceneMgr.sceneInfo) then
		table.insert(var_356_0, function(arg_359_0)
			arg_356_0:SwitchDayNight(1)
			arg_356_0:TempHideContact(true)
			arg_359_0()
		end)
	end

	seriesAsync(var_356_0, arg_356_2)
end

function var_0_0.RevertArtScene(arg_360_0, arg_360_1, arg_360_2)
	local var_360_0 = {}

	table.insert(var_360_0, function(arg_361_0)
		arg_360_0.dormSceneMgr:ChangeArtScene(arg_360_1, arg_361_0)
	end)
	table.insert(var_360_0, function(arg_362_0)
		setActive(arg_360_0.slotRoot, true)
		arg_362_0()
	end)
	table.insert(var_360_0, function(arg_363_0)
		arg_360_0:SwitchDayNight(arg_360_0.contextData.timeIndex)
		onNextTick(function()
			arg_360_0:RefreshSlots()
			arg_360_0:TempHideContact(false)
			arg_363_0()
		end)
	end)
	seriesAsync(var_360_0, arg_360_2)
end

function var_0_0.ChangeSubScene(arg_365_0, arg_365_1, arg_365_2)
	local var_365_0 = {}

	table.insert(var_365_0, function(arg_366_0)
		arg_365_0.dormSceneMgr:ChangeSubScene(arg_365_1, arg_366_0)
	end)

	local var_365_1 = arg_365_0.ladyDict[arg_365_0.apartment:GetConfigID()]

	table.insert(var_365_0, function(arg_367_0)
		if Dorm3dSceneMgr.IsSameSceneInfo(arg_365_1, arg_365_0.dormSceneMgr.sceneInfo) then
			var_365_1.ladyActiveZone = var_365_1.walkBornPoint or var_365_1.ladyBaseZone
		else
			var_365_1.ladyActiveZone = var_365_1.walkBornPoint or "Default"
		end

		arg_367_0()
	end)

	if not Dorm3dSceneMgr.IsSameSceneInfo(arg_365_1, arg_365_0.dormSceneMgr.subSceneInfo) then
		table.insert(var_365_0, function(arg_368_0)
			local var_368_0, var_368_1 = Dorm3dSceneMgr.ParseInfo(arg_365_1)
			local var_368_2 = var_368_0 .. "_base"

			arg_365_0:ResetSceneStructure(SceneManager.GetSceneByName(var_368_2))

			if Dorm3dSceneMgr.IsSameSceneInfo(arg_365_1, arg_365_0.dormSceneMgr.sceneInfo) then
				arg_365_0:RefreshSlots()
			else
				arg_365_0:SwitchAnim(var_365_1, var_0_0.ANIM.IDLE)
			end

			if not Dorm3dSceneMgr.IsSameSceneInfo(arg_365_0.dormSceneMgr.subSceneInfo, arg_365_0.dormSceneMgr.sceneInfo) then
				arg_365_0:RefreshSlotsEmpty()
			end

			arg_368_0()
		end)
	end

	table.insert(var_365_0, function(arg_369_0)
		onNextTick(function()
			arg_365_0:ChangeCharacterPosition(var_365_1)
			arg_365_0:ChangePlayerPosition(var_365_1.ladyActiveZone)
			arg_365_0:TriggerLadyDistance()
			arg_365_0:CheckInSector()
			arg_369_0()
		end)
	end)
	seriesAsync(var_365_0, arg_365_2)
end

function var_0_0.IsPointInSector(arg_371_0, arg_371_1)
	local var_371_0 = arg_371_1 - arg_371_0.Position

	if var_371_0.y > arg_371_0.Radius then
		return false
	end

	var_371_0.y = 0

	if var_371_0.magnitude > arg_371_0.Radius then
		return false
	end

	local var_371_1 = arg_371_0.Rotation

	return Vector3.Angle(var_371_1 * Vector3.forward, var_371_0) <= arg_371_0.Angle / 2
end

function var_0_0.GetRestritedHeightRange(arg_372_0)
	if not arg_372_0.isMultiFloor then
		return arg_372_0.restrictedHeightRange
	else
		for iter_372_0 = #arg_372_0.restrictedHeightRange, 1, -1 do
			local var_372_0 = arg_372_0.restrictedHeightRange[iter_372_0]

			if arg_372_0.mainCameraTF.position.y >= var_372_0[1] then
				return var_372_0
			end
		end

		return arg_372_0.restrictedHeightRange[1]
	end
end

function var_0_0.willExit(arg_373_0)
	arg_373_0:RemoveExtraSystem()
	arg_373_0.joystickTimer:Stop()
	arg_373_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_373_0.updateHandler)
	arg_373_0:StopIKHandTimer()

	if arg_373_0.moveTimer then
		arg_373_0.moveTimer:Stop()

		arg_373_0.moveTimer = nil
	end

	if arg_373_0.moveWaitTimer then
		arg_373_0.moveWaitTimer:Stop()

		arg_373_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_373_0.furnitures) then
		eachChild(arg_373_0.furnitures, function(arg_374_0)
			local var_374_0 = GetComponent(arg_374_0, typeof(EventTriggerListener))

			if not var_374_0 then
				return
			end

			var_374_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_373_0, iter_373_1 in pairs(arg_373_0.ladyDict) do
		GetComponent(iter_373_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_373_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_373_0.camBrainEvenetHandler.OnBlendFinished = nil

	arg_373_0:UnOverlayPanel(arg_373_0.blockLayer, arg_373_0._tf)
	table.Foreach(arg_373_0.expressionDict, function(arg_375_0)
		arg_373_0:RemoveExpression(arg_375_0)
	end)
	arg_373_0.loader:Clear()
	pg.ClickEffectMgr.GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()
	arg_373_0.dormSceneMgr:Dispose()

	arg_373_0.dormSceneMgr = nil

	ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)

	if arg_373_0.transformFilter then
		arg_373_0.transformFilter:Dispose()
	end
end

return var_0_0
