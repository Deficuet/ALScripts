local var_0_0 = class("MangaView", import("..base.BaseSubView"))

var_0_0.MangaGroupName = "MANGA"

function var_0_0.getUIName(arg_1_0)
	return "MangaUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:addListener()
	arg_2_0:updateBtnList()
	arg_2_0:Show()
	arg_2_0:updatePanel()
	arg_2_0:tryShowTipMsgBox()
end

function var_0_0.OnDestroy(arg_3_0)
	arg_3_0.resLoader:Clear()
	arg_3_0:stopUpdateEmpty()
	arg_3_0:stopUpdateDownloadBtnPanel()
end

function var_0_0.onBackPressed(arg_4_0)
	return true
end

function var_0_0.initData(arg_5_0)
	arg_5_0.appreciateProxy = getProxy(AppreciateProxy)
	arg_5_0.resLoader = AutoLoader.New()
	arg_5_0.isShowNotRead = false
	arg_5_0.isShowLike = false
	arg_5_0.isUpOrder = false
	arg_5_0.group = GroupHelper.GetGroupMgrByName(var_0_0.MangaGroupName)
	arg_5_0.mangaIDListForShow = arg_5_0:getMangaIDListForShow()
end

function var_0_0.initUI(arg_6_0)
	setLocalPosition(arg_6_0._tf, Vector2.zero)

	arg_6_0._tf.anchorMin = Vector2.zero
	arg_6_0._tf.anchorMax = Vector2.one
	arg_6_0._tf.offsetMax = Vector2.zero
	arg_6_0._tf.offsetMin = Vector2.zero

	local var_6_0 = arg_6_0._tf:Find("BtnList")

	arg_6_0.likeFilteBtn = var_6_0:Find("LikeFilterBtn")
	arg_6_0.readFilteBtn = var_6_0:Find("ReadFilteBtn")
	arg_6_0.orderBtn = var_6_0:Find("OrderBtn")
	arg_6_0.repairBtn = var_6_0:Find("RepairBtn")
	arg_6_0.scrollView = arg_6_0._tf:Find("ScrollView")
	arg_6_0.emptyPanel = arg_6_0._tf:Find("EmptyPanel")
	arg_6_0.downloadBtnPanel = arg_6_0._tf:Find("UpdatePanel")
	arg_6_0.mangaContainer = arg_6_0._tf:Find("ScrollView/Content")
	arg_6_0.lScrollRectSC = arg_6_0._tf:Find("ScrollView/Content"):GetComponent("LScrollRect")
	arg_6_0.mangaTpl = arg_6_0._tf:Find("MangaTpl")

	arg_6_0.lScrollRectSC:BeginLayout()
	arg_6_0.lScrollRectSC:EndLayout()
	arg_6_0:initUIText()
end

function var_0_0.initUIText(arg_7_0)
	local var_7_0 = arg_7_0.readFilteBtn:Find("ShowingAll/Text")
	local var_7_1 = arg_7_0.readFilteBtn:Find("ShowingNotRead/Text")
	local var_7_2 = arg_7_0.mangaTpl:Find("Content/Bottom/BottomNotRead/Tag/Text")
	local var_7_3 = arg_7_0.emptyPanel:Find("Text")

	setText(var_7_0, i18n("cartoon_notall"))
	setText(var_7_1, i18n("cartoon_notall"))
	setText(var_7_2, i18n("cartoon_notall"))
	setText(var_7_3, i18n("cartoon_haveno"))
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.likeFilteBtn, function()
		arg_8_0.isShowLike = not arg_8_0.isShowLike
		arg_8_0.mangaIDListForShow = arg_8_0:getMangaIDListForShow()

		arg_8_0:updateBtnList()
		arg_8_0:updatePanel()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.readFilteBtn, function()
		arg_8_0.isShowNotRead = not arg_8_0.isShowNotRead
		arg_8_0.mangaIDListForShow = arg_8_0:getMangaIDListForShow()

		arg_8_0:updateBtnList()
		arg_8_0:updatePanel()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.orderBtn, function()
		arg_8_0.isUpOrder = not arg_8_0.isUpOrder
		arg_8_0.mangaIDListForShow = arg_8_0:getMangaIDListForShow()

		arg_8_0:updateBtnList()
		arg_8_0:updatePanel()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.repairBtn, function()
		local var_12_0 = {
			text = i18n("msgbox_repair"),
			onCallback = function()
				if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-manga.csv") then
					arg_8_0.group:StartVerifyForLua()
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
				end
			end
		}

		if IsUnityEditor then
			PlayerPrefs.SetInt("mangaVersion", 0)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideYes = true,
			content = i18n("resource_verify_warn"),
			custom = {
				var_12_0
			}
		})
	end, SFX_PANEL)
