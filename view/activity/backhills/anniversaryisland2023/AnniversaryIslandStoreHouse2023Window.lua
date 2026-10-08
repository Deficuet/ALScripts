local var_0_0 = class("AnniversaryIslandStoreHouse2023Window", import("view.base.BaseUI"))

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.loader = AutoLoader.New()
end

function var_0_0.getUIName(arg_2_0)
	return "AnniversaryIslandStoreHouse2023Window"
end

local var_0_1 = "ui/AtelierCommonUI_atlas"

function var_0_0.getResource(arg_3_0)
	local var_3_0 = var_0_0.super.getResource(arg_3_0)

	table.insert(var_3_0, var_0_1)

	return var_3_0
end

function var_0_0.preload(arg_4_0, arg_4_1)
	table.ParallelIpairsAsync({
		var_0_1
	}, function(arg_5_0, arg_5_1, arg_5_2)
		arg_4_0.loader:LoadBundle(arg_5_1, arg_5_2)
	end, arg_4_1)
end

function var_0_0.init(arg_6_0)
	arg_6_0.storehouseRect = arg_6_0._tf:Find("Window/ScrollView"):GetComponent("LScrollRect")

	setActive(arg_6_0._tf:Find("Window/ScrollView/Item"), false)
end

function var_0_0.SetActivity(arg_7_0, arg_7_1)
	arg_7_0.items = arg_7_1:GetAllVitems()
	arg_7_0.itemList = {}

	table.Foreach(arg_7_0.items, function(arg_8_0, arg_8_1)
		if arg_8_1 <= 0 then
			return
		end

		table.insert(arg_7_0.itemList, WorkBenchItem.New({
			configId = arg_8_0,
			count = arg_8_1
		}))
	end)
	table.sort(arg_7_0.itemList, function(arg_9_0, arg_9_1)
		return arg_9_0:GetConfigID() < arg_9_1:GetConfigID()
	end)
end

function var_0_0.didEnter(arg_10_0)
	function arg_10_0.storehouseRect.onUpdateItem(arg_11_0, arg_11_1)
		arg_11_0 = arg_11_0 + 1

		local var_11_0 = tf(arg_11_1)
		local var_11_1 = arg_10_0.itemList[arg_11_0]

		arg_10_0:UpdateItem(var_11_0:Find("IconBG"), var_11_1)
		setScrollText(var_11_0:Find("NameBG/Rect/Name"), var_11_1:GetName())
		onButton(arg_10_0, var_11_0, function()
			arg_10_0:emit(WorkBenchItemDetailMediator.SHOW_DETAIL, var_11_1)
		end, SFX_PANEL)
	end

	onButton(arg_10_0, arg_10_0._tf:Find("Window/Close"), function()
		arg_10_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0._tf:Find("BG"), function()
		arg_10_0:onBackPressed()
	end)
	arg_10_0:UpdateView()
end

function var_0_0.UpdateView(arg_15_0)
	local var_15_0 = arg_15_0.itemList

	setActive(arg_15_0._tf:Find("Window/Empty"), #var_15_0 == 0)
	setActive(arg_15_0._tf:Find("Window/ScrollView"), #var_15_0 > 0)
	arg_15_0.storehouseRect:SetTotalCount(#var_15_0)
end

function var_0_0.UpdateItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = "icon_frame_" .. arg_16_2:GetRarity()

	arg_16_0.loader:GetSpriteQuiet(var_0_1, var_16_0, arg_16_1)
	arg_16_0.loader:GetSpriteQuiet(arg_16_2:GetIconPath(), "", arg_16_1:Find("Icon"))

	if not IsNil(arg_16_1:Find("Text")) then
		setText(arg_16_1:Find("Text"), arg_16_2.count)
	end
end

function var_0_0.willExit(arg_17_0)
	arg_17_0.loader:Clear()
end

return var_0_0
