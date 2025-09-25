local var_0_0 = class("IslandPhotoSharePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandPhotoShareUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.photoImgTrans = arg_2_0:findTF("PhotoImg")
	arg_2_0.shareBtnTrans = arg_2_0:findTF("ShareBtn")
	arg_2_0.confirmBtnTrans = arg_2_0:findTF("ConfirmBtn")
	arg_2_0.cancelBtnTrans = arg_2_0:findTF("CancelBtn")
	arg_2_0.frameBtn = arg_2_0:findTF("frameBtn")
	arg_2_0.photoAdapter = arg_2_0:findTF("photoAdapter")
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.frameDic = {}
	arg_3_0.loadingDic = {}

	onButton(arg_3_0, arg_3_0.shareBtnTrans, function()
		local var_4_0 = arg_3_0.frameDic[arg_3_0.selectFrameId]

		if var_4_0 then
			local var_4_1 = pg.island_camera_photo_frame[arg_3_0.selectFrameId]

			pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeDorm3dPhoto, nil, nil, true, var_4_0:Find("frame").sizeDelta, var_4_1.watermark_location)
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtnTrans, function()
		local var_5_0 = arg_3_0.frameDic[arg_3_0.selectFrameId]

		if var_5_0 then
			local var_5_1 = pg.ShareMgr.GetInstance()
			local var_5_2 = var_5_0:Find("frame").sizeDelta

			if pg.island_camera_photo_frame[arg_3_0.selectFrameId].frameTfName == "IslandWoodFrame" then
				local var_5_3 = var_5_0:Find("frame"):GetComponent("Image").sprite
				local var_5_4 = var_5_0:Find("mask").sizeDelta
				local var_5_5 = Object.Instantiate(var_5_3.texture)
				local var_5_6 = UnityEngine.Texture2D.New(var_5_3.rect.width, var_5_3.rect.height)
				local var_5_7 = var_5_5:GetPixels(0, 0, var_5_3.rect.width, var_5_3.rect.height)

				var_5_6:SetPixels(var_5_7)
				var_5_6:Apply()
				arg_3_0:TakePhoto(pg.ShareMgr.TypeDorm3dPhoto, var_5_2, var_5_6, var_5_4)
			else
				arg_3_0:TakePhoto(pg.ShareMgr.TypeDorm3dPhoto, var_5_2)
			end
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("Mask"), function()
		arg_3_0:Hide()
	end)
	onButton(arg_3_0, arg_3_0.cancelBtnTrans, function()
		arg_3_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.frameBtn, function()
		arg_3_0:OpenPage(IslandPhotoSelectFramePage, arg_3_0.bytes, arg_3_0.photoTexture, arg_3_0.selectFrameId, function(arg_9_0)
			arg_3_0:AfterSelectFrame(arg_9_0)
		end)
	end)

	arg_3_0.lateFuncDic = {}
	arg_3_0.specialLateFuncDic = {}
end

function var_0_0.OnShow(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.bytes = arg_10_1
	arg_10_0.photoTexture = arg_10_2

	arg_10_0:InitFrame()
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf, {
		staticBlur = true
	})
end

function var_0_0.InitFrame(arg_11_0)
	arg_11_0.selectFrameId = 1001

	for iter_11_0, iter_11_1 in pairs(arg_11_0.frameDic) do
		setActive(iter_11_1, false)
	end

	arg_11_0:LoadFrame({
		0,
		0
	})
end

function var_0_0.AddListeners(arg_12_0)
	return
end

function var_0_0.RemoveListeners(arg_13_0)
	return
end

function var_0_0.AfterSelectFrame(arg_14_0, arg_14_1)
	arg_14_0.selectFrameId = arg_14_1.selectFrameId

	for iter_14_0, iter_14_1 in pairs(arg_14_0.frameDic) do
		setActive(iter_14_1, false)
	end

	arg_14_0:LoadFrame(arg_14_1.imagePos, arg_14_1.imageScale, arg_14_1.specialPosDic)
end

