local var_0_0 = class("GalleryScrollView")

var_0_0.GalleryPicGroupName = "GALLERY_PIC"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.owner = arg_1_2
	arg_1_0.scrollPanel = arg_1_1
	arg_1_0.rootTF = arg_1_1.parent
	arg_1_0.isDisposed = false

	arg_1_0:initUIRefs()
	arg_1_0:initData()
	arg_1_0:initScrollCallbacks()
end

function var_0_0.initUIRefs(arg_2_0)
	arg_2_0.progressText = arg_2_0.scrollPanel:Find("TextProgress")
	arg_2_0.lScrollPageSC = GetComponent(arg_2_0.scrollPanel, "LScrollPage")
	arg_2_0.scrollListContainer = arg_2_0.scrollPanel:Find("Content")
end

function var_0_0.initData(arg_3_0)
	arg_3_0.resLoader = AutoLoader.New()
	arg_3_0.cardTFList = {}
	arg_3_0.curMiddleDataIndex = 1
end

function var_0_0.dispose(arg_4_0)
	arg_4_0.isDisposed = true

	arg_4_0.resLoader:Clear()
end

function var_0_0.isDestroyed(arg_5_0)
	return arg_5_0.isDisposed or not arg_5_0.owner or arg_5_0.owner.exited
end

