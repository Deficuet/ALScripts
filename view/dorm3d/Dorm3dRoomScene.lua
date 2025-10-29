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
	arg_4_0.stockingView = Dorm3dStockingView.New(arg_4_0._tf, arg_4_0.event, setmetatable({
		GetTipShowInfo = function()
			return arg_4_0.stockingMgr:GetTipShowInfo()
		end
	}, {
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
		local var_8_0 = {}

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

		local var_10_0, var_10_1 = arg_4_0:CheckSystemOpen("Photo")

		if not var_10_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_10_1)

			return
		end

		if not arg_4_0.apartment then
			local var_10_2 = arg_4_0.contextData.groupIds[1]

			for iter_10_0, iter_10_1 in pairs(arg_4_0.ladyDict) do
				if iter_10_1.ladyBaseZone == arg_4_0:GetAttachedFurnitureName() then
					var_10_2 = iter_10_0

					break
				end
			end

			arg_4_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_10_2))
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
		local var_12_0, var_12_1 = arg_4_0:CheckSystemOpen("Collection")

		if not var_12_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_12_1)

			return
		end

		setActive(var_4_0:Find("left/btn_collection/tip"), false)
		PlayerPrefs.SetInt("apartment_collection_item", 0)
		PlayerPrefs.SetInt("apartment_collection_recall", 0)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_COLLECTION_LAYER, arg_4_0.room:GetConfigID())
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("left/btn_furniture"), function()
		local var_13_0, var_13_1 = arg_4_0:CheckSystemOpen("Furniture")

		if not var_13_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_13_1)

			return
		end

		arg_4_0:RemoveExtraSystem({
			DormConst.EXTRA_SYSTEMS.FurnitureSlide
		})
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_FURNITURE_SELECT, {
			apartment = arg_4_0.apartment
		})
	end, SFX_PANEL)

	if not arg_4_0.room:isPersonalRoom() then
		local var_4_1 = arg_4_0:CheckSystemOpen("Furniture")

		setActive(var_4_0:Find("left/line_furniture"), var_4_1)
		setActive(var_4_0:Find("left/btn_furniture"), var_4_1)
	end

	onButton(arg_4_0, var_4_0:Find("left/btn_accompany"), function()
		local var_14_0, var_14_1 = arg_4_0:CheckSystemOpen("Accompany")

		if not var_14_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_14_1)

			return
		end

		local var_14_2 = arg_4_0.apartment:GetConfigID()
		local var_14_3

		arg_4_0:emit(Dorm3dRoomMediator.OPEN_ACCOMPANY_WINDOW, {
			groupId = var_14_2,
			confirmFunc = function(arg_15_0)
				var_14_3 = arg_15_0
			end
		}, function()
			if var_14_3 then
				arg_4_0:OutOfLazy(var_14_2, function()
					arg_4_0:EnterAccompanyMode(var_14_3)
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
	UIItemList.StaticAlign(arg_4_0.rtZoneList, arg_4_0.rtZoneList:GetChild(0), #arg_4_0.zoneDatas, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_22_1 = arg_22_1 + 1

		local var_22_0 = arg_4_0.zoneDatas[arg_22_1]
		local var_22_1 = var_22_0:GetWatchCameraName()

		arg_22_2.name = var_22_1

		setText(arg_22_2:Find("Name"), var_22_0:GetName())
		setActive(arg_22_2:Find("Line"), arg_22_1 < #arg_4_0.zoneDatas)
		onButton(arg_4_0, arg_22_2, function()
			if arg_4_0.uiState ~= "base" then
				return
			end

			setActive(arg_4_0.rtZoneList, false)

			local var_23_0 = {}

			if arg_4_0.room:isPersonalRoom() and not arg_4_0:GetBlackboardValue(arg_4_0:GetCurrentLadyEnv(), "inPending") then
				table.insert(var_23_0, function(arg_24_0)
					arg_4_0:OutOfLazy(arg_4_0.apartment:GetConfigID(), arg_24_0)
				end)
			end

			table.insert(var_23_0, function(arg_25_0)
				arg_4_0:ShiftZone(var_22_1, arg_25_0)
			end)
			seriesAsync(var_23_0, function()
				arg_4_0:CheckQueue()
			end)
		end, SFX_PANEL)
	end)

	local var_4_2 = arg_4_0.uiContainer:Find("walk")
	local var_4_3 = arg_4_0.uiContainer:Find("ik")

	onButton(arg_4_0, var_4_3:Find("btn_back"), function()
		if arg_4_0.ikSpecialCall then
			local var_27_0 = arg_4_0.ikSpecialCall

			arg_4_0.ikSpecialCall = nil

			existCall(var_27_0)
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
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_SKIN_SELECT_LAYER, arg_4_0.apartment:GetConfigID(), arg_4_0:GetCurrentLadyEnv(), function(arg_34_0, arg_34_1, arg_34_2)
			seriesAsync({
				function(arg_35_0)
					arg_4_0:SetIKState(false, arg_35_0)
				end,
				function(arg_36_0)
					arg_34_0:SwitchCharacterSkin(arg_34_1, arg_34_2)
					arg_4_0:SwitchIKConfig(arg_34_0, arg_34_0.ikConfig.id)
					arg_4_0:SetIKState(true, arg_36_0)
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
	eachChild(arg_4_0.ikHand, function(arg_38_0)
		setActive(arg_38_0, false)
	end)

	arg_4_0.ikTextTipsRoot = var_4_4:Find("TextTips")

	setActive(arg_4_0.ikTextTipsRoot, false)
	eachChild(arg_4_0.ikTextTipsRoot, function(arg_39_0)
		setActive(arg_39_0, false)
	end)

	arg_4_0.ikControlUI = var_4_4

	local var_4_5 = arg_4_0.uiContainer:Find("accompany")

	onButton(arg_4_0, var_4_5:Find("btn_back"), function()
		arg_4_0:ExitAccompanyMode()
	end, SFX_DORM_BACK)

	arg_4_0.unlockList = {}
	arg_4_0.rtFavorUp = arg_4_0._tf:Find("Toast/favor_up")

	arg_4_0.rtFavorUp:GetComponent("DftAniEvent"):SetEndEvent(function(arg_41_0)
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

	var_4_6:SetTriggerEvent(function(arg_42_0)
		local var_42_0, var_42_1 = getProxy(ApartmentProxy):getStamina()

		setText(arg_4_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_42_0, var_42_1))
	end)
	var_4_6:SetEndEvent(function(arg_43_0)
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
		local var_48_0 = arg_4_0:GetCurrentLadyEnv().ladyBaseZone
		local var_48_1 = arg_4_0.apartment:getFurnitureTalking(arg_4_0.room:GetConfigID(), var_48_0)

		if #var_48_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without topic")

			return
		end

		arg_4_0:DoTalk(var_48_1[math.random(#var_48_1)], function()
			local var_49_0 = getDorm3dGameset("drom3d_favir_trigger_talk")[1]

			arg_4_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_4_0.apartment.configId, var_49_0)
		end)
	end, SFX_DORM_CLICK)
	setText(arg_4_0.rtRole:Find("Talk/bg/Text"), i18n("dorm3d_talk"))

	arg_4_0.rtRoleTouchSubView = Dorm3dRTRoleTouchSubView.New(arg_4_0.rtRole:Find("Touch"), arg_4_0.event, setmetatable({
		onClick = function(arg_50_0)
			arg_4_0:EnterTouchMode(arg_50_0)
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

		local var_53_0 = pg.dorm3d_minigame[arg_4_0.nowMiniGameId]
		local var_53_1 = arg_4_0:GetCurrentLadyEnv()

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

		local var_53_2 = {}

		table.insert(var_53_2, function(arg_54_0)
			arg_4_0:SetAllBlackbloardValue("inLockLayer", true)
			arg_4_0:TempHideUI(true, arg_54_0)
		end)

		if var_53_0.area ~= "" and var_53_1.ladyBaseZone ~= var_53_0.area then
			table.insert(var_53_2, function(arg_55_0)
				arg_4_0:ShiftZone(var_53_0.area, arg_55_0)
			end)
		end

		local var_53_3
		local var_53_4

		if var_53_0.action ~= "" then
			var_53_3, var_53_4 = unpack(var_53_0.action)
		end

		table.insert(var_53_2, function(arg_56_0)
			parallelAsync({
				function(arg_57_0)
					if var_53_3 then
						arg_4_0:PlaySingleAction(var_53_1, var_53_3, arg_57_0)
					else
						arg_57_0()
					end
				end,
				function(arg_58_0)
					arg_4_0:ActiveStateCamera("talk", arg_58_0)
				end
			}, arg_56_0)
		end)
		table.insert(var_53_2, function(arg_59_0)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(1))
			arg_4_0:HandleGameNotification(Dorm3dMiniGameMediator.OPERATION, {
				operationCode = "BEFORE_OPEN_GAME",
				miniGameId = arg_4_0.nowMiniGameId
			})
			arg_4_0:EnableMiniGameCutIn()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_MINIGAME_WINDOW, {
				isDorm3d = true,
				minigameId = arg_4_0.nowMiniGameId
			}, arg_59_0)
		end)
		table.insert(var_53_2, function(arg_60_0)
			arg_4_0:DisableMiniGameCutIn()

			if var_53_4 then
				arg_4_0:PlaySingleAction(var_53_1, var_53_4, arg_60_0)
			else
				arg_60_0()
			end
		end)
		seriesAsync(var_53_2, function()
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

	eachChild(var_4_8, function(arg_70_0)
		setActive(arg_70_0, arg_70_0.name == "walk")
	end)

	arg_4_0._joystick = arg_4_0._tf:Find("Stick")

	setActive(arg_4_0._joystick, false)
	arg_4_0._joystick:GetComponent(typeof(SlideController)):SetStickFunc(function(arg_71_0)
		arg_4_0:emit(arg_4_0.ON_STICK_MOVE, arg_71_0)
	end)

	arg_4_0.povLayer = arg_4_0._tf:Find("POVControl")

	setActive(arg_4_0.povLayer, false)
	;(function()
		local var_72_0 = arg_4_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

		var_72_0:AddBeginDragFunc(function(arg_73_0, arg_73_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_BEGIN, arg_73_1)
		end)
		var_72_0:SetStickFunc(function(arg_74_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE, arg_74_0)
		end)
		var_72_0:AddDragEndFunc(function(arg_75_0, arg_75_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_END, arg_75_1)
		end)
		arg_4_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_76_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_VIEW, arg_76_0)
		end)
	end)()

	arg_4_0.ikControlLayer = var_4_4:Find("ControlLayer")

	;(function()
		local var_77_0
		local var_77_1 = arg_4_0.ikControlLayer:GetComponent(typeof(SlideController))

		var_77_1:AddBeginDragFunc(function(arg_78_0, arg_78_1)
			local var_78_0 = arg_4_0:GetCurrentLadyEnv()

			if not var_78_0.IKSettings then
				return
			end

			local var_78_1 = arg_78_1.position
			local var_78_2 = CameraMgr.instance:Raycast(var_78_0.IKSettings.CameraRaycaster, var_78_1):ToTable()

			if #var_78_2 > 0 then
				local var_78_3 = var_78_2[1].gameObject.transform
				local var_78_4 = table.keyof(var_78_0.IKSettings.Colliders, var_78_3)

				warning(var_78_3, var_78_4)

				if var_78_4 then
					arg_4_0:emit(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, var_78_0, var_78_4, var_78_1)

					var_77_0 = tobool(var_78_0.ikHandler)

					return
				end
			end
		end)
		var_77_1:AddDragFunc(function(arg_79_0, arg_79_1)
			local var_79_0 = arg_79_1.position
			local var_79_1 = arg_4_0:GetCurrentLadyEnv()

			if var_79_1.ikHandler then
				arg_4_0:emit(var_0_0.ON_DRAG_CHARACTER_BODY, var_79_1, var_79_0)

				return
			end

			if var_77_0 then
				return
			end

			local var_79_2 = arg_79_1.delta

			arg_4_0:emit(arg_4_0.ON_STICK_MOVE, var_79_2)
		end)
		var_77_1:AddDragEndFunc(function(arg_80_0, arg_80_1)
			var_77_0 = nil

			local var_80_0 = arg_4_0:GetCurrentLadyEnv()

			if var_80_0.ikHandler then
				arg_4_0:emit(var_0_0.ON_RELEASE_CHARACTER_BODY, var_80_0)

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

function var_0_0.BindEvent(arg_82_0)
	var_0_0.super.BindEvent(arg_82_0)
	arg_82_0:bind(arg_82_0.CLICK_CHARACTER, function(arg_83_0, arg_83_1)
		if arg_82_0.uiState ~= "base" or not arg_82_0.ladyDict[arg_83_1].nowCanWatchState then
			return
		end

		local var_83_0 = {}
		local var_83_1 = arg_82_0.ladyDict[arg_83_1]

		if arg_82_0:GetBlackboardValue(var_83_1, "inPending") then
			table.insert(var_83_0, function(arg_84_0)
				arg_82_0:OutOfPending(arg_83_1, arg_84_0)
			end)
		else
			table.insert(var_83_0, function(arg_85_0)
				arg_82_0:OutOfLazy(arg_83_1, arg_85_0)
			end)
		end

		seriesAsync(var_83_0, function()
			if not arg_82_0.room:isPersonalRoom() then
				arg_82_0:SetApartment(getProxy(ApartmentProxy):getApartment(arg_83_1))
			end

			arg_82_0:EnterWatchMode()
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	arg_82_0:bind(arg_82_0.CLICK_CONTACT, function(arg_87_0, arg_87_1)
		arg_82_0:TriggerContact(arg_87_1)
	end)
	arg_82_0:bind(arg_82_0.DISTANCE_TRIGGER, function(arg_88_0, arg_88_1, arg_88_2)
		if arg_82_0.uiState == "base" then
			arg_82_0:CheckDistanceTalk(arg_88_1, arg_88_2)
		end
	end)
	arg_82_0:bind(arg_82_0.WALK_DISTANCE_TRIGGER, function(arg_89_0, arg_89_1, arg_89_2)
		if arg_82_0.apartment and arg_82_0.apartment:GetConfigID() == arg_89_1 then
			existCall(arg_82_0.walkNearCallback, arg_89_2)
		end
	end)
	arg_82_0:bind(arg_82_0.CHANGE_WATCH, function(arg_90_0, arg_90_1)
		arg_82_0:ChangeCanWatchState(arg_82_0.ladyDict[arg_90_1])
	end)
	arg_82_0:bind(arg_82_0.ON_TOUCH_CHARACTER, function(arg_91_0, arg_91_1)
		local var_91_0 = arg_82_0:GetCurrentLadyEnv()

		if not arg_82_0:GetBlackboardValue(var_91_0, "inIK") then
			return
		end

		arg_82_0:OnTouchCharacterBody(arg_91_1)
	end)
	arg_82_0:bind(var_0_0.ON_IK_STATUS_CHANGED, function(arg_92_0, arg_92_1, arg_92_2)
		local var_92_0 = arg_82_0:GetCurrentLadyEnv()

		if not arg_82_0:GetBlackboardValue(var_92_0, "inTouching") then
			return
		end

		arg_82_0:DoTouch(arg_92_1, arg_92_2)
	end)
	arg_82_0:bind(arg_82_0.ON_ENTER_SECTOR, function(arg_93_0, arg_93_1)
		arg_82_0:ChangeCanWatchState(arg_82_0.ladyDict[arg_93_1])
	end)
	arg_82_0:bind(arg_82_0.ON_CHANGE_DISTANCE, function(arg_94_0, arg_94_1, arg_94_2)
		arg_82_0:ChangeCanWatchState(arg_82_0.ladyDict[arg_94_1])
	end)
end

function var_0_0.didEnter(arg_95_0)
	arg_95_0.resumeCallback = arg_95_0.contextData.resumeCallback
	arg_95_0.contextData.resumeCallback = nil

	var_0_0.super.didEnter(arg_95_0)
	arg_95_0:UpdateZoneList()
	arg_95_0:SetUI(function()
		arg_95_0:didEnterCheck()
	end, "base")
end

function var_0_0.FinishEnterResume(arg_97_0)
	if not arg_97_0.resumeCallback then
		return
	end

	local var_97_0 = arg_97_0.resumeCallback

	arg_97_0.resumeCallback = nil

	return var_97_0()
end

function var_0_0.EnableJoystick(arg_98_0, arg_98_1)
	setActive(arg_98_0._joystick, arg_98_1)
end

function var_0_0.EnablePOVLayer(arg_99_0, arg_99_1)
	setActive(arg_99_0.povLayer, arg_99_1)

	if not arg_99_1 then
		arg_99_0:emit(arg_99_0.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUIStore(arg_100_0, arg_100_1, ...)
	table.insertto(arg_100_0.uiStore, {
		...
	})
	existCall(arg_100_1)
end

function var_0_0.SetUI(arg_101_0, arg_101_1, ...)
	warning("SetUI", ...)

	while rawget(arg_101_0, "class") ~= var_0_0 do
		arg_101_0 = getmetatable(arg_101_0).__index
	end

	table.insertto(arg_101_0.uiStore, {
		...
	})

	for iter_101_0, iter_101_1 in ipairs(arg_101_0.uiStore) do
		if iter_101_1 == "back" then
			assert(#arg_101_0.uiStack > 0)

			arg_101_0.uiState = table.remove(arg_101_0.uiStack)
		elseif iter_101_1 == arg_101_0.uiState and iter_101_1 == "ik" then
			-- block empty
		else
			table.insert(arg_101_0.uiStack, arg_101_0.uiState)

			arg_101_0.uiState = iter_101_1
		end
	end

	pg.m02:sendNotification(var_0_0.NOTIFY_UI_STATE, arg_101_0.uiState)

	arg_101_0.uiStore = {}

	eachChild(arg_101_0.uiContainer, function(arg_102_0)
		setActive(arg_102_0, arg_102_0.name == arg_101_0.uiState)
	end)
	arg_101_0:EnablePOVLayer(arg_101_0.uiState == "base" or arg_101_0.uiState == "walk")
	arg_101_0:TempHideContact(arg_101_0.uiState ~= "base")
	arg_101_0:SetFloatEnable(arg_101_0.uiState == "walk")
	setActive(arg_101_0.rtFloatPage, arg_101_0.uiState == "walk")
	setActive(arg_101_0.ikControlUI, arg_101_0.uiState == "ik")

	if arg_101_0.uiState ~= "stocking" then
		arg_101_0.stockingView:Hide()
	end

	warning("SetUI to ", arg_101_0.uiState)
	switch(arg_101_0.uiState, {
		base = function()
			if not arg_101_0.room:isPersonalRoom() then
				arg_101_0:SetApartment(nil)
			end

			arg_101_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_101_0.rtRole, function(arg_105_0)
				setActive(arg_105_0, false)
			end)

			local var_104_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"MiniGame",
				"PublicGame",
				"Performance"
			}, function(arg_106_0)
				return arg_101_0:CheckSystemOpen(arg_106_0)
			end)
			local var_104_1 = 0.05

			for iter_104_0, iter_104_1 in ipairs(var_104_0) do
				LeanTween.delayedCall(var_104_1, System.Action(function()
					setActive(arg_101_0.rtRole:Find(iter_104_1), true)

					if iter_104_1 == "Touch" then
						local var_107_0 = arg_101_0.apartment:GetConfigID()

						arg_101_0.rtRoleTouchSubView:Flush(arg_101_0.room, var_107_0, arg_101_0.ladyDict[var_107_0].ladyBaseZone)
					end
				end))

				var_104_1 = var_104_1 + 0.066
			end

			setActive(arg_101_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_101_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_101_0.uiContainer:Find("ik/Right/MenuSmall"), arg_101_0.room:isPersonalRoom() and not arg_101_0.performanceInfo)
			setActive(arg_101_0.uiContainer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_101_0.uiContainer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_101_0.apartment:getConfig("name")))
		end,
		stocking = function()
			arg_101_0.stockingView:Show()
		end
	})
	arg_101_0:ActiveStateCamera(arg_101_0.uiState, function()
		if arg_101_1 then
			arg_101_1()
		elseif arg_101_0.uiState == "base" then
			arg_101_0:CheckQueue()
		end
	end)
end

function var_0_0.EnterWatchMode(arg_112_0)
	local var_112_0 = arg_112_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_113_0)
			arg_112_0:emit(arg_112_0.SHOW_BLOCK)
			arg_112_0:SetBlackboardValue(arg_112_0.ladyDict[var_112_0], "inWatchMode", true)
			arg_112_0:SetUI(arg_113_0, "watch")
		end,
		function(arg_114_0)
			arg_112_0:emit(arg_112_0.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_115_0)
	local var_115_0 = arg_115_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_116_0)
			arg_115_0:emit(arg_115_0.SHOW_BLOCK)
			arg_115_0:SetUI(arg_116_0, "back")
		end,
		function(arg_117_0)
			arg_115_0:SetBlackboardValue(arg_115_0.ladyDict[var_115_0], "inWatchMode", false)
			arg_115_0:emit(arg_115_0.HIDE_BLOCK)
			arg_115_0:CheckQueue()
		end
	})
end

function var_0_0.SetInPending(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = arg_118_0:GetBlackboardValue(arg_118_1, "groupId")
	local var_118_1 = pg.dorm3d_welcome[arg_118_2]

	arg_118_0:SetBlackboardValue(arg_118_1, "inPending", true)
	arg_118_0:ChangeCanWatchState(arg_118_1)
	arg_118_0:EnableHeadIK(arg_118_1, false)

	arg_118_0.contextData.ladyZone[var_118_0] = var_118_1.area

	arg_118_1:SetZone(arg_118_0.contextData.ladyZone[var_118_0], var_118_1.welcome_staypoint)
	arg_118_0:ChangeCharacterPosition(arg_118_1)

	if var_118_1.item_shield ~= "" then
		arg_118_0.hideItemDic = {}

		for iter_118_0, iter_118_1 in ipairs(var_118_1.item_shield) do
			local var_118_2 = arg_118_0.modelRoot:Find(iter_118_1)

			if not var_118_2 then
				warning(string.format("welcome:%d without hide item:%s", arg_118_2, iter_118_1))
			else
				arg_118_0.hideItemDic[iter_118_1] = isActive(var_118_2)

				setActive(var_118_2, false)
			end
		end
	end

	onNextTick(function()
		if arg_118_1.tfPendintItem then
			setActive(arg_118_1.tfPendintItem, true)
		end

		arg_118_0:SwitchAnim(arg_118_1, var_118_1.welcome_idle)
	end)

	arg_118_0.wakeUpTalkId = var_118_1.welcome_talk
end

function var_0_0.SetOutPending(arg_120_0, arg_120_1)
	arg_120_0:SetBlackboardValue(arg_120_1, "inPending", false)
	arg_120_0:ChangeCanWatchState(arg_120_1)
	arg_120_0:EnableHeadIK(arg_120_1, true)

	arg_120_0.wakeUpTalkId = nil

	if arg_120_1.tfPendintItem then
		setActive(arg_120_1.tfPendintItem, false)
	end

	if arg_120_0.hideItemDic then
		for iter_120_0, iter_120_1 in pairs(arg_120_0.hideItemDic) do
			setActive(arg_120_0.modelRoot:Find(iter_120_0), iter_120_1)
		end

		arg_120_0.hideItemDic = nil
	end
end

function var_0_0.IsModeInHidePending(arg_121_0, arg_121_1)
	for iter_121_0, iter_121_1 in pairs(arg_121_0.ladyDict) do
		if iter_121_1.hideItemDic and iter_121_1.hideItemDic[arg_121_1] ~= nil then
			return true
		end
	end

	return false
end

function var_0_0.EnterAccompanyMode(arg_122_0, arg_122_1)
	local var_122_0 = pg.dorm3d_accompany[arg_122_1]
	local var_122_1
	local var_122_2

	if var_122_0.sceneInfo ~= "" then
		var_122_1, var_122_2 = unpack(string.split(var_122_0.sceneInfo, "|"))
	end

	local var_122_3 = {
		type = "timeline",
		name = var_122_0.timeline,
		scene = var_122_1,
		sceneRoot = var_122_2,
		accompanys = {}
	}

	for iter_122_0, iter_122_1 in ipairs(var_122_0.jump_trigger) do
		local var_122_4, var_122_5 = unpack(iter_122_1)

		var_122_3.accompanys[var_122_4] = var_122_5
	end

	local var_122_6, var_122_7 = unpack(var_122_0.favor)

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = 161,
			ship_id = arg_122_0.apartment:GetConfigID()
		}
	})
	getProxy(ApartmentProxy):RecordAccompanyTime()
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(1, var_122_0.ship_id, var_122_0.performance_time, 0, var_122_1 or arg_122_0.dormSceneMgr.artSceneInfo))

	local var_122_8 = {}

	table.insert(var_122_8, function(arg_123_0)
		arg_122_0:SetUI(arg_123_0, "blank", "accompany")
	end)
	table.insert(var_122_8, function(arg_124_0)
		arg_122_0.accompanyFavorCount = 0
		arg_122_0.accompanyFavorTimer = Timer.New(function()
			arg_122_0.accompanyFavorCount = arg_122_0.accompanyFavorCount + 1
		end, var_122_6, -1)

		arg_122_0.accompanyFavorTimer:Start()

		arg_122_0.accompanyPerformanceTimer = Timer.New(function()
			arg_122_0.canTriggerAccompanyPerformance = true
		end, var_122_0.performance_time, -1)

		arg_122_0.accompanyPerformanceTimer:Start()
		arg_122_0:PlayTimeline(var_122_3, function(arg_127_0, arg_127_1)
			arg_127_1()
			arg_124_0()
		end)
	end)
	seriesAsync(var_122_8, function()
		assert(arg_122_0.accompanyFavorTimer)
		arg_122_0.accompanyFavorTimer:Stop()

		arg_122_0.accompanyFavorTimer = nil

		assert(arg_122_0.accompanyPerformanceTimer)
		arg_122_0.accompanyPerformanceTimer:Stop()

		arg_122_0.accompanyPerformanceTimer = nil
		arg_122_0.canTriggerAccompanyPerformance = nil

		local var_128_0 = math.min(arg_122_0.accompanyFavorCount, getProxy(ApartmentProxy):getStamina())

		if var_128_0 > 0 then
			local var_128_1 = var_122_7[var_128_0]

			warning(var_128_1)
			arg_122_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_122_0.apartment.configId, var_128_1)
		end

		local var_128_2 = 0
		local var_128_3 = getProxy(ApartmentProxy):GetAccompanyTime()

		if var_128_3 then
			var_128_2 = pg.TimeMgr.GetInstance():GetServerTime() - var_128_3
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(2, var_122_0.ship_id, var_122_0.performance_time, var_128_2, var_122_1 or arg_122_0.dormSceneMgr.artSceneInfo))
		arg_122_0:SetUI(nil, "back", "back")
	end)
