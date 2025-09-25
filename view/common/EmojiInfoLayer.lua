local var_0_0 = class("EmojiInfoLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EmojiInfoUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.nameTxt = arg_2_0:findTF("frame/name"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0:findTF("frame/desc"):GetComponent(typeof(Text))
	arg_2_0.emojiContainer = arg_2_0:findTF("frame/icon_bg")

	setText(arg_2_0:findTF("frame/tip"), i18n("word_click_to_close"))
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SFX_PANEL)
	arg_3_0:Flush()
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.Flush(arg_5_0)
	local var_5_0 = arg_5_0.contextData.id

	assert(var_5_0)

	local var_5_1 = pg.emoji_template[var_5_0]

	arg_5_0.nameTxt.text = var_5_1.item_name
	arg_5_0.descTxt.text = var_5_1.item_desc

	arg_5_0:ReturnEmoji()
	arg_5_0:LoadEmoji(var_5_1)
end

function var_0_0.LoadEmoji(arg_6_0, arg_6_1)
	PoolMgr.GetInstance():GetPrefab("emoji/" .. arg_6_1.pic, arg_6_1.pic, true, function(arg_7_0)
		local var_7_0 = arg_7_0:GetComponent("Animator")

		if var_7_0 then
			var_7_0.enabled = true
		end

		setParent(arg_7_0, arg_6_0.emojiContainer, false)

		arg_6_0.emoji = arg_7_0
	end)

	arg_6_0.template = arg_6_1
end

function var_0_0.ReturnEmoji(arg_8_0)
	if arg_8_0.template and arg_8_0.emoji then
		local var_8_0 = arg_8_0.template

		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_8_0.pic, var_8_0.pic, arg_8_0.emoji)

		arg_8_0.template = nil
		arg_8_0.emoji = nil
	end
end

function var_0_0.onBackPressed(arg_9_0)
	var_0_0.super.onBackPressed(arg_9_0)
end

function var_0_0.willExit(arg_10_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0._tf)
	arg_10_0:ReturnEmoji()
end

return var_0_0
