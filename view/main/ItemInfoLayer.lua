local var_0_0 = class("ItemInfoLayer", import("..base.BaseUI"))
local var_0_1 = 5
local var_0_2 = 11
local var_0_3 = 100
local var_0_4 = 53996
local var_0_5 = {
	RESOLVE = 2,
	USE_RE_MAP = 4,
	USE = 3,
	COMPOSE = 1
}

function var_0_0.getUIName(arg_1_0)
	return "ItemInfoUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:BlurPanel(arg_2_0._tf)

	arg_2_0.window = arg_2_0._tf:Find("window")

	setText(arg_2_0.window:Find("top/bg/infomation/title"), i18n("words_information"))

	arg_2_0.btnContent = arg_2_0.window:Find("actions")

	eachChild(arg_2_0.btnContent, function(arg_3_0)
		setActive(arg_3_0, false)
	end)

	for iter_2_0, iter_2_1 in pairs({
		okBtn = {
			"ok_button",
			i18n("msgbox_text_confirm")
		},
		useBtn = {
			"use_button"
		},
		batchUseBtn = {
			"batch_use_button"
		},
		useOneBtn = {
			"use_one_button"
		},
		composeBtn = {
			"compose_button"
		},
		reMapUseBtn = {
			"re_map_use_button",
			i18n("msgbox_text_use")
		},
		resolveBtn = {
			"resolve_button",
			i18n("msgbox_text_analyse")
		},
		loveRepairBtn = {
			"love_lettle_repair_button",
			i18n("loveletter_exchange_button")
		},
		metaskillBtn = {
			"metaskill_use_btn",
			i18n("msgbox_text_use")
		},
		blueBtn = {
			"blue_btn"
		},
		yellowBtn = {
			"yellow_btn"
		},
		recycleBtn = {
			"recycle_btn",
			i18n("recycle_btn_label")
		},
		skinShopBtn = {
			"skin_shop_btn",
			i18n("go_skinshop_btn_label")
		},
		skinExperienceShopBtn = {
			"skin_experience_shop_btn",
			i18n("go_skinexperienceshop_btn_label")
		}
	}) do
		local var_2_0, var_2_1 = unpack(iter_2_1)

		arg_2_0[iter_2_0] = arg_2_0.btnContent:Find(var_2_0)

		if var_2_1 then
			setText(arg_2_0[iter_2_0]:Find("pic"), var_2_1)
		end
	end

	arg_2_0.itemTF = arg_2_0.window:Find("item")
	arg_2_0.operatePanel = arg_2_0._tf:Find("operate")
	arg_2_0.countTF = arg_2_0.operatePanel:Find("item/left/own/Text"):GetComponent(typeof(Text))
	arg_2_0.keepFateTog = arg_2_0.operatePanel:Find("got/keep_tog")

	setText(arg_2_0.keepFateTog:Find("label"), i18n("keep_fate_tip"))

	arg_2_0.operateBtns = {}
	arg_2_0.operateBtns.Confirm = arg_2_0.operatePanel:Find("actions/confirm_button")
	arg_2_0.operateBtns.Cancel = arg_2_0.operatePanel:Find("actions/cancel_button")
	arg_2_0.operateBtns.Resolve = arg_2_0.operatePanel:Find("actions/resolve_button")

	setText(arg_2_0.operateBtns.Confirm:Find("label"), i18n("msgbox_text_confirm"))
	setText(arg_2_0.operateBtns.Cancel:Find("label"), i18n("msgbox_text_cancel"))
	setText(arg_2_0.operateBtns.Resolve:Find("label"), i18n("msgbox_text_analyse"))
	SetActive(arg_2_0.operatePanel, false)
	SetActive(arg_2_0.window, true)

	arg_2_0.operateMode = nil
	arg_2_0.operateBonusList = arg_2_0.operatePanel:Find("got/panel_bg/list")
	arg_2_0.operateBonusTpl = arg_2_0.operatePanel:Find("got/panel_bg/list/item")
	arg_2_0.operateCountdesc = arg_2_0.operatePanel:Find("count/image_text")
	arg_2_0.operateValue = arg_2_0.operatePanel:Find("count/number_panel/value")
	arg_2_0.operateValueInput = arg_2_0.operatePanel:Find("count/number_panel/InputField")
	arg_2_0.operateLeftButton = arg_2_0.operatePanel:Find("count/number_panel/left")
	arg_2_0.operateRightButton = arg_2_0.operatePanel:Find("count/number_panel/right")
	arg_2_0.operateMaxButton = arg_2_0.operatePanel:Find("count/max")
	arg_2_0.recycleConfirmationPage = ItemRecycleConfirmationPage.New(pg.UIMgr.GetInstance().OverlayMain)

	arg_2_0.recycleConfirmationPage:SetCallback(function()
		setActive(arg_2_0._tf, false)
	end, function()
		setActive(arg_2_0._tf, true)
	end)
