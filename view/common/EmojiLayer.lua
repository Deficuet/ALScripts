local var_0_0 = class("EmojiLayer", import("..base.BaseUI"))

var_0_0.PageEmojiNums = 8
var_0_0.Frequently_Used_Emoji_Num = 6
var_0_0.True_Emoji_Num_Of_Page = 15

function var_0_0.getUIName(arg_1_0)
	return "EmojiUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.emojiGroup = arg_2_0:findTF("frame/group")
	arg_2_0.emojiType = arg_2_0:findTF("type", arg_2_0.emojiGroup)
	arg_2_0.emojiEvent = arg_2_0:findTF("frame/bg/mask/event")
	arg_2_0.emojiSnap = arg_2_0:findTF("frame/bg/mask/event"):GetComponent("HScrollSnap")

	arg_2_0.emojiSnap:Init()

	arg_2_0.emojiContent = arg_2_0:findTF("content", arg_2_0.emojiSnap)
	arg_2_0.emojiItem = arg_2_0:findTF("item", arg_2_0.emojiSnap)
	arg_2_0.emojiDots = arg_2_0:findTF("frame/dots")
	arg_2_0.emojiIconDots = arg_2_0:findTF("frame/emojiDots")
	arg_2_0.emojiDot = arg_2_0:findTF("dot", arg_2_0.emojiSnap)

	setText(arg_2_0.emojiEvent:Find("null_tpl/Text"), i18n("recently_sticker_placeholder"))
	setActive(arg_2_0.emojiItem, false)
	setActive(arg_2_0.emojiDot, false)

	arg_2_0.emojiIconEvent = arg_2_0:findTF("frame/bg/mask/emojiicon_event")
	arg_2_0.emojiIconSnap = arg_2_0:findTF("frame/bg/mask/emojiicon_event"):GetComponent("HScrollSnap")

	arg_2_0.emojiIconSnap:Init()

	arg_2_0.emojiIconContent = arg_2_0:findTF("content", arg_2_0.emojiIconSnap)
	arg_2_0.emojiIconItem = arg_2_0:findTF("item_emojiicon", arg_2_0.emojiIconSnap)

	setActive(arg_2_0.emojiIconItem, false)

	arg_2_0.parentTr = arg_2_0._tf.parent
	arg_2_0.resource = arg_2_0:findTF("frame/resource")
	arg_2_0.frame = arg_2_0:findTF("frame")
	arg_2_0.frame.position = arg_2_0.contextData.pos or Vector3(0, 0, 0)
	arg_2_0.frame.localPosition = Vector3(arg_2_0.frame.localPosition.x, arg_2_0.frame.localPosition.y, 0)
	arg_2_0.newTag = arg_2_0:findTF("newtag")
	arg_2_0.emojiProxy = getProxy(EmojiProxy)
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	arg_3_0:display()
	arg_3_0:OverlayPanel(arg_3_0._tf)
end

