local var_0_0 = class("Dorm3dRoomScene", import("view.dorm3d.Dorm3dRoomTemplateScene"))

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

	Shader.SetGlobalFloat("_ScreenClipOff", 1)

	arg_4_0.uiContianer = arg_4_0._tf:Find("UI")

	local var_4_0 = arg_4_0.uiContianer:Find("base")

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
	onButton(arg_4_0, var_4_0:Find("left/btn_photograph"), function()
		if #arg_4_0.contextData.groupIds == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_photo_no_role"))

			return
		end

		local var_8_0, var_8_1 = arg_4_0:CheckSystemOpen("Photo")

		if not var_8_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_8_1)

			return
		end

		if not arg_4_0.apartment then
			local var_8_2 = arg_4_0.contextData.groupIds[1]

			for iter_8_0, iter_8_1 in pairs(arg_4_0.ladyDict) do
				if iter_8_1.ladyBaseZone == arg_4_0:GetAttachedFurnitureName() then
					var_8_2 = iter_8_0

					break
				end
			end

			arg_4_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_8_2))
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
		local var_10_0, var_10_1 = arg_4_0:CheckSystemOpen("Collection")

		if not var_10_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_10_1)

			return
		end

		setActive(var_4_0:Find("left/btn_collection/tip"), false)
		PlayerPrefs.SetInt("apartment_collection_item", 0)
		PlayerPrefs.SetInt("apartment_collection_recall", 0)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_COLLECTION_LAYER, arg_4_0.room:GetConfigID())
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("left/btn_furniture"), function()
		local var_11_0, var_11_1 = arg_4_0:CheckSystemOpen("Furniture")

		if not var_11_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_11_1)

			return
		end

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
		local var_12_0, var_12_1 = arg_4_0:CheckSystemOpen("Accompany")

		if not var_12_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_12_1)

			return
		end

		local var_12_2 = arg_4_0.apartment:GetConfigID()
		local var_12_3

		arg_4_0:emit(Dorm3dRoomMediator.OPEN_ACCOMPANY_WINDOW, {
			groupId = var_12_2,
			confirmFunc = function(arg_13_0)
				var_12_3 = arg_13_0
			end
		}, function()
			if var_12_3 then
				arg_4_0:OutOfLazy(var_12_2, function()
					arg_4_0:EnterAccompanyMode(var_12_3)
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
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_SKIN_SELECT_LAYER, arg_4_0.apartment:GetConfigID(), arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()], nil, function()
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
	UIItemList.StaticAlign(arg_4_0.rtZoneList, arg_4_0.rtZoneList:GetChild(0), #arg_4_0.zoneDatas, function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_20_1 = arg_20_1 + 1

		local var_20_0 = arg_4_0.zoneDatas[arg_20_1]
		local var_20_1 = var_20_0:GetWatchCameraName()

		arg_20_2.name = var_20_1

		setText(arg_20_2:Find("Name"), var_20_0:GetName())
		setActive(arg_20_2:Find("Line"), arg_20_1 < #arg_4_0.zoneDatas)
		onButton(arg_4_0, arg_20_2, function()
			if arg_4_0.uiState ~= "base" then
				return
			end

			setActive(arg_4_0.rtZoneList, false)

			local var_21_0 = {}

			if arg_4_0.room:isPersonalRoom() and not arg_4_0:GetBlackboardValue(arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()], "inPending") then
				table.insert(var_21_0, function(arg_22_0)
					arg_4_0:OutOfLazy(arg_4_0.apartment:GetConfigID(), arg_22_0)
				end)
			end

			table.insert(var_21_0, function(arg_23_0)
				arg_4_0:ShiftZone(var_20_1, arg_23_0)
			end)
			seriesAsync(var_21_0, function()
				arg_4_0:CheckQueue()
			end)
		end, SFX_PANEL)
	end)

	local var_4_2 = arg_4_0.uiContianer:Find("walk")
	local var_4_3 = arg_4_0.uiContianer:Find("ik")

	onButton(arg_4_0, var_4_3:Find("btn_back"), function()
		if arg_4_0.ikSpecialCall then
			local var_25_0 = arg_4_0.ikSpecialCall

			arg_4_0.ikSpecialCall = nil

			existCall(var_25_0)
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
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_SKIN_SELECT_LAYER, arg_4_0.apartment:GetConfigID(), arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()], function(arg_32_0, arg_32_1, arg_32_2)
			seriesAsync({
				function(arg_33_0)
					arg_4_0:SetIKState(false, arg_33_0)
				end,
				function(arg_34_0)
					arg_32_0:SwitchCharacterSkin(arg_32_1, arg_32_2)
					arg_4_0:SwitchIKConfig(arg_32_0, arg_32_0.ikConfig.id)
					arg_4_0:SetIKState(true, arg_34_0)
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
	eachChild(arg_4_0.ikHand, function(arg_36_0)
		setActive(arg_36_0, false)
	end)

	arg_4_0.ikTextTipsRoot = var_4_4:Find("TextTips")

	setActive(arg_4_0.ikTextTipsRoot, false)
	eachChild(arg_4_0.ikTextTipsRoot, function(arg_37_0)
		setActive(arg_37_0, false)
	end)

	arg_4_0.ikControlUI = var_4_4

	local var_4_5 = arg_4_0.uiContianer:Find("accompany")

	onButton(arg_4_0, var_4_5:Find("btn_back"), function()
		arg_4_0:ExitAccompanyMode()
	end, SFX_DORM_BACK)

	arg_4_0.unlockList = {}
	arg_4_0.rtFavorUp = arg_4_0._tf:Find("Toast/favor_up")

	arg_4_0.rtFavorUp:GetComponent("DftAniEvent"):SetEndEvent(function(arg_39_0)
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

	var_4_6:SetTriggerEvent(function(arg_40_0)
		local var_40_0, var_40_1 = getProxy(ApartmentProxy):getStamina()

		setText(arg_4_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_40_0, var_40_1))
	end)
	var_4_6:SetEndEvent(function(arg_41_0)
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
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0.rtLevelUpWindow, arg_4_0._tf)
			existCall(arg_4_0.levelUpCallback)
		end))
	end, SFX_PANEL)

	local var_4_7 = arg_4_0.uiContianer:Find("watch")

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
	arg_4_0.rtRole = arg_4_0.uiContianer:Find("watch/Role")

	onButton(arg_4_0, arg_4_0.rtRole:Find("Talk"), function()
		local var_46_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()].ladyBaseZone
		local var_46_1 = arg_4_0.apartment:getFurnitureTalking(arg_4_0.room:GetConfigID(), var_46_0)

		if #var_46_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without topic")

			return
		end

		arg_4_0:DoTalk(var_46_1[math.random(#var_46_1)], function()
			local var_47_0 = getDorm3dGameset("drom3d_favir_trigger_talk")[1]

			arg_4_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_4_0.apartment.configId, var_47_0)
		end)
	end, SFX_DORM_CLICK)
	setText(arg_4_0.rtRole:Find("Talk/bg/Text"), i18n("dorm3d_talk"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Touch"), function()
		getProxy(Dorm3dChatProxy):TriggerEvent({
			{
				value = 1,
				event_type = arg_4_0.contextData.timeIndex == 1 and 111 or 116,
				ship_id = arg_4_0.apartment:GetConfigID()
			},
			{
				value = 1,
				event_type = 156,
				ship_id = arg_4_0.apartment:GetConfigID()
			}
		})
		arg_4_0:EnterTouchPerformance()
	end, SFX_DORM_CLICK)
	setText(arg_4_0.rtRole:Find("Touch/bg/Text"), i18n("dorm3d_touch"))
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

		local var_51_0 = pg.dorm3d_minigame[arg_4_0.nowMiniGameId]
		local var_51_1 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

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

		local var_51_2 = {}

		table.insert(var_51_2, function(arg_52_0)
			arg_4_0:SetAllBlackbloardValue("inLockLayer", true)
			arg_4_0:TempHideUI(true, arg_52_0)
		end)

		if var_51_0.area ~= "" and var_51_1.ladyBaseZone ~= var_51_0.area then
			table.insert(var_51_2, function(arg_53_0)
				arg_4_0:ShiftZone(var_51_0.area, arg_53_0)
			end)
		end

		local var_51_3
		local var_51_4

		if var_51_0.action ~= "" then
			var_51_3, var_51_4 = unpack(var_51_0.action)
		end

		table.insert(var_51_2, function(arg_54_0)
			parallelAsync({
				function(arg_55_0)
					if var_51_3 then
						arg_4_0:PlaySingleAction(var_51_1, var_51_3, arg_55_0)
					else
						arg_55_0()
					end
				end,
				function(arg_56_0)
					arg_4_0:ActiveStateCamera("talk", arg_56_0)
				end
			}, arg_54_0)
		end)
		table.insert(var_51_2, function(arg_57_0)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(1))
			arg_4_0:HandleGameNotification(Dorm3dMiniGameMediator.OPERATION, {
				operationCode = "BEFORE_OPEN_GAME",
				miniGameId = arg_4_0.nowMiniGameId
			})
			arg_4_0:EnableMiniGameCutIn()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_MINIGAME_WINDOW, {
				isDorm3d = true,
				minigameId = arg_4_0.nowMiniGameId
			}, arg_57_0)
		end)
		table.insert(var_51_2, function(arg_58_0)
			arg_4_0:DisableMiniGameCutIn()

			if var_51_4 then
				arg_4_0:PlaySingleAction(var_51_1, var_51_4, arg_58_0)
			else
				arg_58_0()
			end
		end)
		seriesAsync(var_51_2, function()
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

	eachChild(var_4_8, function(arg_68_0)
		setActive(arg_68_0, arg_68_0.name == "walk")
	end)

	arg_4_0._joystick = arg_4_0._tf:Find("Stick")

	setActive(arg_4_0._joystick, false)
	arg_4_0._joystick:GetComponent(typeof(SlideController)):SetStickFunc(function(arg_69_0)
		arg_4_0:emit(arg_4_0.ON_STICK_MOVE, arg_69_0)
	end)

	arg_4_0.povLayer = arg_4_0._tf:Find("POVControl")

	setActive(arg_4_0.povLayer, false)
	;(function()
		local var_70_0 = arg_4_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

		var_70_0:AddBeginDragFunc(function(arg_71_0, arg_71_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_BEGIN, arg_71_1)
		end)
		var_70_0:SetStickFunc(function(arg_72_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE, arg_72_0)
		end)
		var_70_0:AddDragEndFunc(function(arg_73_0, arg_73_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_END, arg_73_1)
		end)
		arg_4_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_74_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_VIEW, arg_74_0)
		end)
	end)()

	arg_4_0.ikControlLayer = var_4_4:Find("ControlLayer")

	;(function()
		local var_75_0
		local var_75_1 = arg_4_0.ikControlLayer:GetComponent(typeof(SlideController))

		var_75_1:AddBeginDragFunc(function(arg_76_0, arg_76_1)
			local var_76_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if not var_76_0.IKSettings then
				return
			end

			local var_76_1 = arg_76_1.position
			local var_76_2 = CameraMgr.instance:Raycast(var_76_0.IKSettings.CameraRaycaster, var_76_1)

			if var_76_2.Length ~= 0 then
				local var_76_3 = var_76_2[0].gameObject.transform
				local var_76_4 = table.keyof(var_76_0.IKSettings.Colliders, var_76_3)

				warning(var_76_3, var_76_4)

				if var_76_4 then
					arg_4_0:emit(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, var_76_0, var_76_4, var_76_1)

					var_75_0 = tobool(var_76_0.ikHandler)

					return
				end
			end
		end)
		var_75_1:AddDragFunc(function(arg_77_0, arg_77_1)
			local var_77_0 = arg_77_1.position
			local var_77_1 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_77_1.ikHandler then
				arg_4_0:emit(var_0_0.ON_DRAG_CHARACTER_BODY, var_77_1, var_77_0)

				return
			end

			if var_75_0 then
				return
			end

			local var_77_2 = arg_77_1.delta

			arg_4_0:emit(arg_4_0.ON_STICK_MOVE, var_77_2)
		end)
		var_75_1:AddDragEndFunc(function(arg_78_0, arg_78_1)
			var_75_0 = nil

			local var_78_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_78_0.ikHandler then
				arg_4_0:emit(var_0_0.ON_RELEASE_CHARACTER_BODY, var_78_0)

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

function var_0_0.InitExtraSystem(arg_80_0, arg_80_1)
	arg_80_1 = arg_80_1 or {
		"FurnitureSlide"
	}

	for iter_80_0, iter_80_1 in ipairs(arg_80_1) do
		switch(iter_80_1, {
			FurnitureSlide = function()
				if not SlideExtraSystem.IsOpen(arg_80_0.room) then
					return
				end

				arg_80_0:emit(Dorm3dRoomMediator.ADD_EXTRA_SYSTEM_FURNITURE_SLIDE, {
					scene = arg_80_0
				})
			end
		})
	end
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
		local var_91_0 = arg_82_0.ladyDict[arg_82_0.apartment:GetConfigID()]

		if not arg_82_0:GetBlackboardValue(var_91_0, "inIK") then
			return
		end

		arg_82_0:OnTouchCharacterBody(arg_91_1)
	end)
	arg_82_0:bind(var_0_0.ON_IK_STATUS_CHANGED, function(arg_92_0, arg_92_1, arg_92_2)
		local var_92_0 = arg_82_0.ladyDict[arg_82_0.apartment:GetConfigID()]

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
	arg_95_0:InitExtraSystem()

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

	arg_101_0.uiStore = {}

	eachChild(arg_101_0.uiContianer, function(arg_102_0)
		setActive(arg_102_0, arg_102_0.name == arg_101_0.uiState)
	end)
	arg_101_0:EnablePOVLayer(arg_101_0.uiState == "base" or arg_101_0.uiState == "walk")
	arg_101_0:TempHideContact(arg_101_0.uiState ~= "base")
	arg_101_0:SetFloatEnable(arg_101_0.uiState == "walk")
	setActive(arg_101_0.rtFloatPage, arg_101_0.uiState == "walk")
	setActive(arg_101_0.ikControlUI, arg_101_0.uiState == "ik")
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
				end))

				var_104_1 = var_104_1 + 0.066
			end

			setActive(arg_101_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_101_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_101_0.uiContianer:Find("ik/Right/MenuSmall"), arg_101_0.room:isPersonalRoom() and not arg_101_0.performanceInfo)
			setActive(arg_101_0.uiContianer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_101_0.uiContianer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_101_0.apartment:getConfig("name")))
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