end

function var_0_0.getButton(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0[arg_6_1] = arg_6_0[arg_6_1] or cloneTplTo(arg_6_2, arg_6_0.btnContent)

	setActive(arg_6_0[arg_6_1], true)

	return arg_6_0[arg_6_1]
end

function var_0_0.setDrop(arg_7_0, arg_7_1)
	if arg_7_1.type == DROP_TYPE_SHIP then
		arg_7_0:setItemInfo(arg_7_1, arg_7_0.itemTF)
	elseif arg_7_1.type == DROP_TYPE_ITEM then
		arg_7_1.count = getProxy(BagProxy):getItemCountById(arg_7_1.id)

		arg_7_0:setItem(arg_7_1)
	else
		assert(false, "do not support current kind of type: " .. arg_7_1.type)
	end
end

function var_0_0.setItemInfo(arg_8_0, arg_8_1, arg_8_2)
	updateDrop(arg_8_2:Find("left/IconTpl"), setmetatable({
		count = 0
	}, {
		__index = arg_8_1
	}))
	UpdateOwnDisplay(arg_8_2:Find("left/own"), arg_8_1)
	RegisterDetailButton(arg_8_0, arg_8_2:Find("left/detail"), arg_8_1)
	setText(arg_8_2:Find("display_panel/name_container/name/Text"), arg_8_1:getConfig("name"))
	setText(arg_8_2:Find("display_panel/desc/Text"), arg_8_1.desc)

	local var_8_0 = arg_8_2:Find("display_panel/name_container/shiptype")

	setActive(var_8_0, arg_8_1.type == DROP_TYPE_SHIP)

	if arg_8_1.type == DROP_TYPE_SHIP then
		GetImageSpriteFromAtlasAsync("shiptype", shipType2print(arg_8_1:getConfig("type")), var_8_0, false)
	end
end

function var_0_0.updateItemCount(arg_9_0, arg_9_1)
	arg_9_0.countTF.text = arg_9_1
end

function var_0_0.setItem(arg_10_0, arg_10_1)
	arg_10_0:setItemInfo(arg_10_1, arg_10_0.itemTF)

	arg_10_0.itemVO = arg_10_1:getSubClass()

	if not Item.CanInBag(arg_10_0.itemVO.id) then
		return
	end

	local var_10_0 = arg_10_0.itemVO:getConfig("compose_number")

	if var_10_0 > 0 and var_10_0 <= arg_10_0.itemVO.count then
		arg_10_0:setItemInfo(arg_10_1, arg_10_0.operatePanel:Find("item"))

		arg_10_0.operateMax = arg_10_0.itemVO.count / var_10_0

		setActive(arg_10_0.composeBtn, true)
	end

	if arg_10_0.itemVO:getConfig("usage") == ItemUsage.SOS then
		setText(arg_10_0.useBtn:Find("text"), 1)
		setActive(arg_10_0.useBtn, true)
	end

	if arg_10_0.itemVO:getConfig("usage") == ItemUsage.EX_RE_MAP then
		arg_10_0:setItemInfo(arg_10_1, arg_10_0.operatePanel:Find("item"))

		arg_10_0.operateMax = arg_10_0.itemVO.count
	end

	local var_10_1 = arg_10_0.itemVO:getConfig("type")

	if arg_10_0.itemVO:IsRepairLoveLetterItem() then
		onButton(arg_10_0, arg_10_0.loveRepairBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("loveletter2018_ui_1"),
				onYes = function()
					arg_10_0:emit(ItemInfoMediator.REPAIR_LOVE_LETTER_ITEM, arg_10_0.itemVO)
				end
			})
		end, SFX_PANEL)
		setActive(arg_10_0.loveRepairBtn, true)
		setActive(arg_10_0.okBtn, false)
	elseif Item.IsLoveLetterCheckItem(arg_10_0.itemVO.id) then
		local var_10_2 = arg_10_0.itemVO.extra or pg.loveletter_2018_2021[arg_10_0.itemVO.id].ship_group_id
		local var_10_3 = arg_10_0:getButton("checkMail", arg_10_0.blueBtn)

		setText(var_10_3:Find("pic"), i18n("loveletter_recover_bottom1"))
		onButton(arg_10_0, var_10_3, function()
			arg_10_0:emit(ItemInfoMediator.CHECK_LOVE_LETTER_MAIL, arg_10_0.itemVO.id, var_10_2)
		end, SFX_CONFIRM)

		local var_10_4 = arg_10_0:getButton("repairMail", arg_10_0.yellowBtn)

		setText(var_10_4:Find("pic"), i18n("loveletter_recover_bottom2"))

		local var_10_5 = getProxy(BagProxy):GetLoveLetterRepairInfo(arg_10_0.itemVO.id .. "_" .. var_10_2)

		onButton(arg_10_0, var_10_4, function()
			if not var_10_5 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("loveletter_recover_tip1"))
			elseif #var_10_5 == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("loveletter_recover_tip3"))
			elseif #var_10_5 == 1 then
				local var_14_0 = var_10_5[1]

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					delayConfirm = 3,
					content = i18n("loveletter_recover_text1", var_14_0, ShipGroup.New({
						id = var_10_2
					}):getName()),
					onYes = function()
						arg_10_0:emit(ItemInfoMediator.REPAIR_LOVE_LETTER_MAIL, arg_10_0.itemVO.id, var_14_0, var_10_2)
					end
				})
			else
				table.sort(var_10_5)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideYes = true,
					content = i18n("loveletter_recover_text2", ShipGroup.New({
						id = var_10_2
					}):getName()),
					custom = underscore.map(var_10_5, function(arg_16_0)
						return {
							delayButton = 3,
							text = i18n("loveletter_recover_bottom3", arg_16_0),
							sound = SFX_CONFIRM,
							onCallback = function()
								arg_10_0:emit(ItemInfoMediator.REPAIR_LOVE_LETTER_MAIL, arg_10_0.itemVO.id, arg_16_0, var_10_2)
							end,
							btnType = pg.MsgboxMgr.BUTTON_YELLOW
						}
					end)
				})
			end
		end, SFX_PANEL)
		setGray(var_10_4, not var_10_5 or #var_10_5 == 0)
	elseif arg_10_0.itemVO:getConfig("type") == Item.EQUIPMENT_BOX_TYPE_5 then
		arg_10_0:setItemInfo(arg_10_1, arg_10_0.operatePanel:Find("item"))
		setActive(arg_10_0.useOneBtn, true)
		onButton(arg_10_0, arg_10_0.useOneBtn, function()
			SetActive(arg_10_0.operatePanel, true)
			SetActive(arg_10_0.window, false)

			arg_10_0.operateMode = var_0_5.USE

			arg_10_0:SetOperateCount(1)
		end, SFX_PANEL)
	elseif arg_10_0.itemVO:CanOpen() then
		setText(arg_10_0.useBtn:Find("text"), 1)
		setActive(arg_10_0.useBtn, true)

		if arg_10_0.itemVO.count > 1 then
			setText(arg_10_0.batchUseBtn:Find("text"), math.min(arg_10_0.itemVO.count, 10))
			setActive(arg_10_0.batchUseBtn, true)
		end
	elseif var_10_1 == Item.BLUEPRINT_TYPE then
		local var_10_6 = getProxy(TechnologyProxy)
		local var_10_7 = var_10_6:GetBlueprint4Item(arg_10_0.itemVO.id)

		if not LOCK_FRAGMENT_SHOP and var_10_7 and var_10_6:getBluePrintById(var_10_7):isMaxLevel() then
			setActive(arg_10_0.resolveBtn, true)
			arg_10_0:UpdateBlueprintResolveNum()
		end

		arg_10_0:setItemInfo(arg_10_1, arg_10_0.operatePanel:Find("item"))
		setActive(arg_10_0.okBtn, true)
	elseif var_10_1 == Item.TEC_SPEEDUP_TYPE then
		setActive(arg_10_0.resolveBtn, true)
		arg_10_0:UpdateSpeedUpResolveNum()
		arg_10_0:setItemInfo(arg_10_1, arg_10_0.operatePanel:Find("item"))
		setActive(arg_10_0.okBtn, true)
	elseif var_10_1 == Item.LOVE_LETTER_TYPE then
		setActive(arg_10_0.loveRepairBtn, false)
		setActive(arg_10_0.okBtn, true)
	elseif var_10_1 == Item.METALESSON_TYPE then
		setActive(arg_10_0.metaskillBtn, true)
		onButton(arg_10_0, arg_10_0.metaskillBtn, function()
			arg_10_0:closeView()
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.METACHARACTER)
		end, SFX_PANEL)
		setActive(arg_10_0.okBtn, true)
	elseif var_10_1 == Item.SKIN_ASSIGNED_TYPE then
		setActive(arg_10_0.useOneBtn, arg_10_0.contextData.confirmCall)
		onButton(arg_10_0, arg_10_0.useOneBtn, function()
			arg_10_0.contextData.confirmCall()
			arg_10_0:closeView()
		end, SFX_PANEL)
		setActive(arg_10_0.okBtn, true)
	elseif arg_10_0.itemVO:IsExclusiveDiscountType() then
		setActive(arg_10_0.recycleBtn, true)
		setActive(arg_10_0.skinShopBtn, true)
	elseif arg_10_0.itemVO:IsSkinExperienceType() then
		setActive(arg_10_0.skinExperienceShopBtn, true)
	elseif arg_10_0.itemVO:getConfig("usage") == ItemUsage.EX_RE_MAP then
		setActive(arg_10_0.resolveBtn, true)
		setActive(arg_10_0.reMapUseBtn, true)
		onButton(arg_10_0, arg_10_0.reMapUseBtn, function()
			arg_10_0:UpdateUseReMapPanel()
		end, SFX_PANEL)
	else
		setActive(arg_10_0.okBtn, true)
	end