function var_0_0.display(arg_5_0)
	local var_5_0 = UIItemList.New(arg_5_0.emojiGroup, arg_5_0.emojiType)

	var_5_0:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = ChatConst.EmojiTypes[arg_6_1 + 1]

			arg_5_0:SetTagText(arg_6_2, var_6_0)

			if arg_5_0.emojiProxy:fliteNewEmojiDataByType()[var_6_0] then
				setActive(arg_6_2:Find("point"), true)
			else
				setActive(arg_6_2:Find("point"), false)
			end

			onToggle(arg_5_0, arg_6_2, function(arg_7_0)
				if arg_7_0 then
					setActive(arg_5_0.emojiDots, var_6_0 ~= ChatConst.EmojiIcon)
					setActive(arg_5_0.emojiIconDots, var_6_0 == ChatConst.EmojiIcon)
					setActive(arg_5_0.emojiEvent, var_6_0 ~= ChatConst.EmojiIcon)
					setActive(arg_5_0.emojiIconEvent, var_6_0 == ChatConst.EmojiIcon)

					if var_6_0 ~= ChatConst.EmojiIcon then
						arg_5_0:filter(var_6_0)
					elseif var_6_0 == ChatConst.EmojiIcon then
						arg_5_0:emojiIconFliter()
					end

					var_5_0:align(#ChatConst.EmojiTypes)
				end
			end, SFX_PANEL)
		end
	end)
	var_5_0:align(#ChatConst.EmojiTypes)
	triggerToggle(arg_5_0.emojiGroup:GetChild(0), true)
end

function var_0_0.SetTagText(arg_8_0, arg_8_1, arg_8_2)
	setText(arg_8_1:Find("Text"), i18n("emoji_type_" .. arg_8_2))
end

function var_0_0.filter(arg_9_0, arg_9_1)
	local var_9_0 = _.map(pg.emoji_template.all, function(arg_10_0)
		if pg.emoji_template[arg_10_0].achieve == 0 then
			return pg.emoji_template[arg_10_0]
		end
	end)
	local var_9_1 = arg_9_0.emojiProxy:getNewEmojiIDLIst()
	local var_9_2 = arg_9_0.emojiProxy:fliteNewEmojiDataByType()
	local var_9_3 = arg_9_0.emojiProxy:getExEmojiDataByType(arg_9_1)

	for iter_9_0, iter_9_1 in pairs(var_9_3) do
		table.insert(var_9_0, 1, iter_9_1)
	end

	table.sort(var_9_0, function(arg_11_0, arg_11_1)
		if arg_11_0.index == arg_11_1.index then
			return arg_11_0.id < arg_11_1.id
		end

		return arg_11_0.index < arg_11_1.index
	end)

	if arg_9_1 == ChatConst.EmojiCommon then
		local var_9_4 = getProxy(ChatProxy):getUsedEmoji()
		local var_9_5 = {}

		for iter_9_2, iter_9_3 in pairs(var_9_4) do
			table.insert(var_9_5, {
				id = iter_9_2,
				count = iter_9_3
			})
		end

		table.sort(var_9_5, function(arg_12_0, arg_12_1)
			if arg_12_0.count == arg_12_1.count then
				return arg_12_0.id < arg_12_1.id
			end

			return arg_12_0.count > arg_12_1.count
		end)

		var_9_0 = _.map(var_9_5, function(arg_13_0)
			return pg.emoji_template[arg_13_0.id]
		end)
	else
		var_9_0 = _.filter(var_9_0, function(arg_14_0)
			return table.contains(arg_14_0.type, arg_9_1)
		end)
	end

	if var_9_2[arg_9_1] then
		for iter_9_4, iter_9_5 in pairs(var_9_2[arg_9_1]) do
			table.insert(var_9_0, 1, iter_9_5)
		end
	end

	arg_9_0.tplCaches = arg_9_0.tplCaches or {}

	local var_9_6 = math.ceil(#var_9_0 / var_0_0.PageEmojiNums)

	setActive(arg_9_0.emojiEvent:Find("null_tpl"), var_9_6 == 0)

	for iter_9_6 = arg_9_0.emojiContent.childCount - 1, var_9_6, -1 do
		Destroy(arg_9_0.emojiDots:GetChild(iter_9_6))

		local var_9_7 = arg_9_0.emojiSnap:RemoveChild(iter_9_6)

		var_9_7.transform.localScale = Vector3.one

		var_9_7.transform:SetParent(arg_9_0._tf, false)
		setActive(var_9_7, false)
		arg_9_0:clearItem(var_9_7)
		table.insert(arg_9_0.tplCaches, var_9_7)
	end

	for iter_9_7 = arg_9_0.emojiContent.childCount + 1, var_9_6 do
		local var_9_8

		if #arg_9_0.tplCaches > 0 then
			var_9_8 = table.remove(arg_9_0.tplCaches)
		else
			var_9_8 = Instantiate(arg_9_0.emojiItem)
		end

		setActive(var_9_8, true)
		arg_9_0.emojiSnap:AddChild(var_9_8)
		cloneTplTo(arg_9_0.emojiDot, arg_9_0.emojiDots)
	end

	for iter_9_8 = 0, arg_9_0.emojiContent.childCount - 1 do
		local var_9_9 = arg_9_0.emojiContent:GetChild(iter_9_8)

		arg_9_0:clearItem(var_9_9)

		local var_9_10 = _.slice(var_9_0, iter_9_8 * var_0_0.PageEmojiNums + 1, var_0_0.PageEmojiNums)
		local var_9_11 = GetComponent(var_9_9, typeof(GridLayoutGroup))
		local var_9_12 = UIItemList.New(var_9_9, var_9_9:Find("face"))

		var_9_12:make(function(arg_15_0, arg_15_1, arg_15_2)
			local var_15_0 = var_9_10[arg_15_1 + 1]

			if arg_15_0 == UIItemList.EventUpdate then
				PoolMgr.GetInstance():GetPrefab("emoji/" .. var_15_0.pic, var_15_0.pic, true, function(arg_16_0)
					if not IsNil(arg_15_2) then
						arg_16_0.name = var_15_0.pic

						local var_16_0 = arg_16_0:GetComponent(typeof(Image))

						if var_16_0 then
							var_16_0.preserveAspect = true
						end

						tf(arg_16_0).sizeDelta = Vector2(var_9_11.cellSize.x, var_9_11.cellSize.y)
						tf(arg_16_0).anchoredPosition = Vector2.zero

						local var_16_1 = arg_16_0:GetComponent("Animator")

						if var_16_1 then
							var_16_1.enabled = false
						end

						local var_16_2 = arg_16_0:GetComponent("CriManaEffectUI")

						if var_16_2 then
							var_16_2:Pause(true)
						end

						setParent(arg_16_0, arg_15_2, false)

						if table.contains(var_9_1, var_15_0.id) then
							cloneTplTo(arg_9_0.newTag, arg_15_2, "newtag")
							arg_9_0.emojiProxy:removeNewEmojiID(var_15_0.id)
						end
					else
						PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_15_0.pic, var_15_0.pic, arg_16_0)
					end
				end)
				onButton(arg_9_0, arg_15_2, function()
					getProxy(ChatProxy):addUsedEmoji(var_15_0.id)
					arg_9_0.contextData.callback(var_15_0.id)
					triggerButton(arg_9_0._tf)
				end, SFX_PANEL)
			end
		end)
		var_9_12:align(#var_9_10)
	end
end

function var_0_0.emojiIconFliter(arg_18_0)
	local var_18_0 = pg.emoji_small_template
	local var_18_1 = {}
	local var_18_2 = getProxy(ChatProxy):getUsedEmojiIcon()

	for iter_18_0, iter_18_1 in ipairs(var_18_2) do
		table.insert(var_18_1, var_18_0[iter_18_1])
	end

	local var_18_3 = math.ceil((#var_18_0 + #var_18_1) / var_0_0.True_Emoji_Num_Of_Page)

	for iter_18_2 = arg_18_0.emojiIconContent.childCount + 1, var_18_3 do
		cloneTplTo(arg_18_0.emojiDot, arg_18_0.emojiIconDots)
	end

	for iter_18_3 = arg_18_0.emojiIconContent.childCount + 1, var_18_3 do
		local var_18_4 = Instantiate(arg_18_0.emojiIconItem)
		local var_18_5 = arg_18_0:findTF("TitleCommom", var_18_4)
		local var_18_6 = arg_18_0:findTF("TitleAll", var_18_4)
		local var_18_7 = arg_18_0:findTF("CommomIconContainer", var_18_4)
		local var_18_8 = arg_18_0:findTF("AllIconContainer", var_18_4)
		local var_18_9 = GetComponent(var_18_8, "GridLayoutGroup")

		if iter_18_3 == 1 then
			local var_18_10 = arg_18_0:findTF("Icon", var_18_7)
			local var_18_11 = UIItemList.New(var_18_7, var_18_10)

			var_18_11:make(function(arg_19_0, arg_19_1, arg_19_2)
				local var_19_0 = var_18_1[arg_19_1 + 1]

				if arg_19_0 == UIItemList.EventUpdate then
					PoolMgr.GetInstance():GetPrefab("emoji/" .. var_19_0.pic, var_19_0.pic, true, function(arg_20_0)
						if not IsNil(arg_19_2) then
							arg_20_0.name = var_19_0.pic

							setParent(arg_20_0, arg_19_2, false)
							onButton(arg_18_0, arg_20_0, function()
								if arg_18_0.contextData.emojiIconCallback then
									getProxy(ChatProxy):addUsedEmojiIcon(var_19_0.id)
									arg_18_0.contextData.emojiIconCallback(var_19_0.id)
								end
							end, SFX_PANEL)
						end
					end)
				end
			end)
			var_18_11:align(#var_18_1)

			var_18_9.padding.left = 20

			local var_18_12 = arg_18_0:findTF("Icon", var_18_8)
			local var_18_13 = UIItemList.New(var_18_8, var_18_12)

			var_18_13:make(function(arg_22_0, arg_22_1, arg_22_2)
				local var_22_0 = var_18_0[arg_22_1 + 1]

				if arg_22_0 == UIItemList.EventUpdate then
					PoolMgr.GetInstance():GetPrefab("emoji/" .. var_22_0.pic, var_22_0.pic, true, function(arg_23_0)
						if not IsNil(arg_22_2) then
							arg_23_0.name = var_22_0.pic

							setParent(arg_23_0, arg_22_2, false)
							onButton(arg_18_0, arg_23_0, function()
								if arg_18_0.contextData.emojiIconCallback then
									getProxy(ChatProxy):addUsedEmojiIcon(var_22_0.id)
									arg_18_0.contextData.emojiIconCallback(var_22_0.id)
								end
							end, SFX_PANEL)
						end
					end)
				end
			end)
			var_18_13:align(var_0_0.True_Emoji_Num_Of_Page - var_0_0.Frequently_Used_Emoji_Num)
		else
			local var_18_14 = var_0_0.True_Emoji_Num_Of_Page - var_0_0.Frequently_Used_Emoji_Num
			local var_18_15 = _.slice(var_18_0, (iter_18_3 - 2) * var_0_0.True_Emoji_Num_Of_Page + 9 + 1, var_0_0.True_Emoji_Num_Of_Page)

			var_18_9.padding.left = 60

			local var_18_16 = arg_18_0:findTF("Icon", var_18_8)
			local var_18_17 = UIItemList.New(var_18_8, var_18_16)

			var_18_17:make(function(arg_25_0, arg_25_1, arg_25_2)
				local var_25_0 = var_18_15[arg_25_1 + 1]

				if arg_25_0 == UIItemList.EventUpdate then
					PoolMgr.GetInstance():GetPrefab("emoji/" .. var_25_0.pic, var_25_0.pic, true, function(arg_26_0)
						if not IsNil(arg_25_2) then
							arg_26_0.name = var_25_0.pic

							setParent(arg_26_0, arg_25_2, false)
							onButton(arg_18_0, arg_26_0, function()
								if arg_18_0.contextData.emojiIconCallback then
									getProxy(ChatProxy):addUsedEmojiIcon(var_25_0.id)
									arg_18_0.contextData.emojiIconCallback(var_25_0.id)
								end
							end, SFX_PANEL)
						end
					end)
				end
			end)
			var_18_17:align(#var_18_15)
		end

		setActive(var_18_5, iter_18_3 == 1)
		setActive(var_18_6, iter_18_3 == 1)
		setActive(var_18_7, iter_18_3 == 1)
		setActive(var_18_4, true)
		arg_18_0.emojiIconSnap:AddChild(var_18_4)
	end
end

function var_0_0.onBackPressed(arg_28_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_28_0._tf)
end

function var_0_0.clearItem(arg_29_0, arg_29_1)
	eachChild(arg_29_1, function(arg_30_0)
		if arg_30_0.childCount > 0 then
			local var_30_0 = arg_30_0:Find("newtag")

			if var_30_0 then
				Destroy(var_30_0)
			end

			local var_30_1 = arg_30_0:GetChild(0).gameObject

			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_30_1.name, var_30_1.name, var_30_1)
		end
	end)
end

function var_0_0.willExit(arg_31_0)
	eachChild(arg_31_0.emojiContent, function(arg_32_0)
		arg_31_0:clearItem(arg_32_0)
	end)
	_.each(arg_31_0.tplCaches, function(arg_33_0)
		arg_31_0:clearItem(arg_33_0)
	end)

	arg_31_0.tplCaches = {}

	arg_31_0:UnOverlayPanel(arg_31_0._tf)
end

return var_0_0
