local var_0_0 = class("Dorm3dPhotoARLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dARPhotoUI"
end

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
	arg_2_0.btnZone = arg_2_0._tf:Find("Center/Zone")
	arg_2_0.btnAr = arg_2_0._tf:Find("Center/Ar")
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
	setText(arg_2_0.panelLightning:Find("Layout/Title/Lighting/Name"), i18n("dorm3d_photo_lighting"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Lighting/Selected"), i18n("dorm3d_photo_lighting"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Name"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Selected"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelLightning:Find("Layout/Lighting/Strength/Name"), i18n("dorm3d_photo_strength"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Name"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Selected"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Name"), i18n("dorm3d_photo_special_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Selected"), i18n("dorm3d_photo_special_anim"))

	arg_2_0.mainCamera = GameObject.Find("AR/XR Origin/Camera Offset/Main Camera"):GetComponent(typeof(Camera))
	arg_2_0.stopRecBtn = arg_2_0:findTF("stopRec")
	arg_2_0.videoTipPanel = arg_2_0:findTF("videoTipPanel")

	setActive(arg_2_0.videoTipPanel, false)
end

function var_0_0.SetSceneRoot(arg_3_0, arg_3_1)
	arg_3_0.scene = arg_3_1
end

function var_0_0.SetRoom(arg_4_0, arg_4_1)
	arg_4_0.room = getProxy(ApartmentProxy):getRoom(arg_4_1)
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
	setActive(arg_7_0._tf:Find("Center/Normal/Back"), false)
	onButton(arg_7_0, arg_7_0._tf:Find("Center/Normal/Back"), function()
		arg_7_0:onBackPressed()
	end, SFX_CANCEL)

	local var_7_0 = arg_7_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_7_0, 0, 1, 0)
	onSlider(arg_7_0, var_7_0, function(arg_9_0)
		local var_9_0 = (1 - arg_9_0) * 0.5 + 0.5

		arg_7_0:emit(Dorm3dPhotoARMediator.SCENE_CALL, "SetPinchValue", var_9_0)
	end)

	arg_7_0.activeSetting = false

	onButton(arg_7_0, arg_7_0._tf:Find("Center/Normal/Settings"), function()
		arg_7_0.activeSetting = true

		quickPlayAnimation(arg_7_0._tf:Find("Center"), "anim_dorm3d_photo_normal_out")
		arg_7_0:emit(Dorm3dPhotoARMediator.ACTIVE_AR_UI, false)
		arg_7_0:UpdateActionPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("Center/Settings/Back"), function()
		arg_7_0.activeSetting = false

		quickPlayAnimation(arg_7_0._tf:Find("Center"), "anim_dorm3d_photo_normal_in")
		arg_7_0:emit(Dorm3dPhotoARMediator.ACTIVE_AR_UI, true)
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
		arg_7_0:emit(Dorm3dPhotoARMediator.SCENE_CALL, "ResetPhotoCameraPosition")
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnFilm, function()
		local function var_15_0(arg_16_0)
			setActive(arg_7_0.centerPanel, arg_16_0)

			arg_7_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_16_0 and 1 or 0

			arg_7_0:emit(Dorm3dPhotoARMediator.ACTIVE_AR_UI, arg_16_0)
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

			arg_7_0:emit(Dorm3dPhotoARMediator.ACTIVE_AR_UI, arg_28_0)
		end

		if not LeanTween.isTweening(go(arg_7_0.stopRecBtn)) then
			LeanTween.moveX(arg_7_0.stopRecBtn, arg_7_0.stopRecBtn.rect.width, 0.15):setOnComplete(System.Action(function()
				setActive(arg_7_0.stopRecBtn, false)
				seriesAsync({
					function(arg_30_0)
						YSNormalTool.RecordTool.StopRecording(var_23_0)
						var_23_1(true)
						var_0_0.SetMute(false)
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
			arg_7_0:emit(Dorm3dPhotoARMediator.SHARE_PANEL, arg_35_1, arg_35_0)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_7_0.groupId, 3, arg_7_0.room:GetConfigID(), Dorm3dCameraAnim.New({
				configId = arg_7_0.animID
			}):GetStateName()))
		end

		local function var_32_3(arg_36_0)
			var_32_1(true)

			local var_36_0 = Tex2DExtension.EncodeToJPG(arg_36_0)

			var_32_2(var_36_0, arg_36_0)
		end

		BLHX.Rendering.HotUpdate.ScreenShooterPass.TakePhoto(arg_7_0.mainCamera, callback)
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
		arg_7_0:emit(Dorm3dPhotoMediator.GO_AR)
	end)

	arg_7_0.activePanel = 1

	local var_7_1 = {
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
				return
			end,
			Off = function()
				return
			end
		},
		{
			btn = arg_7_0.btnLighting,
			On = function()
				return
			end,
			Off = function()
				return
			end
		}
	}

	table.Ipairs(var_7_1, function(arg_48_0, arg_48_1)
		onToggle(arg_7_0, arg_48_1.btn, function(arg_49_0)
			if not arg_49_0 then
				return
			end

			table.Ipairs(var_7_1, function(arg_50_0, arg_50_1)
				if arg_50_0 == arg_48_0 then
					return
				end

				arg_50_1.Off()
			end)

			arg_7_0.activePanel = arg_48_0

			arg_48_1.On()
		end, SFX_PANEL)
	end)
	;(function()
		local var_51_0 = {
			arg_7_0.panelAction:Find("Layout/Title/Regular")
		}

		triggerToggle(var_51_0[1], true)
	end)()
	;(function()
		local var_52_0 = {
			arg_7_0.panelLightning:Find("Layout/Title/Lighting")
		}

		triggerToggle(var_52_0[1], true)
	end)()
	arg_7_0:InitData()
	triggerToggle(var_7_1[arg_7_0.activePanel].btn, true)
	arg_7_0:emit(Dorm3dPhotoARMediator.AR_PHOTO_INITED)
end

function var_0_0.InitData(arg_53_0)
	arg_53_0:RefreshData()
end

function var_0_0.RefreshData(arg_54_0)
	arg_54_0.animID = arg_54_0.room:getAllARAnimationListByShip(arg_54_0.groupId)[1]:GetConfigID()
	arg_54_0.animSpeed = 1
end

local var_0_1 = 0.2

function var_0_0.UpdateActionPanel(arg_55_0)
	if not arg_55_0.activeSetting then
		return
	end

	if arg_55_0.activePanel ~= var_0_0.PANEL.ACTION then
		return
	end

	local var_55_0 = arg_55_0.room:getAllARAnimationListByShip(arg_55_0.groupId)
	local var_55_1 = arg_55_0.panelAction:Find("Layout/Regular/Scroll/Viewport/Content")

	local function var_55_2()
		UIItemList.StaticAlign(var_55_1, var_55_1:GetChild(0), #var_55_0, function(arg_57_0, arg_57_1, arg_57_2)
			if arg_57_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_57_1 = arg_57_1 + 1

			local var_57_0 = var_55_0[arg_57_1]

			setActive(arg_57_2:Find("Selected"), var_57_0:GetConfigID() == arg_55_0.animID)
			setActive(arg_57_2:Find("Slider"), var_57_0:GetConfigID() == arg_55_0.animID and tobool(arg_55_0.timerAnim))
		end)
	end

	local function var_55_3(arg_58_0, arg_58_1)
		if arg_55_0.animPlaying then
			return
		end

		local var_58_0 = arg_58_0:GetConfigID()

		if arg_55_0.animID == var_58_0 then
			return
		end

		local var_58_1 = arg_55_0:GetAnimPlayList(var_58_0)
		local var_58_2 = Dorm3dCameraAnim.New({
			configId = arg_55_0.animID
		}):GetFinishAnimID()

		arg_55_0.animID = var_58_0

		var_55_2()
		arg_55_0:BlockActionPanel(true)

		arg_55_0.animPlaying = true

		local var_58_3 = (table.indexof(var_58_1, _.detect(var_58_1, function(arg_59_0)
			return arg_59_0:GetConfigID() == var_58_2
		end)) or 0) + 1
		local var_58_4 = _.rest(var_58_1, var_58_3)
		local var_58_5 = arg_58_1:Find("Slider"):GetComponent(typeof(Slider))

		setActive(arg_58_1:Find("Slider"), true)

		local function var_58_6()
			setActive(arg_58_1:Find("Selected"), true)
			setActive(arg_58_1:Find("Slider"), false)
			arg_55_0:BlockActionPanel(false)

			arg_55_0.animPlaying = nil
		end

		if #var_58_4 == 0 then
			var_58_6()

			return
		end

		local var_58_7 = _.reduce(var_58_4, 0, function(arg_61_0, arg_61_1)
			return arg_61_0 + math.max(var_0_1, arg_61_1:GetAnimTime())
		end)

		if arg_55_0.timerAnim then
			arg_55_0.timerAnim:Stop()
		end

		arg_55_0.animInfo = {
			index = 1,
			passedTime = 0,
			ratio = 0,
			animPlayList = var_58_4,
			totalTime = var_58_7,
			startStamp = Time.time
		}
		arg_55_0.timerAnim = FrameTimer.New(function()
			local var_62_0 = arg_55_0.animInfo
			local var_62_1 = var_62_0.animPlayList[var_62_0.index]
			local var_62_2 = math.max(var_0_1, var_62_1:GetAnimTime())
			local var_62_3 = var_62_0.startStamp
			local var_62_4 = Time.time
			local var_62_5 = math.min(1, var_62_0.ratio + (var_62_4 - var_62_3) * arg_55_0.animSpeed / var_62_2)
			local var_62_6 = var_62_0.passedTime + var_62_2 * var_62_5

			var_58_5.value = var_62_6 / var_58_7

			if var_62_5 < 1 then
				return
			end

			var_62_0.index = var_62_0.index + 1
			var_62_0.ratio = 0
			var_62_0.passedTime = var_62_0.passedTime + var_62_2
			var_62_0.startStamp = var_62_4

			warning(var_62_0.startStamp)

			if var_62_0.index > #var_62_0.animPlayList then
				var_58_6()
				arg_55_0.timerAnim:Stop()

				arg_55_0.timerAnim = nil
				arg_55_0.animInfo = nil

				return
			end

			local var_62_7 = var_62_0.animPlayList[var_62_0.index]

			arg_55_0:emit(Dorm3dPhotoARMediator.SCENE_CALL, "PlaySingleAction", var_62_7:GetStateName())
		end, 1, -1)

		local var_58_8 = arg_55_0.animInfo.animPlayList[1]

		if var_58_3 == 1 then
			arg_55_0:emit(Dorm3dPhotoARMediator.SCENE_CALL, "SwitchAnim", var_58_8:GetStateName())
			onNextTick(function()
				arg_55_0:emit(Dorm3dPhotoARMediator.SCENE_CALL, "ResetCharPos")
			end)
		else
			arg_55_0:emit(Dorm3dPhotoARMediator.SCENE_CALL, "PlaySingleAction", var_58_8:GetStateName())
		end

		arg_55_0.timerAnim:Start()
	end

	UIItemList.StaticAlign(var_55_1, var_55_1:GetChild(0), #var_55_0, function(arg_64_0, arg_64_1, arg_64_2)
		if arg_64_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_64_1 = arg_64_1 + 1

		local var_64_0 = var_55_0[arg_64_1]

		setText(arg_64_2:Find("Name"), var_64_0:GetName())
		GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_64_0:GetZoneIcon()), "", arg_64_2:Find("Icon"))
		setActive(arg_64_2:Find("Slider"), false)
		setActive(arg_64_2:Find("Selected"), false)
		onButton(arg_55_0, arg_64_2, function()
			var_55_3(var_64_0, arg_64_2)
		end)
	end)
	var_55_2()