end

function var_0_0.closeView(arg_22_0)
	if arg_22_0.playing then
		return
	end

	var_0_0.super.closeView(arg_22_0)
end

function var_0_0.didEnter(arg_23_0)
	local var_23_0 = arg_23_0._tf:Find("OpenBox(Clone)")

	if var_23_0 then
		SetActive(var_23_0, false)
	end

	onButton(arg_23_0, arg_23_0._tf:Find("bg"), function()
		arg_23_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_23_0, arg_23_0._tf:Find("window/top/btnBack"), function()
		arg_23_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_23_0, arg_23_0.okBtn, function()
		arg_23_0:closeView()
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.useBtn, function()
		arg_23_0:emit(ItemInfoMediator.USE_ITEM, arg_23_0.itemVO.id, 1)
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.batchUseBtn, function()
		arg_23_0:emit(ItemInfoMediator.USE_ITEM, arg_23_0.itemVO.id, math.min(arg_23_0.itemVO.count, 10))
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.composeBtn, function()
		SetActive(arg_23_0.operatePanel, true)
		SetActive(arg_23_0.window, false)

		arg_23_0.operateMode = var_0_5.COMPOSE

		arg_23_0:SetOperateCount(1)
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.resolveBtn, function()
		SetActive(arg_23_0.operatePanel, true)
		SetActive(arg_23_0.window, false)

		arg_23_0.operateMode = var_0_5.RESOLVE

		arg_23_0:SetOperateCount(1)
	end, SFX_PANEL)
	pressPersistTrigger(arg_23_0.operateLeftButton, 0.5, function(arg_31_0)
		if not arg_23_0:UpdateCount(arg_23_0.operateCount - 1) then
			arg_31_0()

			return
		end

		arg_23_0:SetOperateCount(arg_23_0.operateCount - 1)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(arg_23_0.operateRightButton, 0.5, function(arg_32_0)
		if not arg_23_0:UpdateCount(arg_23_0.operateCount + 1) then
			arg_32_0()

			return
		end

		arg_23_0:SetOperateCount(arg_23_0.operateCount + 1)
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_23_0, arg_23_0.operateMaxButton, function()
		arg_23_0:SetOperateCount(arg_23_0.operateMax)
	end, SFX_PANEL)
	onInputEndEdit(arg_23_0, arg_23_0.operateValueInput, function(arg_34_0)
		local var_34_0 = tonumber(arg_34_0) or 1
		local var_34_1 = math.min(var_0_3, math.min(var_34_0, arg_23_0.operateMax))
		local var_34_2 = math.max(1, var_34_1)

		arg_23_0:SetOperateCount(var_34_2)

		if arg_34_0 ~= tostring(var_34_2) then
			setInputText(arg_23_0.operateValueInput, var_34_2)
		end
	end)

	local var_23_1 = arg_23_0.itemVO:getConfig("type") == Item.EQUIPMENT_BOX_TYPE_5

	setActive(arg_23_0.operateValueInput, var_23_1)
	setActive(arg_23_0.operateValue, not var_23_1)
	onButton(arg_23_0, arg_23_0.operateBtns.Cancel, function()
		SetActive(arg_23_0.operatePanel, false)
		SetActive(arg_23_0.window, true)

		arg_23_0.operateCount = 0
		arg_23_0.operateMode = nil
	end, SFX_CANCEL)
	onButton(arg_23_0, arg_23_0.operateBtns.Confirm, function()
		if arg_23_0.operateMode == var_0_5.COMPOSE then
			arg_23_0:emit(ItemInfoMediator.COMPOSE_ITEM, arg_23_0.itemVO.id, arg_23_0.operateCount)

			local var_36_0 = arg_23_0.itemVO:getConfig("compose_number")

			if var_36_0 > arg_23_0.itemVO.count - arg_23_0.operateCount * var_36_0 then
				triggerButton(arg_23_0.operateBtns.Cancel)
			else
				arg_23_0:SetOperateCount(1)
			end
		elseif arg_23_0.operateMode == var_0_5.USE then
			arg_23_0:emit(ItemInfoMediator.USE_ITEM, arg_23_0.itemVO.id, arg_23_0.operateCount)
		end
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.recycleBtn, function()
		local var_37_0 = arg_23_0.itemVO:GetPrice() or {
			0,
			0
		}
		local var_37_1 = i18n("skin_discount_item_recycle_tip", arg_23_0.itemVO:getName(), var_37_0[2])

		arg_23_0.recycleConfirmationPage:ExecuteAction("Show", {
			content = var_37_1,
			itemId = arg_23_0.itemVO.id
		})
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.skinShopBtn, function()
		arg_23_0:closeView()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP)
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.skinExperienceShopBtn, function()
		arg_23_0:closeView()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP, {
			mode = NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM
		})
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0.operateBtns.Resolve, function()
		arg_23_0:emit(ItemInfoMediator.SELL_BLUEPRINT, Drop.New({
			type = DROP_TYPE_ITEM,
			id = arg_23_0.itemVO.id,
			count = arg_23_0.operateCount
		}))
	end, SFX_CONFIRM)

	local var_23_2 = getProxy(PlayerProxy):getData()
	local var_23_3 = GetComponent(arg_23_0.keepFateTog, typeof(Toggle))

	arg_23_0.keepFateState = not var_23_2:GetCommonFlag(SHOW_DONT_KEEP_FATE_ITEM)
	var_23_3.isOn = arg_23_0.keepFateState

	local function var_23_4()
		arg_23_0:UpdateBlueprintResolveNum()
		arg_23_0:SetOperateCount(1)
	end

	onToggle(arg_23_0, arg_23_0.keepFateTog, function(arg_42_0)
		arg_23_0.keepFateState = arg_42_0

		if arg_42_0 then
			pg.m02:sendNotification(GAME.CANCEL_COMMON_FLAG, {
				flagID = SHOW_DONT_KEEP_FATE_ITEM
			})
		else
			pg.m02:sendNotification(GAME.COMMON_FLAG, {
				flagID = SHOW_DONT_KEEP_FATE_ITEM
			})
		end

		var_23_4()
	end)
	var_23_4()
