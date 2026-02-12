local var_0_0 = class("LoveLetterGiftCollectLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "LoveLetterGiftCollectUI"
end

var_0_0.optionsPath = {}

function var_0_0.init(arg_2_0)
	setText(arg_2_0.textTitle, i18n("loveactivity_ui_5"))
	setText(arg_2_0.textHelp, i18n("loveactivity_ui_7"))
	setText(arg_2_0.btnConfirm:Find("Text"), i18n("loveactivity_ui_8"))
	setText(arg_2_0.btnSelectConfirm:Find("Text"), i18n("loveactivity_ui_8"))

	arg_2_0.itemList = UIItemList.New(arg_2_0.rtScrollContent, arg_2_0.rtScrollTpl)

	arg_2_0.itemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		arg_3_1 = arg_3_1 + 1

		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = arg_2_0.tempList[arg_3_1]

			setText(arg_3_2:Find("year"), tostring(var_3_0))

			local var_3_1 = arg_2_0.confirmDic[var_3_0]

			setActive(arg_3_2:Find("icon/mask/IconTpl"), var_3_1)
			setActive(arg_3_2:Find("icon/on"), var_3_1)
			setActive(arg_3_2:Find("now"), var_3_1)

			if var_3_1 then
				local var_3_2, var_3_3 = unpack(arg_2_0.giftItemList[var_3_1])

				updateDrop(arg_3_2:Find("icon/mask/IconTpl"), Drop.New({
					count = 1,
					type = DROP_TYPE_ITEM,
					id = var_3_2,
					extra = var_3_3
				}))

				local var_3_4 = getProxy(LoveLetterProxy):GetGroupData(arg_2_0.giftGroupList[var_3_1])

				setLoveLetterMedal(arg_3_2:Find("now/medal"), var_3_4)
			end

			setActive(arg_3_2:Find("active/active_off"), not var_3_1)
			setActive(arg_3_2:Find("active/active_on"), var_3_1)
			setText(arg_3_2:Find("active/Text"), i18n("loveactivity_ui_6"))

			local var_3_5 = not var_3_1 and arg_2_0.heap:GetLength() > 0 and var_3_0 == arg_2_0.heap:GetTop().element

			setActive(arg_3_2:Find("icon/tip"), var_3_5)
			setButtonEnabled(arg_3_2:Find("icon"), var_3_5)

			if var_3_5 then
				onButton(arg_2_0, arg_3_2:Find("icon"), function()
					arg_2_0:OpenSelectWindow(var_3_0)
				end, SFX_PANEL)
			end
		end
	end)
	setActive(arg_2_0.rtPanel, true)
	setActive(arg_2_0.rtSelectWindow, false)
	arg_2_0:BlurPanel(arg_2_0._tf)
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.rtBg, function()
		if isActive(arg_5_0.rtSelectWindow) then
			arg_5_0:CloseSelectWindow()
		else
			arg_5_0:closeView()
		end
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.btnClose, function()
		arg_5_0:closeView()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnConfirm, function()
		if arg_5_0.heap:GetLength() > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("loveactivity_ui_19"))

			return
		end

		local var_8_0 = {}

		for iter_8_0, iter_8_1 in pairs(arg_5_0.confirmDic) do
			local var_8_1, var_8_2 = unpack(arg_5_0.giftItemList[iter_8_1])

			table.insert(var_8_0, {
				year = iter_8_0,
				group_id = var_8_2 or arg_5_0.giftGroupList[iter_8_1],
				item_id = var_8_1
			})
		end

		arg_5_0:emit(LoveLetterGiftCollectMediator.ON_RECORD_GIFT, var_8_0)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnSelectClose, function()
		arg_5_0:CloseSelectWindow()
	end, SFX_CANCEL)
	arg_5_0:InitGift()
	arg_5_0:DropHump()
	arg_5_0:UpdateDisplay()
end