function var_0_0.EnterWatchMode(arg_111_0)
	local var_111_0 = arg_111_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_112_0)
			arg_111_0:emit(arg_111_0.SHOW_BLOCK)
			arg_111_0:SetBlackboardValue(arg_111_0.ladyDict[var_111_0], "inWatchMode", true)
			arg_111_0:SetUI(arg_112_0, "watch")
		end,
		function(arg_113_0)
			arg_111_0:emit(arg_111_0.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_114_0)
	local var_114_0 = arg_114_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_115_0)
			arg_114_0:emit(arg_114_0.SHOW_BLOCK)
			arg_114_0:SetUI(arg_115_0, "back")
		end,
		function(arg_116_0)
			arg_114_0:SetBlackboardValue(arg_114_0.ladyDict[var_114_0], "inWatchMode", false)
			arg_114_0:emit(arg_114_0.HIDE_BLOCK)
			arg_114_0:CheckQueue()
		end
	})
end

function var_0_0.SetInPending(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = arg_117_0:GetBlackboardValue(arg_117_1, "groupId")
	local var_117_1 = pg.dorm3d_welcome[arg_117_2]

	arg_117_0:SetBlackboardValue(arg_117_1, "inPending", true)
	arg_117_0:ChangeCanWatchState(arg_117_1)
	arg_117_0:EnableHeadIK(arg_117_1, false)

	arg_117_0.contextData.ladyZone[var_117_0] = var_117_1.area
	arg_117_1.ladyBaseZone = arg_117_0.contextData.ladyZone[var_117_0]
	arg_117_1.ladyActiveZone = var_117_1.welcome_staypoint

	arg_117_0:ChangeCharacterPosition(arg_117_1)

	if var_117_1.item_shield ~= "" then
		arg_117_0.hideItemDic = {}

		for iter_117_0, iter_117_1 in ipairs(var_117_1.item_shield) do
			local var_117_2 = arg_117_0.modelRoot:Find(iter_117_1)

			if not var_117_2 then
				warning(string.format("welcome:%d without hide item:%s", arg_117_2, iter_117_1))
			else
				arg_117_0.hideItemDic[iter_117_1] = isActive(var_117_2)

				setActive(var_117_2, false)
			end
		end
	end

	onNextTick(function()
		if arg_117_1.tfPendintItem then
			setActive(arg_117_1.tfPendintItem, true)
		end

		arg_117_0:SwitchAnim(arg_117_1, var_117_1.welcome_idle)
	end)

	arg_117_0.wakeUpTalkId = var_117_1.welcome_talk
end

function var_0_0.SetOutPending(arg_119_0, arg_119_1)
	arg_119_0:SetBlackboardValue(arg_119_1, "inPending", false)
	arg_119_0:ChangeCanWatchState(arg_119_1)
	arg_119_0:EnableHeadIK(arg_119_1, true)

	arg_119_0.wakeUpTalkId = nil

	if arg_119_1.tfPendintItem then
		setActive(arg_119_1.tfPendintItem, false)
	end

	if arg_119_0.hideItemDic then
		for iter_119_0, iter_119_1 in pairs(arg_119_0.hideItemDic) do
			setActive(arg_119_0.modelRoot:Find(iter_119_0), iter_119_1)
		end

		arg_119_0.hideItemDic = nil
	end
end

function var_0_0.IsModeInHidePending(arg_120_0, arg_120_1)
	for iter_120_0, iter_120_1 in pairs(arg_120_0.ladyDict) do
		if iter_120_1.hideItemDic and iter_120_1.hideItemDic[arg_120_1] ~= nil then
			return true
		end
	end

	return false
end

function var_0_0.EnterAccompanyMode(arg_121_0, arg_121_1)
	local var_121_0 = pg.dorm3d_accompany[arg_121_1]
	local var_121_1
	local var_121_2

	if var_121_0.sceneInfo ~= "" then
		var_121_1, var_121_2 = unpack(string.split(var_121_0.sceneInfo, "|"))
	end

	local var_121_3 = {
		type = "timeline",
		name = var_121_0.timeline,
		scene = var_121_1,
		sceneRoot = var_121_2,
		accompanys = {}
	}

	for iter_121_0, iter_121_1 in ipairs(var_121_0.jump_trigger) do
		local var_121_4, var_121_5 = unpack(iter_121_1)

		var_121_3.accompanys[var_121_4] = var_121_5
	end

	local var_121_6, var_121_7 = unpack(var_121_0.favor)

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = 161,
			ship_id = arg_121_0.apartment:GetConfigID()
		}
	})
	getProxy(ApartmentProxy):RecordAccompanyTime()
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(1, var_121_0.ship_id, var_121_0.performance_time, 0, var_121_1 or arg_121_0.dormSceneMgr.artSceneInfo))

	local var_121_8 = {}

	table.insert(var_121_8, function(arg_122_0)
		arg_121_0:SetUI(arg_122_0, "blank", "accompany")
	end)
	table.insert(var_121_8, function(arg_123_0)
		arg_121_0.accompanyFavorCount = 0
		arg_121_0.accompanyFavorTimer = Timer.New(function()
			arg_121_0.accompanyFavorCount = arg_121_0.accompanyFavorCount + 1
		end, var_121_6, -1)

		arg_121_0.accompanyFavorTimer:Start()

		arg_121_0.accompanyPerformanceTimer = Timer.New(function()
			arg_121_0.canTriggerAccompanyPerformance = true
		end, var_121_0.performance_time, -1)

		arg_121_0.accompanyPerformanceTimer:Start()
		arg_121_0:PlayTimeline(var_121_3, function(arg_126_0, arg_126_1)
			arg_126_1()
			arg_123_0()
		end)
	end)
	seriesAsync(var_121_8, function()
		assert(arg_121_0.accompanyFavorTimer)
		arg_121_0.accompanyFavorTimer:Stop()

		arg_121_0.accompanyFavorTimer = nil

		assert(arg_121_0.accompanyPerformanceTimer)
		arg_121_0.accompanyPerformanceTimer:Stop()

		arg_121_0.accompanyPerformanceTimer = nil
		arg_121_0.canTriggerAccompanyPerformance = nil

		local var_127_0 = math.min(arg_121_0.accompanyFavorCount, getProxy(ApartmentProxy):getStamina())

		if var_127_0 > 0 then
			local var_127_1 = var_121_7[var_127_0]

			warning(var_127_1)
			arg_121_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_121_0.apartment.configId, var_127_1)
		end

		local var_127_2 = 0
		local var_127_3 = getProxy(ApartmentProxy):GetAccompanyTime()

		if var_127_3 then
			var_127_2 = pg.TimeMgr.GetInstance():GetServerTime() - var_127_3
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(2, var_121_0.ship_id, var_121_0.performance_time, var_127_2, var_121_1 or arg_121_0.dormSceneMgr.artSceneInfo))
		arg_121_0:SetUI(nil, "back", "back")
	end)
end

function var_0_0.ExitAccompanyMode(arg_128_0)
	existCall(arg_128_0.timelineFinishCall)
end

function var_0_0.EnterTouchPerformance(arg_129_0)
	local var_129_0 = arg_129_0.ladyDict[arg_129_0.apartment:GetConfigID()]
	local var_129_1 = arg_129_0.room:getApartmentZoneConfig(var_129_0.ladyBaseZone, "touch_performance", arg_129_0.apartment:GetConfigID())

	if not var_129_1 or var_129_1 == 0 then
		arg_129_0:EnterTouchMode()
	else
		arg_129_0:DoTalk(var_129_1)
	end
end