end

function var_0_0.UpdateCount(arg_43_0, arg_43_1)
	if arg_43_0.operateMode == var_0_5.COMPOSE then
		local var_43_0 = arg_43_0.itemVO:getConfig("target_id")

		if not var_43_0 or var_43_0 <= 0 then
			return false
		end

		arg_43_1 = math.clamp(arg_43_1, 1, math.floor(arg_43_0.itemVO.count / arg_43_0.itemVO:getConfig("compose_number")))

		return arg_43_0.operateCount ~= arg_43_1
	elseif arg_43_0.operateMode == var_0_5.RESOLVE then
		arg_43_1 = math.clamp(arg_43_1, 1, arg_43_0.itemVO.count)

		return arg_43_0.operateCount ~= arg_43_1
	elseif arg_43_0.operateMode == var_0_5.USE then
		arg_43_1 = math.clamp(arg_43_1, 1, arg_43_0.itemVO.count)

		return arg_43_0.operateCount ~= arg_43_1
	end
end

function var_0_0.SetOperateCount(arg_44_0, arg_44_1)
	if arg_44_0.operateMode == var_0_5.COMPOSE then
		local var_44_0 = arg_44_0.itemVO:getConfig("target_id")

		if not var_44_0 or var_44_0 <= 0 then
			return
		end

		local var_44_1 = arg_44_0.itemVO:getConfig("compose_number")

		arg_44_1 = math.clamp(arg_44_1, 1, math.floor(arg_44_0.itemVO.count / var_44_1))

		if arg_44_0.operateCount ~= arg_44_1 then
			arg_44_0.operateCount = arg_44_1

			arg_44_0:UpdateComposeCount()
		end

		local var_44_2 = arg_44_0.itemVO.count - arg_44_0.operateCount * var_44_1

		arg_44_0:updateItemCount(var_44_2)
	elseif arg_44_0.operateMode == var_0_5.RESOLVE then
		arg_44_1 = math.clamp(arg_44_1, 0, arg_44_0.operateMax)

		if arg_44_0.operateCount ~= arg_44_1 then
			arg_44_0.operateCount = arg_44_1

			arg_44_0:UpdateResolvePanel()
			arg_44_0:updateItemCount(arg_44_0.itemVO.count - arg_44_0.operateCount)
		end
	elseif arg_44_0.operateMode == var_0_5.USE then
		arg_44_1 = math.clamp(arg_44_1, 0, math.min(arg_44_0.operateMax, var_0_3))

		if arg_44_0.operateCount ~= arg_44_1 then
			arg_44_0.operateCount = arg_44_1

			arg_44_0:UpdateUsePanel()
			arg_44_0:updateItemCount(arg_44_0.itemVO.count - arg_44_0.operateCount)
		end
	end
