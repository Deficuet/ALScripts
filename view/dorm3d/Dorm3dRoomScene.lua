local var_0_0 = class("Dorm3dRoomScene", import("view.dorm3d.Dorm3dRoomTemplateScene"))

var_0_0.NOTIFY_UI_STATE = "Dorm3dRoomScene.NOTIFY_UI_STATE"

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dMainUI"
end

function var_0_0.SetRoom(arg_2_0, arg_2_1)
	var_0_0.super.SetRoom(arg_2_0, arg_2_1)
	arg_2_0:UpdateContactState()
end

function var_0_0.SetApartment(arg_3_0, arg_3_1)
	arg_3_0.apartment = arg_3_1

	arg_3_0:UpdateFavorDisplay()
end

function var_0_0.init(arg_4_0)
	var_0_0.super.init(arg_4_0)

	arg_4_0.videoPlayer = VoiceChatLoader.New(arg_4_0._tf)
	arg_4_0.stockingView = Dorm3dStockingView.New(arg_4_0._tf, arg_4_0.event, setmetatable({}, {
		__index = arg_4_0.contextData
	}))

	Shader.SetGlobalFloat("_ScreenClipOff", 1)

	arg_4_0.uiContainer = arg_4_0._tf:Find("UI")

	local var_4_0 = arg_4_0.uiContainer:Find("base")

	onButton(arg_4_0, var_4_0:Find("btn_back"), function()
		arg_4_0:emit(BaseUI.ON_BACK)
	end, SFX_DORM_BACK)
	onButton(arg_4_0, var_4_0:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_dorm3d_info.tip
		})
	end, SFX_PANEL)

	arg_4_0.rtFavorLevel = var_4_0:Find("top/favor_level")

	setActive(arg_4_0.rtFavorLevel, arg_4_0.room:isPersonalRoom())
	onButton(arg_4_0, arg_4_0.rtFavorLevel, function()
		local var_7_0 = {}

		arg_4_0:emit(Dorm3dRoomMediator.OPEN_LEVEL_LAYER, {
			apartment = arg_4_0.apartment,
			timeIndex = arg_4_0.contextData.timeIndex,
			baseCamera = arg_4_0.mainCameraTF,
			roomId = arg_4_0.room:GetConfigID()
		})
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("top/setting"), function()
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_SETTING_LAYER)
	end)
	onButton(arg_4_0, var_4_0:Find("left/btn_photograph"), function()
		if #arg_4_0.contextData.groupIds == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_photo_no_role"))

			return
		end

		local var_9_0, var_9_1 = arg_4_0:CheckSystemOpen("Photo")

		if not var_9_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_9_1)

			return
		end

		if not arg_4_0.apartment then
			local var_9_2 = arg_4_0.contextData.groupIds[1]

			for iter_9_0, iter_9_1 in pairs(arg_4_0.ladyDict) do
				if iter_9_1.ladyBaseZone == arg_4_0:GetAttachedFurnitureName() then
					var_9_2 = iter_9_0

					break
				end
			end

			arg_4_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_9_2))
		end

		getProxy(Dorm3dChatProxy):TriggerEvent({
			{
				value = 1,
				event_type = arg_4_0.contextData.timeIndex == 1 and 114 or 119,
				ship_id = arg_4_0.apartment:GetConfigID()
			}
		})
		arg_4_0:OutOfLazy(arg_4_0.apartment:GetConfigID(), function()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_CAMERA_LAYER, arg_4_0, arg_4_0.apartment:GetConfigID())
		end)
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("left/btn_collection"), function()
		local var_11_0, var_11_1 = arg_4_0:CheckSystemOpen("Collection")

		if not var_11_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_11_1)

			return
		end

		setActive(var_4_0:Find("left/btn_collection/tip"), false)
		PlayerPrefs.SetInt("apartment_collection_item", 0)
		PlayerPrefs.SetInt("apartment_collection_recall", 0)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_COLLECTION_LAYER, arg_4_0.room:GetConfigID())
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("left/btn_furniture"), function()
		local var_12_0, var_12_1 = arg_4_0:CheckSystemOpen("Furniture")

		if not var_12_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_12_1)

			return
		end

		arg_4_0:RemoveExtraSystem({
			SlideExtraSystem
		})
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_FURNITURE_SELECT, {
			apartment = arg_4_0.apartment
		})

		arg_4_0.isInFurnitureSelect = true
	end, SFX_PANEL)

	if not arg_4_0.room:isPersonalRoom() then
		local var_4_1 = arg_4_0:CheckSystemOpen("Furniture")

		setActive(var_4_0:Find("left/line_furniture"), var_4_1)
		setActive(var_4_0:Find("left/btn_furniture"), var_4_1)
	end

	onButton(arg_4_0, var_4_0:Find("left/btn_accompany"), function()
		local var_13_0, var_13_1 = arg_4_0:CheckSystemOpen("Accompany")

		if not var_13_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_13_1)

			return
		end

		local var_13_2 = arg_4_0.apartment:GetConfigID()
		local var_13_3

		arg_4_0:emit(Dorm3dRoomMediator.OPEN_ACCOMPANY_WINDOW, {
			groupId = var_13_2,
			confirmFunc = function(arg_14_0)
				var_13_3 = arg_14_0
			end
		}, function()
			if var_13_3 then
				arg_4_0:OutOfLazy(var_13_2, function()
					arg_4_0:EnterAccompanyMode(var_13_3)
				end)
			else
				arg_4_0:CheckQueue()
			end
		end)
	end, SFX_PANEL)

	if not arg_4_0.room:isPersonalRoom() then
		setActive(var_4_0:Find("left/line_accompany"), false)
		setActive(var_4_0:Find("left/btn_accompany"), false)
	end

	onButton(arg_4_0, var_4_0:Find("left/btn_skin"), function()
		arg_4_0:ActiveCamera(arg_4_0.cameras[var_0_0.CAMERA.SKIN])
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_SKIN_SELECT_LAYER, arg_4_0.apartment:GetConfigID(), arg_4_0:GetCurrentLadyEnv(), nil, function()
			arg_4_0:ChangePlayerPosition()
			arg_4_0:ActiveCamera(arg_4_0.cameras[var_0_0.CAMERA.POV])
		end, false)
	end)

	if not arg_4_0.room:isPersonalRoom() then
		setActive(var_4_0:Find("left/line_skin"), false)
		setActive(var_4_0:Find("left/btn_skin"), false)
	end

	onButton(arg_4_0, var_4_0:Find("left/btn_invite"), function()
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_INVITE_WINDOW, arg_4_0.room:GetConfigID(), underscore.rest(arg_4_0.contextData.groupIds, 1))
	end, SFX_PANEL)

	if arg_4_0.room:isPersonalRoom() then
		setActive(var_4_0:Find("left/line_invite"), false)
		setActive(var_4_0:Find("left/btn_invite"), false)
	end

	arg_4_0.btnZone = var_4_0:Find("right/Zone")
	arg_4_0.rtZoneList = var_4_0:Find("right/Zone/List")

	setActive(arg_4_0.rtZoneList, false)
	onButton(arg_4_0, arg_4_0.btnZone, function()
		setActive(arg_4_0.rtZoneList, not isActive(arg_4_0.rtZoneList))
	end, SFX_PANEL)
	UIItemList.StaticAlign(arg_4_0.rtZoneList, arg_4_0.rtZoneList:GetChild(0), #arg_4_0.zoneDatas, function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_21_1 = arg_21_1 + 1

		local var_21_0 = arg_4_0.zoneDatas[arg_21_1]
		local var_21_1 = var_21_0:GetWatchCameraName()

		arg_21_2.name = var_21_1

		setText(arg_21_2:Find("Name"), var_21_0:GetName())
		setActive(arg_21_2:Find("Line"), arg_21_1 < #arg_4_0.zoneDatas)
		onButton(arg_4_0, arg_21_2, function()
			if arg_4_0.uiState ~= "base" then
				return
			end

			setActive(arg_4_0.rtZoneList, false)
			arg_4_0:ShiftZoneSafe(var_21_1)
		end, SFX_PANEL)
	end)

	local var_4_2 = arg_4_0.uiContainer:Find("walk")
	local var_4_3 = arg_4_0.uiContainer:Find("ik")

	onButton(arg_4_0, var_4_3:Find("btn_back"), function()
		if arg_4_0.ikSpecialCall then
			local var_23_0 = arg_4_0.ikSpecialCall

			arg_4_0.ikSpecialCall = nil

			existCall(var_23_0)
		else
			arg_4_0:ExitTouchMode()
		end
	end, SFX_DORM_BACK)
	onButton(arg_4_0, var_4_3:Find("btn_back_heartbeat"), function()
		arg_4_0:ExitHeartbeatMode()
	end, SFX_DORM_BACK)
	setActive(var_4_3:Find("btn_back_heartbeat"), false)
	onButton(arg_4_0, var_4_3:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_3:Find("Right/btn_camera"), function()
		arg_4_0:CycleIKCameraGroup()
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_3:Find("Right/MenuSmall"), function()
		setActive(var_4_3:Find("Right/MenuSmall"), false)
		setActive(var_4_3:Find("Right/Menu"), true)
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_3:Find("Right/Menu/Collapse"), function()
		setActive(var_4_3:Find("Right/Menu"), false)
		setActive(var_4_3:Find("Right/MenuSmall"), true)
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_3:Find("Right/Menu"), function()
		setActive(var_4_3:Find("Right"), false)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_SKIN_SELECT_LAYER, arg_4_0.apartment:GetConfigID(), arg_4_0:GetCurrentLadyEnv(), function(arg_30_0, arg_30_1, arg_30_2)
			seriesAsync({
				function(arg_31_0)
					arg_4_0:SetIKState(false, arg_31_0)
				end,
				function(arg_32_0)
					arg_30_0:SwitchCharacterSkin(arg_30_1, arg_30_2)
					arg_4_0:SwitchIKConfig(arg_30_0, arg_30_0.ikConfig.id)
					arg_4_0:SetIKState(true, arg_32_0)
				end
			})
		end, function()
			setActive(var_4_3:Find("Right"), true)
		end, true)
	end, SFX_PANEL)

	local var_4_4 = arg_4_0._tf:Find("IKControl")

	arg_4_0.ikTipsRoot = var_4_4:Find("Tips")

	setActive(arg_4_0.ikTipsRoot, false)

	arg_4_0.ikClickTipsRoot = var_4_4:Find("ClickTips")

	setActive(arg_4_0.ikClickTipsRoot, false)

	arg_4_0.ikHand = var_4_4:Find("Handler")

	setActive(arg_4_0.ikHand, false)
	eachChild(arg_4_0.ikHand, function(arg_34_0)
		setActive(arg_34_0, false)
	end)

	arg_4_0.ikTextTipsRoot = var_4_4:Find("TextTips")

	setActive(arg_4_0.ikTextTipsRoot, false)
	eachChild(arg_4_0.ikTextTipsRoot, function(arg_35_0)
		setActive(arg_35_0, false)
	end)

	arg_4_0.ikControlUI = var_4_4

	local var_4_5 = arg_4_0.uiContainer:Find("accompany")

	onButton(arg_4_0, var_4_5:Find("btn_back"), function()
		arg_4_0:ExitAccompanyMode()
	end, SFX_DORM_BACK)

	arg_4_0.unlockList = {}
	arg_4_0.rtFavorUp = arg_4_0._tf:Find("Toast/favor_up")

	arg_4_0.rtFavorUp:GetComponent("DftAniEvent"):SetEndEvent(function(arg_37_0)
		setActive(arg_4_0.rtFavorUp, false)

		if #arg_4_0.unlockList > 0 then
			setText(arg_4_0.rtFavorUp:Find("Text"), table.remove(arg_4_0.unlockList, 1))
			setActive(arg_4_0.rtFavorUp, true)
		end
	end)
	setActive(arg_4_0.rtFavorUp, false)

	arg_4_0.rtFavorUpDaily = arg_4_0._tf:Find("Toast/favor_up_daily")

	setActive(arg_4_0.rtFavorUpDaily, false)

	arg_4_0.rtStaminaPop = arg_4_0._tf:Find("Toast/stamina")

	local var_4_6 = arg_4_0.rtStaminaPop:GetComponent("DftAniEvent")

	var_4_6:SetTriggerEvent(function(arg_38_0)
		local var_38_0, var_38_1 = getProxy(ApartmentProxy):getStamina()

		setText(arg_4_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_38_0, var_38_1))
	end)
	var_4_6:SetEndEvent(function(arg_39_0)
		setActive(arg_4_0.rtStaminaPop, false)
	end)
	setActive(arg_4_0.rtStaminaPop, false)

	arg_4_0.rtLevelUpWindow = arg_4_0._tf:Find("LevelUpWindow")

	setActive(arg_4_0.rtLevelUpWindow, false)
	onButton(arg_4_0, arg_4_0.rtLevelUpWindow:Find("bg"), function()
		if arg_4_0.isLock then
			return
		end

		arg_4_0.isLock = true

		quickPlayAnimation(arg_4_0.rtLevelUpWindow, "anim_dorm3d_levelup_out")
		LeanTween.delayedCall(0.2, System.Action(function()
			arg_4_0.isLock = false

			setActive(arg_4_0.rtLevelUpWindow, false)
			arg_4_0:UnOverlayPanel(arg_4_0.rtLevelUpWindow, arg_4_0._tf)
			existCall(arg_4_0.levelUpCallback)
		end))
	end, SFX_PANEL)

	local var_4_7 = arg_4_0.uiContainer:Find("watch")

	onButton(arg_4_0, var_4_7:Find("btn_back"), function()
		arg_4_0:ExitWatchMode()
	end, SFX_DORM_BACK)
	onButton(arg_4_0, var_4_7:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)

	arg_4_0.rtStaminaDisplay = var_4_7:Find("stamina")
	arg_4_0.rtRole = arg_4_0.uiContainer:Find("watch/Role")

	onButton(arg_4_0, arg_4_0.rtRole:Find("Talk"), function()
		local var_44_0 = arg_4_0:GetCurrentLadyEnv().ladyBaseZone
		local var_44_1 = arg_4_0.apartment:getFurnitureTalking(arg_4_0.room:GetConfigID(), var_44_0)

		if #var_44_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without topic")

			return
		end

		arg_4_0:DoTalk(var_44_1[math.random(#var_44_1)], function()
			local var_45_0 = getDorm3dGameset("drom3d_favir_trigger_talk")[1]

			arg_4_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_4_0.apartment.configId, var_45_0)
		end)
	end, SFX_DORM_CLICK)
	setText(arg_4_0.rtRole:Find("Talk/bg/Text"), i18n("dorm3d_talk"))

	arg_4_0.rtRoleTouchSubView = Dorm3dRTRoleTouchSubView.New(arg_4_0.rtRole:Find("Touch"), arg_4_0.event, setmetatable({
		onClick = function(arg_46_0)
			arg_4_0:EnterTouchMode(arg_46_0)
		end
	}, {
		__index = arg_4_0.contextData
	}))

	onButton(arg_4_0, arg_4_0.rtRole:Find("Gift"), function()
		arg_4_0:emit(arg_4_0.SHOW_BLOCK)
		arg_4_0:ActiveStateCamera("gift", function()
			arg_4_0:emit(arg_4_0.HIDE_BLOCK)
		end)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_GIFT_LAYER, {
			groupId = arg_4_0.apartment:GetConfigID(),
			baseCamera = arg_4_0.mainCameraTF
		})
	end, SFX_DORM_CLICK)
	setText(arg_4_0.rtRole:Find("Gift/bg/Text"), i18n("dorm3d_gift"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("MiniGame"), function()
		assert(not arg_4_0.nowMiniGameId)

		arg_4_0.nowMiniGameId = arg_4_0.room:getMiniGames()[1]

		local var_49_0 = pg.dorm3d_minigame[arg_4_0.nowMiniGameId]
		local var_49_1 = arg_4_0:GetCurrentLadyEnv()

		getProxy(Dorm3dChatProxy):TriggerEvent({
			{
				value = 1,
				event_type = arg_4_0.contextData.timeIndex == 1 and 112 or 117,
				ship_id = arg_4_0.apartment:GetConfigID()
			},
			{
				value = 1,
				event_type = 158,
				ship_id = arg_4_0.apartment:GetConfigID()
			}
		})

		local var_49_2 = {}

		table.insert(var_49_2, function(arg_50_0)
			arg_4_0:SetAllBlackbloardValue("inLockLayer", true)
			arg_4_0:TempHideUI(true, arg_50_0)
		end)

		if var_49_0.area ~= "" and var_49_1.ladyBaseZone ~= var_49_0.area then
			table.insert(var_49_2, function(arg_51_0)
				arg_4_0:ShiftZone(var_49_0.area, arg_51_0)
			end)
		end

		local var_49_3
		local var_49_4

		if var_49_0.action ~= "" then
			var_49_3, var_49_4 = unpack(var_49_0.action)
		end

		table.insert(var_49_2, function(arg_52_0)
			parallelAsync({
				function(arg_53_0)
					if var_49_3 then
						arg_4_0:PlaySingleAction(var_49_1, var_49_3, arg_53_0)
					else
						arg_53_0()
					end
				end,
				function(arg_54_0)
					arg_4_0:ActiveStateCamera("talk", arg_54_0)
				end
			}, arg_52_0)
		end)
		table.insert(var_49_2, function(arg_55_0)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(1))
			arg_4_0:HandleGameNotification(Dorm3dMiniGameMediator.OPERATION, {
				operationCode = "BEFORE_OPEN_GAME",
				miniGameId = arg_4_0.nowMiniGameId
			})
			arg_4_0:EnableMiniGameCutIn()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_MINIGAME_WINDOW, {
				isDorm3d = true,
				minigameId = arg_4_0.nowMiniGameId
			}, arg_55_0)
		end)
		table.insert(var_49_2, function(arg_56_0)
			arg_4_0:DisableMiniGameCutIn()

			if var_49_4 then
				arg_4_0:PlaySingleAction(var_49_1, var_49_4, arg_56_0)
			else
				arg_56_0()
			end
		end)
		seriesAsync(var_49_2, function()
			arg_4_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_4_0:TempHideUI(false)

			arg_4_0.nowMiniGameId = nil
		end)
	end, SFX_DORM_CLICK)
	setText(arg_4_0.rtRole:Find("MiniGame/bg/Text"), i18n("dorm3d_minigame_button1"))

	if not arg_4_0.room:isPersonalRoom() then
		onButton(arg_4_0, arg_4_0.rtRole:Find("PublicGame"), switch(arg_4_0.room.id, {
			[4] = function()
				return function()
					arg_4_0:emit(Dorm3dRoomMediator.ENTER_VOLLEYBALL, arg_4_0.apartment:GetConfigID())
				end
			end,
			[16] = function()
				return function()
					arg_4_0:emit(Dorm3dRoomMediator.ENTER_DANCE, arg_4_0.apartment:GetConfigID())
				end
			end
		}), SFX_DORM_CLICK)
		setText(arg_4_0.rtRole:Find("PublicGame/bg/Text"), switch(arg_4_0.room.id, {
			[4] = function()
				return i18n("dorm3d_volleyball_button")
			end,
			[16] = function()
				return i18n("dorm3d_dance_button")
			end
		}))
	end

	onButton(arg_4_0, arg_4_0.rtRole:Find("Performance"), function()
		arg_4_0:DoTalk(20500, function()
			pg.TipsMgr.GetInstance():ShowTips("Success!")
		end)
	end, SFX_DORM_CLICK)

	arg_4_0.rtFloatPage = arg_4_0._tf:Find("FloatPage")
	arg_4_0.tplFloat = arg_4_0.rtFloatPage:Find("tpl")

	setActive(arg_4_0.tplFloat, false)

	local var_4_8 = cloneTplTo(arg_4_0.tplFloat, arg_4_0.rtFloatPage, "lady")

	eachChild(var_4_8, function(arg_66_0)
		setActive(arg_66_0, arg_66_0.name == "walk")
	end)

	arg_4_0._joystick = arg_4_0._tf:Find("Stick")

	setActive(arg_4_0._joystick, false)
	arg_4_0._joystick:GetComponent(typeof(SlideController)):SetStickFunc(function(arg_67_0)
		arg_4_0:emit(arg_4_0.ON_STICK_MOVE, arg_67_0)
	end)

	arg_4_0.povLayer = arg_4_0._tf:Find("POVControl")

	setActive(arg_4_0.povLayer, false)
	;(function()
		local var_68_0 = arg_4_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

		var_68_0:AddBeginDragFunc(function(arg_69_0, arg_69_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_BEGIN, arg_69_1)
		end)
		var_68_0:SetStickFunc(function(arg_70_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE, arg_70_0)
		end)
		var_68_0:AddDragEndFunc(function(arg_71_0, arg_71_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_END, arg_71_1)
		end)
		arg_4_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_72_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_VIEW, arg_72_0)
		end)
	end)()

	arg_4_0.ikControlLayer = var_4_4:Find("ControlLayer")

	;(function()
		local var_73_0
		local var_73_1 = arg_4_0.ikControlLayer:GetComponent(typeof(SlideController))

		var_73_1:AddBeginDragFunc(function(arg_74_0, arg_74_1)
			local var_74_0 = arg_4_0:GetCurrentLadyEnv()

			if not var_74_0.IKSettings then
				return
			end

			local var_74_1 = arg_74_1.position
			local var_74_2 = CameraMgr.instance:Raycast(var_74_0.IKSettings.CameraRaycaster, var_74_1):ToTable()

			if #var_74_2 > 0 then
				local var_74_3 = var_74_2[1].gameObject.transform
				local var_74_4 = table.keyof(var_74_0.IKSettings.Colliders, var_74_3)

				warning(var_74_3, var_74_4)

				if var_74_4 then
					arg_4_0:emit(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, var_74_0, var_74_4, var_74_1)

					var_73_0 = tobool(var_74_0.ikHandler)

					return
				end
			end
		end)
		var_73_1:AddDragFunc(function(arg_75_0, arg_75_1)
			local var_75_0 = arg_75_1.position
			local var_75_1 = arg_4_0:GetCurrentLadyEnv()

			if var_75_1.ikHandler then
				arg_4_0:emit(var_0_0.ON_DRAG_CHARACTER_BODY, var_75_1, var_75_0)

				return
			end

			if var_73_0 then
				return
			end

			local var_75_2 = arg_75_1.delta

			arg_4_0:emit(arg_4_0.ON_STICK_MOVE, var_75_2)
		end)
		var_73_1:AddDragEndFunc(function(arg_76_0, arg_76_1)
			var_73_0 = nil

			local var_76_0 = arg_4_0:GetCurrentLadyEnv()

			if var_76_0.ikHandler then
				arg_4_0:emit(var_0_0.ON_RELEASE_CHARACTER_BODY, var_76_0)

				return
			end
		end)
	end)()

	arg_4_0.rtExtraScreen = arg_4_0._tf:Find("ExtraScreen")
	arg_4_0.rtTouchGamePanel = arg_4_0.rtExtraScreen:Find("TouchGame")
	arg_4_0.rtTimelineScreen = arg_4_0.rtExtraScreen:Find("TimelineScreen")

	onButton(arg_4_0, arg_4_0.rtTimelineScreen:Find("btn_skip"), function()
		existCall(arg_4_0.timelineFinishCall)
	end, SFX_CANCEL)

	arg_4_0.uiStack = {}
	arg_4_0.uiStore = {}
