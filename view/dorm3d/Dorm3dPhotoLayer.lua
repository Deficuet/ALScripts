local var_0_0 = class("Dorm3dPhotoLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dPhotoUI"
end

local var_0_1 = {
	"/OverlayCamera/Overlay/UIOverlay/TipPanel(Clone)"
}

var_0_0.PANEL = {
	CAMERA = 2,
	LIGHTING = 3,
	ACTION = 1
}

function var_0_0.init(arg_2_0)
	arg_2_0.centerPanel = arg_2_0._tf:Find("Center")
	arg_2_0.normalPanel = arg_2_0._tf:Find("Center/Normal")

	setActive(arg_2_0.normalPanel, true)

	arg_2_0.settingPanel = arg_2_0._tf:Find("Center/Settings")
	arg_2_0.btnAction = arg_2_0.settingPanel:Find("Action")
	arg_2_0.btnCamera = arg_2_0.settingPanel:Find("Camera")
	arg_2_0.btnLighting = arg_2_0.settingPanel:Find("Lighting")
	arg_2_0.panelAction = arg_2_0.settingPanel:Find("ActionSelect")

	setActive(arg_2_0.panelAction, false)
	setActive(arg_2_0.panelAction:Find("Mask"), false)

	arg_2_0.panelCamera = arg_2_0.settingPanel:Find("CameraSettings")

	setActive(arg_2_0.panelCamera, false)

	arg_2_0.panelLightning = arg_2_0.settingPanel:Find("LightningSettings")

	setActive(arg_2_0.panelLightning, false)

	arg_2_0.listZones = arg_2_0._tf:Find("ZoneList")

	setActive(arg_2_0.listZones, false)

	arg_2_0.zoneMask = arg_2_0.listZones:Find("Mask")
	arg_2_0.btnHideUI = arg_2_0._tf:Find("Center/HideUI")
	arg_2_0.btnReset = arg_2_0._tf:Find("Center/Reset")
	arg_2_0.btnFreeze = arg_2_0._tf:Find("Center/Freeze")
	arg_2_0.btnMove = arg_2_0._tf:Find("Center/Move")
	arg_2_0.btnZone = arg_2_0._tf:Find("Center/Zone")
	arg_2_0.btnAr = arg_2_0._tf:Find("Center/Ar")
	arg_2_0.ARchecker = GetComponent(arg_2_0.btnAr.gameObject, "ARChecker")
	arg_2_0.btnAnimSpeed = arg_2_0._tf:Find("Center/AnimSpeed")
	arg_2_0.listAnimSpeed = arg_2_0.btnAnimSpeed:Find("Bar")

	setActive(arg_2_0.listAnimSpeed, false)

	arg_2_0.textAnimSpeed = arg_2_0.btnAnimSpeed:Find("Text")
	arg_2_0.hideuiMask = arg_2_0._tf:Find("RightTop/Mask")

	setActive(arg_2_0.hideuiMask, false)

	arg_2_0.btnFilm = arg_2_0._tf:Find("RightTop/Film/Film")
	arg_2_0.filmTime = arg_2_0._tf:Find("RightTop/FilmTime")

	setActive(arg_2_0.filmTime, false)

	arg_2_0.shareUI = arg_2_0._tf:Find("ShareUI")

	setActive(arg_2_0.shareUI, false)

	arg_2_0.ysScreenShoter = arg_2_0._tf:Find("Shoter"):GetComponent(typeof(YSTool.YSScreenShoter))
	arg_2_0.btnMenuSmall = arg_2_0._tf:Find("Center/MenuSmall")
	arg_2_0.btnMenu = arg_2_0._tf:Find("Center/Menu")

	local var_2_0 = arg_2_0.panelAction:Find("Layout/Regular/Index")

	setActive(var_2_0, false)
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/Title/Text"), i18n("dorm3d_photo_len"))
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/Switch/Title"), i18n("dorm3d_photo_depthoffield"))
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/FocusDistance/Title"), i18n("dorm3d_photo_focusdistance"))
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/BlurRadius/Title"), i18n("dorm3d_photo_focusstrength"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/Title/Text"), i18n("dorm3d_photo_paramaters"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/PostExposure/PostExposure/Title"), i18n("dorm3d_photo_postexposure"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/Saturation/Saturation/Title"), i18n("dorm3d_photo_saturation"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/Contrast/Contrast/Title"), i18n("dorm3d_photo_contrast"))
	setText(arg_2_0.panelCamera:Find("Layout/Other/Title/Text"), i18n("dorm3d_photo_Others"))
	setText(arg_2_0.panelCamera:Find("Layout/Other/HideCharacter/Title"), i18n("dorm3d_photo_hidecharacter"))
	setText(arg_2_0.panelCamera:Find("Layout/Other/FaceCamera/Title"), i18n("dorm3d_photo_facecamera"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Name"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Selected"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Name"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Selected"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Name"), i18n("dorm3d_photo_special_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Selected"), i18n("dorm3d_photo_special_anim"))

	arg_2_0.mainCamera = GameObject.Find("BackYardMainCamera"):GetComponent(typeof(Camera))
	arg_2_0.stopRecBtn = arg_2_0:findTF("stopRec")
	arg_2_0.videoTipPanel = arg_2_0:findTF("videoTipPanel")

	setActive(arg_2_0.videoTipPanel, false)

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.SetSceneRoot(arg_3_0, arg_3_1)
	arg_3_0.scene = arg_3_1
end

function var_0_0.SetRoom(arg_4_0, arg_4_1)
	arg_4_0.room = arg_4_1
end

function var_0_0.SetGroupId(arg_5_0, arg_5_1)
	arg_5_0.groupId = arg_5_1
end

function var_0_0.onBackPressed(arg_6_0)
	if arg_6_0.recordState then
		triggerButton(arg_6_0.btnFilm)

		return
	end

	if arg_6_0.activeSetting then
		triggerButton(arg_6_0._tf:Find("Center/Settings/Back"))

		return
	end

	arg_6_0:closeView()
end

function var_0_0.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0._tf:Find("Center/Normal/Back"), function()
		arg_7_0:onBackPressed()
	end, SFX_CANCEL)

	local var_7_0 = arg_7_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_7_0, 0, 1, 0)
	onSlider(arg_7_0, var_7_0, function(arg_9_0)
		arg_7_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetPhotoCameraHeight", arg_9_0)
	end)
	setActive(var_7_0, false)

	local var_7_1 = arg_7_0._tf:Find("Center/Stick")

	setActive(var_7_1, false)

	arg_7_0.activeSetting = false

	onButton(arg_7_0, arg_7_0._tf:Find("Center/Normal/Settings"), function()
		arg_7_0.activeSetting = true

		quickPlayAnimation(arg_7_0._tf:Find("Center"), "anim_dorm3d_photo_normal_out")
		arg_7_0:UpdateActionPanel()
		arg_7_0:UpdateCameraPanel()
		arg_7_0:UpdateLightingPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("Center/Settings/Back"), function()
		arg_7_0.activeSetting = false

		quickPlayAnimation(arg_7_0._tf:Find("Center"), "anim_dorm3d_photo_normal_in")
	end, SFX_CANCEL)

	arg_7_0.hideUI = false

	onButton(arg_7_0, arg_7_0.btnHideUI, function()
		if arg_7_0.hideUI then
			return
		end

		setActive(arg_7_0.hideuiMask, true)
		setActive(arg_7_0.centerPanel, false)

		arg_7_0.hideUI = true
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.hideuiMask, function()
		if not arg_7_0.hideUI then
			return
		end

		setActive(arg_7_0.centerPanel, true)
		setActive(arg_7_0.hideuiMask, false)

		arg_7_0.hideUI = false
	end)
	onButton(arg_7_0, arg_7_0.btnReset, function()
		arg_7_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetPhotoCameraPosition")
	end, SFX_PANEL)

	arg_7_0.recordState = false

	onButton(arg_7_0, arg_7_0.btnFilm, function()
		local function var_15_0(arg_16_0)
			setActive(arg_7_0.centerPanel, arg_16_0)

			arg_7_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_16_0 and 1 or 0
		end

		if not arg_7_0.recordState then
			local function var_15_1(arg_17_0)
				if not arg_17_0 then
					var_15_0(true)

					arg_7_0.recordState = false

					LeanTween.moveX(arg_7_0.stopRecBtn, arg_7_0.stopRecBtn.rect.width, 0.15)
				else
					arg_7_0.recordState = true
				end
			end

			local function var_15_2()
				setActive(arg_7_0.stopRecBtn, true)
				LeanTween.moveX(arg_7_0.stopRecBtn, 0, 0.15):setOnComplete(System.Action(function()
					var_0_0.SetMute(true)

					arg_7_0.recordFilePath = YSNormalTool.RecordTool.GenRecordFilePath()

					YSNormalTool.RecordTool.StartRecording(var_15_1, arg_7_0.recordFilePath)
				end))
			end

			seriesAsync({
				function(arg_20_0)
					PermissionHelper.Request3DDorm(arg_20_0, nil)
				end,
				function(arg_21_0)
					var_15_0(false)

					local var_21_0 = PlayerPrefs.GetInt("hadShowForVideoTipDorm", 0)

					if not var_21_0 or var_21_0 <= 0 then
						PlayerPrefs.SetInt("hadShowForVideoTipDorm", 1)

						arg_7_0:findTF("Text", arg_7_0.videoTipPanel):GetComponent("Text").text = i18n("word_take_video_tip")

						onButton(arg_7_0, arg_7_0.videoTipPanel, function()
							setActive(arg_7_0.videoTipPanel, false)
							var_15_2()
						end)
						setActive(arg_7_0.videoTipPanel, true)
					else
						var_15_2()
					end
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.stopRecBtn, function()
		arg_7_0.recordState = false

		local function var_23_0(arg_24_0)
			if arg_24_0 and PLATFORM == PLATFORM_ANDROID then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("word_save_video"),
					onNo = function()
						if System.IO.File.Exists(arg_7_0.recordFilePath) then
							System.IO.File.Delete(arg_7_0.recordFilePath)
						end
					end,
					onYes = function()
						YSNormalTool.MediaTool.SaveVideoToAlbum(arg_7_0.recordFilePath, function(arg_27_0, arg_27_1)
							if arg_27_0 then
								pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))

								if System.IO.File.Exists(arg_7_0.recordFilePath) then
									System.IO.File.Delete(arg_7_0.recordFilePath)
								end
							end
						end)
					end
				})
			end

			arg_7_0.recordState = false
		end

		local function var_23_1(arg_28_0)
			setActive(arg_7_0.centerPanel, arg_28_0)

			arg_7_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_28_0 and 1 or 0
		end

		if not LeanTween.isTweening(go(arg_7_0.stopRecBtn)) then
			LeanTween.moveX(arg_7_0.stopRecBtn, arg_7_0.stopRecBtn.rect.width, 0.15):setOnComplete(System.Action(function()
				setActive(arg_7_0.stopRecBtn, false)
				seriesAsync({
					function(arg_30_0)
						YSNormalTool.RecordTool.StopRecording(var_23_0)
						var_23_1(true)
						var_0_0.SetMute(false)

						local var_30_0 = arg_7_0.room:GetCameraZones()[arg_7_0.zoneIndex]
						local var_30_1 = Dorm3dCameraAnim.New({
							configId = arg_7_0.animID
						})

						pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_7_0.scene.apartment:GetConfigID(), 2, arg_7_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_30_0:GetName(), var_30_1:GetStateName(), arg_7_0.cameraSettings.depthOfField.focusDistance.value, arg_7_0.cameraSettings.depthOfField.blurRadius.value, arg_7_0.cameraSettings.postExposure.value, arg_7_0.cameraSettings.contrast.value, arg_7_0.cameraSettings.saturate.value)))
					end
				})
			end))
		end
	end)
	setActive(arg_7_0.stopRecBtn, false)
	onButton(arg_7_0, arg_7_0._tf:Find("RightTop/Film/Switch"), function()
		GetOrAddComponent(arg_7_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = false

		quickPlayAnimation(arg_7_0._tf:Find("RightTop"), "anim_dorm3d_photo_FtoS")
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("RightTop/Shot/Shot"), function()
		local function var_32_0(arg_33_0)
			setActive(arg_7_0.centerPanel, arg_33_0)
			setActive(arg_7_0._tf:Find("RightTop"), arg_33_0)

			if PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0 then
				setActive(pg.UIMgr.GetInstance().OverlayEffect, arg_33_0)
			end
		end

		local function var_32_1(arg_34_0)
			warning("截图结果：" .. tostring(arg_34_0))
		end

		local function var_32_2(arg_35_0, arg_35_1)
			arg_7_0:emit(Dorm3dPhotoMediator.SHARE_PANEL, arg_35_1, arg_35_0)
			getProxy(Dorm3dChatProxy):TriggerEvent({
				{
					value = 1,
					event_type = 160,
					ship_id = arg_7_0.scene.apartment:GetConfigID()
				}
			})

			local var_35_0 = arg_7_0.room:GetCameraZones()[arg_7_0.zoneIndex]
			local var_35_1 = Dorm3dCameraAnim.New({
				configId = arg_7_0.animID
			})

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_7_0.scene.apartment:GetConfigID(), 1, arg_7_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_35_0:GetName(), var_35_1:GetStateName(), arg_7_0.cameraSettings.depthOfField.focusDistance.value, arg_7_0.cameraSettings.depthOfField.blurRadius.value, arg_7_0.cameraSettings.postExposure.value, arg_7_0.cameraSettings.contrast.value, arg_7_0.cameraSettings.saturate.value)))
		end

		local function var_32_3(arg_36_0)
			var_32_1(true)

			local var_36_0 = Tex2DExtension.EncodeToJPG(arg_36_0)

			var_32_2(var_36_0, arg_36_0)
		end

		tolua.loadassembly("Yongshi.BLHotUpdate.Runtime.Rendering")
		ReflectionHelp.RefCallStaticMethodEx(typeof("BLHX.Rendering.HotUpdate.ScreenShooterPass"), "TakePhoto", {
			typeof(Camera),
			typeof("UnityEngine.Events.UnityAction`1[UnityEngine.Object]")
		}, {
			arg_7_0.mainCamera,
			UnityEngine.Events.UnityAction_UnityEngine_Object(var_32_3)
		})
	end, "ui-dorm_photograph")

	GetOrAddComponent(arg_7_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = false

	onButton(arg_7_0, arg_7_0._tf:Find("RightTop/Shot/Switch"), function()
		GetOrAddComponent(arg_7_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = true

		quickPlayAnimation(arg_7_0._tf:Find("RightTop"), "anim_dorm3d_photo_StoF")
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnAnimSpeed, function()
		setActive(arg_7_0.listAnimSpeed, not isActive(arg_7_0.listAnimSpeed))
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnZone, function()
		local var_39_0 = isActive(arg_7_0.listZones)

		setActive(arg_7_0.listZones, not var_39_0)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.zoneMask, function()
		setActive(arg_7_0.listZones, false)
	end)
	onButton(arg_7_0, arg_7_0.btnAr, function()
		arg_7_0.ARchecker:StartCheck(function(arg_42_0)
			if PLATFORM == PLATFORM_WINDOWSEDITOR then
				arg_42_0 = -1
			end

			originalPrint("AR CODE: " .. arg_42_0)
			arg_7_0:emit(Dorm3dPhotoMediator.GO_AR, arg_42_0)
		end)
	end)
	onButton(arg_7_0, arg_7_0.btnMove, function()
		arg_7_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchPhotoCamera")

		arg_7_0.freeMode = not arg_7_0.freeMode

		setActive(var_7_0, arg_7_0.freeMode)
		setActive(var_7_1, arg_7_0.freeMode)
		setActive(arg_7_0.btnMove:Find("Selected"), arg_7_0.freeMode)
	end)
	onButton(arg_7_0, arg_7_0.btnMenuSmall, function()
		setActive(arg_7_0.btnMenuSmall, false)
		setActive(arg_7_0.btnMenu, true)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnMenu:Find("Collapse"), function()
		setActive(arg_7_0.btnMenu, false)
		setActive(arg_7_0.btnMenuSmall, true)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnMenu, function()
		arg_7_0:emit(Dorm3dPhotoMediator.OPEN_SKIN_SELECT_LAYER, arg_7_0.groupId, arg_7_0.scene.ladyDict[arg_7_0.groupId], function(arg_47_0, arg_47_1, arg_47_2)
			arg_7_0:OnSwitchSkin(arg_47_0, arg_47_1, arg_47_2)
		end, not arg_7_0.scene.room:isPersonalRoom())
	end, SFX_PANEL)

	arg_7_0.activePanel = 1

	local var_7_2 = {
		{
			btn = arg_7_0.btnAction,
			On = function()
				arg_7_0:UpdateActionPanel()
			end,
			Off = function()
				return
			end
		},
		{
			btn = arg_7_0.btnCamera,
			On = function()
				arg_7_0:UpdateCameraPanel()
			end,
			Off = function()
				return
			end
		},
		{
			btn = arg_7_0.btnLighting,
			On = function()
				arg_7_0:UpdateLightingPanel()
			end,
			Off = function()
				return
			end
		}
	}

	table.Ipairs(var_7_2, function(arg_54_0, arg_54_1)
		onToggle(arg_7_0, arg_54_1.btn, function(arg_55_0)
			if not arg_55_0 then
				return
			end

			table.Ipairs(var_7_2, function(arg_56_0, arg_56_1)
				if arg_56_0 == arg_54_0 then
					return
				end

				arg_56_1.Off()
			end)

			arg_7_0.activePanel = arg_54_0

			arg_54_1.On()
		end, SFX_PANEL)
	end)
	;(function()
		local var_57_0 = {
			arg_7_0.panelAction:Find("Layout/Title/Regular"),
			arg_7_0.panelAction:Find("Layout/Title/Special")
		}

		triggerToggle(var_57_0[1], true)
	end)()
	;(function()
		local var_58_0 = {
			arg_7_0.panelLightning:Find("Layout/Title/Filter")
		}

		triggerToggle(var_58_0[1], true)
	end)()

	arg_7_0.zoneIndex = 1

	arg_7_0:InitData()
	arg_7_0:FirstEnterZone()
	triggerToggle(var_7_2[arg_7_0.activePanel].btn, true)
	arg_7_0:UpdateZoneList()
end

function var_0_0.InitData(arg_59_0)
	arg_59_0.cameraSettings = Clone(arg_59_0.scene:GetCameraSettings())
	arg_59_0.settingHideCharacter = false
	arg_59_0.settingFaceCamera = true
	arg_59_0.settingFilterIndex = nil
	arg_59_0.settingFilterStrength = 1

	arg_59_0:RefreshData()
end

function var_0_0.RefreshData(arg_60_0)
	local var_60_0 = arg_60_0.room:GetCameraZones()[arg_60_0.zoneIndex]

	arg_60_0.animID = var_60_0:GetRegularAnimsByShipId(arg_60_0.groupId)[1]:GetConfigID()

	local function var_60_1(arg_61_0, arg_61_1)
		arg_61_0.min = arg_61_1[1]
		arg_61_0.max = arg_61_1[2]
		arg_61_0.value = math.clamp(arg_61_0.value, arg_61_1[1], arg_61_1[2])
	end

	var_60_1(arg_60_0.cameraSettings.depthOfField.focusDistance, var_60_0:GetFocusDistanceRange())
	var_60_1(arg_60_0.cameraSettings.depthOfField.blurRadius, var_60_0:GetDepthOfFieldBlurRange())
	var_60_1(arg_60_0.cameraSettings.postExposure, var_60_0:GetExposureRange())
	var_60_1(arg_60_0.cameraSettings.contrast, var_60_0:GetContrastRange())
	var_60_1(arg_60_0.cameraSettings.saturate, var_60_0:GetSaturationRange())

	arg_60_0.animSpeeds = var_60_0:GetAnimSpeeds()
	arg_60_0.animSpeed = 1
end

function var_0_0.FirstEnterZone(arg_62_0)
	local var_62_0 = arg_62_0.room:GetCameraZones()[arg_62_0.zoneIndex]
	local var_62_1 = Dorm3dCameraAnim.New({
		configId = arg_62_0.animID
	})

	arg_62_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnterPhotoMode", var_62_0, var_62_1:GetStateName())
	arg_62_0:UpdateAnimSpeedPanel()
end

function var_0_0.SwitchZone(arg_63_0)
	local var_63_0 = arg_63_0.room:GetCameraZones()[arg_63_0.zoneIndex]
	local var_63_1 = Dorm3dCameraAnim.New({
		configId = arg_63_0.animID
	})

	arg_63_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchCameraZone", var_63_0, var_63_1:GetStateName())

	if arg_63_0.timerAnim then
		arg_63_0.timerAnim:Stop()

		arg_63_0.timerAnim = nil
	end

	arg_63_0.animPlaying = nil

	arg_63_0:UpdateActionPanel()
	arg_63_0:UpdateCameraPanel()
	arg_63_0:UpdateLightingPanel()
	arg_63_0:UpdateAnimSpeedPanel()
	arg_63_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", arg_63_0.animSpeed)
end

function var_0_0.UpdateZoneList(arg_64_0)
	local var_64_0 = arg_64_0.room:GetCameraZones()

	local function var_64_1()
		setText(arg_64_0.btnZone:Find("Text"), var_64_0[arg_64_0.zoneIndex]:GetName())
		UIItemList.StaticAlign(arg_64_0.listZones:Find("List"), arg_64_0.listZones:Find("List"):GetChild(0), #var_64_0, function(arg_66_0, arg_66_1, arg_66_2)
			if arg_66_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_66_1 = arg_66_1 + 1

			local var_66_0 = var_64_0[arg_66_1]

			setText(arg_66_2:Find("Name"), var_66_0:GetName())

			local var_66_1 = arg_64_0.zoneIndex == arg_66_1 and Color.NewHex("5CCAFF") or Color.NewHex("FFFFFF99")

			setTextColor(arg_66_2:Find("Name"), var_66_1)
			setActive(arg_66_2:Find("Line"), arg_66_1 < #var_64_0)
		end)
	end

	var_64_1()
	UIItemList.StaticAlign(arg_64_0.listZones:Find("List"), arg_64_0.listZones:Find("List"):GetChild(0), #var_64_0, function(arg_67_0, arg_67_1, arg_67_2)
		if arg_67_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_67_1 = arg_67_1 + 1

		onButton(arg_64_0, arg_67_2, function()
			if arg_64_0.zoneIndex == arg_67_1 then
				return
			end

			arg_64_0.zoneIndex = arg_67_1

			arg_64_0:RefreshData()
			arg_64_0:SwitchZone()
			setActive(arg_64_0.listZones, false)
			var_64_1()
		end, SFX_PANEL)
	end)
end

local var_0_2 = 0.2

function var_0_0.UpdateActionPanel(arg_69_0)
	if not arg_69_0.activeSetting then
		return
	end

	if arg_69_0.activePanel ~= var_0_0.PANEL.ACTION then
		return
	end

	local var_69_0 = arg_69_0.room:GetCameraZones()[arg_69_0.zoneIndex]
	local var_69_1 = var_69_0:GetRegularAnimsByShipId(arg_69_0.groupId)
	local var_69_2 = arg_69_0.panelAction:Find("Layout/Regular/Scroll/Viewport/Content")
	local var_69_3 = var_69_0:GetAllSpecialList(arg_69_0.room.id)
	local var_69_4 = arg_69_0.panelAction:Find("Layout/Special/Scroll/Viewport/Content")
	local var_69_5 = #var_69_3 > 0

	setActive(arg_69_0.panelAction:Find("Layout/Title/Special"), var_69_5)

	local function var_69_6()
		UIItemList.StaticAlign(var_69_2, var_69_2:GetChild(0), #var_69_1, function(arg_71_0, arg_71_1, arg_71_2)
			if arg_71_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_71_1 = arg_71_1 + 1

			local var_71_0 = var_69_1[arg_71_1]

			setActive(arg_71_2:Find("Selected"), var_71_0:GetConfigID() == arg_69_0.animID)
			setActive(arg_71_2:Find("Slider"), var_71_0:GetConfigID() == arg_69_0.animID and tobool(arg_69_0.timerAnim))
		end)
		UIItemList.StaticAlign(var_69_4, var_69_4:GetChild(0), #var_69_3, function(arg_72_0, arg_72_1, arg_72_2)
			if arg_72_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_72_1 = arg_72_1 + 1

			local var_72_0 = var_69_3[arg_72_1].anims
			local var_72_1 = arg_72_2:Find("Actions")

			UIItemList.StaticAlign(var_72_1, var_72_1:GetChild(0), #var_72_0, function(arg_73_0, arg_73_1, arg_73_2)
				if arg_73_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_73_1 = arg_73_1 + 1

				local var_73_0 = var_72_0[arg_73_1]

				setActive(arg_73_2:Find("Selected"), var_73_0:GetConfigID() == arg_69_0.animID)
				setActive(arg_73_2:Find("Slider"), var_73_0:GetConfigID() == arg_69_0.animID and tobool(arg_69_0.timerAnim))
			end)
		end)
	end

	local function var_69_7(arg_74_0, arg_74_1)
		if arg_69_0.animPlaying then
			return
		end

		local var_74_0 = arg_74_0:GetConfigID()

		if arg_69_0.animID == var_74_0 then
			return
		end

		local var_74_1 = arg_69_0:GetAnimPlayList(var_74_0)
		local var_74_2 = Dorm3dCameraAnim.New({
			configId = arg_69_0.animID
		}):GetFinishAnimID()

		arg_69_0.animID = var_74_0

		var_69_6()
		arg_69_0:BlockActionPanel(true)

		arg_69_0.animPlaying = true

		local var_74_3 = (table.indexof(var_74_1, _.detect(var_74_1, function(arg_75_0)
			return arg_75_0:GetConfigID() == var_74_2
		end)) or 0) + 1
		local var_74_4 = _.rest(var_74_1, var_74_3)
		local var_74_5 = arg_74_1:Find("Slider"):GetComponent(typeof(Slider))

		setActive(arg_74_1:Find("Slider"), true)

		local function var_74_6()
			setActive(arg_74_1:Find("Selected"), true)
			setActive(arg_74_1:Find("Slider"), false)
			arg_69_0:BlockActionPanel(false)

			arg_69_0.animPlaying = nil
		end

		if #var_74_4 == 0 then
			var_74_6()

			return
		end

		local var_74_7 = _.reduce(var_74_4, 0, function(arg_77_0, arg_77_1)
			return arg_77_0 + math.max(var_0_2, arg_77_1:GetAnimTime())
		end)

		if arg_69_0.timerAnim then
			arg_69_0.timerAnim:Stop()
		end

		arg_69_0.animInfo = {
			index = 1,
			passedTime = 0,
			ratio = 0,
			animPlayList = var_74_4,
			totalTime = var_74_7,
			startStamp = Time.time
		}
		arg_69_0.timerAnim = FrameTimer.New(function()
			local var_78_0 = arg_69_0.animInfo
			local var_78_1 = var_78_0.animPlayList[var_78_0.index]
			local var_78_2 = math.max(var_0_2, var_78_1:GetAnimTime())
			local var_78_3 = var_78_0.startStamp
			local var_78_4 = Time.time
			local var_78_5 = math.min(1, var_78_0.ratio + (var_78_4 - var_78_3) * arg_69_0.animSpeed / var_78_2)
			local var_78_6 = var_78_0.passedTime + var_78_2 * var_78_5

			var_74_5.value = var_78_6 / var_74_7

			if var_78_5 < 1 then
				return
			end

			var_78_0.index = var_78_0.index + 1
			var_78_0.ratio = 0
			var_78_0.passedTime = var_78_0.passedTime + var_78_2
			var_78_0.startStamp = var_78_4

			local var_78_7 = var_78_1:GetStartPoint()

			if #var_78_7 > 0 then
				arg_69_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCurrentCharPoint", var_78_7)
			end

			if var_78_0.index > #var_78_0.animPlayList then
				var_74_6()
				arg_69_0.timerAnim:Stop()

				arg_69_0.timerAnim = nil
				arg_69_0.animInfo = nil

				return
			end

			local var_78_8 = var_78_0.animPlayList[var_78_0.index]

			arg_69_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlayCurrentSingleAction", var_78_8:GetStateName())
		end, 1, -1)

		local var_74_8 = arg_69_0.animInfo.animPlayList[1]

		if var_74_3 == 1 then
			arg_69_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchCurrentAnim", var_74_8:GetStateName())
			onNextTick(function()
				local var_79_0 = var_74_8:GetStartPoint()

				if #var_79_0 == 0 then
					var_79_0 = var_69_0:GetWatchCameraName()
				end

				arg_69_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCurrentCharPoint", var_79_0)
				arg_69_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

				if arg_69_0.freeMode then
					local var_79_1 = arg_69_0.scene.cameras[arg_69_0.scene.CAMERA.PHOTO_FREE]
					local var_79_2 = var_79_1:GetComponent(typeof(UnityEngine.CharacterController))
					local var_79_3 = var_79_1.transform.forward

					var_79_3.y = 0

					var_79_3:Normalize()

					local var_79_4 = var_79_3 * -0.01

					var_79_2:Move(var_79_4)
					var_79_2:Move(-var_79_4)
				end
			end)
		else
			arg_69_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlayCurrentSingleAction", var_74_8:GetStateName())
		end

		arg_69_0.timerAnim:Start()
	end

	UIItemList.StaticAlign(var_69_2, var_69_2:GetChild(0), #var_69_1, function(arg_80_0, arg_80_1, arg_80_2)
		if arg_80_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_80_1 = arg_80_1 + 1

		local var_80_0 = var_69_1[arg_80_1]

		setText(arg_80_2:Find("Name"), var_80_0:GetName())
		GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_80_0:GetZoneIcon()), "", arg_80_2:Find("Icon"))
		setActive(arg_80_2:Find("Slider"), false)
		setActive(arg_80_2:Find("Selected"), false)
		onButton(arg_69_0, arg_80_2, function()
			var_69_7(var_80_0, arg_80_2)
		end)
	end)

	local function var_69_8()
		UIItemList.StaticAlign(var_69_4, var_69_4:GetChild(0), #var_69_3, function(arg_83_0, arg_83_1, arg_83_2)
			if arg_83_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_83_1 = arg_83_1 + 1

			local var_83_0 = var_69_3[arg_83_1].anims
			local var_83_1 = arg_83_2:Find("Actions")

			UIItemList.StaticAlign(var_83_1, var_83_1:GetChild(0), #var_83_0, function(arg_84_0, arg_84_1, arg_84_2)
				if arg_84_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_84_1 = arg_84_1 + 1

				local var_84_0 = var_83_0[arg_84_1]

				setActive(arg_84_2:Find("Selected"), var_84_0:GetConfigID() == arg_69_0.animID)
				setActive(arg_84_2:Find("Slider"), var_84_0:GetConfigID() == arg_69_0.animID and tobool(arg_69_0.timerAnim))
			end)
		end)
	end

	local function var_69_9()
		UIItemList.StaticAlign(var_69_4, var_69_4:GetChild(0), #var_69_3, function(arg_86_0, arg_86_1, arg_86_2)
			if arg_86_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_86_1 = arg_86_1 + 1

			setActive(arg_86_2:Find("Button/Active"), arg_69_0.settingSpecialFurnitureIndex == arg_86_1)
			setActive(arg_86_2:Find("Actions"), arg_69_0.settingSpecialFurnitureIndex == arg_86_1)
		end)
		var_69_8()
	end

	local function var_69_10(arg_87_0, arg_87_1)
		local var_87_0 = arg_87_1:Find("Actions")
		local var_87_1 = arg_87_0.anims

		UIItemList.StaticAlign(var_87_0, var_87_0:GetChild(0), #var_87_1, function(arg_88_0, arg_88_1, arg_88_2)
			if arg_88_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_88_1 = arg_88_1 + 1

			local var_88_0 = var_87_1[arg_88_1]
			local var_88_1 = var_69_0:CheckFurnitureIdInZone(arg_87_0.furnitureId)
			local var_88_2 = arg_69_0.room:IsFurnitureSetIn(arg_87_0.furnitureId)
			local var_88_3 = var_88_1 and var_88_2

			SetActive(arg_88_2:Find("Other"), not var_88_3)
			SetActive(arg_88_2:Find("Name"), var_88_3)

			if var_88_3 then
				onButton(arg_69_0, arg_88_2, function()
					arg_69_0.room:ReplaceFurniture(arg_87_0.slotId, arg_87_0.furnitureId)
					arg_69_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RefreshSlots", arg_69_0.room)
					var_69_7(var_88_0, arg_88_2)
				end)
				setText(arg_88_2:Find("Name"), var_88_0:GetName())
			else
				removeOnButton(arg_88_2)

				if not var_88_1 then
					local var_88_4 = var_88_0:GetZoneName()

					warnText = i18n("dorm3d_photo_active_zone", var_88_4)
				else
					warnText = i18n("dorm3d_furniture_replace_tip")
				end

				setText(arg_88_2:Find("Other/Content"), warnText)
			end

			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_88_0:GetZoneIcon()), "", arg_88_2:Find("Icon"))
			setActive(arg_88_2:Find("Slider"), false)
			setActive(arg_88_2:Find("Selected"), false)
		end)
	end

	setActive(var_69_4, #var_69_3 > 0)
	UIItemList.StaticAlign(var_69_4, var_69_4:GetChild(0), #var_69_3, function(arg_90_0, arg_90_1, arg_90_2)
		if arg_90_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_90_1 = arg_90_1 + 1

		local var_90_0 = var_69_3[arg_90_1]
		local var_90_1 = Dorm3dFurniture.New({
			configId = var_90_0.furnitureId
		})
		local var_90_2 = tobool(_.detect(arg_69_0.room:GetFurnitures(), function(arg_91_0)
			return arg_91_0:GetConfigID() == var_90_0.furnitureId
		end))

		setText(arg_90_2:Find("Button/Name"), var_90_1:GetName())
		GetImageSpriteFromAtlasAsync(var_90_1:GetIcon(), "", arg_90_2:Find("Button/Icon"))
		setActive(arg_90_2:Find("Button/Lock"), not var_90_2)
		setActive(arg_90_2:Find("Button/BG"), var_90_2)

		local var_90_3 = var_69_0:CheckFurnitureIdInZone(var_90_0.furnitureId)
		local var_90_4

		if var_90_3 then
			var_90_4 = Color.New(1, 1, 1, 0.8509803921568627)
		else
			var_90_4 = Color.New(0.788235294117647, 0.788235294117647, 0.788235294117647, 0.8509803921568627)
		end

		setImageColor(arg_90_2:Find("Button/BG"), var_90_4)
		onButton(arg_69_0, arg_90_2:Find("Button"), function()
			if not var_90_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_furniture_locked"))

				return
			end

			if arg_69_0.settingSpecialFurnitureIndex == arg_90_1 then
				arg_69_0.settingSpecialFurnitureIndex = nil
			else
				arg_69_0.settingSpecialFurnitureIndex = arg_90_1
			end

			var_69_9()
		end)
		var_69_10(var_90_0, arg_90_2)
	end)
	var_69_9()
	var_69_6()
end

function var_0_0.BlockActionPanel(arg_93_0, arg_93_1)
	return
end

function var_0_0.GetAnimPlayList(arg_94_0, arg_94_1)
	local var_94_0 = arg_94_1
	local var_94_1 = {}
	local var_94_2 = 100

	while true do
		local var_94_3 = Dorm3dCameraAnim.New({
			configId = var_94_0
		})

		if not var_94_3 then
			return var_94_1
		end

		table.insert(var_94_1, 1, var_94_3)

		var_94_0 = var_94_3:GetPreAnimID()

		if var_94_0 == 0 then
			return var_94_1
		end

		var_94_2 = var_94_2 - 1

		assert(var_94_2 > 0)
	end
end

function var_0_0.UpdateCameraPanel(arg_95_0)
	if not arg_95_0.activeSetting then
		return
	end

	if arg_95_0.activePanel ~= var_0_0.PANEL.CAMERA then
		return
	end

	;(function()
		local var_96_0 = arg_95_0.panelCamera:Find("Layout/DepthOfField/Switch/Toggle")

		triggerToggle(var_96_0, arg_95_0.cameraSettings.depthOfField.enabled)
		onToggle(arg_95_0, var_96_0, function(arg_97_0)
			arg_95_0.cameraSettings.depthOfField.enabled = arg_97_0

			setActive(arg_95_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_95_0.cameraSettings.depthOfField.enabled)
			arg_95_0:RefreshCamera()
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	setActive(arg_95_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_95_0.cameraSettings.depthOfField.enabled)
	;(function()
		local var_98_0 = arg_95_0.cameraSettings.depthOfField.focusDistance
		local var_98_1 = arg_95_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/FocusDistance/Slider")

		setSlider(var_98_1, var_98_0.min, var_98_0.max, var_98_0.value)
		onSlider(arg_95_0, var_98_1, function(arg_99_0)
			var_98_0.value = arg_99_0

			arg_95_0:RefreshCamera()
		end)
	end)()
	;(function()
		local var_100_0 = arg_95_0.cameraSettings.depthOfField.blurRadius
		local var_100_1 = arg_95_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/BlurRadius/Slider")

		setSlider(var_100_1, var_100_0.min, var_100_0.max, var_100_0.value)
		onSlider(arg_95_0, var_100_1, function(arg_101_0)
			var_100_0.value = arg_101_0

			arg_95_0:RefreshCamera()
		end)
	end)()

	local var_95_0 = {
		"PostExposure",
		"Saturation",
		"Contrast"
	}

	arg_95_0.paramIndex = arg_95_0.paramIndex or 1

	local function var_95_1()
		table.Ipairs(var_95_0, function(arg_103_0, arg_103_1)
			local var_103_0 = arg_95_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_103_0 - 1)

			setActive(var_103_0:Find("Selected"), arg_103_0 == arg_95_0.paramIndex)
			setActive(arg_95_0.panelCamera:Find("Layout/Paramaters/" .. arg_103_1), arg_103_0 == arg_95_0.paramIndex)
		end)
	end

	table.Ipairs(var_95_0, function(arg_104_0, arg_104_1)
		local var_104_0 = arg_95_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_104_0 - 1)

		onButton(arg_95_0, var_104_0, function()
			arg_95_0.paramIndex = arg_104_0

			var_95_1()
		end, SFX_PANEL)
	end)
	var_95_1()
	;(function()
		local var_106_0 = arg_95_0.cameraSettings.postExposure
		local var_106_1 = arg_95_0.panelCamera:Find("Layout/Paramaters/PostExposure/PostExposure/Slider")
		local var_106_2 = var_106_1:Find("Background/Fill")

		onSlider(arg_95_0, var_106_1, function(arg_107_0)
			var_106_0.value = arg_107_0

			local var_107_0 = (arg_107_0 - var_106_0.min) / (var_106_0.max - var_106_0.min)
			local var_107_1 = math.min(var_107_0, 0.5)
			local var_107_2 = math.max(var_107_0, 0.5)

			var_106_2.anchorMin = Vector2.New(var_107_1, 0)
			var_106_2.anchorMax = Vector2.New(var_107_2, 1)
			var_106_2.offsetMin = Vector2.zero
			var_106_2.offsetMax = Vector2.zero

			arg_95_0:RefreshCamera()
		end)
		setSlider(var_106_1, var_106_0.min, var_106_0.max, var_106_0.value)
	end)()
	;(function()
		local var_108_0 = arg_95_0.cameraSettings.contrast
		local var_108_1 = arg_95_0.panelCamera:Find("Layout/Paramaters/Contrast/Contrast/Slider")
		local var_108_2 = var_108_1:Find("Background/Fill")

		onSlider(arg_95_0, var_108_1, function(arg_109_0)
			var_108_0.value = arg_109_0

			local var_109_0 = (arg_109_0 - var_108_0.min) / (var_108_0.max - var_108_0.min)
			local var_109_1 = math.min(var_109_0, 0.5)
			local var_109_2 = math.max(var_109_0, 0.5)

			var_108_2.anchorMin = Vector2.New(var_109_1, 0)
			var_108_2.anchorMax = Vector2.New(var_109_2, 1)
			var_108_2.offsetMin = Vector2.zero
			var_108_2.offsetMax = Vector2.zero

			arg_95_0:RefreshCamera()
		end)
		setSlider(var_108_1, var_108_0.min, var_108_0.max, var_108_0.value)
	end)()
	;(function()
		local var_110_0 = arg_95_0.cameraSettings.saturate
		local var_110_1 = arg_95_0.panelCamera:Find("Layout/Paramaters/Saturation/Saturation/Slider")
		local var_110_2 = var_110_1:Find("Background/Fill")

		onSlider(arg_95_0, var_110_1, function(arg_111_0)
			var_110_0.value = arg_111_0

			local var_111_0 = (arg_111_0 - var_110_0.min) / (var_110_0.max - var_110_0.min)
			local var_111_1 = math.min(var_111_0, 0.5)
			local var_111_2 = math.max(var_111_0, 0.5)

			var_110_2.anchorMin = Vector2.New(var_111_1, 0)
			var_110_2.anchorMax = Vector2.New(var_111_2, 1)
			var_110_2.offsetMin = Vector2.zero
			var_110_2.offsetMax = Vector2.zero

			arg_95_0:RefreshCamera()
		end)
		setSlider(var_110_1, var_110_0.min, var_110_0.max, var_110_0.value)
	end)()
	;(function()
		local var_112_0 = arg_95_0.panelCamera:Find("Layout/Other/FaceCamera/Toggle")

		triggerToggle(var_112_0, arg_95_0.settingFaceCamera)
		onToggle(arg_95_0, var_112_0, function(arg_113_0)
			arg_95_0.settingFaceCamera = arg_113_0

			arg_95_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableCurrentHeadIK", arg_113_0)
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	;(function()
		local var_114_0 = arg_95_0.panelCamera:Find("Layout/Other/HideCharacter/Toggle")

		triggerToggle(var_114_0, arg_95_0.settingHideCharacter)
		onToggle(arg_95_0, var_114_0, function(arg_115_0)
			arg_95_0.settingHideCharacter = arg_115_0

			if arg_115_0 then
				arg_95_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "HideCharacterBylayer")
			else
				arg_95_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
			end
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
end

function var_0_0.RefreshCamera(arg_116_0)
	arg_116_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SettingCamera", arg_116_0.cameraSettings)
end

function var_0_0.UpdateAnimSpeedPanel(arg_117_0)
	local function var_117_0()
		if not arg_117_0.timerAnim then
			return
		end

		local var_118_0 = arg_117_0.animInfo
		local var_118_1 = var_118_0.animPlayList[var_118_0.index]
		local var_118_2 = math.max(var_0_2, var_118_1:GetAnimTime())
		local var_118_3 = var_118_0.startStamp
		local var_118_4 = Time.time

		var_118_0.ratio = math.min(1, var_118_0.ratio + (var_118_4 - var_118_3) * arg_117_0.animSpeed / var_118_2)
		var_118_0.startStamp = var_118_4
	end

	local var_117_1 = arg_117_0.animSpeeds

	UIItemList.StaticAlign(arg_117_0.listAnimSpeed, arg_117_0.listAnimSpeed:GetChild(0), #var_117_1, function(arg_119_0, arg_119_1, arg_119_2)
		if arg_119_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_119_1 = #var_117_1 - arg_119_1

		local var_119_0 = var_117_1[arg_119_1]

		setText(arg_119_2:Find("Name"), var_119_0)
		setText(arg_119_2:Find("Selected"), var_119_0)
		setActive(arg_119_2:Find("Line"), arg_119_1 ~= #var_117_1)
		onButton(arg_117_0, arg_119_2, function()
			if arg_117_0.animSpeed == var_119_0 then
				return
			end

			var_117_0()

			arg_117_0.animSpeed = var_119_0

			arg_117_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_119_0)
			arg_117_0:UpdateAnimSpeedPanel()
		end, SFX_PANEL)
	end)
	onButton(arg_117_0, arg_117_0.btnFreeze, function()
		local var_121_0 = 0

		if arg_117_0.animSpeed ~= 0 then
			arg_117_0.lastAnimSpeed = arg_117_0.animSpeed
		else
			var_121_0 = arg_117_0.lastAnimSpeed or 1
			arg_117_0.lastAnimSpeed = nil
		end

		var_117_0()

		arg_117_0.animSpeed = var_121_0

		arg_117_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_121_0)
		arg_117_0:UpdateAnimSpeedPanel()
	end, SFX_PANEL)
	UIItemList.StaticAlign(arg_117_0.listAnimSpeed, arg_117_0.listAnimSpeed:GetChild(0), #var_117_1, function(arg_122_0, arg_122_1, arg_122_2)
		if arg_122_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_122_1 = #var_117_1 - arg_122_1

		local var_122_0 = var_117_1[arg_122_1]

		setActive(arg_122_2:Find("Name"), arg_117_0.animSpeed ~= var_122_0)
		setActive(arg_122_2:Find("Selected"), arg_117_0.animSpeed == var_122_0)
	end)
	setActive(arg_117_0.btnFreeze:Find("Icon"), arg_117_0.animSpeed ~= 0)
	setActive(arg_117_0.btnFreeze:Find("Selected"), arg_117_0.animSpeed == 0)
	setText(arg_117_0.textAnimSpeed, i18n("dorm3d_photo_animspeed", string.format("%.1f", arg_117_0.animSpeed)))
end

function var_0_0.UpdateLightingPanel(arg_123_0)
	if not arg_123_0.activeSetting then
		return
	end

	if arg_123_0.activePanel ~= var_0_0.PANEL.LIGHTING then
		return
	end

	local var_123_0 = {}

	for iter_123_0, iter_123_1 in ipairs(pg.dorm3d_camera_volume_template.all) do
		table.insert(var_123_0, iter_123_1)
	end

	table.sort(var_123_0, function(arg_124_0, arg_124_1)
		return arg_124_0 < arg_124_1
	end)

	local function var_123_1()
		if not arg_123_0.settingFilterIndex then
			arg_123_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")

			return
		end

		local var_125_0 = pg.dorm3d_camera_volume_template[var_123_0[arg_123_0.settingFilterIndex]]

		arg_123_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetVolumeProfile", var_125_0.volume, arg_123_0.settingFilterStrength)
	end

	UIItemList.StaticAlign(arg_123_0.panelLightning:Find("Layout/Filter/List"), arg_123_0.panelLightning:Find("Layout/Filter/List"):GetChild(0), #var_123_0, function(arg_126_0, arg_126_1, arg_126_2)
		if arg_126_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_126_1 = arg_126_1 + 1

		local var_126_0 = pg.dorm3d_camera_volume_template[var_123_0[arg_126_1]]

		setText(arg_126_2:Find("Name"), var_126_0.name)

		var_126_0.icon = ""

		if var_126_0.icon ~= "" then
			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_126_0.icon), "", arg_126_2:Find("BG"))
		end

		if arg_123_0.settingFilterIndex == arg_126_1 then
			setActive(arg_126_2:Find("Selected"), true)
		else
			setActive(arg_126_2:Find("Selected"), false)
		end

		local var_126_1, var_126_2 = ApartmentProxy.CheckUnlockConfig(var_126_0.unlock)

		setActive(arg_126_2:Find("lock"), not var_126_1)

		if not var_126_1 then
			setText(arg_126_2:Find("lock/Image/Text"), var_126_0.unlock_text)
		end

		onButton(arg_123_0, arg_126_2, function()
			if not var_126_1 then
				pg.TipsMgr.GetInstance():ShowTips(var_126_2)

				return
			end

			local var_127_0 = arg_123_0.settingFilterIndex

			if arg_123_0.settingFilterIndex ~= arg_126_1 then
				arg_123_0.settingFilterIndex = arg_126_1
			else
				arg_123_0.settingFilterIndex = nil
			end

			var_123_1()

			if var_127_0 then
				local var_127_1 = arg_123_0.panelLightning:Find("Layout/Filter/List"):GetChild(var_127_0 - 1)

				setActive(var_127_1:Find("Selected"), false)
			end

			if arg_123_0.settingFilterIndex == arg_126_1 then
				setActive(arg_126_2:Find("Selected"), true)
			end
		end, SFX_PANEL)
	end)
	setActive(arg_123_0.panelLightning:Find("Layout/Filter/Slider"), false)
end

function var_0_0.OnSwitchSkin(arg_128_0, arg_128_1, arg_128_2, arg_128_3)
	seriesAsync({
		function(arg_129_0)
			if arg_128_0.settingHideCharacter then
				arg_128_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
			end

			arg_128_1:SwitchCharacterSkin(arg_128_2, arg_128_3, arg_129_0)
		end,
		function(arg_130_0)
			setActive(arg_128_1.ladySafeCollider, true)

			if not arg_128_0.animInfo then
				return arg_130_0()
			end

			local var_130_0 = arg_128_0.animInfo

			for iter_130_0 = #var_130_0.animPlayList, 1, -1 do
				local var_130_1 = var_130_0.animPlayList[iter_130_0]:GetStartPoint()

				if #var_130_1 > 0 then
					arg_128_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCurrentCharPoint", var_130_1)

					break
				end

				if iter_130_0 == 1 then
					local var_130_2 = arg_128_0.room:GetCameraZones()[arg_128_0.zoneIndex]

					arg_128_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCurrentCharPoint", var_130_2:GetWatchCameraName())
				end
			end

			arg_128_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

			local var_130_3 = var_130_0.animPlayList[#var_130_0.animPlayList]
			local var_130_4 = var_130_3:GetAnimTime()

			arg_128_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlayCurrentSingleAction", var_130_3:GetStateName())
			arg_128_0.scene.ladyDict[arg_128_2].ladyAnimator:Update(var_130_4)
			arg_128_0.timerAnim:Stop()

			arg_128_0.timerAnim = nil
			arg_128_0.animInfo = nil
			arg_128_0.animPlaying = nil

			arg_130_0()
		end,
		function()
			arg_128_0:UpdateActionPanel()

			if arg_128_0.settingHideCharacter then
				arg_128_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "HideCharacterBylayer")
			end
		end
	})
end

function var_0_0.SetMute(arg_132_0)
	if arg_132_0 then
		CriWare.CriAtom.SetCategoryVolume("Category_CV", 0)
		CriWare.CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriWare.CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		CriWare.CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriWare.CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriWare.CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

function var_0_0.willExit(arg_133_0)
	arg_133_0.loader:Clear()

	if arg_133_0.timerAnim then
		arg_133_0.timerAnim:Stop()

		arg_133_0.timerAnim = nil
	end

	if arg_133_0.animSpeed ~= 1 then
		arg_133_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", 1)
	end

	if arg_133_0.settingHideCharacter then
		arg_133_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
	end

	if not arg_133_0.settingFaceCamera then
		arg_133_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableCurrentHeadIK", true)
	end

	arg_133_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterLight")
	arg_133_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")
	arg_133_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCameraSettings")
	arg_133_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ExitPhotoMode")
end

function var_0_0.SetPhotoCameraSliderValue(arg_134_0, arg_134_1)
	local var_134_0 = arg_134_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_134_0, 0, 1, arg_134_1)
end

function var_0_0.SetPhotoStickDelta(arg_135_0, arg_135_1)
	arg_135_1 = arg_135_1 * 0.5

	local var_135_0 = arg_135_0._tf:Find("Center/Stick")
	local var_135_1 = var_135_0.rect.height
	local var_135_2 = var_135_0.rect.width
	local var_135_3 = var_135_0:Find("Handler")

	setAnchoredPosition(var_135_3, Vector2.New(var_135_1 * arg_135_1.x, var_135_2 * arg_135_1.y))
end

return var_0_0
