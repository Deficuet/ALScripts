local var_0_0 = class("ReversePacmanTechnologyPlayerSkillView", import("..roleSkill.ReversePacmanTechnologyRoleSkillView"))

function var_0_0.Init(arg_1_0)
	arg_1_0.itemList = {}

	local var_1_0 = ReversePacmanTools.GetActivity()

	for iter_1_0, iter_1_1 in ipairs(var_1_0:getConfig("config_client").playerSkillShopIDList) do
		arg_1_0.itemList[iter_1_0] = arg_1_0:GetItemClass().New(Object.Instantiate(arg_1_0.uiSkillItem, arg_1_0.uiSkillParent), arg_1_0, iter_1_1)
	end

	setText(arg_1_0.uiFrontText, i18n("reverse_pacman_owned"))
	setImageSprite(arg_1_0.uiIconImage, GetSpriteFromAtlas(ReversePacmanTools.GetTechnologyPTDrop():getIcon(), ""))
	onButton(arg_1_0, arg_1_0.uiCurrencyBtn, function()
		local var_2_0 = ReversePacmanTools.GetTechnologyPTDrop()

		arg_1_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanItemPopScene,
			mediator = ReversePacmanItemPopMediator,
			data = {
				dropType = var_2_0.type,
				dropID = var_2_0.id,
				count = var_2_0:getOwnedCount(),
				limitItemGuideID = ReversePacmanTools.GetActivity():getConfig("config_client").pt_link or 240
			}
		}))
	end, SFX_PANEL)
end

function var_0_0.GetItemClass(arg_3_0)
	return ReversePacmanTechnologyPlayerSkillItem
end

return var_0_0