end

function var_0_0.BindEvent(arg_78_0)
	var_0_0.super.BindEvent(arg_78_0)
	arg_78_0:bind(arg_78_0.CLICK_CHARACTER, function(arg_79_0, arg_79_1)
		if arg_78_0.uiState ~= "base" or not arg_78_0.ladyDict[arg_79_1].nowCanWatchState then
			return
		end

		local var_79_0 = {}
		local var_79_1 = arg_78_0.ladyDict[arg_79_1]

		if arg_78_0:GetBlackboardValue(var_79_1, "inPending") then
			table.insert(var_79_0, function(arg_80_0)
				arg_78_0:OutOfPending(arg_79_1, arg_80_0)
			end)
		else
			table.insert(var_79_0, function(arg_81_0)
				arg_78_0:OutOfLazy(arg_79_1, arg_81_0)
			end)
		end

		seriesAsync(var_79_0, function()
			if not arg_78_0.room:isPersonalRoom() then
				arg_78_0:SetApartment(getProxy(ApartmentProxy):getApartment(arg_79_1))
			end

			arg_78_0:EnterWatchMode()
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	arg_78_0:bind(arg_78_0.CLICK_CONTACT, function(arg_83_0, arg_83_1)
		arg_78_0:TriggerContact(arg_83_1)
	end)
	arg_78_0:bind(arg_78_0.DISTANCE_TRIGGER, function(arg_84_0, arg_84_1, arg_84_2)
		if arg_78_0.uiState == "base" then
			arg_78_0:CheckDistanceTalk(arg_84_1, arg_84_2)
		end
	end)
	arg_78_0:bind(arg_78_0.WALK_DISTANCE_TRIGGER, function(arg_85_0, arg_85_1, arg_85_2)
		if arg_78_0.apartment and arg_78_0.apartment:GetConfigID() == arg_85_1 then
			existCall(arg_78_0.walkNearCallback, arg_85_2)
		end
	end)
	arg_78_0:bind(arg_78_0.CHANGE_WATCH, function(arg_86_0, arg_86_1)
		arg_78_0:ChangeCanWatchState(arg_78_0.ladyDict[arg_86_1])
	end)
	arg_78_0:bind(arg_78_0.ON_TOUCH_CHARACTER, function(arg_87_0, arg_87_1)
		local var_87_0 = arg_78_0:GetCurrentLadyEnv()

		if not arg_78_0:GetBlackboardValue(var_87_0, "inIK") then
			return
		end

		arg_78_0:OnTouchCharacterBody(arg_87_1)
	end)
	arg_78_0:bind(var_0_0.ON_IK_STATUS_CHANGED, function(arg_88_0, arg_88_1, arg_88_2)
		local var_88_0 = arg_78_0:GetCurrentLadyEnv()

		if not arg_78_0:GetBlackboardValue(var_88_0, "inTouching") then
			return
		end

		arg_78_0:DoTouch(arg_88_1, arg_88_2)
	end)
	arg_78_0:bind(arg_78_0.ON_ENTER_SECTOR, function(arg_89_0, arg_89_1)
		arg_78_0:ChangeCanWatchState(arg_78_0.ladyDict[arg_89_1])
	end)
	arg_78_0:bind(arg_78_0.ON_CHANGE_DISTANCE, function(arg_90_0, arg_90_1, arg_90_2)
		arg_78_0:ChangeCanWatchState(arg_78_0.ladyDict[arg_90_1])
	end)
end

function var_0_0.didEnter(arg_91_0)
	arg_91_0.resumeCallback = arg_91_0.contextData.resumeCallback
	arg_91_0.contextData.resumeCallback = nil

	var_0_0.super.didEnter(arg_91_0)
	arg_91_0:UpdateZoneList()
	arg_91_0:SetUI(function()
		arg_91_0:didEnterCheck()
	end, "base")
end

function var_0_0.FinishEnterResume(arg_93_0)
	if not arg_93_0.resumeCallback then
		return
	end

	local var_93_0 = arg_93_0.resumeCallback

	arg_93_0.resumeCallback = nil

	return var_93_0()
end

function var_0_0.EnableJoystick(arg_94_0, arg_94_1)
	setActive(arg_94_0._joystick, arg_94_1)
end

function var_0_0.EnablePOVLayer(arg_95_0, arg_95_1)
	setActive(arg_95_0.povLayer, arg_95_1)

	if not arg_95_1 then
		arg_95_0:emit(arg_95_0.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUIStore(arg_96_0, arg_96_1, ...)
	table.insertto(arg_96_0.uiStore, {
		...
	})
	existCall(arg_96_1)
end

function var_0_0.SetUI(arg_97_0, arg_97_1, ...)
	warning("SetUI", ...)

	while rawget(arg_97_0, "class") ~= var_0_0 do
		arg_97_0 = getmetatable(arg_97_0).__index
	end

	table.insertto(arg_97_0.uiStore, {
		...
	})

	for iter_97_0, iter_97_1 in ipairs(arg_97_0.uiStore) do
		if iter_97_1 == "back" then
			assert(#arg_97_0.uiStack > 0)

			arg_97_0.uiState = table.remove(arg_97_0.uiStack)
		elseif iter_97_1 == arg_97_0.uiState and iter_97_1 == "ik" then
			-- block empty
		else
			table.insert(arg_97_0.uiStack, arg_97_0.uiState)

			arg_97_0.uiState = iter_97_1
		end
	end

	pg.m02:sendNotification(var_0_0.NOTIFY_UI_STATE, arg_97_0.uiState)

	arg_97_0.uiStore = {}

	eachChild(arg_97_0.uiContainer, function(arg_98_0)
		setActive(arg_98_0, arg_98_0.name == arg_97_0.uiState)
	end)
	arg_97_0:EnablePOVLayer(arg_97_0.uiState == "base" or arg_97_0.uiState == "walk")
	arg_97_0:TempHideContact(arg_97_0.uiState ~= "base")
	arg_97_0:SetFloatEnable(arg_97_0.uiState == "walk")
	setActive(arg_97_0.rtFloatPage, arg_97_0.uiState == "walk")
	setActive(arg_97_0.ikControlUI, arg_97_0.uiState == "ik")

	if arg_97_0.uiState ~= "stocking" then
		arg_97_0.stockingView:Hide()
	end

	warning("SetUI to ", arg_97_0.uiState)
	switch(arg_97_0.uiState, {
		base = function()
			if not arg_97_0.room:isPersonalRoom() then
				arg_97_0:SetApartment(nil)
			end

			arg_97_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_97_0.rtRole, function(arg_101_0)
				setActive(arg_101_0, false)
			end)

			local var_100_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"MiniGame",
				"PublicGame",
				"Performance"
			}, function(arg_102_0)
				return arg_97_0:CheckSystemOpen(arg_102_0)
			end)
			local var_100_1 = 0.05

			for iter_100_0, iter_100_1 in ipairs(var_100_0) do
				LeanTween.delayedCall(var_100_1, System.Action(function()
					setActive(arg_97_0.rtRole:Find(iter_100_1), true)

					if iter_100_1 == "Touch" then
						local var_103_0 = arg_97_0.apartment:GetConfigID()

						arg_97_0.rtRoleTouchSubView:Flush(arg_97_0.room, var_103_0, arg_97_0.ladyDict[var_103_0].ladyBaseZone)
					end
				end))

				var_100_1 = var_100_1 + 0.066
			end

			setActive(arg_97_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_97_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_97_0.uiContainer:Find("ik/Right/MenuSmall"), arg_97_0.room:isPersonalRoom() and not arg_97_0.performanceInfo)
			setActive(arg_97_0.uiContainer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_97_0.uiContainer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_97_0.apartment:getConfig("name")))
		end,
		stocking = function()
			arg_97_0.stockingView:Show()
		end
	})
	arg_97_0:ActiveStateCamera(arg_97_0.uiState, function()
		if arg_97_1 then
			arg_97_1()
		elseif arg_97_0.uiState == "base" then
			arg_97_0:CheckQueue()
		end
	end)
