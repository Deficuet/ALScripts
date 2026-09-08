local var_0_0 = class("ReversePacmanItemPopScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanItemPopUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBgBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)
	setText(arg_2_0.uiOwnerTitleText, i18n("collect_page_got"))

	arg_2_0.goItemList = {}
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:BlurPanel(arg_5_0._tf)

	local var_5_0 = arg_5_0.contextData
	local var_5_1 = Drop.New({
		type = var_5_0.dropType,
		id = var_5_0.dropID
	})

	updateDrop(arg_5_0.uiItem, var_5_1)

	local var_5_2 = var_5_1.cfg

	setText(arg_5_0.uiNameText, var_5_2.name)
	setText(arg_5_0.uiDescText, var_5_1.desc)

	local var_5_3 = pg.activity_limit_item_guide[var_5_0.limitItemGuideID]

	setText(arg_5_0.uiCntText, string.format("%s/%s", var_5_0.count, var_5_3.count))

	for iter_5_0, iter_5_1 in ipairs(var_5_3.link_params) do
		arg_5_0.goItemList[iter_5_0] = arg_5_0.goItemList[iter_5_0] or ReversePacmanItemPopItem.New(Object.Instantiate(arg_5_0.uiGoItem, arg_5_0.uiGoParent), arg_5_0)

		arg_5_0.goItemList[iter_5_0]:didEnter(iter_5_1)
	end

	for iter_5_2 = #var_5_3.link_params + 1, #arg_5_0.goItemList do
		arg_5_0.goItemList[iter_5_2]:Show(false)
	end
end

function var_0_0.willExit(arg_6_0)
	arg_6_0:UnOverlayPanel(arg_6_0._tf)

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.goItemList) do
		iter_6_1:willExit()
	end

	arg_6_0.goItemList = nil
end

return var_0_0
