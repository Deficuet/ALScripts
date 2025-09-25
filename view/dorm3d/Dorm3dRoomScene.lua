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
			arg_4_0:UnOverlayPanel(arg_4_0.rtLevelUpWindow, arg_4_0._tf)
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
			local var_77_2 = CameraMgr.instance:Raycast(var_77_0.IKSettings.CameraRaycaster, var_77_1):ToTable()

			if #var_77_2 > 0 then
				local var_77_3 = var_77_2[1].gameObject.transform
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

function var_0_0.BindEvent(arg_81_0)
	var_0_0.super.BindEvent(arg_81_0)
	arg_81_0:bind(arg_81_0.CLICK_CHARACTER, function(arg_82_0, arg_82_1)
		if arg_81_0.uiState ~= "base" or not arg_81_0.ladyDict[arg_82_1].nowCanWatchState then
			return
		end

		local var_82_0 = {}
		local var_82_1 = arg_81_0.ladyDict[arg_82_1]

		if arg_81_0:GetBlackboardValue(var_82_1, "inPending") then
			table.insert(var_82_0, function(arg_83_0)
				arg_81_0:OutOfPending(arg_82_1, arg_83_0)
			end)
		else
			table.insert(var_82_0, function(arg_84_0)
				arg_81_0:OutOfLazy(arg_82_1, arg_84_0)
			end)
		end

		seriesAsync(var_82_0, function()
			if not arg_81_0.room:isPersonalRoom() then
				arg_81_0:SetApartment(getProxy(ApartmentProxy):getApartment(arg_82_1))
			end

			arg_81_0:EnterWatchMode()
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	arg_81_0:bind(arg_81_0.CLICK_CONTACT, function(arg_86_0, arg_86_1)
		arg_81_0:TriggerContact(arg_86_1)
	end)
	arg_81_0:bind(arg_81_0.DISTANCE_TRIGGER, function(arg_87_0, arg_87_1, arg_87_2)
		if arg_81_0.uiState == "base" then
			arg_81_0:CheckDistanceTalk(arg_87_1, arg_87_2)
		end
	end)
	arg_81_0:bind(arg_81_0.WALK_DISTANCE_TRIGGER, function(arg_88_0, arg_88_1, arg_88_2)
		if arg_81_0.apartment and arg_81_0.apartment:GetConfigID() == arg_88_1 then
			existCall(arg_81_0.walkNearCallback, arg_88_2)
		end
	end)
	arg_81_0:bind(arg_81_0.CHANGE_WATCH, function(arg_89_0, arg_89_1)
		arg_81_0:ChangeCanWatchState(arg_81_0.ladyDict[arg_89_1])
	end)
	arg_81_0:bind(arg_81_0.ON_TOUCH_CHARACTER, function(arg_90_0, arg_90_1)
		local var_90_0 = arg_81_0.ladyDict[arg_81_0.apartment:GetConfigID()]

		if not arg_81_0:GetBlackboardValue(var_90_0, "inIK") then
			return
		end

		arg_81_0:OnTouchCharacterBody(arg_90_1)
	end)
	arg_81_0:bind(var_0_0.ON_IK_STATUS_CHANGED, function(arg_91_0, arg_91_1, arg_91_2)
		local var_91_0 = arg_81_0.ladyDict[arg_81_0.apartment:GetConfigID()]

		if not arg_81_0:GetBlackboardValue(var_91_0, "inTouching") then
			return
		end

		arg_81_0:DoTouch(arg_91_1, arg_91_2)
	end)
	arg_81_0:bind(arg_81_0.ON_ENTER_SECTOR, function(arg_92_0, arg_92_1)
		arg_81_0:ChangeCanWatchState(arg_81_0.ladyDict[arg_92_1])
	end)
	arg_81_0:bind(arg_81_0.ON_CHANGE_DISTANCE, function(arg_93_0, arg_93_1, arg_93_2)
		arg_81_0:ChangeCanWatchState(arg_81_0.ladyDict[arg_93_1])
	end)
end

function var_0_0.didEnter(arg_94_0)
	arg_94_0.resumeCallback = arg_94_0.contextData.resumeCallback
	arg_94_0.contextData.resumeCallback = nil

	var_0_0.super.didEnter(arg_94_0)
	arg_94_0:UpdateZoneList()
	arg_94_0:SetUI(function()
		arg_94_0:didEnterCheck()
	end, "base")
end

function var_0_0.FinishEnterResume(arg_96_0)
	if not arg_96_0.resumeCallback then
		return
	end

	local var_96_0 = arg_96_0.resumeCallback

	arg_96_0.resumeCallback = nil

	return var_96_0()
end

function var_0_0.EnableJoystick(arg_97_0, arg_97_1)
	setActive(arg_97_0._joystick, arg_97_1)
end

function var_0_0.EnablePOVLayer(arg_98_0, arg_98_1)
	setActive(arg_98_0.povLayer, arg_98_1)

	if not arg_98_1 then
		arg_98_0:emit(arg_98_0.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUIStore(arg_99_0, arg_99_1, ...)
	table.insertto(arg_99_0.uiStore, {
		...
	})
	existCall(arg_99_1)
end

function var_0_0.SetUI(arg_100_0, arg_100_1, ...)
	while rawget(arg_100_0, "class") ~= var_0_0 do
		arg_100_0 = getmetatable(arg_100_0).__index
	end

	table.insertto(arg_100_0.uiStore, {
		...
	})

	for iter_100_0, iter_100_1 in ipairs(arg_100_0.uiStore) do
		if iter_100_1 == "back" then
			assert(#arg_100_0.uiStack > 0)

			arg_100_0.uiState = table.remove(arg_100_0.uiStack)
		elseif iter_100_1 == arg_100_0.uiState and iter_100_1 == "ik" then
			-- block empty
		else
			table.insert(arg_100_0.uiStack, arg_100_0.uiState)

			arg_100_0.uiState = iter_100_1
		end
	end

	pg.m02:sendNotification(var_0_0.NOTIFY_UI_STATE, arg_100_0.uiState)

	arg_100_0.uiStore = {}

	eachChild(arg_100_0.uiContianer, function(arg_101_0)
		setActive(arg_101_0, arg_101_0.name == arg_100_0.uiState)
	end)
	arg_100_0:EnablePOVLayer(arg_100_0.uiState == "base" or arg_100_0.uiState == "walk")
	arg_100_0:TempHideContact(arg_100_0.uiState ~= "base")
	arg_100_0:SetFloatEnable(arg_100_0.uiState == "walk")
	setActive(arg_100_0.rtFloatPage, arg_100_0.uiState == "walk")
	setActive(arg_100_0.ikControlUI, arg_100_0.uiState == "ik")
	switch(arg_100_0.uiState, {
		base = function()
			if not arg_100_0.room:isPersonalRoom() then
				arg_100_0:SetApartment(nil)
			end

			arg_100_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_100_0.rtRole, function(arg_104_0)
				setActive(arg_104_0, false)
			end)

			local var_103_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"MiniGame",
				"PublicGame",
				"Performance"
			}, function(arg_105_0)
				return arg_100_0:CheckSystemOpen(arg_105_0)
			end)
			local var_103_1 = 0.05

			for iter_103_0, iter_103_1 in ipairs(var_103_0) do
				LeanTween.delayedCall(var_103_1, System.Action(function()
					setActive(arg_100_0.rtRole:Find(iter_103_1), true)
				end))

				var_103_1 = var_103_1 + 0.066
			end

			setActive(arg_100_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_100_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_100_0.uiContianer:Find("ik/Right/MenuSmall"), arg_100_0.room:isPersonalRoom() and not arg_100_0.performanceInfo)
			setActive(arg_100_0.uiContianer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_100_0.uiContianer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_100_0.apartment:getConfig("name")))
		end
	})
	arg_100_0:ActiveStateCamera(arg_100_0.uiState, function()
		if arg_100_1 then
			arg_100_1()
		elseif arg_100_0.uiState == "base" then
			arg_100_0:CheckQueue()
		end
	end)
end

function var_0_0.EnterWatchMode(arg_110_0)
	local var_110_0 = arg_110_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_111_0)
			arg_110_0:emit(arg_110_0.SHOW_BLOCK)
			arg_110_0:SetBlackboardValue(arg_110_0.ladyDict[var_110_0], "inWatchMode", true)
			arg_110_0:SetUI(arg_111_0, "watch")
		end,
		function(arg_112_0)
			arg_110_0:emit(arg_110_0.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_113_0)
	local var_113_0 = arg_113_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_114_0)
			arg_113_0:emit(arg_113_0.SHOW_BLOCK)
			arg_113_0:SetUI(arg_114_0, "back")
		end,
		function(arg_115_0)
			arg_113_0:SetBlackboardValue(arg_113_0.ladyDict[var_113_0], "inWatchMode", false)
			arg_113_0:emit(arg_113_0.HIDE_BLOCK)
			arg_113_0:CheckQueue()
		end
	})
end