end

function var_0_0.EnterWatchMode(arg_108_0)
	local var_108_0 = arg_108_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_109_0)
			arg_108_0:emit(arg_108_0.SHOW_BLOCK)
			arg_108_0:SetBlackboardValue(arg_108_0.ladyDict[var_108_0], "inWatchMode", true)
			arg_108_0:SetUI(arg_109_0, "watch")
		end,
		function(arg_110_0)
			arg_108_0:emit(arg_108_0.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_111_0)
	local var_111_0 = arg_111_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_112_0)
			arg_111_0:emit(arg_111_0.SHOW_BLOCK)
			arg_111_0:SetUI(arg_112_0, "back")
		end,
		function(arg_113_0)
			arg_111_0:SetBlackboardValue(arg_111_0.ladyDict[var_111_0], "inWatchMode", false)
			arg_111_0:emit(arg_111_0.HIDE_BLOCK)
			arg_111_0:CheckQueue()
		end
	})
end

function var_0_0.SetInPending(arg_114_0, arg_114_1, arg_114_2)
	local var_114_0 = arg_114_0:GetBlackboardValue(arg_114_1, "groupId")
	local var_114_1 = pg.dorm3d_welcome[arg_114_2]

	arg_114_0:SetBlackboardValue(arg_114_1, "inPending", true)
	arg_114_0:ChangeCanWatchState(arg_114_1)
	arg_114_0:EnableHeadIK(arg_114_1, false)

	arg_114_0.contextData.ladyZone[var_114_0] = var_114_1.area

	arg_114_1:SetZone(arg_114_0.contextData.ladyZone[var_114_0], var_114_1.welcome_staypoint)
	arg_114_0:ChangeCharacterPosition(arg_114_1)

	if var_114_1.item_shield ~= "" then
		arg_114_0.hideItemDic = {}

		for iter_114_0, iter_114_1 in ipairs(var_114_1.item_shield) do
			local var_114_2 = arg_114_0.modelRoot:Find(iter_114_1)

			if not var_114_2 then
				warning(string.format("welcome:%d without hide item:%s", arg_114_2, iter_114_1))
			else
				arg_114_0.hideItemDic[iter_114_1] = isActive(var_114_2)

				setActive(var_114_2, false)
			end
		end
	end

	onNextTick(function()
		if arg_114_1.tfPendintItem then
			setActive(arg_114_1.tfPendintItem, true)
		end

		arg_114_0:SwitchAnim(arg_114_1, var_114_1.welcome_idle)
	end)

	arg_114_0.wakeUpTalkId = var_114_1.welcome_talk
end

function var_0_0.SetOutPending(arg_116_0, arg_116_1)
	arg_116_0:SetBlackboardValue(arg_116_1, "inPending", false)
	arg_116_0:ChangeCanWatchState(arg_116_1)
	arg_116_0:EnableHeadIK(arg_116_1, true)

	arg_116_0.wakeUpTalkId = nil

	if arg_116_1.tfPendintItem then
		setActive(arg_116_1.tfPendintItem, false)
	end

	if arg_116_0.hideItemDic then
		for iter_116_0, iter_116_1 in pairs(arg_116_0.hideItemDic) do
			setActive(arg_116_0.modelRoot:Find(iter_116_0), iter_116_1)
		end

		arg_116_0.hideItemDic = nil
	end
end

function var_0_0.IsModeInHidePending(arg_117_0, arg_117_1)
	for iter_117_0, iter_117_1 in pairs(arg_117_0.ladyDict) do
		if iter_117_1.hideItemDic and iter_117_1.hideItemDic[arg_117_1] ~= nil then
			return true
		end
	end

	return false
end

function var_0_0.EnterAccompanyMode(arg_118_0, arg_118_1)
	local var_118_0 = pg.dorm3d_accompany[arg_118_1]
	local var_118_1
	local var_118_2

	if var_118_0.sceneInfo ~= "" then
		var_118_1, var_118_2 = unpack(string.split(var_118_0.sceneInfo, "|"))
	end

	local var_118_3 = {
		type = "timeline",
		name = var_118_0.timeline,
		scene = var_118_1,
		sceneRoot = var_118_2,
		accompanys = {}
	}

	for iter_118_0, iter_118_1 in ipairs(var_118_0.jump_trigger) do
		local var_118_4, var_118_5 = unpack(iter_118_1)

		var_118_3.accompanys[var_118_4] = var_118_5
	end

	local var_118_6, var_118_7 = unpack(var_118_0.favor)

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = 161,
			ship_id = arg_118_0.apartment:GetConfigID()
		}
	})
	getProxy(ApartmentProxy):RecordAccompanyTime()
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(1, var_118_0.ship_id, var_118_0.performance_time, 0, var_118_1 or arg_118_0.dormSceneMgr.artSceneInfo))

	local var_118_8 = {}

	table.insert(var_118_8, function(arg_119_0)
		arg_118_0:SetUI(arg_119_0, "blank", "accompany")
	end)
	table.insert(var_118_8, function(arg_120_0)
		arg_118_0.accompanyFavorCount = 0
		arg_118_0.accompanyFavorTimer = Timer.New(function()
			arg_118_0.accompanyFavorCount = arg_118_0.accompanyFavorCount + 1
		end, var_118_6, -1)

		arg_118_0.accompanyFavorTimer:Start()

		arg_118_0.accompanyPerformanceTimer = Timer.New(function()
			arg_118_0.canTriggerAccompanyPerformance = true
		end, var_118_0.performance_time, -1)

		arg_118_0.accompanyPerformanceTimer:Start()
		arg_118_0:PlayTimeline(var_118_3, function(arg_123_0, arg_123_1)
			arg_123_1()
			arg_120_0()
		end)
	end)
	seriesAsync(var_118_8, function()
		assert(arg_118_0.accompanyFavorTimer)
		arg_118_0.accompanyFavorTimer:Stop()

		arg_118_0.accompanyFavorTimer = nil

		assert(arg_118_0.accompanyPerformanceTimer)
		arg_118_0.accompanyPerformanceTimer:Stop()

		arg_118_0.accompanyPerformanceTimer = nil
		arg_118_0.canTriggerAccompanyPerformance = nil

		local var_124_0 = math.min(arg_118_0.accompanyFavorCount, getProxy(ApartmentProxy):getStamina())

		if var_124_0 > 0 then
			local var_124_1 = var_118_7[var_124_0]

			warning(var_124_1)
			arg_118_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_118_0.apartment.configId, var_124_1)
		end

		local var_124_2 = 0
		local var_124_3 = getProxy(ApartmentProxy):GetAccompanyTime()

		if var_124_3 then
			var_124_2 = pg.TimeMgr.GetInstance():GetServerTime() - var_124_3
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(2, var_118_0.ship_id, var_118_0.performance_time, var_124_2, var_118_1 or arg_118_0.dormSceneMgr.artSceneInfo))
		arg_118_0:SetUI(nil, "back", "back")
	end)
end

function var_0_0.ExitAccompanyMode(arg_125_0)
	existCall(arg_125_0.timelineFinishCall)
end

function var_0_0.EnterTouchPerformance(arg_126_0)
	local var_126_0 = arg_126_0:GetCurrentLadyEnv()
	local var_126_1 = arg_126_0.room:getApartmentZoneConfig(var_126_0.ladyBaseZone, "touch_performance", arg_126_0.apartment:GetConfigID())

	if not var_126_1 or var_126_1 == 0 then
		arg_126_0:EnterTouchMode()
	else
		arg_126_0:DoTalk(var_126_1)
	end
end