end

function var_0_0.updateMangaTpl(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = tf(arg_14_2)
	local var_14_1 = arg_14_0.mangaIDListForShow[arg_14_1]

	assert(var_14_1, "null mangaID")

	local var_14_2 = var_14_0:Find("Update")

	setActive(var_14_2, false)

	local var_14_3 = var_14_0:Find("Content/Mask/Pic")
	local var_14_4 = var_14_0:Find("Content/Bottom/BottomNew")
	local var_14_5 = var_14_0:Find("Content/Bottom/BottomNotRead")
	local var_14_6 = var_14_0:Find("Content/Bottom/BottomNormal")
	local var_14_7 = var_14_0:Find("Content/Bottom/BottomTip")
	local var_14_8 = var_14_0:Find("TopSpecial")
	local var_14_9 = var_14_4:Find("NumText")
	local var_14_10 = var_14_5:Find("NumText")
	local var_14_11 = var_14_6:Find("NumText")
	local var_14_12 = MangaConst.isMangaEverReadByID(var_14_1)
	local var_14_13 = MangaConst.isMangaNewByID(var_14_1)

	setActive(var_14_7, false)
	setActive(var_14_4, not var_14_12)
	setActive(var_14_5, false)
	setActive(var_14_6, var_14_12)
	setActive(var_14_8, not var_14_12)
	setText(var_14_9, "#" .. pg.cartoon[var_14_1].cartoon_id)
	setText(var_14_10, "#" .. pg.cartoon[var_14_1].cartoon_id)
	setText(var_14_11, "#" .. pg.cartoon[var_14_1].cartoon_id)
	removeOnButton(var_14_0)
	onButton(arg_14_0, var_14_0, function()
		arg_14_0:openMangaViewLayer(arg_14_1)
	end, SFX_PANEL)

	local var_14_14 = pg.cartoon[var_14_1].resource
	local var_14_15 = MangaConst.MANGA_PATH_PREFIX .. var_14_14
	local var_14_16 = GetComponent(var_14_3, "Image").sprite

	if not IsNil(var_14_16) then
		if var_14_16.name ~= var_14_14 then
			arg_14_0.resLoader:LoadSprite(var_14_15, var_14_14, var_14_3, false)
		end
	else
		arg_14_0.resLoader:LoadSprite(var_14_15, var_14_14, var_14_3, false)
	end
end

function var_0_0.initEmpty(arg_16_0, arg_16_1)
	local var_16_0 = tf(arg_16_1)
	local var_16_1 = var_16_0:Find("TopSpecial")

	setActive(var_16_1, false)

	local var_16_2 = var_16_0:Find("Content/Bottom/BottomNew")
	local var_16_3 = var_16_0:Find("Content/Bottom/BottomNotRead")
	local var_16_4 = var_16_0:Find("Content/Bottom/BottomNormal")
	local var_16_5 = var_16_0:Find("Content/Bottom/BottomTip")

	setActive(var_16_2, false)
	setActive(var_16_3, false)
	setActive(var_16_4, false)
	setActive(var_16_5, true)

	local var_16_6 = var_16_0:Find("Update")
	local var_16_7 = var_16_6:Find("Btn")
	local var_16_8 = var_16_6:Find("Progress")
	local var_16_9 = var_16_8:Find("Slider")

	setActive(var_16_6, true)
	setActive(var_16_7, true)
	setActive(var_16_8, false)

	local var_16_10
	local var_16_11

	for iter_16_0, iter_16_1 in ipairs(pg.cartoon.all) do
		local var_16_12 = pg.cartoon[iter_16_1].resource
		local var_16_13 = MangaConst.MANGA_PATH_PREFIX .. var_16_12

		if checkABExist(var_16_13) then
			var_16_10 = var_16_12
			var_16_11 = var_16_13

			break
		end
	end

	local var_16_14 = var_16_0:Find("Content/Mask/Pic")

	arg_16_0.resLoader:LoadSprite(var_16_11, var_16_10, var_16_14, false)
	setText(var_16_5:Find("Text"), "")
	onButton(arg_16_0, var_16_7, function()
		local var_17_0 = arg_16_0.group.state

		if var_17_0 == DownloadState.None or var_17_0 == DownloadState.CheckFailure then
			arg_16_0.group:CheckD()
		elseif var_17_0 == DownloadState.CheckToUpdate or var_17_0 == DownloadState.UpdateFailure then
			local var_17_1 = GroupHelper.GetGroupSize(var_0_0.MangaGroupName)
			local var_17_2 = HashUtil.BytesToString(var_17_1)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_NORMAL,
				content = string.format(i18n("group_download_tip", var_17_2)),
				onYes = function()
					arg_16_0.group:UpdateD()
				end
			})
		end
	end, SFX_PANEL)
	arg_16_0:startUpdateEmpty(arg_16_1)
