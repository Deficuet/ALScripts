local var_0_0 = class("IslandChatBubblePlayer", import("Mgr.Story.model.animation.StoryAnimtion"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.tpl = arg_1_1
	arg_1_0.role = arg_1_2
	arg_1_0.contentTr = arg_1_0.tpl.transform:Find("content")
	arg_1_0.emojiTr = arg_1_0.tpl.transform:Find("face")
	arg_1_0.contentTxt = arg_1_0.contentTr:Find("Text"):GetComponent("RichText")
	arg_1_0.isPlaying = false
	arg_1_0.canShowFlag = true
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:Stop()

	arg_2_0.canShowFlag = true
	arg_2_0.isPlaying = true

	seriesAsync({
		function(arg_3_0)
			arg_2_0:ClearEmoji()
			arg_2_0:ShowOrHide(true)
			arg_2_0:UpdateBubble(arg_2_1, arg_3_0)
		end,
		function(arg_4_0)
			arg_2_0:WaitForNextOne(arg_2_1, arg_4_0)
		end,
		function(arg_5_0)
			arg_2_0:EneAction(arg_2_1)

			arg_2_0.isPlaying = false
			arg_2_0.canShowFlag = false

			arg_5_0()
		end
	}, arg_2_2)
end

function var_0_0.UpdateBubble(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:PlayCharatorAnimation(arg_6_1)

	local var_6_0 = arg_6_1:ExistEmoji()

	setActive(arg_6_0.contentTr, not var_6_0)
	setActive(arg_6_0.emojiTr, var_6_0)

	if var_6_0 then
		arg_6_0:UpdateEmoji(arg_6_1, arg_6_2)
	else
		arg_6_0:UpdateContent(arg_6_1, arg_6_2)
	end
end

function var_0_0.UpdateContent(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1:GetSay()

	if var_7_0 == "" then
		if arg_7_2 then
			arg_7_2()
		end

		return
	end

	arg_7_0.contentTxt.text = arg_7_0:GetContent(arg_7_0.contentTr, var_7_0)

	arg_7_2()
end

function var_0_0.GetContent(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = tf(arg_8_1):Find("Text"):GetComponent("RichText")

	var_8_0.supportRichText = false

	eachChild(tf(arg_8_1):Find("Text"), function(arg_9_0)
		Destroy(arg_9_0)
	end)

	local var_8_1 = string.gmatch(arg_8_2, ChatConst.EmojiIconCodeMatch)
	local var_8_2 = false

	for iter_8_0 in var_8_1 do
		if table.contains(pg.emoji_small_template.all, tonumber(iter_8_0)) then
			local var_8_3 = true
			local var_8_4 = pg.emoji_small_template[tonumber(iter_8_0)]
			local var_8_5 = LoadSprite("emoji/" .. var_8_4.pic .. "_small", nil)

			var_8_0:AddSprite(iter_8_0, var_8_5)
		end
	end

	local var_8_6 = arg_8_2

	return (string.gsub(var_8_6, ChatConst.EmojiIconCodeMatch, function(arg_10_0)
		if table.contains(pg.emoji_small_template.all, tonumber(arg_10_0)) then
			return string.format("<icon name=%s w=1 h=1/>", arg_10_0)
		end
	end))
end

function var_0_0.UpdateEmoji(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:ClearEmoji()

	local var_11_0 = arg_11_1:GetEmoji()
	local var_11_1 = pg.emoji_template[var_11_0]

	PoolMgr.GetInstance():GetPrefab("emoji/" .. var_11_1.pic, var_11_1.pic, true, function(arg_12_0)
		local var_12_0 = arg_12_0:GetComponent("Animator")

		if var_12_0 then
			var_12_0.enabled = true
		end

		setParent(arg_12_0, arg_11_0.emojiTr, false)

		if arg_12_0:GetComponent(typeof(CriManaEffectUI)) or var_12_0 then
			arg_12_0.transform.localScale = Vector3(0.48, 0.48, 1)
		else
			arg_12_0.transform.localScale = Vector3(0.48, 0.48, 1)
		end

		setAnchoredPosition3D(arg_12_0, Vector3(0, 9, 0))

		if arg_12_0:GetComponent(typeof(Image)) then
			local var_12_1 = GetOrAddComponent(arg_12_0, typeof(Outline))

			var_12_1.effectColor = Color.NewHex("707275")
			var_12_1.effectDistance = Vector2(2, -2)
		end

		arg_11_0.emojiGo = arg_12_0
		arg_11_0.template = var_11_1

		arg_11_2()
	end)
end

function var_0_0.ClearEmoji(arg_13_0)
	if arg_13_0.emojiGo and arg_13_0.template then
		arg_13_0.emojiGo.transform.localPosition = Vector3(0, 0, 0)
		arg_13_0.emojiGo.transform.localScale = Vector3(1, 1, 1)

		local var_13_0 = GetOrAddComponent(arg_13_0.emojiGo, typeof(Outline))

		if var_13_0 then
			Object.Destroy(var_13_0)
		end

		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. arg_13_0.template.pic, arg_13_0.template.pic, arg_13_0.emojiGo)
	end

	arg_13_0.emojiGo = nil
	arg_13_0.template = nil
end

function var_0_0.WaitForNextOne(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1:GetTime()

	arg_14_0:UnscaleDelayCall(var_14_0, arg_14_2)
end

function var_0_0.PlayCharatorAnimation(arg_15_0, arg_15_1)
	if not arg_15_1:ExistAnimation() then
		return
	end

	local var_15_0 = arg_15_0.role
	local var_15_1 = arg_15_1:GetAnimation()
	local var_15_2 = var_15_0:GetComponent(typeof(Animator)) or var_15_0.transform:GetChild(0):GetComponent(typeof(Animator))

	if not var_15_2:GetCurrentAnimatorStateInfo(0):IsName(var_15_1) then
		local var_15_3 = Animator.StringToHash(var_15_1)

		for iter_15_0 = 1, var_15_2.layerCount do
			var_15_2:CrossFadeInFixedTime(var_15_3, 0.2, iter_15_0 - 1)
		end
	end
end

function var_0_0.EneAction(arg_16_0, arg_16_1)
	arg_16_0:RemnoveTimer()

	local var_16_0, var_16_1 = arg_16_1:GetHideType()

	if var_16_0 == BubbleStep.HIDE_TYPE_IMMEDIATELY then
		arg_16_0:ClearEmoji()
		arg_16_0:ShowOrHide(false)
	elseif var_16_0 == BubbleStep.HIDE_TYPE_NEVER then
		-- block empty
	elseif var_16_0 == BubbleStep.HIDE_TYPE_TIME then
		arg_16_0.timer = arg_16_0:CreateDelayTimer(var_16_1, function()
			if not IsNil(arg_16_0.tpl) then
				arg_16_0:ClearEmoji()
				arg_16_0:ShowOrHide(false)
			end
		end)
	end
end

function var_0_0.RemnoveTimer(arg_18_0)
	if arg_18_0.timer then
		arg_18_0.timer:Stop()

		arg_18_0.timer = nil
	end
end

function var_0_0.Stop(arg_19_0)
	arg_19_0:RemnoveTimer()
	arg_19_0:ClearEmoji()
	arg_19_0:ClearAnimation()
	arg_19_0:ShowOrHide(show)

	arg_19_0.isPlaying = false
	arg_19_0.canShowFlag = true
end

function var_0_0.IsPlaying(arg_20_0)
	return arg_20_0.isPlaying
end

function var_0_0.SetShowFlag(arg_21_0, arg_21_1)
	if arg_21_0:IsPlaying() then
		return
	end

	arg_21_0.canShowFlag = arg_21_1

	setActive(arg_21_0.tpl, arg_21_1)
end

function var_0_0.ShowOrHide(arg_22_0, arg_22_1)
	if arg_22_1 and not arg_22_0.canShowFlag then
		return
	end

	setActive(arg_22_0.tpl, arg_22_1)
end

function var_0_0.Dispose(arg_23_0)
	Object.Destroy(arg_23_0.tpl)

	arg_23_0.tpl = nil
	arg_23_0.role = nil
	arg_23_0.contentTxt = nil
	arg_23_0.isPlaying = false
	arg_23_0.canShowFlag = true

	arg_23_0:RemnoveTimer()
	arg_23_0:ClearAnimation()
end

return var_0_0