function var_0_0.EnterTouchMode(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_0:GetCurrentLadyEnv()

	if arg_127_0:GetBlackboardValue(var_127_0, "inTouching") then
		return
	end

	arg_127_1 = arg_127_1 or arg_127_0.room:getApartmentZoneConfig(var_127_0.ladyBaseZone, "touch_id", arg_127_0.apartment:GetConfigID())
	arg_127_0.touchConfig = pg.dorm3d_touch_data[arg_127_1]

	if not arg_127_0.touchConfig then
		warning("dorm3d_touch_data no config for id:" .. tostring(arg_127_1))

		return
	end

	arg_127_0.inTouchGame = arg_127_0.touchConfig.heartbeat_enable > 0

	setActive(arg_127_0.rtTouchGamePanel, arg_127_0.inTouchGame)

	if arg_127_0.inTouchGame then
		arg_127_0.touchCount = 0
		arg_127_0.touchLevel = 1
		arg_127_0.lastCount = 0
		arg_127_0.topCount = 0

		arg_127_0:UpdateTouchGameDisplay()
		setSlider(arg_127_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_127_0.touchCount >= 200 and 100 or arg_127_0.touchCount % 100)
		quickPlayAnimation(arg_127_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_127_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_127_0.downTimer = Timer.New(function()
			local var_128_0 = pg.dorm3d_set.reduce_interaction.key_value_int

			if arg_127_0.touchLevel > 1 then
				var_128_0 = pg.dorm3d_set.reduce_heartbeat.key_value_int
			end

			arg_127_0:UpdateTouchCount(var_128_0)
		end, 1, -1)

		arg_127_0.downTimer:Start()
	end

	local var_127_1 = {}

	table.insert(var_127_1, function(arg_129_0)
		arg_127_0:SetBlackboardValue(var_127_0, "inTouching", true)
		arg_127_0:emit(arg_127_0.SHOW_BLOCK)
		arg_127_0:SetUI(arg_129_0, "blank")
	end)
	table.insert(var_127_1, function(arg_130_0)
		local var_130_0 = arg_127_0.touchConfig.ik_status[1]

		arg_127_0:SwitchIKConfig(var_127_0, var_130_0)
		setActive(arg_127_0.uiContainer:Find("ik/btn_back"), true)
		arg_127_0:SetIKState(true, arg_130_0)
	end)
	table.insert(var_127_1, function(arg_131_0)
		existCall(arg_131_0)
	end)
	seriesAsync(var_127_1, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_127_0:emit(arg_127_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_133_0)
	local var_133_0 = arg_133_0:GetCurrentLadyEnv()

	if not arg_133_0:GetBlackboardValue(var_133_0, "inTouching") then
		return
	end

	local var_133_1 = {}

	if arg_133_0.inTouchGame then
		table.insert(var_133_1, function(arg_134_0)
			arg_133_0:emit(arg_133_0.SHOW_BLOCK)
			quickPlayAnimation(arg_133_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_134_0, 0.5)
		end)
		table.insert(var_133_1, function(arg_135_0)
			local var_135_0 = 0

			for iter_135_0, iter_135_1 in ipairs(arg_133_0.touchConfig.heartbeat_favor) do
				if iter_135_1[1] > arg_133_0.topCount then
					break
				else
					var_135_0 = iter_135_1[2]
				end
			end

			if var_135_0 > 0 then
				arg_133_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_133_0.apartment.configId, var_135_0)
			end

			arg_133_0.touchCount = nil
			arg_133_0.touchLevel = nil
			arg_133_0.topCount = nil

			if arg_133_0.downTimer then
				arg_133_0.downTimer:Stop()

				arg_133_0.downTimer = nil
			end

			arg_133_0.inTouchGame = false

			setActive(arg_133_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_135_0()
		end)
	else
		table.insert(var_133_1, function(arg_136_0)
			arg_133_0:emit(arg_133_0.SHOW_BLOCK)

			local var_136_0 = arg_133_0.touchConfig.default_favor

			if var_136_0 > 0 then
				arg_133_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_133_0.apartment.configId, var_136_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_136_0()
		end)
	end

	table.insert(var_133_1, function(arg_137_0)
		var_133_0.ikConfig = {
			character_position = var_133_0.ladyBaseZone,
			character_action = arg_133_0.touchConfig.finish_action
		}

		arg_133_0:emit(Dorm3dStockingMgr.ON_EXIT_TOUCH_MODE)
		arg_133_0:SetIKState(false, arg_137_0)
	end)
	table.insert(var_133_1, function(arg_138_0)
		var_133_0.ikConfig = nil
		arg_133_0.blockIK = nil

		arg_133_0:SetUI(arg_138_0, "back")
	end)
	seriesAsync(var_133_1, function()
		arg_133_0:SetBlackboardValue(var_133_0, "inTouching", false)
		arg_133_0:emit(arg_133_0.HIDE_BLOCK)

		arg_133_0.touchConfig = nil

		local var_139_0 = arg_133_0.touchExitCall

		arg_133_0.touchExitCall = nil

		existCall(var_139_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	local var_140_0 = arg_140_0:GetCurrentLadyEnv()

	seriesAsync({
		function(arg_141_0)
			arg_140_0:ChangeArtScene(arg_140_2, arg_141_0)
		end,
		function(arg_142_0)
			arg_140_0:ChangeSubScene(arg_140_2, arg_142_0)
		end,
		function(arg_143_0)
			arg_140_0:emit(arg_140_0.SHOW_BLOCK)

			if arg_140_1 == "back" then
				arg_140_0:SetUI(arg_143_0, "back")
			elseif arg_140_1 == "change" and arg_140_0.uiState ~= "walk" then
				arg_140_0:SetUI(arg_143_0, "walk")
			else
				arg_143_0()
			end
		end
	}, function()
		arg_140_0:emit(arg_140_0.HIDE_BLOCK)
		arg_140_0:SetBlackboardValue(var_140_0, "inWalk", arg_140_1 == "change")
		existCall(arg_140_3)
	end)
end

function var_0_0.EnterWalkMode(arg_145_0)
	local var_145_0 = arg_145_0.apartment:GetConfigID()
	local var_145_1 = arg_145_0.ladyDict[var_145_0]

	seriesAsync({
		function(arg_146_0)
			arg_145_0:emit(arg_145_0.SHOW_BLOCK)
			arg_145_0:HideCharacter(var_145_0)
			arg_145_0:SetBlackboardValue(var_145_1, "inWalk", true)
			arg_145_0:SetUI(arg_146_0, "walk")
		end,
		function(arg_147_0)
			arg_145_0:emit(arg_145_0.HIDE_BLOCK)
			arg_145_0:ChangeArtScene(arg_145_0.walkInfo.scene .. "|" .. arg_145_0.walkInfo.sceneRoot, arg_147_0)
		end,
		function(arg_148_0)
			arg_145_0:LoadSubScene(arg_145_0.walkInfo, arg_148_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_150_0)
	local var_150_0 = arg_150_0.apartment:GetConfigID()
	local var_150_1 = arg_150_0.ladyDict[var_150_0]

	seriesAsync({
		function(arg_151_0)
			arg_150_0:RevertArtScene(arg_150_0.walkLastSceneInfo, arg_151_0)
		end,
		function(arg_152_0)
			arg_150_0:UnloadSubScene(arg_150_0.walkInfo, arg_152_0)
		end,
		function(arg_153_0)
			arg_150_0:emit(arg_150_0.SHOW_BLOCK)
			arg_150_0:SetUI(arg_153_0, "back")
		end
	}, function()
		arg_150_0:emit(arg_150_0.HIDE_BLOCK)
		arg_150_0:RevertCharacter(var_150_0)
		arg_150_0:SetBlackboardValue(var_150_1, "inWalk", false)

		local var_154_0 = arg_150_0.walkExitCall

		arg_150_0.walkExitCall = nil
		arg_150_0.walkLastSceneInfo = nil
		arg_150_0.walkInfo = nil

		existCall(var_154_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_155_0)
	if not arg_155_0.tfCutIn then
		return
	end

	local var_155_0 = arg_155_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_155_0, true)

	local var_155_1 = GetOrAddComponent(var_155_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_155_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_155_1, arg_155_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_155_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_155_0.modelCutIn.player, "Idle")
	setActive(arg_155_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_156_0)
	if not arg_156_0.tfCutIn then
		return
	end

	local var_156_0 = arg_156_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_156_1 = GetOrAddComponent(var_156_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_156_1)
	setActive(var_156_0, false)
	setActive(arg_156_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_157_0, arg_157_1, arg_157_2)
	warning("switchIkstatus", arg_157_2)

	local var_157_0 = pg.dorm3d_ik_status[arg_157_2]

	if var_157_0.skin_id ~= arg_157_1.skinId then
		local var_157_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_157_0.base]
		local var_157_2 = _.detect(var_157_1, function(arg_158_0)
			return pg.dorm3d_ik_status[arg_158_0].skin_id == arg_157_1.skinId
		end)

		assert(var_157_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_157_1.skinId, arg_157_2))

		var_157_0 = pg.dorm3d_ik_status[var_157_2]
	end

	arg_157_1.ikConfig = var_157_0
end

function var_0_0.SetIKState(arg_159_0, arg_159_1, arg_159_2, arg_159_3)
	arg_159_3 = arg_159_3 or {}

	local var_159_0 = arg_159_0:GetCurrentLadyEnv()
	local var_159_1 = {}

	if arg_159_1 then
		table.insert(var_159_1, function(arg_160_0)
			arg_159_0:SetBlackboardValue(var_159_0, "inIK", true)
			arg_159_0:emit(arg_159_0.SHOW_BLOCK)

			local var_160_0 = var_159_0.ikConfig.camera_group

			setActive(arg_159_0.uiContainer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_160_0] > 1)
			setActive(arg_159_0.ikControlUI, true)
			arg_160_0()
		end)

		if arg_159_0.uiState ~= "ik" then
			table.insert(var_159_1, function(arg_161_0)
				arg_159_0:SetUI(arg_161_0, "ik")
			end)
		end

		table.insert(var_159_1, function(arg_162_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_159_0:SetIKStatus(var_159_0, var_159_0.ikConfig, arg_162_0, arg_159_3)
		end)
		table.insert(var_159_1, function(arg_163_0)
			arg_159_0:emit(arg_159_0.HIDE_BLOCK)
			arg_163_0()
		end)
	else
		assert(arg_159_0.uiState == "ik")
		table.insert(var_159_1, function(arg_164_0)
			setActive(arg_159_0.ikControlUI, false)
			arg_159_0:emit(arg_159_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_164_0()
		end)
		table.insert(var_159_1, function(arg_165_0)
			arg_159_0:ExitIKStatus(var_159_0, var_159_0.ikConfig, arg_165_0, arg_159_3)
			arg_159_0:ResetSceneItemAnimators()
		end)
		table.insert(var_159_1, function(arg_166_0)
			arg_159_0:SetUI(arg_166_0, "back")
		end)
		table.insert(var_159_1, function(arg_167_0)
			arg_159_0:SetBlackboardValue(var_159_0, "inIK", false)
			arg_159_0:emit(arg_159_0.HIDE_BLOCK)
			arg_167_0()
		end)
	end

	seriesAsync(var_159_1, arg_159_2)
end

function var_0_0.TouchModeAction(arg_168_0, arg_168_1, arg_168_2, arg_168_3, ...)
	return switch(arg_168_3, {
		function(arg_169_0, arg_169_1)
			return function(arg_170_0)
				seriesAsync({
					function(arg_171_0)
						if not arg_169_1 or arg_169_1 == "" then
							return arg_171_0()
						end

						arg_168_0:PlaySingleAction(arg_168_1, arg_169_1, arg_171_0)
					end,
					function(arg_172_0)
						arg_168_0:SwitchIKConfig(arg_168_1, arg_169_0)
						arg_168_0:SetIKState(true, arg_172_0)
					end,
					arg_170_0
				})
			end
		end,
		function()
			return function()
				if arg_168_0.ikSpecialCall then
					local var_174_0 = arg_168_0.ikSpecialCall

					arg_168_0.ikSpecialCall = nil

					existCall(var_174_0)
				else
					arg_168_0:ExitTouchMode()
				end
			end
		end,
		function(arg_175_0, arg_175_1)
			return function(arg_176_0)
				arg_168_0:PlaySingleAction(arg_168_1, arg_175_1, arg_176_0)
			end
		end,
		function(arg_177_0, arg_177_1, arg_177_2)
			return function(arg_178_0)
				seriesAsync({
					function(arg_179_0)
						arg_168_0:DoTalk(arg_177_1, arg_179_0)
					end,
					function(arg_180_0)
						if not arg_177_2 or arg_177_2 == 0 then
							return arg_180_0()
						end

						arg_168_0:SwitchIKConfig(arg_168_1, arg_177_2)
						arg_168_0:SetIKState(true, arg_180_0)
					end,
					arg_178_0
				})
			end
		end,
		function(arg_181_0, arg_181_1, arg_181_2, arg_181_3)
			return function(arg_182_0)
				arg_168_0:PlaySceneItemAnim(arg_181_2, arg_181_3)
				arg_168_0:PlaySingleAction(arg_181_1, arg_182_0)
			end
		end,
		function(arg_183_0)
			return function(arg_184_0)
				local var_184_0 = pg.dorm3d_ik_touch[arg_168_2]

				if #var_184_0.scene_item == 0 then
					return
				end

				local var_184_1 = arg_168_0:GetSceneItem(var_184_0.scene_item)

				if not var_184_1 then
					warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_168_2, var_184_0.scene_item))

					return
				end

				local var_184_2 = var_184_1:Find(arg_183_0)

				if not IsNil(var_184_2) then
					setActive(var_184_2, false)
					setActive(var_184_2, true)
				end

				arg_184_0()
			end
		end,
		function(arg_185_0)
			local var_185_0 = pg.dorm3d_ik_touch_move[arg_185_0]
			local var_185_1 = var_185_0.target_ik
			local var_185_2 = var_185_0.move_time
			local var_185_3 = var_185_0.ik_point
			local var_185_4 = var_185_0.touch_step

			arg_168_1.IKSettings.forceMove = arg_168_1.IKSettings.forceMove or {}

			local var_185_5 = arg_168_1.IKSettings.forceMove

			var_185_5[var_185_1] = var_185_5[var_185_1] or {}
			var_185_5[var_185_1].count = var_185_5[var_185_1].count or 0

			return function(arg_186_0)
				seriesAsync({
					function(arg_187_0)
						if var_185_5[var_185_1].count >= #var_185_4 then
							return arg_187_0()
						end

						local var_187_0 = Dorm3dIK.New({
							configId = var_185_1
						})
						local var_187_1 = Vector2.New(unpack(var_185_3))
						local var_187_2 = var_185_5[var_185_1].count
						local var_187_3 = var_185_4[var_187_2 + 1] - (var_187_2 == 0 and 0 or var_185_4[var_187_2])

						var_185_5[var_185_1].count = var_187_2 + 1

						pg.IKMgr.GetInstance():ResetIK(var_187_0:GetTriggerBoneName())

						local var_187_4 = arg_168_1.IKSettings.Colliders[var_187_0:GetTriggerBoneName()]
						local var_187_5 = arg_168_0.raycastCamera:WorldToScreenPoint(var_187_4.position)

						pg.IKMgr.GetInstance():PlayIKMove(var_187_5, var_187_0:GetTriggerBoneName(), var_187_1, var_185_4[var_187_2 + 1], var_185_2, function()
							var_185_5[var_185_1].count = 0

							arg_187_0()
						end)
					end,
					arg_186_0
				})
			end
		end,
		function(arg_189_0)
			return function(arg_190_0)
				arg_168_0:emit(Dorm3dStockingMgr.SET_STOCKING_STATUS, arg_189_0)
			end
		end,
		function(arg_191_0, arg_191_1)
			return function()
				local var_192_0 = arg_168_0.apartment:GetConfigID()

				arg_168_0.ikSwitchSkinId = arg_168_0.apartment:GetCurSkinId()

				arg_168_1:SwitchCharacterSkin(var_192_0, arg_191_0)
				arg_168_0:SwitchIKConfig(arg_168_1, arg_191_1)
				arg_168_0:SetIKState(true)
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_195_0, arg_195_1)
	local var_195_0 = arg_195_0:GetCurrentLadyEnv()

	if var_195_0.ikTimelineMode then
		arg_195_0:ExitIKTimelineStatus(var_195_0)

		local var_195_1 = arg_195_1:GetTimelineAction()

		if var_195_1 then
			arg_195_0.nowTimelinePlayer:TriggerEvent(var_195_1)
		end

		return
	end

	if not var_195_0.ikConfig then
		return
	end

	local var_195_2 = arg_195_1:GetControllerPath()
	local var_195_3 = var_195_0.ikActionDict[var_195_2]

	if not var_195_3 then
		return
	end

	arg_195_0.blockIK = true

	arg_195_0:TouchModeAction(var_195_0, arg_195_1:GetConfigID(), unpack(var_195_3))(function()
		arg_195_0:ResetIKTipTimer()

		arg_195_0.blockIK = nil
	end)
end

function var_0_0.OnTouchCharacterBody(arg_197_0, arg_197_1)
	local var_197_0 = arg_197_0:GetCurrentLadyEnv()

	if not var_197_0.ikConfig then
		return
	end

	if type(var_197_0.ikConfig.touch_data) ~= "table" then
		return
	end

	for iter_197_0, iter_197_1 in ipairs(var_197_0.iKTouchDatas) do
		local var_197_1, var_197_2, var_197_3 = unpack(iter_197_1)
		local var_197_4 = pg.dorm3d_ik_touch[var_197_1]

		if var_197_4.body == arg_197_1 then
			local var_197_5 = var_197_4.action_emote

			if #var_197_5 > 0 then
				arg_197_0:PlayFaceAnim(var_197_0, var_197_5)
			end

			local var_197_6 = var_197_4.vibrate

			if type(var_197_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_197_7 = {}
				local var_197_8 = {}
				local var_197_9 = {}

				underscore.each(var_197_6, function(arg_198_0)
					local var_198_0 = arg_198_0[1]

					if PLATFORM == PLATFORM_IPHONEPLAYER then
						var_198_0 = var_198_0 / 1000
					end

					table.insert(var_197_7, var_198_0)
					table.insert(var_197_8, arg_198_0[2])
					table.insert(var_197_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_197_7, var_197_8)
				elseif PLATFORM == PLATFORM_IPHONEPLAYER then
					VibrateMgr.Instance:VibrateWaveform(var_197_7, var_197_8, var_197_9)
				end
			end

			arg_197_0.blockIK = true

			arg_197_0:TouchModeAction(var_197_0, var_197_1, unpack(var_197_3))(function()
				arg_197_0:ResetIKTipTimer()

				arg_197_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_200_0)
	setActive(arg_200_0.rtTouchGamePanel:Find("effect_bg"), arg_200_0.touchLevel == 2)
	setActive(arg_200_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_200_0.touchLevel == 2)

	if arg_200_0.touchLevel == 1 then
		setActive(arg_200_0.uiContainer:Find("ik/btn_back"), true)
		setActive(arg_200_0.uiContainer:Find("ik/btn_back_heartbeat"), false)
		quickPlayAnimation(arg_200_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_200_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_200_0.touchLevel == 2 then
		setActive(arg_200_0.uiContainer:Find("ik/btn_back"), false)
		setActive(arg_200_0.uiContainer:Find("ik/btn_back_heartbeat"), true)
		quickPlayAnimation(arg_200_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_200_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_201_0, arg_201_1)
	if arg_201_0.touchLevel > 1 then
		arg_201_1 = math.min(0, arg_201_1)
	end

	arg_201_0.touchCount = math.clamp(arg_201_0.touchCount + arg_201_1, 0, 100)

	if arg_201_0.sliderLT and LeanTween.isTweening(arg_201_0.sliderLT) then
		LeanTween.cancel(arg_201_0.sliderLT)

		arg_201_0.sliderLT = nil
	end

	setSlider(arg_201_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_201_0.touchCount)

	local var_201_0

	if arg_201_0.touchCount >= 100 then
		var_201_0 = 2
	elseif arg_201_0.touchCount <= 0 then
		var_201_0 = 1
	end

	if var_201_0 and var_201_0 ~= arg_201_0.touchLevel then
		if arg_201_0.blockIK then
			return
		end

		arg_201_0.touchLevel = var_201_0

		local var_201_1 = arg_201_0.touchConfig.ik_status[var_201_0]

		if var_201_1 then
			if var_201_0 > 1 then
				arg_201_0.touchCount = 200
			elseif var_201_0 == 1 then
				arg_201_0.touchCount = 0
			end

			local var_201_2 = arg_201_0:GetCurrentLadyEnv()

			seriesAsync({
				function(arg_202_0)
					arg_201_0:ShowBlackScreen(true, arg_202_0)
				end,
				function(arg_203_0)
					arg_201_0:SwitchIKConfig(var_201_2, var_201_1)
					arg_201_0:SetIKState(true, arg_203_0)

					if var_201_0 > 1 and arg_201_0.touchConfig.heartbeat_enter_anim ~= "" then
						arg_201_0:SwitchAnim(var_201_2, arg_201_0.touchConfig.heartbeat_enter_anim)
					end
				end,
				function(arg_204_0)
					arg_201_0:ShowBlackScreen(false, arg_204_0)
				end
			})
		end

		arg_201_0:UpdateTouchCount(0)
		arg_201_0:UpdateTouchGameDisplay()
	end

	arg_201_0.topCount = math.max(arg_201_0.topCount, arg_201_0.touchCount)
end

function var_0_0.ExitHeartbeatMode(arg_205_0)
	if not arg_205_0.touchLevel or arg_205_0.touchLevel == 1 then
		return
	end

	arg_205_0.touchCount = 0

	arg_205_0:UpdateTouchCount(0)
end

function var_0_0.DoTouch(arg_206_0, arg_206_1, arg_206_2)
	if arg_206_0.inTouchGame then
		switch(arg_206_2, {
			function()
				arg_206_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_206_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_206_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_206_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat_trriger.key_value_int)
			end
		})
	end
end

function var_0_0.DoTalk(arg_211_0, arg_211_1, arg_211_2)
	while rawget(arg_211_0, "class") ~= var_0_0 do
		arg_211_0 = getmetatable(arg_211_0).__index
	end

	if arg_211_0.apartment and arg_211_0:GetBlackboardValue(arg_211_0:GetCurrentLadyEnv(), "inTalking") then
		errorMsg("Talking block:" .. arg_211_1)

		return
	end

	if not arg_211_0.room:isPersonalRoom() then
		local var_211_0 = pg.dorm3d_dialogue_group[arg_211_1].char_id

		if arg_211_0.apartment then
			assert(arg_211_0.apartment:GetConfigID() == var_211_0)
		else
			arg_211_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_211_0))
		end
	end

	local var_211_1 = arg_211_0:GetCurrentLadyEnv()

	if arg_211_1 == 10010 and not arg_211_0.apartment.talkDic[arg_211_1] then
		arg_211_0.firstTimelineTouch = true
		arg_211_0.firstMoveGuide = true
	end

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = arg_211_0.contextData.timeIndex == 1 and 110 or 115,
			ship_id = arg_211_0.apartment:GetConfigID()
		},
		{
			value = 1,
			event_type = 155,
			ship_id = arg_211_0.apartment:GetConfigID()
		}
	})

	local var_211_2 = {}

	if arg_211_0:GetBlackboardValue(var_211_1, "inPending") then
		table.insert(var_211_2, function(arg_212_0)
			arg_211_0:OutOfLazy(arg_211_0.apartment:GetConfigID(), arg_212_0)
		end)
	end

	local var_211_3 = pg.dorm3d_dialogue_group[arg_211_1]
	local var_211_4 = var_211_3.performance_type == 1
	local var_211_5

	table.insert(var_211_2, function(arg_213_0)
		arg_211_0:emit(arg_211_0.SHOW_BLOCK)
		arg_211_0:SetBlackboardValue(var_211_1, var_211_4 and "inPerformance" or "inTalking", true)
		arg_211_0:emit(Dorm3dRoomMediator.DO_TALK, arg_211_1, function(arg_214_0)
			var_211_5 = arg_214_0

			arg_213_0()
		end)
	end)
	table.insert(var_211_2, function(arg_215_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_211_0.apartment.configId, arg_211_0.apartment.level, arg_211_1, var_211_3.type, arg_211_0.room:getZoneConfig(arg_211_0:GetCurrentLadyEnv().ladyBaseZone, "id"), var_211_3.action_type, table.CastToString(var_211_3.trigger_config), arg_211_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_211_0:SetUI(arg_215_0, "blank")
	end)

	if var_211_3.trigger_area and var_211_3.trigger_area ~= "" then
		table.insert(var_211_2, function(arg_216_0)
			arg_211_0:ShiftZone(var_211_3.trigger_area, arg_216_0)
		end)
	end

	if var_211_3.performance_type == 0 then
		table.insert(var_211_2, function(arg_217_0)
			arg_211_0:emit(arg_211_0.HIDE_BLOCK)

			if arg_211_0.contextData.isVideoTalk then
				arg_211_0.videoPlayer:ExecuteAction("Play", var_211_3.story, function()
					onDelayTick(arg_217_0, 0.001)
				end)
			else
				pg.NewStoryMgr.GetInstance():ForceManualPlay(var_211_3.story, function()
					onDelayTick(arg_217_0, 0.001)
				end, true)
			end
		end)
	elseif var_211_3.performance_type == 1 then
		table.insert(var_211_2, function(arg_220_0)
			arg_211_0:emit(arg_211_0.HIDE_BLOCK)
			arg_211_0:PerformanceQueue(var_211_3.story, arg_220_0)
		end)
	else
		assert(false)
	end

	table.insert(var_211_2, function(arg_221_0)
		arg_211_0:emit(arg_211_0.SHOW_BLOCK)
		arg_221_0()
	end)
	table.insert(var_211_2, function(arg_222_0)
		local var_222_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_211_3.story)

		if var_222_0 then
			local var_222_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_222_0, var_222_1))
		end

		if var_211_5 and #var_211_5 > 0 then
			arg_211_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_211_5, arg_222_0)
		else
			arg_222_0()
		end
	end)
	table.insert(var_211_2, function(arg_223_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_211_0:emit(arg_211_0.HIDE_BLOCK)

		if arg_211_0.contextData.isVideoTalk then
			existCall(arg_223_0)
		else
			arg_211_0:SetBlackboardValue(var_211_1, var_211_4 and "inPerformance" or "inTalking", false)
			arg_211_0:SetUI(arg_223_0, "back")
		end
	end)
	seriesAsync(var_211_2, function()
		if arg_211_2 then
			return arg_211_2()
		else
			arg_211_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_225_0, arg_225_1, arg_225_2, arg_225_3)
	local var_225_0 = arg_225_0.rtExtraScreen:Find("TalkTouchOption")
	local var_225_1
	local var_225_2 = var_225_0:Find("content")

	UIItemList.StaticAlign(var_225_2, var_225_2:Find("clickTpl"), #arg_225_1.options, function(arg_226_0, arg_226_1, arg_226_2)
		arg_226_1 = arg_226_1 + 1

		if arg_226_0 == UIItemList.EventUpdate then
			local var_226_0 = arg_225_1.options[arg_226_1]

			setAnchoredPosition(arg_226_2, NewPos(unpack(var_226_0.pos)))
			onButton(arg_225_0, arg_226_2, function()
				var_225_1(var_226_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_226_2, not table.contains(arg_225_2, var_226_0.flag))
		end
	end)
	setActive(var_225_0, true)

	function var_225_1(arg_228_0)
		setActive(var_225_0, false)
		arg_225_3(arg_228_0)
	end
end

function var_0_0.DoTimelineOption(arg_229_0, arg_229_1, arg_229_2)
	local var_229_0 = arg_229_0.rtTimelineScreen:Find("TimelineOption")
	local var_229_1
	local var_229_2 = var_229_0:Find("content")

	UIItemList.StaticAlign(var_229_2, var_229_2:Find("clickTpl"), #arg_229_1, function(arg_230_0, arg_230_1, arg_230_2)
		arg_230_1 = arg_230_1 + 1

		if arg_230_0 == UIItemList.EventUpdate then
			local var_230_0 = arg_229_1[arg_230_1]

			setText(arg_230_2:Find("Text"), HXSet.hxLan(var_230_0.content))
			onButton(arg_229_0, arg_230_2, function()
				var_229_1(arg_230_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_229_0, true)

	function var_229_1(arg_232_0)
		setActive(var_229_0, false)
		arg_229_2(arg_232_0)
	end
end

function var_0_0.DoTimelineTouch(arg_233_0, arg_233_1, arg_233_2)
	local var_233_0 = arg_233_0.rtTimelineScreen:Find("TimelineTouch")
	local var_233_1
	local var_233_2 = var_233_0:Find("content")

	UIItemList.StaticAlign(var_233_2, var_233_2:Find("clickTpl"), #arg_233_1, function(arg_234_0, arg_234_1, arg_234_2)
		arg_234_1 = arg_234_1 + 1

		if arg_234_0 == UIItemList.EventUpdate then
			local var_234_0 = arg_233_1[arg_234_1]

			setAnchoredPosition(arg_234_2, NewPos(unpack(var_234_0.pos)))
			onButton(arg_233_0, arg_234_2, function()
				var_233_1(arg_234_1)
			end, SFX_CONFIRM)

			if arg_233_0.firstTimelineTouch then
				arg_233_0.firstTimelineTouch = nil

				setActive(arg_234_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_233_0, true)

	function var_233_1(arg_236_0)
		setActive(var_233_0, false)
		arg_233_2(arg_236_0)
	end
end

function var_0_0.DoShortWait(arg_237_0, arg_237_1)
	local var_237_0 = arg_237_0.ladyDict[arg_237_1]
	local var_237_1 = getProxy(ApartmentProxy):getApartment(arg_237_1)
	local var_237_2 = arg_237_0.room:getApartmentZoneConfig(var_237_0.ladyBaseZone, "special_action", arg_237_1)
	local var_237_3 = var_237_2 and var_237_2[math.random(#var_237_2)] or nil

	if not var_237_3 then
		return
	end

	arg_237_0:PlaySingleAction(var_237_0, var_237_3)
end

function var_0_0.OutOfLazy(arg_238_0, arg_238_1, arg_238_2)
	local var_238_0 = arg_238_0.ladyDict[arg_238_1]
	local var_238_1 = {}

	if arg_238_0:GetBlackboardValue(var_238_0, "inPending") then
		table.insert(var_238_1, function(arg_239_0)
			arg_238_0.shiftLady = arg_238_1

			arg_238_0:ShiftZone(var_238_0.ladyBaseZone, arg_239_0)
		end)
	end

	seriesAsync(var_238_1, arg_238_2)
end

function var_0_0.OutOfPending(arg_240_0, arg_240_1, arg_240_2)
	assert(arg_240_0.wakeUpTalkId)

	local var_240_0 = arg_240_0.wakeUpTalkId

	seriesAsync({
		function(arg_241_0)
			arg_240_0:SetUI(arg_241_0, "blank")
		end,
		function(arg_242_0)
			arg_240_0.shiftLady = arg_240_1

			local var_242_0 = arg_240_0.ladyDict[arg_240_1]

			arg_240_0:ShiftZone(var_242_0.ladyBaseZone, arg_242_0)
		end,
		function(arg_243_0)
			arg_240_0:DoTalk(var_240_0, arg_243_0)
		end
	}, function()
		arg_240_0:SetUIStore(arg_240_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_245_0, arg_245_1)
	local var_245_0

	if arg_245_0:GetBlackboardValue(arg_245_1, "inPending") then
		var_245_0 = tobool(arg_245_0:GetBlackboardValue(arg_245_1, "inDistance"))
	else
		local var_245_1 = arg_245_0:GetBlackboardValue(arg_245_1, "groupId")

		var_245_0 = tobool(arg_245_0.activeLady[var_245_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_245_1.ladyBlackboard))
	end

	if arg_245_1.blockCanWatch then
		var_245_0 = false
	end

	if (not arg_245_1.nowCanWatchState or arg_245_1.nowCanWatchState ~= var_245_0) and arg_245_1.ladyWatchFloat then
		arg_245_1.nowCanWatchState = var_245_0

		arg_245_0:ShowOrHideCanWatchMark(arg_245_1, arg_245_1.nowCanWatchState)
	end
end

function var_0_0.HandleGameNotification(arg_246_0, arg_246_1, arg_246_2)
	local var_246_0 = arg_246_0:GetCurrentLadyEnv()

	switch(arg_246_1, {
		[Dorm3dMiniGameMediator.OPERATION] = function()
			local var_247_0 = arg_246_2.miniGameId

			switch(arg_246_2.miniGameId, {
				[67] = function()
					if arg_246_2.operationCode == "GAME_HIT_AREA" then
						local var_248_0 = {
							{
								"Face_XYX_1",
								"zhongji"
							},
							{
								"Face_XYX_2",
								"qingji"
							},
							{
								"Face_XYX_3",
								"miss"
							}
						}
						local var_248_1, var_248_2 = unpack(var_248_0[arg_246_2.index])

						arg_246_0:PlayFaceAnim(var_246_0, var_248_1)

						if arg_246_0.tfCutIn then
							quickPlayAnimator(arg_246_0.modelCutIn.lady, var_248_2)
							quickPlayAnimator(arg_246_0.modelCutIn.player, var_248_2)
						end
					elseif arg_246_2.operationCode == "GAME_RESULT" then
						if arg_246_2.win then
							arg_246_0:PlayFaceAnim(var_246_0, "Face_XYX_victory")
							arg_246_0:PlaySingleAction(var_246_0, "minigame_win")
						else
							arg_246_0:PlayFaceAnim(var_246_0, "Face_XYX_lose")
							arg_246_0:PlaySingleAction(var_246_0, "minigame_lose")
						end

						setActive(arg_246_0.rtExtraScreen:Find("MiniGameCutIn"), false)
					end
				end,
				[70] = function()
					if arg_246_2.operationCode == "GAME_READY" then
						arg_246_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_246_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil

						arg_246_0:PlaySingleAction(var_246_0, "shuohua_sikao")
					elseif arg_246_2.operationCode == "ROUND_RESULT" then
						local var_249_0

						if arg_246_2.success then
							var_249_0 = {
								"shuohua_wenhou",
								"shuohua_sikao"
							}
						else
							var_249_0 = {
								"shuohua_yaotou",
								"shuohua_sikao"
							}
						end

						seriesAsync(underscore.map(var_249_0, function(arg_250_0)
							return function(arg_251_0)
								arg_246_0:PlaySingleAction(var_246_0, arg_250_0, arg_251_0)
							end
						end), function()
							return
						end)
					elseif arg_246_2.operationCode == "GAME_RESULT" then
						local var_249_1 = arg_246_0.cameras[var_0_0.CAMERA.TALK].transform

						var_249_1.position = var_249_1.position + var_249_1.right * 0.11

						local var_249_2 = {
							"shuohua_gandong"
						}

						seriesAsync(underscore.map(var_249_2, function(arg_253_0)
							return function(arg_254_0)
								arg_246_0:PlaySingleAction(var_246_0, arg_253_0, arg_254_0)
							end
						end), function()
							return
						end)
					end
				end,
				[75] = function()
					if arg_246_2.operationCode == "BEFORE_OPEN_GAME" then
						arg_246_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_246_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil
					elseif arg_246_2.operationCode == "GAME_RPS_RESULT" then
						if arg_246_2.index == 1 then
							arg_246_0:PlaySingleAction(var_246_0, "ab_shuohua_lianxuyaotou_01")
							arg_246_0:PlayFaceAnim(var_246_0, "Face_weixiao")
						elseif arg_246_2.index == 2 then
							arg_246_0:PlaySingleAction(var_246_0, "ab_shuohua_lianxudiantou_01")
							arg_246_0:PlayFaceAnim(var_246_0, "Face_kaixin")
						end
					elseif arg_246_2.operationCode == "GAME_RESULT" then
						if not arg_246_2.win then
							arg_246_0:PlaySingleAction(var_246_0, "ab_shuohua_taibangle_01")
						end

						arg_246_0:PlayFaceAnim(var_246_0, "Face_kaixin")
					end
				end
			}, function()
				warning("without miniGameId:" .. arg_246_2.miniGameId)
			end)

			if arg_246_2.operationCode == "BEFORE_OPEN_GAME" then
				local var_247_1 = getProxy(PlayerProxy):getPlayerId()
				local var_247_2 = 0

				if var_247_0 == 67 or var_247_0 == 70 then
					var_247_2 = PlayerPrefs.GetInt("mg_new_score_" .. tostring(var_247_1) .. "_" .. arg_246_2.miniGameId, 0)
				else
					var_247_2 = PlayerPrefs.GetInt("mg_score_" .. tostring(var_247_1) .. "_" .. arg_246_2.miniGameId, 0)
				end

				arg_246_0.highScore = var_247_2
			elseif arg_246_2.operationCode == "GAME_RESULT" then
				local var_247_3 = arg_246_2.score
				local var_247_4 = getProxy(PlayerProxy):getPlayerId()

				if var_247_3 > arg_246_0.highScore then
					if var_247_0 == 67 or var_247_0 == 70 then
						PlayerPrefs.SetInt("mg_new_score_" .. tostring(var_247_4) .. "_" .. arg_246_2.miniGameId, var_247_3)
					end

					getProxy(Dorm3dChatProxy):TriggerEvent({
						{
							event_type = 159,
							value = var_247_3,
							ship_id = arg_246_0.apartment:GetConfigID()
						}
					})
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_246_2.score))
			elseif arg_246_2.operationCode == "GAME_CLOSE" and arg_246_2.doTrack == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_258_0, arg_258_1, arg_258_2)
	local var_258_0, var_258_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_258_1)
	end)

	if not var_258_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_258_1)
		existCall(arg_258_2)

		return
	end

	warning(arg_258_1)

	arg_258_0.performanceInfo = {
		name = arg_258_1
	}

	local var_258_2 = {}

	table.insert(var_258_2, function(arg_260_0)
		arg_258_0:SetUI(arg_260_0, "blank")
	end)
	table.insertto(var_258_2, underscore.map(var_258_1, function(arg_261_0)
		return switch(arg_261_0.type, {
			function()
				return function(arg_263_0)
					local var_263_0 = unpack(arg_261_0.params)

					arg_258_0:DoTalk(var_263_0, arg_263_0, true)
				end
			end,
			function()
				return function(arg_265_0)
					arg_258_0.touchExitCall = arg_265_0

					arg_258_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_267_0)
					local var_267_0 = arg_258_0:GetCurrentLadyEnv()

					arg_258_0:PlaySingleAction(var_267_0, arg_261_0.name, arg_267_0)
				end
			end,
			function()
				return function(arg_269_0)
					arg_258_0:emit(arg_258_0.PLAY_EXPRESSION, arg_261_0)
					arg_269_0()
				end
			end,
			function()
				return function(arg_271_0)
					arg_258_0:ShiftZone(arg_261_0.name, arg_271_0)
				end
			end,
			function()
				return function(arg_273_0)
					arg_258_0.contextData.timeIndex = arg_261_0.params[1]

					local var_273_0 = arg_261_0.params[2] or false

					if Dorm3dSceneMgr.IsSameSceneInfo(arg_258_0.dormSceneMgr.artSceneInfo, arg_258_0.dormSceneMgr.sceneInfo) then
						arg_258_0:SwitchDayNight(arg_258_0.contextData.timeIndex)

						if var_273_0 then
							onNextTick(function()
								arg_258_0:RefreshSlots()
							end)
						end
					end

					arg_258_0:UpdateContactState()
					onNextTick(arg_273_0)
				end
			end,
			function()
				return function(arg_276_0)
					if arg_261_0.name then
						arg_258_0:ActiveCameraByName(arg_261_0.name)
						existCall(arg_276_0)
					else
						arg_258_0:ActiveStateCamera(arg_261_0.params[1], arg_276_0)
					end
				end
			end,
			function()
				return function(arg_278_0)
					if arg_261_0.name == "base" then
						arg_258_0:RevertArtScene(arg_258_0.dormSceneMgr.sceneInfo, arg_278_0)
					else
						local var_278_0 = arg_261_0.params.scene
						local var_278_1 = arg_261_0.params.sceneRoot

						arg_258_0:ChangeArtScene(var_278_0 .. "|" .. var_278_1, arg_278_0)
					end
				end
			end,
			function()
				return function(arg_280_0)
					local var_280_0 = arg_261_0.params.name

					if arg_261_0.name == "load" then
						local var_280_1 = tobool(arg_261_0.params.wait_timeline) and function(arg_281_0)
							arg_258_0.waitForTimeline = arg_281_0
						end

						arg_258_0:LoadTimelineScene(var_280_0, true, var_280_1, arg_280_0)
					elseif arg_261_0.name == "unload" then
						arg_258_0:UnloadTimelineScene(var_280_0, true, arg_280_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_283_0)
					setActive(arg_258_0.uiContainer:Find("walk/btn_back"), false)

					local var_283_0 = arg_258_0:GetCurrentLadyEnv()

					if arg_261_0.name == "change" then
						local var_283_1 = arg_261_0.params.scene
						local var_283_2 = arg_261_0.params.sceneRoot

						var_283_0.walkBornPoint = arg_261_0.params.point or "Default"

						arg_258_0:ChangeWalkScene(arg_261_0.name, var_283_1 .. "|" .. var_283_2, arg_283_0)
					elseif arg_261_0.name == "back" then
						var_283_0.walkBornPoint = nil

						arg_258_0:ChangeWalkScene(arg_261_0.name, arg_258_0.dormSceneMgr.sceneInfo, arg_283_0)
					elseif arg_261_0.name == "set" then
						local function var_283_3()
							local var_284_0 = arg_283_0

							arg_283_0 = nil

							return existCall(var_284_0)
						end

						for iter_283_0, iter_283_1 in pairs(arg_261_0.params) do
							switch(iter_283_0, {
								back_button_trigger = function(arg_285_0)
									onButton(arg_258_0, arg_258_0.uiContainer:Find("walk/btn_back"), var_283_3, SFX_DORM_BACK)
									setActive(arg_258_0.uiContainer:Find("walk/btn_back"), IsUnityEditor and arg_285_0)
								end,
								near_trigger = function(arg_286_0)
									if arg_286_0 == true then
										arg_286_0 = 1.5
									end

									if arg_286_0 then
										function arg_258_0.walkNearCallback(arg_287_0)
											if arg_287_0 < arg_286_0 then
												arg_258_0.walkNearCallback = nil

												var_283_3()
											end
										end
									else
										arg_258_0.walkNearCallback = nil
									end
								end
							}, nil, iter_283_1)
						end

						if arg_258_0.firstMoveGuide then
							setActive(arg_258_0.povLayer:Find("Guide"), arg_258_0.firstMoveGuide)

							arg_258_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_289_0)
					if arg_261_0.name == "set" then
						local var_289_0 = arg_258_0:GetCurrentLadyEnv()

						arg_258_0:SwitchIKConfig(var_289_0, arg_261_0.params.state)
						setActive(arg_258_0.uiContainer:Find("ik/btn_back"), not arg_261_0.params.hide_back)

						arg_258_0.ikSpecialCall = arg_289_0

						arg_258_0:SetIKState(true)
					elseif arg_261_0.name == "back" then
						local var_289_1 = arg_258_0:GetCurrentLadyEnv()

						var_289_1.ikConfig = arg_261_0.params

						arg_258_0:SetIKState(false, function()
							var_289_1.ikConfig = nil

							existCall(arg_289_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_292_0)
					arg_258_0.blackSceneInfo = setmetatable(arg_261_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_261_0.name == "show" and 0 or 0.5
						}
					})

					if arg_261_0.name == "show" then
						arg_258_0:ShowBlackScreen(true, arg_292_0)
					elseif arg_261_0.name == "hide" then
						arg_258_0:ShowBlackScreen(false, arg_292_0)
					else
						assert(false)
					end

					arg_258_0.blackSceneInfo = nil
				end
			end,
			function()
				return function(arg_294_0)
					local var_294_0 = arg_258_0:GetCurrentLadyEnv()

					if arg_261_0.name == "set" then
						arg_258_0:emit(Dorm3dStockingMgr.SET_STOCKING_STATUS, arg_261_0.params)
					elseif arg_261_0.name == "exit" then
						arg_258_0:emit(Dorm3dStockingMgr.EXIT_STOCKING_STATUS)
					end
				end
			end
		})
	end))
	table.insert(var_258_2, function(arg_295_0)
		arg_258_0:SetUI(arg_295_0, "back")

		arg_258_0.performanceInfo = nil
	end)
	seriesAsync(var_258_2, arg_258_2)
end

function var_0_0.TriggerContact(arg_296_0, arg_296_1)
	arg_296_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_296_1,
		roomId = arg_296_0.room:GetConfigID(),
		groupId = arg_296_0.room:isPersonalRoom() and arg_296_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_297_0)
	arg_297_0:SetContactStateDic(arg_297_0.room:getTriggerableCollectItemDic(arg_297_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_298_0)
	local var_298_0, var_298_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_298_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_298_0, var_298_1))
	setActive(arg_298_0.rtStaminaDisplay, false)

	if arg_298_0.apartment then
		setText(arg_298_0.rtFavorLevel:Find("rank/Text"), arg_298_0.apartment.level)

		local var_298_2, var_298_3 = arg_298_0.apartment:getFavor()
		local var_298_4 = arg_298_0.apartment:isMaxFavor()

		setActive(arg_298_0.rtFavorLevel:Find("Max"), var_298_4)
		setActive(arg_298_0.rtFavorLevel:Find("Text"), not var_298_4)
		setText(arg_298_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_298_2, var_298_3))
	end

	setActive(arg_298_0.rtFavorLevel:Find("red"), Dorm3dLevelLayer.IsShowRed())
