local var_0_0 = class("FormationSuggestionCardItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBtn, function()
		if arg_2_0.id == nil or type(arg_2_0.id) == "string" or pg.chapter_suggestion_char[arg_2_0.id] == nil then
			return
		end

		arg_2_0:emit(FormationSuggestionScene.OPEN_SHIP_INFO, arg_2_0.id)
	end, SFX_PANEL)

	arg_2_0.shipView = FormationSuggestionShipItem.New(tf(arg_2_0.uiContentGo), arg_2_0)
end

function var_0_0.didEnter(arg_4_0)
	return
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.id = arg_5_1

	if arg_5_1 == nil then
		arg_5_0:ShowLock(true)

		return
	end

	arg_5_0:ShowLock(false)

	if arg_5_1 == 0 then
		arg_5_0:ShowEmpty()

		return
	end

	if type(arg_5_1) == "string" then
		arg_5_0:ShowBundle()

		return
	end

	if pg.chapter_suggestion_char[arg_5_1] == nil then
		arg_5_0:ShowAnyType()

		return
	end

	arg_5_0:ShowShip(arg_5_2 == 1)
end

function var_0_0.ShowLock(arg_6_0, arg_6_1)
	setActive(arg_6_0.uiLockGo, arg_6_1)
	setActive(arg_6_0.uiUnLockGo, not arg_6_1)
end

function var_0_0.ShowEmpty(arg_7_0)
	setActive(arg_7_0.uiAnyGo, false)
	setActive(arg_7_0.uiEmptyGo, true)
	setActive(arg_7_0.uiContentGo, false)
end

function var_0_0.ShowBundle(arg_8_0)
	setActive(arg_8_0.uiAnyGo, true)
	setActive(arg_8_0.uiEmptyGo, true)
	setActive(arg_8_0.uiContentGo, false)

	local var_8_0 = ShipType.BundleList[arg_8_0.id]

	setImageSprite(arg_8_0.uiAnyTypeImage, GetSpriteFromAtlas("shiptype", shipType2print(var_8_0[1])))

	local var_8_1 = ""

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		if iter_8_0 > 1 then
			var_8_1 = var_8_1 .. "/"
		end

		var_8_1 = var_8_1 .. pg.ship_data_by_type[iter_8_1].type_name
	end

	setScrollText(arg_8_0.uiAnyText, i18n("formation_suggestion_any_type_ship", var_8_1))
end

function var_0_0.ShowAnyType(arg_9_0)
	setActive(arg_9_0.uiAnyGo, true)
	setActive(arg_9_0.uiEmptyGo, true)
	setActive(arg_9_0.uiContentGo, false)
	setImageSprite(arg_9_0.uiAnyTypeImage, GetSpriteFromAtlas("shiptype", shipType2print(arg_9_0.id)))
	setScrollText(arg_9_0.uiAnyText, i18n("formation_suggestion_any_type_ship", pg.ship_data_by_type[arg_9_0.id].type_name))
end

function var_0_0.ShowShip(arg_10_0, arg_10_1)
	setActive(arg_10_0.uiAnyGo, false)
	setActive(arg_10_0.uiEmptyGo, false)
	setActive(arg_10_0.uiContentGo, true)
	arg_10_0.shipView:SetData(arg_10_0.id, arg_10_1)
end

function var_0_0.willExit(arg_11_0)
	arg_11_0.shipView:willExit()

	arg_11_0.shipView = nil

	arg_11_0:detach()
end

return var_0_0
