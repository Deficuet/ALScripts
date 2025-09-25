local var_0_0 = class("ShipEvaluationLayer", import("..base.BaseUI"))

var_0_0.EVENT_LIKE = "event like"
var_0_0.EVENT_EVA = "event eva"
var_0_0.EVENT_ZAN = "event zan"
var_0_0.EVENT_IMPEACH = "event impeach"

function var_0_0.getUIName(arg_1_0)
	return "EvaluationUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.mainPanel = arg_2_0:findTF("mainPanel")
	arg_2_0.head = arg_2_0:findTF("bg/left_panel/ship_tpl", arg_2_0.mainPanel)
	arg_2_0.labelHeart = arg_2_0:findTF("bg/left_panel/evaluation_count/heart", arg_2_0.mainPanel)
	arg_2_0.labelEva = arg_2_0:findTF("bg/left_panel/evaluation_count/count", arg_2_0.mainPanel)
	arg_2_0.btnLike = arg_2_0:findTF("bg/left_panel/btnLike", arg_2_0.mainPanel)
	arg_2_0.btnEva = arg_2_0:findTF("bg/bottom_panel/send_btn", arg_2_0.mainPanel)
	arg_2_0.input = arg_2_0:findTF("bg/bottom_panel/Input", arg_2_0.mainPanel)
	arg_2_0.inputText = arg_2_0:findTF("Text", arg_2_0.input)
	arg_2_0.list = arg_2_0:findTF("bg/right_panel/list", arg_2_0.mainPanel)
	arg_2_0.hotContent = arg_2_0:findTF("content/hots", arg_2_0.list)
	arg_2_0.commonContent = arg_2_0:findTF("content/commons", arg_2_0.list)
	arg_2_0.hotTpl = arg_2_0:findTF("content/hot_tpl", arg_2_0.list)
	arg_2_0.commonTpl = arg_2_0:findTF("content/commom_tpl", arg_2_0.list)
	arg_2_0.iconType = findTF(arg_2_0.head, "content/main_bg/type_mask/type_icon"):GetComponent(typeof(Image))
	arg_2_0.imageBg = findTF(arg_2_0.head, "content/icon_bg"):GetComponent(typeof(Image))
	arg_2_0.imageFrame = findTF(arg_2_0.head, "content/main_bg/frame")
	arg_2_0.iconShip = findTF(arg_2_0.head, "content/icon"):GetComponent(typeof(Image))
	arg_2_0.labelName = findTF(arg_2_0.head, "content/main_bg/name_mask/name"):GetComponent(typeof(Text))
	arg_2_0.scrollText = findTF(arg_2_0.head, "content/main_bg/name_mask/name"):GetComponent(typeof(ScrollText))
	arg_2_0.stars = findTF(arg_2_0.head, "content/main_bg/stars")
	arg_2_0.star = findTF(arg_2_0.stars, "tpl")
	arg_2_0.bg = arg_2_0:findTF("BG")
	arg_2_0.btnHelp = arg_2_0._tf:Find("mainPanel/bg/top_panel/title/help")

	setActive(arg_2_0.btnHelp, getProxy(PlayerProxy):getRawData():IsOpenShipEvaluationImpeach())
	arg_2_0:initImpeachPanel()
	setActive(arg_2_0.mainPanel, true)
	setActive(arg_2_0.impackPanel, false)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)
end

function var_0_0.onBackPressed(arg_3_0)
	if isActive(arg_3_0.impackPanel) then
		setActive(arg_3_0.mainPanel, true)
		setActive(arg_3_0.impackPanel, false)
	else
		arg_3_0:closeView()
	end
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.bg, function()
		arg_4_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0:findTF("mainPanel/bg/top_panel/btnBack"), function()
		arg_4_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("report_sent_help")
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnLike, function()
		arg_4_0:emit(var_0_0.EVENT_LIKE)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnEva, function()
		local var_9_0 = getInputText(arg_4_0.input)

		if string.len(var_9_0) > 0 then
			setInputText(arg_4_0.input, "")
			arg_4_0:emit(var_0_0.EVENT_EVA, var_9_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("eva_comment_send_null"))
		end
	end, SFX_PANEL)
	onInputChanged(arg_4_0, arg_4_0.input, function()
		local var_10_0 = getInputText(arg_4_0.input)
		local var_10_1
		local var_10_2

		if string.len(var_10_0) > 0 then
			if arg_4_0.shipGroup.evaluation.ievaCount >= CollectionProxy.MAX_DAILY_EVA_COUNT then
				var_10_1 = true
				var_10_2 = i18n("eva_count_limit")
			elseif wordVer(var_10_0) > 0 then
				var_10_1 = true
				var_10_2 = i18n("invalidate_evaluation")
			end
		end

		if var_10_1 then
			setTextColor(arg_4_0.inputText, Color.red)
			setButtonEnabled(arg_4_0.btnEva, false)
			pg.TipsMgr.GetInstance():ShowTips(var_10_2)
		else
			setTextColor(arg_4_0.inputText, Color.white)
			setButtonEnabled(arg_4_0.btnEva, true)
		end
	end)