end

function var_0_0.updateEmpty(arg_19_0, arg_19_1)
	local var_19_0 = tf(arg_19_1):Find("Update")
	local var_19_1 = var_19_0:Find("Btn")
	local var_19_2 = var_19_1:Find("Text")
	local var_19_3 = var_19_0:Find("Progress")
	local var_19_4 = var_19_3:Find("Slider")
	local var_19_5 = arg_19_0.group.state

	if var_19_5 == DownloadState.None then
		setText(var_19_2, "None")
		setActive(var_19_1, true)
		setActive(var_19_3, false)
	elseif var_19_5 == DownloadState.Checking then
		setText(var_19_2, i18n("word_manga_checking"))
		setActive(var_19_1, true)
		setActive(var_19_3, false)
	elseif var_19_5 == DownloadState.CheckToUpdate then
		setText(var_19_2, i18n("word_manga_checktoupdate"))
		setActive(var_19_1, true)
		setActive(var_19_3, false)
	elseif var_19_5 == DownloadState.CheckOver then
		setText(var_19_2, "Latest Ver")
		setActive(var_19_1, true)
		setActive(var_19_3, false)
	elseif var_19_5 == DownloadState.CheckFailure then
		setText(var_19_2, i18n("word_manga_checkfailure"))
		setActive(var_19_1, true)
		setActive(var_19_3, false)
	elseif var_19_5 == DownloadState.Updating then
		setText(var_19_2, i18n("word_manga_updating", arg_19_0.group.downloadCount, arg_19_0.group.downloadTotal))
		setActive(var_19_1, false)
		setActive(var_19_3, true)
		setSlider(var_19_4, 0, arg_19_0.group.downloadTotal, arg_19_0.group.downloadCount)
	elseif var_19_5 == DownloadState.UpdateSuccess then
		setText(var_19_2, i18n("word_manga_updatesuccess"))
		setActive(var_19_1, true)
		setActive(var_19_3, false)

		arg_19_0.mangaIDListForShow = arg_19_0:getMangaIDListForShow()

		arg_19_0:updatePanel()
	elseif var_19_5 == DownloadState.UpdateFailure then
		setText(var_19_2, i18n("word_manga_updatefailure"))
		setActive(var_19_1, true)
		setActive(var_19_3, false)
	end
end

