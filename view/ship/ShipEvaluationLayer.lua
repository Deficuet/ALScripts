local var_0_0 = class("ShipEvaluationLayer", import("..base.BaseUI"))

var_0_0.EVENT_LIKE = "event like"
var_0_0.EVENT_EVA = "event eva"
var_0_0.EVENT_ZAN = "event zan"
var_0_0.EVENT_IMPEACH = "event impeach"

function var_0_0.getUIName(arg_1_0)
	return "EvaluationUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"shipyardicon/unknown",
		"shiptype",
		"shipframe"
	}
	local var_2_1 = arg_2_0.contextData
	local var_2_2 = var_2_1.groupId
	local var_2_3 = var_2_1.showTrans
	local var_2_4 = getProxy(CollectionProxy):getShipGroup(var_2_2)
	local var_2_5 = var_2_4:getPainting(var_2_3)
	local var_2_6 = var_2_4:rarity2bgPrint(var_2_3)

	table.insert(var_2_0, "bg/star_level_card_" .. var_2_6)

	local var_2_7 = ResPathSupport.GetPaintingShipYardIconListByPaintingName(var_2_5)

	table.insertto(var_2_0, var_2_7)

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.init(arg_3_0)
	arg_3_0.mainPanel = arg_3_0._tf:Find("mainPanel")
	arg_3_0.head = arg_3_0.mainPanel:Find("bg/left_panel/ship_tpl")
	arg_3_0.labelHeart = arg_3_0.mainPanel:Find("bg/left_panel/evaluation_count/heart")
	arg_3_0.labelEva = arg_3_0.mainPanel:Find("bg/left_panel/evaluation_count/count")
	arg_3_0.btnLike = arg_3_0.mainPanel:Find("bg/left_panel/btnLike")
	arg_3_0.btnEva = arg_3_0.mainPanel:Find("bg/bottom_panel/send_btn")
	arg_3_0.input = arg_3_0.mainPanel:Find("bg/bottom_panel/Input")
	arg_3_0.inputText = arg_3_0.input:Find("Text")
	arg_3_0.list = arg_3_0.mainPanel:Find("bg/right_panel/list")
	arg_3_0.hotContent = arg_3_0.list:Find("content/hots")
	arg_3_0.commonContent = arg_3_0.list:Find("content/commons")
	arg_3_0.hotTpl = arg_3_0.list:Find("content/hot_tpl")
	arg_3_0.commonTpl = arg_3_0.list:Find("content/commom_tpl")
	arg_3_0.iconType = findTF(arg_3_0.head, "content/main_bg/type_mask/type_icon"):GetComponent(typeof(Image))
	arg_3_0.imageBg = findTF(arg_3_0.head, "content/icon_bg"):GetComponent(typeof(Image))
	arg_3_0.imageFrame = findTF(arg_3_0.head, "content/main_bg/frame")
	arg_3_0.iconShip = findTF(arg_3_0.head, "content/icon"):GetComponent(typeof(Image))
	arg_3_0.labelName = findTF(arg_3_0.head, "content/main_bg/name_mask/name"):GetComponent(typeof(Text))
	arg_3_0.scrollText = findTF(arg_3_0.head, "content/main_bg/name_mask/name"):GetComponent(typeof(ScrollText))
	arg_3_0.stars = findTF(arg_3_0.head, "content/main_bg/stars")
	arg_3_0.star = findTF(arg_3_0.stars, "tpl")
	arg_3_0.bg = arg_3_0._tf:Find("BG")
	arg_3_0.btnHelp = arg_3_0._tf:Find("mainPanel/bg/top_panel/title/help")

	setActive(arg_3_0.btnHelp, getProxy(PlayerProxy):getRawData():IsOpenShipEvaluationImpeach())
	arg_3_0:initImpeachPanel()
	setActive(arg_3_0.mainPanel, true)
	setActive(arg_3_0.impackPanel, false)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.onBackPressed(arg_4_0)
	if isActive(arg_4_0.impackPanel) then
		setActive(arg_4_0.mainPanel, true)
		setActive(arg_4_0.impackPanel, false)
	else
		arg_4_0:closeView()
	end
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.bg, function()
		arg_5_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._tf:Find("mainPanel/bg/top_panel/btnBack"), function()
		arg_5_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("report_sent_help")
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnLike, function()
		arg_5_0:emit(var_0_0.EVENT_LIKE)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnEva, function()
		local var_10_0 = getInputText(arg_5_0.input)

		if string.len(var_10_0) > 0 then
			setInputText(arg_5_0.input, "")
			arg_5_0:emit(var_0_0.EVENT_EVA, var_10_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("eva_comment_send_null"))
		end
	end, SFX_PANEL)
	onInputChanged(arg_5_0, arg_5_0.input, function()
		local var_11_0 = getInputText(arg_5_0.input)
		local var_11_1
		local var_11_2

		if string.len(var_11_0) > 0 then
			if arg_5_0.shipGroup.evaluation.ievaCount >= CollectionProxy.MAX_DAILY_EVA_COUNT then
				var_11_1 = true
				var_11_2 = i18n("eva_count_limit")
			elseif wordVer(var_11_0) > 0 then
				var_11_1 = true
				var_11_2 = i18n("invalidate_evaluation")
			end
		end

		if var_11_1 then
			setTextColor(arg_5_0.inputText, Color.red)
			setButtonEnabled(arg_5_0.btnEva, false)
			pg.TipsMgr.GetInstance():ShowTips(var_11_2)
		else
			setTextColor(arg_5_0.inputText, Color.white)
			setButtonEnabled(arg_5_0.btnEva, true)
		end
	end)
