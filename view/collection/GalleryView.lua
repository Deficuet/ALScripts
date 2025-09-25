local var_0_0 = class("GalleryView", import("..base.BaseSubView"))

var_0_0.GalleryPicGroupName = "GALLERY_PIC"

function var_0_0.getUIName(arg_1_0)
	return "GalleryUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
	arg_2_0:initCardListPanel()
	arg_2_0:initPicPanel()
	arg_2_0:Show()
	arg_2_0:recoveryFromRunData()
	arg_2_0:tryShowTipMsgBox()
end

function var_0_0.OnDestroy(arg_3_0)
	arg_3_0.resLoader:Clear()

	if arg_3_0.appreciateUnlockMsgBox and arg_3_0.appreciateUnlockMsgBox:CheckState(BaseSubView.STATES.INITED) then
		arg_3_0.appreciateUnlockMsgBox:hideCustomMsgBox()
	end

	if isActive(arg_3_0.picPanel) then
		arg_3_0:closePicPanel(true)
	end

	arg_3_0:stopUpdateEmptyCard()
	arg_3_0:stopUpdateDownBtnPanel()
end

function var_0_0.onBackPressed(arg_4_0)
	if arg_4_0.appreciateUnlockMsgBox and arg_4_0.appreciateUnlockMsgBox:CheckState(BaseSubView.STATES.INITED) then
		arg_4_0.appreciateUnlockMsgBox:hideCustomMsgBox()

		return false
	elseif isActive(arg_4_0.picPanel) then
		arg_4_0:closePicPanel()

		return false
	else
		return true
	end
end

function var_0_0.initData(arg_5_0)
	arg_5_0.appreciateProxy = getProxy(AppreciateProxy)

	arg_5_0.appreciateProxy:checkPicFileState()

	arg_5_0.resLoader = AutoLoader.New()
	arg_5_0.manager = BundleWizard.Inst:GetGroupMgr("GALLERY_PIC")
	arg_5_0.picForShowConfigList = {}
	arg_5_0.cardTFList = {}
	arg_5_0.curPicLikeValue = GalleryConst.Filte_Normal_Value
	arg_5_0.curPicSelectDateValue = GalleryConst.Data_All_Value
	arg_5_0.curPicSortValue = GalleryConst.Sort_Order_Up
	arg_5_0.curMiddleDataIndex = 1
	arg_5_0.curFilteLoadingBGValue = GalleryConst.Loading_BG_NO_Filte
	arg_5_0.downloadCheckIDList = {}
	arg_5_0.downloadCheckTimer = nil
	arg_5_0.picLikeToggleTag = false
end

function var_0_0.findUI(arg_6_0)
	setLocalPosition(arg_6_0._tf, Vector2.zero)

	arg_6_0._tf.anchorMin = Vector2.zero
	arg_6_0._tf.anchorMax = Vector2.one
	arg_6_0._tf.offsetMax = Vector2.zero
	arg_6_0._tf.offsetMin = Vector2.zero
	arg_6_0.topPanel = arg_6_0:findTF("TopPanel")
	arg_6_0.scrollBar = arg_6_0:findTF("Scrollbar")
	arg_6_0.timeFilterToggle = arg_6_0:findTF("List/TimeFilterBtn", arg_6_0.topPanel)
	arg_6_0.timeTextSelected = arg_6_0:findTF("TextSelected", arg_6_0.timeFilterToggle)
	arg_6_0.timeItemContainer = arg_6_0:findTF("Panel", arg_6_0.timeFilterToggle)
	arg_6_0.timeItemTpl = arg_6_0:findTF("Item", arg_6_0.timeItemContainer)

	setActive(arg_6_0.timeFilterToggle, #GalleryConst.DateIndex >= 2)

	arg_6_0.setFilteToggle = arg_6_0:findTF("List/SetFilterBtn", arg_6_0.topPanel)

	setActive(arg_6_0.setFilteToggle, false)

	arg_6_0.setOpenToggle = arg_6_0:findTF("SetToggle")

	setActive(arg_6_0.setOpenToggle, false)

	arg_6_0.likeFilterToggle = arg_6_0:findTF("List/LikeFilterBtn", arg_6_0.topPanel)
	arg_6_0.likeNumText = arg_6_0:findTF("TextNum", arg_6_0.likeFilterToggle)

	setActive(arg_6_0.likeFilterToggle, true)
	setActive(arg_6_0.likeNumText, false)

	arg_6_0.orderToggle = arg_6_0:findTF("List/OrderBtn", arg_6_0.topPanel)
	arg_6_0.resRepaireBtn = arg_6_0:findTF("List/RepaireBtn", arg_6_0.topPanel)
	arg_6_0.progressText = arg_6_0:findTF("TextProgress", arg_6_0.topPanel)
	arg_6_0.scrollPanel = arg_6_0:findTF("Scroll")
	arg_6_0.lScrollPageSC = GetComponent(arg_6_0.scrollPanel, "LScrollPage")
	arg_6_0.picPanel = arg_6_0:findTF("PicPanel")
	arg_6_0.picPanelBG = arg_6_0:findTF("PanelBG", arg_6_0.picPanel)
	arg_6_0.picTopContainer = arg_6_0:findTF("Container", arg_6_0.picPanel)
	arg_6_0.picContainer = arg_6_0:findTF("Container/Picture", arg_6_0.picPanel)
	arg_6_0.picBGImg = arg_6_0:findTF("Container/Picture/PicBG", arg_6_0.picPanel)
	arg_6_0.picImg = arg_6_0:findTF("Container/Picture/Pic", arg_6_0.picPanel)
	arg_6_0.picLikeToggle = arg_6_0:findTF("LikeBtn", arg_6_0.picContainer)
	arg_6_0.picName = arg_6_0:findTF("PicName", arg_6_0.picContainer)
	arg_6_0.picPreBtn = arg_6_0:findTF("PreBtn", arg_6_0.picPanel)
	arg_6_0.picNextBtn = arg_6_0:findTF("NextBtn", arg_6_0.picPanel)

	setActive(arg_6_0.picLikeToggle, true)

	arg_6_0.emptyPanel = arg_6_0:findTF("EmptyPanel")
	arg_6_0.updatePanel = arg_6_0:findTF("UpdatePanel")
end

function var_0_0.addListener(arg_7_0)
	onToggle(arg_7_0, arg_7_0.orderToggle, function(arg_8_0)
		arg_7_0.curMiddleDataIndex = 1

		if arg_8_0 == true then
			arg_7_0.curPicSortValue = GalleryConst.Sort_Order_Down
		else
			arg_7_0.curPicSortValue = GalleryConst.Sort_Order_Up
		end

		arg_7_0:saveRunData()
		arg_7_0:filtePic()
		arg_7_0:updateCardListPanel()
	end, SFX_PANEL)
	onToggle(arg_7_0, arg_7_0.likeFilterToggle, function(arg_9_0)
		arg_7_0.curMiddleDataIndex = 1

		if arg_9_0 == true then
			arg_7_0.curPicLikeValue = GalleryConst.Filte_Like_Value
		else
			arg_7_0.curPicLikeValue = GalleryConst.Filte_Normal_Value
		end

		arg_7_0:saveRunData()
		arg_7_0:filtePic()
		arg_7_0:updateCardListPanel()
	end)
	onButton(arg_7_0, arg_7_0.resRepaireBtn, function()
		local var_10_0 = {
			text = i18n("msgbox_repair"),
			onCallback = function()
				if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-pic.csv") then
					BundleWizard.Inst:GetGroupMgr("GALLERY_PIC"):StartVerifyForLua()
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
				end
			end
		}

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideYes = true,
			content = i18n("resource_verify_warn"),
			custom = {
				var_10_0
			}
		})
	end, SFX_PANEL)
