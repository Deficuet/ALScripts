local var_0_0 = class("IslandOtherCardLayer", import(".IslandSelfCardLayer"))

var_0_0.DOUBLE_CLICK_TIME = 0.5

function var_0_0.getUIName(arg_1_0)
	return "IslandOtherCardUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.contextData.userId

	seriesAsync({
		function(arg_3_0)
			local var_3_0 = getProxy(IslandProxy):GetIsland()

			if var_3_0 then
				arg_2_0.island = var_3_0

				arg_3_0()
			else
				pg.m02:sendNotification(GAME.ISLAND_GET_DATA, {
					isCardRequest = true,
					id = var_2_0,
					list = {},
					callback = function()
						arg_2_0.island = getProxy(IslandProxy):GetIsland()

						arg_3_0()
					end
				})
			end
		end,
		function(arg_5_0)
			pg.m02:sendNotification(GAME.ISLAND_GET_CARD_DATA, {
				userId = var_2_0,
				callback = function(arg_6_0)
					arg_2_0.card = arg_6_0

					arg_5_0()
				end
			})
		end
	}, function()
		arg_2_1()
	end)
end

function var_0_0.init(arg_8_0)
	var_0_0.super.init(arg_8_0)
	setText(arg_8_0._tf:Find("panel/achvs/tpl/empty/Text"), i18n("island_card_no_achv_other"))

	arg_8_0.likeGreyTF = arg_8_0._tf:Find("panel/photo/like_grey")

	local var_8_0 = {
		arg_8_0.photoSwitchBtn,
		arg_8_0.editBtn,
		arg_8_0.diyBtn,
		arg_8_0.setAchvsBtn
	}

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		setActive(iter_8_1, false)
		removeOnButton(iter_8_1)
	end

	arg_8_0.lableFlagLinkTFs = {
		arg_8_0.labelsTF
	}
	arg_8_0.socialFlagLinkTFs = {
		arg_8_0.likeTF,
		arg_8_0.likeGreyTF,
		arg_8_0._tf:Find("panel/btns/visit")
	}
end

function var_0_0.didEnter(arg_9_0)
	var_0_0.super.didEnter(arg_9_0)
	onButton(arg_9_0, arg_9_0._tf:Find("panel/photo/like_btn"), function()
		if not arg_9_0.card:ShowSocial() then
			return
		end

		arg_9_0:GiveLike()
	end)
	onButton(arg_9_0, arg_9_0.addBtn, function()
		if arg_9_0.isFriend then
			return
		end

		arg_9_0.requestFriendBox:ExecuteAction("Show", arg_9_0.card.userId)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.removeBtn, function()
		if not arg_9_0.isFriend then
			return
		end

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
			contentText = i18n("remove_friend_tip"),
			onConfirm = function()
				arg_9_0:emit(IslandOtherCardMediator.REMOVE_FRIEND, arg_9_0.card.userId)
			end
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.whitelistBtn, function()
		if arg_9_0.card.whiteMark then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_repeat_vip"))

			return
		end

		arg_9_0:emit(IslandOtherCardMediator.ADD_WHITE_LIST, arg_9_0.card.userId)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.blacklistBtn, function()
		if arg_9_0.card.blackMark then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_repeat_blacklist"))

			return
		end

		arg_9_0:emit(IslandOtherCardMediator.ADD_BLACK_LIST, arg_9_0.card.userId)
	end, SFX_PANEL)
end

function var_0_0.InitAchvUIList(arg_16_0)
	arg_16_0.achvUIList:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			arg_16_0:UpdataAchvItem(arg_17_1, arg_17_2)
		end
	end)
end

function var_0_0.InitBoxs(arg_18_0)
	arg_18_0.setLabelBox = IslandSetCardLabelBox.New(arg_18_0._tf, arg_18_0.event)
	arg_18_0.requestFriendBox = IslandRequestFriendBox.New(arg_18_0._tf, arg_18_0.event)
end

function var_0_0.Flush(arg_19_0)
	arg_19_0:UpdataPhoto()
	arg_19_0:UpdataLabels()
	arg_19_0:UpdataInfos()
	arg_19_0:FlushFlagTFs()

	arg_19_0.isFriend = getProxy(FriendProxy):isFriend(arg_19_0.card.userId)

	arg_19_0:FlushFriendBtns()
	arg_19_0:FlushLikeTFs()
	setText(arg_19_0.likeGreyTF, arg_19_0.card.likeCnt)
end