function var_0_0.SetInPending(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = arg_116_0:GetBlackboardValue(arg_116_1, "groupId")
	local var_116_1 = pg.dorm3d_welcome[arg_116_2]

	arg_116_0:SetBlackboardValue(arg_116_1, "inPending", true)
	arg_116_0:ChangeCanWatchState(arg_116_1)
	arg_116_0:EnableHeadIK(arg_116_1, false)

	arg_116_0.contextData.ladyZone[var_116_0] = var_116_1.area

	arg_116_1:SetZone(arg_116_0.contextData.ladyZone[var_116_0], var_116_1.welcome_staypoint)
	arg_116_0:ChangeCharacterPosition(arg_116_1)

	if var_116_1.item_shield ~= "" then
		arg_116_0.hideItemDic = {}

		for iter_116_0, iter_116_1 in ipairs(var_116_1.item_shield) do
			local var_116_2 = arg_116_0.modelRoot:Find(iter_116_1)

			if not var_116_2 then
				warning(string.format("welcome:%d without hide item:%s", arg_116_2, iter_116_1))
			else
				arg_116_0.hideItemDic[iter_116_1] = isActive(var_116_2)

				setActive(var_116_2, false)
			end
		end
	end

	onNextTick(function()
		if arg_116_1.tfPendintItem then
			setActive(arg_116_1.tfPendintItem, true)
		end

		arg_116_0:SwitchAnim(arg_116_1, var_116_1.welcome_idle)
	end)

	arg_116_0.wakeUpTalkId = var_116_1.welcome_talk
end

function var_0_0.SetOutPending(arg_118_0, arg_118_1)
	arg_118_0:SetBlackboardValue(arg_118_1, "inPending", false)
	arg_118_0:ChangeCanWatchState(arg_118_1)
	arg_118_0:EnableHeadIK(arg_118_1, true)

	arg_118_0.wakeUpTalkId = nil

	if arg_118_1.tfPendintItem then
		setActive(arg_118_1.tfPendintItem, false)
	end

	if arg_118_0.hideItemDic then
		for iter_118_0, iter_118_1 in pairs(arg_118_0.hideItemDic) do
			setActive(arg_118_0.modelRoot:Find(iter_118_0), iter_118_1)
		end

		arg_118_0.hideItemDic = nil
	end
end

function var_0_0.IsModeInHidePending(arg_119_0, arg_119_1)
	for iter_119_0, iter_119_1 in pairs(arg_119_0.ladyDict) do
		if iter_119_1.hideItemDic and iter_119_1.hideItemDic[arg_119_1] ~= nil then
			return true
		end
	end

	return false
end

function var_0_0.EnterAccompanyMode(arg_120_0, arg_120_1)
	local var_120_0 = pg.dorm3d_accompany[arg_120_1]
	local var_120_1
	local var_120_2

	if var_120_0.sceneInfo ~= "" then
		var_120_1, var_120_2 = unpack(string.split(var_120_0.sceneInfo, "|"))
	end

	local var_120_3 = {
		type = "timeline",
		name = var_120_0.timeline,
		scene = var_120_1,
		sceneRoot = var_120_2,
		accompanys = {}
	}

	for iter_120_0, iter_120_1 in ipairs(var_120_0.jump_trigger) do
		local var_120_4, var_120_5 = unpack(iter_120_1)

		var_120_3.accompanys[var_120_4] = var_120_5
	end

	local var_120_6, var_120_7 = unpack(var_120_0.favor)

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = 161,
			ship_id = arg_120_0.apartment:GetConfigID()
		}
	})
	getProxy(ApartmentProxy):RecordAccompanyTime()
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(1, var_120_0.ship_id, var_120_0.performance_time, 0, var_120_1 or arg_120_0.dormSceneMgr.artSceneInfo))

	local var_120_8 = {}

	table.insert(var_120_8, function(arg_121_0)
		arg_120_0:SetUI(arg_121_0, "blank", "accompany")
	end)
	table.insert(var_120_8, function(arg_122_0)
		arg_120_0.accompanyFavorCount = 0
		arg_120_0.accompanyFavorTimer = Timer.New(function()
			arg_120_0.accompanyFavorCount = arg_120_0.accompanyFavorCount + 1
		end, var_120_6, -1)

		arg_120_0.accompanyFavorTimer:Start()

		arg_120_0.accompanyPerformanceTimer = Timer.New(function()
			arg_120_0.canTriggerAccompanyPerformance = true
		end, var_120_0.performance_time, -1)

		arg_120_0.accompanyPerformanceTimer:Start()
		arg_120_0:PlayTimeline(var_120_3, function(arg_125_0, arg_125_1)
			arg_125_1()
			arg_122_0()
		end)
	end)
	seriesAsync(var_120_8, function()
		assert(arg_120_0.accompanyFavorTimer)
		arg_120_0.accompanyFavorTimer:Stop()

		arg_120_0.accompanyFavorTimer = nil

		assert(arg_120_0.accompanyPerformanceTimer)
		arg_120_0.accompanyPerformanceTimer:Stop()

		arg_120_0.accompanyPerformanceTimer = nil
		arg_120_0.canTriggerAccompanyPerformance = nil

		local var_126_0 = math.min(arg_120_0.accompanyFavorCount, getProxy(ApartmentProxy):getStamina())

		if var_126_0 > 0 then
			local var_126_1 = var_120_7[var_126_0]

			warning(var_126_1)
			arg_120_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_120_0.apartment.configId, var_126_1)
		end

		local var_126_2 = 0
		local var_126_3 = getProxy(ApartmentProxy):GetAccompanyTime()

		if var_126_3 then
			var_126_2 = pg.TimeMgr.GetInstance():GetServerTime() - var_126_3
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(2, var_120_0.ship_id, var_120_0.performance_time, var_126_2, var_120_1 or arg_120_0.dormSceneMgr.artSceneInfo))
		arg_120_0:SetUI(nil, "back", "back")
	end)
end

function var_0_0.ExitAccompanyMode(arg_127_0)
	existCall(arg_127_0.timelineFinishCall)
end

function var_0_0.EnterTouchPerformance(arg_128_0)
	local var_128_0 = arg_128_0.ladyDict[arg_128_0.apartment:GetConfigID()]
	local var_128_1 = arg_128_0.room:getApartmentZoneConfig(var_128_0.ladyBaseZone, "touch_performance", arg_128_0.apartment:GetConfigID())

	if not var_128_1 or var_128_1 == 0 then
		arg_128_0:EnterTouchMode()
	else
		arg_128_0:DoTalk(var_128_1)
	end
end