function var_0_0.initScrollCallbacks(arg_6_0)
	function arg_6_0.lScrollPageSC.itemInitedCallback(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_0 + 1

		arg_6_0.cardTFList[var_7_0] = arg_7_1

		if arg_6_0:getPicInfoForShowByIndex(var_7_0) == false then
			arg_6_0:updateEmptyCard(arg_7_1)
		else
			arg_6_0:updateCard(arg_7_0, arg_7_1)
		end
	end

	function arg_6_0.lScrollPageSC.itemClickCallback(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_0 + 1

		if arg_6_0:getPicInfoForShowByIndex(var_8_0) then
			arg_6_0:openPicViewLayer(var_8_0)
		end
	end

	function arg_6_0.lScrollPageSC.itemPitchCallback(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_0 + 1

		if arg_6_0.curMiddleDataIndex ~= var_9_0 then
			arg_6_0.curMiddleDataIndex = var_9_0
		end
	end

	function arg_6_0.lScrollPageSC.itemRecycleCallback(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_0 + 1

		arg_6_0.cardTFList[var_10_0] = nil
	end

	function arg_6_0.lScrollPageSC.itemMoveCallback(arg_11_0)
		local var_11_0 = arg_6_0.owner.picInfoListForShow

		if #var_11_0 == 1 then
			arg_6_0:updateProgressText(1, 1)
		else
			arg_6_0:updateProgressText(math.clamp(math.round(arg_11_0 * (#var_11_0 - 1)) + 1, 1, #var_11_0), #var_11_0)
		end
	end
end

function var_0_0.refresh(arg_12_0, arg_12_1)
	if arg_12_0:isDestroyed() then
		return
	end

	arg_12_1 = arg_12_1 or {}
	arg_12_0.cardTFList = {}

	arg_12_0.resLoader:Clear()
	setActive(arg_12_0.progressText, true)

	arg_12_0.curMiddleDataIndex = math.clamp(arg_12_0.curMiddleDataIndex, 1, #arg_12_1)
	arg_12_0.lScrollPageSC.DataCount = #arg_12_1

	arg_12_0.lScrollPageSC:Init(arg_12_0.curMiddleDataIndex - 1)
end

function var_0_0.resetMiddleDataIndex(arg_13_0)
	arg_13_0.curMiddleDataIndex = 1
end

function var_0_0.openPicViewLayer(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:getPicInfoForShowByIndex(arg_14_1)

	if not var_14_0 then
		return
	end

	LoadContextCommand.LoadLayerOnTopContext(Context.New({
		mediator = AppreciatePicViewMediator,
		viewComponent = AppreciatePicViewLayer,
		data = {
			isShowLikeBtn = true,
			curPicInfo = var_14_0,
			picInfoList = arg_14_0:getPicInfoListForShow(),
			onPicSwitch = function(arg_15_0)
				arg_14_0:moveToPicInfo(arg_15_0)
			end
		},
		onRemoved = function()
			if arg_14_0:isDestroyed() then
				return
			end

			for iter_16_0, iter_16_1 in pairs(arg_14_0.cardTFList) do
				if iter_16_1 then
					local var_16_0 = arg_14_0:getPicInfoForShowByIndex(iter_16_0)

					arg_14_0:updateCardUsedTag(var_16_0, iter_16_1)
				end
			end
		end
	}))
end

function var_0_0.moveToPicInfo(arg_17_0, arg_17_1)
	if arg_17_0:isDestroyed() or not arg_17_1 then
		return
	end

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.owner.picInfoListForShow) do
		if iter_17_1 and iter_17_1.id == arg_17_1.id and iter_17_1.type == arg_17_1.type then
			arg_17_0.curMiddleDataIndex = iter_17_0

			arg_17_0.lScrollPageSC:MoveToItemID(iter_17_0 - 1)

			return
		end
	end
end

function var_0_0.updateProgressText(arg_18_0, arg_18_1, arg_18_2)
	setText(arg_18_0.progressText, arg_18_1 .. "/" .. arg_18_2)
end

function var_0_0.updateCard(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_1 + 1
	local var_19_1 = arg_19_0:getPicInfoForShowByIndex(var_19_0)
	local var_19_2 = arg_19_2:Find("SelectBtn")

	setActive(var_19_2, false)

	local var_19_3 = arg_19_2:Find("BlackMask")

	setActive(var_19_3, false)

	local var_19_4 = arg_19_2:Find("CardNum")
	local var_19_5 = var_19_4:Find("Text")

	setActive(var_19_4, true)
	setText(var_19_5, "#" .. var_19_0)
	arg_19_0:updateCardImg(var_19_1, arg_19_2)
	arg_19_0:updateCardUsedTag(var_19_1, arg_19_2)
end

function var_0_0.updateCardImg(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_2:Find("CardImg")
	local var_20_1 = arg_20_0:getPreviewPicPath(arg_20_1)
	local var_20_2 = GetFileName(var_20_1)

	setActive(var_20_0, true)
	arg_20_0.resLoader:LoadSprite(var_20_1, var_20_2, var_20_0, false)
end

function var_0_0.updateCardUsedTag(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_2:Find("UsedTag")

	setActive(var_21_0, arg_21_0:isPicUsed(arg_21_1))
end

function var_0_0.updateEmptyCard(arg_22_0, arg_22_1)
	local var_22_0

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.owner.picInfoListForShow) do
		if iter_22_1 then
			var_22_0 = iter_22_1

			break
		end
	end

	if not var_22_0 then
		return
	end

	local var_22_1 = arg_22_1:Find("SelectBtn")

	setActive(var_22_1, false)

	local var_22_2 = arg_22_1:Find("BlackMask")

	setActive(var_22_2, true)

	local var_22_3 = arg_22_1:Find("CardNum")

	setActive(var_22_3, false)

	local var_22_4 = arg_22_1:Find("UsedTag")

	setActive(var_22_4, false)
	arg_22_0:updateCardImg(var_22_0, arg_22_1)
	arg_22_0:updateEmptyCardDownloadState(arg_22_1)
end

function var_0_0.updateEmptyCardDownloadState(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1:Find("BlackMask")

	setActive(var_23_0, true)

	local var_23_1 = var_23_0:Find("Update")
	local var_23_2 = var_23_1:Find("Btn")
	local var_23_3 = var_23_2:Find("Text")
	local var_23_4 = var_23_1:Find("Progress")
	local var_23_5 = arg_23_0.owner:isGalleryDownloading()

	setActive(var_23_1, true)
	setActive(var_23_2, not var_23_5)
	setActive(var_23_4, var_23_5)

	if var_23_5 then
		local var_23_6, var_23_7 = arg_23_0.owner:getGalleryDownloadProgress()

		setText(var_23_3, i18n("word_manga_updating", var_23_6, var_23_7))
	elseif arg_23_0.owner:isGalleryDownloadFailed() then
		setText(var_23_3, i18n("word_manga_updatefailure"))
	else
		setText(var_23_3, i18n("word_manga_checktoupdate"))
	end

	onButton(arg_23_0.owner, var_23_2, function()
		arg_23_0.owner:showDownloadMsgBox()
	end, SFX_PANEL)
end

function var_0_0.updateEmptyCardDownloadStateList(arg_25_0)
	if arg_25_0:isDestroyed() then
		return
	end

	for iter_25_0, iter_25_1 in pairs(arg_25_0.cardTFList) do
		if iter_25_1 and arg_25_0:getPicInfoForShowByIndex(iter_25_0) == false then
			arg_25_0:updateEmptyCardDownloadState(iter_25_1)

			break
		end
	end
end

function var_0_0.getPreviewPicPath(arg_26_0, arg_26_1)
	return GalleryConst.GetGalleryPreviewPicPathByID(arg_26_1.id)
end

function var_0_0.isPicUsed(arg_27_0, arg_27_1)
	return AppreciatePicConst.isUsedPicInfo(arg_27_1)
end

function var_0_0.getPicInfoListForShow(arg_28_0)
	local var_28_0 = {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.owner.picInfoListForShow) do
		if iter_28_1 then
			table.insert(var_28_0, iter_28_1)
		end
	end

	return var_28_0
end

function var_0_0.getPicInfoForShowByIndex(arg_29_0, arg_29_1)
	return arg_29_0.owner:getPicInfoForShowByIndex(arg_29_1)
end

return var_0_0