function var_0_0.OnSetAchvsDone(arg_20_0, arg_20_1)
	arg_20_0.setAchvsBox:ExecuteAction("Hide")

	arg_20_0.card.achvList = arg_20_1

	arg_20_0.achvUIList:align(var_0_0.ACHV_SHOW_CNT)

	local var_20_0 = {}

	arg_20_0.achvUIList:eachActive(function(arg_21_0, arg_21_1)
		if arg_20_0.card.achvList[arg_21_0 + 1] then
			local var_21_0 = arg_21_1:Find("content/Image")

			var_21_0:GetComponent(typeof(CanvasGroup)).alpha = 0

			table.insert(var_20_0, function(arg_22_0)
				arg_21_1:GetComponent(typeof(Animation)):Play()

				var_21_0:GetComponent(typeof(CanvasGroup)).alpha = 1

				arg_20_0:managedTween(LeanTween.delayedCall, function()
					arg_22_0()
				end, 0.08, nil)
			end)
		end
	end)
	seriesAsync(var_20_0)
end

function var_0_0.FlushFlagTFs(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.lableFlagLinkTFs) do
		setActive(iter_24_1, arg_24_0.card:ShowLabel())
	end

	for iter_24_2, iter_24_3 in ipairs(arg_24_0.socialFlagLinkTFs) do
		setActive(iter_24_3, arg_24_0.card:ShowSocial())
	end
end

function var_0_0.FlushFriendBtns(arg_25_0)
	setActive(arg_25_0.addBtn, not arg_25_0.isFriend)
	setActive(arg_25_0.removeBtn, arg_25_0.isFriend)
end

function var_0_0.FlushLikeTFs(arg_26_0)
	if not arg_26_0.card:ShowSocial() then
		return
	end

	setActive(arg_26_0.likeTF, arg_26_0.card.likeMark)
	setActive(arg_26_0.likeGreyTF, not arg_26_0.card.likeMark)
end

function var_0_0.UpdateGrayLabel(arg_27_0, arg_27_1)
	LoadImageSpriteAtlasAsync("ui/islandcardui_atlas", "bg_label_gray", arg_27_1, true)
	setTextColor(arg_27_1:Find("name"), Color.NewHex("#F7F7F7"))
	setText(arg_27_1:Find("name"), i18n("island_card_edit_label"))
	setText(arg_27_1:Find("value"), "")
	onButton(arg_27_0, arg_27_1, function()
		if arg_27_0.card.labelMark then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_card_label_done"))

			return
		end

		arg_27_0.setLabelBox:ExecuteAction("Show", arg_27_0.card.userId, arg_27_0.card.labelData)
	end, SFX_PANEL)
end

function var_0_0.GiveLike(arg_29_0)
	if arg_29_0.card.likeMark then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_card_like_done"))

		return
	end

	arg_29_0:emit(IslandOtherCardMediator.GIVE_CARD_LIKE, arg_29_0.card.userId)
end

function var_0_0.OnGiveLikeDone(arg_30_0)
	arg_30_0.card.likeCnt = arg_30_0.card.likeCnt + 1

	setText(arg_30_0.likeTF, arg_30_0.card.likeCnt)
	setText(arg_30_0.likeGreyTF, arg_30_0.card.likeCnt)

	arg_30_0.card.likeMark = true

	arg_30_0:FlushLikeTFs()
	arg_30_0.likeTF:GetComponent(typeof(Animation)):Play()
end

function var_0_0.OnGiveLabelDone(arg_31_0, arg_31_1)
	arg_31_0.setLabelBox:ExecuteAction("Hide")
	arg_31_0.card:AddLabel(arg_31_1)

	arg_31_0.card.labelMark = true

	arg_31_0:UpdataLabels()
end

function var_0_0.OnAddFriendDone(arg_32_0, arg_32_1)
	arg_32_0.requestFriendBox:ExecuteAction("Hide")
end

function var_0_0.OnAddFriendPass(arg_33_0, arg_33_1)
	if arg_33_0.card.userId ~= arg_33_1 then
		return
	end

	arg_33_0.isFriend = true

	arg_33_0:FlushFriendBtns()
end

function var_0_0.OnRemoveFriendDone(arg_34_0, arg_34_1)
	arg_34_0.isFriend = false

	arg_34_0:FlushFriendBtns()
end

function var_0_0.OnAccessOpDone(arg_35_0, arg_35_1)
	if arg_35_1 == IslandConst.ACCESS_OP_ADD_WHITELIST then
		arg_35_0.card.whiteMark = true
	elseif arg_35_1 == IslandConst.ACCESS_OP_ADD_BLACKLIST then
		arg_35_0.card.blackMark = true
	end
end

function var_0_0.willExit(arg_36_0)
	if not arg_36_0.contextData.isIslandPage then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_36_0._tf)
	end

	if arg_36_0.setLabelBox then
		arg_36_0.setLabelBox:Destroy()

		arg_36_0.setLabelBox = nil
	end

	if arg_36_0.requestFriendBox then
		arg_36_0.requestFriendBox:Destroy()

		arg_36_0.requestFriendBox = nil
	end
end

return var_0_0
