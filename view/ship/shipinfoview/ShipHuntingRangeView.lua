local var_0_0 = class("ShipHuntingRangeView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ShipHuntingRangeView"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.huntingRange = arg_2_0._tf

	setActive(arg_2_0.huntingRange, false)

	arg_2_0.curLevel = arg_2_0.huntingRange:Find("frame/current_level")
	arg_2_0.showLevel = arg_2_0.huntingRange:Find("frame/level/Text")
	arg_2_0.tips = arg_2_0.huntingRange:Find("frame/tips")
	arg_2_0.closeBtn = arg_2_0.huntingRange:Find("frame/close_btn")
	arg_2_0.helpBtn = arg_2_0.huntingRange:Find("frame/help")
	arg_2_0.cellRoot = arg_2_0.huntingRange:Find("frame/range")
	arg_2_0.onSelected = false
end

function var_0_0.SetShareData(arg_3_0, arg_3_1)
	arg_3_0.shareData = arg_3_1
end

function var_0_0.GetShipVO(arg_4_0)
	if arg_4_0.shareData and arg_4_0.shareData.shipVO then
		return arg_4_0.shareData.shipVO
	end

	return nil
end

function var_0_0.DisplayHuntingRange(arg_5_0)
	arg_5_0.onSelected = true

	local var_5_0 = arg_5_0:GetShipVO()

	setActive(arg_5_0.huntingRange, true)
	arg_5_0:UpdateHuntingRange(var_5_0, var_5_0:getHuntingLv())
	setText(arg_5_0.curLevel, "Lv." .. var_5_0:getHuntingLv())
	setText(arg_5_0.tips, i18n("ship_hunting_level_tips"))
	onButton(arg_5_0, arg_5_0.closeBtn, function()
		arg_5_0:HideHuntingRange()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_hunting.tip
		})
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0.huntingRange)
end

function var_0_0.UpdateHuntingRange(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.cellRoot

	for iter_8_0 = 0, var_8_0.childCount - 1 do
		local var_8_1 = var_8_0:GetChild(iter_8_0)

		setActive(arg_8_0:findTF("activate", var_8_1), false)
	end

	local var_8_2 = arg_8_1:getHuntingRange(arg_8_2)

	_.each(var_8_2, function(arg_9_0)
		local var_9_0 = arg_9_0[1]
		local var_9_1 = arg_9_0[2]
		local var_9_2 = var_9_0 * 7 + var_9_1 + math.floor(24.5)
		local var_9_3 = var_8_0:GetChild(var_9_2)

		if var_9_3 and var_9_2 ~= 24 then
			setActive(arg_8_0:findTF("activate", var_9_3), true)
		end
	end)

	local var_8_3 = arg_8_0.huntingRange:Find("frame/last")
	local var_8_4 = arg_8_0.huntingRange:Find("frame/next")

	setActive(var_8_3, arg_8_2 > 1)
	setActive(var_8_4, arg_8_2 < #arg_8_1:getConfig("hunting_range"))
	setText(arg_8_0.showLevel, "Lv." .. arg_8_2)
	onButton(arg_8_0, var_8_3, function()
		local var_10_0 = arg_8_2 - 1

		if var_10_0 == 0 then
			var_10_0 = #arg_8_1:getConfig("hunting_range")
		end

		arg_8_0:UpdateHuntingRange(arg_8_1, var_10_0)
	end, SFX_PANEL)
	onButton(arg_8_0, var_8_4, function()
		local var_11_0 = arg_8_2 + 1

		if var_11_0 == #arg_8_1:getConfig("hunting_range") + 1 then
			var_11_0 = 1
		end

		arg_8_0:UpdateHuntingRange(arg_8_1, var_11_0)
	end, SFX_PANEL)
end

function var_0_0.HideHuntingRange(arg_12_0)
	setActive(arg_12_0.huntingRange, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0.huntingRange, arg_12_0._tf)

	arg_12_0.onSelected = false
end

function var_0_0.OnDestroy(arg_13_0)
	arg_13_0:HideHuntingRange()

	arg_13_0.shareData = nil
end

return var_0_0