end

function var_0_0.UpdateComposeCount(arg_45_0)
	local var_45_0 = arg_45_0.operateCount

	setText(arg_45_0.operateValue, var_45_0)
	setInputText(arg_45_0.operateValueInput, var_45_0)

	local var_45_1 = {}

	table.insert(var_45_1, {
		type = DROP_TYPE_ITEM,
		id = arg_45_0.itemVO:getConfig("target_id"),
		count = var_45_0
	})
	UIItemList.StaticAlign(arg_45_0.operateBonusList, arg_45_0.operateBonusTpl, #var_45_1, function(arg_46_0, arg_46_1, arg_46_2)
		arg_46_1 = arg_46_1 + 1

		if arg_46_0 == UIItemList.EventUpdate then
			local var_46_0 = var_45_1[arg_46_1]

			updateDrop(arg_46_2:Find("IconTpl"), var_46_0)
			onButton(arg_45_0, arg_46_2:Find("IconTpl"), function()
				arg_45_0:emit(var_0_0.ON_DROP, var_46_0)
			end, SFX_PANEL)
		end
	end)

	for iter_45_0, iter_45_1 in pairs(arg_45_0.operateBtns) do
		setActive(iter_45_1, iter_45_0 == "Confirm" or iter_45_0 == "Cancel")
	end

	setText(arg_45_0.operateCountdesc, i18n("compose_amount_prefix"))
	setActive(arg_45_0.keepFateTog, false)