function var_0_0.EnterTouchMode(arg_129_0)
	local var_129_0 = arg_129_0.ladyDict[arg_129_0.apartment:GetConfigID()]

	if arg_129_0:GetBlackboardValue(var_129_0, "inTouching") then
		return
	end

	local var_129_1 = arg_129_0.room:getApartmentZoneConfig(var_129_0.ladyBaseZone, "touch_id", arg_129_0.apartment:GetConfigID())

	arg_129_0.touchConfig = pg.dorm3d_touch_data[var_129_1]

	if not arg_129_0.touchConfig then
		arg_129_0:EnterTimelineTouchMode()

		return
	end

	arg_129_0.inTouchGame = arg_129_0.touchConfig.heartbeat_enable > 0

	setActive(arg_129_0.rtTouchGamePanel, arg_129_0.inTouchGame)

	if arg_129_0.inTouchGame then
		arg_129_0.touchCount = 0
		arg_129_0.touchLevel = 1
		arg_129_0.lastCount = 0
		arg_129_0.topCount = 0

		arg_129_0:UpdateTouchGameDisplay()
		setSlider(arg_129_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_129_0.touchCount >= 200 and 100 or arg_129_0.touchCount % 100)
		quickPlayAnimation(arg_129_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_129_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_129_0.downTimer = Timer.New(function()
			local var_130_0 = pg.dorm3d_set.reduce_interaction.key_value_int

			if arg_129_0.touchLevel > 1 then
				var_130_0 = pg.dorm3d_set.reduce_heartbeat.key_value_int
			end

			arg_129_0:UpdateTouchCount(var_130_0)
		end, 1, -1)

		arg_129_0.downTimer:Start()
	end

	local var_129_2 = {}

	table.insert(var_129_2, function(arg_131_0)
		arg_129_0:SetBlackboardValue(var_129_0, "inTouching", true)
		arg_129_0:emit(arg_129_0.SHOW_BLOCK)
		arg_129_0:SetUI(arg_131_0, "blank")
	end)
	table.insert(var_129_2, function(arg_132_0)
		local var_132_0 = arg_129_0.touchConfig.ik_status[1]

		arg_129_0:SwitchIKConfig(var_129_0, var_132_0)
		setActive(arg_129_0.uiContianer:Find("ik/btn_back"), true)
		arg_129_0:SetIKState(true, arg_132_0)
	end)
	table.insert(var_129_2, function(arg_133_0)
		existCall(arg_133_0)
	end)
	seriesAsync(var_129_2, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_129_0:emit(arg_129_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_135_0)
	local var_135_0 = arg_135_0.ladyDict[arg_135_0.apartment:GetConfigID()]

	if not arg_135_0:GetBlackboardValue(var_135_0, "inTouching") then
		return
	end

	if arg_135_0.touchTimelineConfig then
		existCall(arg_135_0.timelineFinishCall)

		return
	end

	local var_135_1 = {}

	if arg_135_0.inTouchGame then
		table.insert(var_135_1, function(arg_136_0)
			arg_135_0:emit(arg_135_0.SHOW_BLOCK)
			quickPlayAnimation(arg_135_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_136_0, 0.5)
		end)
		table.insert(var_135_1, function(arg_137_0)
			local var_137_0 = 0

			for iter_137_0, iter_137_1 in ipairs(arg_135_0.touchConfig.heartbeat_favor) do
				if iter_137_1[1] > arg_135_0.topCount then
					break
				else
					var_137_0 = iter_137_1[2]
				end
			end

			if var_137_0 > 0 then
				arg_135_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_135_0.apartment.configId, var_137_0)
			end

			arg_135_0.touchCount = nil
			arg_135_0.touchLevel = nil
			arg_135_0.topCount = nil

			if arg_135_0.downTimer then
				arg_135_0.downTimer:Stop()

				arg_135_0.downTimer = nil
			end

			arg_135_0.inTouchGame = false

			setActive(arg_135_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_137_0()
		end)
	else
		table.insert(var_135_1, function(arg_138_0)
			arg_135_0:emit(arg_135_0.SHOW_BLOCK)

			local var_138_0 = arg_135_0.touchConfig.default_favor

			if var_138_0 > 0 then
				arg_135_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_135_0.apartment.configId, var_138_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_138_0()
		end)
	end

	table.insert(var_135_1, function(arg_139_0)
		var_135_0.ikConfig = {
			character_position = var_135_0.ladyBaseZone,
			character_action = arg_135_0.touchConfig.finish_action
		}

		arg_135_0:SetIKState(false, arg_139_0)
	end)
	table.insert(var_135_1, function(arg_140_0)
		var_135_0.ikConfig = nil
		arg_135_0.blockIK = nil

		arg_135_0:SetUI(arg_140_0, "back")
	end)
	seriesAsync(var_135_1, function()
		arg_135_0:SetBlackboardValue(var_135_0, "inTouching", false)
		arg_135_0:emit(arg_135_0.HIDE_BLOCK)

		arg_135_0.touchConfig = nil

		local var_141_0 = arg_135_0.touchExitCall

		arg_135_0.touchExitCall = nil

		existCall(var_141_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_142_0, arg_142_1, arg_142_2, arg_142_3)
	local var_142_0 = arg_142_0.ladyDict[arg_142_0.apartment:GetConfigID()]

	seriesAsync({
		function(arg_143_0)
			arg_142_0:ChangeArtScene(arg_142_2, arg_143_0)
		end,
		function(arg_144_0)
			arg_142_0:ChangeSubScene(arg_142_2, arg_144_0)
		end,
		function(arg_145_0)
			arg_142_0:emit(arg_142_0.SHOW_BLOCK)

			if arg_142_1 == "back" then
				arg_142_0:SetUI(arg_145_0, "back")
			elseif arg_142_1 == "change" and arg_142_0.uiState ~= "walk" then
				arg_142_0:SetUI(arg_145_0, "walk")
			else
				arg_145_0()
			end
		end
	}, function()
		arg_142_0:emit(arg_142_0.HIDE_BLOCK)
		arg_142_0:SetBlackboardValue(var_142_0, "inWalk", arg_142_1 == "change")
		existCall(arg_142_3)
	end)
end

function var_0_0.EnterTimelineTouchMode(arg_147_0)
	local var_147_0 = arg_147_0.ladyDict[arg_147_0.apartment:GetConfigID()]

	if arg_147_0:GetBlackboardValue(var_147_0, "inIK") then
		return
	end

	local var_147_1 = arg_147_0.room:getApartmentZoneConfig(var_147_0.ladyBaseZone, "touch_id", arg_147_0.apartment:GetConfigID())
	local var_147_2 = pg.dorm3d_ik_timeline[var_147_1]

	assert(var_147_2, "Missing config in dorm3d_ik_timeline ID: " .. (var_147_1 or "nil"))

	arg_147_0.touchTimelineConfig = var_147_2

	local var_147_3 = {}

	table.insert(var_147_3, function(arg_148_0)
		arg_147_0:SetBlackboardValue(var_147_0, "inIK", true)
		arg_147_0:emit(arg_147_0.SHOW_BLOCK)
		arg_147_0:SetUI(arg_148_0, "ik")
	end)
	table.insert(var_147_3, function(arg_149_0)
		setActive(arg_147_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_147_0.uiContianer:Find("ik/Right/btn_camera"), false)
		setActive(arg_147_0.uiContianer:Find("ik/Right/Menu"), false)
		setActive(arg_147_0.uiContianer:Find("ik/Right/MenuSmall"), false)
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_147_0:emit(arg_147_0.HIDE_BLOCK)
		arg_147_0:HideCharacterBylayer(var_147_0)
		setActive(var_147_0.ladyCollider, false)

		local var_149_0
		local var_149_1

		if #var_147_2.scene > 0 then
			var_149_0, var_149_1 = unpack(string.split(var_147_2.scene, "|"))
		end

		arg_147_0:PlayTimeline({
			name = var_147_2.timeline,
			scene = var_149_0,
			sceneRoot = var_149_1
		}, function(arg_150_0, arg_150_1)
			arg_150_1()
			arg_147_0:ExitTimelineTouchMode()
		end)
	end)
	seriesAsync(var_147_3, function()
		return
	end)
end

function var_0_0.ExitTimelineTouchMode(arg_152_0)
	local var_152_0 = arg_152_0.ladyDict[arg_152_0.apartment:GetConfigID()]

	if not arg_152_0:GetBlackboardValue(var_152_0, "inIK") then
		return
	end

	arg_152_0.touchTimelineConfig = nil

	local var_152_1 = {}

	table.insert(var_152_1, function(arg_153_0)
		arg_152_0:emit(arg_152_0.SHOW_BLOCK)
		Shader.SetGlobalFloat("_ScreenClipOff", 1)
		arg_153_0()
	end)
	table.insert(var_152_1, function(arg_154_0)
		arg_152_0:RevertCharacterBylayer(var_152_0)
		setActive(var_152_0.ladyCollider, true)
		arg_152_0:SetUI(arg_154_0, "back")
	end)
	seriesAsync(var_152_1, function()
		arg_152_0:SetBlackboardValue(var_152_0, "inIK", false)
		arg_152_0:emit(arg_152_0.HIDE_BLOCK)
	end)
end

function var_0_0.EnterWalkMode(arg_156_0)
	local var_156_0 = arg_156_0.apartment:GetConfigID()
	local var_156_1 = arg_156_0.ladyDict[var_156_0]

	seriesAsync({
		function(arg_157_0)
			arg_156_0:emit(arg_156_0.SHOW_BLOCK)
			arg_156_0:HideCharacter(var_156_0)
			arg_156_0:SetBlackboardValue(var_156_1, "inWalk", true)
			arg_156_0:SetUI(arg_157_0, "walk")
		end,
		function(arg_158_0)
			arg_156_0:emit(arg_156_0.HIDE_BLOCK)
			arg_156_0:ChangeArtScene(arg_156_0.walkInfo.scene .. "|" .. arg_156_0.walkInfo.sceneRoot, arg_158_0)
		end,
		function(arg_159_0)
			arg_156_0:LoadSubScene(arg_156_0.walkInfo, arg_159_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_161_0)
	local var_161_0 = arg_161_0.apartment:GetConfigID()
	local var_161_1 = arg_161_0.ladyDict[var_161_0]

	seriesAsync({
		function(arg_162_0)
			arg_161_0:RevertArtScene(arg_161_0.walkLastSceneInfo, arg_162_0)
		end,
		function(arg_163_0)
			arg_161_0:UnloadSubScene(arg_161_0.walkInfo, arg_163_0)
		end,
		function(arg_164_0)
			arg_161_0:emit(arg_161_0.SHOW_BLOCK)
			arg_161_0:SetUI(arg_164_0, "back")
		end
	}, function()
		arg_161_0:emit(arg_161_0.HIDE_BLOCK)
		arg_161_0:RevertCharacter(var_161_0)
		arg_161_0:SetBlackboardValue(var_161_1, "inWalk", false)

		local var_165_0 = arg_161_0.walkExitCall

		arg_161_0.walkExitCall = nil
		arg_161_0.walkLastSceneInfo = nil
		arg_161_0.walkInfo = nil

		existCall(var_165_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_166_0)
	if not arg_166_0.tfCutIn then
		return
	end

	local var_166_0 = arg_166_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_166_0, true)

	local var_166_1 = GetOrAddComponent(var_166_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_166_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_166_1, arg_166_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_166_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_166_0.modelCutIn.player, "Idle")
	setActive(arg_166_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_167_0)
	if not arg_167_0.tfCutIn then
		return
	end

	local var_167_0 = arg_167_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_167_1 = GetOrAddComponent(var_167_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_167_1)
	setActive(var_167_0, false)
	setActive(arg_167_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_168_0, arg_168_1, arg_168_2)
	warning("switchIkstatus", arg_168_2)

	local var_168_0 = pg.dorm3d_ik_status[arg_168_2]

	if var_168_0.skin_id ~= arg_168_1.skinId then
		local var_168_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_168_0.base]
		local var_168_2 = _.detect(var_168_1, function(arg_169_0)
			return pg.dorm3d_ik_status[arg_169_0].skin_id == arg_168_1.skinId
		end)

		assert(var_168_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_168_1.skinId, arg_168_2))

		var_168_0 = pg.dorm3d_ik_status[var_168_2]
	end

	arg_168_1.ikConfig = var_168_0
end

function var_0_0.SetIKState(arg_170_0, arg_170_1, arg_170_2)
	local var_170_0 = arg_170_0.ladyDict[arg_170_0.apartment:GetConfigID()]
	local var_170_1 = {}

	if arg_170_1 then
		table.insert(var_170_1, function(arg_171_0)
			arg_170_0:SetBlackboardValue(var_170_0, "inIK", true)
			arg_170_0:emit(arg_170_0.SHOW_BLOCK)

			local var_171_0 = var_170_0.ikConfig.camera_group

			setActive(arg_170_0.uiContianer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_171_0] > 1)
			setActive(arg_170_0.ikControlUI, true)
			arg_171_0()
		end)

		if arg_170_0.uiState ~= "ik" then
			table.insert(var_170_1, function(arg_172_0)
				arg_170_0:SetUI(arg_172_0, "ik")
			end)
		end

		table.insert(var_170_1, function(arg_173_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_170_0:SetIKStatus(var_170_0, var_170_0.ikConfig, arg_173_0)
		end)
		table.insert(var_170_1, function(arg_174_0)
			arg_170_0:emit(arg_170_0.HIDE_BLOCK)
			arg_174_0()
		end)
	else
		assert(arg_170_0.uiState == "ik")
		table.insert(var_170_1, function(arg_175_0)
			setActive(arg_170_0.ikControlUI, false)
			arg_170_0:emit(arg_170_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_175_0()
		end)
		table.insert(var_170_1, function(arg_176_0)
			arg_170_0:ExitIKStatus(var_170_0, var_170_0.ikConfig, arg_176_0)
			arg_170_0:ResetSceneItemAnimators()
		end)
		table.insert(var_170_1, function(arg_177_0)
			arg_170_0:SetUI(arg_177_0, "back")
		end)
		table.insert(var_170_1, function(arg_178_0)
			arg_170_0:SetBlackboardValue(var_170_0, "inIK", false)
			arg_170_0:emit(arg_170_0.HIDE_BLOCK)
			arg_178_0()
		end)
	end

	seriesAsync(var_170_1, arg_170_2)
end

function var_0_0.TouchModeAction(arg_179_0, arg_179_1, arg_179_2, arg_179_3, ...)
	return switch(arg_179_3, {
		function(arg_180_0, arg_180_1)
			return function(arg_181_0)
				seriesAsync({
					function(arg_182_0)
						if not arg_180_1 or arg_180_1 == "" then
							return arg_182_0()
						end

						arg_179_0:PlaySingleAction(arg_179_1, arg_180_1, arg_182_0)
					end,
					function(arg_183_0)
						arg_179_0:SwitchIKConfig(arg_179_1, arg_180_0)
						arg_179_0:SetIKState(true, arg_183_0)
					end,
					arg_181_0
				})
			end
		end,
		function()
			return function()
				if arg_179_0.ikSpecialCall then
					local var_185_0 = arg_179_0.ikSpecialCall

					arg_179_0.ikSpecialCall = nil

					existCall(var_185_0)
				else
					arg_179_0:ExitTouchMode()
				end
			end
		end,
		function(arg_186_0, arg_186_1)
			return function(arg_187_0)
				arg_179_0:PlaySingleAction(arg_179_1, arg_186_1, arg_187_0)
			end
		end,
		function(arg_188_0, arg_188_1, arg_188_2)
			return function(arg_189_0)
				seriesAsync({
					function(arg_190_0)
						arg_179_0:DoTalk(arg_188_1, arg_190_0)
					end,
					function(arg_191_0)
						if not arg_188_2 or arg_188_2 == 0 then
							return arg_191_0()
						end

						arg_179_0:SwitchIKConfig(arg_179_1, arg_188_2)
						arg_179_0:SetIKState(true, arg_191_0)
					end,
					arg_189_0
				})
			end
		end,
		function(arg_192_0, arg_192_1, arg_192_2, arg_192_3)
			return function(arg_193_0)
				arg_179_0:PlaySceneItemAnim(arg_192_2, arg_192_3)
				arg_179_0:PlaySingleAction(arg_192_1, arg_193_0)
			end
		end,
		function(arg_194_0)
			return function(arg_195_0)
				local var_195_0 = pg.dorm3d_ik_touch[arg_179_2]

				if #var_195_0.scene_item == 0 then
					return
				end

				local var_195_1 = arg_179_0:GetSceneItem(var_195_0.scene_item)

				if not var_195_1 then
					warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_179_2, var_195_0.scene_item))

					return
				end

				local var_195_2 = var_195_1:Find(arg_194_0)

				if not IsNil(var_195_2) then
					setActive(var_195_2, false)
					setActive(var_195_2, true)
				end

				arg_195_0()
			end
		end,
		function(arg_196_0)
			local var_196_0 = pg.dorm3d_ik_touch_move[arg_196_0]
			local var_196_1 = var_196_0.target_ik
			local var_196_2 = var_196_0.move_time
			local var_196_3 = var_196_0.ik_point
			local var_196_4 = var_196_0.touch_step

			arg_179_1.IKSettings.forceMove = arg_179_1.IKSettings.forceMove or {}

			local var_196_5 = arg_179_1.IKSettings.forceMove

			var_196_5[var_196_1] = var_196_5[var_196_1] or {}
			var_196_5[var_196_1].count = var_196_5[var_196_1].count or 0

			return function(arg_197_0)
				seriesAsync({
					function(arg_198_0)
						if var_196_5[var_196_1].count >= #var_196_4 then
							return arg_198_0()
						end

						local var_198_0 = Dorm3dIK.New({
							configId = var_196_1
						})
						local var_198_1 = Vector2.New(unpack(var_196_3))
						local var_198_2 = var_196_5[var_196_1].count
						local var_198_3 = var_196_4[var_198_2 + 1] - (var_198_2 == 0 and 0 or var_196_4[var_198_2])

						var_196_5[var_196_1].count = var_198_2 + 1

						pg.IKMgr.GetInstance():ResetIK(var_198_0:GetTriggerBoneName())

						local var_198_4 = arg_179_1.IKSettings.Colliders[var_198_0:GetTriggerBoneName()]
						local var_198_5 = arg_179_0.raycastCamera:WorldToScreenPoint(var_198_4.position)

						pg.IKMgr.GetInstance():PlayIKMove(var_198_5, var_198_0:GetTriggerBoneName(), var_198_1, var_196_4[var_198_2 + 1], var_196_2, function()
							var_196_5[var_196_1].count = 0

							arg_198_0()
						end)
					end,
					arg_197_0
				})
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_202_0, arg_202_1)
	local var_202_0 = arg_202_0.ladyDict[arg_202_0.apartment:GetConfigID()]

	if var_202_0.ikTimelineMode then
		arg_202_0:ExitIKTimelineStatus(var_202_0)

		local var_202_1 = arg_202_1:GetTimelineAction()

		if var_202_1 then
			arg_202_0.nowTimelinePlayer:TriggerEvent(var_202_1)
		end

		return
	end

	if not var_202_0.ikConfig then
		return
	end

	local var_202_2 = arg_202_1:GetControllerPath()
	local var_202_3 = var_202_0.ikActionDict[var_202_2]

	if not var_202_3 then
		return
	end

	arg_202_0.blockIK = true

	arg_202_0:TouchModeAction(var_202_0, arg_202_1:GetConfigID(), unpack(var_202_3))(function()
		arg_202_0:ResetIKTipTimer()

		arg_202_0.blockIK = nil
	end)
end

function var_0_0.OnTouchCharacterBody(arg_204_0, arg_204_1)
	local var_204_0 = arg_204_0.ladyDict[arg_204_0.apartment:GetConfigID()]

	if not var_204_0.ikConfig then
		return
	end

	if type(var_204_0.ikConfig.touch_data) ~= "table" then
		return
	end

	for iter_204_0, iter_204_1 in ipairs(var_204_0.iKTouchDatas) do
		local var_204_1, var_204_2, var_204_3 = unpack(iter_204_1)
		local var_204_4 = pg.dorm3d_ik_touch[var_204_1]

		if var_204_4.body == arg_204_1 then
			local var_204_5 = var_204_4.action_emote

			if #var_204_5 > 0 then
				arg_204_0:PlayFaceAnim(var_204_0, var_204_5)
			end

			local var_204_6 = var_204_4.vibrate

			if type(var_204_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_204_7 = {}
				local var_204_8 = {}
				local var_204_9 = {}

				underscore.each(var_204_6, function(arg_205_0)
					local var_205_0 = arg_205_0[1]

					if PLATFORM == PLATFORM_IPHONEPLAYER then
						var_205_0 = var_205_0 / 1000
					end

					table.insert(var_204_7, var_205_0)
					table.insert(var_204_8, arg_205_0[2])
					table.insert(var_204_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_204_7, var_204_8)
				elseif PLATFORM == PLATFORM_IPHONEPLAYER then
					VibrateMgr.Instance:VibrateWaveform(var_204_7, var_204_8, var_204_9)
				end
			end

			arg_204_0.blockIK = true

			arg_204_0:TouchModeAction(var_204_0, var_204_1, unpack(var_204_3))(function()
				arg_204_0:ResetIKTipTimer()

				arg_204_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_207_0)
	setActive(arg_207_0.rtTouchGamePanel:Find("effect_bg"), arg_207_0.touchLevel == 2)
	setActive(arg_207_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_207_0.touchLevel == 2)

	if arg_207_0.touchLevel == 1 then
		setActive(arg_207_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_207_0.uiContianer:Find("ik/btn_back_heartbeat"), false)
		quickPlayAnimation(arg_207_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_207_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_207_0.touchLevel == 2 then
		setActive(arg_207_0.uiContianer:Find("ik/btn_back"), false)
		setActive(arg_207_0.uiContianer:Find("ik/btn_back_heartbeat"), true)
		quickPlayAnimation(arg_207_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_207_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_208_0, arg_208_1)
	if arg_208_0.touchLevel > 1 then
		arg_208_1 = math.min(0, arg_208_1)
	end

	arg_208_0.touchCount = math.clamp(arg_208_0.touchCount + arg_208_1, 0, 100)

	if arg_208_0.sliderLT and LeanTween.isTweening(arg_208_0.sliderLT) then
		LeanTween.cancel(arg_208_0.sliderLT)

		arg_208_0.sliderLT = nil
	end

	setSlider(arg_208_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_208_0.touchCount)

	local var_208_0

	if arg_208_0.touchCount >= 100 then
		var_208_0 = 2
	elseif arg_208_0.touchCount <= 0 then
		var_208_0 = 1
	end

	if var_208_0 and var_208_0 ~= arg_208_0.touchLevel then
		if arg_208_0.blockIK then
			return
		end

		arg_208_0.touchLevel = var_208_0

		local var_208_1 = arg_208_0.touchConfig.ik_status[var_208_0]

		if var_208_1 then
			if var_208_0 > 1 then
				arg_208_0.touchCount = 200
			elseif var_208_0 == 1 then
				arg_208_0.touchCount = 0
			end

			local var_208_2 = arg_208_0.ladyDict[arg_208_0.apartment:GetConfigID()]

			seriesAsync({
				function(arg_209_0)
					arg_208_0:ShowBlackScreen(true, arg_209_0)
				end,
				function(arg_210_0)
					arg_208_0:SwitchIKConfig(var_208_2, var_208_1)
					arg_208_0:SetIKState(true, arg_210_0)

					if var_208_0 > 1 and arg_208_0.touchConfig.heartbeat_enter_anim ~= "" then
						arg_208_0:SwitchAnim(var_208_2, arg_208_0.touchConfig.heartbeat_enter_anim)
					end
				end,
				function(arg_211_0)
					arg_208_0:ShowBlackScreen(false, arg_211_0)
				end
			})
		end

		arg_208_0:UpdateTouchCount(0)
		arg_208_0:UpdateTouchGameDisplay()
	end

	arg_208_0.topCount = math.max(arg_208_0.topCount, arg_208_0.touchCount)
end

function var_0_0.ExitHeartbeatMode(arg_212_0)
	if not arg_212_0.touchLevel or arg_212_0.touchLevel == 1 then
		return
	end

	arg_212_0.touchCount = 0

	arg_212_0:UpdateTouchCount(0)
end

function var_0_0.DoTouch(arg_213_0, arg_213_1, arg_213_2)
	if arg_213_0.inTouchGame then
		switch(arg_213_2, {
			function()
				arg_213_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_213_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_213_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_213_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat_trriger.key_value_int)
			end
		})
	end
end

function var_0_0.DoTalk(arg_218_0, arg_218_1, arg_218_2)
	while rawget(arg_218_0, "class") ~= var_0_0 do
		arg_218_0 = getmetatable(arg_218_0).__index
	end

	if arg_218_0.apartment and arg_218_0:GetBlackboardValue(arg_218_0.ladyDict[arg_218_0.apartment:GetConfigID()], "inTalking") then
		errorMsg("Talking block:" .. arg_218_1)

		return
	end

	if not arg_218_0.room:isPersonalRoom() then
		local var_218_0 = pg.dorm3d_dialogue_group[arg_218_1].char_id

		if arg_218_0.apartment then
			assert(arg_218_0.apartment:GetConfigID() == var_218_0)
		else
			arg_218_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_218_0))
		end
	end

	local var_218_1 = arg_218_0.ladyDict[arg_218_0.apartment:GetConfigID()]

	if arg_218_1 == 10010 and not arg_218_0.apartment.talkDic[arg_218_1] then
		arg_218_0.firstTimelineTouch = true
		arg_218_0.firstMoveGuide = true
	end

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = arg_218_0.contextData.timeIndex == 1 and 110 or 115,
			ship_id = arg_218_0.apartment:GetConfigID()
		},
		{
			value = 1,
			event_type = 155,
			ship_id = arg_218_0.apartment:GetConfigID()
		}
	})

	local var_218_2 = {}

	if arg_218_0:GetBlackboardValue(var_218_1, "inPending") then
		table.insert(var_218_2, function(arg_219_0)
			arg_218_0:OutOfLazy(arg_218_0.apartment:GetConfigID(), arg_219_0)
		end)
	end

	local var_218_3 = pg.dorm3d_dialogue_group[arg_218_1]
	local var_218_4 = var_218_3.performance_type == 1
	local var_218_5

	table.insert(var_218_2, function(arg_220_0)
		arg_218_0:emit(arg_218_0.SHOW_BLOCK)
		arg_218_0:SetBlackboardValue(var_218_1, var_218_4 and "inPerformance" or "inTalking", true)
		arg_218_0:emit(Dorm3dRoomMediator.DO_TALK, arg_218_1, function(arg_221_0)
			var_218_5 = arg_221_0

			arg_220_0()
		end)
	end)
	table.insert(var_218_2, function(arg_222_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_218_0.apartment.configId, arg_218_0.apartment.level, arg_218_1, var_218_3.type, arg_218_0.room:getZoneConfig(arg_218_0.ladyDict[arg_218_0.apartment:GetConfigID()].ladyBaseZone, "id"), var_218_3.action_type, table.CastToString(var_218_3.trigger_config), arg_218_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_218_0:SetUI(arg_222_0, "blank")
	end)

	if var_218_3.trigger_area and var_218_3.trigger_area ~= "" then
		table.insert(var_218_2, function(arg_223_0)
			arg_218_0:ShiftZone(var_218_3.trigger_area, arg_223_0)
		end)
	end

	if var_218_3.performance_type == 0 then
		table.insert(var_218_2, function(arg_224_0)
			arg_218_0:emit(arg_218_0.HIDE_BLOCK)

			if arg_218_0.contextData.isVideoTalk then
				arg_218_0.videoPlayer:ExecuteAction("Play", var_218_3.story, function()
					onDelayTick(arg_224_0, 0.001)
				end)
			else
				pg.NewStoryMgr.GetInstance():ForceManualPlay(var_218_3.story, function()
					onDelayTick(arg_224_0, 0.001)
				end, true)
			end
		end)
	elseif var_218_3.performance_type == 1 then
		table.insert(var_218_2, function(arg_227_0)
			arg_218_0:emit(arg_218_0.HIDE_BLOCK)
			arg_218_0:PerformanceQueue(var_218_3.story, arg_227_0)
		end)
	else
		assert(false)
	end

	table.insert(var_218_2, function(arg_228_0)
		arg_218_0:emit(arg_218_0.SHOW_BLOCK)
		arg_228_0()
	end)
	table.insert(var_218_2, function(arg_229_0)
		local var_229_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_218_3.story)

		if var_229_0 then
			local var_229_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_229_0, var_229_1))
		end

		if var_218_5 and #var_218_5 > 0 then
			arg_218_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_218_5, arg_229_0)
		else
			arg_229_0()
		end
	end)
	table.insert(var_218_2, function(arg_230_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_218_0:emit(arg_218_0.HIDE_BLOCK)

		if arg_218_0.contextData.isVideoTalk then
			existCall(arg_230_0)
		else
			arg_218_0:SetBlackboardValue(var_218_1, var_218_4 and "inPerformance" or "inTalking", false)
			arg_218_0:SetUI(arg_230_0, "back")
		end
	end)
	seriesAsync(var_218_2, function()
		if arg_218_2 then
			return arg_218_2()
		else
			arg_218_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_232_0, arg_232_1, arg_232_2, arg_232_3)
	local var_232_0 = arg_232_0.rtExtraScreen:Find("TalkTouchOption")
	local var_232_1
	local var_232_2 = var_232_0:Find("content")

	UIItemList.StaticAlign(var_232_2, var_232_2:Find("clickTpl"), #arg_232_1.options, function(arg_233_0, arg_233_1, arg_233_2)
		arg_233_1 = arg_233_1 + 1

		if arg_233_0 == UIItemList.EventUpdate then
			local var_233_0 = arg_232_1.options[arg_233_1]

			setAnchoredPosition(arg_233_2, NewPos(unpack(var_233_0.pos)))
			onButton(arg_232_0, arg_233_2, function()
				var_232_1(var_233_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_233_2, not table.contains(arg_232_2, var_233_0.flag))
		end
	end)
	setActive(var_232_0, true)

	function var_232_1(arg_235_0)
		setActive(var_232_0, false)
		arg_232_3(arg_235_0)
	end
end

function var_0_0.DoTimelineOption(arg_236_0, arg_236_1, arg_236_2)
	local var_236_0 = arg_236_0.rtTimelineScreen:Find("TimelineOption")
	local var_236_1
	local var_236_2 = var_236_0:Find("content")

	UIItemList.StaticAlign(var_236_2, var_236_2:Find("clickTpl"), #arg_236_1, function(arg_237_0, arg_237_1, arg_237_2)
		arg_237_1 = arg_237_1 + 1

		if arg_237_0 == UIItemList.EventUpdate then
			local var_237_0 = arg_236_1[arg_237_1]

			setText(arg_237_2:Find("Text"), HXSet.hxLan(var_237_0.content))
			onButton(arg_236_0, arg_237_2, function()
				var_236_1(arg_237_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_236_0, true)

	function var_236_1(arg_239_0)
		setActive(var_236_0, false)
		arg_236_2(arg_239_0)
	end
end

function var_0_0.DoTimelineTouch(arg_240_0, arg_240_1, arg_240_2)
	local var_240_0 = arg_240_0.rtTimelineScreen:Find("TimelineTouch")
	local var_240_1
	local var_240_2 = var_240_0:Find("content")

	UIItemList.StaticAlign(var_240_2, var_240_2:Find("clickTpl"), #arg_240_1, function(arg_241_0, arg_241_1, arg_241_2)
		arg_241_1 = arg_241_1 + 1

		if arg_241_0 == UIItemList.EventUpdate then
			local var_241_0 = arg_240_1[arg_241_1]

			setAnchoredPosition(arg_241_2, NewPos(unpack(var_241_0.pos)))
			onButton(arg_240_0, arg_241_2, function()
				var_240_1(arg_241_1)
			end, SFX_CONFIRM)

			if arg_240_0.firstTimelineTouch then
				arg_240_0.firstTimelineTouch = nil

				setActive(arg_241_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_240_0, true)

	function var_240_1(arg_243_0)
		setActive(var_240_0, false)
		arg_240_2(arg_243_0)
	end
end

function var_0_0.DoShortWait(arg_244_0, arg_244_1)
	local var_244_0 = arg_244_0.ladyDict[arg_244_1]
	local var_244_1 = getProxy(ApartmentProxy):getApartment(arg_244_1)
	local var_244_2 = arg_244_0.room:getApartmentZoneConfig(var_244_0.ladyBaseZone, "special_action", arg_244_1)
	local var_244_3 = var_244_2 and var_244_2[math.random(#var_244_2)] or nil

	if not var_244_3 then
		return
	end

	arg_244_0:PlaySingleAction(var_244_0, var_244_3)
end

function var_0_0.OutOfLazy(arg_245_0, arg_245_1, arg_245_2)
	local var_245_0 = arg_245_0.ladyDict[arg_245_1]
	local var_245_1 = {}

	if arg_245_0:GetBlackboardValue(var_245_0, "inPending") then
		table.insert(var_245_1, function(arg_246_0)
			arg_245_0.shiftLady = arg_245_1

			arg_245_0:ShiftZone(var_245_0.ladyBaseZone, arg_246_0)
		end)
	end

	seriesAsync(var_245_1, arg_245_2)
end

function var_0_0.OutOfPending(arg_247_0, arg_247_1, arg_247_2)
	assert(arg_247_0.wakeUpTalkId)

	local var_247_0 = arg_247_0.wakeUpTalkId

	seriesAsync({
		function(arg_248_0)
			arg_247_0:SetUI(arg_248_0, "blank")
		end,
		function(arg_249_0)
			arg_247_0.shiftLady = arg_247_1

			local var_249_0 = arg_247_0.ladyDict[arg_247_1]

			arg_247_0:ShiftZone(var_249_0.ladyBaseZone, arg_249_0)
		end,
		function(arg_250_0)
			arg_247_0:DoTalk(var_247_0, arg_250_0)
		end
	}, function()
		arg_247_0:SetUIStore(arg_247_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_252_0, arg_252_1)
	local var_252_0

	if arg_252_0:GetBlackboardValue(arg_252_1, "inPending") then
		var_252_0 = tobool(arg_252_0:GetBlackboardValue(arg_252_1, "inDistance"))
	else
		local var_252_1 = arg_252_0:GetBlackboardValue(arg_252_1, "groupId")

		var_252_0 = tobool(arg_252_0.activeLady[var_252_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_252_1.ladyBlackboard))
	end

	if arg_252_1.blockCanWatch then
		var_252_0 = false
	end

	if (not arg_252_1.nowCanWatchState or arg_252_1.nowCanWatchState ~= var_252_0) and arg_252_1.ladyWatchFloat then
		arg_252_1.nowCanWatchState = var_252_0

		arg_252_0:ShowOrHideCanWatchMark(arg_252_1, arg_252_1.nowCanWatchState)
	end
end

function var_0_0.HandleGameNotification(arg_253_0, arg_253_1, arg_253_2)
	local var_253_0 = arg_253_0.ladyDict[arg_253_0.apartment:GetConfigID()]

	switch(arg_253_1, {
		[Dorm3dMiniGameMediator.OPERATION] = function()
			local var_254_0 = arg_253_2.miniGameId

			switch(arg_253_2.miniGameId, {
				[67] = function()
					if arg_253_2.operationCode == "GAME_HIT_AREA" then
						local var_255_0 = {
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
						local var_255_1, var_255_2 = unpack(var_255_0[arg_253_2.index])

						arg_253_0:PlayFaceAnim(var_253_0, var_255_1)

						if arg_253_0.tfCutIn then
							quickPlayAnimator(arg_253_0.modelCutIn.lady, var_255_2)
							quickPlayAnimator(arg_253_0.modelCutIn.player, var_255_2)
						end
					elseif arg_253_2.operationCode == "GAME_RESULT" then
						if arg_253_2.win then
							arg_253_0:PlayFaceAnim(var_253_0, "Face_XYX_victory")
							arg_253_0:PlaySingleAction(var_253_0, "minigame_win")
						else
							arg_253_0:PlayFaceAnim(var_253_0, "Face_XYX_lose")
							arg_253_0:PlaySingleAction(var_253_0, "minigame_lose")
						end

						setActive(arg_253_0.rtExtraScreen:Find("MiniGameCutIn"), false)
					end
				end,
				[70] = function()
					if arg_253_2.operationCode == "GAME_READY" then
						arg_253_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_253_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil

						arg_253_0:PlaySingleAction(var_253_0, "shuohua_sikao")
					elseif arg_253_2.operationCode == "ROUND_RESULT" then
						local var_256_0

						if arg_253_2.success then
							var_256_0 = {
								"shuohua_wenhou",
								"shuohua_sikao"
							}
						else
							var_256_0 = {
								"shuohua_yaotou",
								"shuohua_sikao"
							}
						end

						seriesAsync(underscore.map(var_256_0, function(arg_257_0)
							return function(arg_258_0)
								arg_253_0:PlaySingleAction(var_253_0, arg_257_0, arg_258_0)
							end
						end), function()
							return
						end)
					elseif arg_253_2.operationCode == "GAME_RESULT" then
						local var_256_1 = arg_253_0.cameras[var_0_0.CAMERA.TALK].transform

						var_256_1.position = var_256_1.position + var_256_1.right * 0.11

						local var_256_2 = {
							"shuohua_gandong"
						}

						seriesAsync(underscore.map(var_256_2, function(arg_260_0)
							return function(arg_261_0)
								arg_253_0:PlaySingleAction(var_253_0, arg_260_0, arg_261_0)
							end
						end), function()
							return
						end)
					end
				end,
				[75] = function()
					if arg_253_2.operationCode == "BEFORE_OPEN_GAME" then
						arg_253_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_253_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil
					elseif arg_253_2.operationCode == "GAME_RPS_RESULT" then
						if arg_253_2.index == 1 then
							arg_253_0:PlaySingleAction(var_253_0, "ab_shuohua_lianxuyaotou_01")
							arg_253_0:PlayFaceAnim(var_253_0, "Face_weixiao")
						elseif arg_253_2.index == 2 then
							arg_253_0:PlaySingleAction(var_253_0, "ab_shuohua_lianxudiantou_01")
							arg_253_0:PlayFaceAnim(var_253_0, "Face_kaixin")
						end
					elseif arg_253_2.operationCode == "GAME_RESULT" then
						if not arg_253_2.win then
							arg_253_0:PlaySingleAction(var_253_0, "ab_shuohua_taibangle_01")
						end

						arg_253_0:PlayFaceAnim(var_253_0, "Face_kaixin")
					end
				end
			}, function()
				warning("without miniGameId:" .. arg_253_2.miniGameId)
			end)

			if arg_253_2.operationCode == "BEFORE_OPEN_GAME" then
				local var_254_1 = getProxy(PlayerProxy):getPlayerId()
				local var_254_2 = 0

				if var_254_0 == 67 or var_254_0 == 70 then
					var_254_2 = PlayerPrefs.GetInt("mg_new_score_" .. tostring(var_254_1) .. "_" .. arg_253_2.miniGameId, 0)
				else
					var_254_2 = PlayerPrefs.GetInt("mg_score_" .. tostring(var_254_1) .. "_" .. arg_253_2.miniGameId, 0)
				end

				arg_253_0.highScore = var_254_2
			elseif arg_253_2.operationCode == "GAME_RESULT" then
				local var_254_3 = arg_253_2.score
				local var_254_4 = getProxy(PlayerProxy):getPlayerId()

				if var_254_3 > arg_253_0.highScore then
					if var_254_0 == 67 or var_254_0 == 70 then
						PlayerPrefs.SetInt("mg_new_score_" .. tostring(var_254_4) .. "_" .. arg_253_2.miniGameId, var_254_3)
					end

					getProxy(Dorm3dChatProxy):TriggerEvent({
						{
							event_type = 159,
							value = var_254_3,
							ship_id = arg_253_0.apartment:GetConfigID()
						}
					})
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_253_2.score))
			elseif arg_253_2.operationCode == "GAME_CLOSE" and arg_253_2.doTrack == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_265_0, arg_265_1, arg_265_2)
	local var_265_0, var_265_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_265_1)
	end)

	if not var_265_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_265_1)
		existCall(arg_265_2)

		return
	end

	warning(arg_265_1)

	arg_265_0.performanceInfo = {
		name = arg_265_1
	}

	local var_265_2 = {}

	table.insert(var_265_2, function(arg_267_0)
		arg_265_0:SetUI(arg_267_0, "blank")
	end)
	table.insertto(var_265_2, underscore.map(var_265_1, function(arg_268_0)
		return switch(arg_268_0.type, {
			function()
				return function(arg_270_0)
					local var_270_0 = unpack(arg_268_0.params)

					arg_265_0:DoTalk(var_270_0, arg_270_0, true)
				end
			end,
			function()
				return function(arg_272_0)
					arg_265_0.touchExitCall = arg_272_0

					arg_265_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_274_0)
					local var_274_0 = arg_265_0.ladyDict[arg_265_0.apartment:GetConfigID()]

					arg_265_0:PlaySingleAction(var_274_0, arg_268_0.name, arg_274_0)
				end
			end,
			function()
				return function(arg_276_0)
					arg_265_0:emit(arg_265_0.PLAY_EXPRESSION, arg_268_0)
					arg_276_0()
				end
			end,
			function()
				return function(arg_278_0)
					arg_265_0:ShiftZone(arg_268_0.name, arg_278_0)
				end
			end,
			function()
				return function(arg_280_0)
					arg_265_0.contextData.timeIndex = arg_268_0.params[1]

					local var_280_0 = arg_268_0.params[2] or false

					if Dorm3dSceneMgr.IsSameSceneInfo(arg_265_0.dormSceneMgr.artSceneInfo, arg_265_0.dormSceneMgr.sceneInfo) then
						arg_265_0:SwitchDayNight(arg_265_0.contextData.timeIndex)

						if var_280_0 then
							onNextTick(function()
								arg_265_0:RefreshSlots()
							end)
						end
					end

					arg_265_0:UpdateContactState()
					onNextTick(arg_280_0)
				end
			end,
			function()
				return function(arg_283_0)
					if arg_268_0.name then
						arg_265_0:ActiveCameraByName(arg_268_0.name)
						existCall(arg_283_0)
					else
						arg_265_0:ActiveStateCamera(arg_268_0.params[1], arg_283_0)
					end
				end
			end,
			function()
				return function(arg_285_0)
					if arg_268_0.name == "base" then
						arg_265_0:RevertArtScene(arg_265_0.dormSceneMgr.sceneInfo, arg_285_0)
					else
						local var_285_0 = arg_268_0.params.scene
						local var_285_1 = arg_268_0.params.sceneRoot

						arg_265_0:ChangeArtScene(var_285_0 .. "|" .. var_285_1, arg_285_0)
					end
				end
			end,
			function()
				return function(arg_287_0)
					local var_287_0 = arg_268_0.params.name

					if arg_268_0.name == "load" then
						local var_287_1 = tobool(arg_268_0.params.wait_timeline) and function(arg_288_0)
							arg_265_0.waitForTimeline = arg_288_0
						end

						arg_265_0:LoadTimelineScene(var_287_0, true, var_287_1, arg_287_0)
					elseif arg_268_0.name == "unload" then
						arg_265_0:UnloadTimelineScene(var_287_0, true, arg_287_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_290_0)
					setActive(arg_265_0.uiContianer:Find("walk/btn_back"), false)

					local var_290_0 = arg_265_0.ladyDict[arg_265_0.apartment:GetConfigID()]

					if arg_268_0.name == "change" then
						local var_290_1 = arg_268_0.params.scene
						local var_290_2 = arg_268_0.params.sceneRoot

						var_290_0.walkBornPoint = arg_268_0.params.point or "Default"

						arg_265_0:ChangeWalkScene(arg_268_0.name, var_290_1 .. "|" .. var_290_2, arg_290_0)
					elseif arg_268_0.name == "back" then
						var_290_0.walkBornPoint = nil

						arg_265_0:ChangeWalkScene(arg_268_0.name, arg_265_0.dormSceneMgr.sceneInfo, arg_290_0)
					elseif arg_268_0.name == "set" then
						local function var_290_3()
							local var_291_0 = arg_290_0

							arg_290_0 = nil

							return existCall(var_291_0)
						end

						for iter_290_0, iter_290_1 in pairs(arg_268_0.params) do
							switch(iter_290_0, {
								back_button_trigger = function(arg_292_0)
									onButton(arg_265_0, arg_265_0.uiContianer:Find("walk/btn_back"), var_290_3, SFX_DORM_BACK)
									setActive(arg_265_0.uiContianer:Find("walk/btn_back"), IsUnityEditor and arg_292_0)
								end,
								near_trigger = function(arg_293_0)
									if arg_293_0 == true then
										arg_293_0 = 1.5
									end

									if arg_293_0 then
										function arg_265_0.walkNearCallback(arg_294_0)
											if arg_294_0 < arg_293_0 then
												arg_265_0.walkNearCallback = nil

												var_290_3()
											end
										end
									else
										arg_265_0.walkNearCallback = nil
									end
								end
							}, nil, iter_290_1)
						end

						if arg_265_0.firstMoveGuide then
							setActive(arg_265_0.povLayer:Find("Guide"), arg_265_0.firstMoveGuide)

							arg_265_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_296_0)
					if arg_268_0.name == "set" then
						local var_296_0 = arg_265_0.ladyDict[arg_265_0.apartment:GetConfigID()]

						arg_265_0:SwitchIKConfig(var_296_0, arg_268_0.params.state)
						setActive(arg_265_0.uiContianer:Find("ik/btn_back"), not arg_268_0.params.hide_back)

						arg_265_0.ikSpecialCall = arg_296_0

						arg_265_0:SetIKState(true)
					elseif arg_268_0.name == "back" then
						local var_296_1 = arg_265_0.ladyDict[arg_265_0.apartment:GetConfigID()]

						var_296_1.ikConfig = arg_268_0.params

						arg_265_0:SetIKState(false, function()
							var_296_1.ikConfig = nil

							existCall(arg_296_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_299_0)
					arg_265_0.blackSceneInfo = setmetatable(arg_268_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_268_0.name == "show" and 0 or 0.5
						}
					})

					if arg_268_0.name == "show" then
						arg_265_0:ShowBlackScreen(true, arg_299_0)
					elseif arg_268_0.name == "hide" then
						arg_265_0:ShowBlackScreen(false, arg_299_0)
					else
						assert(false)
					end

					arg_265_0.blackSceneInfo = nil
				end
			end
		})
	end))
	table.insert(var_265_2, function(arg_300_0)
		arg_265_0:SetUI(arg_300_0, "back")

		arg_265_0.performanceInfo = nil
	end)
	seriesAsync(var_265_2, arg_265_2)
end

function var_0_0.TriggerContact(arg_301_0, arg_301_1)
	arg_301_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_301_1,
		roomId = arg_301_0.room:GetConfigID(),
		groupId = arg_301_0.room:isPersonalRoom() and arg_301_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_302_0)
	arg_302_0:SetContactStateDic(arg_302_0.room:getTriggerableCollectItemDic(arg_302_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_303_0)
	local var_303_0, var_303_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_303_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_303_0, var_303_1))
	setActive(arg_303_0.rtStaminaDisplay, false)

	if arg_303_0.apartment then
		setText(arg_303_0.rtFavorLevel:Find("rank/Text"), arg_303_0.apartment.level)

		local var_303_2, var_303_3 = arg_303_0.apartment:getFavor()
		local var_303_4 = arg_303_0.apartment:isMaxFavor()

		setActive(arg_303_0.rtFavorLevel:Find("Max"), var_303_4)
		setActive(arg_303_0.rtFavorLevel:Find("Text"), not var_303_4)
		setText(arg_303_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_303_2, var_303_3))
	end

	setActive(arg_303_0.rtFavorLevel:Find("red"), Dorm3dLevelLayer.IsShowRed())
