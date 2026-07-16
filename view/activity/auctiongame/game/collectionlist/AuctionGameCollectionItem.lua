local var_0_0 = class("AuctionGameCollectionItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	return
end

function var_0_0.didEnter(arg_3_0, arg_3_1)
	if arg_3_0.id == arg_3_1 then
		return
	end

	arg_3_0.id = arg_3_1

	local var_3_0 = pg.auction_collection[arg_3_1]

	setScrollText(arg_3_0.uiNameText, var_3_0.name)
	setText(arg_3_0.uiPriceText, StringHelper.ForamtNumber(var_3_0.value))

	arg_3_0.uiIconImage.sprite = nil

	setActive(arg_3_0.uiIconImage, false)
	LoadSpriteAsync(var_3_0.icon, function(arg_4_0)
		if not IsNil(arg_3_0.uiIconImage) then
			arg_3_0.uiIconImage.sprite = arg_4_0

			setActive(arg_3_0.uiIconImage, true)
		end
	end)
	LoadSpriteAtlasAsync("ui/auctiongameui_atlas", string.format("rarity%s", var_3_0.rarity), function(arg_5_0)
		if not IsNil(arg_3_0.uiRarityImage) then
			arg_3_0.uiRarityImage.sprite = arg_5_0
		end
	end)

	local var_3_1 = var_3_0.contour[1]
	local var_3_2 = var_3_0.contour[2]

	for iter_3_0 = 1, 9 do
		local var_3_3 = var_3_2 >= math.ceil(iter_3_0 / 3) and var_3_1 >= (iter_3_0 - 1) % 3 + 1

		setActive(arg_3_0[string.format("uiContourItem%s", iter_3_0)], var_3_3)
	end
end

function var_0_0.ShowLockState(arg_6_0)
	local var_6_0 = getProxy(AuctionGameBaseProxy):GetUnlockCollectionList()
	local var_6_1 = table.keyof(var_6_0, arg_6_0.id) ~= nil

	setActive(arg_6_0.uiLockGo, not var_6_1)
end

function var_0_0.willExit(arg_7_0)
	arg_7_0:detach()
end

return var_0_0
