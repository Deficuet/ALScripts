local var_0_0 = class("IndexLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "IndexUI"
end

var_0_0.panelNames = {
	{
		"indexsort_sort",
		"indexsort_sorteng"
	},
	{
		"indexsort_index",
		"indexsort_indexeng"
	},
	{
		"indexsort_camp",
		"indexsort_campeng"
	},
	{
		"indexsort_rarity",
		"indexsort_rarityeng"
	},
	{
		"indexsort_extraindex",
		"indexsort_indexeng"
	}
}

function var_0_0.init(arg_2_0)
	arg_2_0.panel = arg_2_0:findTF("index_panel")
	arg_2_0.displayTFs = {
		arg_2_0:findTF("layout/sort", arg_2_0.panel),
		arg_2_0:findTF("layout/index", arg_2_0.panel),
		arg_2_0:findTF("layout/camp", arg_2_0.panel),
		arg_2_0:findTF("layout/rarity", arg_2_0.panel),
		arg_2_0:findTF("layout/extra", arg_2_0.panel),
		arg_2_0:findTF("layout/EquipSkinSort", arg_2_0.panel),
		arg_2_0:findTF("layout/EquipSkinIndex", arg_2_0.panel),
		arg_2_0:findTF("layout/EquipSkinTheme", arg_2_0.panel)
	}

	_.each(arg_2_0.displayTFs, function(arg_3_0)
		setActive(arg_3_0, false)
	end)

	for iter_2_0 = 1, #var_0_0.panelNames do
		setText(arg_2_0.displayTFs[iter_2_0]:Find("title1/Image"), i18n(var_0_0.panelNames[iter_2_0][1]))
		setText(arg_2_0.displayTFs[iter_2_0]:Find("title1/Image_en"), i18n(var_0_0.panelNames[iter_2_0][2]))
	end

	arg_2_0.displayList = {}
	arg_2_0.typeList = {}
	arg_2_0.btnConfirm = arg_2_0:findTF("layout/btns/ok", arg_2_0.panel)
	arg_2_0.btnCancel = arg_2_0:findTF("layout/btns/cancel", arg_2_0.panel)
	arg_2_0.greySprite = arg_2_0:findTF("resource/grey", arg_2_0.panel):GetComponent(typeof(Image)).sprite
	arg_2_0.blueSprite = arg_2_0:findTF("resource/blue", arg_2_0.panel):GetComponent(typeof(Image)).sprite
	arg_2_0.yellowSprite = arg_2_0:findTF("resource/yellow", arg_2_0.panel):GetComponent(typeof(Image)).sprite
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.btnConfirm, function()
		if arg_4_0.contextData.callback then
			arg_4_0.contextData.callback({
				sort = Clone(arg_4_0.contextData.sort),
				index = Clone(arg_4_0.contextData.index),
				camp = Clone(arg_4_0.contextData.camp),
				rarity = Clone(arg_4_0.contextData.rarity),
				extra = Clone(arg_4_0.contextData.extra),
				equipSkinSort = Clone(arg_4_0.contextData.equipSkinSort),
				equipSkinIndex = Clone(arg_4_0.contextData.equipSkinIndex),
				equipSkinTheme = Clone(arg_4_0.contextData.equipSkinTheme)
			})

			arg_4_0.contextData.callback = nil
		end

		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CONFIRM)
	onButton(arg_4_0, arg_4_0.btnCancel, function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0:findTF("btn", arg_4_0.panel), function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)

	arg_4_0.panel.localScale = Vector3.zero

	LeanTween.scale(arg_4_0.panel, Vector3(1, 1, 1), 0.2)
	arg_4_0:initDisplays()
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.initDisplays(arg_8_0)
	local var_8_0 = {
		"sort",
		"index",
		"camp",
		"rarity",
		"extra",
		"equipSkinSort",
		"equipSkinIndex",
		"equipSkinTheme"
	}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.displayTFs) do
		local var_8_1 = tobool(arg_8_0.contextData.display[var_8_0[iter_8_0]])

		setActive(iter_8_1, var_8_1)

		if var_8_1 then
			if iter_8_0 == IndexConst.DisplayEquipSkinSort then
				arg_8_0:initEquipSkinSort()
				arg_8_0:updateEquipSkinSort()
			elseif iter_8_0 == IndexConst.DisplayEquipSkinIndex then
				arg_8_0:initEquipSkinIndex()
				arg_8_0:updateEquipSkinIndex()
			elseif iter_8_0 == IndexConst.DisplayEquipSkinTheme then
				arg_8_0:initEquipSkinTheme()
				arg_8_0:updateEquipSkinTheme()
			end
		end
	end
