local var_0_0 = class("ReversePacmanTechnologyRoleSkillView", import("view.base.BasePanel"))

var_0_0.BUY_SHOP_ITEM_SUCCESS = "ReversePacmanTechnologyRoleSkillView::BUY_SHOP_ITEM_SUCCESS"
var_0_0.REFRESH_ITEM_CNT = "ReversePacmanTechnologyRoleSkillView::REFRESH_ITEM_CNT"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
	arg_1_0:didEnter()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.itemList = {}

	local var_2_0 = ReversePacmanTools.GetActivity()

	for iter_2_0, iter_2_1 in ipairs(var_2_0:getConfig("config_client").technologyShopIDList) do
		arg_2_0.itemList[iter_2_0] = arg_2_0:GetItemClass().New(Object.Instantiate(arg_2_0.uiSkillItem, arg_2_0.uiSkillParent), arg_2_0, iter_2_1)
	end

	setText(arg_2_0.uiFrontText, i18n("reverse_pacman_owned"))
	setImageSprite(arg_2_0.uiIconImage, GetSpriteFromAtlas(ReversePacmanTools.GetTechnologyPTDrop():getIcon(), ""))
	onButton(arg_2_0, arg_2_0.uiCurrencyBtn, function()
		local var_3_0 = ReversePacmanTools.GetTechnologyPTDrop()

		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanItemPopScene,
			mediator = ReversePacmanItemPopMediator,
			data = {
				dropType = var_3_0.type,
				dropID = var_3_0.id,
				count = var_3_0:getOwnedCount(),
				limitItemGuideID = ReversePacmanTools.GetActivity():getConfig("config_client").pt_link or 240
			}
		}))
	end, SFX_PANEL)
end

function var_0_0.GetItemClass(arg_4_0)
	return ReversePacmanTechnologyRoleSkillItem
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0.eventIDList = {
		arg_5_0:bind(var_0_0.BUY_SHOP_ITEM_SUCCESS, handler(arg_5_0, arg_5_0.OnBuyShopItemSuccess)),
		arg_5_0:bind(var_0_0.REFRESH_ITEM_CNT, handler(arg_5_0, arg_5_0.RefreshCurrency))
	}

	arg_5_0:RefreshCurrency()
end

function var_0_0.RefreshCurrency(arg_6_0)
	local var_6_0 = ReversePacmanTools.GetTechnologyPTDrop():getOwnedCount()

	setText(arg_6_0.uiPtCntText, i18n("reverse_pacman_count", var_6_0))
end

function var_0_0.OnBuyShopItemSuccess(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.itemList) do
		iter_7_1:RefreshUI()
	end
end

function var_0_0.willExit(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0.eventIDList) do
		arg_8_0:disconnect(iter_8_1)
	end

	arg_8_0.eventIDList = nil

	for iter_8_2, iter_8_3 in ipairs(arg_8_0.itemList) do
		iter_8_3:willExit()
	end

	arg_8_0.itemList = nil

	arg_8_0:detach()
end

return var_0_0
