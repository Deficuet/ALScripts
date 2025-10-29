local var_0_0 = class("Shrine2022SelectShipView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "Shrine2022SelectShipUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:updateCardList()
	arg_2_0:Show()
	arg_2_0:playEnterAni(true)
end

function var_0_0.OnDestroy(arg_3_0)
	arg_3_0:cleanManagedTween()
end

function var_0_0.initData(arg_4_0)
	arg_4_0.cardPosList = {
		{
			x = -80,
			y = 240
		},
		{
			x = -80,
			y = 40
		},
		{
			x = -80,
			y = -162
		},
		{
			x = -80,
			y = -363
		},
		{
			x = 94,
			y = 195
		},
		{
			x = 94,
			y = -7
		},
		{
			x = 94,
			y = -210
		}
	}
	arg_4_0.confirmPosList = {
		{
			x = -452,
			y = -34
		},
		{
			x = -160,
			y = -34
		},
		{
			x = 140,
			y = -34
		},
		{
			x = 440,
			y = -34
		},
		{
			x = -304,
			y = -400
		},
		{
			x = -6,
			y = -400
		},
		{
			x = 297,
			y = -400
		}
	}
	arg_4_0.onCloseFunc = arg_4_0.contextData.onClose
	arg_4_0.onSelectFunc = arg_4_0.contextData.onSelect
	arg_4_0.onConfirmFunc = arg_4_0.contextData.onConfirm
	arg_4_0.shipGameID = arg_4_0.contextData.shipGameID
	arg_4_0.shipGameData = getProxy(MiniGameProxy):GetMiniGameData(arg_4_0.shipGameID)
	arg_4_0.selectingCardIndex = arg_4_0.contextData.selectingCardIndex
	arg_4_0.curSelectIndex = nil
end

function var_0_0.initUI(arg_5_0)
	arg_5_0.bg = arg_5_0._tf:Find("BG")
	arg_5_0.cardTpl = arg_5_0._tf:Find("CardTpl")
	arg_5_0.backBtn = arg_5_0._tf:Find("Adapt/BackBtn")
	arg_5_0.helpBtn = arg_5_0._tf:Find("Adapt/HelpBtn")
	arg_5_0.panelTF = arg_5_0._tf:Find("Adapt/Panel")
	arg_5_0.tipTF = arg_5_0._tf:Find("Adapt/Tip")
	arg_5_0.cardContainer = arg_5_0.panelTF:Find("CardContainer")
	arg_5_0.cardUIItemList = UIItemList.New(arg_5_0.cardContainer, arg_5_0.cardTpl)
	arg_5_0.confirmBtn = arg_5_0._tf:Find("ConfirmBtn")

	onButton(arg_5_0, arg_5_0.bg, function()
		arg_5_0:closeSelf()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		arg_5_0:closeSelf()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.Pray_activity_tips1.tip
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.confirmBtn, function()
		if arg_5_0.onConfirmFunc then
			arg_5_0.onConfirmFunc(arg_5_0.curSelectIndex)
		end

		setActive(arg_5_0.confirmBtn, false)
		arg_5_0:closeSelf()
	end, SFX_PANEL)
	arg_5_0.cardUIItemList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_10_1 + 1
			local var_10_1 = "cardselect_" .. var_10_0
			local var_10_2 = "Shrine2022/" .. var_10_1

			setImageSprite(arg_10_2, LoadSprite(var_10_2, var_10_1), true)

			local var_10_3 = arg_10_2:Find("Name")
			local var_10_4 = "cardselectname_" .. var_10_0
			local var_10_5 = "Shrine2022/" .. var_10_4

			setImageSprite(var_10_3, LoadSprite(var_10_5, var_10_4), true)
			setLocalPosition(arg_10_2, arg_5_0.cardPosList[var_10_0])

			local var_10_6 = arg_10_2:Find("Selected")
			local var_10_7 = arg_5_0:isSelected(var_10_0)

			setActive(var_10_6, var_10_7)
			setActive(var_10_3, not var_10_7)

			GetComponent(arg_10_2, "Toggle").enabled = not var_10_7

			if not var_10_7 then
				onToggle(arg_5_0, arg_10_2, function(arg_11_0)
					if arg_11_0 then
						arg_5_0.curSelectIndex = var_10_0

						if arg_5_0.onSelectFunc then
							arg_5_0.onSelectFunc(var_10_0)
						end
					end

					arg_5_0:updateConfirmBtn(arg_11_0)
				end, SFX_PANEL)
			end
		end
	end)
end

function var_0_0.closeSelf(arg_12_0)
	if arg_12_0.isPlaying then
		return
	end

	if arg_12_0.onCloseFunc then
		arg_12_0.onCloseFunc()
	end

	arg_12_0:playEnterAni(false, function()
		arg_12_0:Destroy()
	end)
end

function var_0_0.updateConfirmBtn(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.confirmPosList[arg_14_0.selectingCardIndex]

	setLocalPosition(arg_14_0.confirmBtn, var_14_0)
	setActive(arg_14_0.confirmBtn, arg_14_1)
end

function var_0_0.updateCardList(arg_15_0)
	local var_15_0 = 7

	arg_15_0.cardUIItemList:align(var_15_0)
end

function var_0_0.playEnterAni(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_1 and -1000 or 0
	local var_16_1 = arg_16_1 and 0 or -1000
	local var_16_2 = 0.3
	local var_16_3 = {
		x = var_16_0,
		y = rtf(arg_16_0.panelTF).anchoredPosition.y
	}

	arg_16_0.isPlaying = true

	arg_16_0:managedTween(LeanTween.value, nil, go(arg_16_0.panelTF), var_16_0, var_16_1, var_16_2):setOnUpdate(System.Action_float(function(arg_17_0)
		var_16_3.x = arg_17_0

		setAnchoredPosition(arg_16_0.panelTF, var_16_3)
	end)):setOnComplete(System.Action(function()
		arg_16_0.isPlaying = false

		if arg_16_2 then
			arg_16_2()
		end
	end))

	local var_16_4 = arg_16_1 and -100 or 38
	local var_16_5 = arg_16_1 and 38 or -100
	local var_16_6 = {
		x = rtf(arg_16_0.tipTF).anchoredPosition.x,
		y = var_16_4
	}

	arg_16_0:managedTween(LeanTween.value, nil, go(arg_16_0.tipTF), var_16_4, var_16_5, var_16_2):setOnUpdate(System.Action_float(function(arg_19_0)
		var_16_6.y = arg_19_0

		setAnchoredPosition(arg_16_0.tipTF, var_16_6)
	end))
end

function var_0_0.isSelected(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.shipGameData:GetRuntimeData("kvpElements")[1]

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		if iter_20_1.value == arg_20_1 then
			return true
		end
	end

	return false
end

return var_0_0
