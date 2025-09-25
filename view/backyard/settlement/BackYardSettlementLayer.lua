local var_0_0 = class("BackYardSettlementLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BackYardStatisticsUI"
end

function var_0_0.setShipVOs(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.oldShipVOs = arg_2_1
	arg_2_0.newShipVOs = arg_2_2
end

function var_0_0.setDormVO(arg_3_0, arg_3_1)
	arg_3_0.dormVO = arg_3_1
end

function var_0_0.init(arg_4_0)
	arg_4_0.frame = arg_4_0:findTF("frame")
	arg_4_0.painting = arg_4_0:findTF("painting")
	arg_4_0.confirmBtn = arg_4_0:findTF("painting/confirm_btn")
	arg_4_0.timeTF = arg_4_0:findTF("ship_word/text_contain1")
	arg_4_0.expTF = arg_4_0:findTF("ship_word/text_contain2")
	arg_4_0.emptyTF = arg_4_0:findTF("ship_word/Text")
	arg_4_0.uilist = UIItemList.New(arg_4_0:findTF("container", arg_4_0.frame), arg_4_0:findTF("container/ship_tpl", arg_4_0.frame))
end

function var_0_0.didEnter(arg_5_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)
	onButton(arg_5_0, arg_5_0.confirmBtn, function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SOUND_BACK)

	arg_5_0.cards = {}

	arg_5_0.uilist:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_5_0.cards[arg_7_1] = BackYardSettlementCard.New(arg_7_2)
		end
	end)

	local var_5_0, var_5_1 = arg_5_0:UpdateShips()

	arg_5_0:InitPainting(var_5_0, var_5_1)
end

function var_0_0.InitPainting(arg_8_0, arg_8_1, arg_8_2)
	setPaintingPrefabAsync(arg_8_0.painting, arg_8_1:getPainting(), "jiesuan")
	setActive(arg_8_0.timeTF, arg_8_0.dormVO.food ~= 0)
	setActive(arg_8_0.expTF, arg_8_0.dormVO.food ~= 0)
	setActive(arg_8_0.emptyTF, arg_8_0.dormVO.food == 0)

	if arg_8_0.dormVO.food == 0 then
		setText(arg_8_0.emptyTF, i18n("backyard_backyardGranaryLayer_noFood"))
	else
		local var_8_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_8_0.dormVO.load_time
		local var_8_1 = i18n("backyard_addExp_Info", pg.TimeMgr.GetInstance():DescCDTime(var_8_0), arg_8_0.dormVO.load_food, arg_8_2)
		local var_8_2 = string.split(var_8_1, "||")

		assert(#var_8_2 > 0, "gametip ==> backyard_addExp_Info 必须用||分开")

		local var_8_3 = arg_8_0:findTF("ship_word/text_contain1")
		local var_8_4 = 0

		while var_8_4 < var_8_3.childCount do
			setText(var_8_3:GetChild(var_8_4), var_8_2[var_8_4 + 1])

			var_8_4 = var_8_4 + 1
		end

		local var_8_5 = arg_8_0:findTF("ship_word/text_contain2")
		local var_8_6 = 0

		while var_8_6 < var_8_5.childCount do
			setText(var_8_5:GetChild(var_8_6), var_8_2[var_8_4 + 1])

			var_8_4 = var_8_4 + 1
			var_8_6 = var_8_6 + 1
		end
	end
end

function var_0_0.UpdateShips(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = 0

	for iter_9_0, iter_9_1 in pairs(arg_9_0.newShipVOs) do
		table.insert(var_9_0, iter_9_0)

		local var_9_2 = arg_9_0.oldShipVOs[iter_9_0]

		if var_9_2.level ~= var_9_2:getMaxLevel() then
			var_9_1 = var_9_1 + 1
		end
	end

	arg_9_0.uilist:align(#var_9_0)

	local var_9_3 = arg_9_0.dormVO.load_exp
	local var_9_4 = {}

	for iter_9_2, iter_9_3 in pairs(arg_9_0.cards) do
		table.insert(var_9_4, function(arg_10_0)
			if arg_9_0.exited then
				return
			end

			local var_10_0 = var_9_0[iter_9_2 + 1]

			iter_9_3:Update(var_9_3, arg_9_0.oldShipVOs[var_10_0], arg_9_0.newShipVOs[var_10_0])
			onNextTick(arg_10_0)
		end)
	end

	seriesAsync(var_9_4)

	return arg_9_0.newShipVOs[var_9_0[1]], var_9_1 * var_9_3
end

function var_0_0.willExit(arg_11_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf, pg.UIMgr.GetInstance().UIMain)

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.cards) do
		iter_11_1:Dispose()
	end
end

return var_0_0
