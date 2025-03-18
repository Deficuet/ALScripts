local var_0_0 = class("WorldCruiseShopPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "WorldCruiseShopPage"
end

function var_0_0.UpdateShop(arg_2_0, arg_2_1)
	arg_2_0.shop = arg_2_1 or getProxy(ShopsProxy):GetCruiseShop()
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0:UpdateShop()

	local var_3_0 = arg_3_0._tf:Find("frame")

	arg_3_0.lockTF = var_3_0:Find("views/lock")
	arg_3_0.remainTF = var_3_0:Find("views/remain")
	arg_3_0.togglesTF = var_3_0:Find("toggles")

	eachChild(arg_3_0.togglesTF, function(arg_4_0)
		setText(arg_4_0:Find("unselected/Text"), i18n("cruise_shop_title_" .. arg_4_0.name))
		setText(arg_4_0:Find("selected/Text"), i18n("cruise_shop_title_" .. arg_4_0.name))
		onToggle(arg_3_0, arg_4_0, function(arg_5_0)
			if arg_5_0 then
				setActive(arg_3_0.remainTF, arg_4_0.name == "equip_skin")
			end

			arg_3_0:Flush()
		end, SFX_PANEL)
	end)

	local var_3_1 = var_3_0:Find("views")
	local var_3_2 = string.format("-%s-", i18n("word_sell_out"))

	arg_3_0.skinView = var_3_1:Find("skin")

	setText(arg_3_0.skinView:Find("tpl_skin/mask/sell_out/Text"), var_3_2)

	arg_3_0.skinScrollCom = GetComponent(arg_3_0.skinView:Find("content"), "LScrollRect")

	function arg_3_0.skinScrollCom.onUpdateItem(arg_6_0, arg_6_1)
		arg_3_0:UpdateSkinItem(arg_6_0, tf(arg_6_1))
	end

	arg_3_0.equipSkinView = var_3_1:Find("equip_skin")

	setText(arg_3_0.equipSkinView:Find("tpl_equip_skin/mask/sell_out/Text"), var_3_2)

	arg_3_0.equipSkinScrollCom = GetComponent(arg_3_0.equipSkinView:Find("content"), "LScrollRect")

	function arg_3_0.equipSkinScrollCom.onUpdateItem(arg_7_0, arg_7_1)
		arg_3_0:UpdateEquipSkinItem(arg_7_0, tf(arg_7_1))
	end
end

function var_0_0.OnInit(arg_8_0)
	arg_8_0.unlockPhase = pg.gameset.battlepass_level.key_value
	arg_8_0.paintingList = {}
	arg_8_0.idx2Painting = {}
end

function var_0_0.Flush(arg_9_0, arg_9_1)
	arg_9_0:Show()

	if arg_9_1 then
		arg_9_0:UpdateShop(arg_9_1)
	end

	arg_9_0.isLock = arg_9_0.contextData.phase < arg_9_0.unlockPhase
	arg_9_0.remainCnt = arg_9_0.shop:GetRemainEquipSkinCnt()

	setText(arg_9_0.lockTF:Find("Image/Text"), i18n("cruise_shop_lock_tip", arg_9_0.contextData.phase, arg_9_0.unlockPhase))
	setActive(arg_9_0.lockTF, arg_9_0.isLock)
	setText(arg_9_0.remainTF, i18n("cruise_shop_limit_tip") .. arg_9_0.remainCnt)

	arg_9_0.skinGoods = arg_9_0.shop:getSortGoodsByType(CruiseShop.TYPE_SKIN)

	if isActive(arg_9_0.skinView) then
		arg_9_0.skinScrollCom:SetTotalCount(#arg_9_0.skinGoods)
	end

	arg_9_0.equipSkinGoods = arg_9_0.shop:getSortGoodsByType(CruiseShop.TYPE_EQUIP_SKIN)

	if isActive(arg_9_0.equipSkinView) then
		arg_9_0.equipSkinScrollCom:SetTotalCount(#arg_9_0.equipSkinGoods)
	end
end

function var_0_0.UpdateSkinItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.skinGoods[arg_10_1 + 1]
	local var_10_1 = var_10_0:getDropInfo()
	local var_10_2 = var_10_0:GetName() or "??"

	if string.match(var_10_2, "(%d+)") then
		setText(arg_10_2:Find("skin_name"), shortenString(var_10_2, 7))
	else
		setText(arg_10_2:Find("skin_name"), shortenString(var_10_2, 8))
	end

	local var_10_3 = var_10_1:getConfig("ship_group")
	local var_10_4 = tonumber(var_10_3 .. "1")

	setText(arg_10_2:Find("name"), pg.ship_data_statistics[var_10_4].name)
	setText(arg_10_2:Find("buy/Text"), var_10_0:GetPrice())

	local var_10_5 = arg_10_2:Find("icon_mask/painting")
	local var_10_6 = var_10_1:getConfig("painting")

	if arg_10_0.idx2Painting[arg_10_1] ~= var_10_6 then
		retPaintingPrefab(var_10_5, var_10_6, "pifu")
		setPaintingPrefabAsync(var_10_5, var_10_6, "pifu", function()
			setLocalPosition(var_10_5, {
				x = 0,
				y = 40
			})

			arg_10_0.paintingList[var_10_6] = var_10_5
			arg_10_0.idx2Painting[arg_10_1] = var_10_6
		end)
	end

	local var_10_7 = var_10_0:canPurchase()

	setActive(arg_10_2:Find("mask"), not var_10_7)
	onButton(arg_10_0, arg_10_2, function()
		if not var_10_7 then
			return
		end

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
			contentText = i18n("charge_scene_buy_confirm", var_10_0:GetPrice(), var_10_0:GetName()),
			onConfirm = function()
				if getProxy(PlayerProxy):getData():getTotalGem() < var_10_0:GetPrice() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

					return
				end

				arg_10_0:emit(WorldCruiseMediator.ON_CRUISE_SHOPPING, var_10_0.id, 1)
			end
		})
	end, SFX_CONFIRM)
end

function var_0_0.UpdateEquipSkinItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.equipSkinGoods[arg_14_1 + 1]
	local var_14_1 = var_14_0:getDropInfo()

	updateDrop(arg_14_2:Find("IconTpl"), var_14_1)

	local var_14_2 = var_14_0:GetName() or "??"

	if string.match(var_14_2, "(%d+)") then
		setText(arg_14_2:Find("name"), shortenString(var_14_2, 5))
	else
		setText(arg_14_2:Find("name"), shortenString(var_14_2, 6))
	end

	setText(arg_14_2:Find("buy/Text"), var_14_0:GetPrice())
	setText(arg_14_2:Find("Text"), i18n("common_already owned") .. string.format("%s/%s", var_14_0:GetOwnedCnt(), var_14_0:getLimitCount()))

	local var_14_3 = var_14_0:canPurchase()

	setActive(arg_14_2:Find("mask"), not var_14_3)
	onButton(arg_14_0, arg_14_2, function()
		if not var_14_3 then
			return
		end

		local function var_15_0()
			if arg_14_0.remainCnt <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("cruise_limit_count"))

				return
			end

			if getProxy(PlayerProxy):getData():getTotalGem() < var_14_0:GetPrice() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return
			end

			arg_14_0:emit(WorldCruiseMediator.ON_CRUISE_SHOPPING, var_14_0.id, 1)
		end

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_DROP, {
			drop = var_14_1,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.cancel,
					name = i18n("msgbox_text_cancel"),
					sound = SFX_CANCEL
				},
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.confirm,
					name = i18n("text_exchange"),
					func = var_15_0,
					sound = SFX_CONFIRM
				}
			}
		})
	end, SFX_CONFIRM)
end

function var_0_0.OnDestroy(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.paintingList) do
		setLocalPosition(iter_17_1, {
			x = 0,
			y = 0
		})
		retPaintingPrefab(iter_17_1, iter_17_0)
	end
end

return var_0_0
