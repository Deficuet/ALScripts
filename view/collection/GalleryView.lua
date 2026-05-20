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
	arg_6_0.topPanel = arg_6_0._tf:Find("TopPanel")
	arg_6_0.scrollBar = arg_6_0._tf:Find("Scrollbar")
	arg_6_0.timeFilterToggle = arg_6_0.topPanel:Find("List/TimeFilterBtn")
	arg_6_0.timeTextSelected = arg_6_0.timeFilterToggle:Find("TextSelected")
	arg_6_0.timeItemContainer = arg_6_0.timeFilterToggle:Find("Panel")
	arg_6_0.timeItemTpl = arg_6_0.timeItemContainer:Find("Item")

	setActive(arg_6_0.timeFilterToggle, #GalleryConst.DateIndex >= 2)

	arg_6_0.setFilteToggle = arg_6_0.topPanel:Find("List/SetFilterBtn")

	setActive(arg_6_0.setFilteToggle, false)

	arg_6_0.setOpenToggle = arg_6_0._tf:Find("SetToggle")

	setActive(arg_6_0.setOpenToggle, false)

	arg_6_0.likeFilterToggle = arg_6_0.topPanel:Find("List/LikeFilterBtn")
	arg_6_0.likeNumText = arg_6_0.likeFilterToggle:Find("TextNum")

	setActive(arg_6_0.likeFilterToggle, true)
	setActive(arg_6_0.likeNumText, false)

	arg_6_0.orderToggle = arg_6_0.topPanel:Find("List/OrderBtn")
	arg_6_0.resRepaireBtn = arg_6_0.topPanel:Find("List/RepaireBtn")
	arg_6_0.progressText = arg_6_0.topPanel:Find("TextProgress")
	arg_6_0.scrollPanel = arg_6_0._tf:Find("Scroll")
	arg_6_0.lScrollPageSC = GetComponent(arg_6_0.scrollPanel, "LScrollPage")
	arg_6_0.scrollListContainer = arg_6_0.scrollPanel:Find("Content")
	arg_6_0.picPanel = arg_6_0._tf:Find("PicPanel")
	arg_6_0.picPanelBG = arg_6_0.picPanel:Find("PanelBG")
	arg_6_0.picTopContainer = arg_6_0.picPanel:Find("Container")
	arg_6_0.picContainer = arg_6_0.picPanel:Find("Container/Picture")
	arg_6_0.picBGImg = arg_6_0.picPanel:Find("Container/Picture/PicBG")
	arg_6_0.picImg = arg_6_0.picPanel:Find("Container/Picture/Pic")
	arg_6_0.picLikeToggle = arg_6_0.picContainer:Find("LikeBtn")
	arg_6_0.picName = arg_6_0.picContainer:Find("PicName")
	arg_6_0.picPreBtn = arg_6_0.picPanel:Find("PreBtn")
	arg_6_0.picNextBtn = arg_6_0.picPanel:Find("NextBtn")

	setActive(arg_6_0.picLikeToggle, true)

	arg_6_0.picAddLoadingBtn = arg_6_0.picContainer:Find("LoadingBtn/Off")
	arg_6_0.picRemoveLoadingBtn = arg_6_0.picContainer:Find("LoadingBtn/On")
	arg_6_0.emptyPanel = arg_6_0._tf:Find("EmptyPanel")
	arg_6_0.updatePanel = arg_6_0._tf:Find("UpdatePanel")
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
			local var_13_2 = arg_13_2:Find("Text")

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
	local var_22_0 = arg_22_0.updatePanel:Find("Btn")
	local var_22_1 = var_22_0:Find("Text")
	local var_22_2 = arg_22_0.updatePanel:Find("Progress")
	local var_22_3 = var_22_2:Find("Slider")

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
	local var_25_0 = arg_25_0.updatePanel:Find("Btn")
	local var_25_1 = var_25_0:Find("Text")
	local var_25_2 = arg_25_0.updatePanel:Find("Progress")
	local var_25_3 = var_25_2:Find("Slider")
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
	onButton(arg_29_0, arg_29_0.picAddLoadingBtn, function()
		local var_37_0 = arg_29_0:getPicConfigForShowByIndex(arg_29_0.curMiddleDataIndex).id

		arg_29_0:addLoadingPic(var_37_0)
	end, SFX_PANEL)
	onButton(arg_29_0, arg_29_0.picRemoveLoadingBtn, function()
		local var_38_0 = arg_29_0:getPicConfigForShowByIndex(arg_29_0.curMiddleDataIndex).id

		arg_29_0:removeLoadingPic(var_38_0)
	end, SFX_PANEL)
end

function var_0_0.updateLoadingBtn(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:isPicUsed(arg_39_1)

	setActive(arg_39_0.picAddLoadingBtn, not var_39_0)
	setActive(arg_39_0.picRemoveLoadingBtn, var_39_0)
end

function var_0_0.updatePicImg(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1 or arg_40_0.curMiddleDataIndex
	local var_40_1 = arg_40_0:getPicConfigForShowByIndex(var_40_0)
	local var_40_2 = var_40_1.id
	local var_40_3 = var_40_1.name
	local var_40_4 = var_40_1.illustration
	local var_40_5 = GalleryConst.PIC_PATH_PREFIX .. var_40_4

	setImageSprite(arg_40_0.picImg, LoadSprite(var_40_5, var_40_4))
	setText(arg_40_0.picName, var_40_3)
	arg_40_0:updateLoadingBtn(var_40_2)

	local var_40_6 = arg_40_0.appreciateProxy:isLikedByPicID(var_40_2)

	arg_40_0.picLikeToggleTag = true

	triggerToggle(arg_40_0.picLikeToggle, var_40_6)
end

function var_0_0.switchPicImg(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1 or arg_41_0.curMiddleDataIndex
	local var_41_1 = arg_41_0:getPicConfigForShowByIndex(var_41_0)
	local var_41_2 = var_41_1.id
	local var_41_3 = var_41_1.name
	local var_41_4 = var_41_1.illustration
	local var_41_5 = GalleryConst.PIC_PATH_PREFIX .. var_41_4

	setImageSprite(arg_41_0.picBGImg, LoadSprite(var_41_5, var_41_4))

	local var_41_6 = arg_41_0.appreciateProxy:isLikedByPicID(var_41_2)

	arg_41_0.picLikeToggleTag = true

	triggerToggle(arg_41_0.picLikeToggle, var_41_6)
	arg_41_0:updateLoadingBtn(var_41_2)
	LeanTween.value(go(arg_41_0.picImg), 1, 0, 0.5):setOnUpdate(System.Action_float(function(arg_42_0)
		setImageAlpha(arg_41_0.picImg, arg_42_0)
	end)):setOnComplete(System.Action(function()
		setImageFromImage(arg_41_0.picImg, arg_41_0.picBGImg)
		setImageAlpha(arg_41_0.picImg, 1)
	end))
end

function var_0_0.openPicPanel(arg_44_0)
	arg_44_0:BlurPanel(arg_44_0.picPanel)

	arg_44_0.picPanel.offsetMax = arg_44_0._tf.parent.offsetMax
	arg_44_0.picPanel.offsetMin = arg_44_0._tf.parent.offsetMin

	setActive(arg_44_0.picPanel, true)
	LeanTween.value(go(arg_44_0.picTopContainer), 0, 1, 0.3):setOnUpdate(System.Action_float(function(arg_45_0)
		setLocalScale(arg_44_0.picTopContainer, {
			x = arg_45_0,
			y = arg_45_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalScale(arg_44_0.picTopContainer, {
			x = 1,
			y = 1
		})
	end))
end

function var_0_0.closePicPanel(arg_47_0, arg_47_1)
	if arg_47_1 == true then
		arg_47_0:UnOverlayPanel(arg_47_0.picPanel, arg_47_0._tf)
		setActive(arg_47_0.picPanel, false)

		return
	end

	if isActive(arg_47_0.picPanel) then
		LeanTween.value(go(arg_47_0.picTopContainer), 1, 0, 0.3):setOnUpdate(System.Action_float(function(arg_48_0)
			setLocalScale(arg_47_0.picTopContainer, {
				x = arg_48_0,
				y = arg_48_0
			})
		end)):setOnComplete(System.Action(function()
			setLocalScale(arg_47_0.picTopContainer, {
				x = 0,
				y = 0
			})
			arg_47_0:UnOverlayPanel(arg_47_0.picPanel, arg_47_0._tf)
			setActive(arg_47_0.picPanel, false)
		end))
	end
end

function var_0_0.setMovingTag(arg_50_0, arg_50_1)
	arg_50_0.isMoving = arg_50_1
end

function var_0_0.saveRunData(arg_51_0)
	arg_51_0.appreciateProxy:updateGalleryRunData(arg_51_0.curPicSelectDateValue, arg_51_0.curPicSortValue, arg_51_0.curMiddleDataIndex, arg_51_0.curPicLikeValue, arg_51_0.curFilteLoadingBGValue)
end

function var_0_0.recoveryFromRunData(arg_52_0)
	local var_52_0 = arg_52_0.appreciateProxy:getGalleryRunData()

	arg_52_0.curPicSelectDateValue = var_52_0.dateValue
	arg_52_0.curPicSortValue = var_52_0.sortValue
	arg_52_0.curMiddleDataIndex = var_52_0.middleIndex
	arg_52_0.curPicLikeValue = var_52_0.likeValue
	arg_52_0.curFilteLoadingBGValue = var_52_0.bgFilteValue

	setText(arg_52_0.progressText, arg_52_0.curMiddleDataIndex .. "/" .. #arg_52_0.picForShowConfigList)

	local var_52_1 = table.indexof(GalleryConst.DateIndex, arg_52_0.curPicSelectDateValue, 1)
	local var_52_2 = GalleryConst.DateIndexName[var_52_1]

	setText(arg_52_0.timeTextSelected, var_52_2)

	local var_52_3 = arg_52_0.curMiddleDataIndex - 1

	triggerToggle(arg_52_0.likeFilterToggle, arg_52_0.curPicLikeValue == GalleryConst.Filte_Like_Value)
	triggerToggle(arg_52_0.orderToggle, arg_52_0.curPicSortValue == GalleryConst.Sort_Order_Down)
	arg_52_0.lScrollPageSC:MoveToItemID(var_52_3)
end

function var_0_0.tryShowTipMsgBox(arg_53_0)
	if arg_53_0.appreciateProxy:isGalleryHaveNewRes() then
		local function var_53_0()
			PlayerPrefs.SetInt("galleryVersion", GalleryConst.Version)
			arg_53_0:emit(CollectionScene.UPDATE_RED_POINT)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideClose = true,
			hideNo = true,
			content = i18n("res_pic_new_tip", GalleryConst.NewCount),
			onYes = var_53_0,
			onCancel = var_53_0,
			onClose = var_53_0
		})
	end
end

function var_0_0.cardUpdate(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = arg_55_2:Find("CardImg")
	local var_55_1 = arg_55_2:Find("CardNum/Text")
	local var_55_2 = arg_55_2:Find("SelectBtn")

	setActive(var_55_2, false)

	local var_55_3 = arg_55_2:Find("UsedTag")
	local var_55_4 = arg_55_2:Find("BlackMask")
	local var_55_5 = var_55_4:Find("Update")
	local var_55_6 = var_55_4:Find("DownloadBtn")
	local var_55_7 = var_55_4:Find("LockImg")
	local var_55_8 = var_55_4:Find("TextUnlockTip")
	local var_55_9 = var_55_4:Find("UnLockBtn")

	setActive(var_55_5, false)

	local var_55_10 = arg_55_1 + 1
	local var_55_11 = arg_55_0:getPicConfigForShowByIndex(var_55_10)
	local var_55_12 = var_55_11.illustration .. "_t"
	local var_55_13 = GalleryConst.CARD_PATH_PREFIX .. var_55_12

	arg_55_0.resLoader:LoadSprite(var_55_13, var_55_12, var_55_0, false)
	setText(var_55_1, "#" .. var_55_10)

	local var_55_14 = var_55_11.id
	local var_55_15
	local var_55_16
	local var_55_17 = arg_55_0:isPicExist(var_55_14)
	local var_55_18 = arg_55_0:getPicStateByID(var_55_14)

	if var_55_18 == GalleryConst.CardStates.DirectShow then
		print("is impossible to go to this, something wrong")

		if var_55_17 then
			setActive(var_55_4, false)
		else
			setActive(var_55_4, true)
			setActive(var_55_6, true)
			setActive(var_55_7, false)
			setActive(var_55_8, false)
			setActive(var_55_9, false)
		end
	elseif var_55_18 == GalleryConst.CardStates.Unlocked then
		if var_55_17 then
			local var_55_19 = getProxy(LoadingPicProxy):getDiyModeOpenFlag()
			local var_55_20 = table.contains(getProxy(LoadingPicProxy):getGalleryPicIDList(), var_55_14)

			setActive(var_55_3, var_55_19 and var_55_20)
			setActive(var_55_4, false)
		end
	elseif var_55_18 == GalleryConst.CardStates.Unlockable then
		setActive(var_55_2, false)
		setActive(var_55_4, true)
		setActive(var_55_6, false)
		setActive(var_55_7, true)
		setActive(var_55_8, false)
		setActive(var_55_9, true)
		onButton(arg_55_0, var_55_9, function()
			if not arg_55_0.appreciateUnlockMsgBox then
				arg_55_0.appreciateUnlockMsgBox = AppreciateUnlockMsgBox.New(arg_55_0._tf, arg_55_0.event, arg_55_0.contextData)
			end

			arg_55_0.appreciateUnlockMsgBox:Reset()
			arg_55_0.appreciateUnlockMsgBox:Load()
			arg_55_0.appreciateUnlockMsgBox:ActionInvoke("showCustomMsgBox", {
				content = i18n("res_unlock_tip"),
				items = arg_55_0.appreciateProxy:getPicUnlockMaterialByID(var_55_14),
				onYes = function()
					pg.m02:sendNotification(GAME.APPRECIATE_GALLERY_UNLOCK, {
						picID = var_55_14,
						unlockCBFunc = function()
							arg_55_0:cardUpdate(arg_55_1, arg_55_2)
							arg_55_0.appreciateUnlockMsgBox:hideCustomMsgBox()
						end
					})
				end
			})
		end, SFX_PANEL)
	elseif var_55_18 == GalleryConst.CardStates.DisUnlockable then
		setActive(var_55_2, false)
		setActive(var_55_4, true)
		setActive(var_55_6, false)
		setActive(var_55_7, true)
		setActive(var_55_8, true)
		setActive(var_55_9, false)
		setText(var_55_8, var_55_11.illustrate)
	end
end

function var_0_0.updateCurCardLoadingBtn(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_1 and tostring(arg_59_1 - 1) or tostring(arg_59_0.curMiddleDataIndex - 1)
	local var_59_1 = arg_59_0.scrollListContainer:Find(var_59_0):Find("UsedTag")
	local var_59_2 = arg_59_0:getPicConfigForShowByIndex(arg_59_1 or arg_59_0.curMiddleDataIndex).id

	setActive(var_59_1, arg_59_0:isPicUsed(var_59_2))
end

function var_0_0.initEmptyCard(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1:Find("CardImg")
	local var_60_1 = arg_60_1:Find("CardNum")
	local var_60_2 = arg_60_1:Find("SelectBtn")
	local var_60_3 = arg_60_1:Find("UsedTag")

	setActive(var_60_0, true)
	setActive(var_60_1, false)
	setActive(var_60_2, false)
	setActive(var_60_3, false)

	local var_60_4
	local var_60_5

	for iter_60_0, iter_60_1 in ipairs(pg.gallery_config.all) do
		local var_60_6 = pg.gallery_config[iter_60_1].illustration .. "_t"
		local var_60_7 = GalleryConst.CARD_PATH_PREFIX .. var_60_6

		if checkABExist(var_60_7) then
			var_60_4 = var_60_7
			var_60_5 = var_60_6

			break
		end
	end

	arg_60_0.resLoader:LoadSprite(var_60_4, var_60_5, var_60_0, false)

	local var_60_8 = arg_60_1:Find("BlackMask")
	local var_60_9 = var_60_8:Find("LockImg")
	local var_60_10 = var_60_8:Find("TextUnlockTip")
	local var_60_11 = var_60_8:Find("UnLockBtn")

	setActive(var_60_8, true)
	setActive(var_60_9, false)
	setActive(var_60_10, false)
	setActive(var_60_11, false)

	local var_60_12 = var_60_8:Find("Update")
	local var_60_13 = var_60_12:Find("Btn")
	local var_60_14 = var_60_12:Find("Progress")
	local var_60_15 = var_60_14:Find("Slider")

	setActive(var_60_12, true)
	setActive(var_60_13, true)
	setActive(var_60_14, false)
	onButton(arg_60_0, var_60_13, function()
		warning("click download btn,state:", tostring(arg_60_0.manager.state))

		local var_61_0 = arg_60_0.manager.state

		if var_61_0 == DownloadState.None or var_61_0 == DownloadState.CheckFailure then
			arg_60_0.manager:CheckD()
		elseif var_61_0 == DownloadState.CheckToUpdate or var_61_0 == DownloadState.UpdateFailure then
			local var_61_1 = GroupHelper.GetGroupSize(var_0_0.GalleryPicGroupName)
			local var_61_2 = HashUtil.BytesToString(var_61_1)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_NORMAL,
				content = string.format(i18n("group_download_tip", var_61_2)),
				onYes = function()
					arg_60_0.manager:UpdateD()
				end
			})
		end
	end, SFX_PANEL)
	arg_60_0:startUpdateEmptyCard(arg_60_1)
end

function var_0_0.updateEmptyCard(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_1:Find("BlackMask"):Find("Update")
	local var_63_1 = var_63_0:Find("Btn")
	local var_63_2 = var_63_1:Find("Text")
	local var_63_3 = var_63_0:Find("Progress")
	local var_63_4 = var_63_3:Find("Slider")
	local var_63_5 = arg_63_0.manager.state

	if var_63_5 == DownloadState.None then
		setText(var_63_2, "None")
		setActive(var_63_1, true)
		setActive(var_63_3, false)
	elseif var_63_5 == DownloadState.Checking then
		setText(var_63_2, i18n("word_manga_checking"))
		setActive(var_63_1, true)
		setActive(var_63_3, false)
	elseif var_63_5 == DownloadState.CheckToUpdate then
		setText(var_63_2, i18n("word_manga_checktoupdate"))
		setActive(var_63_1, true)
		setActive(var_63_3, false)
	elseif var_63_5 == DownloadState.CheckOver then
		setText(var_63_2, "Latest Ver")
		setActive(var_63_1, true)
		setActive(var_63_3, false)
	elseif var_63_5 == DownloadState.CheckFailure then
		setText(var_63_2, i18n("word_manga_checkfailure"))
		setActive(var_63_1, true)
		setActive(var_63_3, false)
	elseif var_63_5 == DownloadState.Updating then
		setText(var_63_2, i18n("word_manga_updating", arg_63_0.manager.downloadCount, arg_63_0.manager.downloadTotal))
		setActive(var_63_1, false)
		setActive(var_63_3, true)
		setSlider(var_63_4, 0, arg_63_0.manager.downloadTotal, arg_63_0.manager.downloadCount)
	elseif var_63_5 == DownloadState.UpdateSuccess then
		setText(var_63_2, i18n("word_manga_updatesuccess"))
		setActive(var_63_1, true)
		setActive(var_63_3, false)
		arg_63_0:filtePic()
		arg_63_0:updateCardListPanel()
	elseif var_63_5 == DownloadState.UpdateFailure then
		setText(var_63_2, i18n("word_manga_updatefailure"))
		setActive(var_63_1, true)
		setActive(var_63_3, false)
	end
end

function var_0_0.startUpdateEmptyCard(arg_64_0, arg_64_1)
	if arg_64_0.downloadCheckTimer then
		arg_64_0.downloadCheckTimer:Stop()
	end

	arg_64_0.downloadCheckTimer = Timer.New(function()
		arg_64_0:updateEmptyCard(arg_64_1)
	end, 0.5, -1)

	arg_64_0.downloadCheckTimer:Start()
	arg_64_0:updateEmptyCard(arg_64_1)
end

function var_0_0.stopUpdateEmptyCard(arg_66_0, arg_66_1)
	if arg_66_0.downloadCheckTimer then
		arg_66_0.downloadCheckTimer:Stop()
	end
end

function var_0_0.getPicConfigForShowByIndex(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_0.picForShowConfigList[arg_67_1]

	if var_67_0 then
		return var_67_0
	elseif var_67_0 == false then
		return false
	else
		assert(false, "不存在的Index:" .. tostring(arg_67_1))
	end
end

function var_0_0.sortPicConfigListForShow(arg_68_0)
	local function var_68_0(arg_69_0, arg_69_1)
		if arg_68_0.curPicSortValue == GalleryConst.Sort_Order_Up then
			if arg_69_0.id < arg_69_1.id then
				return true
			else
				return false
			end
		elseif arg_68_0.curPicSortValue == GalleryConst.Sort_Order_Down then
			if arg_69_0.id < arg_69_1.id then
				return false
			else
				return true
			end
		end
	end

	table.sort(arg_68_0.picForShowConfigList, var_68_0)
end

function var_0_0.isPicExist(arg_70_0, arg_70_1)
	local var_70_0 = pg.gallery_config[arg_70_1].illustration
	local var_70_1 = GalleryConst.PIC_PATH_PREFIX .. var_70_0
	local var_70_2 = arg_70_0.manager:CheckF(var_70_1)
	local var_70_3 = var_70_2 == DownloadState.None or var_70_2 == DownloadState.UpdateSuccess
	local var_70_4 = var_70_1 .. "_t"
	local var_70_5 = arg_70_0.manager:CheckF(var_70_4)
	local var_70_6 = var_70_5 == DownloadState.None or var_70_5 == DownloadState.UpdateSuccess

	return var_70_3 and var_70_6
end

function var_0_0.getPicStateByID(arg_71_0, arg_71_1)
	if not arg_71_0.appreciateProxy:isPicNeedUnlockByID(arg_71_1) then
		return GalleryConst.CardStates.Unlocked
	elseif arg_71_0.appreciateProxy:isPicUnlockedByID(arg_71_1) then
		return GalleryConst.CardStates.Unlocked
	elseif arg_71_0.appreciateProxy:isPicUnlockableByID(arg_71_1) then
		return GalleryConst.CardStates.Unlockable
	else
		return GalleryConst.CardStates.DisUnlockable
	end
end

function var_0_0.filtePicForShow(arg_72_0)
	local var_72_0 = {}

	for iter_72_0, iter_72_1 in ipairs(pg.gallery_config.all) do
		if arg_72_0:isPicExist(iter_72_1) then
			local var_72_1 = arg_72_0.appreciateProxy:getSinglePicConfigByID(iter_72_1)

			if arg_72_0.appreciateProxy:isPicNeedUnlockByID(iter_72_1) then
				if not arg_72_0.appreciateProxy:isPicUnlockedByID(iter_72_1) then
					local var_72_2, var_72_3 = arg_72_0.appreciateProxy:isPicUnlockableByID(iter_72_1)

					if var_72_2 then
						var_72_0[#var_72_0 + 1] = var_72_1
					elseif var_72_3 then
						var_72_0[#var_72_0 + 1] = var_72_1
					end
				else
					var_72_0[#var_72_0 + 1] = var_72_1
				end
			else
				var_72_0[#var_72_0 + 1] = var_72_1
			end
		end
	end

	return var_72_0
end

function var_0_0.filtePicForShowByDate(arg_73_0)
	local var_73_0 = arg_73_0.curPicSelectDateValue

	if var_73_0 == GalleryConst.Data_All_Value then
		return arg_73_0:filtePicForShow()
	end

	local var_73_1 = {}

	for iter_73_0, iter_73_1 in ipairs(pg.gallery_config.all) do
		if arg_73_0:isPicExist(iter_73_1) then
			local var_73_2 = arg_73_0.appreciateProxy:getSinglePicConfigByID(iter_73_1)

			if arg_73_0.appreciateProxy:isPicNeedUnlockByID(iter_73_1) then
				if not arg_73_0.appreciateProxy:isPicUnlockedByID(iter_73_1) then
					local var_73_3, var_73_4 = arg_73_0.appreciateProxy:isPicUnlockableByID(iter_73_1)

					if var_73_3 then
						if var_73_0 == var_73_2.year then
							var_73_1[#var_73_1 + 1] = var_73_2
						end
					elseif var_73_4 and var_73_0 == var_73_2.year then
						var_73_1[#var_73_1 + 1] = var_73_2
					end
				elseif var_73_0 == var_73_2.year then
					var_73_1[#var_73_1 + 1] = var_73_2
				end
			elseif var_73_0 == var_73_2.year then
				var_73_1[#var_73_1 + 1] = var_73_2
			end
		end
	end

	return var_73_1
end

function var_0_0.filtePicForShowByLike(arg_74_0)
	if arg_74_0.curPicLikeValue == GalleryConst.Filte_Normal_Value then
		return arg_74_0.picForShowConfigList
	end

	local var_74_0 = {}

	for iter_74_0, iter_74_1 in ipairs(arg_74_0.picForShowConfigList) do
		local var_74_1 = iter_74_1.id

		if arg_74_0.appreciateProxy:isLikedByPicID(var_74_1) then
			var_74_0[#var_74_0 + 1] = iter_74_1
		end
	end

	return var_74_0
end

function var_0_0.filtePicForShowByLoadingBG(arg_75_0)
	if arg_75_0.curFilteLoadingBGValue == GalleryConst.Loading_BG_NO_Filte then
		return arg_75_0.picForShowConfigList
	end

	local var_75_0 = {}

	for iter_75_0, iter_75_1 in ipairs(arg_75_0.picForShowConfigList) do
		local var_75_1 = iter_75_1.id

		if GalleryConst.IsInBGIDList(var_75_1) then
			var_75_0[#var_75_0 + 1] = iter_75_1
		end
	end

	return var_75_0
end

function var_0_0.filtePic(arg_76_0)
	arg_76_0.picForShowConfigList = arg_76_0:filtePicForShow()
	arg_76_0.picForShowConfigList = arg_76_0:filtePicForShowByLike(arg_76_0.curPicLikeValue)

	arg_76_0:sortPicConfigListForShow()

	if arg_76_0:isNeedShowDownBtn() then
		table.insert(arg_76_0.picForShowConfigList, 1, false)
	end
end

function var_0_0.isNeedShowDownBtn(arg_77_0)
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

function var_0_0.isPicUsed(arg_78_0, arg_78_1)
	return table.contains(getProxy(LoadingPicProxy):getGalleryPicIDList(true), arg_78_1)
end

function var_0_0.removeLoadingPic(arg_79_0, arg_79_1)
	local var_79_0 = {}
	local var_79_1 = getProxy(LoadingPicProxy):getGalleryPicIDList()

	for iter_79_0, iter_79_1 in ipairs(var_79_1) do
		if iter_79_1 == arg_79_1 then
			table.remove(var_79_1, iter_79_0)

			break
		end
	end

	var_79_0.galleryPicIDList = var_79_1

	function var_79_0.callback()
		arg_79_0:updateLoadingBtn(arg_79_1)
		arg_79_0:updateCurCardLoadingBtn()
	end

	pg.m02:sendNotification(GAME.UPDATE_LOADING_PIC, var_79_0)
end

function var_0_0.addLoadingPic(arg_81_0, arg_81_1)
	if arg_81_0:isPicUsed(arg_81_1) then
		warning("already used.", arg_81_1)

		return
	end

	local var_81_0 = {}
	local var_81_1 = getProxy(LoadingPicProxy):getGalleryPicIDList()

	table.insert(var_81_1, arg_81_1)

	var_81_0.galleryPicIDList = var_81_1

	function var_81_0.callback()
		arg_81_0:updateLoadingBtn(arg_81_1)
		arg_81_0:updateCurCardLoadingBtn()
	end

	pg.m02:sendNotification(GAME.UPDATE_LOADING_PIC, var_81_0)
end

return var_0_0