end

function var_0_0.setShipGroup(arg_11_0, arg_11_1)
	arg_11_0.shipGroup = arg_11_1
end

function var_0_0.setShowTrans(arg_12_0, arg_12_1)
	arg_12_0.showTrans = arg_12_1
end

function var_0_0.flushAll(arg_13_0)
	arg_13_0:flushShip()
	arg_13_0:flushHeart()
	arg_13_0:flushEva()
end

function var_0_0.flushShip(arg_14_0)
	local var_14_0 = arg_14_0.shipGroup.shipConfig
	local var_14_1 = arg_14_0.shipGroup:getPainting(arg_14_0.showTrans)
	local var_14_2 = arg_14_0.shipGroup:rarity2bgPrint(arg_14_0.showTrans)

	setShipCardFrame(arg_14_0.imageFrame, var_14_2, nil)
	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_14_2, "", arg_14_0.imageBg)

	arg_14_0.iconShip.sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

	LoadImageSpriteAsync("shipYardIcon/" .. var_14_1, arg_14_0.iconShip)

	arg_14_0.labelName.text = arg_14_0.shipGroup:getName(arg_14_0.showTrans)

	if arg_14_0.scrollText then
		arg_14_0.scrollText:SetText(arg_14_0.shipGroup:getName(arg_14_0.showTrans))
	end

	local var_14_3 = GetSpriteFromAtlas("shiptype", shipType2print(arg_14_0.shipGroup:getShipType(arg_14_0.showTrans)))

	if not var_14_3 then
		warning("找不到船形, shipConfigId: " .. var_14_0.id)
	end

	arg_14_0.iconType.sprite = var_14_3

	local var_14_4 = pg.ship_data_template[var_14_0.id].star_max

	for iter_14_0 = arg_14_0.stars.childCount, var_14_4 - 1 do
		local var_14_5 = cloneTplTo(arg_14_0.star, arg_14_0.stars)
	end
end

function var_0_0.flushHeart(arg_15_0)
	setButtonEnabled(arg_15_0.btnLike, not arg_15_0.shipGroup.iheart)
	setText(arg_15_0.labelHeart, arg_15_0.shipGroup.evaluation.hearts)
end

function var_0_0.flushEva(arg_16_0)
	local var_16_0 = arg_16_0.shipGroup.evaluation

	setText(arg_16_0.labelEva, var_16_0.evaCount)

	local var_16_1 = var_16_0.evas

	for iter_16_0 = 1, arg_16_0.hotContent.childCount do
		local var_16_2 = go(arg_16_0.hotContent:GetChild(iter_16_0 - 1))

		if var_16_2.name ~= "tag" then
			Destroy(var_16_2)
		end
	end

	for iter_16_1 = 1, arg_16_0.commonContent.childCount do
		local var_16_3 = go(arg_16_0.commonContent:GetChild(iter_16_1 - 1))

		if var_16_3.name ~= "tag" then
			Destroy(var_16_3)
		end
	end

	local var_16_4 = getProxy(PlayerProxy):getRawData():IsOpenShipEvaluationImpeach()

	for iter_16_2 = 1, #var_16_1 do
		local var_16_5
		local var_16_6 = var_16_1[iter_16_2]

		if var_16_6.hot then
			var_16_5 = cloneTplTo(arg_16_0.hotTpl, arg_16_0.hotContent)
		else
			var_16_5 = cloneTplTo(arg_16_0.commonTpl, arg_16_0.commonContent)
		end

		local var_16_7 = arg_16_0:findTF("bg/evaluation", var_16_5):GetComponent(typeof(Text))
		local var_16_8 = arg_16_0:findTF("bg/name", var_16_5)
		local var_16_9 = arg_16_0:findTF("bg/zan_bg/Text", var_16_5)

		setText(var_16_8, var_16_6.nick_name .. ":")
		setText(var_16_9, var_16_6.good_count - var_16_6.bad_count)

		var_16_7.supportRichText = false
		var_16_7.text = var_16_6.context

		local function var_16_10(arg_17_0)
			if not var_16_6.izan then
				arg_16_0:emit(var_0_0.EVENT_ZAN, var_16_6.id, arg_17_0)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("zan_ship_eva_error_7"))
			end
		end

		onButton(arg_16_0, var_16_5:Find("bg/zan_bg/up"), function()
			var_16_10(0)
		end, SFX_PANEL)
		onButton(arg_16_0, var_16_5:Find("bg/zan_bg/down"), function()
			var_16_10(1)
		end, SFX_PANEL)
		onButton(arg_16_0, var_16_5:Find("bg/zan_bg/impeach"), function()
			arg_16_0:openImpeachPanel(var_16_6.id)
		end, SFX_PANEL)
		SetActive(var_16_5:Find("bg/zan_bg/down"), not defaultValue(LOCK_DOWNVOTE, true))
		setActive(var_16_5:Find("bg/zan_bg/impeach"), var_16_4)
	end

	local var_16_11 = 1

	for iter_16_3 = 1, arg_16_0.hotContent.childCount do
		local var_16_12 = arg_16_0.hotContent:GetChild(iter_16_3 - 1)

		if go(var_16_12).name ~= "tag" then
			setActive(var_16_12:Find("print1"), var_16_11 % 2 ~= 0)
			setActive(var_16_12:Find("print2"), var_16_11 % 2 == 0)

			var_16_11 = var_16_11 + 1
		end
	end

	setActive(arg_16_0.hotContent:Find("tag"), arg_16_0.hotContent.childCount > 1)
	setActive(arg_16_0.commonContent:Find("tag"), arg_16_0.commonContent.childCount > 1)
	arg_16_0.hotContent:Find("tag"):SetAsLastSibling()
	arg_16_0.commonContent:Find("tag"):SetAsLastSibling()
