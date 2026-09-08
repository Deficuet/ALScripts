local var_0_0 = class("ReversePacmanTechnologyRoleSkillItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2
	arg_1_0.id = arg_1_3

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
	arg_1_0:didEnter()
end

function var_0_0.Init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBuyBtn, function()
		local var_3_0 = pg.activity_shop_template[arg_2_0.id]

		arg_2_0:emit(ReversePacmanTechnologyMediator.BUY_SHOP_ITEM, {
			activityID = var_3_0.activity,
			shopID = arg_2_0.id
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiIconBtn, function()
		local var_4_0 = pg.activity_shop_template[arg_2_0.id]
		local var_4_1 = Drop.New({
			type = var_4_0.commodity_type,
			id = var_4_0.commodity_id
		})

		arg_2_0:emit(BaseUI.ON_DROP, var_4_1)
	end, SFX_PANEL)
	setText(arg_2_0.uiBuyText, i18n("reverse_pacman_buy"))
	setText(arg_2_0.uiBuyText2, i18n("reverse_pacman_buy"))
	setText(arg_2_0.uiSoldOutText, i18n("reverse_pacman_sold_out"))
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_6_0)
	local var_6_0 = pg.activity_shop_template[arg_6_0.id]
	local var_6_1 = Drop.New({
		type = var_6_0.commodity_type,
		id = var_6_0.commodity_id
	})
	local var_6_2 = ReversePacmanTools.GetActivity():getConfig("config_client").shopActivityID
	local var_6_3 = getProxy(ShopsProxy):getActivityShopById(var_6_2).goods[arg_6_0.id]

	setText(arg_6_0.uiNameText, var_6_1:getConfig("name") .. string.format("(%s/%s)", var_6_3:getBuyCount(), var_6_0.num_limit))
	setText(arg_6_0.uiDescText, var_6_1:getConfig("display"))

	local var_6_4 = GetSpriteFromAtlas(var_6_1:getIcon(), "")

	setImageSprite(arg_6_0.uiIconImage, var_6_4)

	local var_6_5 = Drop.New({
		type = var_6_0.resource_category,
		id = var_6_0.resource_type
	})
	local var_6_6 = getProxy(ShopsProxy):getActivityShopById(var_6_0.activity):getGoodsById(arg_6_0.id)

	setText(arg_6_0.uiCurrencyCntText, var_6_0.resource_num)

	if not var_6_6:CheckCntLimit() then
		setTextColor(arg_6_0.uiCurrencyCntText, Color.NewHex("#313131"))
		setActive(arg_6_0.uiSoldOutGo, true)
		setActive(arg_6_0.uiGreyGo, false)
		setActive(arg_6_0.uiBuyGo, false)
	elseif var_6_5:getOwnedCount() < var_6_0.resource_num then
		setTextColor(arg_6_0.uiCurrencyCntText, Color.NewHex("#d45e5e"))
		setActive(arg_6_0.uiSoldOutGo, false)
		setActive(arg_6_0.uiGreyGo, true)
		setActive(arg_6_0.uiBuyGo, false)
	else
		setTextColor(arg_6_0.uiCurrencyCntText, Color.NewHex("#313131"))
		setActive(arg_6_0.uiSoldOutGo, false)
		setActive(arg_6_0.uiGreyGo, false)
		setActive(arg_6_0.uiBuyGo, true)
	end

	setImageSprite(arg_6_0.uiCurrencyImage, GetSpriteFromAtlas(var_6_5:getIcon(), ""))
end

function var_0_0.willExit(arg_7_0)
	arg_7_0:detach()
	Object.Destroy(arg_7_0._go)

	arg_7_0._go = nil
	arg_7_0._tf = nil
end

return var_0_0