end

function var_0_0.setShipGroup(arg_12_0, arg_12_1)
	arg_12_0.shipGroup = arg_12_1
end

function var_0_0.setShowTrans(arg_13_0, arg_13_1)
	arg_13_0.showTrans = arg_13_1
end

function var_0_0.flushAll(arg_14_0)
	arg_14_0:flushShip()
	arg_14_0:flushHeart()
	arg_14_0:flushEva()
end

function var_0_0.flushShip(arg_15_0)
	local var_15_0 = arg_15_0.shipGroup.shipConfig
	local var_15_1 = arg_15_0.shipGroup:getPainting(arg_15_0.showTrans)
	local var_15_2 = arg_15_0.shipGroup:rarity2bgPrint(arg_15_0.showTrans)

	setShipCardFrame(arg_15_0.imageFrame, var_15_2, nil)
	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_15_2, "", arg_15_0.imageBg)

	arg_15_0.iconShip.sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

	LoadImageSpriteAsync("shipYardIcon/" .. var_15_1, arg_15_0.iconShip)

	arg_15_0.labelName.text = arg_15_0.shipGroup:getName(arg_15_0.showTrans)

	if arg_15_0.scrollText then
		arg_15_0.scrollText:SetText(arg_15_0.shipGroup:getName(arg_15_0.showTrans))
	end

	local var_15_3 = GetSpriteFromAtlas("shiptype", shipType2print(arg_15_0.shipGroup:getShipType(arg_15_0.showTrans)))

	if not var_15_3 then
		warning("找不到船形, shipConfigId: " .. var_15_0.id)
	end

	arg_15_0.iconType.sprite = var_15_3

	local var_15_4 = pg.ship_data_template[var_15_0.id].star_max

	for iter_15_0 = arg_15_0.stars.childCount, var_15_4 - 1 do
		local var_15_5 = cloneTplTo(arg_15_0.star, arg_15_0.stars)
	end
end

function var_0_0.flushHeart(arg_16_0)
	setButtonEnabled(arg_16_0.btnLike, not arg_16_0.shipGroup.iheart)
	setText(arg_16_0.labelHeart, arg_16_0.shipGroup.evaluation.hearts)
end

function var_0_0.flushEva(arg_17_0)
	local var_17_0 = arg_17_0.shipGroup.evaluation

	setText(arg_17_0.labelEva, var_17_0.evaCount)

	local var_17_1 = var_17_0.evas

	for iter_17_0 = 1, arg_17_0.hotContent.childCount do
		local var_17_2 = go(arg_17_0.hotContent:GetChild(iter_17_0 - 1))

		if var_17_2.name ~= "tag" then
			Destroy(var_17_2)
		end
	end

	for iter_17_1 = 1, arg_17_0.commonContent.childCount do
		local var_17_3 = go(arg_17_0.commonContent:GetChild(iter_17_1 - 1))

		if var_17_3.name ~= "tag" then
			Destroy(var_17_3)
		end
	end

	local var_17_4 = getProxy(PlayerProxy):getRawData():IsOpenShipEvaluationImpeach()

	for iter_17_2 = 1, #var_17_1 do
		local var_17_5
		local var_17_6 = var_17_1[iter_17_2]

		if var_17_6.hot then
			var_17_5 = cloneTplTo(arg_17_0.hotTpl, arg_17_0.hotContent)
		else
			var_17_5 = cloneTplTo(arg_17_0.commonTpl, arg_17_0.commonContent)
		end

		local var_17_7 = var_17_5:Find("bg/evaluation"):GetComponent(typeof(Text))
		local var_17_8 = var_17_5:Find("bg/name")
		local var_17_9 = var_17_5:Find("bg/zan_bg/Text")

		setText(var_17_8, var_17_6.nick_name .. ":")
		setText(var_17_9, var_17_6.good_count - var_17_6.bad_count)

		var_17_7.supportRichText = false
		var_17_7.text = var_17_6.context

		local function var_17_10(arg_18_0)
			if not var_17_6.izan then
				arg_17_0:emit(var_0_0.EVENT_ZAN, var_17_6.id, arg_18_0)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("zan_ship_eva_error_7"))
			end
		end

		onButton(arg_17_0, var_17_5:Find("bg/zan_bg/up"), function()
			var_17_10(0)
		end, SFX_PANEL)
		onButton(arg_17_0, var_17_5:Find("bg/zan_bg/down"), function()
			var_17_10(1)
		end, SFX_PANEL)
		onButton(arg_17_0, var_17_5:Find("bg/zan_bg/impeach"), function()
			arg_17_0:openImpeachPanel(var_17_6.id)
		end, SFX_PANEL)
		SetActive(var_17_5:Find("bg/zan_bg/down"), not defaultValue(LOCK_DOWNVOTE, true))
		setActive(var_17_5:Find("bg/zan_bg/impeach"), var_17_4)
	end

	local var_17_11 = 1

	for iter_17_3 = 1, arg_17_0.hotContent.childCount do
		local var_17_12 = arg_17_0.hotContent:GetChild(iter_17_3 - 1)

		if go(var_17_12).name ~= "tag" then
			setActive(var_17_12:Find("print1"), var_17_11 % 2 ~= 0)
			setActive(var_17_12:Find("print2"), var_17_11 % 2 == 0)

			var_17_11 = var_17_11 + 1
		end
	end

	setActive(arg_17_0.hotContent:Find("tag"), arg_17_0.hotContent.childCount > 1)
	setActive(arg_17_0.commonContent:Find("tag"), arg_17_0.commonContent.childCount > 1)
	arg_17_0.hotContent:Find("tag"):SetAsLastSibling()
	arg_17_0.commonContent:Find("tag"):SetAsLastSibling()
