local var_0_0 = class("BackYardGarnitureLayer", import("..base.BaseUI"))

function var_0_0.preload(arg_1_0, arg_1_1)
	PoolMgr.GetInstance():GetUI("BackYardIndexUI", true, function(arg_2_0)
		arg_1_0.filterTF = tf(arg_2_0)

		arg_1_1()
	end)
end

function var_0_0.SORT_FUNC(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_3 = arg_3_3 or 1

	local var_3_0 = arg_3_2:getSameConfigIdCount(arg_3_0.configId) == arg_3_0.count and 1 or 0
	local var_3_1 = arg_3_2:getSameConfigIdCount(arg_3_1.configId) == arg_3_1.count and 1 or 0

	if var_3_0 == var_3_1 then
		if arg_3_3 == BackYardShopFilterPanel.ORDER_MODE_ASC then
			return arg_3_0.id < arg_3_1.id
		else
			return arg_3_0.id > arg_3_1.id
		end
	else
		return var_3_0 < var_3_1
	end
end

function var_0_0.getUIName(arg_4_0)
	return "BackYardGarnitureUI"
end

function var_0_0.setFurnitrues(arg_5_0, arg_5_1)
	arg_5_0.furnitureVOs = arg_5_1
end

function var_0_0.setHouseVO(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.furnitruesPackage = arg_6_1
	arg_6_0.curHouse = arg_6_2
end

function var_0_0.setUserThemes(arg_7_0, arg_7_1)
	arg_7_0.userThemes = arg_7_1 or {}

	arg_7_0:initThemes()
end

function var_0_0.setdormProxy(arg_8_0, arg_8_1)
	arg_8_0.dormProxy = arg_8_1
end

function var_0_0.init(arg_9_0)
	arg_9_0.decoratePanel = arg_9_0:findTF("decoratePanel")
	arg_9_0.saveBtn = arg_9_0:findTF("save", arg_9_0.decoratePanel)
	arg_9_0.clearBtn = arg_9_0:findTF("clear", arg_9_0.decoratePanel)
	arg_9_0.themesPanel = arg_9_0:findTF("bg/frame/themes", arg_9_0.decoratePanel)
	arg_9_0.shopBtn = arg_9_0:findTF("shop", arg_9_0.decoratePanel)
	arg_9_0.limitText = arg_9_0:findTF("decoratePanel/bg/frame/limit/value/Text")
	arg_9_0.rightBtn = arg_9_0:findTF("bg/rightBtn", arg_9_0.decoratePanel)
	arg_9_0.leftBtn = arg_9_0:findTF("bg/leftBtn", arg_9_0.decoratePanel)
	arg_9_0.rightCG = GetOrAddComponent(arg_9_0.rightBtn, typeof(CanvasGroup))
	arg_9_0.leftCG = GetOrAddComponent(arg_9_0.leftBtn, typeof(CanvasGroup))
	arg_9_0.themebox = arg_9_0:findTF("theme_box")
	arg_9_0.themeFrame = arg_9_0.themebox:Find("frame")
	arg_9_0.msgbox = arg_9_0.themebox:Find("msg")
	arg_9_0.msgboxContent = arg_9_0.msgbox:Find("bound/Text"):GetComponent(typeof(Text))
	arg_9_0.msgboxComfirmBtn = arg_9_0.msgbox:Find("control/save_btn")

	setParent(arg_9_0.filterTF, arg_9_0._tf)

	arg_9_0.orderMode = nil
	arg_9_0.filterPanel = arg_9_0:findTF("decoratePanel/bg/filter")
	arg_9_0.filterBtn = arg_9_0:findTF("filter_btn", arg_9_0.filterPanel)
	arg_9_0.sortBtn = arg_9_0:findTF("sort_btn", arg_9_0.filterPanel)
	arg_9_0.sortBtnAsc = arg_9_0:findTF("asc", arg_9_0.sortBtn)
	arg_9_0.sortBtnDasc = arg_9_0:findTF("dasc", arg_9_0.sortBtn)
	arg_9_0.searchBar = arg_9_0:findTF("InputField", arg_9_0.filterPanel)
end

function var_0_0.didEnter(arg_10_0)
	arg_10_0.descrationItems = {}

	arg_10_0:initThemeBox()
	arg_10_0:initDecorations()

	local var_10_0 = arg_10_0:findTF("types", arg_10_0.decoratePanel)

	for iter_10_0 = 0, 6 do
		local var_10_1 = var_10_0:GetChild(iter_10_0)
		local var_10_2 = iter_10_0

		onToggle(arg_10_0, var_10_1, function(arg_11_0)
			if arg_11_0 then
				arg_10_0:filter(var_10_2)

				arg_10_0.contextData.index = var_10_2
			end
		end, SFX_PANEL)

		if iter_10_0 == 0 then
			triggerToggle(var_10_1, true)
		end
	end

	onButton(arg_10_0, arg_10_0.saveBtn, function()
		arg_10_0:emit(BackYardGarnitureMediator.SAVE_FURNITURE)
	end, SFX_FURNITRUE_SAVE)
	onButton(arg_10_0, arg_10_0.clearBtn, function()
		arg_10_0:emit(BackYardGarnitureMediator.ClEAR_FURNITURE, true)
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.shopBtn, function()
		arg_10_0:emit(BackYardGarnitureMediator.OPEN_SHOP)
		setActive(arg_10_0._tf, false)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.filterBtn, function()
		arg_10_0:showFilterPanel()
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.sortBtn, function(arg_16_0)
		arg_10_0.orderMode = arg_16_0 and BackYardShopFilterPanel.ORDER_MODE_ASC or BackYardShopFilterPanel.ORDER_MODE_DASC

		setActive(arg_10_0.sortBtnAsc, arg_16_0)
		setActive(arg_10_0.sortBtnDasc, not arg_16_0)

		if arg_10_0.indexPanel then
			arg_10_0.indexPanel:filterFurnitures(arg_10_0.decorationVOs, arg_10_0.orderMode)
			arg_10_0.scrollRect:SetTotalCount(#arg_10_0.decorationVOs, arg_10_0.contextData.rectValue or 0)
		else
			arg_10_0:filter(arg_10_0.contextData.index or 0)
		end
	end, SFX_PANEL, SFX_PANEL)
	triggerToggle(arg_10_0.sortBtn, true)
	onInputChanged(arg_10_0, arg_10_0.searchBar, function(arg_17_0)
		arg_10_0.searchKey = arg_17_0

		local var_17_0 = arg_10_0.contextData.index or 0

		if var_17_0 == 0 then
			arg_10_0:filterTheme()
		else
			arg_10_0:filter(var_17_0)
		end
	end)
end

function var_0_0.addTheme(arg_18_0, arg_18_1)
	arg_18_0.userThemes[arg_18_1.id] = arg_18_1

	table.insert(arg_18_0.allThemeVOs, arg_18_1)
	arg_18_0:filterTheme()
end

function var_0_0.deleteTheme(arg_19_0, arg_19_1)
	arg_19_0.userThemes[arg_19_1] = nil

	for iter_19_0, iter_19_1 in pairs(arg_19_0.allThemeVOs) do
		if iter_19_1.id == arg_19_1 and iter_19_1.type == BackYardTheme.TYPE_USER then
			table.remove(arg_19_0.allThemeVOs, iter_19_0)

			break
		end
	end

	arg_19_0:filterTheme()
end

function var_0_0.initThemes(arg_20_0)
	if not arg_20_0.themeInited then
		arg_20_0.allThemeVOs = {}

		local var_20_0 = pg.backyard_theme_template

		for iter_20_0, iter_20_1 in pairs(var_20_0.all) do
			if var_20_0[iter_20_1].is_view == 1 then
				table.insert(arg_20_0.allThemeVOs, BackYardTheme.New({
					id = iter_20_1
				}))
			end
		end

		arg_20_0.themeRect = arg_20_0.themesPanel:GetComponent("LScrollRect")

		function arg_20_0.themeRect.onInitItem(arg_21_0)
			arg_20_0:onInitTheme(arg_21_0)
		end

		function arg_20_0.themeRect.onUpdateItem(arg_22_0, arg_22_1)
			arg_20_0:onUpdateTheme(arg_22_0, arg_22_1)
		end

		arg_20_0.themeTFs = {}
		arg_20_0.themeInited = true
	end

	if arg_20_0.userThemes then
		for iter_20_2, iter_20_3 in pairs(arg_20_0.userThemes) do
			table.insert(arg_20_0.allThemeVOs, iter_20_3)
		end
	end

	arg_20_0:filterTheme()
end

function var_0_0.onInitTheme(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:createDecoration(arg_23_1)

	onButton(arg_23_0, var_23_0.go, function()
		arg_23_0.selectThemeVO = var_23_0.themeVO

		arg_23_0:openThemeBox()
	end)
	onButton(arg_23_0, var_23_0.add, function()
		arg_23_0.selectThemeVO = {
			id = 0
		}

		arg_23_0:openThemeBox()
	end)

	arg_23_0.themeTFs[arg_23_1] = var_23_0
end

function var_0_0.onUpdateTheme(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.themeTFs[arg_26_2]

	if not var_26_0 then
		arg_26_0:onInitTheme(arg_26_2)

		var_26_0 = arg_26_0.themeTFs[arg_26_2]
	end

	local var_26_1 = arg_26_0.themeVOs[arg_26_1 + 1]

	var_26_0:updateTheme(var_26_1, arg_26_0.curHouse)
end

function var_0_0.filterTheme(arg_27_0)
	arg_27_0.themeVOs = {}

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.allThemeVOs or {}) do
		if iter_27_1:isBought(arg_27_0.furnitureVOs) and iter_27_1:isMatchSearchKey(arg_27_0.searchKey) then
			table.insert(arg_27_0.themeVOs, iter_27_1)
		end
	end

	table.sort(arg_27_0.themeVOs, function(arg_28_0, arg_28_1)
		local var_28_0 = arg_28_0:isUsing(arg_27_0.curHouse) and 0 or 1
		local var_28_1 = arg_28_1:isUsing(arg_27_0.curHouse) and 0 or 1

		if var_28_0 == var_28_1 then
			if arg_28_0.type == arg_28_1.type then
				return arg_28_0.id < arg_28_1.id
			else
				return arg_28_0.type < arg_28_1.type
			end
		else
			return var_28_1 < var_28_0
		end
	end)

	local var_27_0 = 0

	for iter_27_2, iter_27_3 in ipairs(arg_27_0.themeVOs) do
		if iter_27_3.type == BackYardTheme.TYPE_USER then
			var_27_0 = var_27_0 + 1
		end
	end

	if var_27_0 < BackYardTheme.MAX_USER_THEME then
		table.insert(arg_27_0.themeVOs, {
			id = 0
		})
	end

	arg_27_0.themeRect:SetTotalCount(#arg_27_0.themeVOs, -1)
end

function var_0_0.applyTheme(arg_29_0, arg_29_1)
	local var_29_0 = {}
	local var_29_1 = pg.furniture_data_template
	local var_29_2 = pg.furniture_data_template

	table.sort(arg_29_1, function(arg_30_0, arg_30_1)
		if (arg_30_0.parent ~= 0 and 1 or 0) == (arg_30_1.parent ~= 0 and 1 or 0) then
			local var_30_0 = var_29_2[arg_30_0.id] and var_29_2[arg_30_0.id].type == Furniture.TYPE_STAGE and 1 or 0
			local var_30_1 = var_29_2[arg_30_1.id] and var_29_2[arg_30_1.id].type == Furniture.TYPE_STAGE and 1 or 0

			if var_30_0 == var_30_1 then
				return table.getCount(arg_30_0.child or {}) > table.getCount(arg_30_1.child or {})
			else
				return var_30_1 < var_30_0
			end
		else
			return arg_30_0.parent < arg_30_1.parent
		end
	end)

	for iter_29_0, iter_29_1 in ipairs(arg_29_1) do
		table.insert(var_29_0, function(arg_31_0)
			local var_31_0 = Furniture.New(iter_29_1)

			if var_31_0.position then
				arg_29_0:emit(BackYardGarnitureMediator.ADD_FURNITURE, var_31_0, arg_31_0)
			else
				arg_31_0()
			end
		end)
	end

	pg.UIMgr.GetInstance():LoadingOn()
	seriesAsync(var_29_0, function()
		pg.UIMgr.GetInstance():LoadingOff()
		arg_29_0:filterTheme()
	end)
end

function var_0_0.getCloneFurniture(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.furnitruesPackage
	local var_33_1 = Clone(arg_33_1)

	if var_33_0.furnitures[arg_33_1.id] and not arg_33_1:isPaper() then
		for iter_33_0 = 1, arg_33_1.count - 1 do
			local var_33_2 = arg_33_1:getCloneId(iter_33_0)

			if not var_33_0.furnitures[var_33_2] then
				var_33_1.id = var_33_2

				break
			end
		end
	end

	return var_33_1
end

function var_0_0.createDecoration(arg_34_0, arg_34_1)
	return {
		go = arg_34_1,
		maskTF = arg_34_0:findTF("itemtpl/mask", arg_34_1),
		iconImg = arg_34_0:findTF("itemtpl/icon", arg_34_1):GetComponent(typeof(Image)),
		comfortableTF = arg_34_0:findTF("itemtpl/comfortable/Text", arg_34_1),
		newTF = arg_34_0:findTF("itemtpl/new_bg", arg_34_1),
		add = arg_34_0:findTF("itemtpl/Add", arg_34_1),
		count = arg_34_0:findTF("itemtpl/count", arg_34_1),
		update = function(arg_35_0, arg_35_1, arg_35_2)
			arg_35_0.furniture = arg_35_1
			arg_35_0.iconImg.sprite = LoadSprite("furnitureicon/" .. arg_35_1:getConfig("icon"))

			setText(arg_35_0.comfortableTF, shortenString(arg_35_1:getConfig("name"), 4))
			SetActive(arg_35_0.maskTF, arg_35_2.furnitures[arg_35_1.id])

			if arg_35_1.count > 1 then
				local var_35_0 = arg_35_2:getSameConfigIdCount(arg_35_1.configId)

				setText(arg_35_0.count, var_35_0 .. "/" .. arg_35_1.count)
				SetActive(arg_35_0.maskTF, var_35_0 == arg_35_1.count)
			else
				setText(arg_35_0.count, "")
			end

			SetActive(arg_35_0.newTF, arg_35_1.isNew)
		end,
		updateTheme = function(arg_36_0, arg_36_1, arg_36_2)
			SetActive(arg_36_0.add, arg_36_1.id <= 0)

			if arg_36_1.id > 0 then
				arg_36_0.themeVO = arg_36_1
				arg_36_0.iconImg.sprite = LoadSprite("furnitureicon/" .. arg_36_1:getIcon("icon"))

				setText(arg_36_0.comfortableTF, shortenString(arg_36_1:getName(), 4))
				SetActive(arg_36_0.maskTF, arg_36_1:isUsing(arg_36_2))
				SetActive(arg_36_0.newTF, false)
			end
		end
	}
end

function var_0_0.initDecorations(arg_37_0)
	arg_37_0.itemsView = arg_37_0:findTF("bg/frame/items", arg_37_0.decoratePanel)
	arg_37_0.scrollRect = arg_37_0.itemsView:GetComponent("LScrollRect")

	arg_37_0:filter(arg_37_0.contextData.index or 0)

	function arg_37_0.scrollRect.onInitItem(arg_38_0)
		arg_37_0:initDecoration(arg_38_0)
	end

	function arg_37_0.scrollRect.onUpdateItem(arg_39_0, arg_39_1)
		arg_37_0:updateDecoration(arg_39_0, arg_39_1)
	end

	arg_37_0.rightEventTrigger = pressPersistTrigger(arg_37_0.rightBtn, 0.1, function()
		if #arg_37_0.decorationVOs == 0 then
			return
		end

		arg_37_0.scrollRect:ScrollTo(math.min(arg_37_0.scrollRect.value + 0.1, 1))
	end, nil, nil, nil, nil, SFX_PANEL)
	arg_37_0.leftEventTrigger = pressPersistTrigger(arg_37_0.leftBtn, 0.1, function()
		arg_37_0.scrollRect:ScrollTo(math.max(arg_37_0.scrollRect.value - 0.1, 0))
	end, nil, nil, nil, nil, SFX_PANEL)
end

function var_0_0.initDecoration(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0:createDecoration(arg_42_1)

	onButton(arg_42_0, var_42_0.go, function()
		if not arg_42_0.curHouse:canPutFurniture(var_42_0.furniture) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_cant_put_tip"))

			return
		end

		assert(arg_42_0.furnitureVOs[var_42_0.furniture.id], "furniture is nil" .. var_42_0.furniture.id)

		arg_42_0.furnitureVOs[var_42_0.furniture.id].isNew = nil

		var_42_0.furniture:clearPosition()

		local var_43_0 = arg_42_0:getCloneFurniture(var_42_0.furniture)

		arg_42_0:emit(BackYardGarnitureMediator.ADD_FURNITURE, var_43_0)
	end, SFX_PANEL)
	onButton(arg_42_0, var_42_0.maskTF, function()
		if var_42_0.furniture:isPaper() then
			arg_42_0:emit(BackYardGarnitureMediator.REMOVE_PAPER, var_42_0.furniture:getConfig("type"))
		end
	end, SFX_PANEL)

	arg_42_0.descrationItems[arg_42_1] = var_42_0
end

function var_0_0.updateDecoration(arg_45_0, arg_45_1, arg_45_2)
	if not arg_45_0.descrationItems then
		return
	end

	local var_45_0 = arg_45_0.descrationItems[arg_45_2]

	if not var_45_0 then
		arg_45_0:initDecoration(arg_45_2)

		var_45_0 = arg_45_0.descrationItems[arg_45_2]
	end

	local var_45_1 = arg_45_0.decorationVOs[arg_45_1 + 1]

	var_45_0:update(var_45_1, arg_45_0.furnitruesPackage)
end

function var_0_0.filter(arg_46_0, arg_46_1)
	arg_46_0:filterAll(arg_46_1)

	if arg_46_1 == BackYardConst.TAG_INDEX_THEME then
		return
	end

	if arg_46_0.indexPanel then
		arg_46_0.indexPanel:filterFurnitures(arg_46_0.decorationVOs)
	else
		table.sort(arg_46_0.decorationVOs, function(arg_47_0, arg_47_1)
			return var_0_0.SORT_FUNC(arg_47_0, arg_47_1, arg_46_0.furnitruesPackage, arg_46_0.orderMode)
		end)
	end

	arg_46_0:SetTotalCount(arg_46_1)
end

function var_0_0.SetTotalCount(arg_48_0, arg_48_1)
	if arg_48_0.scrollRect and arg_48_0.scrollRect.value then
		arg_48_0.contextData.rectValue = arg_48_0.scrollRect.value
	end

	arg_48_0.scrollRect:SetTotalCount(#arg_48_0.decorationVOs, arg_48_0.contextData.rectValue or 0)
	arg_48_0:enableBothBtn(#arg_48_0.decorationVOs == 0)
	arg_48_0:updateTips(arg_48_1)
end

function var_0_0.filterAll(arg_49_0, arg_49_1)
	arg_49_0.decorationVOs = {}

	setActive(arg_49_0.themesPanel, arg_49_1 == 0)
	setActive(arg_49_0.itemsView, arg_49_1 ~= 0)

	if arg_49_1 == BackYardConst.TAG_INDEX_THEME then
		setText(arg_49_0.limitText, "")

		local var_49_0 = table.getCount(arg_49_0.themeVOs or {})

		arg_49_0:enableBothBtn(var_49_0 == 0)

		return
	end

	for iter_49_0, iter_49_1 in pairs(arg_49_0.furnitureVOs) do
		if arg_49_1 == iter_49_1:getConfig("tag") and iter_49_1:isMatchSearchKey(arg_49_0.searchKey) then
			table.insert(arg_49_0.decorationVOs, iter_49_1)
		end
	end
end

function var_0_0.enableBothBtn(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1 and 0.2 or 1

	arg_50_0.rightCG.alpha = var_50_0
	arg_50_0.leftCG.alpha = var_50_0
end

function var_0_0.updateTips(arg_51_0, arg_51_1)
	if arg_51_1 == BackYardConst.TAG_INDEX_THEME then
		setText(arg_51_0.limitText, "")

		return
	end

	local var_51_0 = arg_51_0.curHouse:getCountByIndex(arg_51_1)
	local var_51_1 = pg.dorm_data_template[arg_51_0.curHouse.level].limit[arg_51_1]

	setText(arg_51_0.limitText, var_51_0 .. "/" .. var_51_1)
end

function var_0_0.updateDecorationTF(arg_52_0, arg_52_1)
	if arg_52_1:isCloneFurnitrue() then
		arg_52_0:filter(arg_52_0.contextData.index or 0)

		return
	end

	if not arg_52_1:isFurniture() then
		return
	end

	arg_52_0.furnitureVOs[arg_52_1.id] = arg_52_1

	arg_52_0:filter(arg_52_0.contextData.index or 0)
end

function var_0_0.initThemeBox(arg_53_0)
	arg_53_0.themeCancelBtn = arg_53_0:findTF("frame/control/cancel_btn", arg_53_0.themebox)
	arg_53_0.themeDeleteBtn = arg_53_0:findTF("frame/control/delete_btn", arg_53_0.themebox)
	arg_53_0.themeSaveBtn = arg_53_0:findTF("frame/control/save_btn", arg_53_0.themebox)
	arg_53_0.themeSetBtn = arg_53_0:findTF("frame/control/set_btn", arg_53_0.themebox)
	arg_53_0.themeInput = arg_53_0:findTF("frame/bound/input", arg_53_0.themebox)
	arg_53_0.themeName = arg_53_0:findTF("frame/bound/Name", arg_53_0.themebox)
	arg_53_0.themeNameText = arg_53_0:findTF("Text", arg_53_0.themeName)
	arg_53_0.themeDesc = arg_53_0:findTF("frame/bound/desc", arg_53_0.themebox)
	arg_53_0.themeIcon = arg_53_0:findTF("frame/bound/Icon", arg_53_0.themebox):GetComponent(typeof(Image))
	arg_53_0.selectThemeVO = nil

	onButton(arg_53_0, arg_53_0.themebox, function()
		arg_53_0:closeThemeBox()
	end)
	onButton(arg_53_0, arg_53_0.themeCancelBtn, function()
		arg_53_0:closeThemeBox()
	end)
	onButton(arg_53_0, arg_53_0.themeDeleteBtn, function()
		arg_53_0:emit(BackYardGarnitureMediator.DELETE_THEME, arg_53_0.selectThemeVO.id)
	end)
	onButton(arg_53_0, arg_53_0.themeSaveBtn, function()
		if table.getCount(arg_53_0.curHouse.furnitures) == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_save_empty_theme"))

			return
		end

		local var_57_0 = getInputText(arg_53_0.themeInput)

		if wordVer(var_57_0) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_theme_name_forbid"))

			return
		end

		arg_53_0:emit(BackYardGarnitureMediator.SAVE_THEME, arg_53_0.dormProxy:getNewID(), var_57_0)
		arg_53_0:closeThemeBox()
	end)
	onButton(arg_53_0, arg_53_0.themeSetBtn, function()
		local function var_58_0(arg_59_0)
			if table.getCount(arg_59_0) == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardScene_error_noFurniture"))

				return
			end

			arg_53_0:emit(BackYardGarnitureMediator.ClEAR_FURNITURE)
			arg_53_0:applyTheme(arg_59_0)
			arg_53_0:closeThemeBox()
		end

		if arg_53_0.selectThemeVO:isOccupyed(arg_53_0.furnitruesPackage, arg_53_0.contextData.floor) then
			arg_53_0:openMsgBox(i18n("backyarad_theme_replace", arg_53_0.selectThemeVO:getName()), function()
				local var_60_0 = arg_53_0.selectThemeVO:getUsableFurnituresForFloor(arg_53_0.furnitruesPackage, arg_53_0.contextData.floor)

				var_58_0(Clone(var_60_0))
				arg_53_0:closeMsgBox()
			end)
		else
			local var_58_1 = arg_53_0.selectThemeVO.furnitruesByIds
			local var_58_2 = {}

			for iter_58_0, iter_58_1 in pairs(Clone(var_58_1)) do
				table.insert(var_58_2, iter_58_1)
			end

			var_58_0(var_58_2)
		end
	end)
	onInputChanged(arg_53_0, arg_53_0.themeInput, function()
		if arg_53_0.selectThemeVO.id <= 0 then
			setText(arg_53_0.themeDesc, i18n("backyard_theme_save_tip", getInputText(arg_53_0.themeInput)))
		end
	end)
end

function var_0_0.openThemeBox(arg_62_0)
	if not arg_62_0.selectThemeVO then
		return
	end

	arg_62_0.isOpenThemeBox = true

	if arg_62_0.selectThemeVO.id > 0 then
		local var_62_0 = arg_62_0.selectThemeVO:getName()

		setText(arg_62_0.themeNameText, arg_62_0.selectThemeVO:getName())
		setText(arg_62_0.themeDesc, i18n("backyard_theme_set_tip", var_62_0))

		arg_62_0.themeIcon.sprite = LoadSprite("furnitureicon/" .. arg_62_0.selectThemeVO:getIcon("icon"))
	else
		local var_62_1 = arg_62_0.dormProxy:getNewID()

		setInputText(arg_62_0.themeInput, i18n("backyard_theme_defaultname") .. var_62_1)
		setText(arg_62_0.themeDesc, i18n("backyard_theme_save_tip", i18n("backyard_theme_defaultname") .. var_62_1))

		arg_62_0.themeIcon.sprite = LoadSprite("furnitureicon/default_theme")
	end

	setActive(arg_62_0.themebox, true)
	setActive(arg_62_0.msgbox, false)
	setActive(arg_62_0.themeInput, arg_62_0.selectThemeVO.id <= 0)
	setActive(arg_62_0.themeName, arg_62_0.selectThemeVO.id > 0)
	setActive(arg_62_0.themeCancelBtn, arg_62_0.selectThemeVO.id <= 0)
	setActive(arg_62_0.themeDeleteBtn, arg_62_0.selectThemeVO.id > 0 and arg_62_0.selectThemeVO.type == BackYardTheme.TYPE_USER)
	setActive(arg_62_0.themeSetBtn, arg_62_0.selectThemeVO.id > 0)
	setActive(arg_62_0.themeSaveBtn, arg_62_0.selectThemeVO.id <= 0)
end

function var_0_0.closeThemeBox(arg_63_0)
	arg_63_0.isOpenThemeBox = nil

	setActive(arg_63_0.themebox, false)
end

function var_0_0.openMsgBox(arg_64_0, arg_64_1, arg_64_2)
	arg_64_0.isOpenMsgBox = true

	setActive(arg_64_0.msgbox, true)

	arg_64_0.msgboxContent.text = arg_64_1

	onButton(arg_64_0, arg_64_0.msgboxComfirmBtn, function()
		if arg_64_2 then
			arg_64_2()
		end
	end, SFX_PANEL)
end

function var_0_0.closeMsgBox(arg_66_0)
	arg_66_0.isOpenMsgBox = nil

	setActive(arg_66_0.msgbox, false)
end

function var_0_0.showFilterPanel(arg_67_0)
	if not arg_67_0.indexPanel then
		arg_67_0.indexPanel = BackYardShopFilterPanel.New(arg_67_0.filterTF, BackYardShopFilterPanel.TYPE_DECORATION)

		arg_67_0.indexPanel:attach(arg_67_0)

		function arg_67_0.indexPanel.confirmFunc()
			setText(arg_67_0.filterBtn:Find("Text"), arg_67_0.indexPanel.sortTxt)
			arg_67_0:SetTotalCount(arg_67_0.contextData.index or 0)
		end
	end

	arg_67_0.indexPanel:show()
	arg_67_0:filterAll(arg_67_0.contextData.index or 0)
	arg_67_0.indexPanel:setFilterData(arg_67_0.decorationVOs)
	arg_67_0.indexPanel:updateOrderMode(arg_67_0.orderMode)
end

function var_0_0.onBackPressed(arg_69_0)
	if arg_69_0.isOpenMsgBox then
		arg_69_0:closeMsgBox()
	elseif arg_69_0.isOpenThemeBox then
		arg_69_0:closeThemeBox()
	elseif arg_69_0.indexPanel and go(arg_69_0.indexPanel._go).activeSelf then
		arg_69_0.indexPanel:hide()
	else
		triggerButton(arg_69_0.saveBtn)
	end
end

function var_0_0.willExit(arg_70_0)
	if arg_70_0.leftEventTrigger then
		ClearEventTrigger(arg_70_0.leftEventTrigger)
	end

	if arg_70_0.rightEventTrigger then
		ClearEventTrigger(arg_70_0.rightEventTrigger)
	end

	if arg_70_0.indexPanel then
		arg_70_0.indexPanel:detach(arg_70_0)
	end

	arg_70_0:closeThemeBox()
	arg_70_0:closeMsgBox()
	PoolMgr.GetInstance():ReturnUI("BackYardIndexUI", arg_70_0.filterTF)
end

return var_0_0