end

function var_0_0.initEquipSkinSort(arg_9_0)
	local var_9_0 = {}

	_.each(IndexConst.EquipSkinSortTypes, function(arg_10_0)
		local var_10_0 = bit.lshift(1, arg_10_0)

		if bit.band(arg_9_0.contextData.display.equipSkinSort, var_10_0) > 0 then
			table.insert(var_9_0, arg_10_0)
		end
	end)

	arg_9_0.typeList[IndexConst.DisplayEquipSkinSort] = var_9_0

	local var_9_1 = arg_9_0.displayTFs[IndexConst.DisplayEquipSkinSort]
	local var_9_2 = UIItemList.New(arg_9_0:findTF("panel", var_9_1), arg_9_0:findTF("panel/tpl", var_9_1))

	var_9_2:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = var_9_0[arg_11_1 + 1]
			local var_11_1 = table.indexof(IndexConst.EquipSkinSortTypes, var_11_0)
			local var_11_2 = IndexConst.EquipSkinSortNames[var_11_1]
			local var_11_3 = findTF(arg_11_2, "Image")

			setText(var_11_3, var_11_2)
			setImageSprite(arg_11_2, arg_9_0.greySprite)
			GetOrAddComponent(arg_11_2, typeof(Button))
			onButton(arg_9_0, arg_11_2, function()
				arg_9_0.contextData.equipSkinSort = var_11_0

				arg_9_0:updateEquipSkinSort()
			end, SFX_UI_TAG)
		end
	end)
	var_9_2:align(#var_9_0)

	arg_9_0.displayList[IndexConst.DisplayEquipSkinSort] = var_9_2
end

function var_0_0.updateEquipSkinSort(arg_13_0)
	local var_13_0 = arg_13_0.displayList[IndexConst.DisplayEquipSkinSort]
	local var_13_1 = arg_13_0.typeList[IndexConst.DisplayEquipSkinSort]

	var_13_0:each(function(arg_14_0, arg_14_1)
		local var_14_0 = arg_13_0.contextData.equipSkinSort == var_13_1[arg_14_0 + 1]
		local var_14_1 = findTF(arg_14_1, "Image")

		setImageSprite(arg_14_1, var_14_0 and arg_13_0.yellowSprite or arg_13_0.greySprite)
	end)
end

function var_0_0.initEquipSkinIndex(arg_15_0)
	local var_15_0 = {}

	_.each(IndexConst.EquipSkinIndexTypes, function(arg_16_0)
		local var_16_0 = bit.lshift(1, arg_16_0)

		if bit.band(arg_15_0.contextData.display.equipSkinIndex, var_16_0) > 0 then
			table.insert(var_15_0, arg_16_0)
		end
	end)

	arg_15_0.typeList[IndexConst.DisplayEquipSkinIndex] = var_15_0

	local var_15_1 = arg_15_0.displayTFs[IndexConst.DisplayEquipSkinIndex]
	local var_15_2 = UIItemList.New(arg_15_0:findTF("panel", var_15_1), arg_15_0:findTF("panel/tpl", var_15_1))

	var_15_2:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			local var_17_0 = var_15_0[arg_17_1 + 1]
			local var_17_1 = table.indexof(IndexConst.EquipSkinIndexTypes, var_17_0)
			local var_17_2 = IndexConst.EquipSkinIndexNames[var_17_1]
			local var_17_3 = findTF(arg_17_2, "Image")

			setText(var_17_3, var_17_2)
			setImageSprite(arg_17_2, arg_15_0.greySprite)
			GetOrAddComponent(arg_17_2, typeof(Button))
			onButton(arg_15_0, arg_17_2, function()
				arg_15_0.contextData.equipSkinIndex = IndexConst.ToggleBits(arg_15_0.contextData.equipSkinIndex, var_15_0, IndexConst.EquipSkinIndexAll, var_17_0)

				arg_15_0:updateEquipSkinIndex()
			end, SFX_UI_TAG)
		end
	end)
	var_15_2:align(#var_15_0)

	arg_15_0.displayList[IndexConst.DisplayEquipSkinIndex] = var_15_2
end

function var_0_0.updateEquipSkinIndex(arg_19_0)
	local var_19_0 = arg_19_0.displayList[IndexConst.DisplayEquipSkinIndex]
	local var_19_1 = arg_19_0.typeList[IndexConst.DisplayEquipSkinIndex]

	var_19_0:each(function(arg_20_0, arg_20_1)
		local var_20_0 = var_19_1[arg_20_0 + 1]
		local var_20_1 = bit.band(arg_19_0.contextData.equipSkinIndex, bit.lshift(1, var_20_0)) > 0
		local var_20_2 = findTF(arg_20_1, "Image")

		setImageSprite(arg_20_1, var_20_1 and arg_19_0.yellowSprite or arg_19_0.greySprite)
	end)
end

function var_0_0.initEquipSkinTheme(arg_21_0)
	local var_21_0 = {}

	_.each(IndexConst.EquipSkinThemeTypes, function(arg_22_0)
		local var_22_0 = IndexConst.StrLShift("1", arg_22_0)

		if string.find(IndexConst.StrAnd(arg_21_0.contextData.display.equipSkinTheme, var_22_0), "1") ~= nil then
			table.insert(var_21_0, arg_22_0)
		end
	end)

	arg_21_0.typeList[IndexConst.DisplayEquipSkinTheme] = var_21_0

	local var_21_1 = arg_21_0.displayTFs[IndexConst.DisplayEquipSkinTheme]
	local var_21_2 = UIItemList.New(arg_21_0:findTF("bg/panel", var_21_1), arg_21_0:findTF("bg/panel/tpl", var_21_1))

	var_21_2:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = var_21_0[arg_23_1 + 1]
			local var_23_1 = table.indexof(IndexConst.EquipSkinThemeTypes, var_23_0)
			local var_23_2 = IndexConst.EquipSkinThemeNames[var_23_1]
			local var_23_3 = findTF(arg_23_2, "Image")

			setText(var_23_3, var_23_2)
			setImageSprite(arg_23_2, arg_21_0.greySprite)
			GetOrAddComponent(arg_23_2, typeof(Button))
			onButton(arg_21_0, arg_23_2, function()
				arg_21_0.contextData.equipSkinTheme = IndexConst.ToggleStr(arg_21_0.contextData.equipSkinTheme, var_21_0, IndexConst.EquipSkinThemeAll, var_23_0)

				arg_21_0:updateEquipSkinTheme()
			end, SFX_UI_TAG)
		end
	end)
	var_21_2:align(#var_21_0)

	arg_21_0.displayList[IndexConst.DisplayEquipSkinTheme] = var_21_2
end

function var_0_0.updateEquipSkinTheme(arg_25_0)
	local var_25_0 = arg_25_0.displayList[IndexConst.DisplayEquipSkinTheme]
	local var_25_1 = arg_25_0.typeList[IndexConst.DisplayEquipSkinTheme]

	var_25_0:each(function(arg_26_0, arg_26_1)
		local var_26_0 = var_25_1[arg_26_0 + 1]
		local var_26_1 = IndexConst.StrLShift("1", var_26_0)
		local var_26_2 = string.find(IndexConst.StrAnd(arg_25_0.contextData.equipSkinTheme, var_26_1), "1") ~= nil
		local var_26_3 = findTF(arg_26_1, "Image")

		setImageSprite(arg_26_1, var_26_2 and arg_25_0.yellowSprite or arg_25_0.greySprite)
	end)
end

function var_0_0.willExit(arg_27_0)
	LeanTween.cancel(go(arg_27_0.panel))
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_27_0._tf)
end

return var_0_0
