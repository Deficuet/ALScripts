local var_0_0 = class("Dorm3dRoomTemplateScene", import("view.dorm3d.Core.Dorm3dBaseScene"))

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
var_0_0.SHOW_BLOCK = "Dorm3dRoomTemplateScene.SHOW_BLOCK"
var_0_0.HIDE_BLOCK = "Dorm3dRoomTemplateScene.HIDE_BLOCK"
var_0_0.ON_ROLEWATCH_CAMERA_MAX = "Dorm3dRoomTemplateScene.ON_ROLEWATCH_CAMERA_MAX"
var_0_0.ON_STICK_MOVE = "Dorm3dRoomTemplateScene.ON_STICK_MOVE"
var_0_0.ENABLE_SCENEBLOCK = "Dorm3dRoomTemplateScene.ENABLE_SCENEBLOCK"
var_0_0.ON_POV_STICK_MOVE_BEGIN = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE_BEGIN"
var_0_0.ON_POV_STICK_MOVE = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE"
var_0_0.ON_POV_STICK_MOVE_END = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE_END"
var_0_0.ON_POV_STICK_VIEW = "Dorm3dRoomTemplateScene.ON_POV_STICK_VIEW"
var_0_0.ON_ENTER_SECTOR = "Dorm3dRoomTemplateScene.ON_ENTER_SECTOR"
var_0_0.ON_CHANGE_DISTANCE = "Dorm3dRoomTemplateScene.ON_CHANGE_DISTANCE"
var_0_0.CLICK_CHARACTER = "Dorm3dRoomTemplateScene.CLICK_CHARACTER"
var_0_0.DISTANCE_TRIGGER = "Dorm3dRoomTemplateScene.DISTANCE_TRIGGER"
var_0_0.WALK_DISTANCE_TRIGGER = "Dorm3dRoomTemplateScene.WALK_DISTANCE_TRIGGER"
var_0_0.CHANGE_WATCH = "Dorm3dRoomTemplateScene.CHANGE_WATCH"
var_0_0.PHOTO_CALL = "Dorm3dRoomTemplateScene.PHOTO_CALL"
var_0_0.SHIFT_ZONE_SAFE = "Dorm3dRoomTemplateScene.SHIFT_ZONE_SAFE"
var_0_0.TIMELINE_END = "Dorm3dRoomTemplateScene.TIMELINE_END"
var_0_0.TRIGGER_TIMELINE_PLAYER_EVENT = "Dorm3dRoomTemplateScene.TRIGGER_TIMELINE_PLAYER_EVENT"
var_0_0.EXTRA_GET_SCREEN_POSITION = "Dorm3dRoomTemplateScene.EXTRA_GET_SCREEN_POSITION"
var_0_0.EXTRA_CHANGE_PLAYER_POSITION = "Dorm3dRoomTemplateScene.EXTRA_CHANGE_PLAYER_POSITION"
var_0_0.EXTRA_CHANGE_CHARACTER_POSITION = "Dorm3dRoomTemplateScene.EXTRA_CHANGE_CHARACTER_POSITION"
var_0_0.EXTRA_ACTIVE_CAMERA = "Dorm3dRoomTemplateScene.EXTRA_ACTIVE_CAMERA"
var_0_0.EXTRA_ACTIVE_CAMERA_BY_NAME = "Dorm3dRoomTemplateScene.EXTRA_ACTIVE_CAMERA_BY_NAME"
var_0_0.EXTRA_REGISTER_ORBITS = "Dorm3dRoomTemplateScene.EXTRA_REGISTER_ORBITS"
var_0_0.EXTRA_REVERT_CAMERA_ORBIT = "Dorm3dRoomTemplateScene.EXTRA_REVERT_CAMERA_ORBIT"
var_0_0.EXTRA_PLAY_ENTER_SCENE_ANIM = "Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_SCENE_ANIM"
var_0_0.EXTRA_PLAY_ENTER_EXTRA_ITEM = "Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_EXTRA_ITEM"
var_0_0.EXTRA_HIDE_SCENE_ITEM = "Dorm3dRoomTemplateScene.EXTRA_HIDE_SCENE_ITEM"
var_0_0.EXTRA_RESET_SCENE_ITEM_ANIMATORS = "Dorm3dRoomTemplateScene.EXTRA_RESET_SCENE_ITEM_ANIMATORS"
var_0_0.EXTRA_RESET_CHARACTER_EXTRA_ITEM = "Dorm3dRoomTemplateScene.EXTRA_RESET_CHARACTER_EXTRA_ITEM"
var_0_0.EXTRA_RESET_TEMP_HIDE_SCENE_ITEMS = "Dorm3dRoomTemplateScene.EXTRA_RESET_TEMP_HIDE_SCENE_ITEMS"
var_0_0.EXTRA_SET_BLACKBOARD_VALUE = "Dorm3dRoomTemplateScene.EXTRA_SET_BLACKBOARD_VALUE"
var_0_0.EXTRA_SWITCH_ANIM = "Dorm3dRoomTemplateScene.EXTRA_SWITCH_ANIM"
var_0_0.EXTRA_SET_HEAD_AIM_IK = "Dorm3dRoomTemplateScene.EXTRA_SET_HEAD_AIM_IK"
var_0_0.EXTRA_RESET_HEAD_AIM_IK = "Dorm3dRoomTemplateScene.EXTRA_RESET_HEAD_AIM_IK"
var_0_0.EXTRA_PLAY_SINGLE_ACTION = "Dorm3dRoomTemplateScene.EXTRA_PLAY_SINGLE_ACTION"
var_0_0.EXTRA_PLAY_FACE_ANIM = "Dorm3dRoomTemplateScene.EXTRA_PLAY_FACE_ANIM"
var_0_0.EXTRA_PLAY_SCENE_ITEM_ANIM = "Dorm3dRoomTemplateScene.EXTRA_PLAY_SCENE_ITEM_ANIM"
var_0_0.EXTRA_SHOW_BLACK_SCREEN = "Dorm3dRoomTemplateScene.EXTRA_SHOW_BLACK_SCREEN"
var_0_0.EXTRA_TRIGGER_LADY_DISTANCE = "Dorm3dRoomTemplateScene.EXTRA_TRIGGER_LADY_DISTANCE"
var_0_0.EXTRA_CHECK_IN_SECTOR = "Dorm3dRoomTemplateScene.EXTRA_CHECK_IN_SECTOR"
var_0_0.ART_SCENE_WILL_CHANGE = "Dorm3dRoomTemplateScene.ART_SCENE_WILL_CHANGE"
var_0_0.ART_SCENE_CHANGED = "Dorm3dRoomTemplateScene.ART_SCENE_CHANGED"
var_0_0.POV_CLOSE_DISTANCE = 1.5
var_0_0.POV_PENDING_CLOSE_DISTANCE = 2

function var_0_0.getUIName(arg_1_0)
	return nil
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = var_0_0.super.getResource(arg_2_0)
	local var_2_1 = getProxy(ApartmentProxy):getRoom(arg_2_0.contextData.roomId)
	local var_2_2, var_2_3 = Dorm3dSceneMgr.ParseInfo(var_2_1:getConfig("scene_info"))

	table.insert(var_2_0, string.lower("dorm3d/scenesres/scenes/" .. var_2_3 .. "/" .. var_2_2 .. "_scene"))
	table.insert(var_2_0, string.lower("dorm3d/scenesres/scenes/" .. var_2_3 .. "/" .. var_2_2 .. "_base_scene"))

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.contextData.groupIds) do
		local var_2_4 = getProxy(ApartmentProxy):getApartment(iter_2_1)
		local var_2_5 = var_2_4:getConfig("asset_name")
		local var_2_6 = var_2_4:GetSkinModelID(var_2_1:getConfig("tag"))
		local var_2_7 = Dorm3dSkin.New({
			configId = var_2_6
		}):GetModelName()

		assert(var_2_7)

		for iter_2_2, iter_2_3 in ipairs(Dorm3dHxHelper.GetMaterialResources(iter_2_1)) do
			table.insert(var_2_0, iter_2_3)
		end

		table.insert(var_2_0, string.lower(string.format("dorm3d/character/%s/prefabs/%s", var_2_5, var_2_7)))

		if var_2_1:isPersonalRoom() then
			for iter_2_4, iter_2_5 in ipairs(var_2_4:GetAllModelIds()) do
				if iter_2_5 ~= var_2_6 then
					local var_2_8 = Dorm3dSkin.New({
						configId = iter_2_5
					}):GetModelName()
					local var_2_9 = string.format("dorm3d/character/%s/prefabs/%s", var_2_5, var_2_8)

					if checkABExist(var_2_9) then
						table.insert(var_2_0, string.lower(var_2_9))
					end
				end
			end
		end

		local var_2_10 = arg_2_0.contextData.pendingDic and arg_2_0.contextData.pendingDic[iter_2_1]

		if var_2_10 then
			local var_2_11 = pg.dorm3d_welcome[var_2_10]

			if var_2_11.item_prefab ~= "" then
				table.insert(var_2_0, string.lower("dorm3d/furniture/item/" .. var_2_11.item_prefab))
			end
		end
	end

	return var_2_0
end

function var_0_0.forceGC(arg_3_0)
	return true
end

function var_0_0.loadingQueue(arg_4_0)
	return function(arg_5_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_6_0)
			return arg_5_0(arg_6_0)
		end)
	end
end

function var_0_0.getBGM(arg_7_0)
	local var_7_0 = pg.dorm3d_rooms[arg_7_0.contextData.roomId].room_bgm

	if var_7_0 and var_7_0 ~= "" then
		return var_7_0
	else
		return var_0_0.super.getBGM(arg_7_0)
	end
end