function var_0_0.startUpdateEmpty(arg_20_0, arg_20_1)
	if arg_20_0.timer then
		arg_20_0.timer:Stop()
	end

	arg_20_0.timer = Timer.New(function()
		arg_20_0:updateEmpty(arg_20_1)
	end, 0.5, -1)

	arg_20_0.timer:Start()
	arg_20_0:updateEmpty(arg_20_1)
end

function var_0_0.stopUpdateEmpty(arg_22_0, arg_22_1)
	if arg_22_0.timer then
		arg_22_0.timer:Stop()
	end
end

function var_0_0.updateMangaList(arg_23_0)
	arg_23_0.resLoader:Clear()

	function arg_23_0.lScrollRectSC.onReturnItem(arg_24_0, arg_24_1)
		arg_24_0 = arg_24_0 + 1

		if arg_23_0.mangaIDListForShow[arg_24_0] == false then
			arg_23_0:stopUpdateEmpty(arg_24_1)
		end
	end

	function arg_23_0.lScrollRectSC.onUpdateItem(arg_25_0, arg_25_1)
		arg_25_0 = arg_25_0 + 1

		if arg_23_0.mangaIDListForShow[arg_25_0] == false then
			arg_23_0:initEmpty(arg_25_1)
			arg_23_0:updateEmpty(arg_25_1)
		else
			arg_23_0:updateMangaTpl(arg_25_0, arg_25_1)
		end
	end

	arg_23_0.lScrollRectSC:SetTotalCount(#arg_23_0.mangaIDListForShow)
end

function var_0_0.initDownloadBtnPanel(arg_26_0)
	local var_26_0 = arg_26_0.downloadBtnPanel:Find("Btn")
	local var_26_1 = var_26_0:Find("Text")
	local var_26_2 = arg_26_0.downloadBtnPanel:Find("Progress")
	local var_26_3 = var_26_2:Find("Slider")

	setActive(var_26_0, true)
	setActive(var_26_2, false)
	onButton(arg_26_0, var_26_0, function()
		local var_27_0 = arg_26_0.group.state

		if var_27_0 == DownloadState.None or var_27_0 == DownloadState.CheckFailure then
			arg_26_0.group:CheckD()
		elseif var_27_0 == DownloadState.CheckToUpdate or var_27_0 == DownloadState.UpdateFailure then
			local var_27_1 = GroupHelper.GetGroupSize(var_0_0.MangaGroupName)
			local var_27_2 = HashUtil.BytesToString(var_27_1)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_NORMAL,
				content = string.format(i18n("group_download_tip", var_27_2)),
				onYes = function()
					arg_26_0.group:UpdateD()
				end
			})
		end
	end, SFX_PANEL)
	arg_26_0:startUpdateDownloadBtnPanel()
end

function var_0_0.updateDownloadBtnPanel(arg_29_0)
	local var_29_0 = arg_29_0.downloadBtnPanel:Find("Btn")
	local var_29_1 = var_29_0:Find("Text")
	local var_29_2 = arg_29_0.downloadBtnPanel:Find("Progress")
	local var_29_3 = var_29_2:Find("Slider")
	local var_29_4 = arg_29_0.group.state

	if var_29_4 == DownloadState.None then
		setText(var_29_1, "None")
		setActive(var_29_0, true)
		setActive(var_29_2, false)
	elseif var_29_4 == DownloadState.Checking then
		setText(var_29_1, i18n("word_manga_checking"))
		setActive(var_29_0, true)
		setActive(var_29_2, false)
	elseif var_29_4 == DownloadState.CheckToUpdate then
		setText(var_29_1, i18n("word_manga_checktoupdate"))
		setActive(var_29_0, true)
		setActive(var_29_2, false)
	elseif var_29_4 == DownloadState.CheckOver then
		setText(var_29_1, "Latest Ver")
		setActive(var_29_0, true)
		setActive(var_29_2, false)
	elseif var_29_4 == DownloadState.CheckFailure then
		setText(var_29_1, i18n("word_manga_checkfailure"))
		setActive(var_29_0, true)
		setActive(var_29_2, false)
	elseif var_29_4 == DownloadState.Updating then
		setText(var_29_1, i18n("word_manga_updating", arg_29_0.group.downloadCount, arg_29_0.group.downloadTotal))
		setActive(var_29_0, false)
		setActive(var_29_2, true)
		setSlider(var_29_3, 0, arg_29_0.group.downloadTotal, arg_29_0.group.downloadCount)
	elseif var_29_4 == DownloadState.UpdateSuccess then
		setText(var_29_1, i18n("word_manga_updatesuccess"))
		setActive(var_29_0, true)
		setActive(var_29_2, false)

		arg_29_0.mangaIDListForShow = arg_29_0:getMangaIDListForShow()

		arg_29_0:updatePanel()
	elseif var_29_4 == DownloadState.UpdateFailure then
		setText(var_29_1, i18n("word_manga_updatefailure"))
		setActive(var_29_0, true)
		setActive(var_29_2, false)
	end
