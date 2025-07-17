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

			local var_22_0 = {}

			if arg_4_0.room:isPersonalRoom() and not arg_4_0:GetBlackboardValue(arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()], "inPending") then
				table.insert(var_22_0, function(arg_23_0)
					arg_4_0:OutOfLazy(arg_4_0.apartment:GetConfigID(), arg_23_0)
				end)
			end

			table.insert(var_22_0, function(arg_24_0)
				arg_4_0:ShiftZone(var_21_1, arg_24_0)
			end)
			seriesAsync(var_22_0, function()
				arg_4_0:CheckQueue()
			end)
		end, SFX_PANEL)
	end)

	local var_4_2 = arg_4_0.uiContianer:Find("walk")
	local var_4_3 = arg_4_0.uiContianer:Find("ik")

	onButton(arg_4_0, var_4_3:Find("btn_back"), function()
		if arg_4_0.ikSpecialCall then
			local var_26_0 = arg_4_0.ikSpecialCall

			arg_4_0.ikSpecialCall = nil

			existCall(var_26_0)
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
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_SKIN_SELECT_LAYER, arg_4_0.apartment:GetConfigID(), arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()], function(arg_33_0, arg_33_1, arg_33_2)
			seriesAsync({
				function(arg_34_0)
					arg_4_0:SetIKState(false, arg_34_0)
				end,
				function(arg_35_0)
					arg_33_0:SwitchCharacterSkin(arg_33_1, arg_33_2)
					arg_4_0:SwitchIKConfig(arg_33_0, arg_33_0.ikConfig.id)
					arg_4_0:SetIKState(true, arg_35_0)
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
	eachChild(arg_4_0.ikHand, function(arg_37_0)
		setActive(arg_37_0, false)
	end)

	arg_4_0.ikTextTipsRoot = var_4_4:Find("TextTips")

	setActive(arg_4_0.ikTextTipsRoot, false)
	eachChild(arg_4_0.ikTextTipsRoot, function(arg_38_0)
		setActive(arg_38_0, false)
	end)

	arg_4_0.ikControlUI = var_4_4

	local var_4_5 = arg_4_0.uiContianer:Find("accompany")

	onButton(arg_4_0, var_4_5:Find("btn_back"), function()
		arg_4_0:ExitAccompanyMode()
	end, SFX_DORM_BACK)

	arg_4_0.unlockList = {}
	arg_4_0.rtFavorUp = arg_4_0._tf:Find("Toast/favor_up")

	arg_4_0.rtFavorUp:GetComponent("DftAniEvent"):SetEndEvent(function(arg_40_0)
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

	var_4_6:SetTriggerEvent(function(arg_41_0)
		local var_41_0, var_41_1 = getProxy(ApartmentProxy):getStamina()

		setText(arg_4_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_41_0, var_41_1))
	end)
	var_4_6:SetEndEvent(function(arg_42_0)
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
		local var_47_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()].ladyBaseZone
		local var_47_1 = arg_4_0.apartment:getFurnitureTalking(arg_4_0.room:GetConfigID(), var_47_0)

		if #var_47_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without topic")

			return
		end

		arg_4_0:DoTalk(var_47_1[math.random(#var_47_1)], function()
			local var_48_0 = getDorm3dGameset("drom3d_favir_trigger_talk")[1]

			arg_4_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_4_0.apartment.configId, var_48_0)
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

		local var_52_0 = pg.dorm3d_minigame[arg_4_0.nowMiniGameId]
		local var_52_1 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

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

		local var_52_2 = {}

		table.insert(var_52_2, function(arg_53_0)
			arg_4_0:SetAllBlackbloardValue("inLockLayer", true)
			arg_4_0:TempHideUI(true, arg_53_0)
		end)

		if var_52_0.area ~= "" and var_52_1.ladyBaseZone ~= var_52_0.area then
			table.insert(var_52_2, function(arg_54_0)
				arg_4_0:ShiftZone(var_52_0.area, arg_54_0)
			end)
		end

		local var_52_3
		local var_52_4

		if var_52_0.action ~= "" then
			var_52_3, var_52_4 = unpack(var_52_0.action)
		end

		table.insert(var_52_2, function(arg_55_0)
			parallelAsync({
				function(arg_56_0)
					if var_52_3 then
						arg_4_0:PlaySingleAction(var_52_1, var_52_3, arg_56_0)
					else
						arg_56_0()
					end
				end,
				function(arg_57_0)
					arg_4_0:ActiveStateCamera("talk", arg_57_0)
				end
			}, arg_55_0)
		end)
		table.insert(var_52_2, function(arg_58_0)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(1))
			arg_4_0:HandleGameNotification(Dorm3dMiniGameMediator.OPERATION, {
				operationCode = "BEFORE_OPEN_GAME",
				miniGameId = arg_4_0.nowMiniGameId
			})
			arg_4_0:EnableMiniGameCutIn()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_MINIGAME_WINDOW, {
				isDorm3d = true,
				minigameId = arg_4_0.nowMiniGameId
			}, arg_58_0)
		end)
		table.insert(var_52_2, function(arg_59_0)
			arg_4_0:DisableMiniGameCutIn()

			if var_52_4 then
				arg_4_0:PlaySingleAction(var_52_1, var_52_4, arg_59_0)
			else
				arg_59_0()
			end
		end)
		seriesAsync(var_52_2, function()
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

	eachChild(var_4_8, function(arg_69_0)
		setActive(arg_69_0, arg_69_0.name == "walk")
	end)

	arg_4_0._joystick = arg_4_0._tf:Find("Stick")

	setActive(arg_4_0._joystick, false)
	arg_4_0._joystick:GetComponent(typeof(SlideController)):SetStickFunc(function(arg_70_0)
		arg_4_0:emit(arg_4_0.ON_STICK_MOVE, arg_70_0)
	end)

	arg_4_0.povLayer = arg_4_0._tf:Find("POVControl")

	setActive(arg_4_0.povLayer, false)
	;(function()
		local var_71_0 = arg_4_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

		var_71_0:AddBeginDragFunc(function(arg_72_0, arg_72_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_BEGIN, arg_72_1)
		end)
		var_71_0:SetStickFunc(function(arg_73_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE, arg_73_0)
		end)
		var_71_0:AddDragEndFunc(function(arg_74_0, arg_74_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_END, arg_74_1)
		end)
		arg_4_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_75_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_VIEW, arg_75_0)
		end)
	end)()

	arg_4_0.ikControlLayer = var_4_4:Find("ControlLayer")

	;(function()
		local var_76_0
		local var_76_1 = arg_4_0.ikControlLayer:GetComponent(typeof(SlideController))

		var_76_1:AddBeginDragFunc(function(arg_77_0, arg_77_1)
			local var_77_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if not var_77_0.IKSettings then
				return
			end

			local var_77_1 = arg_77_1.position
			local var_77_2 = CameraMgr.instance:Raycast(var_77_0.IKSettings.CameraRaycaster, var_77_1)

			if var_77_2.Length ~= 0 then
				local var_77_3 = var_77_2[0].gameObject.transform
				local var_77_4 = table.keyof(var_77_0.IKSettings.Colliders, var_77_3)

				warning(var_77_3, var_77_4)

				if var_77_4 then
					arg_4_0:emit(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, var_77_0, var_77_4, var_77_1)

					var_76_0 = tobool(var_77_0.ikHandler)

					return
				end
			end
		end)
		var_76_1:AddDragFunc(function(arg_78_0, arg_78_1)
			local var_78_0 = arg_78_1.position
			local var_78_1 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_78_1.ikHandler then
				arg_4_0:emit(var_0_0.ON_DRAG_CHARACTER_BODY, var_78_1, var_78_0)

				return
			end

			if var_76_0 then
				return
			end

			local var_78_2 = arg_78_1.delta

			arg_4_0:emit(arg_4_0.ON_STICK_MOVE, var_78_2)
		end)
		var_76_1:AddDragEndFunc(function(arg_79_0, arg_79_1)
			var_76_0 = nil

			local var_79_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_79_0.ikHandler then
				arg_4_0:emit(var_0_0.ON_RELEASE_CHARACTER_BODY, var_79_0)

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

function var_0_0.InitExtraSystem(arg_81_0, arg_81_1)
	arg_81_1 = arg_81_1 or {
		"FurnitureSlide"
	}

	for iter_81_0, iter_81_1 in ipairs(arg_81_1) do
		switch(iter_81_1, {
			FurnitureSlide = function()
				if not SlideExtraSystem.IsOpen(arg_81_0.room) then
					return
				end

				arg_81_0:emit(Dorm3dRoomMediator.ADD_EXTRA_SYSTEM_FURNITURE_SLIDE, {
					scene = arg_81_0
				})
			end
		})
	end
end

function var_0_0.BindEvent(arg_83_0)
	var_0_0.super.BindEvent(arg_83_0)
	arg_83_0:bind(arg_83_0.CLICK_CHARACTER, function(arg_84_0, arg_84_1)
		if arg_83_0.uiState ~= "base" or not arg_83_0.ladyDict[arg_84_1].nowCanWatchState then
			return
		end

		local var_84_0 = {}
		local var_84_1 = arg_83_0.ladyDict[arg_84_1]

		if arg_83_0:GetBlackboardValue(var_84_1, "inPending") then
			table.insert(var_84_0, function(arg_85_0)
				arg_83_0:OutOfPending(arg_84_1, arg_85_0)
			end)
		else
			table.insert(var_84_0, function(arg_86_0)
				arg_83_0:OutOfLazy(arg_84_1, arg_86_0)
			end)
		end

		seriesAsync(var_84_0, function()
			if not arg_83_0.room:isPersonalRoom() then
				arg_83_0:SetApartment(getProxy(ApartmentProxy):getApartment(arg_84_1))
			end

			arg_83_0:EnterWatchMode()
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	arg_83_0:bind(arg_83_0.CLICK_CONTACT, function(arg_88_0, arg_88_1)
		arg_83_0:TriggerContact(arg_88_1)
	end)
	arg_83_0:bind(arg_83_0.DISTANCE_TRIGGER, function(arg_89_0, arg_89_1, arg_89_2)
		if arg_83_0.uiState == "base" then
			arg_83_0:CheckDistanceTalk(arg_89_1, arg_89_2)
		end
	end)
	arg_83_0:bind(arg_83_0.WALK_DISTANCE_TRIGGER, function(arg_90_0, arg_90_1, arg_90_2)
		if arg_83_0.apartment and arg_83_0.apartment:GetConfigID() == arg_90_1 then
			existCall(arg_83_0.walkNearCallback, arg_90_2)
		end
	end)
	arg_83_0:bind(arg_83_0.CHANGE_WATCH, function(arg_91_0, arg_91_1)
		arg_83_0:ChangeCanWatchState(arg_83_0.ladyDict[arg_91_1])
	end)
	arg_83_0:bind(arg_83_0.ON_TOUCH_CHARACTER, function(arg_92_0, arg_92_1)
		local var_92_0 = arg_83_0.ladyDict[arg_83_0.apartment:GetConfigID()]

		if not arg_83_0:GetBlackboardValue(var_92_0, "inIK") then
			return
		end

		arg_83_0:OnTouchCharacterBody(arg_92_1)
	end)
	arg_83_0:bind(var_0_0.ON_IK_STATUS_CHANGED, function(arg_93_0, arg_93_1, arg_93_2)
		local var_93_0 = arg_83_0.ladyDict[arg_83_0.apartment:GetConfigID()]

		if not arg_83_0:GetBlackboardValue(var_93_0, "inTouching") then
			return
		end

		arg_83_0:DoTouch(arg_93_1, arg_93_2)
	end)
	arg_83_0:bind(arg_83_0.ON_ENTER_SECTOR, function(arg_94_0, arg_94_1)
		arg_83_0:ChangeCanWatchState(arg_83_0.ladyDict[arg_94_1])
	end)
	arg_83_0:bind(arg_83_0.ON_CHANGE_DISTANCE, function(arg_95_0, arg_95_1, arg_95_2)
		arg_83_0:ChangeCanWatchState(arg_83_0.ladyDict[arg_95_1])
	end)
end

function var_0_0.didEnter(arg_96_0)
	arg_96_0:InitExtraSystem()

	arg_96_0.resumeCallback = arg_96_0.contextData.resumeCallback
	arg_96_0.contextData.resumeCallback = nil

	var_0_0.super.didEnter(arg_96_0)
	arg_96_0:UpdateZoneList()
	arg_96_0:SetUI(function()
		arg_96_0:didEnterCheck()
	end, "base")
end

function var_0_0.FinishEnterResume(arg_98_0)
	if not arg_98_0.resumeCallback then
		return
	end

	local var_98_0 = arg_98_0.resumeCallback

	arg_98_0.resumeCallback = nil

	return var_98_0()
end

function var_0_0.EnableJoystick(arg_99_0, arg_99_1)
	setActive(arg_99_0._joystick, arg_99_1)
end

function var_0_0.EnablePOVLayer(arg_100_0, arg_100_1)
	setActive(arg_100_0.povLayer, arg_100_1)

	if not arg_100_1 then
		arg_100_0:emit(arg_100_0.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUIStore(arg_101_0, arg_101_1, ...)
	table.insertto(arg_101_0.uiStore, {
		...
	})
	existCall(arg_101_1)
end

function var_0_0.SetUI(arg_102_0, arg_102_1, ...)
	while rawget(arg_102_0, "class") ~= var_0_0 do
		arg_102_0 = getmetatable(arg_102_0).__index
	end

	table.insertto(arg_102_0.uiStore, {
		...
	})

	for iter_102_0, iter_102_1 in ipairs(arg_102_0.uiStore) do
		if iter_102_1 == "back" then
			assert(#arg_102_0.uiStack > 0)

			arg_102_0.uiState = table.remove(arg_102_0.uiStack)
		elseif iter_102_1 == arg_102_0.uiState and iter_102_1 == "ik" then
			-- block empty
		else
			table.insert(arg_102_0.uiStack, arg_102_0.uiState)

			arg_102_0.uiState = iter_102_1
		end
	end

	arg_102_0.uiStore = {}

	eachChild(arg_102_0.uiContianer, function(arg_103_0)
		setActive(arg_103_0, arg_103_0.name == arg_102_0.uiState)
	end)
	arg_102_0:EnablePOVLayer(arg_102_0.uiState == "base" or arg_102_0.uiState == "walk")
	arg_102_0:TempHideContact(arg_102_0.uiState ~= "base")
	arg_102_0:SetFloatEnable(arg_102_0.uiState == "walk")
	setActive(arg_102_0.rtFloatPage, arg_102_0.uiState == "walk")
	setActive(arg_102_0.ikControlUI, arg_102_0.uiState == "ik")
	switch(arg_102_0.uiState, {
		base = function()
			if not arg_102_0.room:isPersonalRoom() then
				arg_102_0:SetApartment(nil)
			end

			arg_102_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_102_0.rtRole, function(arg_106_0)
				setActive(arg_106_0, false)
			end)

			local var_105_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"MiniGame",
				"PublicGame",
				"Performance"
			}, function(arg_107_0)
				return arg_102_0:CheckSystemOpen(arg_107_0)
			end)
			local var_105_1 = 0.05

			for iter_105_0, iter_105_1 in ipairs(var_105_0) do
				LeanTween.delayedCall(var_105_1, System.Action(function()
					setActive(arg_102_0.rtRole:Find(iter_105_1), true)
				end))

				var_105_1 = var_105_1 + 0.066
			end

			setActive(arg_102_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_102_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_102_0.uiContianer:Find("ik/Right/MenuSmall"), arg_102_0.room:isPersonalRoom() and not arg_102_0.performanceInfo)
			setActive(arg_102_0.uiContianer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_102_0.uiContianer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_102_0.apartment:getConfig("name")))
		end
	})
	arg_102_0:ActiveStateCamera(arg_102_0.uiState, function()
		if arg_102_1 then
			arg_102_1()
		elseif arg_102_0.uiState == "base" then
			arg_102_0:CheckQueue()
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
	arg_118_1.ladyBaseZone = arg_118_0.contextData.ladyZone[var_118_0]
	arg_118_1.ladyActiveZone = var_118_1.welcome_staypoint

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
	local var_130_0 = arg_130_0.ladyDict[arg_130_0.apartment:GetConfigID()]
	local var_130_1 = arg_130_0.room:getApartmentZoneConfig(var_130_0.ladyBaseZone, "touch_performance", arg_130_0.apartment:GetConfigID())

	if not var_130_1 or var_130_1 == 0 then
		arg_130_0:EnterTouchMode()
	else
		arg_130_0:DoTalk(var_130_1)
	end
end

function var_0_0.EnterTouchMode(arg_131_0)
	local var_131_0 = arg_131_0.ladyDict[arg_131_0.apartment:GetConfigID()]

	if arg_131_0:GetBlackboardValue(var_131_0, "inTouching") then
		return
	end

	local var_131_1 = arg_131_0.room:getApartmentZoneConfig(var_131_0.ladyBaseZone, "touch_id", arg_131_0.apartment:GetConfigID())

	arg_131_0.touchConfig = pg.dorm3d_touch_data[var_131_1]

	if not arg_131_0.touchConfig then
		arg_131_0:EnterTimelineTouchMode()

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

	local var_131_2 = {}

	table.insert(var_131_2, function(arg_133_0)
		arg_131_0:SetBlackboardValue(var_131_0, "inTouching", true)
		arg_131_0:emit(arg_131_0.SHOW_BLOCK)
		arg_131_0:SetUI(arg_133_0, "blank")
	end)
	table.insert(var_131_2, function(arg_134_0)
		local var_134_0 = arg_131_0.touchConfig.ik_status[1]

		arg_131_0:SwitchIKConfig(var_131_0, var_134_0)
		setActive(arg_131_0.uiContianer:Find("ik/btn_back"), true)
		arg_131_0:SetIKState(true, arg_134_0)
	end)
	table.insert(var_131_2, function(arg_135_0)
		existCall(arg_135_0)
	end)
	seriesAsync(var_131_2, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_131_0:emit(arg_131_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_137_0)
	local var_137_0 = arg_137_0.ladyDict[arg_137_0.apartment:GetConfigID()]

	if not arg_137_0:GetBlackboardValue(var_137_0, "inTouching") then
		return
	end

	if arg_137_0.touchTimelineConfig then
		existCall(arg_137_0.timelineFinishCall)

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
	local var_144_0 = arg_144_0.ladyDict[arg_144_0.apartment:GetConfigID()]

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

function var_0_0.EnterTimelineTouchMode(arg_149_0)
	local var_149_0 = arg_149_0.ladyDict[arg_149_0.apartment:GetConfigID()]

	if arg_149_0:GetBlackboardValue(var_149_0, "inIK") then
		return
	end

	local var_149_1 = arg_149_0.room:getApartmentZoneConfig(var_149_0.ladyBaseZone, "touch_id", arg_149_0.apartment:GetConfigID())
	local var_149_2 = pg.dorm3d_ik_timeline[var_149_1]

	assert(var_149_2, "Missing config in dorm3d_ik_timeline ID: " .. (var_149_1 or "nil"))

	arg_149_0.touchTimelineConfig = var_149_2

	local var_149_3 = {}

	table.insert(var_149_3, function(arg_150_0)
		arg_149_0:SetBlackboardValue(var_149_0, "inIK", true)
		arg_149_0:emit(arg_149_0.SHOW_BLOCK)
		arg_149_0:SetUI(arg_150_0, "ik")
	end)
	table.insert(var_149_3, function(arg_151_0)
		setActive(arg_149_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_149_0.uiContianer:Find("ik/Right/btn_camera"), false)
		setActive(arg_149_0.uiContianer:Find("ik/Right/Menu"), false)
		setActive(arg_149_0.uiContianer:Find("ik/Right/MenuSmall"), false)
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_149_0:emit(arg_149_0.HIDE_BLOCK)
		arg_149_0:HideCharacterBylayer(var_149_0)
		setActive(var_149_0.ladyCollider, false)

		local var_151_0
		local var_151_1

		if #var_149_2.scene > 0 then
			var_151_0, var_151_1 = unpack(string.split(var_149_2.scene, "|"))
		end

		arg_149_0:PlayTimeline({
			name = var_149_2.timeline,
			scene = var_151_0,
			sceneRoot = var_151_1
		}, function(arg_152_0, arg_152_1)
			arg_152_1()
			arg_149_0:ExitTimelineTouchMode()
		end)
	end)
	seriesAsync(var_149_3, function()
		return
	end)
end

function var_0_0.ExitTimelineTouchMode(arg_154_0)
	local var_154_0 = arg_154_0.ladyDict[arg_154_0.apartment:GetConfigID()]

	if not arg_154_0:GetBlackboardValue(var_154_0, "inIK") then
		return
	end

	arg_154_0.touchTimelineConfig = nil

	local var_154_1 = {}

	table.insert(var_154_1, function(arg_155_0)
		arg_154_0:emit(arg_154_0.SHOW_BLOCK)
		Shader.SetGlobalFloat("_ScreenClipOff", 1)
		arg_155_0()
	end)
	table.insert(var_154_1, function(arg_156_0)
		arg_154_0:RevertCharacterBylayer(var_154_0)
		setActive(var_154_0.ladyCollider, true)
		arg_154_0:SetUI(arg_156_0, "back")
	end)
	seriesAsync(var_154_1, function()
		arg_154_0:SetBlackboardValue(var_154_0, "inIK", false)
		arg_154_0:emit(arg_154_0.HIDE_BLOCK)
	end)
end

function var_0_0.EnterWalkMode(arg_158_0)
	local var_158_0 = arg_158_0.apartment:GetConfigID()
	local var_158_1 = arg_158_0.ladyDict[var_158_0]

	seriesAsync({
		function(arg_159_0)
			arg_158_0:emit(arg_158_0.SHOW_BLOCK)
			arg_158_0:HideCharacter(var_158_0)
			arg_158_0:SetBlackboardValue(var_158_1, "inWalk", true)
			arg_158_0:SetUI(arg_159_0, "walk")
		end,
		function(arg_160_0)
			arg_158_0:emit(arg_158_0.HIDE_BLOCK)
			arg_158_0:ChangeArtScene(arg_158_0.walkInfo.scene .. "|" .. arg_158_0.walkInfo.sceneRoot, arg_160_0)
		end,
		function(arg_161_0)
			arg_158_0:LoadSubScene(arg_158_0.walkInfo, arg_161_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_163_0)
	local var_163_0 = arg_163_0.apartment:GetConfigID()
	local var_163_1 = arg_163_0.ladyDict[var_163_0]

	seriesAsync({
		function(arg_164_0)
			arg_163_0:ChangeArtScene(arg_163_0.walkLastSceneInfo, arg_164_0)
		end,
		function(arg_165_0)
			arg_163_0:UnloadSubScene(arg_163_0.walkInfo, arg_165_0)
		end,
		function(arg_166_0)
			arg_163_0:emit(arg_163_0.SHOW_BLOCK)
			arg_163_0:SetUI(arg_166_0, "back")
		end
	}, function()
		arg_163_0:emit(arg_163_0.HIDE_BLOCK)
		arg_163_0:RevertCharacter(var_163_0)
		arg_163_0:SetBlackboardValue(var_163_1, "inWalk", false)

		local var_167_0 = arg_163_0.walkExitCall

		arg_163_0.walkExitCall = nil
		arg_163_0.walkLastSceneInfo = nil
		arg_163_0.walkInfo = nil

		existCall(var_167_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_168_0)
	if not arg_168_0.tfCutIn then
		return
	end

	local var_168_0 = arg_168_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_168_0, true)

	local var_168_1 = GetOrAddComponent(var_168_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_168_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_168_1, arg_168_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_168_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_168_0.modelCutIn.player, "Idle")
	setActive(arg_168_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_169_0)
	if not arg_169_0.tfCutIn then
		return
	end

	local var_169_0 = arg_169_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_169_1 = GetOrAddComponent(var_169_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_169_1)
	setActive(var_169_0, false)
	setActive(arg_169_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_170_0, arg_170_1, arg_170_2)
	local var_170_0 = pg.dorm3d_ik_status[arg_170_2]

	if var_170_0.skin_id ~= arg_170_1.skinId then
		local var_170_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_170_0.base]
		local var_170_2 = _.detect(var_170_1, function(arg_171_0)
			return pg.dorm3d_ik_status[arg_171_0].skin_id == arg_170_1.skinId
		end)

		assert(var_170_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_170_1.skinId, arg_170_2))

		var_170_0 = pg.dorm3d_ik_status[var_170_2]
	end

	arg_170_1.ikConfig = var_170_0
end

function var_0_0.SetIKState(arg_172_0, arg_172_1, arg_172_2)
	local var_172_0 = arg_172_0.ladyDict[arg_172_0.apartment:GetConfigID()]
	local var_172_1 = {}

	if arg_172_1 then
		table.insert(var_172_1, function(arg_173_0)
			arg_172_0:SetBlackboardValue(var_172_0, "inIK", true)
			arg_172_0:emit(arg_172_0.SHOW_BLOCK)

			local var_173_0 = var_172_0.ikConfig.camera_group

			setActive(arg_172_0.uiContianer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_173_0] > 1)
			setActive(arg_172_0.ikControlUI, true)
			arg_173_0()
		end)

		if arg_172_0.uiState ~= "ik" then
			table.insert(var_172_1, function(arg_174_0)
				arg_172_0:SetUI(arg_174_0, "ik")
			end)
		end

		table.insert(var_172_1, function(arg_175_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_172_0:SetIKStatus(var_172_0, var_172_0.ikConfig, arg_175_0)
		end)
		table.insert(var_172_1, function(arg_176_0)
			arg_172_0:emit(arg_172_0.HIDE_BLOCK)
			arg_176_0()
		end)
	else
		assert(arg_172_0.uiState == "ik")
		table.insert(var_172_1, function(arg_177_0)
			setActive(arg_172_0.ikControlUI, false)
			arg_172_0:emit(arg_172_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_177_0()
		end)
		table.insert(var_172_1, function(arg_178_0)
			arg_172_0:ExitIKStatus(var_172_0, var_172_0.ikConfig, arg_178_0)
			arg_172_0:ResetSceneItemAnimators()
		end)
		table.insert(var_172_1, function(arg_179_0)
			arg_172_0:SetUI(arg_179_0, "back")
		end)
		table.insert(var_172_1, function(arg_180_0)
			arg_172_0:SetBlackboardValue(var_172_0, "inIK", false)
			arg_172_0:emit(arg_172_0.HIDE_BLOCK)
			arg_180_0()
		end)
	end

	seriesAsync(var_172_1, arg_172_2)
end

function var_0_0.TouchModeAction(arg_181_0, arg_181_1, arg_181_2, arg_181_3, ...)
	return switch(arg_181_3, {
		function(arg_182_0, arg_182_1)
			return function(arg_183_0)
				seriesAsync({
					function(arg_184_0)
						if not arg_182_1 or arg_182_1 == "" then
							return arg_184_0()
						end

						arg_181_0:PlaySingleAction(arg_181_1, arg_182_1, arg_184_0)
					end,
					function(arg_185_0)
						arg_181_0:SwitchIKConfig(arg_181_1, arg_182_0)
						arg_181_0:SetIKState(true, arg_185_0)
					end,
					arg_183_0
				})
			end
		end,
		function()
			return function()
				if arg_181_0.ikSpecialCall then
					local var_187_0 = arg_181_0.ikSpecialCall

					arg_181_0.ikSpecialCall = nil

					existCall(var_187_0)
				else
					arg_181_0:ExitTouchMode()
				end
			end
		end,
		function(arg_188_0, arg_188_1)
			return function(arg_189_0)
				arg_181_0:PlaySingleAction(arg_181_1, arg_188_1, arg_189_0)
			end
		end,
		function(arg_190_0, arg_190_1, arg_190_2)
			return function(arg_191_0)
				seriesAsync({
					function(arg_192_0)
						arg_181_0:DoTalk(arg_190_1, arg_192_0)
					end,
					function(arg_193_0)
						if not arg_190_2 or arg_190_2 == 0 then
							return arg_193_0()
						end

						arg_181_0:SwitchIKConfig(arg_181_1, arg_190_2)
						arg_181_0:SetIKState(true, arg_193_0)
					end,
					arg_191_0
				})
			end
		end,
		function(arg_194_0, arg_194_1, arg_194_2, arg_194_3)
			return function(arg_195_0)
				arg_181_0:PlaySceneItemAnim(arg_194_2, arg_194_3)
				arg_181_0:PlaySingleAction(arg_194_1, arg_195_0)
			end
		end,
		function(arg_196_0)
			return function(arg_197_0)
				local var_197_0 = pg.dorm3d_ik_touch[arg_181_2]

				if #var_197_0.scene_item == 0 then
					return
				end

				local var_197_1 = arg_181_0:GetSceneItem(var_197_0.scene_item)

				if not var_197_1 then
					warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_181_2, var_197_0.scene_item))

					return
				end

				local var_197_2 = var_197_1:Find(arg_196_0)

				if not IsNil(var_197_2) then
					setActive(var_197_2, false)
					setActive(var_197_2, true)
				end

				arg_197_0()
			end
		end,
		function(arg_198_0)
			local var_198_0 = pg.dorm3d_ik_touch_move[arg_198_0]
			local var_198_1 = var_198_0.target_ik
			local var_198_2 = var_198_0.move_time
			local var_198_3 = var_198_0.ik_point
			local var_198_4 = var_198_0.touch_step

			arg_181_1.IKSettings.forceMove = arg_181_1.IKSettings.forceMove or {}

			local var_198_5 = arg_181_1.IKSettings.forceMove

			var_198_5[var_198_1] = var_198_5[var_198_1] or {}
			var_198_5[var_198_1].count = var_198_5[var_198_1].count or 0

			return function(arg_199_0)
				seriesAsync({
					function(arg_200_0)
						if var_198_5[var_198_1].count >= #var_198_4 then
							return arg_200_0()
						end

						local var_200_0 = Dorm3dIK.New({
							configId = var_198_1
						})
						local var_200_1 = Vector2.New(unpack(var_198_3))
						local var_200_2 = var_198_5[var_198_1].count
						local var_200_3 = var_198_4[var_200_2 + 1] - (var_200_2 == 0 and 0 or var_198_4[var_200_2])

						var_198_5[var_198_1].count = var_200_2 + 1

						pg.IKMgr.GetInstance():ResetIK(var_200_0:GetTriggerBoneName())

						local var_200_4 = arg_181_1.IKSettings.Colliders[var_200_0:GetTriggerBoneName()]
						local var_200_5 = arg_181_0.raycastCamera:WorldToScreenPoint(var_200_4.position)

						pg.IKMgr.GetInstance():PlayIKMove(var_200_5, var_200_0:GetTriggerBoneName(), var_200_1, var_198_4[var_200_2 + 1], var_198_2, function()
							var_198_5[var_198_1].count = 0

							arg_200_0()
						end)
					end,
					arg_199_0
				})
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_204_0, arg_204_1)
	local var_204_0 = arg_204_0.ladyDict[arg_204_0.apartment:GetConfigID()]

	if var_204_0.ikTimelineMode then
		arg_204_0:ExitIKTimelineStatus(var_204_0)

		local var_204_1 = arg_204_1:GetTimelineAction()

		if var_204_1 then
			arg_204_0.nowTimelinePlayer:TriggerEvent(var_204_1)
		end

		return
	end

	if not var_204_0.ikConfig then
		return
	end

	local var_204_2 = arg_204_1:GetControllerPath()
	local var_204_3 = var_204_0.ikActionDict[var_204_2]

	if not var_204_3 then
		return
	end

	arg_204_0.blockIK = true

	arg_204_0:TouchModeAction(var_204_0, arg_204_1:GetConfigID(), unpack(var_204_3))(function()
		arg_204_0:ResetIKTipTimer()

		arg_204_0.blockIK = nil
	end)
end

function var_0_0.OnTouchCharacterBody(arg_206_0, arg_206_1)
	local var_206_0 = arg_206_0.ladyDict[arg_206_0.apartment:GetConfigID()]

	if not var_206_0.ikConfig then
		return
	end

	if type(var_206_0.ikConfig.touch_data) ~= "table" then
		return
	end

	for iter_206_0, iter_206_1 in ipairs(var_206_0.iKTouchDatas) do
		local var_206_1, var_206_2, var_206_3 = unpack(iter_206_1)
		local var_206_4 = pg.dorm3d_ik_touch[var_206_1]

		if var_206_4.body == arg_206_1 then
			local var_206_5 = var_206_4.action_emote

			if #var_206_5 > 0 then
				arg_206_0:PlayFaceAnim(var_206_0, var_206_5)
			end

			local var_206_6 = var_206_4.vibrate

			if type(var_206_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_206_7 = {}
				local var_206_8 = {}
				local var_206_9 = {}

				underscore.each(var_206_6, function(arg_207_0)
					local var_207_0 = arg_207_0[1]

					if PLATFORM == PLATFORM_IPHONEPLAYER then
						var_207_0 = var_207_0 / 1000
					end

					table.insert(var_206_7, var_207_0)
					table.insert(var_206_8, arg_207_0[2])
					table.insert(var_206_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_206_7, var_206_8)
				elseif PLATFORM == PLATFORM_IPHONEPLAYER then
					VibrateMgr.Instance:VibrateWaveform(var_206_7, var_206_8, var_206_9)
				end
			end

			arg_206_0.blockIK = true

			arg_206_0:TouchModeAction(var_206_0, var_206_1, unpack(var_206_3))(function()
				arg_206_0:ResetIKTipTimer()

				arg_206_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_209_0)
	setActive(arg_209_0.rtTouchGamePanel:Find("effect_bg"), arg_209_0.touchLevel == 2)
	setActive(arg_209_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_209_0.touchLevel == 2)

	if arg_209_0.touchLevel == 1 then
		setActive(arg_209_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_209_0.uiContianer:Find("ik/btn_back_heartbeat"), false)
		quickPlayAnimation(arg_209_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_209_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_209_0.touchLevel == 2 then
		setActive(arg_209_0.uiContianer:Find("ik/btn_back"), false)
		setActive(arg_209_0.uiContianer:Find("ik/btn_back_heartbeat"), true)
		quickPlayAnimation(arg_209_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_209_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_210_0, arg_210_1)
	if arg_210_0.touchLevel > 1 then
		arg_210_1 = math.min(0, arg_210_1)
	end

	arg_210_0.touchCount = math.clamp(arg_210_0.touchCount + arg_210_1, 0, 100)

	if arg_210_0.sliderLT and LeanTween.isTweening(arg_210_0.sliderLT) then
		LeanTween.cancel(arg_210_0.sliderLT)

		arg_210_0.sliderLT = nil
	end

	setSlider(arg_210_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_210_0.touchCount)

	local var_210_0

	if arg_210_0.touchCount >= 100 then
		var_210_0 = 2
	elseif arg_210_0.touchCount <= 0 then
		var_210_0 = 1
	end

	if var_210_0 and var_210_0 ~= arg_210_0.touchLevel then
		if arg_210_0.blockIK then
			return
		end

		arg_210_0.touchLevel = var_210_0

		local var_210_1 = arg_210_0.touchConfig.ik_status[var_210_0]

		if var_210_1 then
			if var_210_0 > 1 then
				arg_210_0.touchCount = 200
			elseif var_210_0 == 1 then
				arg_210_0.touchCount = 0
			end

			local var_210_2 = arg_210_0.ladyDict[arg_210_0.apartment:GetConfigID()]

			seriesAsync({
				function(arg_211_0)
					arg_210_0:ShowBlackScreen(true, arg_211_0)
				end,
				function(arg_212_0)
					arg_210_0:SwitchIKConfig(var_210_2, var_210_1)
					arg_210_0:SetIKState(true, arg_212_0)

					if var_210_0 > 1 and arg_210_0.touchConfig.heartbeat_enter_anim ~= "" then
						arg_210_0:SwitchAnim(var_210_2, arg_210_0.touchConfig.heartbeat_enter_anim)
					end
				end,
				function(arg_213_0)
					arg_210_0:ShowBlackScreen(false, arg_213_0)
				end
			})
		end

		arg_210_0:UpdateTouchCount(0)
		arg_210_0:UpdateTouchGameDisplay()
	end

	arg_210_0.topCount = math.max(arg_210_0.topCount, arg_210_0.touchCount)
end

function var_0_0.ExitHeartbeatMode(arg_214_0)
	if not arg_214_0.touchLevel or arg_214_0.touchLevel == 1 then
		return
	end

	arg_214_0.touchCount = 0

	arg_214_0:UpdateTouchCount(0)
end

function var_0_0.DoTouch(arg_215_0, arg_215_1, arg_215_2)
	if arg_215_0.inTouchGame then
		switch(arg_215_2, {
			function()
				arg_215_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_215_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_215_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_215_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat_trriger.key_value_int)
			end
		})
	end
end

function var_0_0.DoTalk(arg_220_0, arg_220_1, arg_220_2)
	while rawget(arg_220_0, "class") ~= var_0_0 do
		arg_220_0 = getmetatable(arg_220_0).__index
	end

	if arg_220_0.apartment and arg_220_0:GetBlackboardValue(arg_220_0.ladyDict[arg_220_0.apartment:GetConfigID()], "inTalking") then
		errorMsg("Talking block:" .. arg_220_1)

		return
	end

	if not arg_220_0.room:isPersonalRoom() then
		local var_220_0 = pg.dorm3d_dialogue_group[arg_220_1].char_id

		if arg_220_0.apartment then
			assert(arg_220_0.apartment:GetConfigID() == var_220_0)
		else
			arg_220_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_220_0))
		end
	end

	local var_220_1 = arg_220_0.ladyDict[arg_220_0.apartment:GetConfigID()]

	if arg_220_1 == 10010 and not arg_220_0.apartment.talkDic[arg_220_1] then
		arg_220_0.firstTimelineTouch = true
		arg_220_0.firstMoveGuide = true
	end

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = arg_220_0.contextData.timeIndex == 1 and 110 or 115,
			ship_id = arg_220_0.apartment:GetConfigID()
		},
		{
			value = 1,
			event_type = 155,
			ship_id = arg_220_0.apartment:GetConfigID()
		}
	})

	local var_220_2 = {}

	if arg_220_0:GetBlackboardValue(var_220_1, "inPending") then
		table.insert(var_220_2, function(arg_221_0)
			arg_220_0:OutOfLazy(arg_220_0.apartment:GetConfigID(), arg_221_0)
		end)
	end

	local var_220_3 = pg.dorm3d_dialogue_group[arg_220_1]
	local var_220_4 = var_220_3.performance_type == 1
	local var_220_5

	table.insert(var_220_2, function(arg_222_0)
		arg_220_0:emit(arg_220_0.SHOW_BLOCK)
		arg_220_0:SetBlackboardValue(var_220_1, var_220_4 and "inPerformance" or "inTalking", true)
		arg_220_0:emit(Dorm3dRoomMediator.DO_TALK, arg_220_1, function(arg_223_0)
			var_220_5 = arg_223_0

			arg_222_0()
		end)
	end)
	table.insert(var_220_2, function(arg_224_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_220_0.apartment.configId, arg_220_0.apartment.level, arg_220_1, var_220_3.type, arg_220_0.room:getZoneConfig(arg_220_0.ladyDict[arg_220_0.apartment:GetConfigID()].ladyBaseZone, "id"), var_220_3.action_type, table.CastToString(var_220_3.trigger_config), arg_220_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_220_0:SetUI(arg_224_0, "blank")
	end)

	if var_220_3.trigger_area and var_220_3.trigger_area ~= "" then
		table.insert(var_220_2, function(arg_225_0)
			arg_220_0:ShiftZone(var_220_3.trigger_area, arg_225_0)
		end)
	end

	if var_220_3.performance_type == 0 then
		table.insert(var_220_2, function(arg_226_0)
			arg_220_0:emit(arg_220_0.HIDE_BLOCK)

			if arg_220_0.contextData.isVideoTalk then
				arg_220_0.videoPlayer:ExecuteAction("Play", var_220_3.story, function()
					onDelayTick(arg_226_0, 0.001)
				end)
			else
				pg.NewStoryMgr.GetInstance():ForceManualPlay(var_220_3.story, function()
					onDelayTick(arg_226_0, 0.001)
				end, true)
			end
		end)
	elseif var_220_3.performance_type == 1 then
		table.insert(var_220_2, function(arg_229_0)
			arg_220_0:emit(arg_220_0.HIDE_BLOCK)
			arg_220_0:PerformanceQueue(var_220_3.story, arg_229_0)
		end)
	else
		assert(false)
	end

	table.insert(var_220_2, function(arg_230_0)
		arg_220_0:emit(arg_220_0.SHOW_BLOCK)
		arg_230_0()
	end)
	table.insert(var_220_2, function(arg_231_0)
		local var_231_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_220_3.story)

		if var_231_0 then
			local var_231_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_231_0, var_231_1))
		end

		if var_220_5 and #var_220_5 > 0 then
			arg_220_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_220_5, arg_231_0)
		else
			arg_231_0()
		end
	end)
	table.insert(var_220_2, function(arg_232_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_220_0:emit(arg_220_0.HIDE_BLOCK)

		if arg_220_0.contextData.isVideoTalk then
			existCall(arg_232_0)
		else
			arg_220_0:SetBlackboardValue(var_220_1, var_220_4 and "inPerformance" or "inTalking", false)
			arg_220_0:SetUI(arg_232_0, "back")
		end
	end)
	seriesAsync(var_220_2, function()
		if arg_220_2 then
			return arg_220_2()
		else
			arg_220_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_234_0, arg_234_1, arg_234_2, arg_234_3)
	local var_234_0 = arg_234_0.rtExtraScreen:Find("TalkTouchOption")
	local var_234_1
	local var_234_2 = var_234_0:Find("content")

	UIItemList.StaticAlign(var_234_2, var_234_2:Find("clickTpl"), #arg_234_1.options, function(arg_235_0, arg_235_1, arg_235_2)
		arg_235_1 = arg_235_1 + 1

		if arg_235_0 == UIItemList.EventUpdate then
			local var_235_0 = arg_234_1.options[arg_235_1]

			setAnchoredPosition(arg_235_2, NewPos(unpack(var_235_0.pos)))
			onButton(arg_234_0, arg_235_2, function()
				var_234_1(var_235_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_235_2, not table.contains(arg_234_2, var_235_0.flag))
		end
	end)
	setActive(var_234_0, true)

	function var_234_1(arg_237_0)
		setActive(var_234_0, false)
		arg_234_3(arg_237_0)
	end
end

function var_0_0.DoTimelineOption(arg_238_0, arg_238_1, arg_238_2)
	local var_238_0 = arg_238_0.rtTimelineScreen:Find("TimelineOption")
	local var_238_1
	local var_238_2 = var_238_0:Find("content")

	UIItemList.StaticAlign(var_238_2, var_238_2:Find("clickTpl"), #arg_238_1, function(arg_239_0, arg_239_1, arg_239_2)
		arg_239_1 = arg_239_1 + 1

		if arg_239_0 == UIItemList.EventUpdate then
			local var_239_0 = arg_238_1[arg_239_1]

			setText(arg_239_2:Find("Text"), HXSet.hxLan(var_239_0.content))
			onButton(arg_238_0, arg_239_2, function()
				var_238_1(arg_239_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_238_0, true)

	function var_238_1(arg_241_0)
		setActive(var_238_0, false)
		arg_238_2(arg_241_0)
	end
end

function var_0_0.DoTimelineTouch(arg_242_0, arg_242_1, arg_242_2)
	local var_242_0 = arg_242_0.rtTimelineScreen:Find("TimelineTouch")
	local var_242_1
	local var_242_2 = var_242_0:Find("content")

	UIItemList.StaticAlign(var_242_2, var_242_2:Find("clickTpl"), #arg_242_1, function(arg_243_0, arg_243_1, arg_243_2)
		arg_243_1 = arg_243_1 + 1

		if arg_243_0 == UIItemList.EventUpdate then
			local var_243_0 = arg_242_1[arg_243_1]

			setAnchoredPosition(arg_243_2, NewPos(unpack(var_243_0.pos)))
			onButton(arg_242_0, arg_243_2, function()
				var_242_1(arg_243_1)
			end, SFX_CONFIRM)

			if arg_242_0.firstTimelineTouch then
				arg_242_0.firstTimelineTouch = nil

				setActive(arg_243_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_242_0, true)

	function var_242_1(arg_245_0)
		setActive(var_242_0, false)
		arg_242_2(arg_245_0)
	end
end

function var_0_0.DoShortWait(arg_246_0, arg_246_1)
	local var_246_0 = arg_246_0.ladyDict[arg_246_1]
	local var_246_1 = getProxy(ApartmentProxy):getApartment(arg_246_1)
	local var_246_2 = arg_246_0.room:getApartmentZoneConfig(var_246_0.ladyBaseZone, "special_action", arg_246_1)
	local var_246_3 = var_246_2 and var_246_2[math.random(#var_246_2)] or nil

	if not var_246_3 then
		return
	end

	arg_246_0:PlaySingleAction(var_246_0, var_246_3)
end

function var_0_0.OutOfLazy(arg_247_0, arg_247_1, arg_247_2)
	local var_247_0 = arg_247_0.ladyDict[arg_247_1]
	local var_247_1 = {}

	if arg_247_0:GetBlackboardValue(var_247_0, "inPending") then
		table.insert(var_247_1, function(arg_248_0)
			arg_247_0.shiftLady = arg_247_1

			arg_247_0:ShiftZone(var_247_0.ladyBaseZone, arg_248_0)
		end)
	end

	seriesAsync(var_247_1, arg_247_2)
end

function var_0_0.OutOfPending(arg_249_0, arg_249_1, arg_249_2)
	assert(arg_249_0.wakeUpTalkId)

	local var_249_0 = arg_249_0.wakeUpTalkId

	seriesAsync({
		function(arg_250_0)
			arg_249_0:SetUI(arg_250_0, "blank")
		end,
		function(arg_251_0)
			arg_249_0.shiftLady = arg_249_1

			local var_251_0 = arg_249_0.ladyDict[arg_249_1]

			arg_249_0:ShiftZone(var_251_0.ladyBaseZone, arg_251_0)
		end,
		function(arg_252_0)
			arg_249_0:DoTalk(var_249_0, arg_252_0)
		end
	}, function()
		arg_249_0:SetUIStore(arg_249_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_254_0, arg_254_1)
	local var_254_0

	if arg_254_0:GetBlackboardValue(arg_254_1, "inPending") then
		var_254_0 = tobool(arg_254_0:GetBlackboardValue(arg_254_1, "inDistance"))
	else
		local var_254_1 = arg_254_0:GetBlackboardValue(arg_254_1, "groupId")

		var_254_0 = tobool(arg_254_0.activeLady[var_254_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_254_1.ladyBlackboard))
	end

	if (not arg_254_1.nowCanWatchState or arg_254_1.nowCanWatchState ~= var_254_0) and arg_254_1.ladyWatchFloat then
		arg_254_1.nowCanWatchState = var_254_0

		arg_254_0:ShowOrHideCanWatchMark(arg_254_1, arg_254_1.nowCanWatchState)
	end
end

function var_0_0.HandleGameNotification(arg_255_0, arg_255_1, arg_255_2)
	local var_255_0 = arg_255_0.ladyDict[arg_255_0.apartment:GetConfigID()]

	switch(arg_255_1, {
		[Dorm3dMiniGameMediator.OPERATION] = function()
			local var_256_0 = arg_255_2.miniGameId

			switch(arg_255_2.miniGameId, {
				[67] = function()
					if arg_255_2.operationCode == "GAME_HIT_AREA" then
						local var_257_0 = {
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
						local var_257_1, var_257_2 = unpack(var_257_0[arg_255_2.index])

						arg_255_0:PlayFaceAnim(var_255_0, var_257_1)

						if arg_255_0.tfCutIn then
							quickPlayAnimator(arg_255_0.modelCutIn.lady, var_257_2)
							quickPlayAnimator(arg_255_0.modelCutIn.player, var_257_2)
						end
					elseif arg_255_2.operationCode == "GAME_RESULT" then
						if arg_255_2.win then
							arg_255_0:PlayFaceAnim(var_255_0, "Face_XYX_victory")
							arg_255_0:PlaySingleAction(var_255_0, "minigame_win")
						else
							arg_255_0:PlayFaceAnim(var_255_0, "Face_XYX_lose")
							arg_255_0:PlaySingleAction(var_255_0, "minigame_lose")
						end

						setActive(arg_255_0.rtExtraScreen:Find("MiniGameCutIn"), false)
					end
				end,
				[70] = function()
					if arg_255_2.operationCode == "GAME_READY" then
						arg_255_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_255_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil

						arg_255_0:PlaySingleAction(var_255_0, "shuohua_sikao")
					elseif arg_255_2.operationCode == "ROUND_RESULT" then
						local var_258_0

						if arg_255_2.success then
							var_258_0 = {
								"shuohua_wenhou",
								"shuohua_sikao"
							}
						else
							var_258_0 = {
								"shuohua_yaotou",
								"shuohua_sikao"
							}
						end

						seriesAsync(underscore.map(var_258_0, function(arg_259_0)
							return function(arg_260_0)
								arg_255_0:PlaySingleAction(var_255_0, arg_259_0, arg_260_0)
							end
						end), function()
							return
						end)
					elseif arg_255_2.operationCode == "GAME_RESULT" then
						local var_258_1 = arg_255_0.cameras[var_0_0.CAMERA.TALK].transform

						var_258_1.position = var_258_1.position + var_258_1.right * 0.11

						local var_258_2 = {
							"shuohua_gandong"
						}

						seriesAsync(underscore.map(var_258_2, function(arg_262_0)
							return function(arg_263_0)
								arg_255_0:PlaySingleAction(var_255_0, arg_262_0, arg_263_0)
							end
						end), function()
							return
						end)
					end
				end,
				[75] = function()
					if arg_255_2.operationCode == "BEFORE_OPEN_GAME" then
						arg_255_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_255_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil
					elseif arg_255_2.operationCode == "GAME_RPS_RESULT" then
						if arg_255_2.index == 1 then
							arg_255_0:PlaySingleAction(var_255_0, "ab_shuohua_lianxuyaotou_01")
							arg_255_0:PlayFaceAnim(var_255_0, "Face_weixiao")
						elseif arg_255_2.index == 2 then
							arg_255_0:PlaySingleAction(var_255_0, "ab_shuohua_lianxudiantou_01")
							arg_255_0:PlayFaceAnim(var_255_0, "Face_kaixin")
						end
					elseif arg_255_2.operationCode == "GAME_RESULT" then
						if not arg_255_2.win then
							arg_255_0:PlaySingleAction(var_255_0, "ab_shuohua_taibangle_01")
						end

						arg_255_0:PlayFaceAnim(var_255_0, "Face_kaixin")
					end
				end
			}, function()
				warning("without miniGameId:" .. arg_255_2.miniGameId)
			end)

			if arg_255_2.operationCode == "BEFORE_OPEN_GAME" then
				local var_256_1 = getProxy(PlayerProxy):getPlayerId()
				local var_256_2 = 0

				if var_256_0 == 67 or var_256_0 == 70 then
					var_256_2 = PlayerPrefs.GetInt("mg_new_score_" .. tostring(var_256_1) .. "_" .. arg_255_2.miniGameId, 0)
				else
					var_256_2 = PlayerPrefs.GetInt("mg_score_" .. tostring(var_256_1) .. "_" .. arg_255_2.miniGameId, 0)
				end

				arg_255_0.highScore = var_256_2
			elseif arg_255_2.operationCode == "GAME_RESULT" then
				local var_256_3 = arg_255_2.score
				local var_256_4 = getProxy(PlayerProxy):getPlayerId()

				if var_256_3 > arg_255_0.highScore then
					if var_256_0 == 67 or var_256_0 == 70 then
						PlayerPrefs.SetInt("mg_new_score_" .. tostring(var_256_4) .. "_" .. arg_255_2.miniGameId, var_256_3)
					end

					getProxy(Dorm3dChatProxy):TriggerEvent({
						{
							event_type = 159,
							value = var_256_3,
							ship_id = arg_255_0.apartment:GetConfigID()
						}
					})
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_255_2.score))
			elseif arg_255_2.operationCode == "GAME_CLOSE" and arg_255_2.doTrack == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_267_0, arg_267_1, arg_267_2)
	local var_267_0, var_267_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_267_1)
	end)

	if not var_267_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_267_1)
		existCall(arg_267_2)

		return
	end

	warning(arg_267_1)

	arg_267_0.performanceInfo = {
		name = arg_267_1
	}

	local var_267_2 = {}

	table.insert(var_267_2, function(arg_269_0)
		arg_267_0:SetUI(arg_269_0, "blank")
	end)
	table.insertto(var_267_2, underscore.map(var_267_1, function(arg_270_0)
		return switch(arg_270_0.type, {
			function()
				return function(arg_272_0)
					local var_272_0 = unpack(arg_270_0.params)

					arg_267_0:DoTalk(var_272_0, arg_272_0, true)
				end
			end,
			function()
				return function(arg_274_0)
					arg_267_0.touchExitCall = arg_274_0

					arg_267_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_276_0)
					local var_276_0 = arg_267_0.ladyDict[arg_267_0.apartment:GetConfigID()]

					arg_267_0:PlaySingleAction(var_276_0, arg_270_0.name, arg_276_0)
				end
			end,
			function()
				return function(arg_278_0)
					arg_267_0:emit(arg_267_0.PLAY_EXPRESSION, arg_270_0)
					arg_278_0()
				end
			end,
			function()
				return function(arg_280_0)
					arg_267_0:ShiftZone(arg_270_0.name, arg_280_0)
				end
			end,
			function()
				return function(arg_282_0)
					arg_267_0.contextData.timeIndex = arg_270_0.params[1]

					if arg_267_0.dormSceneMgr.artSceneInfo == arg_267_0.dormSceneMgr.sceneInfo then
						arg_267_0:SwitchDayNight(arg_267_0.contextData.timeIndex)
						onNextTick(function()
							arg_267_0:RefreshSlots()
						end)
					end

					arg_267_0:UpdateContactState()
					onNextTick(arg_282_0)
				end
			end,
			function()
				return function(arg_285_0)
					if arg_270_0.name then
						arg_267_0:ActiveCameraByName(arg_270_0.name)
						existCall(arg_285_0)
					else
						arg_267_0:ActiveStateCamera(arg_270_0.params[1], arg_285_0)
					end
				end
			end,
			function()
				return function(arg_287_0)
					if arg_270_0.name == "base" then
						arg_267_0:ChangeArtScene(arg_267_0.dormSceneMgr.sceneInfo, arg_287_0)
					else
						local var_287_0 = arg_270_0.params.scene
						local var_287_1 = arg_270_0.params.sceneRoot

						arg_267_0:ChangeArtScene(var_287_0 .. "|" .. var_287_1, arg_287_0)
					end
				end
			end,
			function()
				return function(arg_289_0)
					local var_289_0 = arg_270_0.params.name

					if arg_270_0.name == "load" then
						func = tobool(arg_270_0.params.wait_timeline) and function(arg_290_0)
							arg_267_0.waitForTimeline = arg_290_0
						end

						arg_267_0:LoadTimelineScene(var_289_0, true, func, arg_289_0)
					elseif arg_270_0.name == "unload" then
						arg_267_0:UnloadTimelineScene(var_289_0, true, arg_289_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_292_0)
					setActive(arg_267_0.uiContianer:Find("walk/btn_back"), false)

					local var_292_0 = arg_267_0.ladyDict[arg_267_0.apartment:GetConfigID()]

					if arg_270_0.name == "change" then
						local var_292_1 = arg_270_0.params.scene
						local var_292_2 = arg_270_0.params.sceneRoot

						var_292_0.walkBornPoint = arg_270_0.params.point or "Default"

						arg_267_0:ChangeWalkScene(arg_270_0.name, var_292_1 .. "|" .. var_292_2, arg_292_0)
					elseif arg_270_0.name == "back" then
						var_292_0.walkBornPoint = nil

						arg_267_0:ChangeWalkScene(arg_270_0.name, arg_267_0.dormSceneMgr.sceneInfo, arg_292_0)
					elseif arg_270_0.name == "set" then
						local function var_292_3()
							local var_293_0 = arg_292_0

							arg_292_0 = nil

							return existCall(var_293_0)
						end

						for iter_292_0, iter_292_1 in pairs(arg_270_0.params) do
							switch(iter_292_0, {
								back_button_trigger = function(arg_294_0)
									onButton(arg_267_0, arg_267_0.uiContianer:Find("walk/btn_back"), var_292_3, SFX_DORM_BACK)
									setActive(arg_267_0.uiContianer:Find("walk/btn_back"), IsUnityEditor and arg_294_0)
								end,
								near_trigger = function(arg_295_0)
									if arg_295_0 == true then
										arg_295_0 = 1.5
									end

									if arg_295_0 then
										function arg_267_0.walkNearCallback(arg_296_0)
											if arg_296_0 < arg_295_0 then
												arg_267_0.walkNearCallback = nil

												var_292_3()
											end
										end
									else
										arg_267_0.walkNearCallback = nil
									end
								end
							}, nil, iter_292_1)
						end

						if arg_267_0.firstMoveGuide then
							setActive(arg_267_0.povLayer:Find("Guide"), arg_267_0.firstMoveGuide)

							arg_267_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_298_0)
					if arg_270_0.name == "set" then
						local var_298_0 = arg_267_0.ladyDict[arg_267_0.apartment:GetConfigID()]

						arg_267_0:SwitchIKConfig(var_298_0, arg_270_0.params.state)
						setActive(arg_267_0.uiContianer:Find("ik/btn_back"), not arg_270_0.params.hide_back)

						arg_267_0.ikSpecialCall = arg_298_0

						arg_267_0:SetIKState(true)
					elseif arg_270_0.name == "back" then
						local var_298_1 = arg_267_0.ladyDict[arg_267_0.apartment:GetConfigID()]

						var_298_1.ikConfig = arg_270_0.params

						arg_267_0:SetIKState(false, function()
							var_298_1.ikConfig = nil

							existCall(arg_298_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_301_0)
					arg_267_0.blackSceneInfo = setmetatable(arg_270_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_270_0.name == "show" and 0 or 0.5
						}
					})

					if arg_270_0.name == "show" then
						arg_267_0:ShowBlackScreen(true, arg_301_0)
					elseif arg_270_0.name == "hide" then
						arg_267_0:ShowBlackScreen(false, arg_301_0)
					else
						assert(false)
					end

					arg_267_0.blackSceneInfo = nil
				end
			end
		})
	end))
	table.insert(var_267_2, function(arg_302_0)
		arg_267_0:SetUI(arg_302_0, "back")

		arg_267_0.performanceInfo = nil
	end)
	seriesAsync(var_267_2, arg_267_2)
end

function var_0_0.TriggerContact(arg_303_0, arg_303_1)
	arg_303_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_303_1,
		roomId = arg_303_0.room:GetConfigID(),
		groupId = arg_303_0.room:isPersonalRoom() and arg_303_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_304_0)
	arg_304_0:SetContactStateDic(arg_304_0.room:getTriggerableCollectItemDic(arg_304_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_305_0)
	local var_305_0, var_305_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_305_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_305_0, var_305_1))
	setActive(arg_305_0.rtStaminaDisplay, false)

	if arg_305_0.apartment then
		setText(arg_305_0.rtFavorLevel:Find("rank/Text"), arg_305_0.apartment.level)

		local var_305_2, var_305_3 = arg_305_0.apartment:getFavor()
		local var_305_4 = arg_305_0.apartment:isMaxFavor()

		setActive(arg_305_0.rtFavorLevel:Find("Max"), var_305_4)
		setActive(arg_305_0.rtFavorLevel:Find("Text"), not var_305_4)
		setText(arg_305_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_305_2, var_305_3))
	end

	setActive(arg_305_0.rtFavorLevel:Find("red"), Dorm3dLevelLayer.IsShowRed())
