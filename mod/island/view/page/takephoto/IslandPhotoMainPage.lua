local var_0_0 = class("IslandPhotoMainPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandMainPhotoUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.centerPanel = arg_2_0._tf:Find("Center")
	arg_2_0.normalPanel = arg_2_0._tf:Find("Center/Normal")

	setActive(arg_2_0.normalPanel, true)

	arg_2_0.btnHideUI = arg_2_0._tf:Find("Center/HideUI")
	arg_2_0.btnReset = arg_2_0._tf:Find("Center/Reset")
	arg_2_0.btnFreeze = arg_2_0._tf:Find("Center/Freeze")
	arg_2_0.RightTopTf = arg_2_0._tf:Find("RightTop")
	arg_2_0.FilmTf = arg_2_0._tf:Find("RightTop/Film")
	arg_2_0.ShotTf = arg_2_0._tf:Find("RightTop/Shot")
	arg_2_0.btnFilm = arg_2_0._tf:Find("RightTop/Film/Film")
	arg_2_0.filmTime = arg_2_0._tf:Find("RightTop/FilmTime")

	setActive(arg_2_0.filmTime, false)

	arg_2_0.btnShoot = arg_2_0._tf:Find("RightTop/Shot/Shot")
	arg_2_0.hideuiMask = arg_2_0._tf:Find("Mask")

	setActive(arg_2_0.hideuiMask, false)

	arg_2_0.ysScreenShoter = arg_2_0._tf:Find("Shoter"):GetComponent(typeof(YSTool.YSScreenShoter))
	arg_2_0.stopRecBtn = arg_2_0:findTF("stopRec")
	arg_2_0.videoTipPanel = arg_2_0:findTF("videoTipPanel")

	setActive(arg_2_0.videoTipPanel, false)

	arg_2_0.photoModel = arg_2_0:findTF("Center/photoModel")
	arg_2_0.unselectBgTF = arg_2_0.photoModel:Find("un_select_bg")
	arg_2_0.select_bgTF = arg_2_0.photoModel:Find("select_bg")
	arg_2_0.firstModelTF = arg_2_0.photoModel:Find("first")
	arg_2_0.thirdModelTF = arg_2_0.photoModel:Find("third")
	arg_2_0.mainCamera = IslandCameraMgr.instance._mainCamera
	arg_2_0.takeModelTFDic = {
		[IslandConst.TakePhotoModel.First] = arg_2_0.firstModelTF,
		[IslandConst.TakePhotoModel.Third] = arg_2_0.thirdModelTF
	}
	arg_2_0.sliderZoom = arg_2_0.normalPanel:Find("Zoom/Slider")
	arg_2_0.fpsCamera = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME)
	arg_2_0.tpsCamera = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)
	arg_2_0.fpsHeight = pg.island_set.island_photohight_FPS.key_value_varchar
	arg_2_0.tpsHeight = pg.island_set.island_photohight_TPS.key_value_varchar
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.RemoveListeners(arg_4_0)
	return
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("Center/Normal/Back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_photo.tip
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Center/Normal/Back"), function()
		arg_5_0:Hide()
	end, SFX_CANCEL)
	setActive(arg_5_0.ShotTf, true)
	setActive(arg_5_0.FilmTf, false)
	onButton(arg_5_0, arg_5_0._tf:Find("RightTop/Shot/Switch"), function()
		setActive(arg_5_0.ShotTf, false)
		setActive(arg_5_0.FilmTf, true)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("RightTop/Film/Switch"), function()
		setActive(arg_5_0.ShotTf, true)
		setActive(arg_5_0.FilmTf, false)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnShoot, function()
		local function var_10_0(arg_11_0)
			setActive(arg_5_0.centerPanel, arg_11_0)
			setActive(arg_5_0._tf:Find("RightTop"), arg_11_0)

			if PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0 then
				setActive(pg.UIMgr.GetInstance().OverlayEffect, arg_11_0)
			end
		end

		local function var_10_1(arg_12_0)
			warning("截图结果：" .. tostring(true))

			local var_12_0 = Tex2DExtension.EncodeToJPG(arg_12_0)

			arg_5_0:OpenPage(IslandPhotoSharePage, var_12_0, arg_12_0)
			IslandTaskHelper.UpdateClientTaskProgress(IslandTaskTargetType.TAKE_PHOTO, 0)
			IslandAchievementHelper.OnTakePhoto(0)
		end

		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandTakeThoto(2))
		BLHX.Rendering.HotUpdate.ScreenShooterPass.TakePhoto(arg_5_0.mainCamera, var_10_1)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.photoModel:Find("left_btn"), function()
		arg_5_0:LeftSelectBtnHandle()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.select_bgTF:Find("left_btn"), function()
		arg_5_0:RightSelectBtnHandle()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.firstModelTF, function()
		arg_5_0:ChangeTakePhotoModel(IslandConst.TakePhotoModel.First)
		arg_5_0:RightSelectBtnHandle()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.thirdModelTF, function()
		arg_5_0:ChangeTakePhotoModel(IslandConst.TakePhotoModel.Third)
		arg_5_0:RightSelectBtnHandle()
	end, SFX_PANEL)
	onSlider(arg_5_0, arg_5_0.sliderZoom, function(arg_17_0)
		arg_5_0:ChangeSliderValue(arg_17_0)
	end)

	arg_5_0.hideUI = false

	onButton(arg_5_0, arg_5_0.btnHideUI, function()
		if arg_5_0.hideUI then
			return
		end

		setActive(arg_5_0.hideuiMask, true)
		setActive(arg_5_0.centerPanel, false)

		arg_5_0.RightTopTf:GetComponent("CanvasGroup").alpha = 0
		arg_5_0.RightTopTf:GetComponent("CanvasGroup").blocksRaycasts = false
		arg_5_0.hideUI = true

		arg_5_0:emitCore(ISLAND_EVT.SetOpMoveBtnActve, false)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnReset, function()
		local var_19_0

		if arg_5_0.takePhotoModel == 2 then
			var_19_0 = (arg_5_0.fpsHeight[1] - arg_5_0.fpsHeight[2]) / (arg_5_0.fpsHeight[3] - arg_5_0.fpsHeight[2])
		else
			var_19_0 = (arg_5_0.tpsHeight[1] - arg_5_0.tpsHeight[2]) / (arg_5_0.tpsHeight[3] - arg_5_0.tpsHeight[2])

			arg_5_0:emitCore(ISLAND_EVT.Change_TakePhoto_Model, arg_5_0.takePhotoModel)
		end

		setSlider(arg_5_0.sliderZoom, 0, 1, var_19_0)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.hideuiMask, function()
		if not arg_5_0.hideUI then
			return
		end

		setActive(arg_5_0.centerPanel, true)
		setActive(arg_5_0.hideuiMask, false)

		arg_5_0.RightTopTf:GetComponent("CanvasGroup").alpha = 1
		arg_5_0.RightTopTf:GetComponent("CanvasGroup").blocksRaycasts = true
		arg_5_0.hideUI = false

		arg_5_0:emitCore(ISLAND_EVT.SetOpMoveBtnActve, true)
	end)

	arg_5_0.recordState = false

	onButton(arg_5_0, arg_5_0.btnFilm, function()
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandTakeThoto(3))

		local function var_21_0(arg_22_0)
			setActive(arg_5_0.centerPanel, arg_22_0)

			arg_5_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_22_0 and 1 or 0

			arg_5_0:emitCore(ISLAND_EVT.SetOpMoveBtnActve, arg_22_0, true)
		end

		if not arg_5_0.recordState then
			local function var_21_1(arg_23_0)
				if not arg_23_0 then
					var_21_0(true)

					arg_5_0.recordState = false

					LeanTween.moveX(arg_5_0.stopRecBtn, arg_5_0.stopRecBtn.rect.width, 0.15)
				else
					arg_5_0.recordState = true
				end
			end

			local function var_21_2()
				setActive(arg_5_0.stopRecBtn, true)
				LeanTween.moveX(arg_5_0.stopRecBtn, 0, 0.15):setOnComplete(System.Action(function()
					var_0_0.SetMute(true)

					arg_5_0.recordFilePath = YSNormalTool.RecordTool.GenRecordFilePath()

					YSNormalTool.RecordTool.StartRecording(var_21_1, arg_5_0.recordFilePath)
				end))
			end

			seriesAsync({
				function(arg_26_0)
					PermissionHelper.Request3DDorm(arg_26_0, nil)
				end,
				function(arg_27_0)
					var_21_0(false)

					local var_27_0 = PlayerPrefs.GetInt("hadShowForVideoTipDorm", 0)

					if not var_27_0 or var_27_0 <= 0 then
						PlayerPrefs.SetInt("hadShowForVideoTipDorm", 1)

						arg_5_0:findTF("Text", arg_5_0.videoTipPanel):GetComponent("Text").text = i18n("word_take_video_tip")

						onButton(arg_5_0, arg_5_0.videoTipPanel, function()
							setActive(arg_5_0.videoTipPanel, false)
							var_21_2()
						end)
						setActive(arg_5_0.videoTipPanel, true)
					else
						var_21_2()
					end
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.stopRecBtn, function()
		arg_5_0.recordState = false

		local function var_29_0(arg_30_0)
			if arg_30_0 and PLATFORM == PLATFORM_ANDROID then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("word_save_video"),
					onNo = function()
						if System.IO.File.Exists(arg_5_0.recordFilePath) then
							System.IO.File.Delete(arg_5_0.recordFilePath)
						end
					end,
					onYes = function()
						YSNormalTool.MediaTool.SaveVideoToAlbum(arg_5_0.recordFilePath, function(arg_33_0, arg_33_1)
							if arg_33_0 then
								pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))

								if System.IO.File.Exists(arg_5_0.recordFilePath) then
									System.IO.File.Delete(arg_5_0.recordFilePath)
								end
							end
						end)
					end
				})
			end

			arg_5_0.recordState = false
		end

		local function var_29_1(arg_34_0)
			setActive(arg_5_0.centerPanel, arg_34_0)

			arg_5_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_34_0 and 1 or 0
		end

		if not LeanTween.isTweening(go(arg_5_0.stopRecBtn)) then
			LeanTween.moveX(arg_5_0.stopRecBtn, arg_5_0.stopRecBtn.rect.width, 0.15):setOnComplete(System.Action(function()
				setActive(arg_5_0.stopRecBtn, false)
				seriesAsync({
					function(arg_36_0)
						YSNormalTool.RecordTool.StopRecording(var_29_0)
						var_29_1(true)
						var_0_0.SetMute(false)
					end
				})
			end))
		end
	end)
	setActive(arg_5_0.stopRecBtn, false)
