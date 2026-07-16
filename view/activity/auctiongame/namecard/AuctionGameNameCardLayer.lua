local var_0_0 = class("AuctionGameNameCardLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AuctioNGameNameCardUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.ysScreenShoter = arg_2_0._tf:GetComponent(typeof(YSTool.YSScreenShoter))

	onButton(arg_2_0, arg_2_0.uiBgBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiCopyBtn, function()
		UniPasteBoard.SetClipBoardString(getProxy(PlayerProxy):getPlayerId())
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_id_copy_ok"))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiShareBtn, function()
		local var_5_0 = getProxy(PlayerProxy)
		local var_5_1 = getProxy(PlayerProxy):getData()

		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildNameCard(1, var_5_1.id))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiSaveBtn, function()
		setActive(pg.UIMgr.GetInstance().OverlayEffect, false)
		setActive(arg_2_0.uiBtnsGo, false)

		local function var_6_0(arg_7_0)
			setActive(pg.UIMgr.GetInstance().OverlayEffect, true)
			setActive(arg_2_0.uiBtnsGo, true)
			YSNormalTool.MediaTool.SaveImageWithBytes(arg_7_0, function(arg_8_0, arg_8_1)
				if arg_8_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))
				end
			end)
		end

		arg_2_0.ysScreenShoter:TakeScreenShotData(tackCallBack, var_6_0)

		local var_6_1 = getProxy(PlayerProxy)
		local var_6_2 = getProxy(PlayerProxy):getData()

		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildNameCard(2, var_6_2.id))
	end, SFX_PANEL)

	arg_2_0.paintingDefaultAngle = arg_2_0.uiPaintingTf.localEulerAngles

	setText(arg_2_0.uiMatchesTitleText, i18n("auction_matches_title"))
	setText(arg_2_0.uiSuccessCntTitleText, i18n("auction_success_cnt_title"))
	setText(arg_2_0.uiSuccessRateTitleText, i18n("auction_success_rate_title"))
	setText(arg_2_0.uiCurrencyTitleText, i18n("auction_currency_title"))
	setText(arg_2_0.uiTotalProfitTitleText, i18n("auction_total_profit_title"))
	setText(arg_2_0.uiHighestProfitTitleText, i18n("auction_highest_profit_title"))
	setText(arg_2_0.uiCollectionTitleText, i18n("auction_collection_type_title"))
	setText(arg_2_0.uiCollectionPriceTitleText, i18n("auction_collection_price_title"))
	setActive(arg_2_0.uiShareBtn, false)
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:OverlayPanel(arg_9_0._tf, {
		pbList = {
			arg_9_0.uiBg
		}
	})

	local var_9_0 = getProxy(PlayerProxy)
	local var_9_1 = getProxy(PlayerProxy):getRawData()

	setText(arg_9_0.uiNameText, var_9_1.name)
	setText(arg_9_0.uiUidText, var_9_1.id)

	local var_9_2 = getProxy(UserProxy):getRawData()
	local var_9_3 = getProxy(ServerProxy):getRawData()[var_9_2 and var_9_2.server or 0]

	setScrollText(arg_9_0.uiServerNameText, var_9_3 and var_9_3.name or "")

	local var_9_4 = getProxy(AuctionGameBaseProxy)
	local var_9_5 = var_9_4.matchNum

	setText(arg_9_0.uiMatchesCntText, var_9_5)
	setText(arg_9_0.uiSuccessCntText, var_9_4.bidSuccessCnt)
	setText(arg_9_0.uiSuccessRateText, string.format("%.2f", var_9_4.totalBidPrice == 0 and 0 or var_9_4.totalCollectionPrice / var_9_4.totalBidPrice))
	setText(arg_9_0.uiCurrencyText, StringHelper.ForamtNumberK(var_9_4.gold))
	setText(arg_9_0.uiTotalProfitText, StringHelper.ForamtNumberK(var_9_4.totalProfit))
	setText(arg_9_0.uiHighestProfitText, StringHelper.ForamtNumberK(var_9_4.highestProfit))
	setText(arg_9_0.uiCollectionText, string.format("<color=#393a3c>%s/</color>%s", var_9_4.unlockCollectionCnt, #pg.auction_collection.all))
	setText(arg_9_0.uiCollectionPriceText, StringHelper.ForamtNumberK(var_9_4.totalCollectionPrice))

	local var_9_6 = var_9_1:GetShipPhantomMarks()[1]

	arg_9_0.shipVO = getProxy(BayProxy):GetShipPhantom(var_9_6)

	setPaintingPrefabAsync(arg_9_0.uiPaintingTf, arg_9_0.shipVO:getPainting(), "biandui", nil, {
		skinID = arg_9_0.shipVO:getSkinId(),
		rotateZ = arg_9_0.paintingDefaultAngle.z
	})
	GetImageSpriteFromAtlasAsync("SquareIcon/" .. arg_9_0.shipVO:getPainting(), "", arg_9_0.uiIcon)
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildNameCard(0, var_9_1.id))
end

function var_0_0.willExit(arg_10_0)
	retPaintingPrefab(arg_10_0.uiPaintingTf, arg_10_0.shipVO:getPainting())
	arg_10_0:UnOverlayPanel(arg_10_0._tf)
end

return var_0_0