end

function var_0_0.UpdateResolvePanel(arg_48_0)
	local var_48_0 = arg_48_0.operateCount

	setText(arg_48_0.operateValue, var_48_0)
	setInputText(arg_48_0.operateValueInput, var_48_0)

	local var_48_1 = arg_48_0.itemVO:getConfig("price")
	local var_48_2 = {}

	table.insert(var_48_2, {
		type = DROP_TYPE_RESOURCE,
		id = var_48_1[1],
		count = var_48_1[2] * var_48_0
	})
	UIItemList.StaticAlign(arg_48_0.operateBonusList, arg_48_0.operateBonusTpl, #var_48_2, function(arg_49_0, arg_49_1, arg_49_2)
		arg_49_1 = arg_49_1 + 1

		if arg_49_0 == UIItemList.EventUpdate then
			local var_49_0 = var_48_2[arg_49_1]

			updateDrop(arg_49_2:Find("IconTpl"), var_49_0)
			onButton(arg_48_0, arg_49_2:Find("IconTpl"), function()
				arg_48_0:emit(var_0_0.ON_DROP, var_49_0)
			end, SFX_PANEL)
		end
	end)

	for iter_48_0, iter_48_1 in pairs(arg_48_0.operateBtns) do
		setActive(iter_48_1, iter_48_0 == "Resolve" or iter_48_0 == "Cancel")
	end

	setText(arg_48_0.operateCountdesc, i18n("resolve_amount_prefix"))

	if arg_48_0.itemVO:getConfig("type") == Item.TEC_SPEEDUP_TYPE or arg_48_0.itemVO:getConfig("usage") == ItemUsage.EX_RE_MAP then
		setActive(arg_48_0.keepFateTog, false)
	else
		setActive(arg_48_0.keepFateTog, true)
	end

	setButtonEnabled(arg_48_0.operateBtns.Resolve, var_48_0 > 0)