function var_0_0.LoadFrame(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = pg.island_camera_photo_frame[arg_15_0.selectFrameId]
	local var_15_1 = var_15_0.frameTfName == "IslandFilmFrame"
	local var_15_2 = var_15_0.frameTfName == "IslandInsFrame"

	local function var_15_3(arg_16_0)
		local var_16_0 = arg_16_0:Find("mask/realImage")
		local var_16_1 = var_16_0:GetComponent(typeof(RawImage))

		var_16_1.texture = arg_15_0.photoTexture
		var_16_0.sizeDelta = GameObject.Find("OverlayCamera").transform:GetChild(0).sizeDelta

		setAnchoredPosition(var_16_1, {
			x = arg_15_1.x,
			y = arg_15_1.y
		})

		if arg_15_2 then
			var_16_0.localScale = arg_15_2
		end

		if arg_15_3 then
			local var_16_2 = {
				"mask_up/realImage"
			}

			if var_15_1 then
				table.insert(var_16_2, "mask_down/realImage")
			end

			local var_16_3 = {
				"upPos",
				"downPos"
			}
			local var_16_4 = {
				"upScale",
				"downScale"
			}

			for iter_16_0, iter_16_1 in ipairs(var_16_2) do
				local var_16_5 = arg_16_0:Find(iter_16_1)
				local var_16_6 = var_16_5:GetComponent(typeof(RawImage))

				var_16_6.texture = arg_15_0.photoTexture

				local var_16_7 = GameObject.Find("OverlayCamera").transform:GetChild(0)

				if var_15_2 and iter_16_1 == "mask_up/realImage" then
					var_16_5.sizeDelta = Vector2(var_16_7.sizeDelta.x / 10, var_16_7.sizeDelta.y / 10)
				else
					var_16_5.sizeDelta = var_16_7.sizeDelta
				end

				local var_16_8 = var_16_3[iter_16_0]

				setAnchoredPosition(var_16_6, {
					x = arg_15_3[var_16_8].x,
					y = arg_15_3[var_16_8].y
				})

				local var_16_9 = arg_15_3[var_16_4[iter_16_0]]

				if var_16_9 then
					var_16_5.localScale = var_16_9
				end
			end
		end
	end

	local var_15_4 = arg_15_0.frameDic[arg_15_0.selectFrameId]

	if var_15_4 then
		setActive(var_15_4, true)
		var_15_3(var_15_4)

		return
	end

	if arg_15_0.loadingDic[arg_15_0.selectFrameId] then
		return
	end

	local var_15_5 = arg_15_0.selectFrameId
	local var_15_6 = IslandAssetLoadDispatcher.Instance:Enqueue("ui/" .. var_15_0.frameTfName, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_17_0)
		arg_15_0.loadingDic[var_15_5] = false

		local var_17_0 = Object.Instantiate(arg_17_0, arg_15_0.photoAdapter).transform

		arg_15_0.frameDic[var_15_5] = var_17_0
		var_17_0:Find("mask/realImage"):GetComponent(typeof(ScrollRect)).enabled = false
		var_17_0:Find("mask/realImage"):GetComponent(typeof(PinchZoom)).enabled = false

		local var_17_1 = var_17_0:Find("mask_up/realImage")
		local var_17_2 = var_17_0:Find("mask_down/realImage")

		if var_17_1 then
			var_17_1:GetComponent(typeof(PinchZoom)).enabled = false
		end

		if var_17_2 then
			var_17_2:GetComponent(typeof(PinchZoom)).enabled = false
		end

		if arg_15_0.selectFrameId == var_15_5 then
			var_15_3(var_17_0)
		else
			setActive(var_17_0, false)
		end

		var_15_3(var_17_0)
	end), true, true)

	table.insert(arg_15_0.loadingIdList or {}, var_15_6)
end