end

function var_0_0.BlockActionPanel(arg_66_0, arg_66_1)
	return
end

function var_0_0.SetPhotoUIActive(arg_67_0, arg_67_1)
	setActive(arg_67_0._tf:Find("RightTop"), arg_67_1)
	setActive(arg_67_0._tf:Find("Center"), arg_67_1)
end

function var_0_0.GetAnimPlayList(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_1
	local var_68_1 = {}

	while true do
		local var_68_2 = Dorm3dCameraAnim.New({
			configId = var_68_0
		})

		if not var_68_2 then
			return var_68_1
		end

		table.insert(var_68_1, 1, var_68_2)

		var_68_0 = var_68_2:GetPreAnimID()

		if var_68_0 == 0 then
			return var_68_1
		end
	end
end

function var_0_0.SetMute(arg_69_0)
	if arg_69_0 then
		CriWare.CriAtom.SetCategoryVolume("Category_CV", 0)
		CriWare.CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriWare.CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		CriWare.CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriWare.CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriWare.CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

function var_0_0.willExit(arg_70_0)
	if arg_70_0.timerAnim then
		arg_70_0.timerAnim:Stop()

		arg_70_0.timerAnim = nil
	end

	if arg_70_0.filmTimer then
		arg_70_0.filmTimer:Stop()

		arg_70_0.filmTimer = nil
	end
end

function var_0_0.SetCamaraPinchSliderValue(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_71_0, 0, 1, 1 - (arg_71_1 - 0.5) / 0.5)
end

function var_0_0.ShowPhotoImage(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1 and 1 or 0

	arg_72_0.normalPanel:GetComponent("CanvasGroup").alpha = var_72_0
	arg_72_0._tf:Find("RightTop"):GetComponent("CanvasGroup").alpha = var_72_0
end

return var_0_0