end

function var_0_0.ChangeSliderValue(arg_37_0, arg_37_1)
	local var_37_0
	local var_37_1

	if arg_37_0.takePhotoModel == 2 then
		var_37_0 = arg_37_0.fpsCamera.gameObject:GetComponent(typeof(CameraPovLook))
		var_37_1 = arg_37_1 * (arg_37_0.fpsHeight[3] - arg_37_0.fpsHeight[2]) + arg_37_0.fpsHeight[2]
	else
		var_37_0 = arg_37_0.tpsCamera.gameObject:GetComponent(typeof(CameraPovLook))
		var_37_1 = arg_37_1 * (arg_37_0.tpsHeight[3] - arg_37_0.tpsHeight[2]) + arg_37_0.tpsHeight[2]

		arg_37_0:emitCore(ISLAND_EVT.Change_Photo_Height, arg_37_0.takePhotoModel, var_37_1)
	end

	var_37_0:SetTargetOffsetY(var_37_1)
end

function var_0_0.RightSelectBtnHandle(arg_38_0)
	setActive(arg_38_0.unselectBgTF, true)
	setActive(arg_38_0.select_bgTF, false)
	setActive(arg_38_0.photoModel:Find("left_btn"), true)

	for iter_38_0, iter_38_1 in pairs(arg_38_0.takeModelTFDic) do
		if arg_38_0.takePhotoModel == iter_38_0 then
			setActive(iter_38_1:Find("select"), true)
			setActive(iter_38_1:Find("unSelect"), false)
			setActive(iter_38_1, true)
			setAnchoredPosition(iter_38_1, {
				x = 0
			})
		else
			setActive(iter_38_1:Find("unSelect"), true)
			setActive(iter_38_1:Find("select"), false)
			setActive(iter_38_1, false)
		end
	end