end

function var_0_0.startUpdateDownloadBtnPanel(arg_30_0)
	if arg_30_0.timer then
		arg_30_0.timer:Stop()
	end

	arg_30_0.timer = Timer.New(function()
		arg_30_0:updateDownloadBtnPanel()
	end, 0.5, -1)

	arg_30_0.timer:Start()
	arg_30_0:updateDownloadBtnPanel()
end

function var_0_0.stopUpdateDownloadBtnPanel(arg_32_0)
	if arg_32_0.timer then
		arg_32_0.timer:Stop()
	end
end

function var_0_0.updatePanel(arg_33_0)
	local var_33_0 = #arg_33_0.mangaIDListForShow <= 0
	local var_33_1 = #arg_33_0.mangaIDListForShow == 1 and arg_33_0.mangaIDListForShow[1] == false

	setActive(arg_33_0.emptyPanel, var_33_0)
	setActive(arg_33_0.downloadBtnPanel, var_33_1)
	setActive(arg_33_0.scrollView, not var_33_0 and not var_33_1)
	arg_33_0:stopUpdateEmpty()
	arg_33_0:stopUpdateDownloadBtnPanel()

	if not var_33_0 and not var_33_1 then
		arg_33_0:updateMangaList()
	elseif var_33_1 then
		arg_33_0:initDownloadBtnPanel()
	end
end

function var_0_0.updateBtnList(arg_34_0)
	local var_34_0 = arg_34_0.likeFilteBtn:Find("On")

	setActive(var_34_0, arg_34_0.isShowLike)

	local var_34_1 = arg_34_0.readFilteBtn:Find("ShowingAll")
	local var_34_2 = arg_34_0.readFilteBtn:Find("ShowingNotRead")

	setActive(var_34_1, not arg_34_0.isShowNotRead)
	setActive(var_34_2, arg_34_0.isShowNotRead)

	local var_34_3 = arg_34_0.orderBtn:Find("Up")
	local var_34_4 = arg_34_0.orderBtn:Find("Down")

	setActive(var_34_3, arg_34_0.isUpOrder)
	setActive(var_34_4, not arg_34_0.isUpOrder)
end

function var_0_0.tryShowTipMsgBox(arg_35_0)
	if arg_35_0.appreciateProxy:isMangaHaveNewRes() then
		local function var_35_0()
			PlayerPrefs.SetInt("mangaVersion", MangaConst.Version)
			arg_35_0:emit(CollectionScene.UPDATE_RED_POINT)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideClose = true,
			hideNo = true,
			content = i18n("res_cartoon_new_tip", MangaConst.NewCount),
			onYes = var_35_0,
			onCancel = var_35_0,
			onClose = var_35_0
		})
	end
end

function var_0_0.openMangaViewLayer(arg_37_0, arg_37_1)
	LoadContextCommand.LoadLayerOnTopContext(Context.New({
		mediator = MangaFullScreenMediator,
		viewComponent = MangaFullScreenLayer,
		data = {
			mangaIndex = arg_37_1,
			mangaIDLIst = arg_37_0.mangaIDListForShow,
			mangaContext = arg_37_0,
			isShowingNotRead = isActive(arg_37_0.readFilteBtn:Find("ShowingNotRead"))
		},
		onRemoved = function()
			return
		end
	}))