function var_0_0.TakePhoto(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	local var_18_0 = {}
	local var_18_1 = {}
	local var_18_2 = {}
	local var_18_3 = pg.share_template[arg_18_1]

	assert(var_18_3, "share_template not exist: " .. arg_18_1)
	_.each(var_18_3.hidden_comps, function(arg_19_0)
		local var_19_0 = GameObject.Find(arg_19_0)

		if not IsNil(var_19_0) and var_19_0.activeSelf then
			table.insert(var_18_0, var_19_0)
			var_19_0:SetActive(false)
		end
	end)
	_.each(var_18_3.show_comps, function(arg_20_0)
		local var_20_0 = GameObject.Find(arg_20_0)

		if not IsNil(var_20_0) and not var_20_0.activeSelf then
			table.insert(var_18_1, var_20_0)
			var_20_0:SetActive(true)
		end
	end)
	_.each(var_18_3.move_comps, function(arg_21_0)
		local var_21_0 = GameObject.Find(arg_21_0.path)

		if not IsNil(var_21_0) then
			local var_21_1 = var_21_0.transform.anchoredPosition.x
			local var_21_2 = var_21_0.transform.anchoredPosition.y
			local var_21_3 = arg_21_0.x
			local var_21_4 = arg_21_0.y

			table.insert(var_18_2, {
				var_21_0,
				var_21_1,
				var_21_2
			})
			setAnchoredPosition(var_21_0, {
				x = var_21_3,
				y = var_21_4
			})
		end
	end)

	local var_18_4 = GameObject.Find(var_18_3.camera):GetComponent(typeof(Camera))
	local var_18_5 = var_18_4.transform:GetChild(0)

	local function var_18_6(arg_22_0)
		_.each(var_18_0, function(arg_23_0)
			arg_23_0:SetActive(true)
		end)

		var_18_0 = {}

		_.each(var_18_1, function(arg_24_0)
			arg_24_0:SetActive(false)
		end)

		var_18_1 = {}

		_.each(var_18_2, function(arg_25_0)
			setAnchoredPosition(arg_25_0[1], {
				x = arg_25_0[2],
				y = arg_25_0[3]
			})
		end)

		var_18_2 = {}

		local var_22_0 = arg_18_2.x / var_18_5.sizeDelta.x * Screen.width
		local var_22_1 = arg_18_2.y / var_18_5.sizeDelta.y * Screen.height
		local var_22_2 = UnityEngine.Texture2D.New(var_22_0, var_22_1)
		local var_22_3 = (Screen.width - var_22_0) / 2
		local var_22_4 = (Screen.height - var_22_1) / 2
		local var_22_5 = arg_22_0:GetPixels(var_22_3, var_22_4, var_22_0, var_22_1)

		var_22_2:SetPixels(var_22_5)
		var_22_2:Apply()

		if not arg_18_4 then
			local var_22_6 = Tex2DExtension.EncodeToPNG(var_22_2)

			YSNormalTool.MediaTool.SaveImageWithBytes(var_22_6, function(arg_26_0, arg_26_1)
				if arg_26_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))
				end
			end)

			return
		end

		local var_22_7 = arg_18_4.x / var_18_5.sizeDelta.x * Screen.width
		local var_22_8 = arg_18_4.y / var_18_5.sizeDelta.y * Screen.height
		local var_22_9 = var_22_0 - var_22_7
		local var_22_10 = var_22_1 - var_22_8
		local var_22_11 = var_22_2:GetPixels(var_22_9 / 2, var_22_10 / 2, var_22_7, var_22_8)

		arg_18_3:SetPixels(var_22_9 / 2, var_22_10 / 2, var_22_7, var_22_8, var_22_11)

		local var_22_12 = Tex2DExtension.EncodeToPNG(arg_18_3)

		YSNormalTool.MediaTool.SaveImageWithBytes(var_22_12, function(arg_27_0, arg_27_1)
			if arg_27_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))
			end
		end)
	end

	BLHX.Rendering.HotUpdate.ScreenShooterPass.TakePhoto(var_18_4, var_18_6)
end

function var_0_0.OnHide(arg_28_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_28_0._tf)
end

function var_0_0.OnDestroy(arg_29_0)
	for iter_29_0, iter_29_1 in ipairs(arg_29_0.loadingIdList or {}) do
		IslandAssetLoadDispatcher.Instance:Cancel(iter_29_1)
	end

	arg_29_0.loadingIdList = nil
end

return var_0_0
