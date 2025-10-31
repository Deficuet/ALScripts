local var_0_0 = class("MetaCharacterRepairLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MetaCharacterRepairUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initTipText()
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()

	for iter_2_0, iter_2_1 in ipairs(MetaCharacterConst.REPAIR_ATTRS) do
		if not arg_2_0.curMetaCharacterVO:getAttrVO(iter_2_1):isLock() then
			triggerToggle(arg_2_0.attrTFList[iter_2_1], true)

			break
		end
	end
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:doRepairProgressPanelAni()
	arg_3_0:updateAttrListPanel()
	arg_3_0:updateRepairBtn()
	arg_3_0:updateDetailPanel()
	arg_3_0:TryPlayGuide()
end

function var_0_0.willExit(arg_4_0)
	return
end

function var_0_0.onBackPressed(arg_5_0)
	if isActive(arg_5_0.repairEffectBoxPanel) then
		arg_5_0:closeRepairEffectBoxPanel()

		return
	elseif isActive(arg_5_0.detailPanel) then
		arg_5_0:closeDetailPanel()

		return
	else
		arg_5_0:emit(var_0_0.ON_BACK_PRESSED)
	end
end

function var_0_0.initTipText(arg_6_0)
	local var_6_0 = arg_6_0._tf:Find("Repair/AttrListPanel/AttrItemContainer/AttrItemCannon/SelectedPanel/AttrRepairTipText")
	local var_6_1 = arg_6_0._tf:Find("Repair/AttrListPanel/AttrItemContainer/AttrItemTorpedo/SelectedPanel/AttrRepairTipText")
	local var_6_2 = arg_6_0._tf:Find("Repair/AttrListPanel/AttrItemContainer/AttrItemAir/SelectedPanel/AttrRepairTipText")
	local var_6_3 = arg_6_0._tf:Find("Repair/AttrListPanel/AttrItemContainer/AttrItemReload/SelectedPanel/AttrRepairTipText")

	setText(var_6_0, i18n("meta_repair"))
	setText(var_6_1, i18n("meta_repair"))
	setText(var_6_2, i18n("meta_repair"))
	setText(var_6_3, i18n("meta_repair"))
end

function var_0_0.initData(arg_7_0)
	arg_7_0.metaCharacterProxy = getProxy(MetaCharacterProxy)
	arg_7_0.bayProxy = getProxy(BayProxy)
	arg_7_0.attrTFList = {}
	arg_7_0.curAttrName = nil
	arg_7_0.curMetaShipID = arg_7_0.contextData.shipID
	arg_7_0.curShipVO = nil
	arg_7_0.curMetaCharacterVO = nil

	arg_7_0:updateData()
end

function var_0_0.findUI(arg_8_0)
	arg_8_0.repairPanel = arg_8_0._tf:Find("Repair")
	arg_8_0.attrListPanel = arg_8_0.repairPanel:Find("AttrListPanel")
	arg_8_0.attrItemContainer = arg_8_0.attrListPanel:Find("AttrItemContainer")
	arg_8_0.attrCannonTF = arg_8_0.attrItemContainer:Find("AttrItemCannon")
	arg_8_0.attrTorpedoTF = arg_8_0.attrItemContainer:Find("AttrItemTorpedo")
	arg_8_0.attrAirTF = arg_8_0.attrItemContainer:Find("AttrItemAir")
	arg_8_0.attrReloadTF = arg_8_0.attrItemContainer:Find("AttrItemReload")
	arg_8_0.attrTFList.cannon = arg_8_0.attrCannonTF
	arg_8_0.attrTFList.torpedo = arg_8_0.attrTorpedoTF
	arg_8_0.attrTFList.air = arg_8_0.attrAirTF
	arg_8_0.attrTFList.reload = arg_8_0.attrReloadTF
	arg_8_0.repairPercentText = arg_8_0.repairPanel:Find("SynProgressPanel/SynRate/NumTextText")
	arg_8_0.repairSliderTF = arg_8_0.repairPanel:Find("SynProgressPanel/Slider")
	arg_8_0.repairBtn = arg_8_0.repairPanel:Find("RepairBtn")
	arg_8_0.repairBtnDisable = arg_8_0.repairPanel:Find("RepairBtnDisable")
	arg_8_0.showDetailLine = arg_8_0._tf:Find("ShowDetailLine")
	arg_8_0.showDetailBtn = arg_8_0.showDetailLine:Find("ShowDetailBtn")
	arg_8_0.detailPanel = arg_8_0._tf:Find("Detail")
	arg_8_0.detailBG = arg_8_0.detailPanel:Find("BG")
	arg_8_0.detailTF = arg_8_0.detailPanel:Find("Panel")
	arg_8_0.detailCloseBtn = arg_8_0.detailTF:Find("CloseBtn")
	arg_8_0.detailLineTpl = arg_8_0.detailTF:Find("DetailLineTpl")
	arg_8_0.detailItemTpl = arg_8_0.detailTF:Find("DetailItemTpl")
	arg_8_0.detailItemContainer = arg_8_0.detailTF:Find("ScrollView/Viewport/Content")
	arg_8_0.repairEffectBoxPanel = arg_8_0._tf:Find("RepairEffectBox")
end

function var_0_0.addListener(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.attrTFList) do
		onToggle(arg_9_0, iter_9_1, function(arg_10_0)
			if arg_10_0 == true then
				arg_9_0.curAttrName = iter_9_0

				arg_9_0:updateRepairBtn()
			else
				arg_9_0.curAttrName = nil

				arg_9_0:updateRepairBtn(true)
			end
		end, SFX_PANEL)
	end

	onButton(arg_9_0, arg_9_0.repairBtn, function()
		pg.m02:sendNotification(GAME.REPAIR_META_CHARACTER, {
			shipID = arg_9_0.curMetaShipID,
			attr = arg_9_0.curAttrName
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.showDetailBtn, function()
		if not isActive(arg_9_0.detailPanel) then
			arg_9_0:openDetailPanel()
		end
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.showDetailLine, function()
		if not isActive(arg_9_0.detailPanel) then
			arg_9_0:openDetailPanel()
		end
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.detailCloseBtn, function()
		arg_9_0:closeDetailPanel()
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.detailBG, function()
		arg_9_0:closeDetailPanel()
	end, SFX_CANCEL)
end

function var_0_0.TryPlayGuide(arg_16_0)
	pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0027")
end

function var_0_0.doRepairProgressPanelAni(arg_17_0)
	local var_17_0 = arg_17_0.curMetaCharacterVO:getRepairRate()
	local var_17_1 = GetComponent(arg_17_0.repairSliderTF, typeof(Slider))

	var_17_1.minValue = 0
	var_17_1.maxValue = 1

	local var_17_2 = var_17_1.value

	if var_17_0 > 0 then
		local var_17_3 = 0.5

		arg_17_0:managedTween(LeanTween.value, nil, go(arg_17_0.repairSliderTF), var_17_2, var_17_0, var_17_3):setOnUpdate(System.Action_float(function(arg_18_0)
			arg_17_0:updateRepairProgressPanel(arg_18_0)
		end)):setOnComplete(System.Action(function()
			arg_17_0:updateRepairProgressPanel(var_17_0)
		end))
	else
		arg_17_0:updateRepairProgressPanel(var_17_0)
	end
end

function var_0_0.updateRepairProgressPanel(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1 or arg_20_0.curMetaCharacterVO:getRepairRate()

	setSlider(arg_20_0.repairSliderTF, 0, 1, var_20_0)
	setText(arg_20_0.repairPercentText, string.format("%d", var_20_0 * 100))
end

function var_0_0.updateAttrListPanel(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(MetaCharacterConst.REPAIR_ATTRS) do
		arg_21_0:updateAttrItem(arg_21_0.attrTFList[iter_21_1], iter_21_1)
	end
end

function var_0_0.updateAttrItem(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_1:Find("LockPanel")
	local var_22_1 = arg_22_1:Find("UnSelectPanel")
	local var_22_2 = arg_22_1:Find("SelectedPanel")
	local var_22_3 = var_22_2:Find("TitleImg")

	GetComponent(var_22_3, "Image"):SetNativeSize()

	local var_22_4 = arg_22_0.curMetaCharacterVO:getAttrVO(arg_22_2)

	if var_22_4:isLock() then
		setActive(var_22_1, false)
		setActive(var_22_2, false)
		setActive(var_22_0, true)

		arg_22_1:GetComponent("Toggle").interactable = false
	else
		local var_22_5 = arg_22_1:GetComponent("Toggle")

		setActive(var_22_1, not var_22_5.isOn)
		setActive(var_22_2, var_22_5.isOn)
		setActive(var_22_0, false)

		var_22_5.interactable = true

		local var_22_6 = var_22_1:Find("ValueText")
		local var_22_7 = var_22_2:Find("ValueText")
		local var_22_8 = var_22_2:Find("AttrRepairValue/CurValueText")
		local var_22_9 = var_22_2:Find("AttrRepairValue/Image")
		local var_22_10 = var_22_2:Find("AttrRepairValue/NextValueText")
		local var_22_11 = var_22_2:Find("IconTpl")
		local var_22_12 = var_22_2:Find("ItemCount")
		local var_22_13 = var_22_12:Find("NumText")
		local var_22_14 = var_22_4:getAddition()

		setText(var_22_6, "+" .. var_22_14)
		setText(var_22_7, "+" .. var_22_14)
		setText(var_22_8, "+" .. var_22_14)

		local var_22_15 = var_22_4:getLevel()
		local var_22_16 = var_22_4:isMaxLevel()
		local var_22_17

		if not var_22_16 then
			var_22_17 = var_22_4:getItem()
		else
			var_22_17 = var_22_4:getItemByLevel(var_22_15 - 1)
		end

		local var_22_18 = var_22_17:getItemId()
		local var_22_19 = var_22_17:getTotalCnt()
		local var_22_20 = getProxy(BagProxy):getItemCountById(var_22_18)

		if var_22_20 < var_22_19 then
			var_22_20 = setColorStr(var_22_20, COLOR_RED)
		end

		setText(var_22_13, var_22_20 .. "/" .. var_22_19)

		local var_22_21 = {
			type = DROP_TYPE_ITEM,
			id = var_22_18,
			count = var_22_19
		}

		updateDrop(var_22_11, var_22_21, {
			hideName = true
		})
		onButton(arg_22_0, var_22_11, function()
			arg_22_0:emit(BaseUI.ON_DROP, var_22_21)
		end, SFX_PANEL)
		setActive(var_22_9, not var_22_16)
		setActive(var_22_10, not var_22_16)

		if var_22_16 then
			setText(var_22_10, var_22_14)
		else
			local var_22_22 = var_22_17:getAdditionValue()

			setText(var_22_10, "+" .. var_22_14 + var_22_22)
		end

		if var_22_16 then
			setActive(var_22_11, false)
			setActive(var_22_12, false)
		else
			setActive(var_22_11, true)
			setActive(var_22_12, true)
		end
	end
end

function var_0_0.updateRepairBtn(arg_24_0, arg_24_1)
	if arg_24_1 == true then
		setActive(arg_24_0.repairBtn, false)
		setActive(arg_24_0.repairBtnDisable, false)

		return
	end

	local var_24_0 = arg_24_0.curMetaCharacterVO:getAttrVO(arg_24_0.curAttrName)
	local var_24_1 = var_24_0:getLevel()
	local var_24_2 = var_24_0:isMaxLevel()
	local var_24_3

	if not var_24_2 then
		var_24_3 = var_24_0:getItem()
	else
		var_24_3 = var_24_0:getItemByLevel(var_24_1 - 1)
	end

	local var_24_4 = var_24_3:getItemId()
	local var_24_5 = var_24_3:getTotalCnt() <= getProxy(BagProxy):getItemCountById(var_24_4)

	if var_24_2 then
		setActive(arg_24_0.repairBtn, false)
		setActive(arg_24_0.repairBtnDisable, false)
	elseif not var_24_5 then
		setActive(arg_24_0.repairBtn, false)
		setActive(arg_24_0.repairBtnDisable, true)
	else
		setActive(arg_24_0.repairBtn, true)
		setActive(arg_24_0.repairBtnDisable, false)
	end
end

function var_0_0.updateDetailItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_1:Find("LineContainer")
	local var_25_1 = arg_25_1:Find("LockPanel")
	local var_25_2 = var_25_1:Find("TipText")
	local var_25_3 = arg_25_2.progress

	setText(var_25_2, i18n("meta_repair_effect_unlock", var_25_3))

	local var_25_4 = arg_25_0.curMetaCharacterVO:getRepairRate()

	setActive(var_25_1, not (var_25_3 <= var_25_4 * 100))

	local var_25_5 = arg_25_2:getAttrAdditionList()
	local var_25_6 = #var_25_5
	local var_25_7 = arg_25_2:getDescs()
	local var_25_8 = var_25_6 + #var_25_7 + 1
	local var_25_9 = UIItemList.New(var_25_0, arg_25_0.detailLineTpl)

	var_25_9:make(function(arg_26_0, arg_26_1, arg_26_2)
		local var_26_0 = arg_26_2:Find("AttrLine")
		local var_26_1 = arg_26_2:Find("UnlockTipLine")
		local var_26_2 = arg_26_2:Find("Text")

		if arg_26_0 == UIItemList.EventUpdate then
			arg_26_1 = arg_26_1 + 1

			if arg_26_1 == 1 then
				setActive(var_26_0, false)
				setActive(var_26_1, false)
				setActive(var_26_2, true)
				setText(var_26_2, i18n("meta_repair_effect_unlock", var_25_3))

				return
			end

			if arg_26_1 <= var_25_6 + 1 then
				setActive(var_26_0, true)
				setActive(var_26_1, false)

				local var_26_3 = var_26_0:Find("AttrIcon")
				local var_26_4 = var_26_0:Find("AttrNameText")
				local var_26_5 = var_26_0:Find("NumText")
				local var_26_6 = var_25_5[arg_26_1 - 1]
				local var_26_7 = var_26_6[1]
				local var_26_8 = var_26_6[2]

				setImageSprite(var_26_3, LoadSprite("attricon", var_26_7))
				setText(var_26_4, AttributeType.Type2Name(var_26_7))
				setText(var_26_5, "+" .. var_26_8)
			else
				setActive(var_26_0, false)
				setActive(var_26_1, true)

				local var_26_9 = var_26_1:Find("Text")
				local var_26_10 = var_25_7[arg_26_1 - 1 - var_25_6]

				setScrollText(var_26_9, var_26_10)
			end
		end
	end)
	var_25_9:align(var_25_8)
end

function var_0_0.updateDetailPanel(arg_27_0)
	setActive(arg_27_0.detailPanel, false)

	local var_27_0 = arg_27_0.curMetaCharacterVO:getEffects()

	arg_27_0.detailList = UIItemList.New(arg_27_0.detailItemContainer, arg_27_0.detailItemTpl)

	arg_27_0.detailList:make(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == UIItemList.EventUpdate then
			local var_28_0 = var_27_0[arg_28_1 + 1]

			arg_27_0:updateDetailItem(arg_28_2, var_28_0)
		end
	end)
	arg_27_0.detailList:align(#var_27_0)
end

function var_0_0.updateData(arg_29_0)
	arg_29_0.curShipVO = arg_29_0.bayProxy:getShipById(arg_29_0.curMetaShipID)
	arg_29_0.curMetaCharacterVO = arg_29_0.curShipVO:getMetaCharacter()
end

function var_0_0.checkSpecialEffect(arg_30_0)
	local var_30_0 = arg_30_0.bayProxy:getShipById(arg_30_0.curMetaShipID):getMetaCharacter()
	local var_30_1 = var_30_0:getRepairRate() * 100
	local var_30_2 = arg_30_0.curMetaCharacterVO:getRepairRate() * 100
	local var_30_3 = var_30_0:getEffects()

	for iter_30_0, iter_30_1 in ipairs(var_30_3) do
		local var_30_4 = iter_30_1.progress

		if var_30_2 < var_30_4 and var_30_4 <= var_30_1 then
			arg_30_0:openRepairEffectBoxPanel(iter_30_1)

			break
		end
	end
end

function var_0_0.openRepairEffectBoxPanel(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1:getAttrAdditionList()
	local var_31_1 = #var_31_0
	local var_31_2 = arg_31_1:getDescs()
	local var_31_3 = #var_31_2
	local var_31_4 = 1 + var_31_1 + var_31_3
	local var_31_5 = arg_31_1.progress
	local var_31_6 = arg_31_0.repairEffectBoxPanel:Find("BG")
	local var_31_7 = arg_31_0.repairEffectBoxPanel:Find("Box/BtnContainer/ConfirmBtn")

	onButton(arg_31_0, var_31_7, function()
		arg_31_0:closeRepairEffectBoxPanel()
	end, SFX_CANCEL)

	local var_31_8 = arg_31_0.repairEffectBoxPanel:Find("Box/Panel/TypeRepairEffect")
	local var_31_9 = var_31_8:Find("DetailLineTpl")
	local var_31_10 = UIItemList.New(var_31_8, var_31_9)

	var_31_10:make(function(arg_33_0, arg_33_1, arg_33_2)
		local var_33_0 = arg_33_2:Find("AttrLine")
		local var_33_1 = arg_33_2:Find("UnlockTipLine")

		if arg_33_0 == UIItemList.EventUpdate then
			arg_33_1 = arg_33_1 + 1

			if arg_33_1 == 1 then
				setActive(var_33_0, false)
				setActive(var_33_1, true)

				local var_33_2 = var_33_1:Find("Text")

				setScrollText(var_33_2, i18n("meta_repair_effect_special", var_31_5))
			elseif arg_33_1 > 1 and arg_33_1 <= 1 + var_31_1 then
				setActive(var_33_0, true)
				setActive(var_33_1, false)

				local var_33_3 = var_33_0:Find("AttrIcon")
				local var_33_4 = var_33_0:Find("AttrNameText")
				local var_33_5 = var_33_0:Find("NumText")
				local var_33_6 = var_31_0[arg_33_1 - 1]
				local var_33_7 = var_33_6[1]
				local var_33_8 = var_33_6[2]

				setImageSprite(var_33_3, LoadSprite("attricon", var_33_7))
				setText(var_33_4, AttributeType.Type2Name(var_33_7))
				setText(var_33_5, "+" .. var_33_8)
			elseif arg_33_1 > 1 + var_31_1 and arg_33_1 <= var_31_4 then
				setActive(var_33_0, false)
				setActive(var_33_1, true)

				local var_33_9 = var_33_1:Find("Text")
				local var_33_10 = var_31_2[arg_33_1 - (1 + var_31_1)]

				setScrollText(var_33_9, var_33_10)
			end
		end
	end)
	var_31_10:align(var_31_4)
	setActive(arg_31_0.repairEffectBoxPanel, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_31_0.repairEffectBoxPanel)
end

function var_0_0.closeRepairEffectBoxPanel(arg_34_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_34_0.repairEffectBoxPanel)
	setActive(arg_34_0.repairEffectBoxPanel, false)
end

function var_0_0.openDetailPanel(arg_35_0)
	setActive(arg_35_0.detailPanel, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_35_0.detailPanel)

	arg_35_0.isOpening = true

	arg_35_0:managedTween(LeanTween.value, nil, go(arg_35_0.detailTF), arg_35_0.detailTF.rect.width, 0, 0.3):setOnUpdate(System.Action_float(function(arg_36_0)
		setAnchoredPosition(arg_35_0.detailTF, {
			x = arg_36_0
		})
	end)):setOnComplete(System.Action(function()
		arg_35_0.isOpening = nil
	end))
end

function var_0_0.closeDetailPanel(arg_38_0)
	if arg_38_0.isClosing or arg_38_0.isOpening then
		return
	end

	arg_38_0.isClosing = true

	arg_38_0:managedTween(LeanTween.value, nil, go(arg_38_0.detailTF), 0, arg_38_0.detailTF.rect.width, 0.3):setOnUpdate(System.Action_float(function(arg_39_0)
		setAnchoredPosition(arg_38_0.detailTF, {
			x = arg_39_0
		})
	end)):setOnComplete(System.Action(function()
		arg_38_0.isClosing = nil

		setActive(arg_38_0.detailPanel, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_38_0.detailPanel)
	end))
end

return var_0_0