function var_0_0.EnterTouchMode(arg_130_0)
	local var_130_0 = arg_130_0.ladyDict[arg_130_0.apartment:GetConfigID()]

	if arg_130_0:GetBlackboardValue(var_130_0, "inTouching") then
		return
	end

	local var_130_1 = arg_130_0.room:getApartmentZoneConfig(var_130_0.ladyBaseZone, "touch_id", arg_130_0.apartment:GetConfigID())

	arg_130_0.touchConfig = pg.dorm3d_touch_data[var_130_1]

	if not arg_130_0.touchConfig then
		arg_130_0:EnterTimelineTouchMode()

		return
	end

	arg_130_0.inTouchGame = arg_130_0.touchConfig.heartbeat_enable > 0

	setActive(arg_130_0.rtTouchGamePanel, arg_130_0.inTouchGame)

	if arg_130_0.inTouchGame then
		arg_130_0.touchCount = 0
		arg_130_0.touchLevel = 1
		arg_130_0.lastCount = 0
		arg_130_0.topCount = 0

		arg_130_0:UpdateTouchGameDisplay()
		setSlider(arg_130_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_130_0.touchCount >= 200 and 100 or arg_130_0.touchCount % 100)
		quickPlayAnimation(arg_130_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_130_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_130_0.downTimer = Timer.New(function()
			local var_131_0 = pg.dorm3d_set.reduce_interaction.key_value_int

			if arg_130_0.touchLevel > 1 then
				var_131_0 = pg.dorm3d_set.reduce_heartbeat.key_value_int
			end

			arg_130_0:UpdateTouchCount(var_131_0)
		end, 1, -1)

		arg_130_0.downTimer:Start()
	end

	local var_130_2 = {}

	table.insert(var_130_2, function(arg_132_0)
		arg_130_0:SetBlackboardValue(var_130_0, "inTouching", true)
		arg_130_0:emit(arg_130_0.SHOW_BLOCK)
		arg_130_0:SetUI(arg_132_0, "blank")
	end)
	table.insert(var_130_2, function(arg_133_0)
		local var_133_0 = arg_130_0.touchConfig.ik_status[1]

		arg_130_0:SwitchIKConfig(var_130_0, var_133_0)
		setActive(arg_130_0.uiContianer:Find("ik/btn_back"), true)
		arg_130_0:SetIKState(true, arg_133_0)
	end)
	table.insert(var_130_2, function(arg_134_0)
		existCall(arg_134_0)
	end)
	seriesAsync(var_130_2, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_130_0:emit(arg_130_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_136_0)
	local var_136_0 = arg_136_0.ladyDict[arg_136_0.apartment:GetConfigID()]

	if not arg_136_0:GetBlackboardValue(var_136_0, "inTouching") then
		return
	end

	if arg_136_0.touchTimelineConfig then
		existCall(arg_136_0.timelineFinishCall)

		return
	end

	local var_136_1 = {}

	if arg_136_0.inTouchGame then
		table.insert(var_136_1, function(arg_137_0)
			arg_136_0:emit(arg_136_0.SHOW_BLOCK)
			quickPlayAnimation(arg_136_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_137_0, 0.5)
		end)
		table.insert(var_136_1, function(arg_138_0)
			local var_138_0 = 0

			for iter_138_0, iter_138_1 in ipairs(arg_136_0.touchConfig.heartbeat_favor) do
				if iter_138_1[1] > arg_136_0.topCount then
					break
				else
					var_138_0 = iter_138_1[2]
				end
			end

			if var_138_0 > 0 then
				arg_136_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_136_0.apartment.configId, var_138_0)
			end

			arg_136_0.touchCount = nil
			arg_136_0.touchLevel = nil
			arg_136_0.topCount = nil

			if arg_136_0.downTimer then
				arg_136_0.downTimer:Stop()

				arg_136_0.downTimer = nil
			end

			arg_136_0.inTouchGame = false

			setActive(arg_136_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_138_0()
		end)
	else
		table.insert(var_136_1, function(arg_139_0)
			arg_136_0:emit(arg_136_0.SHOW_BLOCK)

			local var_139_0 = arg_136_0.touchConfig.default_favor

			if var_139_0 > 0 then
				arg_136_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_136_0.apartment.configId, var_139_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_139_0()
		end)
	end

	table.insert(var_136_1, function(arg_140_0)
		var_136_0.ikConfig = {
			character_position = var_136_0.ladyBaseZone,
			character_action = arg_136_0.touchConfig.finish_action
		}

		arg_136_0:SetIKState(false, arg_140_0)
	end)
	table.insert(var_136_1, function(arg_141_0)
		var_136_0.ikConfig = nil
		arg_136_0.blockIK = nil

		arg_136_0:SetUI(arg_141_0, "back")
	end)
	seriesAsync(var_136_1, function()
		arg_136_0:SetBlackboardValue(var_136_0, "inTouching", false)
		arg_136_0:emit(arg_136_0.HIDE_BLOCK)

		arg_136_0.touchConfig = nil

		local var_142_0 = arg_136_0.touchExitCall

		arg_136_0.touchExitCall = nil

		existCall(var_142_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_143_0, arg_143_1, arg_143_2, arg_143_3)
	local var_143_0 = arg_143_0.ladyDict[arg_143_0.apartment:GetConfigID()]

	seriesAsync({
		function(arg_144_0)
			arg_143_0:ChangeArtScene(arg_143_2, arg_144_0)
		end,
		function(arg_145_0)
			arg_143_0:ChangeSubScene(arg_143_2, arg_145_0)
		end,
		function(arg_146_0)
			arg_143_0:emit(arg_143_0.SHOW_BLOCK)

			if arg_143_1 == "back" then
				arg_143_0:SetUI(arg_146_0, "back")
			elseif arg_143_1 == "change" and arg_143_0.uiState ~= "walk" then
				arg_143_0:SetUI(arg_146_0, "walk")
			else
				arg_146_0()
			end
		end
	}, function()
		arg_143_0:emit(arg_143_0.HIDE_BLOCK)
		arg_143_0:SetBlackboardValue(var_143_0, "inWalk", arg_143_1 == "change")
		existCall(arg_143_3)
	end)
end

function var_0_0.EnterTimelineTouchMode(arg_148_0)
	local var_148_0 = arg_148_0.ladyDict[arg_148_0.apartment:GetConfigID()]

	if arg_148_0:GetBlackboardValue(var_148_0, "inIK") then
		return
	end

	local var_148_1 = arg_148_0.room:getApartmentZoneConfig(var_148_0.ladyBaseZone, "touch_id", arg_148_0.apartment:GetConfigID())
	local var_148_2 = pg.dorm3d_ik_timeline[var_148_1]

	assert(var_148_2, "Missing config in dorm3d_ik_timeline ID: " .. (var_148_1 or "nil"))

	arg_148_0.touchTimelineConfig = var_148_2

	local var_148_3 = {}

	table.insert(var_148_3, function(arg_149_0)
		arg_148_0:SetBlackboardValue(var_148_0, "inIK", true)
		arg_148_0:emit(arg_148_0.SHOW_BLOCK)
		arg_148_0:SetUI(arg_149_0, "ik")
	end)
	table.insert(var_148_3, function(arg_150_0)
		setActive(arg_148_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_148_0.uiContianer:Find("ik/Right/btn_camera"), false)
		setActive(arg_148_0.uiContianer:Find("ik/Right/Menu"), false)
		setActive(arg_148_0.uiContianer:Find("ik/Right/MenuSmall"), false)
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_148_0:emit(arg_148_0.HIDE_BLOCK)
		arg_148_0:HideCharacterBylayer(var_148_0)
		setActive(var_148_0.ladyCollider, false)

		local var_150_0
		local var_150_1

		if #var_148_2.scene > 0 then
			var_150_0, var_150_1 = unpack(string.split(var_148_2.scene, "|"))
		end

		arg_148_0:PlayTimeline({
			name = var_148_2.timeline,
			scene = var_150_0,
			sceneRoot = var_150_1
		}, function(arg_151_0, arg_151_1)
			arg_151_1()
			arg_148_0:ExitTimelineTouchMode()
		end)
	end)
	seriesAsync(var_148_3, function()
		return
	end)
end

function var_0_0.ExitTimelineTouchMode(arg_153_0)
	local var_153_0 = arg_153_0.ladyDict[arg_153_0.apartment:GetConfigID()]

	if not arg_153_0:GetBlackboardValue(var_153_0, "inIK") then
		return
	end

	arg_153_0.touchTimelineConfig = nil

	local var_153_1 = {}

	table.insert(var_153_1, function(arg_154_0)
		arg_153_0:emit(arg_153_0.SHOW_BLOCK)
		Shader.SetGlobalFloat("_ScreenClipOff", 1)
		arg_154_0()
	end)
	table.insert(var_153_1, function(arg_155_0)
		arg_153_0:RevertCharacterBylayer(var_153_0)
		setActive(var_153_0.ladyCollider, true)
		arg_153_0:SetUI(arg_155_0, "back")
	end)
	seriesAsync(var_153_1, function()
		arg_153_0:SetBlackboardValue(var_153_0, "inIK", false)
		arg_153_0:emit(arg_153_0.HIDE_BLOCK)
	end)
end

function var_0_0.EnterWalkMode(arg_157_0)
	local var_157_0 = arg_157_0.apartment:GetConfigID()
	local var_157_1 = arg_157_0.ladyDict[var_157_0]

	seriesAsync({
		function(arg_158_0)
			arg_157_0:emit(arg_157_0.SHOW_BLOCK)
			arg_157_0:HideCharacter(var_157_0)
			arg_157_0:SetBlackboardValue(var_157_1, "inWalk", true)
			arg_157_0:SetUI(arg_158_0, "walk")
		end,
		function(arg_159_0)
			arg_157_0:emit(arg_157_0.HIDE_BLOCK)
			arg_157_0:ChangeArtScene(arg_157_0.walkInfo.scene .. "|" .. arg_157_0.walkInfo.sceneRoot, arg_159_0)
		end,
		function(arg_160_0)
			arg_157_0:LoadSubScene(arg_157_0.walkInfo, arg_160_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_162_0)
	local var_162_0 = arg_162_0.apartment:GetConfigID()
	local var_162_1 = arg_162_0.ladyDict[var_162_0]

	seriesAsync({
		function(arg_163_0)
			arg_162_0:ChangeArtScene(arg_162_0.walkLastSceneInfo, arg_163_0)
		end,
		function(arg_164_0)
			arg_162_0:UnloadSubScene(arg_162_0.walkInfo, arg_164_0)
		end,
		function(arg_165_0)
			arg_162_0:emit(arg_162_0.SHOW_BLOCK)
			arg_162_0:SetUI(arg_165_0, "back")
		end
	}, function()
		arg_162_0:emit(arg_162_0.HIDE_BLOCK)
		arg_162_0:RevertCharacter(var_162_0)
		arg_162_0:SetBlackboardValue(var_162_1, "inWalk", false)

		local var_166_0 = arg_162_0.walkExitCall

		arg_162_0.walkExitCall = nil
		arg_162_0.walkLastSceneInfo = nil
		arg_162_0.walkInfo = nil

		existCall(var_166_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_167_0)
	if not arg_167_0.tfCutIn then
		return
	end

	local var_167_0 = arg_167_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_167_0, true)

	local var_167_1 = GetOrAddComponent(var_167_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_167_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_167_1, arg_167_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_167_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_167_0.modelCutIn.player, "Idle")
	setActive(arg_167_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_168_0)
	if not arg_168_0.tfCutIn then
		return
	end

	local var_168_0 = arg_168_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_168_1 = GetOrAddComponent(var_168_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_168_1)
	setActive(var_168_0, false)
	setActive(arg_168_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_169_0, arg_169_1, arg_169_2)
	local var_169_0 = pg.dorm3d_ik_status[arg_169_2]

	if var_169_0.skin_id ~= arg_169_1.skinId then
		local var_169_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_169_0.base]
		local var_169_2 = _.detect(var_169_1, function(arg_170_0)
			return pg.dorm3d_ik_status[arg_170_0].skin_id == arg_169_1.skinId
		end)

		assert(var_169_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_169_1.skinId, arg_169_2))

		var_169_0 = pg.dorm3d_ik_status[var_169_2]
	end

	arg_169_1.ikConfig = var_169_0
end

function var_0_0.SetIKState(arg_171_0, arg_171_1, arg_171_2)
	local var_171_0 = arg_171_0.ladyDict[arg_171_0.apartment:GetConfigID()]
	local var_171_1 = {}

	if arg_171_1 then
		table.insert(var_171_1, function(arg_172_0)
			arg_171_0:SetBlackboardValue(var_171_0, "inIK", true)
			arg_171_0:emit(arg_171_0.SHOW_BLOCK)

			local var_172_0 = var_171_0.ikConfig.camera_group

			setActive(arg_171_0.uiContianer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_172_0] > 1)
			setActive(arg_171_0.ikControlUI, true)
			arg_172_0()
		end)

		if arg_171_0.uiState ~= "ik" then
			table.insert(var_171_1, function(arg_173_0)
				arg_171_0:SetUI(arg_173_0, "ik")
			end)
		end

		table.insert(var_171_1, function(arg_174_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_171_0:SetIKStatus(var_171_0, var_171_0.ikConfig, arg_174_0)
		end)
		table.insert(var_171_1, function(arg_175_0)
			arg_171_0:emit(arg_171_0.HIDE_BLOCK)
			arg_175_0()
		end)
	else
		assert(arg_171_0.uiState == "ik")
		table.insert(var_171_1, function(arg_176_0)
			setActive(arg_171_0.ikControlUI, false)
			arg_171_0:emit(arg_171_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_176_0()
		end)
		table.insert(var_171_1, function(arg_177_0)
			arg_171_0:ExitIKStatus(var_171_0, var_171_0.ikConfig, arg_177_0)
			arg_171_0:ResetSceneItemAnimators()
		end)
		table.insert(var_171_1, function(arg_178_0)
			arg_171_0:SetUI(arg_178_0, "back")
		end)
		table.insert(var_171_1, function(arg_179_0)
			arg_171_0:SetBlackboardValue(var_171_0, "inIK", false)
			arg_171_0:emit(arg_171_0.HIDE_BLOCK)
			arg_179_0()
		end)
	end

	seriesAsync(var_171_1, arg_171_2)
end

function var_0_0.TouchModeAction(arg_180_0, arg_180_1, arg_180_2, arg_180_3, ...)
	return switch(arg_180_3, {
		function(arg_181_0, arg_181_1)
			return function(arg_182_0)
				seriesAsync({
					function(arg_183_0)
						if not arg_181_1 or arg_181_1 == "" then
							return arg_183_0()
						end

						arg_180_0:PlaySingleAction(arg_180_1, arg_181_1, arg_183_0)
					end,
					function(arg_184_0)
						arg_180_0:SwitchIKConfig(arg_180_1, arg_181_0)
						arg_180_0:SetIKState(true, arg_184_0)
					end,
					arg_182_0
				})
			end
		end,
		function()
			return function()
				if arg_180_0.ikSpecialCall then
					local var_186_0 = arg_180_0.ikSpecialCall

					arg_180_0.ikSpecialCall = nil

					existCall(var_186_0)
				else
					arg_180_0:ExitTouchMode()
				end
			end
		end,
		function(arg_187_0, arg_187_1)
			return function(arg_188_0)
				arg_180_0:PlaySingleAction(arg_180_1, arg_187_1, arg_188_0)
			end
		end,
		function(arg_189_0, arg_189_1, arg_189_2)
			return function(arg_190_0)
				seriesAsync({
					function(arg_191_0)
						arg_180_0:DoTalk(arg_189_1, arg_191_0)
					end,
					function(arg_192_0)
						if not arg_189_2 or arg_189_2 == 0 then
							return arg_192_0()
						end

						arg_180_0:SwitchIKConfig(arg_180_1, arg_189_2)
						arg_180_0:SetIKState(true, arg_192_0)
					end,
					arg_190_0
				})
			end
		end,
		function(arg_193_0, arg_193_1, arg_193_2, arg_193_3)
			return function(arg_194_0)
				arg_180_0:PlaySceneItemAnim(arg_193_2, arg_193_3)
				arg_180_0:PlaySingleAction(arg_193_1, arg_194_0)
			end
		end,
		function(arg_195_0)
			return function(arg_196_0)
				local var_196_0 = pg.dorm3d_ik_touch[arg_180_2]

				if #var_196_0.scene_item == 0 then
					return
				end

				local var_196_1 = arg_180_0:GetSceneItem(var_196_0.scene_item)

				if not var_196_1 then
					warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_180_2, var_196_0.scene_item))

					return
				end

				local var_196_2 = var_196_1:Find(arg_195_0)

				if not IsNil(var_196_2) then
					setActive(var_196_2, false)
					setActive(var_196_2, true)
				end

				arg_196_0()
			end
		end,
		function(arg_197_0)
			local var_197_0 = pg.dorm3d_ik_touch_move[arg_197_0]
			local var_197_1 = var_197_0.target_ik
			local var_197_2 = var_197_0.move_time
			local var_197_3 = var_197_0.ik_point
			local var_197_4 = var_197_0.touch_step

			arg_180_1.IKSettings.forceMove = arg_180_1.IKSettings.forceMove or {}

			local var_197_5 = arg_180_1.IKSettings.forceMove

			var_197_5[var_197_1] = var_197_5[var_197_1] or {}
			var_197_5[var_197_1].count = var_197_5[var_197_1].count or 0

			return function(arg_198_0)
				seriesAsync({
					function(arg_199_0)
						if var_197_5[var_197_1].count >= #var_197_4 then
							return arg_199_0()
						end

						local var_199_0 = Dorm3dIK.New({
							configId = var_197_1
						})
						local var_199_1 = Vector2.New(unpack(var_197_3))
						local var_199_2 = var_197_5[var_197_1].count
						local var_199_3 = var_197_4[var_199_2 + 1] - (var_199_2 == 0 and 0 or var_197_4[var_199_2])

						var_197_5[var_197_1].count = var_199_2 + 1

						pg.IKMgr.GetInstance():ResetIK(var_199_0:GetTriggerBoneName())

						local var_199_4 = arg_180_1.IKSettings.Colliders[var_199_0:GetTriggerBoneName()]
						local var_199_5 = arg_180_0.raycastCamera:WorldToScreenPoint(var_199_4.position)

						pg.IKMgr.GetInstance():PlayIKMove(var_199_5, var_199_0:GetTriggerBoneName(), var_199_1, var_197_4[var_199_2 + 1], var_197_2, function()
							var_197_5[var_197_1].count = 0

							arg_199_0()
						end)
					end,
					arg_198_0
				})
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_203_0, arg_203_1)
	local var_203_0 = arg_203_0.ladyDict[arg_203_0.apartment:GetConfigID()]

	if var_203_0.ikTimelineMode then
		arg_203_0:ExitIKTimelineStatus(var_203_0)

		local var_203_1 = arg_203_1:GetTimelineAction()

		if var_203_1 then
			arg_203_0.nowTimelinePlayer:TriggerEvent(var_203_1)
		end

		return
	end

	if not var_203_0.ikConfig then
		return
	end

	local var_203_2 = arg_203_1:GetControllerPath()
	local var_203_3 = var_203_0.ikActionDict[var_203_2]

	if not var_203_3 then
		return
	end

	arg_203_0.blockIK = true

	arg_203_0:TouchModeAction(var_203_0, arg_203_1:GetConfigID(), unpack(var_203_3))(function()
		arg_203_0:ResetIKTipTimer()

		arg_203_0.blockIK = nil
	end)
end

function var_0_0.OnTouchCharacterBody(arg_205_0, arg_205_1)
	local var_205_0 = arg_205_0.ladyDict[arg_205_0.apartment:GetConfigID()]

	if not var_205_0.ikConfig then
		return
	end

	if type(var_205_0.ikConfig.touch_data) ~= "table" then
		return
	end

	for iter_205_0, iter_205_1 in ipairs(var_205_0.iKTouchDatas) do
		local var_205_1, var_205_2, var_205_3 = unpack(iter_205_1)
		local var_205_4 = pg.dorm3d_ik_touch[var_205_1]

		if var_205_4.body == arg_205_1 then
			local var_205_5 = var_205_4.action_emote

			if #var_205_5 > 0 then
				arg_205_0:PlayFaceAnim(var_205_0, var_205_5)
			end

			local var_205_6 = var_205_4.vibrate

			if type(var_205_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_205_7 = {}
				local var_205_8 = {}
				local var_205_9 = {}

				underscore.each(var_205_6, function(arg_206_0)
					local var_206_0 = arg_206_0[1]

					if PLATFORM == PLATFORM_IPHONEPLAYER then
						var_206_0 = var_206_0 / 1000
					end

					table.insert(var_205_7, var_206_0)
					table.insert(var_205_8, arg_206_0[2])
					table.insert(var_205_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_205_7, var_205_8)
				elseif PLATFORM == PLATFORM_IPHONEPLAYER then
					VibrateMgr.Instance:VibrateWaveform(var_205_7, var_205_8, var_205_9)
				end
			end

			arg_205_0.blockIK = true

			arg_205_0:TouchModeAction(var_205_0, var_205_1, unpack(var_205_3))(function()
				arg_205_0:ResetIKTipTimer()

				arg_205_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_208_0)
	setActive(arg_208_0.rtTouchGamePanel:Find("effect_bg"), arg_208_0.touchLevel == 2)
	setActive(arg_208_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_208_0.touchLevel == 2)

	if arg_208_0.touchLevel == 1 then
		setActive(arg_208_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_208_0.uiContianer:Find("ik/btn_back_heartbeat"), false)
		quickPlayAnimation(arg_208_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_208_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_208_0.touchLevel == 2 then
		setActive(arg_208_0.uiContianer:Find("ik/btn_back"), false)
		setActive(arg_208_0.uiContianer:Find("ik/btn_back_heartbeat"), true)
		quickPlayAnimation(arg_208_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_208_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_209_0, arg_209_1)
	if arg_209_0.touchLevel > 1 then
		arg_209_1 = math.min(0, arg_209_1)
	end

	arg_209_0.touchCount = math.clamp(arg_209_0.touchCount + arg_209_1, 0, 100)

	if arg_209_0.sliderLT and LeanTween.isTweening(arg_209_0.sliderLT) then
		LeanTween.cancel(arg_209_0.sliderLT)

		arg_209_0.sliderLT = nil
	end

	setSlider(arg_209_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_209_0.touchCount)

	local var_209_0

	if arg_209_0.touchCount >= 100 then
		var_209_0 = 2
	elseif arg_209_0.touchCount <= 0 then
		var_209_0 = 1
	end

	if var_209_0 and var_209_0 ~= arg_209_0.touchLevel then
		if arg_209_0.blockIK then
			return
		end

		arg_209_0.touchLevel = var_209_0

		local var_209_1 = arg_209_0.touchConfig.ik_status[var_209_0]

		if var_209_1 then
			if var_209_0 > 1 then
				arg_209_0.touchCount = 200
			elseif var_209_0 == 1 then
				arg_209_0.touchCount = 0
			end

			local var_209_2 = arg_209_0.ladyDict[arg_209_0.apartment:GetConfigID()]

			seriesAsync({
				function(arg_210_0)
					arg_209_0:ShowBlackScreen(true, arg_210_0)
				end,
				function(arg_211_0)
					arg_209_0:SwitchIKConfig(var_209_2, var_209_1)
					arg_209_0:SetIKState(true, arg_211_0)

					if var_209_0 > 1 and arg_209_0.touchConfig.heartbeat_enter_anim ~= "" then
						arg_209_0:SwitchAnim(var_209_2, arg_209_0.touchConfig.heartbeat_enter_anim)
					end
				end,
				function(arg_212_0)
					arg_209_0:ShowBlackScreen(false, arg_212_0)
				end
			})
		end

		arg_209_0:UpdateTouchCount(0)
		arg_209_0:UpdateTouchGameDisplay()
	end

	arg_209_0.topCount = math.max(arg_209_0.topCount, arg_209_0.touchCount)
end

function var_0_0.ExitHeartbeatMode(arg_213_0)
	if not arg_213_0.touchLevel or arg_213_0.touchLevel == 1 then
		return
	end

	arg_213_0.touchCount = 0

	arg_213_0:UpdateTouchCount(0)
end

function var_0_0.DoTouch(arg_214_0, arg_214_1, arg_214_2)
	if arg_214_0.inTouchGame then
		switch(arg_214_2, {
			function()
				arg_214_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_214_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_214_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_214_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat_trriger.key_value_int)
			end
		})
	end
end

function var_0_0.DoTalk(arg_219_0, arg_219_1, arg_219_2)
	while rawget(arg_219_0, "class") ~= var_0_0 do
		arg_219_0 = getmetatable(arg_219_0).__index
	end

	if arg_219_0.apartment and arg_219_0:GetBlackboardValue(arg_219_0.ladyDict[arg_219_0.apartment:GetConfigID()], "inTalking") then
		errorMsg("Talking block:" .. arg_219_1)

		return
	end

	if not arg_219_0.room:isPersonalRoom() then
		local var_219_0 = pg.dorm3d_dialogue_group[arg_219_1].char_id

		if arg_219_0.apartment then
			assert(arg_219_0.apartment:GetConfigID() == var_219_0)
		else
			arg_219_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_219_0))
		end
	end

	local var_219_1 = arg_219_0.ladyDict[arg_219_0.apartment:GetConfigID()]

	if arg_219_1 == 10010 and not arg_219_0.apartment.talkDic[arg_219_1] then
		arg_219_0.firstTimelineTouch = true
		arg_219_0.firstMoveGuide = true
	end

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = arg_219_0.contextData.timeIndex == 1 and 110 or 115,
			ship_id = arg_219_0.apartment:GetConfigID()
		},
		{
			value = 1,
			event_type = 155,
			ship_id = arg_219_0.apartment:GetConfigID()
		}
	})

	local var_219_2 = {}

	if arg_219_0:GetBlackboardValue(var_219_1, "inPending") then
		table.insert(var_219_2, function(arg_220_0)
			arg_219_0:OutOfLazy(arg_219_0.apartment:GetConfigID(), arg_220_0)
		end)
	end

	local var_219_3 = pg.dorm3d_dialogue_group[arg_219_1]
	local var_219_4 = var_219_3.performance_type == 1
	local var_219_5

	table.insert(var_219_2, function(arg_221_0)
		arg_219_0:emit(arg_219_0.SHOW_BLOCK)
		arg_219_0:SetBlackboardValue(var_219_1, var_219_4 and "inPerformance" or "inTalking", true)
		arg_219_0:emit(Dorm3dRoomMediator.DO_TALK, arg_219_1, function(arg_222_0)
			var_219_5 = arg_222_0

			arg_221_0()
		end)
	end)
	table.insert(var_219_2, function(arg_223_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_219_0.apartment.configId, arg_219_0.apartment.level, arg_219_1, var_219_3.type, arg_219_0.room:getZoneConfig(arg_219_0.ladyDict[arg_219_0.apartment:GetConfigID()].ladyBaseZone, "id"), var_219_3.action_type, table.CastToString(var_219_3.trigger_config), arg_219_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_219_0:SetUI(arg_223_0, "blank")
	end)

	if var_219_3.trigger_area and var_219_3.trigger_area ~= "" then
		table.insert(var_219_2, function(arg_224_0)
			arg_219_0:ShiftZone(var_219_3.trigger_area, arg_224_0)
		end)
	end

	if var_219_3.performance_type == 0 then
		table.insert(var_219_2, function(arg_225_0)
			arg_219_0:emit(arg_219_0.HIDE_BLOCK)

			if arg_219_0.contextData.isVideoTalk then
				arg_219_0.videoPlayer:ExecuteAction("Play", var_219_3.story, function()
					onDelayTick(arg_225_0, 0.001)
				end)
			else
				pg.NewStoryMgr.GetInstance():ForceManualPlay(var_219_3.story, function()
					onDelayTick(arg_225_0, 0.001)
				end, true)
			end
		end)
	elseif var_219_3.performance_type == 1 then
		table.insert(var_219_2, function(arg_228_0)
			arg_219_0:emit(arg_219_0.HIDE_BLOCK)
			arg_219_0:PerformanceQueue(var_219_3.story, arg_228_0)
		end)
	else
		assert(false)
	end

	table.insert(var_219_2, function(arg_229_0)
		arg_219_0:emit(arg_219_0.SHOW_BLOCK)
		arg_229_0()
	end)
	table.insert(var_219_2, function(arg_230_0)
		local var_230_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_219_3.story)

		if var_230_0 then
			local var_230_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_230_0, var_230_1))
		end

		if var_219_5 and #var_219_5 > 0 then
			arg_219_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_219_5, arg_230_0)
		else
			arg_230_0()
		end
	end)
	table.insert(var_219_2, function(arg_231_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_219_0:emit(arg_219_0.HIDE_BLOCK)

		if arg_219_0.contextData.isVideoTalk then
			existCall(arg_231_0)
		else
			arg_219_0:SetBlackboardValue(var_219_1, var_219_4 and "inPerformance" or "inTalking", false)
			arg_219_0:SetUI(arg_231_0, "back")
		end
	end)
	seriesAsync(var_219_2, function()
		if arg_219_2 then
			return arg_219_2()
		else
			arg_219_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_233_0, arg_233_1, arg_233_2, arg_233_3)
	local var_233_0 = arg_233_0.rtExtraScreen:Find("TalkTouchOption")
	local var_233_1
	local var_233_2 = var_233_0:Find("content")

	UIItemList.StaticAlign(var_233_2, var_233_2:Find("clickTpl"), #arg_233_1.options, function(arg_234_0, arg_234_1, arg_234_2)
		arg_234_1 = arg_234_1 + 1

		if arg_234_0 == UIItemList.EventUpdate then
			local var_234_0 = arg_233_1.options[arg_234_1]

			setAnchoredPosition(arg_234_2, NewPos(unpack(var_234_0.pos)))
			onButton(arg_233_0, arg_234_2, function()
				var_233_1(var_234_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_234_2, not table.contains(arg_233_2, var_234_0.flag))
		end
	end)
	setActive(var_233_0, true)

	function var_233_1(arg_236_0)
		setActive(var_233_0, false)
		arg_233_3(arg_236_0)
	end
end

function var_0_0.DoTimelineOption(arg_237_0, arg_237_1, arg_237_2)
	local var_237_0 = arg_237_0.rtTimelineScreen:Find("TimelineOption")
	local var_237_1
	local var_237_2 = var_237_0:Find("content")

	UIItemList.StaticAlign(var_237_2, var_237_2:Find("clickTpl"), #arg_237_1, function(arg_238_0, arg_238_1, arg_238_2)
		arg_238_1 = arg_238_1 + 1

		if arg_238_0 == UIItemList.EventUpdate then
			local var_238_0 = arg_237_1[arg_238_1]

			setText(arg_238_2:Find("Text"), HXSet.hxLan(var_238_0.content))
			onButton(arg_237_0, arg_238_2, function()
				var_237_1(arg_238_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_237_0, true)

	function var_237_1(arg_240_0)
		setActive(var_237_0, false)
		arg_237_2(arg_240_0)
	end
end

function var_0_0.DoTimelineTouch(arg_241_0, arg_241_1, arg_241_2)
	local var_241_0 = arg_241_0.rtTimelineScreen:Find("TimelineTouch")
	local var_241_1
	local var_241_2 = var_241_0:Find("content")

	UIItemList.StaticAlign(var_241_2, var_241_2:Find("clickTpl"), #arg_241_1, function(arg_242_0, arg_242_1, arg_242_2)
		arg_242_1 = arg_242_1 + 1

		if arg_242_0 == UIItemList.EventUpdate then
			local var_242_0 = arg_241_1[arg_242_1]

			setAnchoredPosition(arg_242_2, NewPos(unpack(var_242_0.pos)))
			onButton(arg_241_0, arg_242_2, function()
				var_241_1(arg_242_1)
			end, SFX_CONFIRM)

			if arg_241_0.firstTimelineTouch then
				arg_241_0.firstTimelineTouch = nil

				setActive(arg_242_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_241_0, true)

	function var_241_1(arg_244_0)
		setActive(var_241_0, false)
		arg_241_2(arg_244_0)
	end
end

function var_0_0.DoShortWait(arg_245_0, arg_245_1)
	local var_245_0 = arg_245_0.ladyDict[arg_245_1]
	local var_245_1 = getProxy(ApartmentProxy):getApartment(arg_245_1)
	local var_245_2 = arg_245_0.room:getApartmentZoneConfig(var_245_0.ladyBaseZone, "special_action", arg_245_1)
	local var_245_3 = var_245_2 and var_245_2[math.random(#var_245_2)] or nil

	if not var_245_3 then
		return
	end

	arg_245_0:PlaySingleAction(var_245_0, var_245_3)
end

function var_0_0.OutOfLazy(arg_246_0, arg_246_1, arg_246_2)
	local var_246_0 = arg_246_0.ladyDict[arg_246_1]
	local var_246_1 = {}

	if arg_246_0:GetBlackboardValue(var_246_0, "inPending") then
		table.insert(var_246_1, function(arg_247_0)
			arg_246_0.shiftLady = arg_246_1

			arg_246_0:ShiftZone(var_246_0.ladyBaseZone, arg_247_0)
		end)
	end

	seriesAsync(var_246_1, arg_246_2)
end

function var_0_0.OutOfPending(arg_248_0, arg_248_1, arg_248_2)
	assert(arg_248_0.wakeUpTalkId)

	local var_248_0 = arg_248_0.wakeUpTalkId

	seriesAsync({
		function(arg_249_0)
			arg_248_0:SetUI(arg_249_0, "blank")
		end,
		function(arg_250_0)
			arg_248_0.shiftLady = arg_248_1

			arg_248_0:ShiftZone(arg_248_0.ladyBaseZone, arg_250_0)
		end,
		function(arg_251_0)
			arg_248_0:DoTalk(var_248_0, arg_251_0)
		end
	}, function()
		arg_248_0:SetUIStore(arg_248_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_253_0, arg_253_1)
	local var_253_0

	if arg_253_0:GetBlackboardValue(arg_253_1, "inPending") then
		var_253_0 = tobool(arg_253_0:GetBlackboardValue(arg_253_1, "inDistance"))
	else
		local var_253_1 = arg_253_0:GetBlackboardValue(arg_253_1, "groupId")

		var_253_0 = tobool(arg_253_0.activeLady[var_253_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_253_1.ladyBlackboard))
	end

	if (not arg_253_1.nowCanWatchState or arg_253_1.nowCanWatchState ~= var_253_0) and arg_253_1.ladyWatchFloat then
		arg_253_1.nowCanWatchState = var_253_0

		arg_253_0:ShowOrHideCanWatchMark(arg_253_1, arg_253_1.nowCanWatchState)
	end
end

function var_0_0.HandleGameNotification(arg_254_0, arg_254_1, arg_254_2)
	local var_254_0 = arg_254_0.ladyDict[arg_254_0.apartment:GetConfigID()]

	switch(arg_254_1, {
		[Dorm3dMiniGameMediator.OPERATION] = function()
			local var_255_0 = arg_254_2.miniGameId

			switch(arg_254_2.miniGameId, {
				[67] = function()
					if arg_254_2.operationCode == "GAME_HIT_AREA" then
						local var_256_0 = {
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
						local var_256_1, var_256_2 = unpack(var_256_0[arg_254_2.index])

						arg_254_0:PlayFaceAnim(var_254_0, var_256_1)

						if arg_254_0.tfCutIn then
							quickPlayAnimator(arg_254_0.modelCutIn.lady, var_256_2)
							quickPlayAnimator(arg_254_0.modelCutIn.player, var_256_2)
						end
					elseif arg_254_2.operationCode == "GAME_RESULT" then
						if arg_254_2.win then
							arg_254_0:PlayFaceAnim(var_254_0, "Face_XYX_victory")
							arg_254_0:PlaySingleAction(var_254_0, "minigame_win")
						else
							arg_254_0:PlayFaceAnim(var_254_0, "Face_XYX_lose")
							arg_254_0:PlaySingleAction(var_254_0, "minigame_lose")
						end

						setActive(arg_254_0.rtExtraScreen:Find("MiniGameCutIn"), false)
					end
				end,
				[70] = function()
					if arg_254_2.operationCode == "GAME_READY" then
						arg_254_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_254_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil

						arg_254_0:PlaySingleAction(var_254_0, "shuohua_sikao")
					elseif arg_254_2.operationCode == "ROUND_RESULT" then
						local var_257_0

						if arg_254_2.success then
							var_257_0 = {
								"shuohua_wenhou",
								"shuohua_sikao"
							}
						else
							var_257_0 = {
								"shuohua_yaotou",
								"shuohua_sikao"
							}
						end

						seriesAsync(underscore.map(var_257_0, function(arg_258_0)
							return function(arg_259_0)
								arg_254_0:PlaySingleAction(var_254_0, arg_258_0, arg_259_0)
							end
						end), function()
							return
						end)
					elseif arg_254_2.operationCode == "GAME_RESULT" then
						local var_257_1 = arg_254_0.cameras[var_0_0.CAMERA.TALK].transform

						var_257_1.position = var_257_1.position + var_257_1.right * 0.11

						local var_257_2 = {
							"shuohua_gandong"
						}

						seriesAsync(underscore.map(var_257_2, function(arg_261_0)
							return function(arg_262_0)
								arg_254_0:PlaySingleAction(var_254_0, arg_261_0, arg_262_0)
							end
						end), function()
							return
						end)
					end
				end,
				[75] = function()
					if arg_254_2.operationCode == "BEFORE_OPEN_GAME" then
						arg_254_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_254_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil
					elseif arg_254_2.operationCode == "GAME_RPS_RESULT" then
						if arg_254_2.index == 1 then
							arg_254_0:PlaySingleAction(var_254_0, "ab_shuohua_lianxuyaotou_01")
							arg_254_0:PlayFaceAnim(var_254_0, "Face_weixiao")
						elseif arg_254_2.index == 2 then
							arg_254_0:PlaySingleAction(var_254_0, "ab_shuohua_lianxudiantou_01")
							arg_254_0:PlayFaceAnim(var_254_0, "Face_kaixin")
						end
					elseif arg_254_2.operationCode == "GAME_RESULT" then
						if not arg_254_2.win then
							arg_254_0:PlaySingleAction(var_254_0, "ab_shuohua_taibangle_01")
						end

						arg_254_0:PlayFaceAnim(var_254_0, "Face_kaixin")
					end
				end
			}, function()
				warning("without miniGameId:" .. arg_254_2.miniGameId)
			end)

			if arg_254_2.operationCode == "BEFORE_OPEN_GAME" then
				local var_255_1 = getProxy(PlayerProxy):getPlayerId()
				local var_255_2 = 0

				if var_255_0 == 67 or var_255_0 == 70 then
					var_255_2 = PlayerPrefs.GetInt("mg_new_score_" .. tostring(var_255_1) .. "_" .. arg_254_2.miniGameId, 0)
				else
					var_255_2 = PlayerPrefs.GetInt("mg_score_" .. tostring(var_255_1) .. "_" .. arg_254_2.miniGameId, 0)
				end

				arg_254_0.highScore = var_255_2
			elseif arg_254_2.operationCode == "GAME_RESULT" then
				local var_255_3 = arg_254_2.score
				local var_255_4 = getProxy(PlayerProxy):getPlayerId()

				if var_255_3 > arg_254_0.highScore then
					if var_255_0 == 67 or var_255_0 == 70 then
						PlayerPrefs.SetInt("mg_new_score_" .. tostring(var_255_4) .. "_" .. arg_254_2.miniGameId, var_255_3)
					end

					getProxy(Dorm3dChatProxy):TriggerEvent({
						{
							event_type = 159,
							value = var_255_3,
							ship_id = arg_254_0.apartment:GetConfigID()
						}
					})
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_254_2.score))
			elseif arg_254_2.operationCode == "GAME_CLOSE" and arg_254_2.doTrack == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_266_0, arg_266_1, arg_266_2)
	local var_266_0, var_266_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_266_1)
	end)

	if not var_266_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_266_1)
		existCall(arg_266_2)

		return
	end

	warning(arg_266_1)

	arg_266_0.performanceInfo = {
		name = arg_266_1
	}

	local var_266_2 = {}

	table.insert(var_266_2, function(arg_268_0)
		arg_266_0:SetUI(arg_268_0, "blank")
	end)
	table.insertto(var_266_2, underscore.map(var_266_1, function(arg_269_0)
		return switch(arg_269_0.type, {
			function()
				return function(arg_271_0)
					local var_271_0 = unpack(arg_269_0.params)

					arg_266_0:DoTalk(var_271_0, arg_271_0, true)
				end
			end,
			function()
				return function(arg_273_0)
					arg_266_0.touchExitCall = arg_273_0

					arg_266_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_275_0)
					local var_275_0 = arg_266_0.ladyDict[arg_266_0.apartment:GetConfigID()]

					arg_266_0:PlaySingleAction(var_275_0, arg_269_0.name, arg_275_0)
				end
			end,
			function()
				return function(arg_277_0)
					arg_266_0:emit(arg_266_0.PLAY_EXPRESSION, arg_269_0)
					arg_277_0()
				end
			end,
			function()
				return function(arg_279_0)
					arg_266_0:ShiftZone(arg_269_0.name, arg_279_0)
				end
			end,
			function()
				return function(arg_281_0)
					arg_266_0.contextData.timeIndex = arg_269_0.params[1]

					if arg_266_0.dormSceneMgr.artSceneInfo == arg_266_0.dormSceneMgr.sceneInfo then
						arg_266_0:SwitchDayNight(arg_266_0.contextData.timeIndex)
						onNextTick(function()
							arg_266_0:RefreshSlots()
						end)
					end

					arg_266_0:UpdateContactState()
					onNextTick(arg_281_0)
				end
			end,
			function()
				return function(arg_284_0)
					if arg_269_0.name then
						arg_266_0:ActiveCameraByName(arg_269_0.name)
						existCall(arg_284_0)
					else
						arg_266_0:ActiveStateCamera(arg_269_0.params[1], arg_284_0)
					end
				end
			end,
			function()
				return function(arg_286_0)
					if arg_269_0.name == "base" then
						arg_266_0:ChangeArtScene(arg_266_0.dormSceneMgr.sceneInfo, arg_286_0)
					else
						local var_286_0 = arg_269_0.params.scene
						local var_286_1 = arg_269_0.params.sceneRoot

						arg_266_0:ChangeArtScene(var_286_0 .. "|" .. var_286_1, arg_286_0)
					end
				end
			end,
			function()
				return function(arg_288_0)
					local var_288_0 = arg_269_0.params.name

					if arg_269_0.name == "load" then
						func = tobool(arg_269_0.params.wait_timeline) and function(arg_289_0)
							arg_266_0.waitForTimeline = arg_289_0
						end

						arg_266_0:LoadTimelineScene(var_288_0, true, func, arg_288_0)
					elseif arg_269_0.name == "unload" then
						arg_266_0:UnloadTimelineScene(var_288_0, true, arg_288_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_291_0)
					setActive(arg_266_0.uiContianer:Find("walk/btn_back"), false)

					local var_291_0 = arg_266_0.ladyDict[arg_266_0.apartment:GetConfigID()]

					if arg_269_0.name == "change" then
						local var_291_1 = arg_269_0.params.scene
						local var_291_2 = arg_269_0.params.sceneRoot

						var_291_0.walkBornPoint = arg_269_0.params.point or "Default"

						arg_266_0:ChangeWalkScene(arg_269_0.name, var_291_1 .. "|" .. var_291_2, arg_291_0)
					elseif arg_269_0.name == "back" then
						var_291_0.walkBornPoint = nil

						arg_266_0:ChangeWalkScene(arg_269_0.name, arg_266_0.dormSceneMgr.sceneInfo, arg_291_0)
					elseif arg_269_0.name == "set" then
						local function var_291_3()
							local var_292_0 = arg_291_0

							arg_291_0 = nil

							return existCall(var_292_0)
						end

						for iter_291_0, iter_291_1 in pairs(arg_269_0.params) do
							switch(iter_291_0, {
								back_button_trigger = function(arg_293_0)
									onButton(arg_266_0, arg_266_0.uiContianer:Find("walk/btn_back"), var_291_3, SFX_DORM_BACK)
									setActive(arg_266_0.uiContianer:Find("walk/btn_back"), IsUnityEditor and arg_293_0)
								end,
								near_trigger = function(arg_294_0)
									if arg_294_0 == true then
										arg_294_0 = 1.5
									end

									if arg_294_0 then
										function arg_266_0.walkNearCallback(arg_295_0)
											if arg_295_0 < arg_294_0 then
												arg_266_0.walkNearCallback = nil

												var_291_3()
											end
										end
									else
										arg_266_0.walkNearCallback = nil
									end
								end
							}, nil, iter_291_1)
						end

						if arg_266_0.firstMoveGuide then
							setActive(arg_266_0.povLayer:Find("Guide"), arg_266_0.firstMoveGuide)

							arg_266_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_297_0)
					if arg_269_0.name == "set" then
						local var_297_0 = arg_266_0.ladyDict[arg_266_0.apartment:GetConfigID()]

						arg_266_0:SwitchIKConfig(var_297_0, arg_269_0.params.state)
						setActive(arg_266_0.uiContianer:Find("ik/btn_back"), not arg_269_0.params.hide_back)

						arg_266_0.ikSpecialCall = arg_297_0

						arg_266_0:SetIKState(true)
					elseif arg_269_0.name == "back" then
						local var_297_1 = arg_266_0.ladyDict[arg_266_0.apartment:GetConfigID()]

						var_297_1.ikConfig = arg_269_0.params

						arg_266_0:SetIKState(false, function()
							var_297_1.ikConfig = nil

							existCall(arg_297_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_300_0)
					arg_266_0.blackSceneInfo = setmetatable(arg_269_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_269_0.name == "show" and 0 or 0.5
						}
					})

					if arg_269_0.name == "show" then
						arg_266_0:ShowBlackScreen(true, arg_300_0)
					elseif arg_269_0.name == "hide" then
						arg_266_0:ShowBlackScreen(false, arg_300_0)
					else
						assert(false)
					end

					arg_266_0.blackSceneInfo = nil
				end
			end
		})
	end))
	table.insert(var_266_2, function(arg_301_0)
		arg_266_0:SetUI(arg_301_0, "back")

		arg_266_0.performanceInfo = nil
	end)
	seriesAsync(var_266_2, arg_266_2)
end

function var_0_0.TriggerContact(arg_302_0, arg_302_1)
	arg_302_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_302_1,
		roomId = arg_302_0.room:GetConfigID(),
		groupId = arg_302_0.room:isPersonalRoom() and arg_302_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_303_0)
	arg_303_0:SetContactStateDic(arg_303_0.room:getTriggerableCollectItemDic(arg_303_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_304_0)
	local var_304_0, var_304_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_304_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_304_0, var_304_1))
	setActive(arg_304_0.rtStaminaDisplay, false)

	if arg_304_0.apartment then
		setText(arg_304_0.rtFavorLevel:Find("rank/Text"), arg_304_0.apartment.level)

		local var_304_2, var_304_3 = arg_304_0.apartment:getFavor()
		local var_304_4 = arg_304_0.apartment:isMaxFavor()

		setActive(arg_304_0.rtFavorLevel:Find("Max"), var_304_4)
		setActive(arg_304_0.rtFavorLevel:Find("Text"), not var_304_4)
		setText(arg_304_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_304_2, var_304_3))
	end

	setActive(arg_304_0.rtFavorLevel:Find("red"), Dorm3dLevelLayer.IsShowRed())