end

function var_0_0.UpdateBlueprintResolveNum(arg_51_0)
	local var_51_0 = arg_51_0.itemVO.count

	if arg_51_0.itemVO:getConfig("type") == Item.BLUEPRINT_TYPE then
		local var_51_1 = getProxy(TechnologyProxy)
		local var_51_2 = var_51_1:GetBlueprint4Item(arg_51_0.itemVO.id)
		local var_51_3 = var_51_1:getBluePrintById(var_51_2)

		if arg_51_0.keepFateState then
			var_51_0 = arg_51_0.itemVO.count - var_51_3:getFateMaxLeftOver()
			var_51_0 = var_51_0 < 0 and 0 or var_51_0
		end
	end

	arg_51_0.operateMax = var_51_0
end

function var_0_0.UpdateSpeedUpResolveNum(arg_52_0)
	local var_52_0 = arg_52_0.itemVO.count

	if arg_52_0.itemVO:getConfig("type") == Item.TEC_SPEEDUP_TYPE then
		arg_52_0.operateMax = var_52_0
	end
end

function var_0_0.UpdateUsePanel(arg_53_0)
	local var_53_0 = arg_53_0.operateCount

	setText(arg_53_0.operateValue, var_53_0)
	setInputText(arg_53_0.operateValueInput, var_53_0)

	local var_53_1 = {}

	table.insert(var_53_1, {
		type = DROP_TYPE_ITEM,
		id = var_0_4,
		count = var_53_0
	})
	UIItemList.StaticAlign(arg_53_0.operateBonusList, arg_53_0.operateBonusTpl, #var_53_1, function(arg_54_0, arg_54_1, arg_54_2)
		arg_54_1 = arg_54_1 + 1

		if arg_54_0 == UIItemList.EventUpdate then
			local var_54_0 = var_53_1[arg_54_1]

			updateDrop(arg_54_2:Find("IconTpl"), var_54_0)
		end
	end)

	for iter_53_0, iter_53_1 in pairs(arg_53_0.operateBtns) do
		setActive(iter_53_1, iter_53_0 == "Confirm" or iter_53_0 == "Cancel")
	end

	setText(arg_53_0.operateCountdesc, i18n("use_amount_prefix"))
	setActive(arg_53_0.keepFateTog, false)