end

function var_0_0.ExitAccompanyMode(arg_129_0)
	existCall(arg_129_0.timelineFinishCall)
end

function var_0_0.EnterTouchPerformance(arg_130_0)
	local var_130_0 = arg_130_0:GetCurrentLadyEnv()
	local var_130_1 = arg_130_0.room:getApartmentZoneConfig(var_130_0.ladyBaseZone, "touch_performance", arg_130_0.apartment:GetConfigID())

	if not var_130_1 or var_130_1 == 0 then
		arg_130_0:EnterTouchMode()
	else
		arg_130_0:DoTalk(var_130_1)
	end
end

function var_0_0.EnterTouchMode(arg_131_0, arg_131_1)
	local var_131_0 = arg_131_0:GetCurrentLadyEnv()

	if arg_131_0:GetBlackboardValue(var_131_0, "inTouching") then
		return
	end

	arg_131_1 = arg_131_1 or arg_131_0.room:getApartmentZoneConfig(var_131_0.ladyBaseZone, "touch_id", arg_131_0.apartment:GetConfigID())
	arg_131_0.touchConfig = pg.dorm3d_touch_data[arg_131_1]

	if not arg_131_0.touchConfig then
		warning("dorm3d_touch_data no config for id:" .. tostring(arg_131_1))

		return
	end

	arg_131_0.inTouchGame = arg_131_0.touchConfig.heartbeat_enable > 0

	setActive(arg_131_0.rtTouchGamePanel, arg_131_0.inTouchGame)

	if arg_131_0.inTouchGame then
		arg_131_0.touchCount = 0
		arg_131_0.touchLevel = 1
		arg_131_0.lastCount = 0
		arg_131_0.topCount = 0

		arg_131_0:UpdateTouchGameDisplay()
		setSlider(arg_131_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_131_0.touchCount >= 200 and 100 or arg_131_0.touchCount % 100)
		quickPlayAnimation(arg_131_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_131_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_131_0.downTimer = Timer.New(function()
			local var_132_0 = pg.dorm3d_set.reduce_interaction.key_value_int

			if arg_131_0.touchLevel > 1 then
				var_132_0 = pg.dorm3d_set.reduce_heartbeat.key_value_int
			end

			arg_131_0:UpdateTouchCount(var_132_0)
		end, 1, -1)

		arg_131_0.downTimer:Start()
	end

	local var_131_1 = {}

	table.insert(var_131_1, function(arg_133_0)
		arg_131_0:SetBlackboardValue(var_131_0, "inTouching", true)
		arg_131_0:emit(arg_131_0.SHOW_BLOCK)
		arg_131_0:SetUI(arg_133_0, "blank")
	end)
	table.insert(var_131_1, function(arg_134_0)
		local var_134_0 = arg_131_0.touchConfig.ik_status[1]

		arg_131_0:SwitchIKConfig(var_131_0, var_134_0)
		setActive(arg_131_0.uiContainer:Find("ik/btn_back"), true)
		arg_131_0:SetIKState(true, arg_134_0)
	end)
	table.insert(var_131_1, function(arg_135_0)
		existCall(arg_135_0)
	end)
	seriesAsync(var_131_1, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_131_0:emit(arg_131_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_137_0)
	local var_137_0 = arg_137_0:GetCurrentLadyEnv()

	if not arg_137_0:GetBlackboardValue(var_137_0, "inTouching") then
		return
	end

	local var_137_1 = {}

	if arg_137_0.inTouchGame then
		table.insert(var_137_1, function(arg_138_0)
			arg_137_0:emit(arg_137_0.SHOW_BLOCK)
			quickPlayAnimation(arg_137_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_138_0, 0.5)
		end)
		table.insert(var_137_1, function(arg_139_0)
			local var_139_0 = 0

			for iter_139_0, iter_139_1 in ipairs(arg_137_0.touchConfig.heartbeat_favor) do
				if iter_139_1[1] > arg_137_0.topCount then
					break
				else
					var_139_0 = iter_139_1[2]
				end
			end

			if var_139_0 > 0 then
				arg_137_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_137_0.apartment.configId, var_139_0)
			end

			arg_137_0.touchCount = nil
			arg_137_0.touchLevel = nil
			arg_137_0.topCount = nil

			if arg_137_0.downTimer then
				arg_137_0.downTimer:Stop()

				arg_137_0.downTimer = nil
			end

			arg_137_0.inTouchGame = false

			setActive(arg_137_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_139_0()
		end)
	else
		table.insert(var_137_1, function(arg_140_0)
			arg_137_0:emit(arg_137_0.SHOW_BLOCK)

			local var_140_0 = arg_137_0.touchConfig.default_favor

			if var_140_0 > 0 then
				arg_137_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_137_0.apartment.configId, var_140_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_140_0()
		end)
	end

	table.insert(var_137_1, function(arg_141_0)
		var_137_0.ikConfig = {
			character_position = var_137_0.ladyBaseZone,
			character_action = arg_137_0.touchConfig.finish_action
		}

		arg_137_0:emit(var_0_0.STOCKING_EVENT, "OnExitTouchMode")
		arg_137_0:SetIKState(false, arg_141_0)
	end)
	table.insert(var_137_1, function(arg_142_0)
		var_137_0.ikConfig = nil
		arg_137_0.blockIK = nil

		arg_137_0:SetUI(arg_142_0, "back")
	end)
	seriesAsync(var_137_1, function()
		arg_137_0:SetBlackboardValue(var_137_0, "inTouching", false)
		arg_137_0:emit(arg_137_0.HIDE_BLOCK)

		arg_137_0.touchConfig = nil

		local var_143_0 = arg_137_0.touchExitCall

		arg_137_0.touchExitCall = nil

		existCall(var_143_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	local var_144_0 = arg_144_0:GetCurrentLadyEnv()

	seriesAsync({
		function(arg_145_0)
			arg_144_0:ChangeArtScene(arg_144_2, arg_145_0)
		end,
		function(arg_146_0)
			arg_144_0:ChangeSubScene(arg_144_2, arg_146_0)
		end,
		function(arg_147_0)
			arg_144_0:emit(arg_144_0.SHOW_BLOCK)

			if arg_144_1 == "back" then
				arg_144_0:SetUI(arg_147_0, "back")
			elseif arg_144_1 == "change" and arg_144_0.uiState ~= "walk" then
				arg_144_0:SetUI(arg_147_0, "walk")
			else
				arg_147_0()
			end
		end
	}, function()
		arg_144_0:emit(arg_144_0.HIDE_BLOCK)
		arg_144_0:SetBlackboardValue(var_144_0, "inWalk", arg_144_1 == "change")
		existCall(arg_144_3)
	end)
end

function var_0_0.EnterWalkMode(arg_149_0)
	local var_149_0 = arg_149_0.apartment:GetConfigID()
	local var_149_1 = arg_149_0.ladyDict[var_149_0]

	seriesAsync({
		function(arg_150_0)
			arg_149_0:emit(arg_149_0.SHOW_BLOCK)
			arg_149_0:HideCharacter(var_149_0)
			arg_149_0:SetBlackboardValue(var_149_1, "inWalk", true)
			arg_149_0:SetUI(arg_150_0, "walk")
		end,
		function(arg_151_0)
			arg_149_0:emit(arg_149_0.HIDE_BLOCK)
			arg_149_0:ChangeArtScene(arg_149_0.walkInfo.scene .. "|" .. arg_149_0.walkInfo.sceneRoot, arg_151_0)
		end,
		function(arg_152_0)
			arg_149_0:LoadSubScene(arg_149_0.walkInfo, arg_152_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_154_0)
	local var_154_0 = arg_154_0.apartment:GetConfigID()
	local var_154_1 = arg_154_0.ladyDict[var_154_0]

	seriesAsync({
		function(arg_155_0)
			arg_154_0:RevertArtScene(arg_154_0.walkLastSceneInfo, arg_155_0)
		end,
		function(arg_156_0)
			arg_154_0:UnloadSubScene(arg_154_0.walkInfo, arg_156_0)
		end,
		function(arg_157_0)
			arg_154_0:emit(arg_154_0.SHOW_BLOCK)
			arg_154_0:SetUI(arg_157_0, "back")
		end
	}, function()
		arg_154_0:emit(arg_154_0.HIDE_BLOCK)
		arg_154_0:RevertCharacter(var_154_0)
		arg_154_0:SetBlackboardValue(var_154_1, "inWalk", false)

		local var_158_0 = arg_154_0.walkExitCall

		arg_154_0.walkExitCall = nil
		arg_154_0.walkLastSceneInfo = nil
		arg_154_0.walkInfo = nil

		existCall(var_158_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_159_0)
	if not arg_159_0.tfCutIn then
		return
	end

	local var_159_0 = arg_159_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_159_0, true)

	local var_159_1 = GetOrAddComponent(var_159_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_159_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_159_1, arg_159_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_159_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_159_0.modelCutIn.player, "Idle")
	setActive(arg_159_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_160_0)
	if not arg_160_0.tfCutIn then
		return
	end

	local var_160_0 = arg_160_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_160_1 = GetOrAddComponent(var_160_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_160_1)
	setActive(var_160_0, false)
	setActive(arg_160_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_161_0, arg_161_1, arg_161_2)
	warning("switchIkstatus", arg_161_2)

	local var_161_0 = pg.dorm3d_ik_status[arg_161_2]

	if var_161_0.skin_id ~= arg_161_1.skinId then
		local var_161_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_161_0.base]
		local var_161_2 = _.detect(var_161_1, function(arg_162_0)
			return pg.dorm3d_ik_status[arg_162_0].skin_id == arg_161_1.skinId
		end)

		assert(var_161_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_161_1.skinId, arg_161_2))

		var_161_0 = pg.dorm3d_ik_status[var_161_2]
	end

	arg_161_1.ikConfig = var_161_0
end

function var_0_0.SetIKState(arg_163_0, arg_163_1, arg_163_2, arg_163_3)
	arg_163_3 = arg_163_3 or {}

	local var_163_0 = arg_163_0:GetCurrentLadyEnv()
	local var_163_1 = {}

	if arg_163_1 then
		table.insert(var_163_1, function(arg_164_0)
			arg_163_0:SetBlackboardValue(var_163_0, "inIK", true)
			arg_163_0:emit(arg_163_0.SHOW_BLOCK)

			local var_164_0 = var_163_0.ikConfig.camera_group

			setActive(arg_163_0.uiContainer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_164_0] > 1)
			setActive(arg_163_0.ikControlUI, true)
			arg_164_0()
		end)

		if arg_163_0.uiState ~= "ik" then
			table.insert(var_163_1, function(arg_165_0)
				arg_163_0:SetUI(arg_165_0, "ik")
			end)
		end

		table.insert(var_163_1, function(arg_166_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_163_0:SetIKStatus(var_163_0, var_163_0.ikConfig, arg_166_0, arg_163_3)
		end)
		table.insert(var_163_1, function(arg_167_0)
			arg_163_0:emit(arg_163_0.HIDE_BLOCK)
			arg_167_0()
		end)
	else
		assert(arg_163_0.uiState == "ik")
		table.insert(var_163_1, function(arg_168_0)
			setActive(arg_163_0.ikControlUI, false)
			arg_163_0:emit(arg_163_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_168_0()
		end)
		table.insert(var_163_1, function(arg_169_0)
			arg_163_0:ExitIKStatus(var_163_0, var_163_0.ikConfig, arg_169_0, arg_163_3)
			arg_163_0:ResetSceneItemAnimators()
		end)
		table.insert(var_163_1, function(arg_170_0)
			arg_163_0:SetUI(arg_170_0, "back")
		end)
		table.insert(var_163_1, function(arg_171_0)
			arg_163_0:SetBlackboardValue(var_163_0, "inIK", false)
			arg_163_0:emit(arg_163_0.HIDE_BLOCK)
			arg_171_0()
		end)
	end

	seriesAsync(var_163_1, arg_163_2)
end

function var_0_0.TouchModeAction(arg_172_0, arg_172_1, arg_172_2, arg_172_3, ...)
	return switch(arg_172_3, {
		function(arg_173_0, arg_173_1)
			return function(arg_174_0)
				seriesAsync({
					function(arg_175_0)
						if not arg_173_1 or arg_173_1 == "" then
							return arg_175_0()
						end

						arg_172_0:PlaySingleAction(arg_172_1, arg_173_1, arg_175_0)
					end,
					function(arg_176_0)
						arg_172_0:SwitchIKConfig(arg_172_1, arg_173_0)
						arg_172_0:SetIKState(true, arg_176_0)
					end,
					arg_174_0
				})
			end
		end,
		function()
			return function()
				if arg_172_0.ikSpecialCall then
					local var_178_0 = arg_172_0.ikSpecialCall

					arg_172_0.ikSpecialCall = nil

					existCall(var_178_0)
				else
					arg_172_0:ExitTouchMode()
				end
			end
		end,
		function(arg_179_0, arg_179_1)
			return function(arg_180_0)
				arg_172_0:PlaySingleAction(arg_172_1, arg_179_1, arg_180_0)
			end
		end,
		function(arg_181_0, arg_181_1, arg_181_2)
			return function(arg_182_0)
				seriesAsync({
					function(arg_183_0)
						arg_172_0:DoTalk(arg_181_1, arg_183_0)
					end,
					function(arg_184_0)
						if not arg_181_2 or arg_181_2 == 0 then
							return arg_184_0()
						end

						arg_172_0:SwitchIKConfig(arg_172_1, arg_181_2)
						arg_172_0:SetIKState(true, arg_184_0)
					end,
					arg_182_0
				})
			end
		end,
		function(arg_185_0, arg_185_1, arg_185_2, arg_185_3)
			return function(arg_186_0)
				arg_172_0:PlaySceneItemAnim(arg_185_2, arg_185_3)
				arg_172_0:PlaySingleAction(arg_185_1, arg_186_0)
			end
		end,
		function(arg_187_0)
			return function(arg_188_0)
				local var_188_0 = pg.dorm3d_ik_touch[arg_172_2]

				if #var_188_0.scene_item == 0 then
					return
				end

				local var_188_1 = arg_172_0:GetSceneItem(var_188_0.scene_item)

				if not var_188_1 then
					warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_172_2, var_188_0.scene_item))

					return
				end

				local var_188_2 = var_188_1:Find(arg_187_0)

				if not IsNil(var_188_2) then
					setActive(var_188_2, false)
					setActive(var_188_2, true)
				end

				arg_188_0()
			end
		end,
		function(arg_189_0)
			local var_189_0 = pg.dorm3d_ik_touch_move[arg_189_0]
			local var_189_1 = var_189_0.target_ik
			local var_189_2 = var_189_0.move_time
			local var_189_3 = var_189_0.ik_point
			local var_189_4 = var_189_0.touch_step

			arg_172_1.IKSettings.forceMove = arg_172_1.IKSettings.forceMove or {}

			local var_189_5 = arg_172_1.IKSettings.forceMove

			var_189_5[var_189_1] = var_189_5[var_189_1] or {}
			var_189_5[var_189_1].count = var_189_5[var_189_1].count or 0

			return function(arg_190_0)
				seriesAsync({
					function(arg_191_0)
						if var_189_5[var_189_1].count >= #var_189_4 then
							return arg_191_0()
						end

						local var_191_0 = Dorm3dIK.New({
							configId = var_189_1
						})
						local var_191_1 = Vector2.New(unpack(var_189_3))
						local var_191_2 = var_189_5[var_189_1].count
						local var_191_3 = var_189_4[var_191_2 + 1] - (var_191_2 == 0 and 0 or var_189_4[var_191_2])

						var_189_5[var_189_1].count = var_191_2 + 1

						pg.IKMgr.GetInstance():ResetIK(var_191_0:GetTriggerBoneName())

						local var_191_4 = arg_172_1.IKSettings.Colliders[var_191_0:GetTriggerBoneName()]
						local var_191_5 = arg_172_0.raycastCamera:WorldToScreenPoint(var_191_4.position)

						pg.IKMgr.GetInstance():PlayIKMove(var_191_5, var_191_0:GetTriggerBoneName(), var_191_1, var_189_4[var_191_2 + 1], var_189_2, function()
							var_189_5[var_189_1].count = 0

							arg_191_0()
						end)
					end,
					arg_190_0
				})
			end
		end,
		function(arg_193_0)
			return function(arg_194_0)
				arg_172_0.stockingMgr:SetStockingStatus(arg_193_0)
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_197_0, arg_197_1)
	local var_197_0 = arg_197_0:GetCurrentLadyEnv()

	if var_197_0.ikTimelineMode then
		arg_197_0:ExitIKTimelineStatus(var_197_0)

		local var_197_1 = arg_197_1:GetTimelineAction()

		if var_197_1 then
			arg_197_0.nowTimelinePlayer:TriggerEvent(var_197_1)
		end

		return
	end

	if not var_197_0.ikConfig then
		return
	end

	local var_197_2 = arg_197_1:GetControllerPath()
	local var_197_3 = var_197_0.ikActionDict[var_197_2]

	if not var_197_3 then
		return
	end

	arg_197_0.blockIK = true

	arg_197_0:TouchModeAction(var_197_0, arg_197_1:GetConfigID(), unpack(var_197_3))(function()
		arg_197_0:ResetIKTipTimer()

		arg_197_0.blockIK = nil
	end)
end

function var_0_0.OnTouchCharacterBody(arg_199_0, arg_199_1)
	local var_199_0 = arg_199_0:GetCurrentLadyEnv()

	if not var_199_0.ikConfig then
		return
	end

	if type(var_199_0.ikConfig.touch_data) ~= "table" then
		return
	end

	for iter_199_0, iter_199_1 in ipairs(var_199_0.iKTouchDatas) do
		local var_199_1, var_199_2, var_199_3 = unpack(iter_199_1)
		local var_199_4 = pg.dorm3d_ik_touch[var_199_1]

		if var_199_4.body == arg_199_1 then
			local var_199_5 = var_199_4.action_emote

			if #var_199_5 > 0 then
				arg_199_0:PlayFaceAnim(var_199_0, var_199_5)
			end

			local var_199_6 = var_199_4.vibrate

			if type(var_199_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_199_7 = {}
				local var_199_8 = {}
				local var_199_9 = {}

				underscore.each(var_199_6, function(arg_200_0)
					local var_200_0 = arg_200_0[1]

					if PLATFORM == PLATFORM_IPHONEPLAYER then
						var_200_0 = var_200_0 / 1000
					end

					table.insert(var_199_7, var_200_0)
					table.insert(var_199_8, arg_200_0[2])
					table.insert(var_199_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_199_7, var_199_8)
				elseif PLATFORM == PLATFORM_IPHONEPLAYER then
					VibrateMgr.Instance:VibrateWaveform(var_199_7, var_199_8, var_199_9)
				end
			end

			arg_199_0.blockIK = true

			arg_199_0:TouchModeAction(var_199_0, var_199_1, unpack(var_199_3))(function()
				arg_199_0:ResetIKTipTimer()

				arg_199_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_202_0)
	setActive(arg_202_0.rtTouchGamePanel:Find("effect_bg"), arg_202_0.touchLevel == 2)
	setActive(arg_202_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_202_0.touchLevel == 2)

	if arg_202_0.touchLevel == 1 then
		setActive(arg_202_0.uiContainer:Find("ik/btn_back"), true)
		setActive(arg_202_0.uiContainer:Find("ik/btn_back_heartbeat"), false)
		quickPlayAnimation(arg_202_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_202_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_202_0.touchLevel == 2 then
		setActive(arg_202_0.uiContainer:Find("ik/btn_back"), false)
		setActive(arg_202_0.uiContainer:Find("ik/btn_back_heartbeat"), true)
		quickPlayAnimation(arg_202_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_202_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_203_0, arg_203_1)
	if arg_203_0.touchLevel > 1 then
		arg_203_1 = math.min(0, arg_203_1)
	end

	arg_203_0.touchCount = math.clamp(arg_203_0.touchCount + arg_203_1, 0, 100)

	if arg_203_0.sliderLT and LeanTween.isTweening(arg_203_0.sliderLT) then
		LeanTween.cancel(arg_203_0.sliderLT)

		arg_203_0.sliderLT = nil
	end

	setSlider(arg_203_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_203_0.touchCount)

	local var_203_0

	if arg_203_0.touchCount >= 100 then
		var_203_0 = 2
	elseif arg_203_0.touchCount <= 0 then
		var_203_0 = 1
	end

	if var_203_0 and var_203_0 ~= arg_203_0.touchLevel then
		if arg_203_0.blockIK then
			return
		end

		arg_203_0.touchLevel = var_203_0

		local var_203_1 = arg_203_0.touchConfig.ik_status[var_203_0]

		if var_203_1 then
			if var_203_0 > 1 then
				arg_203_0.touchCount = 200
			elseif var_203_0 == 1 then
				arg_203_0.touchCount = 0
			end

			local var_203_2 = arg_203_0:GetCurrentLadyEnv()

			seriesAsync({
				function(arg_204_0)
					arg_203_0:ShowBlackScreen(true, arg_204_0)
				end,
				function(arg_205_0)
					arg_203_0:SwitchIKConfig(var_203_2, var_203_1)
					arg_203_0:SetIKState(true, arg_205_0)

					if var_203_0 > 1 and arg_203_0.touchConfig.heartbeat_enter_anim ~= "" then
						arg_203_0:SwitchAnim(var_203_2, arg_203_0.touchConfig.heartbeat_enter_anim)
					end
				end,
				function(arg_206_0)
					arg_203_0:ShowBlackScreen(false, arg_206_0)
				end
			})
		end

		arg_203_0:UpdateTouchCount(0)
		arg_203_0:UpdateTouchGameDisplay()
	end

	arg_203_0.topCount = math.max(arg_203_0.topCount, arg_203_0.touchCount)
end

function var_0_0.ExitHeartbeatMode(arg_207_0)
	if not arg_207_0.touchLevel or arg_207_0.touchLevel == 1 then
		return
	end

	arg_207_0.touchCount = 0

	arg_207_0:UpdateTouchCount(0)
end

function var_0_0.DoTouch(arg_208_0, arg_208_1, arg_208_2)
	if arg_208_0.inTouchGame then
		switch(arg_208_2, {
			function()
				arg_208_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_208_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_208_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_208_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat_trriger.key_value_int)
			end
		})
	end
end

function var_0_0.DoTalk(arg_213_0, arg_213_1, arg_213_2)
	while rawget(arg_213_0, "class") ~= var_0_0 do
		arg_213_0 = getmetatable(arg_213_0).__index
	end

	if arg_213_0.apartment and arg_213_0:GetBlackboardValue(arg_213_0:GetCurrentLadyEnv(), "inTalking") then
		errorMsg("Talking block:" .. arg_213_1)

		return
	end

	if not arg_213_0.room:isPersonalRoom() then
		local var_213_0 = pg.dorm3d_dialogue_group[arg_213_1].char_id

		if arg_213_0.apartment then
			assert(arg_213_0.apartment:GetConfigID() == var_213_0)
		else
			arg_213_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_213_0))
		end
	end

	local var_213_1 = arg_213_0:GetCurrentLadyEnv()

	if arg_213_1 == 10010 and not arg_213_0.apartment.talkDic[arg_213_1] then
		arg_213_0.firstTimelineTouch = true
		arg_213_0.firstMoveGuide = true
	end

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = arg_213_0.contextData.timeIndex == 1 and 110 or 115,
			ship_id = arg_213_0.apartment:GetConfigID()
		},
		{
			value = 1,
			event_type = 155,
			ship_id = arg_213_0.apartment:GetConfigID()
		}
	})

	local var_213_2 = {}

	if arg_213_0:GetBlackboardValue(var_213_1, "inPending") then
		table.insert(var_213_2, function(arg_214_0)
			arg_213_0:OutOfLazy(arg_213_0.apartment:GetConfigID(), arg_214_0)
		end)
	end

	local var_213_3 = pg.dorm3d_dialogue_group[arg_213_1]
	local var_213_4 = var_213_3.performance_type == 1
	local var_213_5

	table.insert(var_213_2, function(arg_215_0)
		arg_213_0:emit(arg_213_0.SHOW_BLOCK)
		arg_213_0:SetBlackboardValue(var_213_1, var_213_4 and "inPerformance" or "inTalking", true)
		arg_213_0:emit(Dorm3dRoomMediator.DO_TALK, arg_213_1, function(arg_216_0)
			var_213_5 = arg_216_0

			arg_215_0()
		end)
	end)
	table.insert(var_213_2, function(arg_217_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_213_0.apartment.configId, arg_213_0.apartment.level, arg_213_1, var_213_3.type, arg_213_0.room:getZoneConfig(arg_213_0:GetCurrentLadyEnv().ladyBaseZone, "id"), var_213_3.action_type, table.CastToString(var_213_3.trigger_config), arg_213_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_213_0:SetUI(arg_217_0, "blank")
	end)

	if var_213_3.trigger_area and var_213_3.trigger_area ~= "" then
		table.insert(var_213_2, function(arg_218_0)
			arg_213_0:ShiftZone(var_213_3.trigger_area, arg_218_0)
		end)
	end

	if var_213_3.performance_type == 0 then
		table.insert(var_213_2, function(arg_219_0)
			arg_213_0:emit(arg_213_0.HIDE_BLOCK)

			if arg_213_0.contextData.isVideoTalk then
				arg_213_0.videoPlayer:ExecuteAction("Play", var_213_3.story, function()
					onDelayTick(arg_219_0, 0.001)
				end)
			else
				pg.NewStoryMgr.GetInstance():ForceManualPlay(var_213_3.story, function()
					onDelayTick(arg_219_0, 0.001)
				end, true)
			end
		end)
	elseif var_213_3.performance_type == 1 then
		table.insert(var_213_2, function(arg_222_0)
			arg_213_0:emit(arg_213_0.HIDE_BLOCK)
			arg_213_0:PerformanceQueue(var_213_3.story, arg_222_0)
		end)
	else
		assert(false)
	end

	table.insert(var_213_2, function(arg_223_0)
		arg_213_0:emit(arg_213_0.SHOW_BLOCK)
		arg_223_0()
	end)
	table.insert(var_213_2, function(arg_224_0)
		local var_224_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_213_3.story)

		if var_224_0 then
			local var_224_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_224_0, var_224_1))
		end

		if var_213_5 and #var_213_5 > 0 then
			arg_213_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_213_5, arg_224_0)
		else
			arg_224_0()
		end
	end)
	table.insert(var_213_2, function(arg_225_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_213_0:emit(arg_213_0.HIDE_BLOCK)

		if arg_213_0.contextData.isVideoTalk then
			existCall(arg_225_0)
		else
			arg_213_0:SetBlackboardValue(var_213_1, var_213_4 and "inPerformance" or "inTalking", false)
			arg_213_0:SetUI(arg_225_0, "back")
		end
	end)
	seriesAsync(var_213_2, function()
		if arg_213_2 then
			return arg_213_2()
		else
			arg_213_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_227_0, arg_227_1, arg_227_2, arg_227_3)
	local var_227_0 = arg_227_0.rtExtraScreen:Find("TalkTouchOption")
	local var_227_1
	local var_227_2 = var_227_0:Find("content")

	UIItemList.StaticAlign(var_227_2, var_227_2:Find("clickTpl"), #arg_227_1.options, function(arg_228_0, arg_228_1, arg_228_2)
		arg_228_1 = arg_228_1 + 1

		if arg_228_0 == UIItemList.EventUpdate then
			local var_228_0 = arg_227_1.options[arg_228_1]

			setAnchoredPosition(arg_228_2, NewPos(unpack(var_228_0.pos)))
			onButton(arg_227_0, arg_228_2, function()
				var_227_1(var_228_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_228_2, not table.contains(arg_227_2, var_228_0.flag))
		end
	end)
	setActive(var_227_0, true)

	function var_227_1(arg_230_0)
		setActive(var_227_0, false)
		arg_227_3(arg_230_0)
	end
end

function var_0_0.DoTimelineOption(arg_231_0, arg_231_1, arg_231_2)
	local var_231_0 = arg_231_0.rtTimelineScreen:Find("TimelineOption")
	local var_231_1
	local var_231_2 = var_231_0:Find("content")

	UIItemList.StaticAlign(var_231_2, var_231_2:Find("clickTpl"), #arg_231_1, function(arg_232_0, arg_232_1, arg_232_2)
		arg_232_1 = arg_232_1 + 1

		if arg_232_0 == UIItemList.EventUpdate then
			local var_232_0 = arg_231_1[arg_232_1]

			setText(arg_232_2:Find("Text"), HXSet.hxLan(var_232_0.content))
			onButton(arg_231_0, arg_232_2, function()
				var_231_1(arg_232_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_231_0, true)

	function var_231_1(arg_234_0)
		setActive(var_231_0, false)
		arg_231_2(arg_234_0)
	end
end

function var_0_0.DoTimelineTouch(arg_235_0, arg_235_1, arg_235_2)
	local var_235_0 = arg_235_0.rtTimelineScreen:Find("TimelineTouch")
	local var_235_1
	local var_235_2 = var_235_0:Find("content")

	UIItemList.StaticAlign(var_235_2, var_235_2:Find("clickTpl"), #arg_235_1, function(arg_236_0, arg_236_1, arg_236_2)
		arg_236_1 = arg_236_1 + 1

		if arg_236_0 == UIItemList.EventUpdate then
			local var_236_0 = arg_235_1[arg_236_1]

			setAnchoredPosition(arg_236_2, NewPos(unpack(var_236_0.pos)))
			onButton(arg_235_0, arg_236_2, function()
				var_235_1(arg_236_1)
			end, SFX_CONFIRM)

			if arg_235_0.firstTimelineTouch then
				arg_235_0.firstTimelineTouch = nil

				setActive(arg_236_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_235_0, true)

	function var_235_1(arg_238_0)
		setActive(var_235_0, false)
		arg_235_2(arg_238_0)
	end
end

function var_0_0.DoShortWait(arg_239_0, arg_239_1)
	local var_239_0 = arg_239_0.ladyDict[arg_239_1]
	local var_239_1 = getProxy(ApartmentProxy):getApartment(arg_239_1)
	local var_239_2 = arg_239_0.room:getApartmentZoneConfig(var_239_0.ladyBaseZone, "special_action", arg_239_1)
	local var_239_3 = var_239_2 and var_239_2[math.random(#var_239_2)] or nil

	if not var_239_3 then
		return
	end

	arg_239_0:PlaySingleAction(var_239_0, var_239_3)
end

function var_0_0.OutOfLazy(arg_240_0, arg_240_1, arg_240_2)
	local var_240_0 = arg_240_0.ladyDict[arg_240_1]
	local var_240_1 = {}

	if arg_240_0:GetBlackboardValue(var_240_0, "inPending") then
		table.insert(var_240_1, function(arg_241_0)
			arg_240_0.shiftLady = arg_240_1

			arg_240_0:ShiftZone(var_240_0.ladyBaseZone, arg_241_0)
		end)
	end

	seriesAsync(var_240_1, arg_240_2)
end

function var_0_0.OutOfPending(arg_242_0, arg_242_1, arg_242_2)
	assert(arg_242_0.wakeUpTalkId)

	local var_242_0 = arg_242_0.wakeUpTalkId

	seriesAsync({
		function(arg_243_0)
			arg_242_0:SetUI(arg_243_0, "blank")
		end,
		function(arg_244_0)
			arg_242_0.shiftLady = arg_242_1

			local var_244_0 = arg_242_0.ladyDict[arg_242_1]

			arg_242_0:ShiftZone(var_244_0.ladyBaseZone, arg_244_0)
		end,
		function(arg_245_0)
			arg_242_0:DoTalk(var_242_0, arg_245_0)
		end
	}, function()
		arg_242_0:SetUIStore(arg_242_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_247_0, arg_247_1)
	local var_247_0

	if arg_247_0:GetBlackboardValue(arg_247_1, "inPending") then
		var_247_0 = tobool(arg_247_0:GetBlackboardValue(arg_247_1, "inDistance"))
	else
		local var_247_1 = arg_247_0:GetBlackboardValue(arg_247_1, "groupId")

		var_247_0 = tobool(arg_247_0.activeLady[var_247_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_247_1.ladyBlackboard))
	end

	if arg_247_1.blockCanWatch then
		var_247_0 = false
	end

	if (not arg_247_1.nowCanWatchState or arg_247_1.nowCanWatchState ~= var_247_0) and arg_247_1.ladyWatchFloat then
		arg_247_1.nowCanWatchState = var_247_0

		arg_247_0:ShowOrHideCanWatchMark(arg_247_1, arg_247_1.nowCanWatchState)
	end
end

function var_0_0.HandleGameNotification(arg_248_0, arg_248_1, arg_248_2)
	local var_248_0 = arg_248_0:GetCurrentLadyEnv()

	switch(arg_248_1, {
		[Dorm3dMiniGameMediator.OPERATION] = function()
			local var_249_0 = arg_248_2.miniGameId

			switch(arg_248_2.miniGameId, {
				[67] = function()
					if arg_248_2.operationCode == "GAME_HIT_AREA" then
						local var_250_0 = {
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
						local var_250_1, var_250_2 = unpack(var_250_0[arg_248_2.index])

						arg_248_0:PlayFaceAnim(var_248_0, var_250_1)

						if arg_248_0.tfCutIn then
							quickPlayAnimator(arg_248_0.modelCutIn.lady, var_250_2)
							quickPlayAnimator(arg_248_0.modelCutIn.player, var_250_2)
						end
					elseif arg_248_2.operationCode == "GAME_RESULT" then
						if arg_248_2.win then
							arg_248_0:PlayFaceAnim(var_248_0, "Face_XYX_victory")
							arg_248_0:PlaySingleAction(var_248_0, "minigame_win")
						else
							arg_248_0:PlayFaceAnim(var_248_0, "Face_XYX_lose")
							arg_248_0:PlaySingleAction(var_248_0, "minigame_lose")
						end

						setActive(arg_248_0.rtExtraScreen:Find("MiniGameCutIn"), false)
					end
				end,
				[70] = function()
					if arg_248_2.operationCode == "GAME_READY" then
						arg_248_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_248_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil

						arg_248_0:PlaySingleAction(var_248_0, "shuohua_sikao")
					elseif arg_248_2.operationCode == "ROUND_RESULT" then
						local var_251_0

						if arg_248_2.success then
							var_251_0 = {
								"shuohua_wenhou",
								"shuohua_sikao"
							}
						else
							var_251_0 = {
								"shuohua_yaotou",
								"shuohua_sikao"
							}
						end

						seriesAsync(underscore.map(var_251_0, function(arg_252_0)
							return function(arg_253_0)
								arg_248_0:PlaySingleAction(var_248_0, arg_252_0, arg_253_0)
							end
						end), function()
							return
						end)
					elseif arg_248_2.operationCode == "GAME_RESULT" then
						local var_251_1 = arg_248_0.cameras[var_0_0.CAMERA.TALK].transform

						var_251_1.position = var_251_1.position + var_251_1.right * 0.11

						local var_251_2 = {
							"shuohua_gandong"
						}

						seriesAsync(underscore.map(var_251_2, function(arg_255_0)
							return function(arg_256_0)
								arg_248_0:PlaySingleAction(var_248_0, arg_255_0, arg_256_0)
							end
						end), function()
							return
						end)
					end
				end,
				[75] = function()
					if arg_248_2.operationCode == "BEFORE_OPEN_GAME" then
						arg_248_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_248_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil
					elseif arg_248_2.operationCode == "GAME_RPS_RESULT" then
						if arg_248_2.index == 1 then
							arg_248_0:PlaySingleAction(var_248_0, "ab_shuohua_lianxuyaotou_01")
							arg_248_0:PlayFaceAnim(var_248_0, "Face_weixiao")
						elseif arg_248_2.index == 2 then
							arg_248_0:PlaySingleAction(var_248_0, "ab_shuohua_lianxudiantou_01")
							arg_248_0:PlayFaceAnim(var_248_0, "Face_kaixin")
						end
					elseif arg_248_2.operationCode == "GAME_RESULT" then
						if not arg_248_2.win then
							arg_248_0:PlaySingleAction(var_248_0, "ab_shuohua_taibangle_01")
						end

						arg_248_0:PlayFaceAnim(var_248_0, "Face_kaixin")
					end
				end
			}, function()
				warning("without miniGameId:" .. arg_248_2.miniGameId)
			end)

			if arg_248_2.operationCode == "BEFORE_OPEN_GAME" then
				local var_249_1 = getProxy(PlayerProxy):getPlayerId()
				local var_249_2 = 0

				if var_249_0 == 67 or var_249_0 == 70 then
					var_249_2 = PlayerPrefs.GetInt("mg_new_score_" .. tostring(var_249_1) .. "_" .. arg_248_2.miniGameId, 0)
				else
					var_249_2 = PlayerPrefs.GetInt("mg_score_" .. tostring(var_249_1) .. "_" .. arg_248_2.miniGameId, 0)
				end

				arg_248_0.highScore = var_249_2
			elseif arg_248_2.operationCode == "GAME_RESULT" then
				local var_249_3 = arg_248_2.score
				local var_249_4 = getProxy(PlayerProxy):getPlayerId()

				if var_249_3 > arg_248_0.highScore then
					if var_249_0 == 67 or var_249_0 == 70 then
						PlayerPrefs.SetInt("mg_new_score_" .. tostring(var_249_4) .. "_" .. arg_248_2.miniGameId, var_249_3)
					end

					getProxy(Dorm3dChatProxy):TriggerEvent({
						{
							event_type = 159,
							value = var_249_3,
							ship_id = arg_248_0.apartment:GetConfigID()
						}
					})
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_248_2.score))
			elseif arg_248_2.operationCode == "GAME_CLOSE" and arg_248_2.doTrack == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_260_0, arg_260_1, arg_260_2)
	local var_260_0, var_260_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_260_1)
	end)

	if not var_260_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_260_1)
		existCall(arg_260_2)

		return
	end

	warning(arg_260_1)

	arg_260_0.performanceInfo = {
		name = arg_260_1
	}

	local var_260_2 = {}

	table.insert(var_260_2, function(arg_262_0)
		arg_260_0:SetUI(arg_262_0, "blank")
	end)
	table.insertto(var_260_2, underscore.map(var_260_1, function(arg_263_0)
		return switch(arg_263_0.type, {
			function()
				return function(arg_265_0)
					local var_265_0 = unpack(arg_263_0.params)

					arg_260_0:DoTalk(var_265_0, arg_265_0, true)
				end
			end,
			function()
				return function(arg_267_0)
					arg_260_0.touchExitCall = arg_267_0

					arg_260_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_269_0)
					local var_269_0 = arg_260_0:GetCurrentLadyEnv()

					arg_260_0:PlaySingleAction(var_269_0, arg_263_0.name, arg_269_0)
				end
			end,
			function()
				return function(arg_271_0)
					arg_260_0:emit(arg_260_0.PLAY_EXPRESSION, arg_263_0)
					arg_271_0()
				end
			end,
			function()
				return function(arg_273_0)
					arg_260_0:ShiftZone(arg_263_0.name, arg_273_0)
				end
			end,
			function()
				return function(arg_275_0)
					arg_260_0.contextData.timeIndex = arg_263_0.params[1]

					local var_275_0 = arg_263_0.params[2] or false

					if Dorm3dSceneMgr.IsSameSceneInfo(arg_260_0.dormSceneMgr.artSceneInfo, arg_260_0.dormSceneMgr.sceneInfo) then
						arg_260_0:SwitchDayNight(arg_260_0.contextData.timeIndex)

						if var_275_0 then
							onNextTick(function()
								arg_260_0:RefreshSlots()
							end)
						end
					end

					arg_260_0:UpdateContactState()
					onNextTick(arg_275_0)
				end
			end,
			function()
				return function(arg_278_0)
					if arg_263_0.name then
						arg_260_0:ActiveCameraByName(arg_263_0.name)
						existCall(arg_278_0)
					else
						arg_260_0:ActiveStateCamera(arg_263_0.params[1], arg_278_0)
					end
				end
			end,
			function()
				return function(arg_280_0)
					if arg_263_0.name == "base" then
						arg_260_0:RevertArtScene(arg_260_0.dormSceneMgr.sceneInfo, arg_280_0)
					else
						local var_280_0 = arg_263_0.params.scene
						local var_280_1 = arg_263_0.params.sceneRoot

						arg_260_0:ChangeArtScene(var_280_0 .. "|" .. var_280_1, arg_280_0)
					end
				end
			end,
			function()
				return function(arg_282_0)
					local var_282_0 = arg_263_0.params.name

					if arg_263_0.name == "load" then
						local var_282_1 = tobool(arg_263_0.params.wait_timeline) and function(arg_283_0)
							arg_260_0.waitForTimeline = arg_283_0
						end

						arg_260_0:LoadTimelineScene(var_282_0, true, var_282_1, arg_282_0)
					elseif arg_263_0.name == "unload" then
						arg_260_0:UnloadTimelineScene(var_282_0, true, arg_282_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_285_0)
					setActive(arg_260_0.uiContainer:Find("walk/btn_back"), false)

					local var_285_0 = arg_260_0:GetCurrentLadyEnv()

					if arg_263_0.name == "change" then
						local var_285_1 = arg_263_0.params.scene
						local var_285_2 = arg_263_0.params.sceneRoot

						var_285_0.walkBornPoint = arg_263_0.params.point or "Default"

						arg_260_0:ChangeWalkScene(arg_263_0.name, var_285_1 .. "|" .. var_285_2, arg_285_0)
					elseif arg_263_0.name == "back" then
						var_285_0.walkBornPoint = nil

						arg_260_0:ChangeWalkScene(arg_263_0.name, arg_260_0.dormSceneMgr.sceneInfo, arg_285_0)
					elseif arg_263_0.name == "set" then
						local function var_285_3()
							local var_286_0 = arg_285_0

							arg_285_0 = nil

							return existCall(var_286_0)
						end

						for iter_285_0, iter_285_1 in pairs(arg_263_0.params) do
							switch(iter_285_0, {
								back_button_trigger = function(arg_287_0)
									onButton(arg_260_0, arg_260_0.uiContainer:Find("walk/btn_back"), var_285_3, SFX_DORM_BACK)
									setActive(arg_260_0.uiContainer:Find("walk/btn_back"), IsUnityEditor and arg_287_0)
								end,
								near_trigger = function(arg_288_0)
									if arg_288_0 == true then
										arg_288_0 = 1.5
									end

									if arg_288_0 then
										function arg_260_0.walkNearCallback(arg_289_0)
											if arg_289_0 < arg_288_0 then
												arg_260_0.walkNearCallback = nil

												var_285_3()
											end
										end
									else
										arg_260_0.walkNearCallback = nil
									end
								end
							}, nil, iter_285_1)
						end

						if arg_260_0.firstMoveGuide then
							setActive(arg_260_0.povLayer:Find("Guide"), arg_260_0.firstMoveGuide)

							arg_260_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_291_0)
					if arg_263_0.name == "set" then
						local var_291_0 = arg_260_0:GetCurrentLadyEnv()

						arg_260_0:SwitchIKConfig(var_291_0, arg_263_0.params.state)
						setActive(arg_260_0.uiContainer:Find("ik/btn_back"), not arg_263_0.params.hide_back)

						arg_260_0.ikSpecialCall = arg_291_0

						arg_260_0:SetIKState(true)
					elseif arg_263_0.name == "back" then
						local var_291_1 = arg_260_0:GetCurrentLadyEnv()

						var_291_1.ikConfig = arg_263_0.params

						arg_260_0:SetIKState(false, function()
							var_291_1.ikConfig = nil

							existCall(arg_291_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_294_0)
					arg_260_0.blackSceneInfo = setmetatable(arg_263_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_263_0.name == "show" and 0 or 0.5
						}
					})

					if arg_263_0.name == "show" then
						arg_260_0:ShowBlackScreen(true, arg_294_0)
					elseif arg_263_0.name == "hide" then
						arg_260_0:ShowBlackScreen(false, arg_294_0)
					else
						assert(false)
					end

					arg_260_0.blackSceneInfo = nil
				end
			end,
			function()
				return function(arg_296_0)
					local var_296_0 = arg_260_0:GetCurrentLadyEnv()

					if arg_263_0.name == "set" then
						arg_260_0.stockingMgr:SetStockingStatus(arg_263_0.params)
					elseif arg_263_0.name == "exit" then
						arg_260_0.stockingMgr:ExitStocking()
					end
				end
			end
		})
	end))
	table.insert(var_260_2, function(arg_297_0)
		arg_260_0:SetUI(arg_297_0, "back")

		arg_260_0.performanceInfo = nil
	end)
	seriesAsync(var_260_2, arg_260_2)
end

function var_0_0.TriggerContact(arg_298_0, arg_298_1)
	arg_298_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_298_1,
		roomId = arg_298_0.room:GetConfigID(),
		groupId = arg_298_0.room:isPersonalRoom() and arg_298_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_299_0)
	arg_299_0:SetContactStateDic(arg_299_0.room:getTriggerableCollectItemDic(arg_299_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_300_0)
	local var_300_0, var_300_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_300_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_300_0, var_300_1))
	setActive(arg_300_0.rtStaminaDisplay, false)

	if arg_300_0.apartment then
		setText(arg_300_0.rtFavorLevel:Find("rank/Text"), arg_300_0.apartment.level)

		local var_300_2, var_300_3 = arg_300_0.apartment:getFavor()
		local var_300_4 = arg_300_0.apartment:isMaxFavor()

		setActive(arg_300_0.rtFavorLevel:Find("Max"), var_300_4)
		setActive(arg_300_0.rtFavorLevel:Find("Text"), not var_300_4)
		setText(arg_300_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_300_2, var_300_3))
	end

	setActive(arg_300_0.rtFavorLevel:Find("red"), Dorm3dLevelLayer.IsShowRed())