function var_0_0.Ctor(arg_8_0, ...)
	var_0_0.super.Ctor(arg_8_0, ...)

	arg_8_0.loader = AutoLoader.New()
	arg_8_0.hxHelper = Dorm3dHxHelper.New(arg_8_0.loader)
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
		local var_13_1 = getProxy(ApartmentProxy):getApartment(var_13_0):GetCurSkinId()
		local var_13_2 = arg_13_0.ladyDict[var_13_0]

		setActive(var_13_2.ladyGameObject, false)

		var_13_2.skinId = var_13_1
		var_13_2.ladyGameObject = arg_13_0.skinDict[var_13_1].ladyGameObject

		setActive(var_13_2.ladyGameObject, true)
	end

	for iter_13_0, iter_13_1 in pairs(arg_13_0.ladyDict) do
		arg_13_0:InitCharacter(iter_13_1, iter_13_0)
	end

	if not arg_13_0.room:isPersonalRoom() then
		local var_13_3 = underscore.detect(arg_13_0.contextData.groupIds, function(arg_14_0)
			return arg_13_0.contextData.ladyZone[arg_14_0] == arg_13_0.contextData.currentZoneNodeName
		end) or arg_13_0.contextData.groupIds[1]

		if var_13_3 then
			arg_13_0:SyncInterestTransform(arg_13_0.ladyDict[var_13_3])
		end

		if SlideExtraSystem.IsOpen(arg_13_0.room) and arg_13_0.contextData.currentZoneNodeName == SlideConst.SLIDE_ZONE then
			arg_13_0:SyncInterestTransformByTf(arg_13_0:GetZoneByName(arg_13_0.contextData.currentZoneNodeName):Find("StayPoint"))
		end
	end

	arg_13_0.retainCount = 0
	arg_13_0.sceneBlockLayer = arg_13_0._tf:Find("SceneBlock")

	setActive(arg_13_0.sceneBlockLayer, false)

	arg_13_0.blockLayer = arg_13_0._tf:Find("Block")

	setActive(arg_13_0.blockLayer, false)

	arg_13_0.blackLayer = arg_13_0._tf:Find("BlackScreen")

	setActive(arg_13_0.blackLayer, false)

	arg_13_0.holyLightRoot = arg_13_0._tf:Find("HolyLightRoot")

	arg_13_0:InitHolyLight()
	arg_13_0:ChangePlayerPosition()

	arg_13_0.cacheSceneDic = {}
	arg_13_0.sceneGroupDic = {}
	arg_13_0.lastSceneRootDict = {}

	pg.ClickEffectMgr.GetInstance():SetClickEffect("DORM3D")
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
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_BEGIN, function(arg_21_0, arg_21_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_15_0.moveStickOrigin = arg_21_1.position
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

	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_END, function(arg_23_0, arg_23_1)
		var_15_0()
	end)
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE, function(arg_24_0, arg_24_1)
		if arg_15_0.pinchMode then
			var_15_0()

			return
		end

		if not arg_15_0.moveStickDraging then
			return
		end

		arg_15_0.moveStickPosition = arg_15_0.moveStickPosition + arg_24_1

		if isActive(arg_15_0.povLayer:Find("Guide")) then
			setActive(arg_15_0.povLayer:Find("Guide"), false)
		end
	end)

	local var_15_1 = 32.4 / Screen.height

	arg_15_0:bind(var_0_0.ON_POV_STICK_VIEW, function(arg_25_0, arg_25_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_25_1 = arg_25_1 * var_15_1

		local var_25_0 = arg_25_1.x
		local var_25_1 = arg_25_1.y

		local function var_25_2(arg_26_0, arg_26_1, arg_26_2)
			local var_26_0 = arg_26_0[arg_26_1]

			var_26_0.m_InputAxisValue = arg_26_2
			arg_26_0[arg_26_1] = var_26_0
		end

		if isActive(arg_15_0.cameras[var_0_0.CAMERA.POV]) then
			var_25_2(arg_15_0.compPovAim, "m_HorizontalAxis", var_25_0)
			var_25_2(arg_15_0.compPovAim, "m_VerticalAxis", var_25_1)
		elseif isActive(arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			local var_25_3 = arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

			var_25_2(var_25_3, "m_HorizontalAxis", var_25_0)
			var_25_2(var_25_3, "m_VerticalAxis", var_25_1)
		end
	end)

	local var_15_2 = {
		PlayEnterExtraItem = true,
		HideCharacterBylayer = true,
		EnableHeadIK = true,
		RevertCharacterBylayer = true
	}

	arg_15_0:bind(var_0_0.PHOTO_CALL, function(arg_27_0, arg_27_1, ...)
		if var_15_2[arg_27_1] then
			local var_27_0 = arg_15_0:GetCurrentLadyEnv()

			arg_15_0[arg_27_1](arg_15_0, var_27_0, ...)
		else
			arg_15_0[arg_27_1](arg_15_0, ...)
		end
	end)
	arg_15_0:bind(var_0_0.SHIFT_ZONE_SAFE, function(arg_28_0, arg_28_1)
		arg_15_0:ShiftZoneSafe(arg_28_1)
	end)
	arg_15_0:bind(var_0_0.TRIGGER_TIMELINE_PLAYER_EVENT, function(arg_29_0, arg_29_1)
		if not arg_15_0.nowTimelinePlayer then
			warning("nowTimelinePlayer is nil, can't trigger event", arg_29_1)

			return
		end

		arg_15_0.nowTimelinePlayer:TriggerEvent(arg_29_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_GET_SCREEN_POSITION, function(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
		arg_30_1.value = arg_15_0:GetScreenPosition(arg_30_2, arg_30_3)
	end)
	arg_15_0:bind(var_0_0.EXTRA_CHANGE_PLAYER_POSITION, function(arg_31_0, arg_31_1)
		arg_15_0:ChangePlayerPosition(arg_31_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_CHANGE_CHARACTER_POSITION, function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_2 then
			local var_32_0 = arg_15_0:GetBlackboardValue(arg_32_1, "groupId")

			arg_15_0:SetLadyActiveZone(var_32_0, arg_32_2)
		end

		arg_15_0:ChangeCharacterPosition(arg_32_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_ACTIVE_CAMERA, function(arg_33_0, arg_33_1)
		arg_15_0:ActiveCamera(arg_33_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_ACTIVE_CAMERA_BY_NAME, function(arg_34_0, arg_34_1)
		arg_15_0:ActiveCameraByName(arg_34_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_REGISTER_ORBITS, function(arg_35_0, arg_35_1)
		arg_15_0:RegisterOrbits(arg_35_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_REVERT_CAMERA_ORBIT, function()
		arg_15_0:RevertCameraOrbit()
	end)
	arg_15_0:bind(var_0_0.EXTRA_PLAY_ENTER_SCENE_ANIM, function(arg_37_0, arg_37_1, arg_37_2)
		arg_15_0:PlayEnterSceneAnim(arg_37_1, arg_37_2)
	end)
	arg_15_0:bind(var_0_0.EXTRA_PLAY_ENTER_EXTRA_ITEM, function(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
		arg_15_0:PlayEnterExtraItem(arg_38_1, arg_38_2, nil, arg_38_3)
	end)
	arg_15_0:bind(var_0_0.EXTRA_HIDE_SCENE_ITEM, function(arg_39_0, arg_39_1)
		arg_15_0:HideSceneItem(arg_39_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_RESET_SCENE_ITEM_ANIMATORS, function(arg_40_0, arg_40_1)
		arg_15_0:ResetSceneItemAnimators(arg_40_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_RESET_CHARACTER_EXTRA_ITEM, function(arg_41_0, arg_41_1)
		arg_15_0:ResetCharacterExtraItem(arg_41_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_RESET_TEMP_HIDE_SCENE_ITEMS, function(arg_42_0, arg_42_1)
		arg_15_0:ResetTempHideSceneItems(arg_42_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_SET_BLACKBOARD_VALUE, function(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
		arg_15_0:SetBlackboardValue(arg_43_1, arg_43_2, arg_43_3)
	end)
	arg_15_0:bind(var_0_0.EXTRA_SET_HEAD_AIM_IK, function(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
		arg_15_0:SettingHeadAimIK(arg_44_1, arg_44_2, arg_44_3)
	end)
	arg_15_0:bind(var_0_0.EXTRA_RESET_HEAD_AIM_IK, function(arg_45_0, arg_45_1)
		arg_15_0:ResetHeadAimIK(arg_45_1)
	end)
	arg_15_0:bind(var_0_0.EXTRA_SWITCH_ANIM, function(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
		arg_15_0:SwitchAnim(arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	end)
	arg_15_0:bind(var_0_0.EXTRA_PLAY_SINGLE_ACTION, function(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
		arg_15_0:PlaySingleAction(arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	end)
	arg_15_0:bind(var_0_0.EXTRA_PLAY_FACE_ANIM, function(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
		arg_15_0:PlayFaceAnim(arg_48_1, arg_48_2, arg_48_3)
	end)
	arg_15_0:bind(var_0_0.EXTRA_PLAY_SCENE_ITEM_ANIM, function(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
		arg_15_0:PlaySceneItemAnim(arg_49_1, arg_49_2, arg_49_3)
	end)
	arg_15_0:bind(var_0_0.EXTRA_SHOW_BLACK_SCREEN, function(arg_50_0, arg_50_1, arg_50_2)
		arg_15_0:ShowBlackScreen(arg_50_1, arg_50_2)
	end)
	arg_15_0:bind(var_0_0.EXTRA_TRIGGER_LADY_DISTANCE, function()
		arg_15_0:TriggerLadyDistance()
	end)
	arg_15_0:bind(var_0_0.EXTRA_CHECK_IN_SECTOR, function()
		arg_15_0:CheckInSector()
	end)
end

function var_0_0.initScene(arg_53_0)
	local var_53_0, var_53_1 = unpack(string.split(arg_53_0.dormSceneMgr.sceneInfo, "|"))
	local var_53_2 = SceneManager.GetSceneByName(var_53_0 .. "_base")

	arg_53_0:ResetSceneStructure(var_53_2)

	arg_53_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_53_0.camBrain = arg_53_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_53_0.camBrainEvenetHandler = arg_53_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_53_0.raycastCamera = arg_53_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_53_0.sceneRaycaster = arg_53_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_53_0.player = GameObject.Find("Player").transform
	arg_53_0.playerEye = arg_53_0.player:Find("Eye")
	arg_53_0.playerFoot = arg_53_0.player:Find("Foot")

	setActive(arg_53_0.playerFoot, false)

	arg_53_0.playerController = arg_53_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_53_0.modelRoot = GameObject.Find("scene_root").transform
	arg_53_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_53_0.slotRoot, true)
	tolua.loadassembly("Cinemachine")

	local var_53_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_53_3, function(arg_54_0)
		setActive(arg_54_0, false)
	end)

	arg_53_0.camBrain.enabled = false
	arg_53_0.camBrain.enabled = true
	arg_53_0.cameraAim = var_53_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_53_0.cameraAim2 = var_53_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_53_0.cameraFree = nil
	arg_53_0.cameraFurnitureWatch = nil
	arg_53_0.cameraRole = var_53_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_53_0.cameraRole2 = var_53_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	local var_53_4 = var_53_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	arg_53_0.cameraGift = var_53_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_53_0.cameras = {
		arg_53_0.cameraAim,
		arg_53_0.cameraAim2,
		arg_53_0.cameraRole,
		[var_0_0.CAMERA.TALK] = var_53_4,
		[var_0_0.CAMERA.GIFT] = arg_53_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_53_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_53_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_53_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_53_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)),
		[var_0_0.CAMERA.SKIN] = arg_53_0.room:isPersonalRoom() and var_53_3:Find("Skin Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)) or nil
	}

	setActive(arg_53_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"), true)

	arg_53_0.compPovAim = arg_53_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_53_0.cameraRoot = var_53_3
	arg_53_0.POVOriginalFOV = arg_53_0:GetPOVFOV()
	arg_53_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_53_0.restrictedBox, false)

	local var_53_5 = arg_53_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(CharacterController)).radius

	arg_53_0.isMultiFloor = arg_53_0.restrictedBox.childCount > 2

	local var_53_6 = "Floor"
	local var_53_7 = "Celling"

	if arg_53_0.isMultiFloor then
		arg_53_0.restrictedHeightRange = {}

		for iter_53_0 = 0, math.floor(arg_53_0.restrictedBox.childCount / 2) - 1 do
			local var_53_8 = iter_53_0 == 0 and var_53_6 or var_53_6 .. "_" .. iter_53_0
			local var_53_9 = iter_53_0 == 0 and var_53_7 or var_53_7 .. "_" .. iter_53_0

			table.insert(arg_53_0.restrictedHeightRange, {
				arg_53_0.restrictedBox:Find(var_53_8).position.y + var_53_5,
				arg_53_0.restrictedBox:Find(var_53_9).position.y - var_53_5
			})
		end
	else
		arg_53_0.restrictedHeightRange = {
			arg_53_0.restrictedBox:Find(var_53_6).position.y + var_53_5,
			arg_53_0.restrictedBox:Find(var_53_7).position.y - var_53_5
		}
	end

	arg_53_0.ladyInterest = GameObject.Find("InterestProxy").transform

	arg_53_0:InitExtraSystem({
		Dorm3dLightingSystem
	})
	arg_53_0:SwitchDayNight(arg_53_0.contextData.timeIndex)

	arg_53_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_53_0 .. "_base")).CutIn

	if arg_53_0.tfCutIn then
		arg_53_0.modelCutIn = {
			lady = arg_53_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_53_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_53_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_55_0, arg_55_1)
	arg_55_0:emit(Dorm3dLightingSystem.APPLY_DAY_NIGHT, arg_55_1)
end

function var_0_0.ResetSceneStructure(arg_56_0, arg_56_1)
	local var_56_0

	table.IpairsCArray(arg_56_1:GetRootGameObjects(), function(arg_57_0, arg_57_1)
		if arg_57_1.name == "Furnitures" then
			var_56_0 = tf(arg_57_1)

			eachChild(var_56_0, function(arg_58_0)
				local var_58_0 = arg_58_0:Find("FreeLook Camera")

				if var_58_0 then
					setActive(var_58_0, false)
				end

				local var_58_1 = arg_58_0:Find("RoleWatch Camera")

				if var_58_1 then
					setActive(var_58_1, false)
				end

				local var_58_2 = arg_58_0:Find("IKCamera")

				if var_58_2 then
					setActive(var_58_2, false)
				end

				local var_58_3 = arg_58_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_58_3 then
					return
				end

				var_58_3.enabled = false
			end)
		end
	end)
	assert(var_56_0, "Missing Furnitures root in Dorm3D base scene")

	arg_56_0.posConfigRoot = var_56_0
	arg_56_0.zoneByName = {}
	arg_56_0.ikPointByName = {}

	eachChild(arg_56_0.posConfigRoot, function(arg_59_0)
		local var_59_0 = arg_59_0.name

		;(string.match(var_59_0, "^Pos%d+$") and arg_56_0.ikPointByName or arg_56_0.zoneByName)[var_59_0] = arg_59_0
	end)
end

function var_0_0.SetFloatEnable(arg_60_0, arg_60_1)
	arg_60_0.enableFloatUpdate = arg_60_1

	if arg_60_1 then
		arg_60_0:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_61_0)
	local var_61_0 = arg_61_0:GetCurrentLadyEnv()
	local var_61_1 = arg_61_0:GetScreenPosition(var_61_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_61_2 = arg_61_0:GetLocalPosition(var_61_1, arg_61_0.rtFloatPage)

	setLocalPosition(arg_61_0.rtFloatPage:Find("lady"), var_61_2)
end

function var_0_0.LoadCharacter(arg_62_0, arg_62_1, arg_62_2)
	arg_62_0.ladyDict = {}
	arg_62_0.skinDict = {}

	local var_62_0 = {}

	for iter_62_0, iter_62_1 in ipairs(arg_62_1) do
		table.insert(var_62_0, function(arg_63_0)
			arg_62_0:LoadSingleCharacter(iter_62_1, arg_63_0)
		end)
	end

	parallelAsync(var_62_0, arg_62_2)
end

function var_0_0.LoadCharacterAdditionally(arg_64_0, arg_64_1, arg_64_2)
	local var_64_0 = {}

	for iter_64_0, iter_64_1 in ipairs(arg_64_1) do
		table.insert(var_64_0, function(arg_65_0)
			arg_64_0:LoadSingleCharacter(iter_64_1, function()
				arg_64_0:InitCharacter(arg_64_0.ladyDict[iter_64_1], iter_64_1)
				arg_65_0()
			end)
		end)
	end

	parallelAsync(var_64_0, arg_64_2)
end

function var_0_0.LoadSingleCharacter(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = {}
	local var_67_1 = LadyEnv.New(arg_67_0)

	arg_67_0.ladyDict[arg_67_1] = var_67_1

	local var_67_2 = getProxy(ApartmentProxy):getApartment(arg_67_1)
	local var_67_3 = var_67_2:getConfig("asset_name")
	local var_67_4 = var_67_2:GetSkinModelID(arg_67_0.room:getConfig("tag"))
	local var_67_5 = Dorm3dSkin.New({
		configId = var_67_4
	}):GetModelName()

	assert(var_67_5)
	table.insert(var_67_0, function(arg_68_0)
		arg_67_0.hxHelper:LoadMaterials(arg_67_1, arg_68_0)
	end)

	var_67_1.skinId = var_67_4
	var_67_1.skinIdList = {
		var_67_4
	}

	table.insert(var_67_0, function(arg_69_0)
		local var_69_0 = string.format("dorm3d/character/%s/prefabs/%s", var_67_3, var_67_5)

		arg_67_0.loader:GetPrefab(var_69_0, "", function(arg_70_0)
			arg_67_0:MoveObjectToBaseScene(arg_70_0)

			var_67_1.ladyGameObject = arg_70_0
			arg_67_0.skinDict[var_67_4] = {
				ladyGameObject = arg_70_0
			}

			arg_69_0()
		end)
	end)

	if arg_67_0.room:isPersonalRoom() then
		for iter_67_0, iter_67_1 in ipairs(var_67_2:GetAllModelIds()) do
			if not table.contains(var_67_1.skinIdList, iter_67_1) then
				local var_67_6 = Dorm3dSkin.New({
					configId = iter_67_1
				})

				if var_67_6:IsShow() or iter_67_1 == 199033 then
					local var_67_7 = var_67_6:GetModelName()
					local var_67_8 = string.format("dorm3d/character/%s/prefabs/%s", var_67_3, var_67_7)

					if checkABExist(var_67_8) then
						table.insert(var_67_1.skinIdList, iter_67_1)
						table.insert(var_67_0, function(arg_71_0)
							arg_67_0.loader:GetPrefab(var_67_8, "", function(arg_72_0)
								arg_67_0:MoveObjectToBaseScene(arg_72_0)

								arg_67_0.skinDict[iter_67_1] = {
									ladyGameObject = arg_72_0
								}
								GetComponent(arg_72_0, "GraphOwner").enabled = false

								setActive(arg_72_0, false)
								arg_71_0()
							end)
						end)
					end
				end
			end
		end
	end

	if arg_67_0.contextData.pendingDic[arg_67_1] then
		local var_67_9 = pg.dorm3d_welcome[arg_67_0.contextData.pendingDic[arg_67_1]]

		if var_67_9.item_prefab ~= "" then
			table.insert(var_67_0, function(arg_73_0)
				local var_73_0 = string.lower("dorm3d/furniture/item/" .. var_67_9.item_prefab)

				arg_67_0.loader:GetPrefab(var_73_0, "", function(arg_74_0)
					arg_67_0:MoveObjectToBaseScene(arg_74_0)

					var_67_1.tfPendintItem = arg_74_0.transform

					setActive(arg_74_0, false)
					arg_73_0()
				end)
			end)
		end
	end

	parallelAsync(var_67_0, arg_67_2)
end

function var_0_0.HXCharacter(arg_75_0, arg_75_1, arg_75_2)
	arg_75_0.hxHelper:Apply(arg_75_1, arg_75_2)
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
	Dorm3dHxHelper.HideCharacterPart(arg_77_1.lady)
	arg_77_0:HXCharacter(arg_77_1.lady, arg_77_1.skinId)
	arg_77_0:SetLadyActiveZone(arg_77_2, arg_77_0:GetLadyBaseZone(arg_77_2))
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
	arg_88_0:InitExtraSystem()

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

		for iter_103_0, iter_103_1 in ipairs(var_103_1) do
			arg_103_0.contextData.ladyZone[iter_103_1[1]] = iter_103_1[2]

			if table.contains(arg_103_0.contextData.groupIds, iter_103_1[1]) then
				var_103_0 = var_103_0 or arg_103_0.contextData.ladyZone[iter_103_1[1]]
			end
		end

		arg_103_0.contextData.currentZoneNodeName = var_103_0 or var_103_1[1][2]
	end

	arg_103_0.zoneDatas = _.select(arg_103_0.room:GetZones(), function(arg_104_0)
		return not arg_104_0:IsGlobal()
	end)
	arg_103_0.ladyActiveZone = {}
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

	if arg_105_0.enableFloatUpdate then
		arg_105_0:UpdateFloatPosition()
	end

	arg_105_0:CheckInSector()

	if arg_105_0.systemManager then
		arg_105_0.systemManager:Update(Time.deltaTime)
	end
end

function var_0_0.CheckInSector(arg_106_0)
	if not isActive(arg_106_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_106_0 = arg_106_0.mainCameraTF.position

	for iter_106_0, iter_106_1 in pairs(arg_106_0.ladyDict) do
		if iter_106_1.lady then
			local var_106_1 = tobool(arg_106_0.activeLady[iter_106_0])
			local var_106_2 = {
				Radius = 2,
				Angle = 120,
				Position = iter_106_1.lady.position,
				Rotation = iter_106_1.lady.rotation
			}

			if var_106_1 ~= tobool(var_0_0.IsPointInSector(var_106_2, var_106_0)) then
				arg_106_0.activeLady[iter_106_0] = not var_106_1

				arg_106_0:emit(var_0_0.ON_ENTER_SECTOR, iter_106_0)
			end
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_107_0)
	for iter_107_0, iter_107_1 in pairs(arg_107_0.ladyDict) do
		if iter_107_1.lady then
			iter_107_1.dis = (iter_107_1.lady.position - arg_107_0.player.position).magnitude

			if (arg_107_0:GetBlackboardValue(iter_107_1, "inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > iter_107_1.dis ~= arg_107_0:GetBlackboardValue(iter_107_1, "inDistance") then
				arg_107_0:SetBlackboardValue(iter_107_1, "inDistance", iter_107_1.dis < var_0_0.POV_CLOSE_DISTANCE)
				arg_107_0:emit(var_0_0.ON_CHANGE_DISTANCE, iter_107_0, iter_107_1.dis < var_0_0.POV_CLOSE_DISTANCE)
			end
		end
	end
end

function var_0_0.OnStickMove(arg_108_0, arg_108_1)
	arg_108_0.joystickDelta = arg_108_1
end

function var_0_0.SetPinchValue(arg_109_0, arg_109_1)
	arg_109_0.pinchValue = arg_109_1

	arg_109_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_110_0)
	local var_110_0 = arg_110_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_110_0)
end

function var_0_0.SetPOVFOV(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_111_0, arg_111_1)

	arg_111_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_111_0
end

function var_0_0.RefreshSlots(arg_112_0, arg_112_1, arg_112_2)
	arg_112_0:emit(FurnitureSystem.REFRESH_SLOTS, arg_112_1, arg_112_2)
end

function var_0_0.RefreshSlotsEmpty(arg_113_0, arg_113_1)
	arg_113_0:emit(FurnitureSystem.REFRESH_SLOTS_EMPTY, arg_113_1)
end

function var_0_0.CheckSceneItemActiveByPath(arg_114_0, arg_114_1)
	local var_114_0 = arg_114_0:GetSceneItem(arg_114_1)

	return arg_114_0:CheckSceneItemActive(var_114_0)
end

function var_0_0.CheckSceneItemActive(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_0:GetExtraSystem(FurnitureSystem)

	assert(var_115_0, "FurnitureSystem is not initialized")

	return var_115_0:CheckSceneItemActive(arg_115_1)
end

function var_0_0.ChangeCharacterPosition(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_0:GetBlackboardValue(arg_116_1, "groupId")

	arg_116_0:ResetCharPoint(arg_116_1, arg_116_0:GetLadyActiveZone(var_116_0))
	arg_116_0:SyncInterestTransform(arg_116_1)
end

function var_0_0.SyncCurrentInterestTransform(arg_117_0)
	local var_117_0 = arg_117_0:GetCurrentLadyEnv()

	arg_117_0:SyncInterestTransform(var_117_0)
end

function var_0_0.SyncInterestTransform(arg_118_0, arg_118_1)
	arg_118_0.ladyInterest.position = arg_118_1.ladyInterestRoot.position
	arg_118_0.ladyInterest.rotation = arg_118_1.ladyInterestRoot.rotation
end

function var_0_0.SyncInterestTransformByTf(arg_119_0, arg_119_1)
	arg_119_0.ladyInterest.position = arg_119_1.position
	arg_119_0.ladyInterest.rotation = arg_119_1.rotation
end

function var_0_0.ChangePlayerPosition(arg_120_0, arg_120_1)
	arg_120_1 = arg_120_1 or arg_120_0.contextData.currentZoneNodeName

	local var_120_0 = (arg_120_0.zoneByName[arg_120_1] or arg_120_0.ikPointByName[arg_120_1]):Find("PlayerPoint").position

	arg_120_0.player.position = var_120_0
	arg_120_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_120_0.playerEye.position

	local var_120_1 = arg_120_0.ladyInterest.position - arg_120_0.playerEye.position
	local var_120_2 = Quaternion.LookRotation(var_120_1).eulerAngles
	local var_120_3 = var_120_2.y
	local var_120_4 = var_120_2.x
	local var_120_5 = arg_120_0.compPovAim.m_HorizontalAxis

	var_120_5.Value = arg_120_0:GetNearestAngle(var_120_3, var_120_5.m_MinValue, var_120_5.m_MaxValue)
	arg_120_0.compPovAim.m_HorizontalAxis = var_120_5

	local var_120_6 = arg_120_0.compPovAim.m_VerticalAxis

	var_120_6.Value = var_120_4
	arg_120_0.compPovAim.m_VerticalAxis = var_120_6
end

function var_0_0.GetCurrentZoneNodeName(arg_121_0)
	return arg_121_0.contextData.currentZoneNodeName
end

function var_0_0.GetLadyBaseZone(arg_122_0, arg_122_1)
	return arg_122_0.contextData.ladyZone[arg_122_1]
end

function var_0_0.GetLadyActiveZone(arg_123_0, arg_123_1)
	return arg_123_0.ladyActiveZone[arg_123_1] or arg_123_0:GetLadyBaseZone(arg_123_1)
end

function var_0_0.SetLadyActiveZone(arg_124_0, arg_124_1, arg_124_2)
	arg_124_0.ladyActiveZone[arg_124_1] = arg_124_2 or arg_124_0:GetLadyBaseZone(arg_124_1)
end

function var_0_0.GetZoneByName(arg_125_0, arg_125_1)
	return arg_125_0.zoneByName[arg_125_1]
end

function var_0_0.GetIKPointByName(arg_126_0, arg_126_1)
	return arg_126_0.ikPointByName[arg_126_1]
end

function var_0_0.GetSlotByID(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_0:GetExtraSystem(FurnitureSystem)

	assert(var_127_0, "FurnitureSystem is not initialized")

	return var_127_0:GetSlotByID(arg_127_1)
end

function var_0_0.GetScreenPosition(arg_128_0, arg_128_1, arg_128_2)
	arg_128_2 = arg_128_2 or arg_128_0.raycastCamera

	local var_128_0 = arg_128_2:WorldToScreenPoint(arg_128_1)

	if var_128_0.z < 0 then
		var_128_0.x = var_128_0.x + (var_128_0.x < 0 and -1 or 1) * Screen.width
		var_128_0.y = var_128_0.y + (var_128_0.y < 0 and -1 or 1) * Screen.height
		var_128_0.z = -var_128_0.z
	end

	return var_128_0
end

function var_0_0.GetLocalPosition(arg_129_0, arg_129_1, arg_129_2)
	return LuaHelper.ScreenToLocal(arg_129_2, arg_129_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_130_0)
	return arg_130_0.modelRoot
end

function var_0_0.ShiftZoneSafe(arg_131_0, arg_131_1)
	local var_131_0 = {}

	if arg_131_0.room:isPersonalRoom() and not arg_131_0:GetBlackboardValue(arg_131_0:GetCurrentLadyEnv(), "inPending") then
		table.insert(var_131_0, function(arg_132_0)
			arg_131_0:OutOfLazy(arg_131_0.apartment:GetConfigID(), arg_132_0)
		end)
	end

	table.insert(var_131_0, function(arg_133_0)
		arg_131_0:ShiftZone(arg_131_1, arg_133_0)
	end)
	seriesAsync(var_131_0, function()
		arg_131_0:CheckQueue()
	end)
end

function var_0_0.ShiftZone(arg_135_0, arg_135_1, arg_135_2)
	local var_135_0 = arg_135_0:GetZoneByName(arg_135_1)

	if not var_135_0 then
		errorMsg(arg_135_1 .. " Not Find")
		existCall(arg_135_2)

		return
	end

	seriesAsync({
		function(arg_136_0)
			arg_135_0:emit(var_0_0.SHOW_BLOCK)
			arg_135_0:ShowBlackScreen(true, arg_136_0)
		end,
		function(arg_137_0)
			if arg_135_0.shiftLady or arg_135_0.room:isPersonalRoom() then
				local var_137_0 = arg_135_0.shiftLady or arg_135_0.apartment:GetConfigID()

				arg_135_0.shiftLady = nil
				arg_135_0.contextData.ladyZone[var_137_0] = var_135_0.name

				local var_137_1 = arg_135_0.ladyDict[var_137_0]

				arg_135_0:SetLadyActiveZone(var_137_0, arg_135_0:GetLadyBaseZone(var_137_0))

				if arg_135_0:GetBlackboardValue(var_137_1, "inPending") then
					arg_135_0:SetOutPending(var_137_1)
					arg_135_0:SwitchAnim(var_137_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_135_0:ChangeCharacterPosition(var_137_1)
						arg_137_0()
					end)
				else
					arg_135_0:ChangeCharacterPosition(var_137_1)
					arg_137_0()
				end
			else
				arg_137_0()
			end
		end,
		function(arg_139_0)
			arg_135_0.contextData.currentZoneNodeName = var_135_0.name

			if SlideExtraSystem.IsOpen(arg_135_0.room) and arg_135_0.contextData.currentZoneNodeName == SlideConst.SLIDE_ZONE then
				arg_135_0:SyncInterestTransformByTf(var_135_0.transform:Find("StayPoint"))
			elseif not arg_135_0.apartment then
				for iter_139_0, iter_139_1 in pairs(arg_135_0.ladyDict) do
					if arg_135_0:GetLadyBaseZone(iter_139_0) == arg_135_0.contextData.currentZoneNodeName then
						arg_135_0:SyncInterestTransform(iter_139_1)

						break
					end
				end
			end

			arg_135_0:ChangePlayerPosition()
			arg_135_0:TriggerLadyDistance()
			arg_135_0:CheckInSector()
			arg_139_0()
		end,
		function(arg_140_0)
			arg_135_0:UpdateZoneList()
			arg_135_0:ShowBlackScreen(false, arg_140_0)
		end,
		function(arg_141_0)
			arg_135_0:emit(var_0_0.HIDE_BLOCK)
			arg_141_0()
		end
	}, arg_135_2)
end

function var_0_0.ActiveCamera(arg_142_0, arg_142_1)
	local var_142_0 = isActive(arg_142_1)

	table.Foreach(arg_142_0.cameras, function(arg_143_0, arg_143_1)
		setActive(arg_143_1, arg_143_1 == arg_142_1)
	end)

	if var_142_0 then
		arg_142_0:OnCameraBlendFinished(arg_142_1)
	end
end

function var_0_0.ActiveCameraByName(arg_144_0, arg_144_1)
	local var_144_0 = arg_144_0.cameraRoot:Find(arg_144_1)

	assert(var_144_0, "ActiveCameraByName: " .. arg_144_1 .. " not found")
	table.Foreach(arg_144_0.cameras, function(arg_145_0, arg_145_1)
		setActive(arg_145_1, false)
	end)
	setActive(var_144_0, true)

	arg_144_0.cameras[var_0_0.CAMERA.CUSTOM] = var_144_0:GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
end

function var_0_0.ShowBlackScreen(arg_146_0, arg_146_1, arg_146_2)
	local var_146_0 = arg_146_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_146_1 and 0 or 0.3
	}

	setImageColor(arg_146_0.blackLayer, Color.NewHex(var_146_0.color))
	setActive(arg_146_0.blackLayer, true)
	setCanvasGroupAlpha(arg_146_0.blackLayer, arg_146_1 and 0 or 1)
	arg_146_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_146_1 then
			setActive(arg_146_0.blackLayer, false)
		end

		existCall(arg_146_2)
	end, GetComponent(arg_146_0.blackLayer, typeof(CanvasGroup)), arg_146_1 and 1 or 0, var_146_0.time):setDelay(var_146_0.delay)
end

function var_0_0.RegisterOrbits(arg_148_0, arg_148_1)
	arg_148_0 = arg_148_0.scene
	arg_148_0.orbits = {
		original = arg_148_1.m_Orbits
	}
	arg_148_0.orbits.current = _.range(3):map(function(arg_149_0)
		local var_149_0 = arg_148_0.orbits.original[arg_149_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_149_0.m_Height, var_149_0.m_Radius)
	end)
	arg_148_0.surroudCamera = arg_148_1
end

function var_0_0.SetCameraObrits(arg_150_0)
	arg_150_0 = arg_150_0.scene

	local var_150_0 = arg_150_0.surroudCamera

	if not var_150_0 then
		return
	end

	local var_150_1 = arg_150_0.orbits.original[1]

	for iter_150_0 = 0, #arg_150_0.orbits.current - 1 do
		local var_150_2 = arg_150_0.orbits.current[iter_150_0 + 1]
		local var_150_3 = arg_150_0.orbits.original[iter_150_0]

		var_150_2.m_Height = math.lerp(var_150_1.m_Height, var_150_3.m_Height, arg_150_0.pinchValue)
		var_150_2.m_Radius = var_150_3.m_Radius * arg_150_0.pinchValue
	end

	var_150_0.m_Orbits = arg_150_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_151_0)
	arg_151_0 = arg_151_0.scene

	local var_151_0 = arg_151_0.surroudCamera

	if not var_151_0 then
		return
	end

	for iter_151_0 = 0, #arg_151_0.orbits.current - 1 do
		local var_151_1 = arg_151_0.orbits.current[iter_151_0 + 1]
		local var_151_2 = arg_151_0.orbits.original[iter_151_0]

		var_151_1.m_Height = var_151_2.m_Height
		var_151_1.m_Radius = var_151_2.m_Radius
	end

	var_151_0.m_Orbits = arg_151_0.orbits.current
	arg_151_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_152_0, arg_152_1, arg_152_2)
	local var_152_0 = {
		base = function(arg_153_0)
			arg_152_0:RegisterCameraBlendFinished(arg_152_0.cameras[var_0_0.CAMERA.POV], arg_153_0)
			arg_152_0:ActiveCamera(arg_152_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_154_0)
			assert(arg_152_0.apartment)
			arg_152_0:SyncInterestTransform(arg_152_0:GetCurrentLadyEnv())
			arg_152_0:SetCameraLady(arg_152_0:GetCurrentLadyEnv())
			arg_152_0:RegisterCameraBlendFinished(arg_152_0.cameras[var_0_0.CAMERA.ROLE], arg_154_0)
			arg_152_0:ActiveCamera(arg_152_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_155_0)
			arg_152_0:RegisterCameraBlendFinished(arg_152_0.cameras[var_0_0.CAMERA.POV], arg_155_0)
			arg_152_0:ActiveCamera(arg_152_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_156_0)
			arg_156_0()
		end,
		gift = function(arg_157_0)
			assert(arg_152_0.apartment)
			arg_152_0:SetCameraLady(arg_152_0:GetCurrentLadyEnv())
			arg_152_0:RegisterCameraBlendFinished(arg_152_0.cameras[var_0_0.CAMERA.GIFT], arg_157_0)
			arg_152_0:ActiveCamera(arg_152_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_158_0)
			assert(arg_152_0.apartment)
			arg_152_0:SetCameraLady(arg_152_0:GetCurrentLadyEnv())

			arg_152_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_152_0.cameraRole.transform.position

			arg_152_0:RegisterCameraBlendFinished(arg_152_0.cameras[var_0_0.CAMERA.ROLE2], arg_158_0)
			arg_152_0:ActiveCamera(arg_152_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_159_0)
			assert(arg_152_0.apartment)
			arg_152_0:SetCameraLady(arg_152_0:GetCurrentLadyEnv())
			arg_152_0:SyncInterestTransform(arg_152_0:GetCurrentLadyEnv())
			arg_152_0:RegisterCameraBlendFinished(arg_152_0.cameras[var_0_0.CAMERA.TALK], arg_159_0)
			arg_152_0:ActiveCamera(arg_152_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_152_1 = {}

	table.insert(var_152_1, function(arg_160_0)
		switch(arg_152_1, var_152_0, arg_160_0, arg_160_0)
	end)
	seriesAsync(var_152_1, arg_152_2)
end

function var_0_0.GetSceneItem(arg_161_0, arg_161_1)
	local var_161_0

	if string.find(arg_161_1, "FurnitureSlots/") == 1 then
		arg_161_1 = string.gsub(arg_161_1, "^FurnitureSlots/", "", 1)
		var_161_0 = arg_161_0.slotRoot:Find(arg_161_1)
	else
		var_161_0 = arg_161_0.modelRoot:Find(arg_161_1)
	end

	if not var_161_0 then
		warning(string.format("Missing scene item path: %s", arg_161_1))
	end

	return var_161_0
end

function var_0_0.SetSceneAnimSpeed(arg_162_0, arg_162_1, arg_162_2)
	table.Ipairs(arg_162_1 or {}, function(arg_163_0, arg_163_1)
		if arg_162_0.sceneAnimatorDict[arg_163_1] then
			arg_162_0.sceneAnimatorDict[arg_163_1].animator.speed = arg_162_2
		end
	end)
end

function var_0_0.SetExtraAnimSpeed(arg_164_0, arg_164_1, arg_164_2)
	table.Ipairs(arg_164_1 or {}, function(arg_165_0, arg_165_1)
		local var_165_0 = arg_165_1[1]

		if arg_164_0.extraItems and arg_164_0.extraItems[var_165_0] then
			arg_164_0.extraItems[var_165_0].trans:GetComponent(typeof(Animator)).speed = arg_164_2
		end
	end)
end

function var_0_0.PlayEnterSceneAnim(arg_166_0, arg_166_1, arg_166_2, arg_166_3)
	arg_166_3 = arg_166_3 or 1

	local var_166_0 = {}

	if arg_166_1 and #arg_166_1 > 0 then
		table.Ipairs(arg_166_1, function(arg_167_0, arg_167_1)
			arg_166_0:PlaySceneItemAnim(arg_167_1[1], arg_167_1[2], arg_166_2)
			arg_166_0:SetSceneAnimSpeed({
				arg_167_1[1]
			}, arg_166_3)
			table.insert(var_166_0, arg_167_1[1])
		end)
	end

	arg_166_0:ResetSceneItemAnimators(var_166_0)
end

function var_0_0.PlayEnterExtraItem(arg_168_0, arg_168_1, arg_168_2, arg_168_3, arg_168_4)
	arg_168_3 = arg_168_3 or 1

	local var_168_0 = {}

	if arg_168_2 and #arg_168_2 > 0 then
		table.Ipairs(arg_168_2, function(arg_169_0, arg_169_1)
			local var_169_0 = arg_169_1[3] and Vector3.New(unpack(arg_169_1[3]))
			local var_169_1 = arg_169_1[4] and Quaternion.Euler(unpack(arg_169_1[4]))
			local var_169_2 = #arg_169_1 > 4 and arg_169_1[5] or nil

			arg_168_0:LoadCharacterExtraItem(arg_168_1, arg_169_1[1], arg_169_1[2], var_169_0, var_169_1, var_169_2, arg_168_3, arg_168_4)
			table.insert(var_168_0, arg_169_1[1])
		end)
	end

	arg_168_0:ResetCharacterExtraItem(var_168_0)
end

function var_0_0.HideSceneItem(arg_170_0, arg_170_1)
	if arg_170_1 and #arg_170_1 > 0 then
		if arg_170_0.tempHideSceneItems and #arg_170_0.tempHideSceneItems > 0 then
			arg_170_0:ResetTempHideSceneItems(arg_170_1)
		end

		arg_170_0.tempHideSceneItems = {}

		table.Ipairs(arg_170_1, function(arg_171_0, arg_171_1)
			local var_171_0 = arg_170_0:GetSceneItem(arg_171_1)

			setActive(var_171_0, false)
			table.insert(arg_170_0.tempHideSceneItems, arg_171_1)
		end)
	end
end

function var_0_0.ResetTempHideSceneItems(arg_172_0, arg_172_1)
	arg_172_1 = arg_172_1 or {}

	if arg_172_0.tempHideSceneItems and #arg_172_0.tempHideSceneItems > 0 then
		table.Ipairs(arg_172_0.tempHideSceneItems, function(arg_173_0, arg_173_1)
			if table.contains(arg_172_1, arg_173_1) then
				return
			end

			local var_173_0 = arg_172_0:GetSceneItem(arg_173_1)

			setActive(var_173_0, true)
		end)

		arg_172_0.tempHideSceneItems = nil
	end
end

function var_0_0.EnableCurrentHeadIK(arg_174_0, arg_174_1)
	local var_174_0 = arg_174_0:GetCurrentLadyEnv()

	arg_174_0:EnableHeadIK(var_174_0, arg_174_1)
end

function var_0_0.EnableHeadIK(arg_175_0, arg_175_1, arg_175_2)
	arg_175_1.ladyHeadIKComp.enableIk = arg_175_2
end

function var_0_0.SettingHeadAimIK(arg_176_0, arg_176_1, arg_176_2, arg_176_3)
	local var_176_0

	if arg_176_2[1] == 0 then
		arg_176_0:EnableHeadIK(arg_176_1, false)

		return
	elseif arg_176_2[1] == 1 then
		arg_176_0:EnableHeadIK(arg_176_1, true)

		var_176_0 = arg_176_0.mainCameraTF:Find("AimTarget")
	elseif arg_176_2[1] == 2 then
		arg_176_0:EnableHeadIK(arg_176_1, true)
		table.IpairsCArray(arg_176_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_177_0, arg_177_1)
			if arg_177_1.name ~= arg_176_2[2] then
				return
			end

			var_176_0 = arg_177_1
		end)
	end

	arg_176_1.ladyHeadIKComp.AimTarget = var_176_0

	if not arg_176_3 and arg_176_2[3] then
		arg_176_1.ladyHeadIKComp.BodyWeight = arg_176_2[3]
	end

	if not arg_176_3 and arg_176_2[4] then
		arg_176_1.ladyHeadIKComp.HeadWeight = arg_176_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_178_0, arg_178_1)
	arg_178_0:EnableHeadIK(arg_178_1, true)

	arg_178_1.ladyHeadIKComp.AimTarget = arg_178_0.mainCameraTF:Find("AimTarget")
	arg_178_1.ladyHeadIKComp.HeadWeight = arg_178_1.ladyHeadIKData.HeadWeight
	arg_178_1.ladyHeadIKComp.BodyWeight = arg_178_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_179_0, arg_179_1)
	for iter_179_0, iter_179_1 in pairs(arg_179_0.ladyDict) do
		if iter_179_0 ~= arg_179_1 then
			arg_179_0:HideCharacterBylayer(iter_179_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_180_0, arg_180_1)
	for iter_180_0, iter_180_1 in pairs(arg_180_0.ladyDict) do
		if iter_180_0 ~= arg_180_1 then
			arg_180_0:RevertCharacterBylayer(iter_180_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_181_0, arg_181_1)
	local var_181_0 = "Bip001"
	local var_181_1 = arg_181_1.lady:Find("all")

	for iter_181_0 = 0, var_181_1.childCount - 1 do
		local var_181_2 = var_181_1:GetChild(iter_181_0)

		if var_181_2.name ~= var_181_0 then
			pg.ViewUtils.SetLayer(var_181_2, Layer.UIHidden)
		end
	end

	if arg_181_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_181_1.tfPendintItem, Layer.UIHidden)
	end

	if arg_181_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_181_1.ladyWatchFloat, Layer.UIHidden)
	end

	Dorm3dHxHelper.SetModelHolyLightActive(arg_181_1.lady, arg_181_0.holyLightRoot, false)
end

function var_0_0.RevertCharacterBylayer(arg_182_0, arg_182_1)
	local var_182_0 = "Bip001"
	local var_182_1 = arg_182_1.lady:Find("all")

	for iter_182_0 = 0, var_182_1.childCount - 1 do
		local var_182_2 = var_182_1:GetChild(iter_182_0)

		if var_182_2.name ~= var_182_0 then
			pg.ViewUtils.SetLayer(var_182_2, Layer.Character3D)
		end
	end

	if arg_182_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_182_1.tfPendintItem, Layer.Default)
	end

	if arg_182_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_182_1.ladyWatchFloat, Layer.Default)
	end

	Dorm3dHxHelper.SetModelHolyLightActive(arg_182_1.lady, arg_182_0.holyLightRoot, true)
end

function var_0_0.EnterFurnitureWatchMode(arg_183_0)
	arg_183_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_183_0:EnableJoystick(true)
	arg_183_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_184_0, arg_184_1)
	arg_184_0:HideFurnitureSlots()

	local var_184_0 = arg_184_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_185_0)
			arg_184_0.furniturePOV = nil

			arg_184_0:EnableJoystick(false)
			arg_184_0:emit(var_0_0.SHOW_BLOCK)
			arg_184_0:ShowBlackScreen(true, arg_185_0)
		end,
		function(arg_186_0)
			existCall(arg_184_1)
			arg_184_0:RevertCharacter()
			arg_184_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_184_0:RegisterCameraBlendFinished(var_184_0, arg_186_0)
			arg_184_0:ActiveCamera(var_184_0)
		end,
		function(arg_187_0)
			arg_184_0:ShowBlackScreen(false, arg_187_0)
		end
	}, function()
		arg_184_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_184_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_189_0, arg_189_1)
	local var_189_0 = "FurnitureWatch" .. arg_189_1:GetWatchCameraName()
	local var_189_1 = arg_189_0.cameraRoot:Find(var_189_0)

	if not var_189_1 then
		errorMsg(var_189_0 .. " Not Find Under CM Cameras")

		return
	end

	local var_189_2 = var_189_1:GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_189_0.cameraFurnitureWatch and arg_189_0.cameraFurnitureWatch ~= var_189_2 then
		arg_189_0:UnRegisterCameraBlendFinished(arg_189_0.cameraFurnitureWatch)
		setActive(arg_189_0.cameraFurnitureWatch, false)
	end

	arg_189_0.cameraFurnitureWatch = var_189_2
	arg_189_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_189_0.cameraFurnitureWatch
	arg_189_0.furniturePOV = arg_189_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_189_0:RegisterCameraBlendFinished(arg_189_0.cameraFurnitureWatch, function()
		arg_189_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_189_0:emit(var_0_0.SHOW_BLOCK)
	arg_189_0:ActiveCamera(arg_189_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_191_0)
	arg_191_0:emit(FurnitureSystem.HIDE_SLOTS)
end

function var_0_0.DisplayFurnitureSlots(arg_192_0, arg_192_1)
	arg_192_0:emit(FurnitureSystem.DISPLAY_SLOTS, arg_192_1)
end

function var_0_0.UpdateDisplaySlots(arg_193_0, arg_193_1)
	arg_193_0:emit(FurnitureSystem.UPDATE_DISPLAY_SLOTS, arg_193_1)
end

function var_0_0.EnterPhotoMode(arg_194_0, arg_194_1, arg_194_2)
	arg_194_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_194_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_195_0)
			arg_194_0:TempHideUI(true, arg_195_0)
		end,
		function(arg_196_0)
			arg_194_0:ShowBlackScreen(true, arg_196_0)
		end,
		function(arg_197_0)
			local var_197_0 = arg_194_0.apartment:GetConfigID()
			local var_197_1 = arg_194_0.ladyDict[var_197_0]

			arg_194_0:SwitchAnim(var_197_1, arg_194_2)
			var_197_1.ladyAnimator:Update(0)
			arg_194_0:ResetCharPoint(var_197_1, arg_194_1:GetWatchCameraName())
			arg_194_0:SyncInterestTransform(var_197_1)
			setActive(var_197_1.ladySafeCollider, true)
			arg_194_0:HideCharacter(var_197_0)

			local var_197_2 = arg_194_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_197_3 = var_197_2.m_XAxis

			var_197_3.Value = 180
			var_197_2.m_XAxis = var_197_3

			local var_197_4 = var_197_2.m_YAxis

			var_197_4.Value = 0.7
			var_197_2.m_YAxis = var_197_4
			arg_194_0.pinchValue = 1

			arg_194_0:RegisterOrbits(arg_194_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_194_0:SetCameraObrits()
			setActive(arg_194_0.restrictedBox, true)
			arg_194_0:RegisterCameraBlendFinished(var_197_2, arg_197_0)
			arg_194_0:ActiveCamera(var_197_2)
		end,
		function(arg_198_0)
			arg_194_0:ShowBlackScreen(false, arg_198_0)
		end
	}, function()
		arg_194_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_200_0)
	arg_200_0:emit(var_0_0.SHOW_BLOCK)
	arg_200_0:EnableJoystick(false)
	seriesAsync({
		function(arg_201_0)
			arg_200_0:ShowBlackScreen(true, arg_201_0)
		end,
		function(arg_202_0)
			arg_200_0:RevertCameraOrbit()

			local var_202_0 = arg_200_0:GetCurrentLadyEnv()

			arg_200_0:SwitchAnim(var_202_0, var_0_0.ANIM.IDLE)
			setActive(var_202_0.ladySafeCollider, false)
			onNextTick(function()
				arg_200_0:ChangeCharacterPosition(var_202_0)
			end)

			if arg_200_0.contextData.photoFreeMode then
				arg_200_0:EnablePOVLayer(false)

				arg_200_0.contextData.photoFreeMode = nil
			end

			setActive(arg_200_0.restrictedBox, false)

			local var_202_1 = arg_200_0.cameras[var_0_0.CAMERA.POV]

			arg_200_0:RegisterCameraBlendFinished(var_202_1, arg_202_0)
			arg_200_0:ActiveCamera(var_202_1)
		end,
		function(arg_204_0)
			arg_200_0:RevertCharacter(arg_200_0.apartment:GetConfigID())
			arg_200_0:ShowBlackScreen(false, arg_204_0)
		end
	}, function()
		arg_200_0:RefreshSlots()
		arg_200_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_200_0:emit(var_0_0.HIDE_BLOCK)
		arg_200_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_200_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_206_0, arg_206_1, arg_206_2, arg_206_3)
	arg_206_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_207_0)
			arg_206_0:ShowBlackScreen(true, arg_207_0)
		end,
		function(arg_208_0)
			local var_208_0 = arg_206_0:GetCurrentLadyEnv()

			arg_206_0:SwitchAnim(var_208_0, arg_206_2)
			onNextTick(function()
				arg_206_0:ResetCharPoint(var_208_0, arg_206_1:GetWatchCameraName())
				arg_206_0:SyncInterestTransform(var_208_0)

				if arg_206_0.contextData.photoFreeMode then
					arg_206_0.camBrain.enabled = false

					arg_206_0:SwitchPhotoCamera()

					arg_206_0.camBrain.enabled = true

					onDelayTick(function()
						arg_206_0.camBrain.enabled = false

						arg_206_0:SwitchPhotoCamera()

						arg_206_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_208_0()
			end)
		end,
		function(arg_211_0)
			arg_206_0:ShowBlackScreen(false, arg_211_0)
		end
	}, function()
		arg_206_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_206_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_213_0)
	if not arg_213_0.contextData.photoFreeMode then
		arg_213_0:EnableJoystick(false)
		arg_213_0:EnablePOVLayer(true)

		local var_213_0 = arg_213_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
		local var_213_1 = arg_213_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_213_2 = arg_213_0.mainCameraTF.rotation:ToEulerAngles()
		local var_213_3 = var_213_1.m_HorizontalAxis

		var_213_3.Value = var_213_2.y
		var_213_1.m_HorizontalAxis = var_213_3

		local var_213_4 = var_213_1.m_VerticalAxis

		var_213_4.Value = arg_213_0:GetNearestAngle(var_213_2.x, var_213_4.m_MinValue, var_213_4.m_MaxValue)
		var_213_1.m_VerticalAxis = var_213_4

		local var_213_5 = arg_213_0.mainCameraTF.position
		local var_213_6 = arg_213_0:GetRestritedHeightRange()
		local var_213_7 = math.InverseLerp(var_213_6[1], var_213_6[2], var_213_5.y)

		var_213_5.y = math.clamp(var_213_5.y, var_213_6[1], var_213_6[2])
		var_213_0.transform.position = var_213_5

		arg_213_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_213_7)
		arg_213_0:ActiveCamera(arg_213_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_213_0:EnableJoystick(true)
		arg_213_0:EnablePOVLayer(false)
		arg_213_0:ActiveCamera(arg_213_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_213_0.contextData.photoFreeMode = not arg_213_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_214_0, arg_214_1)
	local var_214_0 = arg_214_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
	local var_214_1 = arg_214_0:GetRestritedHeightRange()
	local var_214_2 = math.lerp(var_214_1[1], var_214_1[2], arg_214_1)

	var_214_0:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_214_2 - var_214_0.position.y, 0))
	onNextTick(function()
		local var_215_0 = arg_214_0:GetRestritedHeightRange()
		local var_215_1 = math.InverseLerp(var_215_0[1], var_215_0[2], var_214_0.position.y)

		arg_214_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_215_1)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_216_0)
	local var_216_0 = arg_216_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_216_1 = var_216_0.m_XAxis

	var_216_1.Value = 180
	var_216_0.m_XAxis = var_216_1

	local var_216_2 = var_216_0.m_YAxis

	var_216_2.Value = 0.7
	var_216_0.m_YAxis = var_216_2
end

function var_0_0.ResetCurrentCharPoint(arg_217_0, arg_217_1)
	local var_217_0 = arg_217_0:GetCurrentLadyEnv()

	arg_217_0:ResetCharPoint(var_217_0, arg_217_1)
end

function var_0_0.ResetCharPoint(arg_218_0, arg_218_1, arg_218_2)
	local var_218_0 = (arg_218_0.zoneByName[arg_218_2] or arg_218_0.ikPointByName[arg_218_2]):Find("StayPoint")

	arg_218_1.lady.position = var_218_0.position
	arg_218_1.lady.rotation = var_218_0.rotation
end

function var_0_0.GetNearestAngle(arg_219_0, arg_219_1, arg_219_2, arg_219_3)
	if arg_219_3 < arg_219_2 then
		arg_219_3 = arg_219_3 + 360
	end

	if arg_219_2 <= arg_219_1 and arg_219_1 <= arg_219_3 then
		return arg_219_1
	end

	local var_219_0 = (arg_219_2 + arg_219_3) / 2

	arg_219_1 = var_219_0 - Mathf.DeltaAngle(arg_219_1, var_219_0)
	arg_219_1 = math.clamp(arg_219_1, arg_219_2, arg_219_3)

	return arg_219_1
end

function var_0_0.PlayTimeline(arg_220_0, arg_220_1, arg_220_2)
	local var_220_0 = {}

	if arg_220_0.waitForTimeline then
		table.insert(var_220_0, function(arg_221_0)
			local var_221_0 = arg_220_0.waitForTimeline

			arg_220_0.waitForTimeline = nil

			var_221_0()
			arg_221_0()
		end)
	end

	table.insert(var_220_0, function(arg_222_0)
		arg_220_0:LoadTimelineScene(arg_220_1.name, false, nil, arg_222_0)
	end)

	if arg_220_1.scene and arg_220_1.sceneRoot then
		table.insert(var_220_0, function(arg_223_0)
			arg_220_0:ChangeArtScene(arg_220_1.scene .. "|" .. arg_220_1.sceneRoot, arg_223_0)
		end)
	end

	table.insert(var_220_0, function(arg_224_0)
		local var_224_0 = Dorm3dHxHelper.GetTimelineMainCharacter()

		Dorm3dHxHelper.ShowHolyLight({
			var_224_0
		}, arg_220_0.holyLightRoot)

		local var_224_1 = GameObject.Find("[actor]").transform
		local var_224_2 = var_224_1:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_224_2, function(arg_225_0, arg_225_1)
			GetOrAddComponent(arg_225_1.transform, typeof(DftAniEvent))
		end)

		var_224_0 = var_224_0 or var_224_1:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform

		local var_224_3

		eachChild(GameObject.Find("[camera]").transform, function(arg_226_0)
			if arg_226_0.tag == "MainCamera" then
				var_224_3 = arg_226_0
			end
		end)
		assert(var_224_3, "Missing MainCamera")

		local var_224_4 = GameObject.Find("[sequence]").transform

		arg_220_0.nowTimelinePlayer = TimelinePlayer.New(var_224_4)

		TimelineSupport.InitSubtitle(arg_220_0.nowTimelinePlayer.comDirector, arg_220_0.apartment:GetCallName())
		arg_220_0.nowTimelinePlayer:Register(arg_220_1.time, function(arg_227_0, arg_227_1, arg_227_2)
			switch(arg_227_1.stringParameter, {
				TimelinePause = function()
					arg_227_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_227_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_227_1.intParameter == 0 or arg_227_1.intParameter == arg_227_2.selectIndex then
						arg_227_0:SetTime(arg_227_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_227_2.selectIndex = nil

					if arg_220_1.options then
						local var_231_0 = arg_220_1.options[arg_227_1.intParameter]

						arg_220_0:DoTimelineOption(var_231_0, function(arg_232_0)
							arg_227_2.selectIndex = arg_232_0
							arg_227_2.optionIndex = var_231_0[arg_232_0].flag

							arg_227_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_227_2.selectIndex = nil

					if arg_220_1.touchs then
						local var_233_0 = arg_220_1.touchs[arg_227_1.intParameter]

						arg_220_0:DoTimelineTouch(arg_220_1.touchs[arg_227_1.intParameter], function(arg_234_0)
							arg_227_2.selectIndex = arg_234_0
							arg_227_2.optionIndex = var_233_0[arg_234_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_227_2.selectIndex then
						arg_227_0:RawSetTime(arg_227_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_227_2.selectIndex = arg_227_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_220_0.canTriggerAccompanyPerformance then
						arg_220_0.canTriggerAccompanyPerformance = false

						local var_237_0 = arg_220_1.accompanys[arg_227_1.intParameter]
						local var_237_1 = var_237_0[math.random(#var_237_0)]

						arg_227_0:SetTime(var_237_1)
					end
				end,
				TimelineIKStart = function()
					arg_227_2.selectIndex = nil

					local var_238_0 = arg_227_1.intParameter

					arg_220_0:emit(RoomIKSystem.SET_IK_TIMELINE_STATUS, var_224_0.gameObject, var_238_0, var_224_3)
				end,
				TimelineEnd = function()
					arg_227_2.finish = true

					arg_227_0:SetSpeed(0)
				end,
				TimelineAimIKStart = function()
					arg_227_2.selectIndex = nil

					local var_240_0 = arg_227_1.intParameter

					arg_220_0:emit(AimIKSystem.ENTER_TIMELINE_AIMIK_STATUS, var_240_0)
				end
			}, function()
				warning("other event trigger:" .. arg_227_1.stringParameter)
			end)

			if arg_227_2.finish then
				arg_220_0.timelineMark = arg_227_2
				arg_220_0.timelineFinishCall = nil

				pg.m02:sendNotification(var_0_0.TIMELINE_END)
				arg_220_0:emit(RoomIKSystem.EXIT_IK_TIMELINE_STATUS)
				arg_224_0()
			end
		end)

		function arg_220_0.timelineFinishCall()
			arg_220_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_220_0:HideCharacter()
		setActive(arg_220_0.mainCameraTF, false)
		setActive(var_224_3, true)
		eachChild(arg_220_0.rtTimelineScreen, function(arg_243_0)
			setActive(arg_243_0, false)
		end)
		setActive(arg_220_0.rtTimelineScreen, true)
		setActive(arg_220_0.rtTimelineScreen:Find("btn_skip"), arg_220_0.inReplayTalk)
		arg_220_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_220_0, function(arg_244_0)
		arg_220_0:ShowBlackScreen(true, function()
			arg_220_0.nowTimelinePlayer:Stop()
			arg_220_0.nowTimelinePlayer:Dispose()

			arg_220_0.nowTimelinePlayer = nil

			arg_220_0:UnloadTimelineScene(arg_220_1.name, false, arg_244_0)
		end)
	end)

	local var_220_1 = arg_220_0.dormSceneMgr.artSceneInfo

	table.insert(var_220_0, function(arg_246_0)
		arg_220_0:RevertArtScene(var_220_1, arg_246_0)
	end)
	seriesAsync(var_220_0, function()
		setActive(arg_220_0.rtTimelineScreen, false)
		arg_220_0:RevertCharacter()
		setActive(arg_220_0.mainCameraTF, true)
		arg_220_0:InitHolyLight()

		local var_247_0 = arg_220_0.timelineMark

		arg_220_0.timelineMark = nil

		existCall(arg_220_2, var_247_0, function(arg_248_0)
			arg_220_0:ShowBlackScreen(false, arg_248_0)
		end)
	end)
end

function var_0_0.GetCurrentLadyEnv(arg_249_0)
	if not arg_249_0.apartment then
		return nil
	end

	return arg_249_0.ladyDict[arg_249_0.apartment:GetConfigID()]
end

function var_0_0.PlayCurrentSingleAction(arg_250_0, ...)
	local var_250_0 = arg_250_0:GetCurrentLadyEnv()

	return arg_250_0:PlaySingleAction(var_250_0, ...)
end

function var_0_0.PlaySingleAction(arg_251_0, arg_251_1, arg_251_2, arg_251_3, arg_251_4)
	arg_251_1:PlaySingleAction(arg_251_2, arg_251_3, arg_251_4)
end

function var_0_0.SwitchCurrentAnim(arg_252_0, ...)
	local var_252_0 = arg_252_0:GetCurrentLadyEnv()

	return arg_252_0:SwitchAnim(var_252_0, ...)
end

function var_0_0.SwitchAnim(arg_253_0, arg_253_1, arg_253_2, arg_253_3, arg_253_4)
	arg_253_1:SwitchAnim(arg_253_2, arg_253_3, arg_253_4)
end

function var_0_0.PlayFaceAnim(arg_254_0, arg_254_1, arg_254_2, arg_254_3)
	arg_254_1:PlayFaceAnim(arg_254_2, arg_254_3)
end

function var_0_0.RegisterAnimCallback(arg_255_0, arg_255_1, arg_255_2)
	arg_255_0:GetCurrentLadyEnv().animCallbacks[arg_255_1] = arg_255_2
end

function var_0_0.SetCharacterAnimSpeed(arg_256_0, arg_256_1)
	local var_256_0 = arg_256_0:GetCurrentLadyEnv()

	var_256_0.ladyAnimator.speed = arg_256_1
	var_256_0.ladyHeadIKComp.blinkSpeed = var_256_0.ladyHeadIKData.blinkSpeed * arg_256_1

	if arg_256_1 > 0 then
		var_256_0.ladyHeadIKComp.DampTime = var_256_0.ladyHeadIKData.DampTime / arg_256_1
	else
		var_256_0.ladyHeadIKComp.DampTime = var_256_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_257_0, arg_257_1)
	if arg_257_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_257_0 = arg_257_1.stringParameter
	local var_257_1 = table.removebykey(arg_257_0.animEventCallbacks, var_257_0)

	existCall(var_257_1)
end

function var_0_0.RegisterAnimEventCallback(arg_258_0, arg_258_1, arg_258_2)
	arg_258_0.animEventCallbacks[arg_258_1] = arg_258_2
end

function var_0_0.PlaySceneItemAnim(arg_259_0, arg_259_1, arg_259_2, arg_259_3)
	arg_259_0.sceneAnimatorDict = arg_259_0.sceneAnimatorDict or {}

	if not arg_259_0.sceneAnimatorDict[arg_259_1] then
		local var_259_0 = pg.dorm3d_scene_animator[arg_259_1]
		local var_259_1 = arg_259_0:GetSceneItem(var_259_0.item_name)

		assert(var_259_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_259_1 .. " " .. var_259_0.item_name)

		if not var_259_1 then
			return
		end

		local var_259_2 = var_259_1:GetComponent(typeof(Animator))

		if not var_259_2 then
			return
		end

		arg_259_0.sceneAnimatorDict[arg_259_1] = {
			trans = var_259_1,
			animator = var_259_2
		}
	end

	if not arg_259_3 and arg_259_0.sceneAnimatorDict[arg_259_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_259_2) then
		return
	end

	arg_259_0.sceneAnimatorDict[arg_259_1].animator:PlayInFixedTime(arg_259_2, -1, arg_259_3 and 0 or -math.huge)
end

function var_0_0.ResetSceneItemAnimators(arg_260_0, arg_260_1)
	if not arg_260_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_260_0.sceneAnimatorDict, function(arg_261_0, arg_261_1)
		if arg_260_1 and table.contains(arg_260_1, arg_261_0) then
			return
		end

		setActive(arg_261_1.trans, false)
		setActive(arg_261_1.trans, true)

		arg_260_0.sceneAnimatorDict[arg_261_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_262_0, arg_262_1, arg_262_2, arg_262_3, arg_262_4, arg_262_5, arg_262_6, arg_262_7, arg_262_8)
	local function var_262_0(arg_263_0)
		if arg_262_6 then
			local var_263_0 = arg_263_0:GetComponent(typeof(Animator))

			if var_263_0 then
				var_263_0:Play(arg_262_6, -1, arg_262_8 and 0 or -math.huge)

				var_263_0.speed = arg_262_7
			end
		end
	end

	arg_262_0.extraItems = arg_262_0.extraItems or {}

	local var_262_1

	if arg_262_3 == "" then
		var_262_1 = arg_262_1.lady
	elseif arg_262_3 == "scene_root" then
		var_262_1 = arg_262_0.modelRoot
	else
		table.IpairsCArray(arg_262_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_264_0, arg_264_1)
			if arg_264_1.name == arg_262_3 then
				var_262_1 = arg_264_1
			end
		end)
	end

	if not var_262_1 then
		return
	end

	local var_262_2 = arg_262_0.extraItems[arg_262_2]

	if var_262_2 then
		if var_262_2.handler == var_262_1 then
			var_262_0(var_262_2.trans)

			return
		end

		arg_262_0.loader:ReturnPrefab(var_262_2.trans.gameObject)

		arg_262_0.extraItems[arg_262_2] = nil
	end

	arg_262_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_262_2), "", function(arg_265_0)
		setParent(arg_265_0, var_262_1)

		if arg_262_4 then
			setLocalPosition(arg_265_0, arg_262_4)
		end

		if arg_262_5 then
			setLocalRotation(arg_265_0, arg_262_5)
		end

		var_262_0(arg_265_0)

		arg_262_0.extraItems[arg_262_2] = {
			trans = arg_265_0.transform,
			handler = var_262_1
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_266_0, arg_266_1)
	if not arg_266_0.extraItems then
		return
	end

	table.Foreach(arg_266_0.extraItems, function(arg_267_0, arg_267_1)
		if arg_266_1 and table.contains(arg_266_1, arg_267_0) then
			return
		end

		arg_266_0.loader:ReturnPrefab(arg_267_1.trans.gameObject)

		arg_266_0.extraItems[arg_267_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_268_0, arg_268_1, arg_268_2)
	arg_268_0.cameraBlendCallbacks[arg_268_1] = arg_268_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_269_0, arg_269_1)
	arg_269_0.cameraBlendCallbacks[arg_269_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_270_0, arg_270_1)
	if not arg_270_1 then
		return
	end

	local var_270_0 = table.removebykey(arg_270_0.cameraBlendCallbacks, arg_270_1)

	existCall(var_270_0)
end

function var_0_0.PlayHeartFX(arg_271_0, arg_271_1)
	local var_271_0 = arg_271_0.ladyDict[arg_271_1]

	setActive(var_271_0.effectHeart, false)
	setActive(var_271_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_272_0, arg_272_1)
	local var_272_0 = arg_272_1.name
	local var_272_1 = arg_272_0.expressionDict[var_272_0]
	local var_272_2 = 5

	if var_272_1 then
		local var_272_3 = var_272_1.timer

		var_272_3:Reset(nil, var_272_2)
		var_272_3:Start()

		if var_272_1.instance then
			setActive(var_272_1.instance, false)
			setActive(var_272_1.instance, true)
		end

		return
	end

	local var_272_4 = {
		name = var_272_0,
		timer = Timer.New(function()
			arg_272_0:RemoveExpression(var_272_0)
		end, var_272_2, 1, true)
	}

	arg_272_0.expressionDict[var_272_0] = var_272_4

	arg_272_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_272_0, var_272_0, function(arg_274_0)
		var_272_4.instance = arg_274_0

		onNextTick(function()
			local var_275_0 = arg_272_0:GetCurrentLadyEnv()

			setParent(arg_274_0, var_275_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_274_0, Vector3(0, 0, -0.2))
		setActive(arg_274_0, false)
		setActive(arg_274_0, true)
	end, var_272_4)
end

function var_0_0.RemoveExpression(arg_276_0, arg_276_1)
	local var_276_0 = arg_276_0.expressionDict[arg_276_1]

	if not var_276_0 then
		return
	end

	arg_276_0.loader:ClearRequest(var_276_0)

	if var_276_0.instance then
		arg_276_0.loader:ReturnPrefab(var_276_0.instance)
	end

	arg_276_0.expressionDict[arg_276_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_277_0, arg_277_1, arg_277_2)
	setActive(arg_277_1.ladyWatchFloat, arg_277_2)
end

function var_0_0.GetCameraSettings(arg_278_0)
	local var_278_0 = arg_278_0:GetExtraSystem(Dorm3dLightingSystem)

	assert(var_278_0, "Dorm3dLightingSystem is not initialized")

	return var_278_0:GetCameraSettings()
end

function var_0_0.onBackPressed(arg_279_0)
	if arg_279_0.exited or arg_279_0.retainCount > 0 then
		-- block empty
	else
		arg_279_0:closeView()
	end
end

function var_0_0.LoadTimelineScene(arg_280_0, arg_280_1, arg_280_2, arg_280_3, arg_280_4)
	arg_280_0.dormSceneMgr:LoadTimelineScene({
		name = arg_280_1,
		assetRootName = arg_280_0.apartment:getConfig("asset_name"),
		isCache = arg_280_2,
		waitForTimeline = arg_280_3,
		loadSceneFunc = function(arg_281_0, arg_281_1)
			local var_281_0 = Dorm3dHxHelper.GetTimelineMainCharacter()

			Dorm3dHxHelper.HideCharacterPart(var_281_0, nil, true)
			arg_280_0:HXCharacter(var_281_0)
		end
	}, arg_280_4)
end

function var_0_0.UnloadTimelineScene(arg_282_0, arg_282_1, arg_282_2, arg_282_3)
	arg_282_0.dormSceneMgr:UnloadTimelineScene(arg_282_1, arg_282_2, arg_282_3)
end

function var_0_0.ChangeArtScene(arg_283_0, arg_283_1, arg_283_2)
	if Dorm3dSceneMgr.IsSameSceneInfo(arg_283_1, arg_283_0.dormSceneMgr.artSceneInfo) then
		existCall(arg_283_2)

		return
	end

	local var_283_0 = Dorm3dSceneMgr.IsSameSceneInfo(arg_283_1, arg_283_0.dormSceneMgr.sceneInfo)
	local var_283_1 = {}

	table.insert(var_283_1, function(arg_284_0)
		arg_283_0:emit(var_0_0.ART_SCENE_WILL_CHANGE, arg_283_1, var_283_0)
		arg_284_0()
	end)
	table.insert(var_283_1, function(arg_285_0)
		arg_283_0.dormSceneMgr:ChangeArtScene(arg_283_1, arg_285_0)
	end)
	table.insert(var_283_1, function(arg_286_0)
		arg_283_0:RefreshArtSceneRefs()
		arg_283_0:emit(var_0_0.ART_SCENE_CHANGED, arg_283_1, var_283_0)
		arg_286_0()
	end)
	table.insert(var_283_1, function(arg_287_0)
		setActive(arg_283_0.slotRoot, false)
		arg_287_0()
	end)
	warning(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", arg_283_1, arg_283_0.dormSceneMgr.sceneInfo, Dorm3dSceneMgr.IsSameSceneInfo(arg_283_1, arg_283_0.dormSceneMgr.sceneInfo))

	if Dorm3dSceneMgr.IsSameSceneInfo(arg_283_1, arg_283_0.dormSceneMgr.sceneInfo) then
		table.insert(var_283_1, function(arg_288_0)
			arg_283_0:SwitchDayNight(1)
			arg_283_0:emit(CollectionSystem.TEMP_HIDE, true)
			arg_288_0()
		end)
	end

	seriesAsync(var_283_1, arg_283_2)
end

function var_0_0.RefreshArtSceneRefs(arg_289_0)
	local var_289_0 = GameObject.Find("scene_root")

	assert(var_289_0, "Missing scene_root after art scene change")

	arg_289_0.modelRoot = var_289_0.transform
end

function var_0_0.MoveObjectToBaseScene(arg_290_0, arg_290_1)
	local var_290_0 = Dorm3dSceneMgr.ParseInfo(arg_290_0.dormSceneMgr.sceneInfo)
	local var_290_1 = SceneManager.GetSceneByName(var_290_0 .. "_base")

	arg_290_1.transform:SetParent(nil)
	SceneManager.MoveGameObjectToScene(arg_290_1, var_290_1)
end

function var_0_0.RevertArtScene(arg_291_0, arg_291_1, arg_291_2)
	local var_291_0 = {}

	table.insert(var_291_0, function(arg_292_0)
		arg_291_0:ChangeArtScene(arg_291_1, arg_292_0)
	end)
	table.insert(var_291_0, function(arg_293_0)
		setActive(arg_291_0.slotRoot, true)
		arg_293_0()
	end)
	table.insert(var_291_0, function(arg_294_0)
		arg_291_0:SwitchDayNight(arg_291_0.contextData.timeIndex)
		onNextTick(function()
			arg_291_0:RefreshSlots()
			arg_291_0:emit(CollectionSystem.TEMP_HIDE, false)
			arg_294_0()
		end)
	end)
	seriesAsync(var_291_0, arg_291_2)
end

function var_0_0.ChangeSubScene(arg_296_0, arg_296_1, arg_296_2)
	local var_296_0 = {}

	table.insert(var_296_0, function(arg_297_0)
		arg_296_0.dormSceneMgr:ChangeSubScene(arg_296_1, arg_297_0)
	end)

	local var_296_1 = arg_296_0:GetCurrentLadyEnv()
	local var_296_2 = arg_296_0:GetBlackboardValue(var_296_1, "groupId")

	table.insert(var_296_0, function(arg_298_0)
		if Dorm3dSceneMgr.IsSameSceneInfo(arg_296_1, arg_296_0.dormSceneMgr.sceneInfo) then
			arg_296_0:SetLadyActiveZone(var_296_2, var_296_1.walkBornPoint or arg_296_0:GetLadyBaseZone(var_296_2))
		else
			arg_296_0:SetLadyActiveZone(var_296_2, var_296_1.walkBornPoint or "Default")
		end

		arg_298_0()
	end)

	if not Dorm3dSceneMgr.IsSameSceneInfo(arg_296_1, arg_296_0.dormSceneMgr.subSceneInfo) then
		table.insert(var_296_0, function(arg_299_0)
			local var_299_0, var_299_1 = Dorm3dSceneMgr.ParseInfo(arg_296_1)
			local var_299_2 = var_299_0 .. "_base"

			arg_296_0:ResetSceneStructure(SceneManager.GetSceneByName(var_299_2))

			if Dorm3dSceneMgr.IsSameSceneInfo(arg_296_1, arg_296_0.dormSceneMgr.sceneInfo) then
				arg_296_0:RefreshSlots()
			else
				arg_296_0:SwitchAnim(var_296_1, var_0_0.ANIM.IDLE)
			end

			if not Dorm3dSceneMgr.IsSameSceneInfo(arg_296_0.dormSceneMgr.subSceneInfo, arg_296_0.dormSceneMgr.sceneInfo) then
				arg_296_0:RefreshSlotsEmpty()
			end

			arg_299_0()
		end)
	end

	table.insert(var_296_0, function(arg_300_0)
		onNextTick(function()
			arg_296_0:ChangeCharacterPosition(var_296_1)
			arg_296_0:ChangePlayerPosition(arg_296_0:GetLadyActiveZone(var_296_2))
			arg_296_0:TriggerLadyDistance()
			arg_296_0:CheckInSector()
			arg_300_0()
		end)
	end)
	seriesAsync(var_296_0, arg_296_2)
end

function var_0_0.IsPointInSector(arg_302_0, arg_302_1)
	local var_302_0 = arg_302_1 - arg_302_0.Position

	if var_302_0.y > arg_302_0.Radius then
		return false
	end

	var_302_0.y = 0

	if var_302_0.magnitude > arg_302_0.Radius then
		return false
	end

	local var_302_1 = arg_302_0.Rotation

	return Vector3.Angle(var_302_1 * Vector3.forward, var_302_0) <= arg_302_0.Angle / 2
end

function var_0_0.GetRestritedHeightRange(arg_303_0)
	if not arg_303_0.isMultiFloor then
		return arg_303_0.restrictedHeightRange
	else
		for iter_303_0 = #arg_303_0.restrictedHeightRange, 1, -1 do
			local var_303_0 = arg_303_0.restrictedHeightRange[iter_303_0]

			if arg_303_0.mainCameraTF.position.y >= var_303_0[1] then
				return var_303_0
			end
		end

		return arg_303_0.restrictedHeightRange[1]
	end
end

function var_0_0.willExit(arg_304_0)
	var_0_0.super.willExit(arg_304_0)
	arg_304_0.joystickTimer:Stop()
	arg_304_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_304_0.updateHandler)

	if arg_304_0.moveTimer then
		arg_304_0.moveTimer:Stop()

		arg_304_0.moveTimer = nil
	end

	if arg_304_0.moveWaitTimer then
		arg_304_0.moveWaitTimer:Stop()

		arg_304_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()
	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_304_0, iter_304_1 in pairs(arg_304_0.ladyDict) do
		GetComponent(iter_304_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_304_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_304_0.camBrainEvenetHandler.OnBlendFinished = nil

	arg_304_0:UnOverlayPanel(arg_304_0.blockLayer, arg_304_0._tf)
	table.Foreach(arg_304_0.expressionDict, function(arg_305_0)
		arg_304_0:RemoveExpression(arg_305_0)
	end)
	arg_304_0.loader:Clear()

	arg_304_0.hxHelper = nil

	pg.ClickEffectMgr.GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()
	arg_304_0.dormSceneMgr:Dispose()

	arg_304_0.dormSceneMgr = nil

	ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)

	if arg_304_0.transformFilter then
		arg_304_0.transformFilter:Dispose()
	end
end

return var_0_0
