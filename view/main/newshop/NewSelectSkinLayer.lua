local var_0_0 = class("NewSelectSkinLayer", import(".NewSkinAtlasLayer"))

var_0_0.MODE_SELECT = 1
var_0_0.MODE_VIEW = 2

function var_0_0.init(arg_1_0)
	var_0_0.super.init(arg_1_0)
	setText(arg_1_0._tf:Find("adapt/top/title/Text"), i18n("shop_new_able_to_exchange"))
	setText(arg_1_0._tf:Find("adapt/top/have/Text"), i18n("shop_new_able_to_exchange"))

	arg_1_0.msgBox = SelectSkinMsgbox.New(arg_1_0._tf, arg_1_0.event)
end

function var_0_0.InitData(arg_2_0)
	arg_2_0.skins = {}

	local var_2_0 = arg_2_0.contextData.selectableSkinList or {}

	table.sort(var_2_0, function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:GetTimeLimitWeight()
		local var_3_1 = arg_3_1:GetTimeLimitWeight()

		if var_3_0 == var_3_1 then
			local var_3_2 = arg_3_0:GetOwnWeight()
			local var_3_3 = arg_3_1:GetOwnWeight()

			if var_3_2 == var_3_3 then
				return arg_3_0.skinId > arg_3_1.skinId
			else
				return var_3_3 < var_3_2
			end
		else
			return var_3_1 < var_3_0
		end
	end)

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		table.insert(arg_2_0.skins, iter_2_1:ToShipSkin())
	end

	arg_2_0:GetSkinClassify()

	arg_2_0.filterValues = {
		ownType = 0,
		shipHaveType = 0,
		typeType = {
			0
		},
		campType = {
			0
		},
		rarityType = {
			0
		},
		shipType = {
			0
		},
		themeType = {
			0
		}
	}
	arg_2_0.filterValuesTemp = Clone(arg_2_0.filterValues)
end

function var_0_0.Check(arg_4_0, arg_4_1)
	if getProxy(ShipSkinProxy):hasSkin(arg_4_1.id) then
		return
	end

	local var_4_0 = arg_4_0.contextData.itemId
	local var_4_1 = Item.getConfigData(var_4_0).name

	arg_4_0.msgBox:ExecuteAction("Show", {
		content = i18n("skin_exchange_confirm", var_4_1, arg_4_1.skinName),
		leftDrop = {
			count = 1,
			type = DROP_TYPE_ITEM,
			id = var_4_0
		},
		rightDrop = {
			count = 1,
			type = DROP_TYPE_SKIN,
			id = arg_4_1.id
		},
		onYes = function()
			arg_4_0.contextData.OnConfirm(arg_4_1.id)
			arg_4_0:closeView()
		end
	})
end

function var_0_0.ClickTrigger(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.contextData.mode == var_0_0.MODE_VIEW then
		return
	end

	arg_6_0:Check(arg_6_1.skin)
end

function var_0_0.willExit(arg_7_0)
	var_0_0.super.willExit(arg_7_0)
	arg_7_0.msgBox:Destroy()
end

return var_0_0