end

function var_0_0.LeftSelectBtnHandle(arg_39_0)
	setActive(arg_39_0.unselectBgTF, false)
	setActive(arg_39_0.select_bgTF, true)
	setActive(arg_39_0.photoModel:Find("left_btn"), false)

	local var_39_0 = 1

	for iter_39_0, iter_39_1 in pairs(arg_39_0.takeModelTFDic) do
		setActive(iter_39_1, true)

		if arg_39_0.takePhotoModel == iter_39_0 then
			setAnchoredPosition(iter_39_1, {
				x = 0
			})
		else
			setAnchoredPosition(iter_39_1, {
				x = -66 * var_39_0
			})

			var_39_0 = var_39_0 + 1
		end
	end
end

function var_0_0.ChangeTakePhotoModel(arg_40_0, arg_40_1)
	if arg_40_0.takePhotoModel == arg_40_1 then
		return
	end

	if arg_40_0.takePhotoModel then
		local var_40_0 = arg_40_0.takeModelTFDic[arg_40_0.takePhotoModel]

		setActive(var_40_0:Find("select"), false)
		setActive(var_40_0:Find("unSelect"), true)
	end

	arg_40_0.takePhotoModel = arg_40_1

	local var_40_1 = arg_40_0.takeModelTFDic[arg_40_0.takePhotoModel]

	setActive(var_40_1:Find("select"), true)
	setActive(var_40_1:Find("unSelect"), false)

	local var_40_2
	local var_40_3

	if arg_40_0.takePhotoModel == 2 then
		var_40_2 = arg_40_0.fpsCamera.gameObject:GetComponent(typeof(CameraPovZoom))
		var_40_3 = (arg_40_0.fpsHeight[1] - arg_40_0.fpsHeight[2]) / (arg_40_0.fpsHeight[3] - arg_40_0.fpsHeight[2])
	else
		var_40_2 = arg_40_0.tpsCamera.gameObject:GetComponent(typeof(CameraPovZoom))
		var_40_3 = (arg_40_0.tpsHeight[1] - arg_40_0.tpsHeight[2]) / (arg_40_0.tpsHeight[3] - arg_40_0.tpsHeight[2])
	end

	setSlider(arg_40_0.sliderZoom, 0, 1, var_40_3)
	var_40_2:SetCurrentZoom(50)
	arg_40_0:emitCore(ISLAND_EVT.Change_TakePhoto_Model, arg_40_0.takePhotoModel)
end

function var_0_0.OnShow(arg_41_0)
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandTakeThoto(1))
	arg_41_0:ChangeTakePhotoModel(IslandConst.TakePhotoModel.First)
	arg_41_0:RightSelectBtnHandle()
end

function var_0_0.OnDisable(arg_42_0)
	arg_42_0:OnHide()
end

function var_0_0.OnHide(arg_43_0)
	if arg_43_0.recordState then
		triggerButton(arg_43_0.btnFilm)

		return
	end

	arg_43_0.takePhotoModel = nil

	arg_43_0:emitCore(ISLAND_EVT.Change_TakePhoto_Model, IslandConst.TakePhotoModel.None)
end

function var_0_0.SetMute(arg_44_0)
	if arg_44_0 then
		CriWare.CriAtom.SetCategoryVolume("Category_CV", 0)
		CriWare.CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriWare.CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		CriWare.CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriWare.CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriWare.CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

function var_0_0.OnDestroy(arg_45_0)
	return
end

return var_0_0