end

local var_0_1 = 3

function var_0_0.initImpeachPanel(arg_22_0)
	arg_22_0.impackPanel = arg_22_0._tf:Find("impeachPanel")

	setText(arg_22_0.impackPanel:Find("window/top/bg/impeach/title"), i18n("report_sent_title"))
	onButton(arg_22_0, arg_22_0.impackPanel:Find("window/top/btnBack"), function()
		arg_22_0:onBackPressed()
	end, SFX_CANCEL)

	local var_22_0 = arg_22_0.impackPanel:Find("window/msg_panel/content")

	setText(var_22_0:Find("title"), i18n("report_sent_desc"))

	local var_22_1 = UIItemList.New(var_22_0:Find("options"), var_22_0:Find("options/tpl"))

	var_22_1:make(function(arg_24_0, arg_24_1, arg_24_2)
		arg_24_1 = arg_24_1 + 1

		if arg_24_0 == UIItemList.EventUpdate then
			setText(arg_24_2:Find("Text"), i18n("report_type_" .. arg_24_1))
			setText(arg_24_2:Find("Text_2"), i18n("report_type_" .. arg_24_1 .. "_1"))
			onToggle(arg_22_0, arg_24_2, function(arg_25_0)
				arg_22_0.impeachOption = arg_24_1
			end)
		end
	end)
	var_22_1:align(var_0_1)
	setText(var_22_0:Find("other/field/Text"), i18n("report_type_other"))
	setText(var_22_0:Find("other/field/input/Placeholder"), i18n("report_type_other_1"))
	onToggle(arg_22_0, var_22_0:Find("other"), function(arg_26_0)
		arg_22_0.impeachOption = "other"

		setActive(var_22_0:Find("other/field/input"), arg_26_0)
	end)

	local var_22_2 = var_22_0:Find("other/field/input")

	onInputChanged(arg_22_0, var_22_2, function()
		Canvas.ForceUpdateCanvases()
	end)
	onButton(arg_22_0, arg_22_0.impackPanel:Find("window/button_container/button"), function()
		if arg_22_0.impeachOption == "other" then
			local var_28_0 = getInputText(var_22_2)

			if string.len(var_28_0) > 0 then
				arg_22_0:emit(var_0_0.EVENT_IMPEACH, arg_22_0.targetEvaId, i18n("report_type_other") .. ":" .. var_28_0)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("report_type_other_2"))

				return
			end
		else
			arg_22_0:emit(var_0_0.EVENT_IMPEACH, arg_22_0.targetEvaId, i18n("report_type_" .. arg_22_0.impeachOption))
		end

		arg_22_0:onBackPressed()
	end, SFX_CONFIRM)
end

function var_0_0.openImpeachPanel(arg_29_0, arg_29_1)
	arg_29_0.targetEvaId = arg_29_1

	setActive(arg_29_0.mainPanel, false)
	setActive(arg_29_0.impackPanel, true)
	triggerToggle(arg_29_0.impackPanel:Find("window/msg_panel/content/other"), true)
	triggerToggle(arg_29_0.impackPanel:Find("window/msg_panel/content/options/tpl"), true)
end

function var_0_0.willExit(arg_30_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_30_0._tf)
end

return var_0_0