end

local var_0_1 = 3

function var_0_0.initImpeachPanel(arg_21_0)
	arg_21_0.impackPanel = arg_21_0._tf:Find("impeachPanel")

	setText(arg_21_0.impackPanel:Find("window/top/bg/impeach/title"), i18n("report_sent_title"))
	onButton(arg_21_0, arg_21_0.impackPanel:Find("window/top/btnBack"), function()
		arg_21_0:onBackPressed()
	end, SFX_CANCEL)

	local var_21_0 = arg_21_0.impackPanel:Find("window/msg_panel/content")

	setText(var_21_0:Find("title"), i18n("report_sent_desc"))

	local var_21_1 = UIItemList.New(var_21_0:Find("options"), var_21_0:Find("options/tpl"))

	var_21_1:make(function(arg_23_0, arg_23_1, arg_23_2)
		arg_23_1 = arg_23_1 + 1

		if arg_23_0 == UIItemList.EventUpdate then
			setText(arg_23_2:Find("Text"), i18n("report_type_" .. arg_23_1))
			setText(arg_23_2:Find("Text_2"), i18n("report_type_" .. arg_23_1 .. "_1"))
			onToggle(arg_21_0, arg_23_2, function(arg_24_0)
				arg_21_0.impeachOption = arg_23_1
			end)
		end
	end)
	var_21_1:align(var_0_1)
	setText(var_21_0:Find("other/field/Text"), i18n("report_type_other"))
	setText(var_21_0:Find("other/field/input/Placeholder"), i18n("report_type_other_1"))
	onToggle(arg_21_0, var_21_0:Find("other"), function(arg_25_0)
		arg_21_0.impeachOption = "other"

		setActive(var_21_0:Find("other/field/input"), arg_25_0)
	end)

	local var_21_2 = var_21_0:Find("other/field/input")

	onInputChanged(arg_21_0, var_21_2, function()
		Canvas.ForceUpdateCanvases()
	end)
	onButton(arg_21_0, arg_21_0.impackPanel:Find("window/button_container/button"), function()
		if arg_21_0.impeachOption == "other" then
			local var_27_0 = getInputText(var_21_2)

			if string.len(var_27_0) > 0 then
				arg_21_0:emit(var_0_0.EVENT_IMPEACH, arg_21_0.targetEvaId, i18n("report_type_other") .. ":" .. var_27_0)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("report_type_other_2"))

				return
			end
		else
			arg_21_0:emit(var_0_0.EVENT_IMPEACH, arg_21_0.targetEvaId, i18n("report_type_" .. arg_21_0.impeachOption))
		end

		arg_21_0:onBackPressed()
	end, SFX_CONFIRM)
end

function var_0_0.openImpeachPanel(arg_28_0, arg_28_1)
	arg_28_0.targetEvaId = arg_28_1

	setActive(arg_28_0.mainPanel, false)
	setActive(arg_28_0.impackPanel, true)
	triggerToggle(arg_28_0.impackPanel:Find("window/msg_panel/content/other"), true)
	triggerToggle(arg_28_0.impackPanel:Find("window/msg_panel/content/options/tpl"), true)
end

function var_0_0.willExit(arg_29_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0._tf)
end

return var_0_0