end

function var_0_0.UpdateBtnState(arg_299_0)
	local var_299_0 = not arg_299_0.room:isPersonalRoom() or arg_299_0:CheckSystemOpen("Furniture")
	local var_299_1 = Dorm3dFurniture.IsTimelimitShopTip(arg_299_0.room:GetConfigID())

	setActive(arg_299_0.uiContainer:Find("base/left/btn_furniture/tipTimelimit"), var_299_0 and var_299_1)

	local var_299_2 = Dorm3dFurniture.NeedViewTip(arg_299_0.room:GetConfigID())

	setActive(arg_299_0.uiContainer:Find("base/left/btn_furniture/tip"), var_299_0 and not var_299_1 and var_299_2)
	setActive(arg_299_0.uiContainer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_300_0)
		return tobool(arg_300_0)
	end):any(function(arg_301_0)
		return #arg_301_0:getSpecialTalking() > 0 or arg_301_0:getIconTip() == "main"
	end):value())
	setActive(arg_299_0.uiContainer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_302_0, arg_302_1)
	table.insert(arg_302_0.unlockList, arg_302_1)

	if not isActive(arg_302_0.rtFavorUp) then
		setText(arg_302_0.rtFavorUp:Find("Text"), table.remove(arg_302_0.unlockList, 1))
		setActive(arg_302_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_303_0, arg_303_1)
	local var_303_0 = arg_303_1.triggerId
	local var_303_1 = arg_303_1.delta
	local var_303_2 = arg_303_1.cost
	local var_303_3 = arg_303_1.apartment
	local var_303_4 = pg.dorm3d_favor_trigger[var_303_0]

	if var_303_4.is_repeat == 0 then
		if var_303_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_303_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_303_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_303_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_303_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_303_0))
		end
	elseif arg_303_1.delta > 0 then
		local var_303_5, var_303_6 = var_303_3:getFavor()
		local var_303_7 = var_303_5 + var_303_1

		setText(arg_303_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=48>+%d</size>", math.min(9999, var_303_1)))
		setSlider(arg_303_0.rtFavorUpDaily:Find("bg/slider"), 0, var_303_6, var_303_5)
		setAnchoredPosition(arg_303_0.rtFavorUpDaily:Find("bg"), arg_303_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_303_8 = {}
		local var_303_9 = arg_303_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_303_9, function(arg_304_0)
			setActive(arg_304_0, false)
		end)

		local var_303_10

		if var_303_4.effect and var_303_4.effect ~= "" then
			var_303_10 = var_303_9:Find(var_303_4.effect .. "(Clone)")

			if not var_303_10 then
				table.insert(var_303_8, function(arg_305_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_306_0)
						setParent(arg_306_0, var_303_9)

						var_303_10 = tf(arg_306_0)

						arg_305_0()
					end)
				end)
			else
				setActive(var_303_10, true)
			end
		end

		local var_303_11 = arg_303_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_303_11:SetTriggerEvent(function(arg_307_0)
			local var_307_0 = GetComponent(arg_303_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_303_5, var_303_7, 0.5):setOnUpdate(System.Action_float(function(arg_308_0)
				var_307_0.value = arg_308_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_303_0.exited then
						return
					end

					quickPlayAnimator(arg_303_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_303_11:SetEndEvent(function(arg_311_0)
			setActive(arg_303_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_303_8, function()
			local var_312_0 = arg_303_0.ladyDict[var_303_3:GetConfigID()]

			setLocalPosition(arg_303_0.rtFavorUpDaily, arg_303_0:GetLocalPosition(arg_303_0:GetScreenPosition(var_312_0.ladyHeadCenter.position), arg_303_0.rtFavorUpDaily.parent))
			setActive(arg_303_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_303_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_303_0.rtFavorUpDaily, "favor_open")

			if var_303_2 > 0 then
				local var_312_1, var_312_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_303_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_303_2)
				setText(arg_303_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_312_1 + var_303_2, var_312_2))
				setActive(arg_303_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_313_0, arg_313_1, arg_313_2, arg_313_3)
	arg_313_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_313_0.isLock = false
	end))

	local var_313_0 = math.floor(arg_313_1.level / 10)
	local var_313_1 = math.fmod(arg_313_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_313_1, arg_313_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_313_0, arg_313_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_313_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_313_0 > 0)

	local var_313_2
	local var_313_3

	arg_313_0.clientAward, var_313_3 = Dorm3dIconHelper.SplitStory(arg_313_1:getFavorConfig("levelup_client_item", arg_313_1.level))
	arg_313_0.serverAward = arg_313_2

	local var_313_4 = arg_313_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_313_0.levelItemList then
		arg_313_0.levelItemList = UIItemList.New(var_313_4, var_313_4:Find("tpl"))

		arg_313_0.levelItemList:make(function(arg_315_0, arg_315_1, arg_315_2)
			local var_315_0 = arg_315_1 + 1

			if arg_315_0 == UIItemList.EventUpdate then
				if arg_315_1 < #arg_313_0.serverAward then
					updateDorm3dIcon(arg_315_2, arg_313_0.serverAward[var_315_0])
					onButton(arg_313_0, arg_315_2, function()
						arg_313_0:emit(BaseUI.ON_NEW_DROP, {
							style = "dorm",
							drop = arg_313_0.serverAward[var_315_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_315_2, arg_313_0.clientAward[var_315_0 - #arg_313_0.serverAward])
					onButton(arg_313_0, arg_315_2, function()
						arg_313_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_313_0.clientAward[var_315_0 - #arg_313_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_313_0.levelItemList:align(#arg_313_0.serverAward + #arg_313_0.clientAward)
	setActive(arg_313_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	arg_313_0:OverlayPanel(arg_313_0.rtLevelUpWindow)

	function arg_313_0.levelUpCallback()
		arg_313_0.levelUpCallback = nil

		if var_313_3 then
			arg_313_0:PopNewStoryTip(var_313_3)
		end

		existCall(arg_313_3)
	end
end

function var_0_0.PopNewStoryTip(arg_319_0, arg_319_1, arg_319_2)
	local var_319_0 = arg_319_0.uiContainer:Find("base/top/story_tip")

	setActive(var_319_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_319_0, false)
	end))
	setText(var_319_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_319_1[2]].name))
	existCall(arg_319_2)
end

function var_0_0.UpdateZoneList(arg_321_0)
	local var_321_0

	if arg_321_0.room:isPersonalRoom() then
		var_321_0 = arg_321_0:GetCurrentLadyEnv().ladyBaseZone
	else
		var_321_0 = arg_321_0:GetAttachedFurnitureName()
	end

	for iter_321_0, iter_321_1 in ipairs(arg_321_0.zoneDatas) do
		if iter_321_1:GetWatchCameraName() == var_321_0 then
			setText(arg_321_0.btnZone:Find("Text"), iter_321_1:GetName())
			setTextColor(arg_321_0.rtZoneList:GetChild(iter_321_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_321_0.rtZoneList:GetChild(iter_321_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_322_0, arg_322_1)
	local var_322_0 = {}
	local var_322_1 = {}
	local var_322_2 = arg_322_1.data

	if var_322_2.op_list then
		for iter_322_0, iter_322_1 in ipairs(var_322_2.op_list) do
			table.insert(var_322_0, function(arg_323_0)
				local function var_323_0()
					local var_324_0 = arg_323_0

					arg_323_0 = nil

					return existCall(var_324_0)
				end

				switch(iter_322_1.type, {
					action = function()
						local var_325_0 = arg_322_0:GetCurrentLadyEnv()

						arg_322_0:PlaySingleAction(var_325_0, iter_322_1.name, var_323_0)
					end,
					item_action = function()
						arg_322_0:PlaySceneItemAnim(iter_322_1.id, iter_322_1.name)
						var_323_0()
					end,
					extra_item_action = function()
						local var_327_0 = arg_322_0:GetCurrentLadyEnv().extraItems[iter_322_1.name]

						warning(iter_322_1.name)
						warning(var_327_0.trans)

						if var_327_0 then
							var_327_0.trans:GetComponent(typeof(Animator)):PlayInFixedTime(iter_322_1.param)
						end

						var_323_0()
					end,
					timeline = function()
						if arg_322_0.inTouchGame then
							setActive(arg_322_0.rtTouchGamePanel, false)
						end

						arg_322_0:PlayTimeline(iter_322_1, function(arg_329_0, arg_329_1)
							setActive(arg_322_0.rtTouchGamePanel, arg_322_0.inTouchGame)

							var_322_1.notifiCallback = arg_329_1

							var_323_0()
						end)
					end,
					clickOption = function()
						arg_322_0:DoTalkTouchOption(iter_322_1, arg_322_1.flags, function(arg_331_0)
							var_322_1.optionIndex = arg_331_0

							var_323_0()
						end)
					end,
					wait = function()
						arg_322_0.LTs = arg_322_0.LTs or {}

						table.insert(arg_322_0.LTs, LeanTween.delayedCall(iter_322_1.time, System.Action(var_323_0)).uniqueId)
					end,
					expression = function()
						arg_322_0:emit(arg_322_0.PLAY_EXPRESSION, iter_322_1)
						var_323_0()
					end
				}, function()
					assert(false, "op type error:", iter_322_1.type)
				end)

				if iter_322_1.skip then
					var_323_0()
				end
			end)
		end
	end

	seriesAsync(var_322_0, function()
		if arg_322_1.callbackData then
			arg_322_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_322_1.callbackData.name, var_322_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_336_0)
	if arg_336_0.inGuide or arg_336_0.uiState ~= "base" then
		return
	end

	if arg_336_0.room:GetConfigID() == 1 and arg_336_0:CheckGuide() then
		-- block empty
	elseif arg_336_0.room:isPersonalRoom() and arg_336_0:CheckLevelUp() then
		-- block empty
	elseif arg_336_0.apartment and arg_336_0:CheckEnterDeal() then
		-- block empty
	elseif arg_336_0.apartment and arg_336_0:CheckActiveTalk() then
		-- block empty
	elseif arg_336_0.apartment then
		arg_336_0:CheckFavorTrigger()
	end

	arg_336_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_337_0)
	local var_337_0

	if arg_337_0.contextData.specialId then
		var_337_0 = arg_337_0.contextData.specialId
		arg_337_0.contextData.specialId = nil

		arg_337_0:DoTalk(var_337_0, function()
			arg_337_0:closeView()
		end)

		if arg_337_0.contextData.isVideoTalk then
			arg_337_0.contextData.hasEnterCheck = true
		end
	elseif not arg_337_0.contextData.hasEnterCheck and arg_337_0.apartment then
		for iter_337_0, iter_337_1 in ipairs(arg_337_0.apartment:getForceEnterTalking(arg_337_0.room:GetConfigID())) do
			var_337_0 = iter_337_1

			arg_337_0:DoTalk(iter_337_1)

			break
		end
	end

	if var_337_0 and pg.dorm3d_dialogue_group[var_337_0].extend_loading > 0 then
		arg_337_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_337_0:FinishEnterResume()
		end)
	else
		if arg_337_0.apartment and arg_337_0.contextData.pendingDic[arg_337_0.apartment:GetConfigID()] then
			arg_337_0.contextData.hasEnterCheck = true
		end

		for iter_337_2, iter_337_3 in pairs(arg_337_0.contextData.pendingDic) do
			arg_337_0:SetInPending(arg_337_0.ladyDict[iter_337_2], iter_337_3)
		end

		arg_337_0.contextData.pendingDic = {}

		arg_337_0:FinishEnterResume()
		arg_337_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_340_0)
	if arg_340_0:GetBlackboardValue(arg_340_0:GetCurrentLadyEnv(), "inPending") then
		return
	end

	if DORM_LOCK_GUIDE then
		return false
	end

	for iter_340_0, iter_340_1 in ipairs({
		{
			name = "DORM3D_GUIDE_03",
			active = function()
				return true
			end
		},
		{
			name = "DORM3D_GUIDE_04",
			active = function()
				return true
			end
		},
		{
			name = "DORM3D_GUIDE_05",
			active = function()
				return arg_340_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_340_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_340_1.name) and iter_340_1.active() then
			arg_340_0:SetAllBlackbloardValue("inGuide", true)

			local function var_340_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_340_1.name)))
				arg_340_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_340_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_340_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_340_1.name, nil, var_340_0, var_340_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_346_0)
	for iter_346_0, iter_346_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_347_0 = getProxy(CollectionProxy):getShipGroup(arg_346_0.apartment.configId)

				return tobool(var_347_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_348_0 = getProxy(CollectionProxy):getShipGroup(arg_346_0.apartment.configId)

				return var_348_0 and var_348_0.married > 0
			end
		}
	}) do
		if arg_346_0.apartment.triggerCountDic[iter_346_1.triggerId] == 0 and iter_346_1.active() then
			arg_346_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_346_0.apartment.configId, iter_346_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_349_0)
	if arg_349_0.contextData.hasEnterCheck then
		return false
	end

	local var_349_0 = arg_349_0.apartment:GetConfigID()
	local var_349_1 = "dorm3d_enter_count_" .. var_349_0
	local var_349_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_349_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_349_2)
		PlayerPrefs.SetInt(var_349_1, 1)
	else
		PlayerPrefs.SetInt(var_349_1, PlayerPrefs.GetInt(var_349_1, 0) + 1)
	end

	local var_349_3 = arg_349_0.apartment:getEnterTalking(arg_349_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_349_3 > 0 then
		arg_349_0:DoTalk(var_349_3[math.random(#var_349_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_350_0)
	local var_350_0 = arg_350_0:GetCurrentLadyEnv()

	if arg_350_0:GetBlackboardValue(var_350_0, "inPending") then
		return false
	end

	local var_350_1 = arg_350_0.apartment:getZoneTalking(arg_350_0.room:GetConfigID(), var_350_0.ladyBaseZone)

	if #var_350_1 > 0 then
		arg_350_0:DoTalk(var_350_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_351_0, arg_351_1, arg_351_2)
	local var_351_0 = arg_351_0.ladyDict[arg_351_1].ladyBaseZone
	local var_351_1 = getProxy(ApartmentProxy):getApartment(arg_351_1)

	for iter_351_0, iter_351_1 in ipairs(var_351_1:getDistanceTalking(arg_351_0.room:GetConfigID(), var_351_0)) do
		arg_351_0:DoTalk(iter_351_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_352_0, arg_352_1)
	if arg_352_0.room:isPersonalRoom() then
		return switch(arg_352_1, {
			Talk = function()
				local var_353_0 = 1

				return var_353_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_353_0)
			end,
			Touch = function()
				local var_354_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_354_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_354_0)
			end,
			Gift = function()
				local var_355_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_355_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_355_0)
			end,
			PublicGame = function()
				return false
			end,
			Photo = function()
				local var_357_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_357_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_357_0)
			end,
			Collection = function()
				local var_358_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_358_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_358_0)
			end,
			Furniture = function()
				local var_359_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_359_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_359_0)
			end,
			DayNight = function()
				local var_360_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_360_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_360_0)
			end,
			Accompany = function()
				local var_361_0 = 1

				return var_361_0 <= arg_352_0.apartment.level, i18n("apartment_level_unenough", var_361_0)
			end,
			MiniGame = function()
				local var_362_0 = 1

				if var_362_0 > arg_352_0.apartment.level then
					return false, i18n("apartment_level_unenough", var_362_0)
				elseif #arg_352_0.room:getMiniGames() <= 0 then
					return false, "without minigame config in room:" .. arg_352_0.room.configId
				else
					return true
				end
			end,
			Invite = function()
				return false
			end,
			Performance = function()
				return IsUnityEditor
			end
		}, function()
			return true
		end)
	else
		return switch(arg_352_1, {
			Gift = function()
				return false
			end,
			PublicGame = function()
				return true
			end,
			Furniture = function()
				local var_368_0 = #arg_352_0.room:GetFurnitures() > 0
				local var_368_1 = #_.filter(arg_352_0.room:GetFurnitureIDList() or {}, function(arg_369_0)
					return Dorm3dFurniture.New({
						configId = arg_369_0
					}):InShopTime()
				end) > 0

				return var_368_0 or var_368_1
			end,
			DayNight = function()
				return false
			end,
			Accompany = function()
				return false
			end,
			MiniGame = function()
				return false
			end,
			Performance = function()
				return IsUnityEditor
			end
		}, function()
			return true
		end)
	end