function var_0_0.InitGift(arg_10_0)
	arg_10_0.giftItemList = underscore.to_array(arg_10_0.contextData.items)
	arg_10_0.giftGroupList = {}

	local var_10_0, var_10_1, var_10_2 = getProxy(LoveLetterProxy):GetLoveLetterItemDic()
	local var_10_3 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.giftItemList) do
		local var_10_4, var_10_5 = unpack(iter_10_1)

		assert(tobool(var_10_5) == (pg.item_data_statistics[var_10_4].type == Item.LOVE_LETTER_TYPE))

		local var_10_6 = var_10_5 and var_10_2[var_10_5] or var_10_5 or 0

		for iter_10_2, iter_10_3 in pairs(var_10_0[var_10_4 .. "_" .. var_10_6]) do
			assert(not arg_10_0.giftGroupList[iter_10_0] or arg_10_0.giftGroupList[iter_10_0] == iter_10_3)

			arg_10_0.giftGroupList[iter_10_0] = iter_10_3
			var_10_3[iter_10_2] = var_10_3[iter_10_2] or {}

			table.insert(var_10_3[iter_10_2], iter_10_0)
		end
	end

	arg_10_0.itemDic = var_10_0
	arg_10_0.yearDic = var_10_3
	arg_10_0.confirmDic = {}
	arg_10_0.heap = Heap.New(underscore.keys(var_10_3), function(arg_11_0)
		return #var_10_3[arg_11_0]
	end)
	arg_10_0.tempList = underscore(arg_10_0.yearDic):chain():keys():sort():value()

	assert(#arg_10_0.giftItemList == #arg_10_0.tempList)
end

function var_0_0.ConfirmItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.confirmDic[arg_12_1] = arg_12_2

	for iter_12_0, iter_12_1 in pairs(arg_12_0.yearDic) do
		if table.removebyvalue(arg_12_0.yearDic[iter_12_0], arg_12_2) > 0 then
			arg_12_0.heap:UpdateValue(iter_12_0)
		end
	end
end

function var_0_0.DropHump(arg_13_0)
	while arg_13_0.heap:GetLength() > 0 and arg_13_0.heap:GetTop().value == 1 do
		local var_13_0, var_13_1 = arg_13_0.heap:POP()
		local var_13_2 = arg_13_0.yearDic[var_13_0][1]

		arg_13_0:ConfirmItem(var_13_0, var_13_2)
	end
end

function var_0_0.UpdateDisplay(arg_14_0)
	arg_14_0.itemList:align(#arg_14_0.tempList)
end

function var_0_0.OpenSelectWindow(arg_15_0, arg_15_1)
	setText(arg_15_0.textSelectTitile, i18n("loveactivity_ui_9", arg_15_1))
	setActive(arg_15_0.rtPanel, false)
	setActive(arg_15_0.rtSelectWindow, true)

	local var_15_0

	UIItemList.StaticAlign(arg_15_0.rtSelectScrollContent, arg_15_0.rtSelectScrollTpl, #arg_15_0.yearDic[arg_15_1], function(arg_16_0, arg_16_1, arg_16_2)
		arg_16_1 = arg_16_1 + 1

		if arg_16_0 == UIItemList.EventUpdate then
			local var_16_0 = arg_15_0.yearDic[arg_15_1][arg_16_1]
			local var_16_1, var_16_2 = unpack(arg_15_0.giftItemList[var_16_0])

			updateDrop(arg_16_2:Find("mask/IconTpl"), Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = var_16_1,
				extra = var_16_2
			}))
			onToggle(arg_15_0, arg_16_2, function(arg_17_0)
				if arg_17_0 then
					var_15_0 = var_16_0
				end
			end, SFX_PANEL)
		end
	end)
	triggerToggle(arg_15_0.rtSelectScrollContent:GetChild(0), true)
	onButton(arg_15_0, arg_15_0.btnSelectConfirm, function()
		arg_15_0.heap:POP(arg_15_1)
		arg_15_0:ConfirmItem(arg_15_1, var_15_0)
		arg_15_0:DropHump()
		arg_15_0:UpdateDisplay()
		arg_15_0:CloseSelectWindow()
	end, SFX_CONFIRM)
end

function var_0_0.CloseSelectWindow(arg_19_0)
	setActive(arg_19_0.rtPanel, true)
	setActive(arg_19_0.rtSelectWindow, false)
end

function var_0_0.willExit(arg_20_0)
	arg_20_0:UnOverlayPanel(arg_20_0._tf)
	arg_20_0.itemList:each(function(arg_21_0, arg_21_1)
		arg_21_0 = arg_21_0 + 1

		eachChild(arg_21_1:Find("now/medal"), function(arg_22_0, arg_22_1)
			returnLoveLetterMedal(arg_22_0)
		end)
	end)
end

return var_0_0