end

function var_0_0.UpdateBtnState(arg_304_0)
	local var_304_0 = not arg_304_0.room:isPersonalRoom() or arg_304_0:CheckSystemOpen("Furniture")
	local var_304_1 = Dorm3dFurniture.IsTimelimitShopTip(arg_304_0.room:GetConfigID())

	setActive(arg_304_0.uiContianer:Find("base/left/btn_furniture/tipTimelimit"), var_304_0 and var_304_1)

	local var_304_2 = Dorm3dFurniture.NeedViewTip(arg_304_0.room:GetConfigID())

	setActive(arg_304_0.uiContianer:Find("base/left/btn_furniture/tip"), var_304_0 and not var_304_1 and var_304_2)
	setActive(arg_304_0.uiContianer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_305_0)
		return tobool(arg_305_0)
	end):any(function(arg_306_0)
		return #arg_306_0:getSpecialTalking() > 0 or arg_306_0:getIconTip() == "main"
	end):value())
	setActive(arg_304_0.uiContianer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_307_0, arg_307_1)
	table.insert(arg_307_0.unlockList, arg_307_1)

	if not isActive(arg_307_0.rtFavorUp) then
		setText(arg_307_0.rtFavorUp:Find("Text"), table.remove(arg_307_0.unlockList, 1))
		setActive(arg_307_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_308_0, arg_308_1)
	local var_308_0 = arg_308_1.triggerId
	local var_308_1 = arg_308_1.delta
	local var_308_2 = arg_308_1.cost
	local var_308_3 = arg_308_1.apartment
	local var_308_4 = pg.dorm3d_favor_trigger[var_308_0]

	if var_308_4.is_repeat == 0 then
		if var_308_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_308_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_308_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_308_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_308_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_308_0))
		end
	elseif arg_308_1.delta > 0 then
		local var_308_5, var_308_6 = var_308_3:getFavor()
		local var_308_7 = var_308_5 + var_308_1

		setText(arg_308_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=48>+%d</size>", math.min(9999, var_308_1)))
		setSlider(arg_308_0.rtFavorUpDaily:Find("bg/slider"), 0, var_308_6, var_308_5)
		setAnchoredPosition(arg_308_0.rtFavorUpDaily:Find("bg"), arg_308_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_308_8 = {}
		local var_308_9 = arg_308_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_308_9, function(arg_309_0)
			setActive(arg_309_0, false)
		end)

		local var_308_10

		if var_308_4.effect and var_308_4.effect ~= "" then
			var_308_10 = var_308_9:Find(var_308_4.effect .. "(Clone)")

			if not var_308_10 then
				table.insert(var_308_8, function(arg_310_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_311_0)
						setParent(arg_311_0, var_308_9)

						var_308_10 = tf(arg_311_0)

						arg_310_0()
					end)
				end)
			else
				setActive(var_308_10, true)
			end
		end

		local var_308_11 = arg_308_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_308_11:SetTriggerEvent(function(arg_312_0)
			local var_312_0 = GetComponent(arg_308_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_308_5, var_308_7, 0.5):setOnUpdate(System.Action_float(function(arg_313_0)
				var_312_0.value = arg_313_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_308_0.exited then
						return
					end

					quickPlayAnimator(arg_308_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_308_11:SetEndEvent(function(arg_316_0)
			setActive(arg_308_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_308_8, function()
			local var_317_0 = arg_308_0.ladyDict[var_308_3:GetConfigID()]

			setLocalPosition(arg_308_0.rtFavorUpDaily, arg_308_0:GetLocalPosition(arg_308_0:GetScreenPosition(var_317_0.ladyHeadCenter.position), arg_308_0.rtFavorUpDaily.parent))
			setActive(arg_308_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_308_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_308_0.rtFavorUpDaily, "favor_open")

			if var_308_2 > 0 then
				local var_317_1, var_317_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_308_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_308_2)
				setText(arg_308_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_317_1 + var_308_2, var_317_2))
				setActive(arg_308_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_318_0, arg_318_1, arg_318_2, arg_318_3)
	arg_318_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_318_0.isLock = false
	end))

	local var_318_0 = math.floor(arg_318_1.level / 10)
	local var_318_1 = math.fmod(arg_318_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_318_1, arg_318_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_318_0, arg_318_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_318_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_318_0 > 0)

	local var_318_2
	local var_318_3

	arg_318_0.clientAward, var_318_3 = Dorm3dIconHelper.SplitStory(arg_318_1:getFavorConfig("levelup_client_item", arg_318_1.level))
	arg_318_0.serverAward = arg_318_2

	local var_318_4 = arg_318_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_318_0.levelItemList then
		arg_318_0.levelItemList = UIItemList.New(var_318_4, var_318_4:Find("tpl"))

		arg_318_0.levelItemList:make(function(arg_320_0, arg_320_1, arg_320_2)
			local var_320_0 = arg_320_1 + 1

			if arg_320_0 == UIItemList.EventUpdate then
				if arg_320_1 < #arg_318_0.serverAward then
					updateDorm3dIcon(arg_320_2, arg_318_0.serverAward[var_320_0])
					onButton(arg_318_0, arg_320_2, function()
						arg_318_0:emit(BaseUI.ON_NEW_DROP, {
							style = "dorm",
							drop = arg_318_0.serverAward[var_320_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_320_2, arg_318_0.clientAward[var_320_0 - #arg_318_0.serverAward])
					onButton(arg_318_0, arg_320_2, function()
						arg_318_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_318_0.clientAward[var_320_0 - #arg_318_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_318_0.levelItemList:align(#arg_318_0.serverAward + #arg_318_0.clientAward)
	setActive(arg_318_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	arg_318_0:OverlayPanel(arg_318_0.rtLevelUpWindow)

	function arg_318_0.levelUpCallback()
		arg_318_0.levelUpCallback = nil

		if var_318_3 then
			arg_318_0:PopNewStoryTip(var_318_3)
		end

		existCall(arg_318_3)
	end
end

function var_0_0.PopNewStoryTip(arg_324_0, arg_324_1, arg_324_2)
	local var_324_0 = arg_324_0.uiContianer:Find("base/top/story_tip")

	setActive(var_324_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_324_0, false)
	end))
	setText(var_324_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_324_1[2]].name))
	existCall(arg_324_2)
end

function var_0_0.UpdateZoneList(arg_326_0)
	local var_326_0

	if arg_326_0.room:isPersonalRoom() then
		var_326_0 = arg_326_0.ladyDict[arg_326_0.apartment:GetConfigID()].ladyBaseZone
	else
		var_326_0 = arg_326_0:GetAttachedFurnitureName()
	end

	for iter_326_0, iter_326_1 in ipairs(arg_326_0.zoneDatas) do
		if iter_326_1:GetWatchCameraName() == var_326_0 then
			setText(arg_326_0.btnZone:Find("Text"), iter_326_1:GetName())
			setTextColor(arg_326_0.rtZoneList:GetChild(iter_326_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_326_0.rtZoneList:GetChild(iter_326_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_327_0, arg_327_1)
	local var_327_0 = {}
	local var_327_1 = {}
	local var_327_2 = arg_327_1.data

	if var_327_2.op_list then
		for iter_327_0, iter_327_1 in ipairs(var_327_2.op_list) do
			table.insert(var_327_0, function(arg_328_0)
				local function var_328_0()
					local var_329_0 = arg_328_0

					arg_328_0 = nil

					return existCall(var_329_0)
				end

				switch(iter_327_1.type, {
					action = function()
						local var_330_0 = arg_327_0.ladyDict[arg_327_0.apartment:GetConfigID()]

						arg_327_0:PlaySingleAction(var_330_0, iter_327_1.name, var_328_0)
					end,
					item_action = function()
						arg_327_0:PlaySceneItemAnim(iter_327_1.id, iter_327_1.name)
						var_328_0()
					end,
					extra_item_action = function()
						local var_332_0 = arg_327_0.ladyDict[arg_327_0.apartment:GetConfigID()].extraItems[iter_327_1.name]

						warning(iter_327_1.name)
						warning(var_332_0.trans)

						if var_332_0 then
							var_332_0.trans:GetComponent(typeof(Animator)):PlayInFixedTime(iter_327_1.param)
						end

						var_328_0()
					end,
					timeline = function()
						if arg_327_0.inTouchGame then
							setActive(arg_327_0.rtTouchGamePanel, false)
						end

						arg_327_0:PlayTimeline(iter_327_1, function(arg_334_0, arg_334_1)
							setActive(arg_327_0.rtTouchGamePanel, arg_327_0.inTouchGame)

							var_327_1.notifiCallback = arg_334_1

							var_328_0()
						end)
					end,
					clickOption = function()
						arg_327_0:DoTalkTouchOption(iter_327_1, arg_327_1.flags, function(arg_336_0)
							var_327_1.optionIndex = arg_336_0

							var_328_0()
						end)
					end,
					wait = function()
						arg_327_0.LTs = arg_327_0.LTs or {}

						table.insert(arg_327_0.LTs, LeanTween.delayedCall(iter_327_1.time, System.Action(var_328_0)).uniqueId)
					end,
					expression = function()
						arg_327_0:emit(arg_327_0.PLAY_EXPRESSION, iter_327_1)
						var_328_0()
					end
				}, function()
					assert(false, "op type error:", iter_327_1.type)
				end)

				if iter_327_1.skip then
					var_328_0()
				end
			end)
		end
	end

	seriesAsync(var_327_0, function()
		if arg_327_1.callbackData then
			arg_327_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_327_1.callbackData.name, var_327_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_341_0)
	if arg_341_0.inGuide or arg_341_0.uiState ~= "base" then
		return
	end

	if arg_341_0.room:GetConfigID() == 1 and arg_341_0:CheckGuide() then
		-- block empty
	elseif arg_341_0.room:isPersonalRoom() and arg_341_0:CheckLevelUp() then
		-- block empty
	elseif arg_341_0.apartment and arg_341_0:CheckEnterDeal() then
		-- block empty
	elseif arg_341_0.apartment and arg_341_0:CheckActiveTalk() then
		-- block empty
	elseif arg_341_0.apartment then
		arg_341_0:CheckFavorTrigger()
	end

	arg_341_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_342_0)
	local var_342_0

	if arg_342_0.contextData.specialId then
		var_342_0 = arg_342_0.contextData.specialId
		arg_342_0.contextData.specialId = nil

		arg_342_0:DoTalk(var_342_0, function()
			arg_342_0:closeView()
		end)

		if arg_342_0.contextData.isVideoTalk then
			arg_342_0.contextData.hasEnterCheck = true
		end
	elseif not arg_342_0.contextData.hasEnterCheck and arg_342_0.apartment then
		for iter_342_0, iter_342_1 in ipairs(arg_342_0.apartment:getForceEnterTalking(arg_342_0.room:GetConfigID())) do
			var_342_0 = iter_342_1

			arg_342_0:DoTalk(iter_342_1)

			break
		end
	end

	if var_342_0 and pg.dorm3d_dialogue_group[var_342_0].extend_loading > 0 then
		arg_342_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_342_0:FinishEnterResume()
		end)
	else
		if arg_342_0.apartment and arg_342_0.contextData.pendingDic[arg_342_0.apartment:GetConfigID()] then
			arg_342_0.contextData.hasEnterCheck = true
		end

		for iter_342_2, iter_342_3 in pairs(arg_342_0.contextData.pendingDic) do
			arg_342_0:SetInPending(arg_342_0.ladyDict[iter_342_2], iter_342_3)
		end

		arg_342_0.contextData.pendingDic = {}

		arg_342_0:FinishEnterResume()
		arg_342_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_345_0)
	if arg_345_0:GetBlackboardValue(arg_345_0.ladyDict[arg_345_0.apartment:GetConfigID()], "inPending") then
		return
	end

	for iter_345_0, iter_345_1 in ipairs({
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
				return arg_345_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_345_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_345_1.name) and iter_345_1.active() then
			arg_345_0:SetAllBlackbloardValue("inGuide", true)

			local function var_345_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_345_1.name)))
				arg_345_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_345_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_345_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_345_1.name, nil, var_345_0, var_345_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_351_0)
	for iter_351_0, iter_351_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_352_0 = getProxy(CollectionProxy):getShipGroup(arg_351_0.apartment.configId)

				return tobool(var_352_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_353_0 = getProxy(CollectionProxy):getShipGroup(arg_351_0.apartment.configId)

				return var_353_0 and var_353_0.married > 0
			end
		}
	}) do
		if arg_351_0.apartment.triggerCountDic[iter_351_1.triggerId] == 0 and iter_351_1.active() then
			arg_351_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_351_0.apartment.configId, iter_351_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_354_0)
	if arg_354_0.contextData.hasEnterCheck then
		return false
	end

	local var_354_0 = arg_354_0.apartment:GetConfigID()
	local var_354_1 = "dorm3d_enter_count_" .. var_354_0
	local var_354_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_354_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_354_2)
		PlayerPrefs.SetInt(var_354_1, 1)
	else
		PlayerPrefs.SetInt(var_354_1, PlayerPrefs.GetInt(var_354_1, 0) + 1)
	end

	local var_354_3 = arg_354_0.apartment:getEnterTalking(arg_354_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_354_3 > 0 then
		arg_354_0:DoTalk(var_354_3[math.random(#var_354_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_355_0)
	local var_355_0 = arg_355_0.ladyDict[arg_355_0.apartment:GetConfigID()]

	if arg_355_0:GetBlackboardValue(var_355_0, "inPending") then
		return false
	end

	local var_355_1 = arg_355_0.apartment:getZoneTalking(arg_355_0.room:GetConfigID(), var_355_0.ladyBaseZone)

	if #var_355_1 > 0 then
		arg_355_0:DoTalk(var_355_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_356_0, arg_356_1, arg_356_2)
	local var_356_0 = arg_356_0.ladyDict[arg_356_1].ladyBaseZone
	local var_356_1 = getProxy(ApartmentProxy):getApartment(arg_356_1)

	for iter_356_0, iter_356_1 in ipairs(var_356_1:getDistanceTalking(arg_356_0.room:GetConfigID(), var_356_0)) do
		arg_356_0:DoTalk(iter_356_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_357_0, arg_357_1)
	if arg_357_0.room:isPersonalRoom() then
		return switch(arg_357_1, {
			Talk = function()
				local var_358_0 = 1

				return var_358_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_358_0)
			end,
			Touch = function()
				local var_359_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_359_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_359_0)
			end,
			Gift = function()
				local var_360_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_360_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_360_0)
			end,
			PublicGame = function()
				return false
			end,
			Photo = function()
				local var_362_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_362_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_362_0)
			end,
			Collection = function()
				local var_363_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_363_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_363_0)
			end,
			Furniture = function()
				local var_364_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_364_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_364_0)
			end,
			DayNight = function()
				local var_365_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_365_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_365_0)
			end,
			Accompany = function()
				local var_366_0 = 1

				return var_366_0 <= arg_357_0.apartment.level, i18n("apartment_level_unenough", var_366_0)
			end,
			MiniGame = function()
				local var_367_0 = 1

				if var_367_0 > arg_357_0.apartment.level then
					return false, i18n("apartment_level_unenough", var_367_0)
				elseif #arg_357_0.room:getMiniGames() <= 0 then
					return false, "without minigame config in room:" .. arg_357_0.room.configId
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
		return switch(arg_357_1, {
			Gift = function()
				return false
			end,
			PublicGame = function()
				return true
			end,
			Furniture = function()
				local var_373_0 = #arg_357_0.room:GetFurnitures() > 0
				local var_373_1 = #_.filter(arg_357_0.room:GetFurnitureIDList() or {}, function(arg_374_0)
					return Dorm3dFurniture.New({
						configId = arg_374_0
					}):InShopTime()
				end) > 0

				return var_373_0 or var_373_1
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
