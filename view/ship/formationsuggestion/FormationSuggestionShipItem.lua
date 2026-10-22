local var_0_0 = class("FormationSuggestionShipItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.paintingDefaultAngle = arg_2_0.uiPaintingTf.localEulerAngles
	arg_2_0.UIlist = UIItemList.New(arg_2_0.uiStartsTf, arg_2_0.uiStartItem)

	setText(arg_2_0.uiUnownedText, i18n("word_not_get"))
end

function var_0_0.didEnter(arg_3_0)
	return
end

function var_0_0.SetData(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.id = arg_4_1

	if arg_4_0.shipVO then
		retPaintingPrefab(arg_4_0.uiPaintingTf, arg_4_0.shipVO:getPainting())
	end

	local var_4_0 = pg.chapter_suggestion_char[arg_4_0.id]
	local var_4_1 = Ship.New({
		id = arg_4_0.id,
		configId = var_4_0.char_id,
		level = var_4_0.char_lv
	})

	if var_4_0.remoulded == 1 then
		var_4_1.remoulded = true

		var_4_1:updateSkinId(var_4_1:getRemouldSkinId(), 0)
	end

	setScrollText(arg_4_0.uiNameText, var_4_1:GetColorName())
	setText(arg_4_0.uiLevelText, string.format("Lv.%s", var_4_1.level))

	local var_4_2 = var_4_1:getMaxStar()
	local var_4_3 = var_4_0.star

	arg_4_0.UIlist:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			setActive(arg_5_2:Find("star"), arg_5_1 < var_4_3)
		end
	end)
	arg_4_0.UIlist:align(var_4_2)
	setPaintingPrefabAsync(arg_4_0.uiPaintingTf, var_4_1:getPainting(), "biandui", nil, {
		skinID = var_4_1:getSkinId(),
		rotateZ = arg_4_0.paintingDefaultAngle.z
	})

	local var_4_4 = var_4_1:rarity2bgPrint()

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_4_4, "", arg_4_0.uiRaryImage)

	local var_4_5, var_4_6 = var_4_1:GetFrameAndEffect(true)

	setRectShipCardFrame(arg_4_0.uiFrameImage, var_4_4, var_4_5)
	setFrameEffect(arg_4_0.uiEffectTf, var_4_6)
	setProposeMarkIcon(arg_4_0.uiProposeTf, var_4_1)

	local var_4_7 = var_4_1:getShipType()

	setImageSprite(arg_4_0.uiTypeImage, GetSpriteFromAtlas("shiptype", shipType2print(var_4_7)))

	arg_4_0.shipVO = var_4_1

	setActive(arg_4_0.uiFlagGo, arg_4_2)

	local var_4_8 = pg.ship_data_template[var_4_0.char_id].group_type
	local var_4_9 = getProxy(BayProxy):findShipsByGroup(var_4_8)

	for iter_4_0 = #var_4_9, 1, -1 do
		if var_4_0.remoulded == 1 and not var_4_9[iter_4_0]:isRemoulded() then
			table.remove(var_4_9, iter_4_0)
		end
	end

	local var_4_10 = #var_4_9 > 0

	setActive(arg_4_0.uiUnownedGo, not var_4_10)
end

function var_0_0.willExit(arg_6_0)
	arg_6_0:detach()

	local var_6_0 = arg_6_0.shipVO

	if var_6_0 then
		retPaintingPrefab(arg_6_0.uiPaintingTf, var_6_0:getPainting())
	end
end

return var_0_0