end

function var_0_0.UpdateBtnState(arg_306_0)
	local var_306_0 = not arg_306_0.room:isPersonalRoom() or arg_306_0:CheckSystemOpen("Furniture")
	local var_306_1 = Dorm3dFurniture.IsTimelimitShopTip(arg_306_0.room:GetConfigID())

	setActive(arg_306_0.uiContianer:Find("base/left/btn_furniture/tipTimelimit"), var_306_0 and var_306_1)

	local var_306_2 = Dorm3dFurniture.NeedViewTip(arg_306_0.room:GetConfigID())

	setActive(arg_306_0.uiContianer:Find("base/left/btn_furniture/tip"), var_306_0 and not var_306_1 and var_306_2)
	setActive(arg_306_0.uiContianer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_307_0)
		return tobool(arg_307_0)
	end):any(function(arg_308_0)
		return #arg_308_0:getSpecialTalking() > 0 or arg_308_0:getIconTip() == "main"
	end):value())
	setActive(arg_306_0.uiContianer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_309_0, arg_309_1)
	table.insert(arg_309_0.unlockList, arg_309_1)

	if not isActive(arg_309_0.rtFavorUp) then
		setText(arg_309_0.rtFavorUp:Find("Text"), table.remove(arg_309_0.unlockList, 1))
		setActive(arg_309_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_310_0, arg_310_1)
	local var_310_0 = arg_310_1.triggerId
	local var_310_1 = arg_310_1.delta
	local var_310_2 = arg_310_1.cost
	local var_310_3 = arg_310_1.apartment
	local var_310_4 = pg.dorm3d_favor_trigger[var_310_0]

	if var_310_4.is_repeat == 0 then
		if var_310_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_310_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_310_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_310_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_310_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_310_0))
		end
	elseif arg_310_1.delta > 0 then
		local var_310_5, var_310_6 = var_310_3:getFavor()
		local var_310_7 = var_310_5 + var_310_1

		setText(arg_310_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=48>+%d</size>", math.min(9999, var_310_1)))
		setSlider(arg_310_0.rtFavorUpDaily:Find("bg/slider"), 0, var_310_6, var_310_5)
		setAnchoredPosition(arg_310_0.rtFavorUpDaily:Find("bg"), arg_310_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_310_8 = {}
		local var_310_9 = arg_310_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_310_9, function(arg_311_0)
			setActive(arg_311_0, false)
		end)

		local var_310_10

		if var_310_4.effect and var_310_4.effect ~= "" then
			var_310_10 = var_310_9:Find(var_310_4.effect .. "(Clone)")

			if not var_310_10 then
				table.insert(var_310_8, function(arg_312_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_313_0)
						setParent(arg_313_0, var_310_9)

						var_310_10 = tf(arg_313_0)

						arg_312_0()
					end)
				end)
			else
				setActive(var_310_10, true)
			end
		end

		local var_310_11 = arg_310_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_310_11:SetTriggerEvent(function(arg_314_0)
			local var_314_0 = GetComponent(arg_310_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_310_5, var_310_7, 0.5):setOnUpdate(System.Action_float(function(arg_315_0)
				var_314_0.value = arg_315_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_310_0.exited then
						return
					end

					quickPlayAnimator(arg_310_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_310_11:SetEndEvent(function(arg_318_0)
			setActive(arg_310_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_310_8, function()
			local var_319_0 = arg_310_0.ladyDict[var_310_3:GetConfigID()]

			setLocalPosition(arg_310_0.rtFavorUpDaily, arg_310_0:GetLocalPosition(arg_310_0:GetScreenPosition(var_319_0.ladyHeadCenter.position), arg_310_0.rtFavorUpDaily.parent))
			setActive(arg_310_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_310_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_310_0.rtFavorUpDaily, "favor_open")

			if var_310_2 > 0 then
				local var_319_1, var_319_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_310_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_310_2)
				setText(arg_310_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_319_1 + var_310_2, var_319_2))
				setActive(arg_310_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_320_0, arg_320_1, arg_320_2, arg_320_3)
	arg_320_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_320_0.isLock = false
	end))

	local var_320_0 = math.floor(arg_320_1.level / 10)
	local var_320_1 = math.fmod(arg_320_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_320_1, arg_320_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_320_0, arg_320_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_320_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_320_0 > 0)

	local var_320_2
	local var_320_3

	arg_320_0.clientAward, var_320_3 = Dorm3dIconHelper.SplitStory(arg_320_1:getFavorConfig("levelup_client_item", arg_320_1.level))
	arg_320_0.serverAward = arg_320_2

	local var_320_4 = arg_320_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_320_0.levelItemList then
		arg_320_0.levelItemList = UIItemList.New(var_320_4, var_320_4:Find("tpl"))

		arg_320_0.levelItemList:make(function(arg_322_0, arg_322_1, arg_322_2)
			local var_322_0 = arg_322_1 + 1

			if arg_322_0 == UIItemList.EventUpdate then
				if arg_322_1 < #arg_320_0.serverAward then
					updateDorm3dIcon(arg_322_2, arg_320_0.serverAward[var_322_0])
					onButton(arg_320_0, arg_322_2, function()
						arg_320_0:emit(BaseUI.ON_NEW_DROP, {
							drop = arg_320_0.serverAward[var_322_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_322_2, arg_320_0.clientAward[var_322_0 - #arg_320_0.serverAward])
					onButton(arg_320_0, arg_322_2, function()
						arg_320_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_320_0.clientAward[var_322_0 - #arg_320_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_320_0.levelItemList:align(#arg_320_0.serverAward + #arg_320_0.clientAward)
	setActive(arg_320_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	pg.UIMgr.GetInstance():OverlayPanel(arg_320_0.rtLevelUpWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})

	function arg_320_0.levelUpCallback()
		arg_320_0.levelUpCallback = nil

		if var_320_3 then
			arg_320_0:PopNewStoryTip(var_320_3)
		end

		existCall(arg_320_3)
	end
end

function var_0_0.PopNewStoryTip(arg_326_0, arg_326_1, arg_326_2)
	local var_326_0 = arg_326_0.uiContianer:Find("base/top/story_tip")

	setActive(var_326_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_326_0, false)
	end))
	setText(var_326_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_326_1[2]].name))
	existCall(arg_326_2)
end

function var_0_0.UpdateZoneList(arg_328_0)
	local var_328_0

	if arg_328_0.room:isPersonalRoom() then
		var_328_0 = arg_328_0.ladyDict[arg_328_0.apartment:GetConfigID()].ladyBaseZone
	else
		var_328_0 = arg_328_0:GetAttachedFurnitureName()
	end

	for iter_328_0, iter_328_1 in ipairs(arg_328_0.zoneDatas) do
		if iter_328_1:GetWatchCameraName() == var_328_0 then
			setText(arg_328_0.btnZone:Find("Text"), iter_328_1:GetName())
			setTextColor(arg_328_0.rtZoneList:GetChild(iter_328_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_328_0.rtZoneList:GetChild(iter_328_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_329_0, arg_329_1)
	local var_329_0 = {}
	local var_329_1 = {}
	local var_329_2 = arg_329_1.data

	if var_329_2.op_list then
		for iter_329_0, iter_329_1 in ipairs(var_329_2.op_list) do
			table.insert(var_329_0, function(arg_330_0)
				local function var_330_0()
					local var_331_0 = arg_330_0

					arg_330_0 = nil

					return existCall(var_331_0)
				end

				switch(iter_329_1.type, {
					action = function()
						local var_332_0 = arg_329_0.ladyDict[arg_329_0.apartment:GetConfigID()]

						arg_329_0:PlaySingleAction(var_332_0, iter_329_1.name, var_330_0)
					end,
					item_action = function()
						arg_329_0:PlaySceneItemAnim(iter_329_1.id, iter_329_1.name)
						var_330_0()
					end,
					extra_item_action = function()
						local var_334_0 = arg_329_0.ladyDict[arg_329_0.apartment:GetConfigID()].extraItems[iter_329_1.name]

						warning(iter_329_1.name)
						warning(var_334_0.trans)

						if var_334_0 then
							var_334_0.trans:GetComponent(typeof(Animator)):PlayInFixedTime(iter_329_1.param)
						end

						var_330_0()
					end,
					timeline = function()
						if arg_329_0.inTouchGame then
							setActive(arg_329_0.rtTouchGamePanel, false)
						end

						arg_329_0:PlayTimeline(iter_329_1, function(arg_336_0, arg_336_1)
							setActive(arg_329_0.rtTouchGamePanel, arg_329_0.inTouchGame)

							var_329_1.notifiCallback = arg_336_1

							var_330_0()
						end)
					end,
					clickOption = function()
						arg_329_0:DoTalkTouchOption(iter_329_1, arg_329_1.flags, function(arg_338_0)
							var_329_1.optionIndex = arg_338_0

							var_330_0()
						end)
					end,
					wait = function()
						arg_329_0.LTs = arg_329_0.LTs or {}

						table.insert(arg_329_0.LTs, LeanTween.delayedCall(iter_329_1.time, System.Action(var_330_0)).uniqueId)
					end,
					expression = function()
						arg_329_0:emit(arg_329_0.PLAY_EXPRESSION, iter_329_1)
						var_330_0()
					end
				}, function()
					assert(false, "op type error:", iter_329_1.type)
				end)

				if iter_329_1.skip then
					var_330_0()
				end
			end)
		end
	end

	seriesAsync(var_329_0, function()
		if arg_329_1.callbackData then
			arg_329_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_329_1.callbackData.name, var_329_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_343_0)
	if arg_343_0.inGuide or arg_343_0.uiState ~= "base" then
		return
	end

	if arg_343_0.room:GetConfigID() == 1 and arg_343_0:CheckGuide() then
		-- block empty
	elseif arg_343_0.room:isPersonalRoom() and arg_343_0:CheckLevelUp() then
		-- block empty
	elseif arg_343_0.apartment and arg_343_0:CheckEnterDeal() then
		-- block empty
	elseif arg_343_0.apartment and arg_343_0:CheckActiveTalk() then
		-- block empty
	elseif arg_343_0.apartment then
		arg_343_0:CheckFavorTrigger()
	end

	arg_343_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_344_0)
	local var_344_0

	if arg_344_0.contextData.specialId then
		var_344_0 = arg_344_0.contextData.specialId
		arg_344_0.contextData.specialId = nil

		arg_344_0:DoTalk(var_344_0, function()
			arg_344_0:closeView()
		end)

		if arg_344_0.contextData.isVideoTalk then
			arg_344_0.contextData.hasEnterCheck = true
		end
	elseif not arg_344_0.contextData.hasEnterCheck and arg_344_0.apartment then
		for iter_344_0, iter_344_1 in ipairs(arg_344_0.apartment:getForceEnterTalking(arg_344_0.room:GetConfigID())) do
			var_344_0 = iter_344_1

			arg_344_0:DoTalk(iter_344_1)

			break
		end
	end

	if var_344_0 and pg.dorm3d_dialogue_group[var_344_0].extend_loading > 0 then
		arg_344_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_344_0:FinishEnterResume()
		end)
	else
		if arg_344_0.apartment and arg_344_0.contextData.pendingDic[arg_344_0.apartment:GetConfigID()] then
			arg_344_0.contextData.hasEnterCheck = true
		end

		for iter_344_2, iter_344_3 in pairs(arg_344_0.contextData.pendingDic) do
			arg_344_0:SetInPending(arg_344_0.ladyDict[iter_344_2], iter_344_3)
		end

		arg_344_0.contextData.pendingDic = {}

		arg_344_0:FinishEnterResume()
		arg_344_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_347_0)
	if arg_347_0:GetBlackboardValue(arg_347_0.ladyDict[arg_347_0.apartment:GetConfigID()], "inPending") then
		return
	end

	for iter_347_0, iter_347_1 in ipairs({
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
				return arg_347_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_347_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_347_1.name) and iter_347_1.active() then
			arg_347_0:SetAllBlackbloardValue("inGuide", true)

			local function var_347_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_347_1.name)))
				arg_347_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_347_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_347_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_347_1.name, nil, var_347_0, var_347_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_353_0)
	for iter_353_0, iter_353_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_354_0 = getProxy(CollectionProxy):getShipGroup(arg_353_0.apartment.configId)

				return tobool(var_354_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_355_0 = getProxy(CollectionProxy):getShipGroup(arg_353_0.apartment.configId)

				return var_355_0 and var_355_0.married > 0
			end
		}
	}) do
		if arg_353_0.apartment.triggerCountDic[iter_353_1.triggerId] == 0 and iter_353_1.active() then
			arg_353_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_353_0.apartment.configId, iter_353_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_356_0)
	if arg_356_0.contextData.hasEnterCheck then
		return false
	end

	local var_356_0 = arg_356_0.apartment:GetConfigID()
	local var_356_1 = "dorm3d_enter_count_" .. var_356_0
	local var_356_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_356_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_356_2)
		PlayerPrefs.SetInt(var_356_1, 1)
	else
		PlayerPrefs.SetInt(var_356_1, PlayerPrefs.GetInt(var_356_1, 0) + 1)
	end

	local var_356_3 = arg_356_0.apartment:getEnterTalking(arg_356_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_356_3 > 0 then
		arg_356_0:DoTalk(var_356_3[math.random(#var_356_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_357_0)
	local var_357_0 = arg_357_0.ladyDict[arg_357_0.apartment:GetConfigID()]

	if arg_357_0:GetBlackboardValue(var_357_0, "inPending") then
		return false
	end

	local var_357_1 = arg_357_0.apartment:getZoneTalking(arg_357_0.room:GetConfigID(), var_357_0.ladyBaseZone)

	if #var_357_1 > 0 then
		arg_357_0:DoTalk(var_357_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_358_0, arg_358_1, arg_358_2)
	local var_358_0 = arg_358_0.ladyDict[arg_358_1].ladyBaseZone
	local var_358_1 = getProxy(ApartmentProxy):getApartment(arg_358_1)

	for iter_358_0, iter_358_1 in ipairs(var_358_1:getDistanceTalking(arg_358_0.room:GetConfigID(), var_358_0)) do
		arg_358_0:DoTalk(iter_358_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_359_0, arg_359_1)
	if arg_359_0.room:isPersonalRoom() then
		return switch(arg_359_1, {
			Talk = function()
				local var_360_0 = 1

				return var_360_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_360_0)
			end,
			Touch = function()
				local var_361_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_361_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_361_0)
			end,
			Gift = function()
				local var_362_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_362_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_362_0)
			end,
			PublicGame = function()
				return false
			end,
			Photo = function()
				local var_364_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_364_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_364_0)
			end,
			Collection = function()
				local var_365_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_365_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_365_0)
			end,
			Furniture = function()
				local var_366_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_366_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_366_0)
			end,
			DayNight = function()
				local var_367_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_367_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_367_0)
			end,
			Accompany = function()
				local var_368_0 = 1

				return var_368_0 <= arg_359_0.apartment.level, i18n("apartment_level_unenough", var_368_0)
			end,
			MiniGame = function()
				local var_369_0 = 1

				if var_369_0 > arg_359_0.apartment.level then
					return false, i18n("apartment_level_unenough", var_369_0)
				elseif #arg_359_0.room:getMiniGames() <= 0 then
					return false, "without minigame config in room:" .. arg_359_0.room.configId
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
		return switch(arg_359_1, {
			Gift = function()
				return false
			end,
			PublicGame = function()
				return true
			end,
			Furniture = function()
				local var_375_0 = arg_359_0.room:GetFurnitureIDList()

				return var_375_0 and #var_375_0 > 0
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

function var_0_0.CheckLevelUp(arg_381_0)
	if arg_381_0.apartment:canLevelUp() then
		arg_381_0:emit(Dorm3dRoomMediator.FAVOR_LEVEL_UP, arg_381_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetIKHandTF(arg_382_0)
	return arg_382_0.ikHand
end

function var_0_0.CycleIKCameraGroup(arg_383_0)
	local var_383_0 = arg_383_0.ladyDict[arg_383_0.apartment:GetConfigID()]

	assert(arg_383_0:GetBlackboardValue(var_383_0, "inIK"))
	seriesAsync({
		function(arg_384_0)
			pg.IKMgr.GetInstance():ResetActiveIKs()

			local var_384_0 = var_383_0.ikConfig
			local var_384_1 = var_384_0.camera_group
			local var_384_2 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_384_1]
			local var_384_3 = var_384_2[table.indexof(var_384_2, var_384_0.id) % #var_384_2 + 1]

			arg_383_0:SwitchIKConfig(var_383_0, var_384_3)
			arg_383_0:SetIKState(true)
		end
	})
end

function var_0_0.TempHideUI(arg_385_0, arg_385_1, arg_385_2)
	local var_385_0 = defaultValue(arg_385_0.hideCount, 0)

	arg_385_0.hideCount = var_385_0 + (arg_385_1 and 1 or -1)

	assert(arg_385_0.hideCount >= 0)

	if arg_385_0.hideCount * var_385_0 > 0 then
		return existCall(arg_385_2)
	elseif arg_385_0.hideCount > 0 then
		arg_385_0:SetUI(arg_385_2, "blank")
	else
		arg_385_0:SetUI(arg_385_2, "back")
	end
end

function var_0_0.onBackPressed(arg_386_0)
	if arg_386_0.exited or arg_386_0.retainCount > 0 then
		-- block empty
	elseif isActive(arg_386_0.rtLevelUpWindow) then
		triggerButton(arg_386_0.rtLevelUpWindow:Find("bg"))
	elseif arg_386_0.uiState ~= "base" then
		-- block empty
	else
		arg_386_0:closeView()
	end
end

function var_0_0.willExit(arg_387_0)
	if arg_387_0.downTimer then
		arg_387_0.downTimer:Stop()

		arg_387_0.downTimer = nil
	end

	if arg_387_0.LTs then
		underscore.map(arg_387_0.LTs, function(arg_388_0)
			LeanTween.cancel(arg_388_0)
		end)

		arg_387_0.LTs = nil
	end

	if arg_387_0.sliderLT then
		LeanTween.cancel(arg_387_0.sliderLT)

		arg_387_0.sliderLT = nil
	end

	for iter_387_0, iter_387_1 in pairs(arg_387_0.ladyDict) do
		iter_387_1.wakeUpTalkId = nil
	end

	if arg_387_0.accompanyFavorTimer then
		arg_387_0.accompanyFavorTimer:Stop()

		arg_387_0.accompanyFavorTimer = nil
	end

	if arg_387_0.accompanyPerformanceTimer then
		arg_387_0.accompanyPerformanceTimer:Stop()

		arg_387_0.accompanyPerformanceTimer = nil
	end

	arg_387_0.canTriggerAccompanyPerformance = nil

	arg_387_0.videoPlayer:Destroy()
	var_0_0.super.willExit(arg_387_0)
end

return var_0_0