end

function var_0_0.UpdateUseReMapPanel(arg_55_0)
	arg_55_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
		viewComponent = ReMapTransformationScene,
		mediator = ReMapTransformationMediator,
		data = {
			itemVO = arg_55_0.itemVO
		}
	}))
end

function var_0_0.willExit(arg_56_0)
	if arg_56_0.leftEventTrigger then
		ClearEventTrigger(arg_56_0.leftEventTrigger)
	end

	if arg_56_0.rightEventTrigger then
		ClearEventTrigger(arg_56_0.rightEventTrigger)
	end

	arg_56_0:UnOverlayPanel(arg_56_0._tf)

	if arg_56_0.recycleConfirmationPage then
		arg_56_0.recycleConfirmationPage:Destroy()

		arg_56_0.recycleConfirmationPage = nil
	end
end

function var_0_0.PlayOpenBox(arg_57_0, arg_57_1, arg_57_2)
	if not arg_57_1 or arg_57_1 == "" then
		arg_57_2()

		return
	end

	local var_57_0 = {}
	local var_57_1 = arg_57_0._tf:Find(arg_57_1 .. "(Clone)")

	if var_57_1 then
		arg_57_0[arg_57_1] = go(var_57_1)
	end

	if not arg_57_0[arg_57_1] then
		table.insert(var_57_0, function(arg_58_0)
			PoolMgr.GetInstance():GetPrefab("ui/" .. string.lower(arg_57_1), "", true, function(arg_59_0)
				arg_59_0:SetActive(true)

				arg_57_0[arg_57_1] = arg_59_0

				arg_58_0()
			end)
		end)
	end

	seriesAsync(var_57_0, function()
		if arg_57_0.playing or not arg_57_0[arg_57_1] then
			return
		end

		arg_57_0.playing = true

		arg_57_0[arg_57_1]:SetActive(true)
		SetActive(arg_57_0.window, false)

		local var_60_0 = tf(arg_57_0[arg_57_1])

		var_60_0:SetParent(arg_57_0._tf, false)
		var_60_0:SetAsLastSibling()

		local var_60_1 = var_60_0:GetComponent("DftAniEvent")

		var_60_1:SetTriggerEvent(function(arg_61_0)
			arg_57_2()
		end)
		var_60_1:SetEndEvent(function(arg_62_0)
			if arg_57_0[arg_57_1] then
				SetActive(arg_57_0[arg_57_1], false)

				arg_57_0.playing = false
			end

			arg_57_0:closeView()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_EQUIPMENT_OPEN)
	end)
end

function var_0_0.inOutAnim(arg_63_0, arg_63_1, arg_63_2)
	if arg_63_1 then
		local var_63_0 = arg_63_0._tf:Find("window/bg_decorations"):GetComponent(typeof(Animation))

		var_63_0:Stop()
		var_63_0:Play("anim_window_bg")

		local var_63_1 = arg_63_0._tf:Find("window/top"):GetComponent(typeof(Animation))

		var_63_1:Stop()
		var_63_1:Play("anim_top")

		local var_63_2 = arg_63_0._tf:Find("window"):GetComponent(typeof(Animation))

		var_63_2:Stop()
		var_63_2:Play("anim_content")

		local var_63_3 = arg_63_0._tf:Find("bg"):GetComponent(typeof(Animation))

		var_63_3:Stop()
		var_63_3:Play("anim_bg_plus")
	end

	arg_63_2()
end

return var_0_0