end

function var_0_0.UpdateBtnState(arg_301_0)
	local var_301_0 = not arg_301_0.room:isPersonalRoom() or arg_301_0:CheckSystemOpen("Furniture")
	local var_301_1 = Dorm3dFurniture.IsTimelimitShopTip(arg_301_0.room:GetConfigID())

	setActive(arg_301_0.uiContainer:Find("base/left/btn_furniture/tipTimelimit"), var_301_0 and var_301_1)

	local var_301_2 = Dorm3dFurniture.NeedViewTip(arg_301_0.room:GetConfigID())

	setActive(arg_301_0.uiContainer:Find("base/left/btn_furniture/tip"), var_301_0 and not var_301_1 and var_301_2)
	setActive(arg_301_0.uiContainer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_302_0)
		return tobool(arg_302_0)
	end):any(function(arg_303_0)
		return #arg_303_0:getSpecialTalking() > 0 or arg_303_0:getIconTip() == "main"
	end):value())
	setActive(arg_301_0.uiContainer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_304_0, arg_304_1)
	table.insert(arg_304_0.unlockList, arg_304_1)

	if not isActive(arg_304_0.rtFavorUp) then
		setText(arg_304_0.rtFavorUp:Find("Text"), table.remove(arg_304_0.unlockList, 1))
		setActive(arg_304_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_305_0, arg_305_1)
	local var_305_0 = arg_305_1.triggerId
	local var_305_1 = arg_305_1.delta
	local var_305_2 = arg_305_1.cost
	local var_305_3 = arg_305_1.apartment
	local var_305_4 = pg.dorm3d_favor_trigger[var_305_0]

	if var_305_4.is_repeat == 0 then
		if var_305_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_305_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_305_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_305_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_305_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_305_0))
		end
	elseif arg_305_1.delta > 0 then
		local var_305_5, var_305_6 = var_305_3:getFavor()
		local var_305_7 = var_305_5 + var_305_1

		setText(arg_305_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=48>+%d</size>", math.min(9999, var_305_1)))
		setSlider(arg_305_0.rtFavorUpDaily:Find("bg/slider"), 0, var_305_6, var_305_5)
		setAnchoredPosition(arg_305_0.rtFavorUpDaily:Find("bg"), arg_305_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_305_8 = {}
		local var_305_9 = arg_305_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_305_9, function(arg_306_0)
			setActive(arg_306_0, false)
		end)

		local var_305_10

		if var_305_4.effect and var_305_4.effect ~= "" then
			var_305_10 = var_305_9:Find(var_305_4.effect .. "(Clone)")

			if not var_305_10 then
				table.insert(var_305_8, function(arg_307_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_308_0)
						setParent(arg_308_0, var_305_9)

						var_305_10 = tf(arg_308_0)

						arg_307_0()
					end)
				end)
			else
				setActive(var_305_10, true)
			end
		end

		local var_305_11 = arg_305_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_305_11:SetTriggerEvent(function(arg_309_0)
			local var_309_0 = GetComponent(arg_305_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_305_5, var_305_7, 0.5):setOnUpdate(System.Action_float(function(arg_310_0)
				var_309_0.value = arg_310_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_305_0.exited then
						return
					end

					quickPlayAnimator(arg_305_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_305_11:SetEndEvent(function(arg_313_0)
			setActive(arg_305_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_305_8, function()
			local var_314_0 = arg_305_0.ladyDict[var_305_3:GetConfigID()]

			setLocalPosition(arg_305_0.rtFavorUpDaily, arg_305_0:GetLocalPosition(arg_305_0:GetScreenPosition(var_314_0.ladyHeadCenter.position), arg_305_0.rtFavorUpDaily.parent))
			setActive(arg_305_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_305_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_305_0.rtFavorUpDaily, "favor_open")

			if var_305_2 > 0 then
				local var_314_1, var_314_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_305_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_305_2)
				setText(arg_305_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_314_1 + var_305_2, var_314_2))
				setActive(arg_305_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_315_0, arg_315_1, arg_315_2, arg_315_3)
	arg_315_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_315_0.isLock = false
	end))

	local var_315_0 = math.floor(arg_315_1.level / 10)
	local var_315_1 = math.fmod(arg_315_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_315_1, arg_315_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_315_0, arg_315_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_315_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_315_0 > 0)

	local var_315_2
	local var_315_3

	arg_315_0.clientAward, var_315_3 = Dorm3dIconHelper.SplitStory(arg_315_1:getFavorConfig("levelup_client_item", arg_315_1.level))
	arg_315_0.serverAward = arg_315_2

	local var_315_4 = arg_315_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_315_0.levelItemList then
		arg_315_0.levelItemList = UIItemList.New(var_315_4, var_315_4:Find("tpl"))

		arg_315_0.levelItemList:make(function(arg_317_0, arg_317_1, arg_317_2)
			local var_317_0 = arg_317_1 + 1

			if arg_317_0 == UIItemList.EventUpdate then
				if arg_317_1 < #arg_315_0.serverAward then
					updateDorm3dIcon(arg_317_2, arg_315_0.serverAward[var_317_0])
					onButton(arg_315_0, arg_317_2, function()
						arg_315_0:emit(BaseUI.ON_NEW_DROP, {
							style = "dorm",
							drop = arg_315_0.serverAward[var_317_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_317_2, arg_315_0.clientAward[var_317_0 - #arg_315_0.serverAward])
					onButton(arg_315_0, arg_317_2, function()
						arg_315_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_315_0.clientAward[var_317_0 - #arg_315_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_315_0.levelItemList:align(#arg_315_0.serverAward + #arg_315_0.clientAward)
	setActive(arg_315_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	arg_315_0:OverlayPanel(arg_315_0.rtLevelUpWindow)

	function arg_315_0.levelUpCallback()
		arg_315_0.levelUpCallback = nil

		if var_315_3 then
			arg_315_0:PopNewStoryTip(var_315_3)
		end

		existCall(arg_315_3)
	end
end

function var_0_0.PopNewStoryTip(arg_321_0, arg_321_1, arg_321_2)
	local var_321_0 = arg_321_0.uiContainer:Find("base/top/story_tip")

	setActive(var_321_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_321_0, false)
	end))
	setText(var_321_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_321_1[2]].name))
	existCall(arg_321_2)
end

function var_0_0.UpdateZoneList(arg_323_0)
	local var_323_0

	if arg_323_0.room:isPersonalRoom() then
		var_323_0 = arg_323_0:GetCurrentLadyEnv().ladyBaseZone
	else
		var_323_0 = arg_323_0:GetAttachedFurnitureName()
	end

	for iter_323_0, iter_323_1 in ipairs(arg_323_0.zoneDatas) do
		if iter_323_1:GetWatchCameraName() == var_323_0 then
			setText(arg_323_0.btnZone:Find("Text"), iter_323_1:GetName())
			setTextColor(arg_323_0.rtZoneList:GetChild(iter_323_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_323_0.rtZoneList:GetChild(iter_323_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_324_0, arg_324_1)
	local var_324_0 = {}
	local var_324_1 = {}
	local var_324_2 = arg_324_1.data

	if var_324_2.op_list then
		for iter_324_0, iter_324_1 in ipairs(var_324_2.op_list) do
			table.insert(var_324_0, function(arg_325_0)
				local function var_325_0()
					local var_326_0 = arg_325_0

					arg_325_0 = nil

					return existCall(var_326_0)
				end

				switch(iter_324_1.type, {
					action = function()
						local var_327_0 = arg_324_0:GetCurrentLadyEnv()

						arg_324_0:PlaySingleAction(var_327_0, iter_324_1.name, var_325_0)
					end,
					item_action = function()
						arg_324_0:PlaySceneItemAnim(iter_324_1.id, iter_324_1.name)
						var_325_0()
					end,
					extra_item_action = function()
						local var_329_0 = arg_324_0:GetCurrentLadyEnv().extraItems[iter_324_1.name]

						warning(iter_324_1.name)
						warning(var_329_0.trans)

						if var_329_0 then
							var_329_0.trans:GetComponent(typeof(Animator)):PlayInFixedTime(iter_324_1.param)
						end

						var_325_0()
					end,
					timeline = function()
						if arg_324_0.inTouchGame then
							setActive(arg_324_0.rtTouchGamePanel, false)
						end

						arg_324_0:PlayTimeline(iter_324_1, function(arg_331_0, arg_331_1)
							setActive(arg_324_0.rtTouchGamePanel, arg_324_0.inTouchGame)

							var_324_1.notifiCallback = arg_331_1

							var_325_0()
						end)
					end,
					clickOption = function()
						arg_324_0:DoTalkTouchOption(iter_324_1, arg_324_1.flags, function(arg_333_0)
							var_324_1.optionIndex = arg_333_0

							var_325_0()
						end)
					end,
					wait = function()
						arg_324_0.LTs = arg_324_0.LTs or {}

						table.insert(arg_324_0.LTs, LeanTween.delayedCall(iter_324_1.time, System.Action(var_325_0)).uniqueId)
					end,
					expression = function()
						arg_324_0:emit(arg_324_0.PLAY_EXPRESSION, iter_324_1)
						var_325_0()
					end
				}, function()
					assert(false, "op type error:", iter_324_1.type)
				end)

				if iter_324_1.skip then
					var_325_0()
				end
			end)
		end
	end

	seriesAsync(var_324_0, function()
		if arg_324_1.callbackData then
			arg_324_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_324_1.callbackData.name, var_324_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_338_0)
	if arg_338_0.inGuide or arg_338_0.uiState ~= "base" then
		return
	end

	if arg_338_0.room:GetConfigID() == 1 and arg_338_0:CheckGuide() then
		-- block empty
	elseif arg_338_0.room:isPersonalRoom() and arg_338_0:CheckLevelUp() then
		-- block empty
	elseif arg_338_0.apartment and arg_338_0:CheckEnterDeal() then
		-- block empty
	elseif arg_338_0.apartment and arg_338_0:CheckActiveTalk() then
		-- block empty
	elseif arg_338_0.apartment then
		arg_338_0:CheckFavorTrigger()
	end

	arg_338_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_339_0)
	local var_339_0

	if arg_339_0.contextData.specialId then
		var_339_0 = arg_339_0.contextData.specialId
		arg_339_0.contextData.specialId = nil

		arg_339_0:DoTalk(var_339_0, function()
			arg_339_0:closeView()
		end)

		if arg_339_0.contextData.isVideoTalk then
			arg_339_0.contextData.hasEnterCheck = true
		end
	elseif not arg_339_0.contextData.hasEnterCheck and arg_339_0.apartment then
		for iter_339_0, iter_339_1 in ipairs(arg_339_0.apartment:getForceEnterTalking(arg_339_0.room:GetConfigID())) do
			var_339_0 = iter_339_1

			arg_339_0:DoTalk(iter_339_1)

			break
		end
	end

	if var_339_0 and pg.dorm3d_dialogue_group[var_339_0].extend_loading > 0 then
		arg_339_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_339_0:FinishEnterResume()
		end)
	else
		if arg_339_0.apartment and arg_339_0.contextData.pendingDic[arg_339_0.apartment:GetConfigID()] then
			arg_339_0.contextData.hasEnterCheck = true
		end

		for iter_339_2, iter_339_3 in pairs(arg_339_0.contextData.pendingDic) do
			arg_339_0:SetInPending(arg_339_0.ladyDict[iter_339_2], iter_339_3)
		end

		arg_339_0.contextData.pendingDic = {}

		arg_339_0:FinishEnterResume()
		arg_339_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_342_0)
	if arg_342_0:GetBlackboardValue(arg_342_0:GetCurrentLadyEnv(), "inPending") then
		return
	end

	for iter_342_0, iter_342_1 in ipairs({
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
				return arg_342_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_342_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_342_1.name) and iter_342_1.active() then
			arg_342_0:SetAllBlackbloardValue("inGuide", true)

			local function var_342_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_342_1.name)))
				arg_342_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_342_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_342_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_342_1.name, nil, var_342_0, var_342_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_348_0)
	for iter_348_0, iter_348_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_349_0 = getProxy(CollectionProxy):getShipGroup(arg_348_0.apartment.configId)

				return tobool(var_349_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_350_0 = getProxy(CollectionProxy):getShipGroup(arg_348_0.apartment.configId)

				return var_350_0 and var_350_0.married > 0
			end
		}
	}) do
		if arg_348_0.apartment.triggerCountDic[iter_348_1.triggerId] == 0 and iter_348_1.active() then
			arg_348_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_348_0.apartment.configId, iter_348_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_351_0)
	if arg_351_0.contextData.hasEnterCheck then
		return false
	end

	local var_351_0 = arg_351_0.apartment:GetConfigID()
	local var_351_1 = "dorm3d_enter_count_" .. var_351_0
	local var_351_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_351_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_351_2)
		PlayerPrefs.SetInt(var_351_1, 1)
	else
		PlayerPrefs.SetInt(var_351_1, PlayerPrefs.GetInt(var_351_1, 0) + 1)
	end

	local var_351_3 = arg_351_0.apartment:getEnterTalking(arg_351_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_351_3 > 0 then
		arg_351_0:DoTalk(var_351_3[math.random(#var_351_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_352_0)
	local var_352_0 = arg_352_0:GetCurrentLadyEnv()

	if arg_352_0:GetBlackboardValue(var_352_0, "inPending") then
		return false
	end

	local var_352_1 = arg_352_0.apartment:getZoneTalking(arg_352_0.room:GetConfigID(), var_352_0.ladyBaseZone)

	if #var_352_1 > 0 then
		arg_352_0:DoTalk(var_352_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_353_0, arg_353_1, arg_353_2)
	local var_353_0 = arg_353_0.ladyDict[arg_353_1].ladyBaseZone
	local var_353_1 = getProxy(ApartmentProxy):getApartment(arg_353_1)

	for iter_353_0, iter_353_1 in ipairs(var_353_1:getDistanceTalking(arg_353_0.room:GetConfigID(), var_353_0)) do
		arg_353_0:DoTalk(iter_353_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_354_0, arg_354_1)
	if arg_354_0.room:isPersonalRoom() then
		return switch(arg_354_1, {
			Talk = function()
				local var_355_0 = 1

				return var_355_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_355_0)
			end,
			Touch = function()
				local var_356_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_356_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_356_0)
			end,
			Gift = function()
				local var_357_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_357_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_357_0)
			end,
			PublicGame = function()
				return false
			end,
			Photo = function()
				local var_359_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_359_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_359_0)
			end,
			Collection = function()
				local var_360_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_360_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_360_0)
			end,
			Furniture = function()
				local var_361_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_361_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_361_0)
			end,
			DayNight = function()
				local var_362_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_362_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_362_0)
			end,
			Accompany = function()
				local var_363_0 = 1

				return var_363_0 <= arg_354_0.apartment.level, i18n("apartment_level_unenough", var_363_0)
			end,
			MiniGame = function()
				local var_364_0 = 1

				if var_364_0 > arg_354_0.apartment.level then
					return false, i18n("apartment_level_unenough", var_364_0)
				elseif #arg_354_0.room:getMiniGames() <= 0 then
					return false, "without minigame config in room:" .. arg_354_0.room.configId
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
		return switch(arg_354_1, {
			Gift = function()
				return false
			end,
			PublicGame = function()
				return true
			end,
			Furniture = function()
				local var_370_0 = #arg_354_0.room:GetFurnitures() > 0
				local var_370_1 = #_.filter(arg_354_0.room:GetFurnitureIDList() or {}, function(arg_371_0)
					return Dorm3dFurniture.New({
						configId = arg_371_0
					}):InShopTime()
				end) > 0

				return var_370_0 or var_370_1
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

function var_0_0.CheckLevelUp(arg_377_0)
	if arg_377_0.apartment:canLevelUp() then
		arg_377_0:emit(Dorm3dRoomMediator.FAVOR_LEVEL_UP, arg_377_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetIKHandTF(arg_378_0)
	return arg_378_0.ikHand
end

function var_0_0.CycleIKCameraGroup(arg_379_0)
	local var_379_0 = arg_379_0:GetCurrentLadyEnv()

	assert(arg_379_0:GetBlackboardValue(var_379_0, "inIK"))
	seriesAsync({
		function(arg_380_0)
			pg.IKMgr.GetInstance():ResetActiveIKs()

			local var_380_0 = var_379_0.ikConfig
			local var_380_1 = var_380_0.camera_group
			local var_380_2 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_380_1]
			local var_380_3 = var_380_2[table.indexof(var_380_2, var_380_0.id) % #var_380_2 + 1]

			arg_379_0:SwitchIKConfig(var_379_0, var_380_3)
			arg_379_0:SetIKState(true)
		end
	})
end

function var_0_0.TempHideUI(arg_381_0, arg_381_1, arg_381_2)
	local var_381_0 = defaultValue(arg_381_0.hideCount, 0)

	arg_381_0.hideCount = var_381_0 + (arg_381_1 and 1 or -1)

	assert(arg_381_0.hideCount >= 0)

	if arg_381_0.hideCount * var_381_0 > 0 then
		return existCall(arg_381_2)
	elseif arg_381_0.hideCount > 0 then
		arg_381_0:SetUI(arg_381_2, "blank")
	else
		arg_381_0:SetUI(arg_381_2, "back")
	end
end

function var_0_0.onBackPressed(arg_382_0)
	if arg_382_0.exited or arg_382_0.retainCount > 0 then
		-- block empty
	elseif isActive(arg_382_0.rtLevelUpWindow) then
		triggerButton(arg_382_0.rtLevelUpWindow:Find("bg"))
	elseif arg_382_0.uiState ~= "base" then
		-- block empty
	else
		arg_382_0:closeView()
	end
end

function var_0_0.willExit(arg_383_0)
	if arg_383_0.downTimer then
		arg_383_0.downTimer:Stop()

		arg_383_0.downTimer = nil
	end

	if arg_383_0.LTs then
		underscore.map(arg_383_0.LTs, function(arg_384_0)
			LeanTween.cancel(arg_384_0)
		end)

		arg_383_0.LTs = nil
	end

	if arg_383_0.sliderLT then
		LeanTween.cancel(arg_383_0.sliderLT)

		arg_383_0.sliderLT = nil
	end

	for iter_383_0, iter_383_1 in pairs(arg_383_0.ladyDict) do
		iter_383_1.wakeUpTalkId = nil
	end

	if arg_383_0.accompanyFavorTimer then
		arg_383_0.accompanyFavorTimer:Stop()

		arg_383_0.accompanyFavorTimer = nil
	end

	if arg_383_0.accompanyPerformanceTimer then
		arg_383_0.accompanyPerformanceTimer:Stop()

		arg_383_0.accompanyPerformanceTimer = nil
	end

	arg_383_0.canTriggerAccompanyPerformance = nil

	arg_383_0.videoPlayer:Destroy()
	var_0_0.super.willExit(arg_383_0)
end

return var_0_0
