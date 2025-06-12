local var_0_0 = class("Dorm3dDanceGameSubView", import("..Dorm3dGameBaseSubView"))

function var_0_0.Init(arg_1_0)
	arg_1_0.gamePanel = arg_1_0._tf:Find("main")
	arg_1_0.cameraContainer = arg_1_0.gamePanel:Find("camera")
	arg_1_0.gameCucoloris = arg_1_0.gamePanel:Find("cucoloris")
	arg_1_0.gamePhotos = arg_1_0.gamePanel:Find("photos")
	arg_1_0.btnHide = arg_1_0.gamePanel:Find("bottom/btn_hide")
	arg_1_0.btnPhoto = arg_1_0.gamePanel:Find("bottom/btn_photo")
	arg_1_0.btnGameEnd = arg_1_0.gamePanel:Find("bottom/game_end")
	arg_1_0.photoCountText = arg_1_0.gamePanel:Find("bottom/count")
	arg_1_0.photoTpl = arg_1_0.gamePanel:Find("tpl")
	arg_1_0.gameHideClickUI = arg_1_0._tf:Find("hide_click")

	setActive(arg_1_0.gameHideClickUI, false)
	setText(arg_1_0.btnGameEnd:Find("Text"), i18n("dorm3d_cafe_minigame3"))
	onButton(arg_1_0, arg_1_0.btnHide, function()
		setActive(arg_1_0.gamePanel, false)
		setActive(arg_1_0.gameHideClickUI, true)
		arg_1_0.contextData.onShowOrHideBaseUI(false)
	end, SFX_DORM_CLICK)
	onButton(arg_1_0, arg_1_0.gameHideClickUI, function()
		setActive(arg_1_0.gamePanel, true)
		setActive(arg_1_0.gameHideClickUI, false)
		arg_1_0.contextData.onShowOrHideBaseUI(true)
	end, SFX_DORM_CLICK)
	onButton(arg_1_0, arg_1_0.btnPhoto, function()
		arg_1_0.contextData.onTakePhoto()
	end, SFX_DORM_CLICK)
	onButton(arg_1_0, arg_1_0.btnGameEnd, function()
		arg_1_0.contextData.onEndGame()
	end, SFX_DORM_CLICK)
	onButton(arg_1_0, arg_1_0.gamePhotos, function()
		if #arg_1_0.contextData.photoData == 0 then
			return
		end

		arg_1_0.contextData.onShowPhotoWindow(#arg_1_0.contextData.photoData)
	end)

	arg_1_0.gameConfig = pg.dorm3d_dance[arg_1_0.contextData.groupId]
	arg_1_0.cameraItemList = UIItemList.New(arg_1_0.cameraContainer, arg_1_0.cameraContainer:Find("tpl"))

	arg_1_0.cameraItemList:make(function(arg_7_0, arg_7_1, arg_7_2)
		arg_1_0:UpdateCameraFunc(arg_7_0, arg_7_1, arg_7_2)
	end)

	arg_1_0.selectedCameraIndex = 1
end

function var_0_0.UpdateCameraFunc(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = arg_8_2 + 1
	local var_8_1 = arg_8_0.gameConfig.camera_names[var_8_0]
	local var_8_2 = arg_8_0.gameConfig.camera_tracks[var_8_0]

	if arg_8_1 == UIItemList.EventUpdate then
		local var_8_3 = var_8_0 == arg_8_0.selectedCameraIndex

		setActive(arg_8_3:Find("selected"), var_8_3)
		setActive(arg_8_3:Find("normal"), not var_8_3)
	elseif arg_8_1 == UIItemList.EventInit then
		setText(arg_8_3:Find("selected/Text"), var_8_1)
		setText(arg_8_3:Find("normal/Text"), var_8_1)
		onButton(arg_8_0, arg_8_3, function()
			if arg_8_0.selectedCameraIndex ~= var_8_0 then
				arg_8_0.selectedCameraIndex = var_8_0

				arg_8_0.contextData.onSwitchCamera(var_8_2)
				arg_8_0:FlushCamera()
			end
		end, SFX_DORM_CLICK)
	end
end

function var_0_0.FlushCamera(arg_10_0)
	arg_10_0.cameraItemList:align(#arg_10_0.gameConfig.camera_names)
end

function var_0_0.Flush(arg_11_0)
	local var_11_0 = ShipGroup.getDefaultShipNameByGroupID(arg_11_0.contextData.groupId)

	setText(arg_11_0._tf:Find("main/hint"), i18n("dorm3d_cafe_minigame2", var_11_0))

	local var_11_1 = #arg_11_0.contextData.photoData
	local var_11_2 = var_11_1 >= Dorm3dDanceConst.PHOTO_TIMES

	setActive(arg_11_0.btnPhoto, not var_11_2)
	setActive(arg_11_0.photoCountText, not var_11_2)
	setText(arg_11_0.photoCountText, var_11_1 .. "/" .. Dorm3dDanceConst.PHOTO_TIMES)
	setActive(arg_11_0.btnGameEnd, var_11_2)
	arg_11_0:FlushCamera()

	for iter_11_0 = 1, #arg_11_0.contextData.cucoloris do
		local var_11_3 = arg_11_0.gameCucoloris:GetChild(iter_11_0 - 1)

		LoadImageSpriteAtlasAsync(arg_11_0.contextData.cucoloris[iter_11_0]:GetIcon(), "", var_11_3:Find("Image"), true)
	end

	if var_11_1 > arg_11_0.gamePhotos.childCount then
		local var_11_4 = cloneTplTo(arg_11_0.photoTpl, arg_11_0.gamePhotos)
		local var_11_5 = math.random(Dorm3dDanceConst.GAME_RANDOM_RANGE_POSX[1], Dorm3dDanceConst.GAME_RANDOM_RANGE_POSX[2])
		local var_11_6 = math.random(Dorm3dDanceConst.GAME_RANDOM_RANGE_POSY[1], Dorm3dDanceConst.GAME_RANDOM_RANGE_POSY[2])
		local var_11_7 = math.random(Dorm3dDanceConst.GAME_RANDOM_RANGE_ANGLE[1], Dorm3dDanceConst.GAME_RANDOM_RANGE_ANGLE[2])

		var_11_4.localPosition = Vector3(var_11_5, var_11_6, 0)
		var_11_4.localEulerAngles = Vector3(0, 0, var_11_7)

		arg_11_0.contextData.onShowRealImage(var_11_1, var_11_4:Find("mask/Image"), var_11_4:Find("mask"))
	end
end

function var_0_0.ClearPhoto(arg_12_0)
	for iter_12_0 = arg_12_0.gamePhotos.childCount, 1, -1 do
		Destroy(arg_12_0.gamePhotos:GetChild(iter_12_0 - 1).gameObject)
	end
end

return var_0_0