end

function var_0_0.updateLineAfterRead(arg_39_0, arg_39_1)
	local var_39_0 = table.indexof(arg_39_0.mangaIDListForShow, arg_39_1) - 1
	local var_39_1 = arg_39_0.mangaContainer:Find(tostring(var_39_0))

	if var_39_1 then
		local var_39_2 = var_39_1:Find("Content/Bottom/BottomNew")
		local var_39_3 = var_39_1:Find("Content/Bottom/BottomNotRead")
		local var_39_4 = var_39_1:Find("Content/Bottom/BottomNormal")
		local var_39_5 = var_39_1:Find("TopSpecial")
		local var_39_6 = MangaConst.isMangaEverReadByID(arg_39_1)
		local var_39_7 = MangaConst.isMangaNewByID(arg_39_1)

		setActive(var_39_2, var_39_7 and not var_39_6)
		setActive(var_39_3, not var_39_7 and not var_39_6)
		setActive(var_39_4, var_39_6)
		setActive(var_39_5, not var_39_6)
	end
end

function var_0_0.updateToMangaID(arg_40_0, arg_40_1)
	local var_40_0 = table.indexof(arg_40_0.mangaIDListForShow, arg_40_1) - 1
	local var_40_1 = arg_40_0.lScrollRectSC:HeadIndexToValue(var_40_0)

	arg_40_0.lScrollRectSC:SetTotalCount(#arg_40_0.mangaIDListForShow, defaultValue(var_40_1, -1))
end

function var_0_0.getMangaIDListForShow(arg_41_0, arg_41_1)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in ipairs(pg.cartoon.all) do
		if arg_41_0:isMangaExist(iter_41_1) then
			local var_41_1 = MangaConst.isMangaEverReadByID(iter_41_1)
			local var_41_2 = MangaConst.isMangaLikeByID(iter_41_1)

			if arg_41_0.isShowNotRead and arg_41_0.isShowLike then
				if not var_41_1 and var_41_2 then
					table.insert(var_41_0, iter_41_1)
				end
			elseif arg_41_0.isShowNotRead and not arg_41_0.isShowLike then
				if not var_41_1 then
					table.insert(var_41_0, iter_41_1)
				end
			elseif not arg_41_0.isShowNotRead and arg_41_0.isShowLike then
				if var_41_2 then
					table.insert(var_41_0, iter_41_1)
				end
			else
				table.insert(var_41_0, iter_41_1)
			end
		end
	end

	local function var_41_3(arg_42_0, arg_42_1)
		local var_42_0 = pg.cartoon[arg_42_0]
		local var_42_1 = pg.cartoon[arg_42_1]
		local var_42_2 = var_42_0.cartoon_id
		local var_42_3 = var_42_1.cartoon_id

		if var_42_3 < var_42_2 then
			return not arg_41_0.isUpOrder
		elseif var_42_2 == var_42_3 then
			return arg_42_0 < arg_42_1
		elseif var_42_2 < var_42_3 then
			return arg_41_0.isUpOrder
		end
	end

	table.sort(var_41_0, var_41_3)

	if arg_41_0:isNeedShowDownBtn() then
		table.insert(var_41_0, 1, false)
	end

	return var_41_0
end

function var_0_0.isMangaExist(arg_43_0, arg_43_1)
	local var_43_0 = MangaConst.MANGA_PATH_PREFIX .. arg_43_1
	local var_43_1 = arg_43_0.group:CheckF(var_43_0)

	return var_43_1 == DownloadState.None or var_43_1 == DownloadState.UpdateSuccess
end

function var_0_0.isNeedShowDownBtn(arg_44_0)
	if Application.isEditor then
		return false
	end

	if GroupHelper.IsGroupVerLastest(var_0_0.MangaGroupName) then
		return false
	end

	if not GroupHelper.IsGroupWaitToUpdate(var_0_0.MangaGroupName) then
		return false
	end

	return true
end

return var_0_0