end

function var_0_0.initTimeSelectPanel(arg_12_0)
	arg_12_0.timeSelectUIItemList = UIItemList.New(arg_12_0.timeItemContainer, arg_12_0.timeItemTpl)

	arg_12_0.timeSelectUIItemList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = GalleryConst.DateIndex[arg_13_1 + 1]
			local var_13_1 = GalleryConst.DateIndexName[arg_13_1 + 1]
			local var_13_2 = arg_12_0:findTF("Text", arg_13_2)

			setText(var_13_2, var_13_1)
			onButton(arg_12_0, arg_13_2, function()
				if var_13_0 ~= arg_12_0.curPicSelectDateValue then
					arg_12_0.curPicSelectDateValue = var_13_0
					arg_12_0.curMiddleDataIndex = 1

					arg_12_0:saveRunData()
					setText(arg_12_0.timeTextSelected, var_13_1)
					arg_12_0:filtePic()
					arg_12_0:updateCardListPanel()
				end

				triggerToggle(arg_12_0.timeFilterToggle, false)
			end, SFX_PANEL)
		end
	end)
	arg_12_0.timeSelectUIItemList:align(#GalleryConst.DateIndex)
end

function var_0_0.initCardListPanel(arg_15_0)
	function arg_15_0.lScrollPageSC.itemInitedCallback(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_0 + 1

		arg_15_0.cardTFList[var_16_0] = arg_16_1

		local var_16_1 = arg_16_0 + 1

		if arg_15_0:getPicConfigForShowByIndex(var_16_1) == false then
			arg_15_0:initEmptyCard(arg_16_1)
		else
			arg_15_0:cardUpdate(arg_16_0, arg_16_1)
		end
	end

	function arg_15_0.lScrollPageSC.itemClickCallback(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_0 + 1
		local var_17_1 = arg_15_0:getPicConfigForShowByIndex(var_17_0)

		if var_17_1 then
			local var_17_2 = var_17_1.id
			local var_17_3
			local var_17_4
			local var_17_5 = arg_15_0:isPicExist(var_17_2)

			if arg_15_0:getPicStateByID(var_17_2) == GalleryConst.CardStates.Unlocked and var_17_5 then
				arg_15_0:updatePicImg(var_17_0)
				arg_15_0:openPicPanel()
			end
		end
	end

	function arg_15_0.lScrollPageSC.itemPitchCallback(arg_18_0, arg_18_1)
		arg_15_0:setMovingTag(false)

		local var_18_0 = arg_18_0 + 1

		if arg_15_0.curMiddleDataIndex ~= var_18_0 then
			arg_15_0.curMiddleDataIndex = var_18_0

			arg_15_0:saveRunData()

			if isActive(arg_15_0.picPanel) then
				arg_15_0:switchPicImg(arg_15_0.curMiddleDataIndex)
			end
		end
	end

	function arg_15_0.lScrollPageSC.itemRecycleCallback(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_0 + 1

		arg_15_0.cardTFList[var_19_0] = nil

		local var_19_1 = arg_19_0 + 1

		if arg_15_0:getPicConfigForShowByIndex(var_19_1) == false then
			arg_15_0:stopUpdateEmptyCard(arg_19_1)
		end
	end

	function arg_15_0.lScrollPageSC.itemMoveCallback(arg_20_0)
		if #arg_15_0.picForShowConfigList == 1 then
			setText(arg_15_0.progressText, "1/1")
		else
			setText(arg_15_0.progressText, math.clamp(math.round(arg_20_0 * (#arg_15_0.picForShowConfigList - 1)) + 1, 1, #arg_15_0.picForShowConfigList) .. "/" .. #arg_15_0.picForShowConfigList)
		end
	end
end

function var_0_0.updateCardListPanel(arg_21_0)
	arg_21_0.cardTFList = {}

	arg_21_0.resLoader:Clear()

	local var_21_0 = #arg_21_0.picForShowConfigList <= 0
	local var_21_1 = #arg_21_0.picForShowConfigList == 1 and arg_21_0.picForShowConfigList[1] == false

	setActive(arg_21_0.emptyPanel, var_21_0)
	setActive(arg_21_0.updatePanel, var_21_1)
	setActive(arg_21_0.scrollPanel, not var_21_0 and not var_21_1)
	arg_21_0:stopUpdateDownBtnPanel()

	if not var_21_0 and not var_21_1 then
		setActive(arg_21_0.scrollBar, true)
		setActive(arg_21_0.progressText, true)

		arg_21_0.lScrollPageSC.DataCount = #arg_21_0.picForShowConfigList

		arg_21_0.lScrollPageSC:Init(arg_21_0.curMiddleDataIndex - 1)
	elseif var_21_1 then
		setActive(arg_21_0.scrollBar, false)
		setActive(arg_21_0.progressText, false)
		arg_21_0:initDownBtnPanel()
	end
end

function var_0_0.initDownBtnPanel(arg_22_0)
	local var_22_0 = arg_22_0:findTF("Btn", arg_22_0.updatePanel)
	local var_22_1 = arg_22_0:findTF("Text", var_22_0)
	local var_22_2 = arg_22_0:findTF("Progress", arg_22_0.updatePanel)
	local var_22_3 = arg_22_0:findTF("Slider", var_22_2)

	setActive(var_22_0, true)
	setActive(var_22_2, false)
	onButton(arg_22_0, var_22_0, function()
		warning("click download btn,state:", tostring(arg_22_0.manager.state))

		local var_23_0 = arg_22_0.manager.state

		if var_23_0 == DownloadState.None or var_23_0 == DownloadState.CheckFailure then
			arg_22_0.manager:CheckD()
		elseif var_23_0 == DownloadState.CheckToUpdate or var_23_0 == DownloadState.UpdateFailure then
			local var_23_1 = GroupHelper.GetGroupSize(var_0_0.GalleryPicGroupName)
			local var_23_2 = HashUtil.BytesToString(var_23_1)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_NORMAL,
				content = string.format(i18n("group_download_tip", var_23_2)),
				onYes = function()
					arg_22_0.manager:UpdateD()
				end
			})
		end
	end, SFX_PANEL)
	arg_22_0:startUpdateDownBtnPanel()
end

function var_0_0.updateDownBtnPanel(arg_25_0)
	local var_25_0 = arg_25_0:findTF("Btn", arg_25_0.updatePanel)
	local var_25_1 = arg_25_0:findTF("Text", var_25_0)
	local var_25_2 = arg_25_0:findTF("Progress", arg_25_0.updatePanel)
	local var_25_3 = arg_25_0:findTF("Slider", var_25_2)
	local var_25_4 = arg_25_0.manager.state

	if var_25_4 == DownloadState.None then
		setText(var_25_1, "None")
		setActive(var_25_0, true)
		setActive(var_25_2, false)
	elseif var_25_4 == DownloadState.Checking then
		setText(var_25_1, i18n("word_manga_checking"))
		setActive(var_25_0, true)
		setActive(var_25_2, false)
	elseif var_25_4 == DownloadState.CheckToUpdate then
		setText(var_25_1, i18n("word_manga_checktoupdate"))
		setActive(var_25_0, true)
		setActive(var_25_2, false)
	elseif var_25_4 == DownloadState.CheckOver then
		setText(var_25_1, "Latest Ver")
		setActive(var_25_0, true)
		setActive(var_25_2, false)
	elseif var_25_4 == DownloadState.CheckFailure then
		setText(var_25_1, i18n("word_manga_checkfailure"))
		setActive(var_25_0, true)
		setActive(var_25_2, false)
	elseif var_25_4 == DownloadState.Updating then
		setText(var_25_1, i18n("word_manga_updating", arg_25_0.manager.downloadCount, arg_25_0.manager.downloadTotal))
		setActive(var_25_0, false)
		setActive(var_25_2, true)
		setSlider(var_25_3, 0, arg_25_0.manager.downloadTotal, arg_25_0.manager.downloadCount)
	elseif var_25_4 == DownloadState.UpdateSuccess then
		setText(var_25_1, i18n("word_manga_updatesuccess"))
		setActive(var_25_0, true)
		setActive(var_25_2, false)
		arg_25_0:filtePic()
		arg_25_0:updateCardListPanel()
	elseif var_25_4 == DownloadState.UpdateFailure then
		setText(var_25_1, i18n("word_manga_updatefailure"))
		setActive(var_25_0, true)
		setActive(var_25_2, false)
	end
end

function var_0_0.startUpdateDownBtnPanel(arg_26_0)
	if arg_26_0.downloadCheckTimer then
		arg_26_0.downloadCheckTimer:Stop()
	end

	arg_26_0.downloadCheckTimer = Timer.New(function()
		arg_26_0:updateDownBtnPanel()
	end, 0.5, -1)

	arg_26_0.downloadCheckTimer:Start()
	arg_26_0:updateDownBtnPanel()
end

function var_0_0.stopUpdateDownBtnPanel(arg_28_0)
	if arg_28_0.downloadCheckTimer then
		arg_28_0.downloadCheckTimer:Stop()
	end
end

function var_0_0.initPicPanel(arg_29_0)
	onButton(arg_29_0, arg_29_0.picPanelBG, function()
		arg_29_0:closePicPanel()
	end, SFX_CANCEL)
	addSlip(SLIP_TYPE_HRZ, arg_29_0.picImg, function()
		triggerButton(arg_29_0.picPreBtn)
	end, function()
		triggerButton(arg_29_0.picNextBtn)
	end, function()
		local var_33_0 = arg_29_0.curMiddleDataIndex
		local var_33_1 = arg_29_0:getPicConfigForShowByIndex(var_33_0).id

		arg_29_0:emit(GalleryConst.OPEN_FULL_SCREEN_PIC_VIEW, var_33_1)
	end)
	onButton(arg_29_0, arg_29_0.picPreBtn, function()
		if arg_29_0.isMoving == true then
			return
		end

		local var_34_0 = arg_29_0.curMiddleDataIndex
		local var_34_1

		while var_34_0 > 1 do
			var_34_0 = var_34_0 - 1

			local var_34_2 = arg_29_0:getPicConfigForShowByIndex(var_34_0).id
			local var_34_3 = arg_29_0:isPicExist(var_34_2)
			local var_34_4 = arg_29_0:getPicStateByID(var_34_2)

			if var_34_3 and var_34_4 == GalleryConst.CardStates.Unlocked then
				var_34_1 = var_34_0

				break
			end
		end

		if var_34_1 and var_34_1 > 0 then
			arg_29_0:setMovingTag(true)
			arg_29_0.lScrollPageSC:MoveToItemID(var_34_1 - 1)
		end
	end, SFX_PANEL)
	onButton(arg_29_0, arg_29_0.picNextBtn, function()
		if arg_29_0.isMoving == true then
			return
		end

		local var_35_0 = arg_29_0.curMiddleDataIndex
		local var_35_1

		while var_35_0 < #arg_29_0.picForShowConfigList do
			var_35_0 = var_35_0 + 1

			local var_35_2 = arg_29_0:getPicConfigForShowByIndex(var_35_0).id
			local var_35_3 = arg_29_0:isPicExist(var_35_2)
			local var_35_4 = arg_29_0:getPicStateByID(var_35_2)

			if var_35_3 and var_35_4 == GalleryConst.CardStates.Unlocked then
				var_35_1 = var_35_0

				break
			end
		end

		if var_35_1 and var_35_1 <= #arg_29_0.picForShowConfigList then
			arg_29_0:setMovingTag(true)
			arg_29_0.lScrollPageSC:MoveToItemID(var_35_1 - 1)
		end
	end, SFX_PANEL)
	onToggle(arg_29_0, arg_29_0.picLikeToggle, function(arg_36_0)
		if arg_29_0.picLikeToggleTag == true then
			arg_29_0.picLikeToggleTag = false

			return
		end

		local var_36_0 = arg_29_0:getPicConfigForShowByIndex(arg_29_0.curMiddleDataIndex).id
		local var_36_1 = arg_36_0 == true and 0 or 1

		if var_36_1 == 0 then
			if arg_29_0.appreciateProxy:isLikedByPicID(var_36_0) then
				return
			else
				pg.m02:sendNotification(GAME.APPRECIATE_GALLERY_LIKE, {
					isAdd = 0,
					picID = var_36_0
				})
			end
		elseif var_36_1 == 1 then
			if arg_29_0.appreciateProxy:isLikedByPicID(var_36_0) then
				pg.m02:sendNotification(GAME.APPRECIATE_GALLERY_LIKE, {
					isAdd = 1,
					picID = var_36_0
				})
			else
				return
			end
		end
	end, SFX_PANEL)
end

function var_0_0.updatePicImg(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1 or arg_37_0.curMiddleDataIndex
	local var_37_1 = arg_37_0:getPicConfigForShowByIndex(var_37_0)
	local var_37_2 = var_37_1.id
	local var_37_3 = var_37_1.name
	local var_37_4 = var_37_1.illustration
	local var_37_5 = GalleryConst.PIC_PATH_PREFIX .. var_37_4

	setImageSprite(arg_37_0.picImg, LoadSprite(var_37_5, var_37_4))
	setText(arg_37_0.picName, var_37_3)

	local var_37_6 = arg_37_0.appreciateProxy:isLikedByPicID(var_37_2)

	arg_37_0.picLikeToggleTag = true

	triggerToggle(arg_37_0.picLikeToggle, var_37_6)
end

function var_0_0.switchPicImg(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1 or arg_38_0.curMiddleDataIndex
	local var_38_1 = arg_38_0:getPicConfigForShowByIndex(var_38_0)
	local var_38_2 = var_38_1.id
	local var_38_3 = var_38_1.name
	local var_38_4 = var_38_1.illustration
	local var_38_5 = GalleryConst.PIC_PATH_PREFIX .. var_38_4

	setImageSprite(arg_38_0.picBGImg, LoadSprite(var_38_5, var_38_4))

	local var_38_6 = arg_38_0.appreciateProxy:isLikedByPicID(var_38_2)

	arg_38_0.picLikeToggleTag = true

	triggerToggle(arg_38_0.picLikeToggle, var_38_6)
	LeanTween.value(go(arg_38_0.picImg), 1, 0, 0.5):setOnUpdate(System.Action_float(function(arg_39_0)
		setImageAlpha(arg_38_0.picImg, arg_39_0)
	end)):setOnComplete(System.Action(function()
		setImageFromImage(arg_38_0.picImg, arg_38_0.picBGImg)
		setImageAlpha(arg_38_0.picImg, 1)
	end))
end

function var_0_0.openPicPanel(arg_41_0)
	arg_41_0:BlurPanel(arg_41_0.picPanel)

	arg_41_0.picPanel.offsetMax = arg_41_0._tf.parent.offsetMax
	arg_41_0.picPanel.offsetMin = arg_41_0._tf.parent.offsetMin

	setActive(arg_41_0.picPanel, true)
	LeanTween.value(go(arg_41_0.picTopContainer), 0, 1, 0.3):setOnUpdate(System.Action_float(function(arg_42_0)
		setLocalScale(arg_41_0.picTopContainer, {
			x = arg_42_0,
			y = arg_42_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalScale(arg_41_0.picTopContainer, {
			x = 1,
			y = 1
		})
	end))
end

function var_0_0.closePicPanel(arg_44_0, arg_44_1)
	if arg_44_1 == true then
		arg_44_0:UnOverlayPanel(arg_44_0.picPanel, arg_44_0._tf)
		setActive(arg_44_0.picPanel, false)

		return
	end

	if isActive(arg_44_0.picPanel) then
		LeanTween.value(go(arg_44_0.picTopContainer), 1, 0, 0.3):setOnUpdate(System.Action_float(function(arg_45_0)
			setLocalScale(arg_44_0.picTopContainer, {
				x = arg_45_0,
				y = arg_45_0
			})
		end)):setOnComplete(System.Action(function()
			setLocalScale(arg_44_0.picTopContainer, {
				x = 0,
				y = 0
			})
			arg_44_0:UnOverlayPanel(arg_44_0.picPanel, arg_44_0._tf)
			setActive(arg_44_0.picPanel, false)
		end))
	end
end

function var_0_0.setMovingTag(arg_47_0, arg_47_1)
	arg_47_0.isMoving = arg_47_1
end

function var_0_0.saveRunData(arg_48_0)
	arg_48_0.appreciateProxy:updateGalleryRunData(arg_48_0.curPicSelectDateValue, arg_48_0.curPicSortValue, arg_48_0.curMiddleDataIndex, arg_48_0.curPicLikeValue, arg_48_0.curFilteLoadingBGValue)
end

function var_0_0.recoveryFromRunData(arg_49_0)
	local var_49_0 = arg_49_0.appreciateProxy:getGalleryRunData()

	arg_49_0.curPicSelectDateValue = var_49_0.dateValue
	arg_49_0.curPicSortValue = var_49_0.sortValue
	arg_49_0.curMiddleDataIndex = var_49_0.middleIndex
	arg_49_0.curPicLikeValue = var_49_0.likeValue
	arg_49_0.curFilteLoadingBGValue = var_49_0.bgFilteValue

	setText(arg_49_0.progressText, arg_49_0.curMiddleDataIndex .. "/" .. #arg_49_0.picForShowConfigList)

	local var_49_1 = table.indexof(GalleryConst.DateIndex, arg_49_0.curPicSelectDateValue, 1)
	local var_49_2 = GalleryConst.DateIndexName[var_49_1]

	setText(arg_49_0.timeTextSelected, var_49_2)

	local var_49_3 = arg_49_0.curMiddleDataIndex - 1

	triggerToggle(arg_49_0.likeFilterToggle, arg_49_0.curPicLikeValue == GalleryConst.Filte_Like_Value)
	triggerToggle(arg_49_0.orderToggle, arg_49_0.curPicSortValue == GalleryConst.Sort_Order_Down)
	arg_49_0.lScrollPageSC:MoveToItemID(var_49_3)
end

function var_0_0.tryShowTipMsgBox(arg_50_0)
	if arg_50_0.appreciateProxy:isGalleryHaveNewRes() then
		local function var_50_0()
			PlayerPrefs.SetInt("galleryVersion", GalleryConst.Version)
			arg_50_0:emit(CollectionScene.UPDATE_RED_POINT)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideClose = true,
			hideNo = true,
			content = i18n("res_pic_new_tip", GalleryConst.NewCount),
			onYes = var_50_0,
			onCancel = var_50_0,
			onClose = var_50_0
		})
	end
end

function var_0_0.cardUpdate(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_0:findTF("CardImg", arg_52_2)
	local var_52_1 = arg_52_0:findTF("CardNum/Text", arg_52_2)
	local var_52_2 = arg_52_0:findTF("SelectBtn", arg_52_2)
	local var_52_3 = arg_52_0:findTF("BlackMask", arg_52_2)
	local var_52_4 = arg_52_0:findTF("Update", var_52_3)
	local var_52_5 = arg_52_0:findTF("DownloadBtn", var_52_3)
	local var_52_6 = arg_52_0:findTF("LockImg", var_52_3)
	local var_52_7 = arg_52_0:findTF("TextUnlockTip", var_52_3)
	local var_52_8 = arg_52_0:findTF("UnLockBtn", var_52_3)

	setActive(var_52_4, false)

	local var_52_9 = arg_52_1 + 1
	local var_52_10 = arg_52_0:getPicConfigForShowByIndex(var_52_9)
	local var_52_11 = var_52_10.illustration .. "_t"
	local var_52_12 = GalleryConst.CARD_PATH_PREFIX .. var_52_11

	arg_52_0.resLoader:LoadSprite(var_52_12, var_52_11, var_52_0, false)
	setText(var_52_1, "#" .. var_52_9)

	local var_52_13 = var_52_10.id
	local var_52_14
	local var_52_15
	local var_52_16 = arg_52_0:isPicExist(var_52_13)
	local var_52_17 = arg_52_0:getPicStateByID(var_52_13)

	if var_52_17 == GalleryConst.CardStates.DirectShow then
		print("is impossible to go to this, something wrong")

		if var_52_16 then
			setActive(var_52_2, true)
			setActive(var_52_3, false)
		else
			setActive(var_52_2, false)
			setActive(var_52_3, true)
			setActive(var_52_5, true)
			setActive(var_52_6, false)
			setActive(var_52_7, false)
			setActive(var_52_8, false)
		end
	elseif var_52_17 == GalleryConst.CardStates.Unlocked then
		if var_52_16 then
			local var_52_18 = GalleryConst.GetBGFuncTag()

			setActive(var_52_2, var_52_18)
			setActive(var_52_3, false)
		end
	elseif var_52_17 == GalleryConst.CardStates.Unlockable then
		setActive(var_52_2, false)
		setActive(var_52_3, true)
		setActive(var_52_5, false)
		setActive(var_52_6, true)
		setActive(var_52_7, false)
		setActive(var_52_8, true)
		onButton(arg_52_0, var_52_8, function()
			if not arg_52_0.appreciateUnlockMsgBox then
				arg_52_0.appreciateUnlockMsgBox = AppreciateUnlockMsgBox.New(arg_52_0._tf, arg_52_0.event, arg_52_0.contextData)
			end

			arg_52_0.appreciateUnlockMsgBox:Reset()
			arg_52_0.appreciateUnlockMsgBox:Load()
			arg_52_0.appreciateUnlockMsgBox:ActionInvoke("showCustomMsgBox", {
				content = i18n("res_unlock_tip"),
				items = arg_52_0.appreciateProxy:getPicUnlockMaterialByID(var_52_13),
				onYes = function()
					pg.m02:sendNotification(GAME.APPRECIATE_GALLERY_UNLOCK, {
						picID = var_52_13,
						unlockCBFunc = function()
							arg_52_0:cardUpdate(arg_52_1, arg_52_2)
							arg_52_0.appreciateUnlockMsgBox:hideCustomMsgBox()
						end
					})
				end
			})
		end, SFX_PANEL)
	elseif var_52_17 == GalleryConst.CardStates.DisUnlockable then
		setActive(var_52_2, false)
		setActive(var_52_3, true)
		setActive(var_52_5, false)
		setActive(var_52_6, true)
		setActive(var_52_7, true)
		setActive(var_52_8, false)
		setText(var_52_7, var_52_10.illustrate)
	end
end

function var_0_0.initEmptyCard(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:findTF("CardImg", arg_56_1)
	local var_56_1 = arg_56_0:findTF("CardNum", arg_56_1)
	local var_56_2 = arg_56_0:findTF("SelectBtn", arg_56_1)

	setActive(var_56_0, true)
	setActive(var_56_1, false)
	setActive(var_56_2, false)

	local var_56_3
	local var_56_4

	for iter_56_0, iter_56_1 in ipairs(pg.gallery_config.all) do
		local var_56_5 = pg.gallery_config[iter_56_1].illustration .. "_t"
		local var_56_6 = GalleryConst.CARD_PATH_PREFIX .. var_56_5

		if checkABExist(var_56_6) then
			var_56_3 = var_56_6
			var_56_4 = var_56_5

			break
		end
	end

	arg_56_0.resLoader:LoadSprite(var_56_3, var_56_4, var_56_0, false)

	local var_56_7 = arg_56_0:findTF("BlackMask", arg_56_1)
	local var_56_8 = arg_56_0:findTF("LockImg", var_56_7)
	local var_56_9 = arg_56_0:findTF("TextUnlockTip", var_56_7)
	local var_56_10 = arg_56_0:findTF("UnLockBtn", var_56_7)

	setActive(var_56_7, true)
	setActive(var_56_8, false)
	setActive(var_56_9, false)
	setActive(var_56_10, false)

	local var_56_11 = arg_56_0:findTF("Update", var_56_7)
	local var_56_12 = arg_56_0:findTF("Btn", var_56_11)
	local var_56_13 = arg_56_0:findTF("Progress", var_56_11)
	local var_56_14 = arg_56_0:findTF("Slider", var_56_13)

	setActive(var_56_11, true)
	setActive(var_56_12, true)
	setActive(var_56_13, false)
	onButton(arg_56_0, var_56_12, function()
		warning("click download btn,state:", tostring(arg_56_0.manager.state))

		local var_57_0 = arg_56_0.manager.state

		if var_57_0 == DownloadState.None or var_57_0 == DownloadState.CheckFailure then
			arg_56_0.manager:CheckD()
		elseif var_57_0 == DownloadState.CheckToUpdate or var_57_0 == DownloadState.UpdateFailure then
			local var_57_1 = GroupHelper.GetGroupSize(var_0_0.GalleryPicGroupName)
			local var_57_2 = HashUtil.BytesToString(var_57_1)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_NORMAL,
				content = string.format(i18n("group_download_tip", var_57_2)),
				onYes = function()
					arg_56_0.manager:UpdateD()
				end
			})
		end
	end, SFX_PANEL)
	arg_56_0:startUpdateEmptyCard(arg_56_1)
end

function var_0_0.updateEmptyCard(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0:findTF("BlackMask", arg_59_1)
	local var_59_1 = arg_59_0:findTF("Update", var_59_0)
	local var_59_2 = arg_59_0:findTF("Btn", var_59_1)
	local var_59_3 = arg_59_0:findTF("Text", var_59_2)
	local var_59_4 = arg_59_0:findTF("Progress", var_59_1)
	local var_59_5 = arg_59_0:findTF("Slider", var_59_4)
	local var_59_6 = arg_59_0.manager.state

	if var_59_6 == DownloadState.None then
		setText(var_59_3, "None")
		setActive(var_59_2, true)
		setActive(var_59_4, false)
	elseif var_59_6 == DownloadState.Checking then
		setText(var_59_3, i18n("word_manga_checking"))
		setActive(var_59_2, true)
		setActive(var_59_4, false)
	elseif var_59_6 == DownloadState.CheckToUpdate then
		setText(var_59_3, i18n("word_manga_checktoupdate"))
		setActive(var_59_2, true)
		setActive(var_59_4, false)
	elseif var_59_6 == DownloadState.CheckOver then
		setText(var_59_3, "Latest Ver")
		setActive(var_59_2, true)
		setActive(var_59_4, false)
	elseif var_59_6 == DownloadState.CheckFailure then
		setText(var_59_3, i18n("word_manga_checkfailure"))
		setActive(var_59_2, true)
		setActive(var_59_4, false)
	elseif var_59_6 == DownloadState.Updating then
		setText(var_59_3, i18n("word_manga_updating", arg_59_0.manager.downloadCount, arg_59_0.manager.downloadTotal))
		setActive(var_59_2, false)
		setActive(var_59_4, true)
		setSlider(var_59_5, 0, arg_59_0.manager.downloadTotal, arg_59_0.manager.downloadCount)
	elseif var_59_6 == DownloadState.UpdateSuccess then
		setText(var_59_3, i18n("word_manga_updatesuccess"))
		setActive(var_59_2, true)
		setActive(var_59_4, false)
		arg_59_0:filtePic()
		arg_59_0:updateCardListPanel()
	elseif var_59_6 == DownloadState.UpdateFailure then
		setText(var_59_3, i18n("word_manga_updatefailure"))
		setActive(var_59_2, true)
		setActive(var_59_4, false)
	end
end

function var_0_0.startUpdateEmptyCard(arg_60_0, arg_60_1)
	if arg_60_0.downloadCheckTimer then
		arg_60_0.downloadCheckTimer:Stop()
	end

	arg_60_0.downloadCheckTimer = Timer.New(function()
		arg_60_0:updateEmptyCard(arg_60_1)
	end, 0.5, -1)

	arg_60_0.downloadCheckTimer:Start()
	arg_60_0:updateEmptyCard(arg_60_1)
end

function var_0_0.stopUpdateEmptyCard(arg_62_0, arg_62_1)
	if arg_62_0.downloadCheckTimer then
		arg_62_0.downloadCheckTimer:Stop()
	end
end

function var_0_0.getPicConfigForShowByIndex(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0.picForShowConfigList[arg_63_1]

	if var_63_0 then
		return var_63_0
	elseif var_63_0 == false then
		return false
	else
		assert(false, "不存在的Index:" .. tostring(arg_63_1))
	end
end

function var_0_0.sortPicConfigListForShow(arg_64_0)
	local function var_64_0(arg_65_0, arg_65_1)
		if arg_64_0.curPicSortValue == GalleryConst.Sort_Order_Up then
			if arg_65_0.id < arg_65_1.id then
				return true
			else
				return false
			end
		elseif arg_64_0.curPicSortValue == GalleryConst.Sort_Order_Down then
			if arg_65_0.id < arg_65_1.id then
				return false
			else
				return true
			end
		end
	end

	table.sort(arg_64_0.picForShowConfigList, var_64_0)
end

function var_0_0.isPicExist(arg_66_0, arg_66_1)
	local var_66_0 = pg.gallery_config[arg_66_1].illustration
	local var_66_1 = GalleryConst.PIC_PATH_PREFIX .. var_66_0
	local var_66_2 = arg_66_0.manager:CheckF(var_66_1)
	local var_66_3 = var_66_2 == DownloadState.None or var_66_2 == DownloadState.UpdateSuccess
	local var_66_4 = var_66_1 .. "_t"
	local var_66_5 = arg_66_0.manager:CheckF(var_66_4)
	local var_66_6 = var_66_5 == DownloadState.None or var_66_5 == DownloadState.UpdateSuccess

	return var_66_3 and var_66_6
end

function var_0_0.getPicStateByID(arg_67_0, arg_67_1)
	if not arg_67_0.appreciateProxy:isPicNeedUnlockByID(arg_67_1) then
		return GalleryConst.CardStates.Unlocked
	elseif arg_67_0.appreciateProxy:isPicUnlockedByID(arg_67_1) then
		return GalleryConst.CardStates.Unlocked
	elseif arg_67_0.appreciateProxy:isPicUnlockableByID(arg_67_1) then
		return GalleryConst.CardStates.Unlockable
	else
		return GalleryConst.CardStates.DisUnlockable
	end
end

function var_0_0.filtePicForShow(arg_68_0)
	local var_68_0 = {}

	for iter_68_0, iter_68_1 in ipairs(pg.gallery_config.all) do
		if arg_68_0:isPicExist(iter_68_1) then
			local var_68_1 = arg_68_0.appreciateProxy:getSinglePicConfigByID(iter_68_1)

			if arg_68_0.appreciateProxy:isPicNeedUnlockByID(iter_68_1) then
				if not arg_68_0.appreciateProxy:isPicUnlockedByID(iter_68_1) then
					local var_68_2, var_68_3 = arg_68_0.appreciateProxy:isPicUnlockableByID(iter_68_1)

					if var_68_2 then
						var_68_0[#var_68_0 + 1] = var_68_1
					elseif var_68_3 then
						var_68_0[#var_68_0 + 1] = var_68_1
					end
				else
					var_68_0[#var_68_0 + 1] = var_68_1
				end
			else
				var_68_0[#var_68_0 + 1] = var_68_1
			end
		end
	end

	return var_68_0
end

function var_0_0.filtePicForShowByDate(arg_69_0)
	local var_69_0 = arg_69_0.curPicSelectDateValue

	if var_69_0 == GalleryConst.Data_All_Value then
		return arg_69_0:filtePicForShow()
	end

	local var_69_1 = {}

	for iter_69_0, iter_69_1 in ipairs(pg.gallery_config.all) do
		if arg_69_0:isPicExist(iter_69_1) then
			local var_69_2 = arg_69_0.appreciateProxy:getSinglePicConfigByID(iter_69_1)

			if arg_69_0.appreciateProxy:isPicNeedUnlockByID(iter_69_1) then
				if not arg_69_0.appreciateProxy:isPicUnlockedByID(iter_69_1) then
					local var_69_3, var_69_4 = arg_69_0.appreciateProxy:isPicUnlockableByID(iter_69_1)

					if var_69_3 then
						if var_69_0 == var_69_2.year then
							var_69_1[#var_69_1 + 1] = var_69_2
						end
					elseif var_69_4 and var_69_0 == var_69_2.year then
						var_69_1[#var_69_1 + 1] = var_69_2
					end
				elseif var_69_0 == var_69_2.year then
					var_69_1[#var_69_1 + 1] = var_69_2
				end
			elseif var_69_0 == var_69_2.year then
				var_69_1[#var_69_1 + 1] = var_69_2
			end
		end
	end

	return var_69_1
end

function var_0_0.filtePicForShowByLike(arg_70_0)
	if arg_70_0.curPicLikeValue == GalleryConst.Filte_Normal_Value then
		return arg_70_0.picForShowConfigList
	end

	local var_70_0 = {}

	for iter_70_0, iter_70_1 in ipairs(arg_70_0.picForShowConfigList) do
		local var_70_1 = iter_70_1.id

		if arg_70_0.appreciateProxy:isLikedByPicID(var_70_1) then
			var_70_0[#var_70_0 + 1] = iter_70_1
		end
	end

	return var_70_0
end

function var_0_0.filtePicForShowByLoadingBG(arg_71_0)
	if arg_71_0.curFilteLoadingBGValue == GalleryConst.Loading_BG_NO_Filte then
		return arg_71_0.picForShowConfigList
	end

	local var_71_0 = {}

	for iter_71_0, iter_71_1 in ipairs(arg_71_0.picForShowConfigList) do
		local var_71_1 = iter_71_1.id

		if GalleryConst.IsInBGIDList(var_71_1) then
			var_71_0[#var_71_0 + 1] = iter_71_1
		end
	end

	return var_71_0
end

function var_0_0.filtePic(arg_72_0)
	arg_72_0.picForShowConfigList = arg_72_0:filtePicForShow()
	arg_72_0.picForShowConfigList = arg_72_0:filtePicForShowByLike(arg_72_0.curPicLikeValue)

	arg_72_0:sortPicConfigListForShow()

	if arg_72_0:isNeedShowDownBtn() then
		table.insert(arg_72_0.picForShowConfigList, 1, false)
	end
end

function var_0_0.isNeedShowDownBtn(arg_73_0)
	if Application.isEditor then
		return false
	end

	if GroupHelper.IsGroupVerLastest(var_0_0.GalleryPicGroupName) then
		return false
	end

	if not GroupHelper.IsGroupWaitToUpdate(var_0_0.GalleryPicGroupName) then
		return false
	end

	return true
end

return var_0_0
