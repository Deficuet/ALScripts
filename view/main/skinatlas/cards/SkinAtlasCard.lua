local var_0_0 = class("SkinAtlasCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.usingTr = findTF(arg_1_0._tf, "using")
	arg_1_0.unavailableTr = findTF(arg_1_0._tf, "unavailable")
	arg_1_0.icon = findTF(arg_1_0._tf, "mask/icon")
	arg_1_0.name = findTF(arg_1_0._tf, "name/Text"):GetComponent(typeof(Text))
	arg_1_0.enName = findTF(arg_1_0._tf, "name/en"):GetComponent(typeof(Text))
	arg_1_0.tags = {
		findTF(arg_1_0._tf, "tags/icon")
	}
	arg_1_0.changeSkinUI = findTF(arg_1_0._tf, "changeSkin")
	arg_1_0.changeSkinToggle = nil

	setText(arg_1_0.usingTr:Find("Text"), i18n("shop_new_in_use"))
	setText(arg_1_0.unavailableTr:Find("Text"), i18n("shop_new_unable_to_use"))
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.index = arg_2_2
	arg_2_0.skin = arg_2_1

	GetImageSpriteFromAtlasAsync("shipYardIcon/" .. arg_2_1:getConfig("painting"), "", arg_2_0.icon)

	local var_2_0 = arg_2_1:getConfig("ship_group")
	local var_2_1 = getProxy(BayProxy):findShipsByGroup(var_2_0)
	local var_2_2 = not arg_2_1:WithoutUse()

	setActive(arg_2_0.usingTr, var_2_2)

	local var_2_3 = getProxy(CollectionProxy).shipGroups[var_2_0] == nil

	setActive(arg_2_0.unavailableTr, #var_2_1 == 0 or var_2_3)

	local var_2_4 = arg_2_1:getConfig("name")

	arg_2_0.name.text = shortenString(var_2_4, 7)

	local var_2_5 = pg.ship_skin_template[arg_2_0.skin.id]

	if var_2_5.skin_type == ShipSkin.SKIN_TYPE_TB then
		arg_2_0.enName.text = NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_2_0.skinId))
	else
		local var_2_6 = ShipGroup.getDefaultShipConfig(var_2_5.ship_group)

		arg_2_0.enName.text = var_2_6.english_name
	end

	local var_2_7 = ShipSkin.GetChangeSkinData(arg_2_0.skin.id)

	setActive(arg_2_0.changeSkinUI, var_2_7 and true or false)

	if var_2_7 then
		if not arg_2_0.changeSkinToggle then
			arg_2_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_2_0.changeSkinUI, "ChangeSkinToggleUI"))
		end

		arg_2_0.changeSkinToggle:setSkinData(arg_2_0.skin.id)
	end

	arg_2_0:FlushTags(arg_2_1:getConfig("tag"))
end

function var_0_0.changeSkinNext(arg_3_0)
	if ShipSkin.GetChangeSkinData(arg_3_0.skin.id) then
		local var_3_0 = ShipSkin.GetChangeSkinNextId(arg_3_0.skin.id)
		local var_3_1 = ShipSkin.New({
			id = var_3_0
		})

		arg_3_0:Update(var_3_1, arg_3_0.index)
	end
end

function var_0_0.FlushTags(arg_4_0, arg_4_1)
	local var_4_0 = -10
	local var_4_1 = arg_4_0.tags[1]

	for iter_4_0 = #arg_4_0.tags + 1, #arg_4_1 do
		local var_4_2 = Object.Instantiate(var_4_1, var_4_1.parent)

		arg_4_0.tags[iter_4_0] = var_4_2
	end

	for iter_4_1 = 1, #arg_4_1 do
		local var_4_3 = arg_4_0.tags[iter_4_1]

		setActive(var_4_3, true)
		LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(arg_4_1[iter_4_1]) .. "_own", function(arg_5_0)
			if arg_4_0.exited then
				return
			end

			local var_5_0 = var_4_3:GetComponent(typeof(Image))

			var_5_0.sprite = arg_5_0

			var_5_0:SetNativeSize()
		end)

		local var_4_4 = var_4_1.localPosition.y - (iter_4_1 - 1) * (var_4_1.sizeDelta.x + var_4_0)

		var_4_3.localPosition = Vector3(var_4_3.localPosition.x, var_4_4, 0)
	end

	for iter_4_2 = #arg_4_1 + 1, #arg_4_0.tags do
		setActive(arg_4_0.tags[iter_4_2], false)
	end
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.exited = true
end

return var_0_0
