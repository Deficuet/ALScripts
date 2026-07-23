local var_0_0 = class("AuctionGameMainRightPlayerInfo", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	setText(arg_2_0.uiCompleteText, i18n("auction_main_done"))
	setText(arg_2_0.uiOperateText, i18n("auction_main_doing"))
	LoadSpriteAtlasAsync("ui/auctiongameui_atlas", string.format("main_emoji_open"), function(arg_3_0)
		if not IsNil(arg_2_0.uiEmojiImage) then
			arg_2_0.uiEmojiImage.sprite = arg_3_0
		end
	end)
	onButton(arg_2_0, arg_2_0.uiEmojiBtn, function()
		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameMainEmojiLayer,
			mediator = AuctionGameMainEmojiMediator
		}))
	end)
end

function var_0_0.didEnter(arg_5_0, arg_5_1)
	arg_5_0.playerVO = arg_5_1

	setScrollText(arg_5_0.uiNameText, arg_5_1.name)

	local var_5_0

	if arg_5_1.icon == AuctionGameConst.TB_NPC_ID then
		var_5_0 = pg.ship_skin_template[arg_5_1.icon].prefab
	else
		var_5_0 = Ship.New({
			configId = arg_5_1.icon,
			skin_id = arg_5_1.skinId
		}):getPrefab()
	end

	LoadSpriteAsync("qicon/" .. var_5_0, function(arg_6_0)
		if not IsNil(arg_5_0.uiIconImage) then
			arg_5_0.uiIconImage.sprite = arg_6_0
		end
	end)

	local var_5_1 = AttireFrame.attireFrameRes(arg_5_1, false, AttireConst.TYPE_ICON_FRAME, arg_5_1.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. var_5_1, var_5_1, true, function(arg_7_0)
		if IsNil(arg_5_0.uiFrameGo) then
			return
		end

		if arg_5_0.uiFrameGo then
			arg_7_0.name = var_5_1
			findTF(arg_7_0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(arg_7_0, tf(arg_5_0.uiFrameGo), false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. var_5_1, var_5_1, arg_7_0)
		end
	end)
	setActive(arg_5_0.uiEmojiBtn, arg_5_1.id == getProxy(PlayerProxy):getPlayerId())
	arg_5_0:RefreshUI()
	arg_5_0:RefreshEmojiBtn()
end

function var_0_0.RefreshUI(arg_8_0)
	local var_8_0 = getProxy(AuctionGameProxy)
	local var_8_1 = arg_8_0.playerVO
	local var_8_2 = var_8_0:GetPlayerOptStateList()[var_8_1.id]
	local var_8_3 = table.keyof(var_8_0:GetLeaverList(), var_8_1.id) or table.keyof(var_8_0:GetForfeitList(), var_8_1.id) and var_8_0:GetAuctionState() ~= AuctionGameConst.AUCTION_PHASE.PERSONAL_EVENT or var_8_2 == 1 or var_8_2 == 2

	setActive(arg_8_0.uiCompleteGo, var_8_3)
	setActive(arg_8_0.uiOperateGo, not var_8_3)
end

function var_0_0.RefreshEmojiBtn(arg_9_0)
	local var_9_0 = getProxy(AuctionGameProxy):GetSwitchEmojiFlag()

	if arg_9_0.playerVO.id == getProxy(PlayerProxy):getPlayerId() then
		LoadSpriteAtlasAsync("ui/auctiongameui_atlas", var_9_0 == 1 and "main_emoji_close" or "main_emoji_open", function(arg_10_0)
			if not IsNil(arg_9_0.uiEmojiImage) then
				arg_9_0.uiEmojiImage.sprite = arg_10_0
			end
		end)
	end
end

function var_0_0.ShowEmoji(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0.playerVO.id ~= arg_11_1 then
		return
	end

	arg_11_0:ReturnEmoji()

	arg_11_0.emojiID = arg_11_2

	local var_11_0 = pg.emoji_template[arg_11_2]

	PoolMgr.GetInstance():GetPrefab("emoji/" .. var_11_0.pic, var_11_0.pic, true, function(arg_12_0)
		if not IsNil(arg_11_0.uiEmojiTf) then
			arg_12_0.name = var_11_0.pic

			local var_12_0 = arg_12_0:GetComponent(typeof(Image))

			if var_12_0 then
				var_12_0.preserveAspect = true
			end

			tf(arg_12_0).anchoredPosition = Vector2.zero
			rtf(arg_12_0).sizeDelta = Vector2.New(210, 210)

			local var_12_1 = arg_12_0:GetComponent("Animator")

			if var_12_1 then
				var_12_1.enabled = false
			end

			local var_12_2 = arg_12_0:GetComponent("CriManaEffectUI")

			if var_12_2 then
				var_12_2:Pause(true)
			end

			setParent(arg_12_0, arg_11_0.uiEmojiTf)

			arg_11_0.emojiTf = arg_12_0
		else
			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_11_0.pic, var_11_0.pic, arg_12_0)
		end
	end)
	arg_11_0:AddEmojiTimer()
end

function var_0_0.ReturnEmoji(arg_13_0)
	if not arg_13_0.emojiID then
		return
	end

	if not IsNil(arg_13_0.emojiTf) then
		local var_13_0 = pg.emoji_template[arg_13_0.emojiID]

		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_13_0.pic, var_13_0.pic, arg_13_0.emojiTf)

		arg_13_0.emojiTf = nil
	end
end

function var_0_0.AddEmojiTimer(arg_14_0)
	arg_14_0:StopEmojiTimer()
	setActive(arg_14_0.uiEmojiGo, true)

	local var_14_0 = pg.TimeMgr.GetInstance():GetServerTime() + pg.gameset.auction_emoji_duration.key_value

	arg_14_0.emojiTimer = Timer.New(function()
		if var_14_0 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			arg_14_0:StopEmojiTimer()
		end
	end, 1, -1)

	arg_14_0.emojiTimer:Start()
end

function var_0_0.StopEmojiTimer(arg_16_0)
	setActive(arg_16_0.uiEmojiGo, false)

	if arg_16_0.emojiTimer then
		arg_16_0.emojiTimer:Stop()

		arg_16_0.emojiTimer = nil
	end
end

function var_0_0.willExit(arg_17_0)
	arg_17_0:StopEmojiTimer()
	arg_17_0:ReturnEmoji()

	if not IsNil(arg_17_0.uiFrameGo) then
		local var_17_0 = tf(arg_17_0.uiFrameGo)

		if var_17_0.childCount > 0 then
			local var_17_1 = var_17_0:GetChild(0)
			local var_17_2 = var_17_1.gameObject.name

			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. var_17_2, var_17_2, var_17_1.gameObject)
		end
	end

	arg_17_0:detach()
end

return var_0_0