end

function var_0_0.CheckLevelUp(arg_375_0)
	if arg_375_0.apartment:canLevelUp() then
		arg_375_0:emit(Dorm3dRoomMediator.FAVOR_LEVEL_UP, arg_375_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetIKHandTF(arg_376_0)
	return arg_376_0.ikHand
end

function var_0_0.CycleIKCameraGroup(arg_377_0)
	local var_377_0 = arg_377_0:GetCurrentLadyEnv()

	assert(arg_377_0:GetBlackboardValue(var_377_0, "inIK"))
	seriesAsync({
		function(arg_378_0)
			pg.IKMgr.GetInstance():ResetActiveIKs()

			local var_378_0 = var_377_0.ikConfig
			local var_378_1 = var_378_0.camera_group
			local var_378_2 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_378_1]
			local var_378_3 = var_378_2[table.indexof(var_378_2, var_378_0.id) % #var_378_2 + 1]

			arg_377_0:SwitchIKConfig(var_377_0, var_378_3)
			arg_377_0:SetIKState(true)
		end
	})
end

function var_0_0.TempHideUI(arg_379_0, arg_379_1, arg_379_2)
	local var_379_0 = defaultValue(arg_379_0.hideCount, 0)

	arg_379_0.hideCount = var_379_0 + (arg_379_1 and 1 or -1)

	assert(arg_379_0.hideCount >= 0)

	if arg_379_0.hideCount * var_379_0 > 0 then
		return existCall(arg_379_2)
	elseif arg_379_0.hideCount > 0 then
		arg_379_0:SetUI(arg_379_2, "blank")
	else
		arg_379_0:SetUI(arg_379_2, "back")
	end
end

function var_0_0.onBackPressed(arg_380_0)
	if arg_380_0.exited or arg_380_0.retainCount > 0 then
		-- block empty
	elseif isActive(arg_380_0.rtLevelUpWindow) then
		triggerButton(arg_380_0.rtLevelUpWindow:Find("bg"))
	elseif arg_380_0.uiState ~= "base" then
		-- block empty
	else
		arg_380_0:closeView()
	end
end

function var_0_0.willExit(arg_381_0)
	if arg_381_0.downTimer then
		arg_381_0.downTimer:Stop()

		arg_381_0.downTimer = nil
	end

	if arg_381_0.LTs then
		underscore.map(arg_381_0.LTs, function(arg_382_0)
			LeanTween.cancel(arg_382_0)
		end)

		arg_381_0.LTs = nil
	end

	if arg_381_0.sliderLT then
		LeanTween.cancel(arg_381_0.sliderLT)

		arg_381_0.sliderLT = nil
	end

	for iter_381_0, iter_381_1 in pairs(arg_381_0.ladyDict) do
		iter_381_1.wakeUpTalkId = nil
	end

	if arg_381_0.accompanyFavorTimer then
		arg_381_0.accompanyFavorTimer:Stop()

		arg_381_0.accompanyFavorTimer = nil
	end

	if arg_381_0.accompanyPerformanceTimer then
		arg_381_0.accompanyPerformanceTimer:Stop()

		arg_381_0.accompanyPerformanceTimer = nil
	end

	arg_381_0.canTriggerAccompanyPerformance = nil

	arg_381_0.videoPlayer:Destroy()
	var_0_0.super.willExit(arg_381_0)
end

return var_0_0
