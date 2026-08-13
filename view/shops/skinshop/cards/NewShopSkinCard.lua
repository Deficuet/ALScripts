local var_0_0 = class("NewShopSkinCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = tf(arg_1_1)
	arg_1_0._content = arg_1_0._tf:Find("frame/content")
	arg_1_0._icon = arg_1_0._tf:Find("frame/content/main/bg/mask/icon"):GetComponent(typeof(Image))
	arg_1_0._priceTF = arg_1_0._tf:Find("frame/content/main/bg/price")

	setActive(arg_1_0._priceTF, false)

	arg_1_0._priceIcon = arg_1_0._priceTF:Find("gem"):GetComponent(typeof(Image))
	arg_1_0._priceTxt = arg_1_0._priceTF:Find("gem/Text"):GetComponent(typeof(Text))
	arg_1_0._opriceTxt = arg_1_0._priceTF:Find("originalprice"):GetComponent(typeof(Text))
	arg_1_0.tagImg = arg_1_0._tf:Find("frame/content/top/tag_activity"):GetComponent(typeof(Image))
	arg_1_0.discountTag = arg_1_0._tf:Find("frame/content/top/tag_discount")
	arg_1_0.discountTagOffTxt = arg_1_0.discountTag:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.isSelected = false
	arg_1_0.probability = arg_1_0._tf:Find("frame/content/top/tag_probability")

	setActive(arg_1_0.probability, false)
end

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5 = 5
local var_0_6 = 6
local var_0_7 = -2
local var_0_8 = -3
local var_0_9 = -4
local var_0_10 = {
	[302053] = 39
}
local var_0_11 = {
	[var_0_1] = {
		"rexiao",
		"hot_sells"
	},
	[var_0_2] = {
		"xinpin",
		"xinpin"
	},
	[var_0_3] = {
		"tuijian",
		"tujian"
	},
	[var_0_4] = {
		"huodong",
		"huodong"
	},
	[var_0_5] = {
		"",
		""
	},
	[var_0_6] = {
		"fanchang_2",
		""
	},
	[var_0_7] = {
		"",
		""
	},
	[var_0_8] = {
		"yigoumai",
		"clothing"
	},
	[var_0_9] = {
		"",
		"clothing"
	}
}

function var_0_0.GetTagId(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.buyCount == 0

	if arg_2_1 and var_2_0 then
		return var_0_6
	end

	if arg_2_0:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_7
	end

	if not var_2_0 then
		return var_0_8
	end

	local var_2_1 = arg_2_0:getConfig("tag")

	if (arg_2_0:isDisCount() or var_2_1 == var_0_5) and not arg_2_0:IsItemDiscountType() then
		return var_0_5
	elseif var_0_11[var_2_1] then
		return var_2_1
	else
		return var_0_9
	end
end

function var_0_0.Update(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_0.commodity = arg_3_1
	arg_3_0.isReturn = arg_3_3

	local var_3_0 = arg_3_1:getSkinId()
	local var_3_1 = pg.ship_skin_template

	arg_3_0.shipSkinConfig = var_3_1[var_3_0]

	local var_3_2 = var_3_1[var_3_0].prefab

	arg_3_0._icon.sprite = nil

	LoadSpriteAsync("shipYardIcon/" .. var_3_2, function(arg_4_0)
		if not IsNil(arg_3_0._icon) then
			arg_3_0._icon.sprite = arg_4_0
		end
	end)

	local var_3_3 = false
	local var_3_4 = false
	local var_3_5 = arg_3_0.commodity.type == Goods.TYPE_SKIN

	if var_3_5 then
		local var_3_6 = arg_3_1:getConfig("resource_type")

		LoadSpriteAsync(Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_3_6
		}):getIcon(), function(arg_5_0)
			if IsNil(arg_3_0._priceIcon) then
				return
			end

			arg_3_0._priceIcon.sprite = arg_5_0
		end)

		local var_3_7 = arg_3_1:getConfig("resource_num")
		local var_3_8 = arg_3_1:isDisCount()
		local var_3_9, var_3_10 = arg_3_1:GetPrice()

		arg_3_0._priceTxt.text = var_3_9
		arg_3_0._opriceTxt.text = var_3_7

		setActive(go(arg_3_0._opriceTxt), var_3_8 and var_3_10 > 0)

		local var_3_11 = var_0_0.GetTagId(arg_3_1, arg_3_3)

		if var_3_11 == var_0_5 then
			var_3_3 = true
			arg_3_0.discountTagOffTxt.text = string.format("%0.2f", var_3_10) .. "%"
		elseif var_3_11 == var_0_7 then
			var_3_4 = true
		else
			local var_3_12 = var_0_11[var_3_11][1]
			local var_3_13 = var_0_11[var_3_11][2]

			arg_3_0.tagImg.enabled = var_3_12 and var_3_12 ~= ""

			if arg_3_0.tagImg.enabled then
				arg_3_0.tagImg.sprite = GetSpriteFromAtlas("ui/SkinShopUI_atlas", "tag_" .. var_3_12)
			end
		end
	end

	setActive(arg_3_0.tagImg.gameObject, var_3_5 and not var_3_3 and not var_3_4)
	setActive(arg_3_0.discountTag, var_3_5 and var_3_3)

	local var_3_14 = var_0_10[var_3_0] or 0

	setAnchoredPosition(arg_3_0._icon.gameObject, {
		y = var_3_14
	})
	arg_3_0:UpdateSelected(arg_3_2)

	if arg_3_4 then
		setActive(arg_3_0.probability, true)

		local var_3_15 = arg_3_4 or 0

		setText(arg_3_0.probability:Find("Text"), " " .. string.format("%0.1f", var_3_15 / 100) .. "%")
	end
end

function var_0_0.UpdateSelected(arg_6_0, arg_6_1)
	if arg_6_0.isSelected ~= arg_6_1 then
		arg_6_0.isSelected = arg_6_1

		local var_6_0 = arg_6_1 and -7.8 or -61

		arg_6_0._content.localPosition = Vector3(0, var_6_0, 0)

		local var_6_1 = arg_6_0.commodity.type == Goods.TYPE_SKIN

		setActive(arg_6_0._priceTF, arg_6_1 and var_6_1)
	end
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0:UpdateSelected(false)

	arg_7_0._go = nil
	arg_7_0._tf = nil
end

return var_0_0