end

function var_0_0.UpdateBtnState(arg_305_0)
	local var_305_0 = not arg_305_0.room:isPersonalRoom() or arg_305_0:CheckSystemOpen("Furniture")
	local var_305_1 = Dorm3dFurniture.IsTimelimitShopTip(arg_305_0.room:GetConfigID())

	setActive(arg_305_0.uiContianer:Find("base/left/btn_furniture/tipTimelimit"), var_305_0 and var_305_1)

	local var_305_2 = Dorm3dFurniture.NeedViewTip(arg_305_0.room:GetConfigID())

	setActive(arg_305_0.uiContianer:Find("base/left/btn_furniture/tip"), var_305_0 and not var_305_1 and var_305_2)
	setActive(arg_305_0.uiContianer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_306_0)
		return tobool(arg_306_0)
	end):any(function(arg_307_0)
		return #arg_307_0:getSpecialTalking() > 0 or arg_307_0:getIconTip() == "main"
	end):value())
	setActive(arg_305_0.uiContianer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_308_0, arg_308_1)
	table.insert(arg_308_0.unlockList, arg_308_1)

	if not isActive(arg_308_0.rtFavorUp) then
		setText(arg_308_0.rtFavorUp:Find("Text"), table.remove(arg_308_0.unlockList, 1))
		setActive(arg_308_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_309_0, arg_309_1)
	local var_309_0 = arg_309_1.triggerId
	local var_309_1 = arg_309_1.delta
	local var_309_2 = arg_309_1.cost
	local var_309_3 = arg_309_1.apartment
	local var_309_4 = pg.dorm3d_favor_trigger[var_309_0]

	if var_309_4.is_repeat == 0 then
		if var_309_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_309_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_309_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_309_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_309_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_309_0))
		end
	elseif arg_309_1.delta > 0 then
		local var_309_5, var_309_6 = var_309_3:getFavor()
		local var_309_7 = var_309_5 + var_309_1

		setText(arg_309_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=48>+%d</size>", math.min(9999, var_309_1)))
		setSlider(arg_309_0.rtFavorUpDaily:Find("bg/slider"), 0, var_309_6, var_309_5)
		setAnchoredPosition(arg_309_0.rtFavorUpDaily:Find("bg"), arg_309_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_309_8 = {}
		local var_309_9 = arg_309_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_309_9, function(arg_310_0)
			setActive(arg_310_0, false)
		end)

		local var_309_10

		if var_309_4.effect and var_309_4.effect ~= "" then
			var_309_10 = var_309_9:Find(var_309_4.effect .. "(Clone)")

			if not var_309_10 then
				table.insert(var_309_8, function(arg_311_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_312_0)
						setParent(arg_312_0, var_309_9)

						var_309_10 = tf(arg_312_0)

						arg_311_0()
					end)
				end)
			else
				setActive(var_309_10, true)
			end
		end

		local var_309_11 = arg_309_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_309_11:SetTriggerEvent(function(arg_313_0)
			local var_313_0 = GetComponent(arg_309_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_309_5, var_309_7, 0.5):setOnUpdate(System.Action_float(function(arg_314_0)
				var_313_0.value = arg_314_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_309_0.exited then
						return
					end

					quickPlayAnimator(arg_309_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_309_11:SetEndEvent(function(arg_317_0)
			setActive(arg_309_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_309_8, function()
			local var_318_0 = arg_309_0.ladyDict[var_309_3:GetConfigID()]

			setLocalPosition(arg_309_0.rtFavorUpDaily, arg_309_0:GetLocalPosition(arg_309_0:GetScreenPosition(var_318_0.ladyHeadCenter.position), arg_309_0.rtFavorUpDaily.parent))
			setActive(arg_309_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_309_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_309_0.rtFavorUpDaily, "favor_open")

			if var_309_2 > 0 then
				local var_318_1, var_318_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_309_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_309_2)
				setText(arg_309_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_318_1 + var_309_2, var_318_2))
				setActive(arg_309_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_319_0, arg_319_1, arg_319_2, arg_319_3)
	arg_319_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_319_0.isLock = false
	end))

	local var_319_0 = math.floor(arg_319_1.level / 10)
	local var_319_1 = math.fmod(arg_319_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_319_1, arg_319_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_319_0, arg_319_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_319_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_319_0 > 0)

	local var_319_2
	local var_319_3

	arg_319_0.clientAward, var_319_3 = Dorm3dIconHelper.SplitStory(arg_319_1:getFavorConfig("levelup_client_item", arg_319_1.level))
	arg_319_0.serverAward = arg_319_2

	local var_319_4 = arg_319_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_319_0.levelItemList then
		arg_319_0.levelItemList = UIItemList.New(var_319_4, var_319_4:Find("tpl"))

		arg_319_0.levelItemList:make(function(arg_321_0, arg_321_1, arg_321_2)
			local var_321_0 = arg_321_1 + 1

			if arg_321_0 == UIItemList.EventUpdate then
				if arg_321_1 < #arg_319_0.serverAward then
					updateDorm3dIcon(arg_321_2, arg_319_0.serverAward[var_321_0])
					onButton(arg_319_0, arg_321_2, function()
						arg_319_0:emit(BaseUI.ON_NEW_DROP, {
							drop = arg_319_0.serverAward[var_321_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_321_2, arg_319_0.clientAward[var_321_0 - #arg_319_0.serverAward])
					onButton(arg_319_0, arg_321_2, function()
						arg_319_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_319_0.clientAward[var_321_0 - #arg_319_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_319_0.levelItemList:align(#arg_319_0.serverAward + #arg_319_0.clientAward)
	setActive(arg_319_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	pg.UIMgr.GetInstance():OverlayPanel(arg_319_0.rtLevelUpWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})

	function arg_319_0.levelUpCallback()
		arg_319_0.levelUpCallback = nil

		if var_319_3 then
			arg_319_0:PopNewStoryTip(var_319_3)
		end

		existCall(arg_319_3)
	end
end

function var_0_0.PopNewStoryTip(arg_325_0, arg_325_1, arg_325_2)
	local var_325_0 = arg_325_0.uiContianer:Find("base/top/story_tip")

	setActive(var_325_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_325_0, false)
	end))
	setText(var_325_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_325_1[2]].name))
	existCall(arg_325_2)
end

function var_0_0.UpdateZoneList(arg_327_0)
	local var_327_0

	if arg_327_0.room:isPersonalRoom() then
		var_327_0 = arg_327_0.ladyDict[arg_327_0.apartment:GetConfigID()].ladyBaseZone
	else
		var_327_0 = arg_327_0:GetAttachedFurnitureName()
	end

	for iter_327_0, iter_327_1 in ipairs(arg_327_0.zoneDatas) do
		if iter_327_1:GetWatchCameraName() == var_327_0 then
			setText(arg_327_0.btnZone:Find("Text"), iter_327_1:GetName())
			setTextColor(arg_327_0.rtZoneList:GetChild(iter_327_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_327_0.rtZoneList:GetChild(iter_327_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_328_0, arg_328_1)
	local var_328_0 = {}
	local var_328_1 = {}
	local var_328_2 = arg_328_1.data

	if var_328_2.op_list then
		for iter_328_0, iter_328_1 in ipairs(var_328_2.op_list) do
			table.insert(var_328_0, function(arg_329_0)
				local function var_329_0()
					local var_330_0 = arg_329_0

					arg_329_0 = nil

					return existCall(var_330_0)
				end

				switch(iter_328_1.type, {
					action = function()
						local var_331_0 = arg_328_0.ladyDict[arg_328_0.apartment:GetConfigID()]

						arg_328_0:PlaySingleAction(var_331_0, iter_328_1.name, var_329_0)
					end,
					item_action = function()
						arg_328_0:PlaySceneItemAnim(iter_328_1.id, iter_328_1.name)
						var_329_0()
					end,
					extra_item_action = function()
						local var_333_0 = arg_328_0.ladyDict[arg_328_0.apartment:GetConfigID()].extraItems[iter_328_1.name]

						warning(iter_328_1.name)
						warning(var_333_0.trans)

						if var_333_0 then
							var_333_0.trans:GetComponent(typeof(Animator)):PlayInFixedTime(iter_328_1.param)
						end

						var_329_0()
					end,
					timeline = function()
						if arg_328_0.inTouchGame then
							setActive(arg_328_0.rtTouchGamePanel, false)
						end

						arg_328_0:PlayTimeline(iter_328_1, function(arg_335_0, arg_335_1)
							setActive(arg_328_0.rtTouchGamePanel, arg_328_0.inTouchGame)

							var_328_1.notifiCallback = arg_335_1

							var_329_0()
						end)
					end,
					clickOption = function()
						arg_328_0:DoTalkTouchOption(iter_328_1, arg_328_1.flags, function(arg_337_0)
							var_328_1.optionIndex = arg_337_0

							var_329_0()
						end)
					end,
					wait = function()
						arg_328_0.LTs = arg_328_0.LTs or {}

						table.insert(arg_328_0.LTs, LeanTween.delayedCall(iter_328_1.time, System.Action(var_329_0)).uniqueId)
					end,
					expression = function()
						arg_328_0:emit(arg_328_0.PLAY_EXPRESSION, iter_328_1)
						var_329_0()
					end
				}, function()
					assert(false, "op type error:", iter_328_1.type)
				end)

				if iter_328_1.skip then
					var_329_0()
				end
			end)
		end
	end

	seriesAsync(var_328_0, function()
		if arg_328_1.callbackData then
			arg_328_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_328_1.callbackData.name, var_328_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_342_0)
	if arg_342_0.inGuide or arg_342_0.uiState ~= "base" then
		return
	end

	if arg_342_0.room:GetConfigID() == 1 and arg_342_0:CheckGuide() then
		-- block empty
	elseif arg_342_0.room:isPersonalRoom() and arg_342_0:CheckLevelUp() then
		-- block empty
	elseif arg_342_0.apartment and arg_342_0:CheckEnterDeal() then
		-- block empty
	elseif arg_342_0.apartment and arg_342_0:CheckActiveTalk() then
		-- block empty
	elseif arg_342_0.apartment then
		arg_342_0:CheckFavorTrigger()
	end

	arg_342_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_343_0)
	local var_343_0

	if arg_343_0.contextData.specialId then
		var_343_0 = arg_343_0.contextData.specialId
		arg_343_0.contextData.specialId = nil

		arg_343_0:DoTalk(var_343_0, function()
			arg_343_0:closeView()
		end)
	elseif not arg_343_0.contextData.hasEnterCheck and arg_343_0.apartment then
		for iter_343_0, iter_343_1 in ipairs(arg_343_0.apartment:getForceEnterTalking(arg_343_0.room:GetConfigID())) do
			var_343_0 = iter_343_1

			arg_343_0:DoTalk(iter_343_1)

			break
		end
	end

	if var_343_0 and pg.dorm3d_dialogue_group[var_343_0].extend_loading > 0 then
		arg_343_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_343_0:FinishEnterResume()
		end)
	else
		if arg_343_0.apartment and arg_343_0.contextData.pendingDic[arg_343_0.apartment:GetConfigID()] then
			arg_343_0.contextData.hasEnterCheck = true
		end

		for iter_343_2, iter_343_3 in pairs(arg_343_0.contextData.pendingDic) do
			arg_343_0:SetInPending(arg_343_0.ladyDict[iter_343_2], iter_343_3)
		end

		arg_343_0.contextData.pendingDic = {}

		arg_343_0:FinishEnterResume()
		arg_343_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_346_0)
	if arg_346_0:GetBlackboardValue(arg_346_0.ladyDict[arg_346_0.apartment:GetConfigID()], "inPending") then
		return
	end

	for iter_346_0, iter_346_1 in ipairs({
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
				return arg_346_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_346_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_346_1.name) and iter_346_1.active() then
			arg_346_0:SetAllBlackbloardValue("inGuide", true)

			local function var_346_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_346_1.name)))
				arg_346_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_346_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_346_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_346_1.name, nil, var_346_0, var_346_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_352_0)
	for iter_352_0, iter_352_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_353_0 = getProxy(CollectionProxy):getShipGroup(arg_352_0.apartment.configId)

				return tobool(var_353_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_354_0 = getProxy(CollectionProxy):getShipGroup(arg_352_0.apartment.configId)

				return var_354_0 and var_354_0.married > 0
			end
		}
	}) do
		if arg_352_0.apartment.triggerCountDic[iter_352_1.triggerId] == 0 and iter_352_1.active() then
			arg_352_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_352_0.apartment.configId, iter_352_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_355_0)
	if arg_355_0.contextData.hasEnterCheck then
		return false
	end

	local var_355_0 = arg_355_0.apartment:GetConfigID()
	local var_355_1 = "dorm3d_enter_count_" .. var_355_0
	local var_355_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_355_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_355_2)
		PlayerPrefs.SetInt(var_355_1, 1)
	else
		PlayerPrefs.SetInt(var_355_1, PlayerPrefs.GetInt(var_355_1, 0) + 1)
	end

	local var_355_3 = arg_355_0.apartment:getEnterTalking(arg_355_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_355_3 > 0 then
		arg_355_0:DoTalk(var_355_3[math.random(#var_355_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_356_0)
	local var_356_0 = arg_356_0.ladyDict[arg_356_0.apartment:GetConfigID()]

	if arg_356_0:GetBlackboardValue(var_356_0, "inPending") then
		return false
	end

	local var_356_1 = arg_356_0.apartment:getZoneTalking(arg_356_0.room:GetConfigID(), var_356_0.ladyBaseZone)

	if #var_356_1 > 0 then
		arg_356_0:DoTalk(var_356_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_357_0, arg_357_1, arg_357_2)
	local var_357_0 = arg_357_0.ladyDict[arg_357_1].ladyBaseZone
	local var_357_1 = getProxy(ApartmentProxy):getApartment(arg_357_1)

	for iter_357_0, iter_357_1 in ipairs(var_357_1:getDistanceTalking(arg_357_0.room:GetConfigID(), var_357_0)) do
		arg_357_0:DoTalk(iter_357_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_358_0, arg_358_1)
	if arg_358_0.room:isPersonalRoom() then
		return switch(arg_358_1, {
			Talk = function()
				local var_359_0 = 1

				return var_359_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_359_0)
			end,
			Touch = function()
				local var_360_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_360_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_360_0)
			end,
			Gift = function()
				local var_361_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_361_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_361_0)
			end,
			PublicGame = function()
				return false
			end,
			Photo = function()
				local var_363_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_363_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_363_0)
			end,
			Collection = function()
				local var_364_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_364_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_364_0)
			end,
			Furniture = function()
				local var_365_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_365_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_365_0)
			end,
			DayNight = function()
				local var_366_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_366_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_366_0)
			end,
			Accompany = function()
				local var_367_0 = 1

				return var_367_0 <= arg_358_0.apartment.level, i18n("apartment_level_unenough", var_367_0)
			end,
			MiniGame = function()
				local var_368_0 = 1

				if var_368_0 > arg_358_0.apartment.level then
					return false, i18n("apartment_level_unenough", var_368_0)
				elseif #arg_358_0.room:getMiniGames() <= 0 then
					return false, "without minigame config in room:" .. arg_358_0.room.configId
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
		return switch(arg_358_1, {
			Gift = function()
				return false
			end,
			PublicGame = function()
				return true
			end,
			Furniture = function()
				local var_374_0 = arg_358_0.room:GetFurnitureIDList()

				return var_374_0 and #var_374_0 > 0
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

function var_0_0.CheckLevelUp(arg_380_0)
	if arg_380_0.apartment:canLevelUp() then
		arg_380_0:emit(Dorm3dRoomMediator.FAVOR_LEVEL_UP, arg_380_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetIKHandTF(arg_381_0)
	return arg_381_0.ikHand
end

function var_0_0.CycleIKCameraGroup(arg_382_0)
	local var_382_0 = arg_382_0.ladyDict[arg_382_0.apartment:GetConfigID()]

	assert(arg_382_0:GetBlackboardValue(var_382_0, "inIK"))
	seriesAsync({
		function(arg_383_0)
			pg.IKMgr.GetInstance():ResetActiveIKs()

			local var_383_0 = var_382_0.ikConfig
			local var_383_1 = var_383_0.camera_group
			local var_383_2 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_383_1]
			local var_383_3 = var_383_2[table.indexof(var_383_2, var_383_0.id) % #var_383_2 + 1]

			arg_382_0:SwitchIKConfig(var_382_0, var_383_3)
			arg_382_0:SetIKState(true)
		end
	})
end

function var_0_0.TempHideUI(arg_384_0, arg_384_1, arg_384_2)
	local var_384_0 = defaultValue(arg_384_0.hideCount, 0)

	arg_384_0.hideCount = var_384_0 + (arg_384_1 and 1 or -1)

	assert(arg_384_0.hideCount >= 0)

	if arg_384_0.hideCount * var_384_0 > 0 then
		return existCall(arg_384_2)
	elseif arg_384_0.hideCount > 0 then
		arg_384_0:SetUI(arg_384_2, "blank")
	else
		arg_384_0:SetUI(arg_384_2, "back")
	end
end

function var_0_0.onBackPressed(arg_385_0)
	if arg_385_0.exited or arg_385_0.retainCount > 0 then
		-- block empty
	elseif isActive(arg_385_0.rtLevelUpWindow) then
		triggerButton(arg_385_0.rtLevelUpWindow:Find("bg"))
	elseif arg_385_0.uiState ~= "base" then
		-- block empty
	else
		arg_385_0:closeView()
	end
end

function var_0_0.willExit(arg_386_0)
	if arg_386_0.downTimer then
		arg_386_0.downTimer:Stop()

		arg_386_0.downTimer = nil
	end

	if arg_386_0.LTs then
		underscore.map(arg_386_0.LTs, function(arg_387_0)
			LeanTween.cancel(arg_387_0)
		end)

		arg_386_0.LTs = nil
	end

	if arg_386_0.sliderLT then
		LeanTween.cancel(arg_386_0.sliderLT)

		arg_386_0.sliderLT = nil
	end

	for iter_386_0, iter_386_1 in pairs(arg_386_0.ladyDict) do
		iter_386_1.wakeUpTalkId = nil
	end

	if arg_386_0.accompanyFavorTimer then
		arg_386_0.accompanyFavorTimer:Stop()

		arg_386_0.accompanyFavorTimer = nil
	end

	if arg_386_0.accompanyPerformanceTimer then
		arg_386_0.accompanyPerformanceTimer:Stop()

		arg_386_0.accompanyPerformanceTimer = nil
	end

	arg_386_0.canTriggerAccompanyPerformance = nil

	arg_386_0.videoPlayer:Destroy()
	var_0_0.super.willExit(arg_386_0)
end

return var_0_0
