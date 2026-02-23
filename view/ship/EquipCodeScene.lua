local var_0_0 = class("EquipCodeScene", import("..base.BaseUI"))

var_0_0.optionsPath = {
	"adpter/frame/option"
}

function var_0_0.getUIName(arg_1_0)
	return "EquipCodeUI"
end

function var_0_0.setEquipments(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.equips = arg_2_1

	table.sort(arg_2_0.equips, CompareFuncs(EquipmentSortCfg.sortFunc(EquipmentSortCfg.sort[1], false)))

	arg_2_0.spWeapons = arg_2_2

	table.sort(arg_2_0.spWeapons, CompareFuncs(SpWeaponSortCfg.sortFunc(SpWeaponSortCfg.sort[1], false)))
end

function var_0_0.setShip(arg_3_0, arg_3_1)
	arg_3_0.shipVO = getProxy(BayProxy):getShipById(arg_3_1)
	arg_3_0.shipData = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.shipVO:getAllEquipments()) do
		if not iter_3_1 then
			arg_3_0.shipData[iter_3_0] = false
		else
			arg_3_0.shipData[iter_3_0] = underscore.detect(arg_3_0.equips, function(arg_4_0)
				return arg_4_0.configId == iter_3_1.configId and arg_4_0.shipId == arg_3_0.shipVO.id and arg_4_0.shipPos == iter_3_0
			end) or false
		end
	end

	local var_3_0 = arg_3_0.shipVO:GetSpWeapon()

	if not var_3_0 then
		arg_3_0.shipData[6] = false
	else
		arg_3_0.shipData[6] = underscore.detect(arg_3_0.spWeapons, function(arg_5_0)
			return arg_5_0.configId == var_3_0.configId and arg_5_0:GetShipId() == arg_3_0.shipVO.id
		end) or false
	end
end

function var_0_0.getEquipShipVO(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.shipVO:clone()

	var_6_0.equipments = underscore.first(arg_6_1, 5)
	var_6_0.spWeapon = arg_6_1[6] or nil

	return var_6_0
end

local function var_0_1(arg_7_0, arg_7_1, arg_7_2)
	setActive(arg_7_0:Find("IconTpl"), tobool(arg_7_1))

	if arg_7_1 then
		updateEquipment(arg_7_0:Find("IconTpl"), arg_7_1)
	end

	if arg_7_0:Find("equip_flag") then
		setActive(arg_7_0:Find("equip_flag"), arg_7_2)

		if arg_7_2 then
			setImageSprite(arg_7_0:Find("equip_flag/Image"), LoadSprite("qicon/" .. arg_7_2:getPainting()))
		end
	end
end

local function var_0_2(arg_8_0, arg_8_1, arg_8_2)
	setActive(arg_8_0:Find("IconTpl"), tobool(arg_8_1))

	if arg_8_1 then
		updateSpWeapon(arg_8_0:Find("IconTpl"), arg_8_1)
	end

	if arg_8_0:Find("equip_flag") then
		setActive(arg_8_0:Find("equip_flag"), arg_8_2)

		if arg_8_2 then
			setImageSprite(arg_8_0:Find("equip_flag/Image"), LoadSprite("qicon/" .. arg_8_2:getPainting()))
		end
	end
end

local function var_0_3(arg_9_0, arg_9_1, arg_9_2)
	setActive(arg_9_0:Find("Icon"), arg_9_1)
	setActive(arg_9_0:Find("IconShadow"), arg_9_1)

	if arg_9_1 then
		UpdateSpWeaponSlot(arg_9_0, arg_9_1)
	end

	if arg_9_0:Find("equip_flag") then
		setActive(arg_9_0:Find("equip_flag"), arg_9_2)

		if arg_9_2 then
			setImageSprite(arg_9_0:Find("equip_flag/Image"), LoadSprite("qicon/" .. arg_9_2:getPainting()))
		end
	end
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0:Find("error")

	if not arg_10_1 or not arg_10_2 then
		setActive(var_10_0, false)
	elseif arg_10_1.configId == arg_10_2.configId then
		setActive(var_10_0, false)
	else
		local var_10_1 = false
		local var_10_2 = instanceof(arg_10_1, SpWeapon) and pg.spweapon_data_statistics or pg.equip_data_template

		for iter_10_0, iter_10_1 in ipairs({
			"next",
			"prev"
		}) do
			local var_10_3 = arg_10_1.configId

			while var_10_2[var_10_3][iter_10_1] > 0 do
				var_10_3 = var_10_2[var_10_3][iter_10_1]

				if var_10_3 == arg_10_2.configId then
					var_10_1 = true

					break
				end
			end

			if var_10_1 then
				break
			end
		end

		setActive(var_10_0, true)
		setText(var_10_0:Find("Text"), i18n(var_10_1 and "equipcode_level_unmatched" or "equipcode_diff_selected"))
	end
end

function var_0_0.onBackPressed(arg_11_0)
	local var_11_0 = {}

	for iter_11_0 = 1, #arg_11_0.shipData do
		if (arg_11_0.shipData[iter_11_0] and arg_11_0.shipData[iter_11_0].configId or 0) ~= (arg_11_0.equipData[iter_11_0] and arg_11_0.equipData[iter_11_0].configId or 0) then
			table.insert(var_11_0, function(arg_12_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("equipcode_unsaved_tips"),
					onYes = arg_12_0
				})
			end)

			break
		end
	end

	seriesAsync(var_11_0, function()
		arg_11_0:closeView()
	end)
end

local var_0_5

function var_0_0.init(arg_14_0)
	var_0_5 = var_0_5 or {
		customPanels = {
			labelIndex = {
				num = 2,
				mode = CustomIndexLayer.Mode.NUM,
				options = underscore.rest(IndexConst.ECodeLabelIndexs),
				names = underscore.rest(IndexConst.ECodeLabelNames)
			}
		},
		groupList = {
			{
				dropdown = false,
				titleTxt = "indexsort_label",
				titleENTxt = "indexsort_labeleng",
				tags = {
					"labelIndex"
				}
			}
		},
		tip = i18n("equipcode_share_ruletips")
	}
	arg_14_0.btnBack = arg_14_0._tf:Find("adpter/frame/btnBack")

	onButton(arg_14_0, arg_14_0.btnBack, function()
		arg_14_0:onBackPressed()
	end, SFX_CANCEL)

	arg_14_0.rtMainPanel = arg_14_0._tf:Find("main_panel")

	onButton(arg_14_0, arg_14_0.rtMainPanel:Find("btns/btn_export"), function()
		UniPasteBoard.SetClipBoardString(buildEquipCode(arg_14_0.shipVO))
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_export_success"))
	end, SFX_CONFIRM)
	onButton(arg_14_0, arg_14_0.rtMainPanel:Find("share/btn_comments"), function()
		arg_14_0:emit(EquipCodeMediator.OPEN_EQUIP_CODE_SHARE, arg_14_0.shipVO:getGroupId())
	end, SFX_PANEL)

	arg_14_0.tagIndexData = {}

	onButton(arg_14_0, arg_14_0.rtMainPanel:Find("share/btn_share"), function()
		arg_14_0:emit(EquipCodeMediator.OPEN_CUSTOM_INDEX, setmetatable({
			indexDatas = Clone(arg_14_0.tagIndexData),
			callback = function(arg_19_0)
				arg_14_0.tagIndexData.labelIndex = arg_19_0.labelIndex

				local var_19_0 = 0
				local var_19_1 = arg_19_0.labelIndex

				while var_19_1 > 0 do
					var_19_0 = var_19_0 + 1
					var_19_1 = bit.band(var_19_1, var_19_1 - 1)
				end

				if var_19_0 == 2 then
					local var_19_2 = buildEquipCode(arg_14_0.shipVO)
					local var_19_3 = {}
					local var_19_4 = arg_14_0.tagIndexData.labelIndex

					while var_19_4 > 0 do
						local var_19_5 = bit.band(var_19_4, -var_19_4)

						var_19_4 = var_19_4 - var_19_5

						local var_19_6 = 0

						while var_19_5 > 0 do
							var_19_6 = var_19_6 + 1
							var_19_5 = math.floor(var_19_5 / 2)
						end

						table.insert(var_19_3, tostring(var_19_6))
					end

					local var_19_7 = arg_14_0.shipVO:getGroupId()
					local var_19_8 = table.concat({
						var_19_2,
						ConversionBase(32, var_19_7),
						var_19_3[1],
						var_19_3[2]
					}, "&")

					arg_14_0:emit(EquipCodeMediator.SHARE_EQUIP_CODE, var_19_7, var_19_8)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_share_nolabel"))
				end
			end
		}, {
			__index = var_0_5
		}))
	end, SFX_PANEL)

	arg_14_0.rtCodePanel = arg_14_0._tf:Find("code_panel")

	onButton(arg_14_0, arg_14_0.rtCodePanel:Find("btns/btn_import"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("equipcode_confirm_doublecheck"),
			onYes = function()
				arg_14_0:emit(EquipCodeMediator.IMPORT_SHIP_EQUIP, arg_14_0.shipVO.id, arg_14_0.equipData)
			end
		})
	end, SFX_CONFIRM)
	onButton(arg_14_0, arg_14_0.rtCodePanel:Find("btns/btn_withdrawn"), function()
		arg_14_0.code = nil

		arg_14_0:updateDispalyPanel(arg_14_0.rtCodePanel, "code")
	end, SFX_CANCEL)
	onButton(arg_14_0, arg_14_0.rtCodePanel:Find("btns/btn_cancel"), function()
		arg_14_0:updateDispalyPanel(arg_14_0.rtCodePanel, "code")
		arg_14_0:initQuickPanel()
	end, SFX_CANCEL)
	onToggle(arg_14_0, arg_14_0.rtCodePanel:Find("btns/toggle_quick"), function(arg_24_0)
		setInputText(arg_14_0.nameSearchInput, "")
		setActive(arg_14_0.rtMainPanel, false)
		setActive(arg_14_0.rtBottomPanel, false)
		setActive(arg_14_0.rtQuickPanel, false)
		setActive(arg_14_0.rtCodePanel:Find("btns/btn_withdrawn"), not arg_24_0)
		setActive(arg_14_0.rtCodePanel:Find("btns/btn_cancel"), arg_24_0)

		if arg_14_0.quickIndex then
			triggerToggle(arg_14_0.rtCodePanel:Find("equipments_quick"):GetChild(arg_14_0.quickIndex - 1), false)
		end

		eachChild(arg_14_0.rtCodePanel:Find("equipments_quick"), function(arg_25_0)
			SetCompomentEnabled(arg_25_0, typeof(Toggle), false)
		end)

		arg_14_0.ltID = LeanTween.moveY(arg_14_0.rtCodePanel, arg_24_0 and 420 or 80, math.max(math.abs((arg_24_0 and 420 or 80) - arg_14_0.rtCodePanel.anchoredPosition.y), 0.1) / 2000):setOnComplete(System.Action(function()
			arg_14_0.ltID = nil

			setActive(arg_14_0.rtMainPanel, not arg_24_0)
			setActive(arg_14_0.rtBottomPanel, not arg_24_0)
			setActive(arg_14_0.rtQuickPanel, arg_24_0)

			if arg_24_0 then
				arg_14_0:initQuickPanel()
			end
		end)).uniqueId
	end)
	eachChild(arg_14_0.rtCodePanel:Find("equipments_quick"), function(arg_27_0)
		onToggle(arg_14_0, arg_27_0, function(arg_28_0)
			if arg_28_0 then
				arg_14_0.quickIndex = arg_27_0:GetSiblingIndex() + 1

				arg_14_0:updateQuickPanel()
			elseif arg_14_0.quickIndex == arg_27_0:GetSiblingIndex() + 1 then
				arg_14_0.quickIndex = nil

				arg_14_0:updateQuickPanel()
			end
		end, SFX_PANEL)
		SetCompomentEnabled(arg_27_0, typeof(Toggle), false)
	end)

	arg_14_0.rtQuickPanel = arg_14_0._tf:Find("quick_panel")

	onToggle(arg_14_0, arg_14_0.rtQuickPanel:Find("title/equiping"), function(arg_29_0)
		arg_14_0.equipingFlag = arg_29_0

		if isActive(arg_14_0.rtQuickPanel) then
			arg_14_0:updateQuickPanel(true)
		end
	end, SFX_PANEL)

	arg_14_0.nameSearchInput = arg_14_0.rtQuickPanel:Find("title/serachPanel/search")
	arg_14_0.nameSearchText = arg_14_0.nameSearchInput:Find("holder")

	setText(arg_14_0.nameSearchText, i18n("search_equipment"))
	setInputText(arg_14_0.nameSearchInput, "")
	onInputChanged(arg_14_0, arg_14_0.nameSearchInput, function()
		arg_14_0:updateQuickPanel(true)
	end)

	arg_14_0.indexData = arg_14_0.indexData or {}
	arg_14_0.spweaponIndexDatas = arg_14_0.spweaponIndexDatas or {}

	local var_14_0 = arg_14_0.rtQuickPanel:Find("title/filter")

	onButton(arg_14_0, var_14_0, function()
		assert(arg_14_0.quickIndex)

		local var_31_0 = switch(arg_14_0.quickIndex, {
			[6] = function()
				return setmetatable({
					indexDatas = Clone(arg_14_0.spweaponIndexDatas),
					callback = function(arg_33_0)
						arg_14_0.spweaponIndexDatas.typeIndex = arg_33_0.typeIndex
						arg_14_0.spweaponIndexDatas.rarityIndex = arg_33_0.rarityIndex

						local var_33_0 = underscore(arg_14_0.spweaponIndexDatas):chain():keys():all(function(arg_34_0)
							return arg_14_0.spweaponIndexDatas[arg_34_0] == StoreHouseConst.SPWEAPON_INDEX_COMMON.customPanels[arg_34_0].options[1]
						end):value()

						setActive(var_14_0:Find("on"), not var_33_0)
						setActive(var_14_0:Find("off"), var_33_0)
						arg_14_0:updateQuickPanel()
					end
				}, {
					__index = StoreHouseConst.SPWEAPON_INDEX_COMMON
				})
			end
		}, function()
			return setmetatable({
				indexDatas = Clone(arg_14_0.indexData),
				callback = function(arg_36_0)
					arg_14_0.indexData.typeIndex = arg_36_0.typeIndex
					arg_14_0.indexData.equipPropertyIndex = arg_36_0.equipPropertyIndex
					arg_14_0.indexData.equipPropertyIndex2 = arg_36_0.equipPropertyIndex2
					arg_14_0.indexData.equipAmmoIndex1 = arg_36_0.equipAmmoIndex1
					arg_14_0.indexData.equipAmmoIndex2 = arg_36_0.equipAmmoIndex2
					arg_14_0.indexData.equipCampIndex = arg_36_0.equipCampIndex
					arg_14_0.indexData.rarityIndex = arg_36_0.rarityIndex
					arg_14_0.indexData.extraIndex = arg_36_0.extraIndex

					local var_36_0 = underscore(arg_14_0.indexData):chain():keys():all(function(arg_37_0)
						return arg_14_0.indexData[arg_37_0] == StoreHouseConst.EQUIPMENT_INDEX_COMMON.customPanels[arg_37_0].options[1]
					end):value()

					setActive(var_14_0:Find("on"), not var_36_0)
					setActive(var_14_0:Find("off"), var_36_0)
					arg_14_0:updateQuickPanel()
				end
			}, {
				__index = StoreHouseConst.EQUIPMENT_INDEX_COMMON
			})
		end)

		arg_14_0:emit(EquipCodeMediator.OPEN_CUSTOM_INDEX, var_31_0)
	end, SFX_PANEL)

	arg_14_0.comList = arg_14_0.rtQuickPanel:Find("frame/container"):GetComponent("LScrollRect")

	function arg_14_0.comList.onInitItem(arg_38_0)
		ClearTweenItemAlphaAndWhite(arg_38_0)
	end

	function arg_14_0.comList.onReturnItem(arg_39_0, arg_39_1)
		ClearTweenItemAlphaAndWhite(arg_39_1)
	end

	function arg_14_0.comList.onUpdateItem(arg_40_0, arg_40_1)
		if not arg_14_0.quickIndex then
			return
		end

		TweenItemAlphaAndWhite(arg_40_1)

		local var_40_0 = tf(arg_40_1)
		local var_40_1 = arg_14_0.filterEquipments[arg_40_0 + 1]

		setActive(var_40_0:Find("unEquip"), not var_40_1)
		setActive(var_40_0:Find("bg"), var_40_1)
		setActive(var_40_0:Find("IconTpl"), var_40_1)

		if arg_14_0.quickIndex == 6 then
			var_0_2(var_40_0, var_40_1, var_40_1 and var_40_1.shipId and getProxy(BayProxy):getShipById(var_40_1.shipId) or nil)
			onButton(arg_14_0, var_40_0, function()
				local var_41_0 = {}

				if var_40_1 and PlayerPrefs.GetInt("QUICK_CHANGE_EQUIP", 1) == 1 then
					table.insert(var_41_0, function(arg_42_0)
						arg_14_0:emit(var_0_0.ON_SPWEAPON, {
							quickFlag = true,
							type = EquipmentInfoMediator.TYPE_REPLACE,
							oldSpWeaponUid = var_40_1:GetUID(),
							oldShipId = var_40_1:GetShipId(),
							shipVO = arg_14_0:getEquipShipVO(arg_14_0.equipData),
							quickCallback = arg_42_0
						})
					end)
				end

				seriesAsync(var_41_0, function()
					arg_14_0.equipData[arg_14_0.quickIndex] = var_40_1

					local var_43_0 = arg_14_0.rtCodePanel:Find("equipments_quick/SpSlot")

					var_0_3(var_43_0, var_40_1, var_40_1 and var_40_1.shipId and getProxy(BayProxy):getShipById(var_40_1.shipId) or nil)
					var_0_4(var_43_0, arg_14_0.codeData[arg_14_0.quickIndex], var_40_1)
					arg_14_0:updateQuickPanel()
				end)
			end, SFX_PANEL)
		else
			var_0_1(var_40_0, var_40_1 and setmetatable({
				count = var_40_1.count - underscore.reduce(arg_14_0.equipData, 0, function(arg_44_0, arg_44_1)
					return arg_44_0 + (arg_44_1 == var_40_1 and 1 or 0)
				end)
			}, {
				__index = var_40_1
			}) or var_40_1, var_40_1 and var_40_1.shipId and getProxy(BayProxy):getShipById(var_40_1.shipId) or nil)
			setActive(var_40_0:Find("IconTpl/mask"), var_40_1 and var_40_1.mask)
			onButton(arg_14_0, var_40_0, function()
				if var_40_1 and var_40_1.mask then
					return
				end

				local var_45_0 = {}

				if var_40_1 and PlayerPrefs.GetInt("QUICK_CHANGE_EQUIP", 1) == 1 then
					table.insert(var_45_0, function(arg_46_0)
						arg_14_0:emit(var_0_0.ON_EQUIPMENT, {
							quickFlag = true,
							type = EquipmentInfoMediator.TYPE_REPLACE,
							equipmentId = var_40_1.id,
							oldShipId = var_40_1.shipId,
							oldPos = var_40_1.shipPos,
							shipVO = arg_14_0:getEquipShipVO(arg_14_0.equipData),
							pos = arg_14_0.quickIndex,
							quickCallback = arg_46_0
						})
					end)
				end

				seriesAsync(var_45_0, function()
					arg_14_0.equipData[arg_14_0.quickIndex] = var_40_1

					local var_47_0 = arg_14_0.rtCodePanel:Find("equipments_quick"):GetChild(arg_14_0.quickIndex - 1)

					var_0_1(var_47_0, var_40_1, var_40_1 and var_40_1.shipId and getProxy(BayProxy):getShipById(var_40_1.shipId) or nil)
					var_0_4(var_47_0, arg_14_0.codeData[arg_14_0.quickIndex], var_40_1)
					arg_14_0:updateQuickPanel()
				end)
			end, SFX_PANEL)
		end
	end

	setText(var_14_0:Find("on/text2"), i18n("quick_equip_tip2"))
	setText(var_14_0:Find("off/text2"), i18n("quick_equip_tip2"))
	setText(arg_14_0.rtQuickPanel:Find("title/equiping/on/text2"), i18n("quick_equip_tip1"))
	setText(arg_14_0.rtQuickPanel:Find("title/equiping/off/text2"), i18n("quick_equip_tip1"))
	setText(arg_14_0.rtQuickPanel:Find("title/text"), i18n("quick_equip_tip3"))
	setText(arg_14_0.rtQuickPanel:Find("frame/emptyTitle/text"), i18n("quick_equip_tip4"))
	setText(arg_14_0.rtQuickPanel:Find("frame/selectTitle/text"), i18n("quick_equip_tip5"))

	arg_14_0.rtBottomPanel = arg_14_0._tf:Find("bottom_panel")
	arg_14_0.rtInputField = arg_14_0.rtBottomPanel:Find("InputField")

	setText(arg_14_0.rtInputField:Find("Placeholder"), i18n("equipcode_input"))
	setInputText(arg_14_0.rtInputField, arg_14_0.contextData.code or nil)

	arg_14_0.btnInput = arg_14_0.rtBottomPanel:Find("btn_confirm")

	onButton(arg_14_0, arg_14_0.btnInput, function()
		arg_14_0.code = getInputText(arg_14_0.rtInputField)

		arg_14_0:updateDispalyPanel(arg_14_0.rtCodePanel, "code")
	end, SFX_CONFIRM)
end

function var_0_0.didEnter(arg_49_0)
	arg_49_0.code = buildEquipCode(arg_49_0.shipVO)

	arg_49_0:updateDispalyPanel(arg_49_0.rtMainPanel, "main")
	arg_49_0:updateDispalyPanel(arg_49_0.rtCodePanel, "code")
end

function var_0_0.updateDispalyPanel(arg_50_0, arg_50_1, arg_50_2)
	updateDrop(arg_50_1:Find("IconTpl"), {
		type = DROP_TYPE_SHIP,
		id = arg_50_0.shipVO.configId
	})

	local var_50_0 = arg_50_0.shipVO:IsSpweaponUnlock()

	setActive(arg_50_1:Find("equipments/SpSlot/Lock"), not var_50_0)

	if arg_50_2 == "main" then
		for iter_50_0, iter_50_1 in ipairs(arg_50_0.shipVO:getAllEquipments()) do
			var_0_1(arg_50_1:Find("equipments"):GetChild(iter_50_0 - 1), iter_50_1)
		end

		var_0_3(arg_50_1:Find("equipments/SpSlot"), arg_50_0.shipVO:GetSpWeapon(), arg_50_0.shipVO)
	elseif arg_50_2 == "code" then
		local var_50_1 = pg.equip_data_template
		local var_50_2 = pg.spweapon_data_statistics
		local var_50_3 = false

		arg_50_0.codeData = {}

		for iter_50_2, iter_50_3 in ipairs(parseEquipCode(arg_50_0.code)) do
			if iter_50_2 == 6 then
				arg_50_0.codeData[iter_50_2] = var_50_0 and var_50_2[iter_50_3] and SpWeapon.New({
					id = iter_50_3
				}) or false

				if arg_50_0.codeData[iter_50_2] and not arg_50_0:getEquipShipVO(arg_50_0.codeData):CanEquipSpWeapon(arg_50_0.codeData[iter_50_2]) then
					arg_50_0.codeData[iter_50_2] = false
					var_50_3 = true
				end

				var_0_3(arg_50_1:Find("equipments/SpSlot"), arg_50_0.codeData[iter_50_2])
			else
				arg_50_0.codeData[iter_50_2] = var_50_1[iter_50_3] and Equipment.New({
					id = iter_50_3
				}) or false

				if arg_50_0.codeData[iter_50_2] and not arg_50_0:getEquipShipVO(arg_50_0.codeData):canEquipAtPos(arg_50_0.codeData[iter_50_2], iter_50_2) then
					arg_50_0.codeData[iter_50_2] = false
					var_50_3 = true
				end

				var_0_1(arg_50_1:Find("equipments"):GetChild(iter_50_2 - 1), arg_50_0.codeData[iter_50_2])
			end
		end

		if var_50_3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_slot_unmatch"))
		end

		arg_50_0.equipData = {}

		for iter_50_4, iter_50_5 in ipairs(arg_50_0.codeData) do
			if iter_50_5 and arg_50_0.shipData[iter_50_4] and iter_50_5.configId == arg_50_0.shipData[iter_50_4].configId then
				arg_50_0.equipData[iter_50_4] = arg_50_0.shipData[iter_50_4]
			end
		end

		for iter_50_6, iter_50_7 in ipairs(arg_50_0.codeData) do
			if iter_50_7 and not arg_50_0.equipData[iter_50_6] then
				local var_50_4 = iter_50_6 == 6 and var_50_2 or var_50_1
				local var_50_5 = {
					iter_50_7.configId
				}

				for iter_50_8, iter_50_9 in ipairs({
					"next",
					"prev"
				}) do
					local var_50_6 = iter_50_7.configId

					while var_50_4[var_50_6][iter_50_9] > 0 do
						var_50_6 = var_50_4[var_50_6][iter_50_9]

						table.insert(var_50_5, var_50_6)
					end
				end

				if iter_50_6 == 6 then
					for iter_50_10, iter_50_11 in ipairs(underscore.filter(arg_50_0.spWeapons, function(arg_51_0)
						return not arg_51_0.shipId
					end)) do
						local var_50_7 = table.indexof(var_50_5, iter_50_11.configId)

						if var_50_7 and (not arg_50_0.equipData[iter_50_6] or var_50_7 < table.indexof(var_50_5, arg_50_0.equipData[iter_50_6].configId)) then
							arg_50_0.equipData[iter_50_6] = iter_50_11
						end
					end
				else
					for iter_50_12, iter_50_13 in ipairs(underscore.filter(arg_50_0.equips, function(arg_52_0)
						return not arg_52_0.shipId or arg_52_0.shipId == arg_50_0.shipVO.id
					end)) do
						local var_50_8 = table.indexof(var_50_5, iter_50_13.configId)

						if var_50_8 and (not arg_50_0.equipData[iter_50_6] or var_50_8 < table.indexof(var_50_5, arg_50_0.equipData[iter_50_6].configId)) and iter_50_13.count > underscore.reduce(arg_50_0.equipData, 0, function(arg_53_0, arg_53_1)
							return arg_53_0 + (arg_53_1 == iter_50_13 and 1 or 0)
						end) then
							arg_50_0.equipData[iter_50_6] = iter_50_13
						end
					end
				end
			end

			arg_50_0.equipData[iter_50_6] = defaultValue(arg_50_0.equipData[iter_50_6], false)
		end

		setActive(arg_50_1:Find("equipments_quick/SpSlot/Lock"), not var_50_0)

		for iter_50_14, iter_50_15 in ipairs(arg_50_0.equipData) do
			local var_50_9 = arg_50_1:Find("equipments_quick"):GetChild(iter_50_14 - 1)

			if iter_50_14 == 6 then
				var_0_3(var_50_9, iter_50_15, iter_50_15 and iter_50_15.shipId and getProxy(BayProxy):getShipById(iter_50_15.shipId) or nil)
			else
				var_0_1(var_50_9, iter_50_15, iter_50_15 and iter_50_15.shipId and getProxy(BayProxy):getShipById(iter_50_15.shipId) or nil)
			end

			var_0_4(var_50_9, arg_50_0.codeData[iter_50_14], iter_50_15)
		end
	else
		assert(false)
	end
end

function var_0_0.initQuickPanel(arg_54_0)
	eachChild(arg_54_0.rtCodePanel:Find("equipments_quick"), function(arg_55_0)
		if arg_55_0:GetSiblingIndex() + 1 == 6 then
			SetCompomentEnabled(arg_55_0, typeof(Toggle), arg_54_0.shipVO:IsSpweaponUnlock())
		else
			SetCompomentEnabled(arg_55_0, typeof(Toggle), true)
		end
	end)

	if arg_54_0.quickIndex then
		triggerToggle(arg_54_0.rtCodePanel:Find("equipments_quick"):GetChild(arg_54_0.quickIndex - 1), false)
	end

	triggerToggle(arg_54_0.rtQuickPanel:Find("title/equiping"), true)
	arg_54_0:updateQuickPanel()
end

function var_0_0.updateQuickPanel(arg_56_0)
	if not isActive(arg_56_0.rtQuickPanel) then
		return
	end

	setActive(arg_56_0.rtQuickPanel:Find("title/filter"), arg_56_0.quickIndex)
	setActive(arg_56_0.rtQuickPanel:Find("frame/selectTitle"), not arg_56_0.quickIndex)

	if arg_56_0.quickIndex then
		if arg_56_0.quickIndex == 6 then
			arg_56_0.filterEquipments = arg_56_0:getFilterSpWeapon()
		else
			arg_56_0.filterEquipments = arg_56_0:getFilterEquipments()
		end

		if arg_56_0.equipData[arg_56_0.quickIndex] then
			table.insert(arg_56_0.filterEquipments, 1, false)
		end

		arg_56_0.comList:SetTotalCount(#arg_56_0.filterEquipments)
		setActive(arg_56_0.rtQuickPanel:Find("frame/emptyTitle"), #arg_56_0.filterEquipments == 0)
	else
		arg_56_0.comList:SetTotalCount(0)
		setActive(arg_56_0.rtQuickPanel:Find("frame/emptyTitle"), false)
	end
end

function var_0_0.getFilterEquipments(arg_57_0)
	local var_57_0 = arg_57_0:getEquipShipVO(arg_57_0.equipData)
	local var_57_1 = getInputText(arg_57_0.nameSearchInput)
	local var_57_2 = {
		arg_57_0.indexData.equipPropertyIndex,
		arg_57_0.indexData.equipPropertyIndex2
	}

	return underscore(arg_57_0.equips):chain():filter(function(arg_58_0)
		return (not arg_58_0.shipId or arg_57_0.equipingFlag) and arg_58_0.count > underscore.reduce(arg_57_0.equipData, 0, function(arg_59_0, arg_59_1)
			return arg_59_0 + (arg_58_0 == arg_59_1 and 1 or 0)
		end) and not var_57_0:isForbiddenAtPos(arg_58_0, arg_57_0.quickIndex) and IndexConst.filterEquipByType(arg_58_0, arg_57_0.indexData.typeIndex) and IndexConst.filterEquipByProperty(arg_58_0, var_57_2) and IndexConst.filterEquipAmmo1(arg_58_0, arg_57_0.indexData.equipAmmoIndex1) and IndexConst.filterEquipAmmo2(arg_58_0, arg_57_0.indexData.equipAmmoIndex2) and IndexConst.filterEquipByCamp(arg_58_0, arg_57_0.indexData.equipCampIndex) and IndexConst.filterEquipByRarity(arg_58_0, arg_57_0.indexData.rarityIndex) and IndexConst.filterEquipByExtra(arg_58_0, arg_57_0.indexData.extraIndex) and (var_57_1 == "" or arg_58_0:IsMatchKey(var_57_1))
	end):each(function(arg_60_0)
		arg_60_0.mask = not var_57_0:canEquipAtPos(arg_60_0, arg_57_0.quickIndex)
	end):value()
end

function var_0_0.getFilterSpWeapon(arg_61_0)
	local var_61_0 = arg_61_0:getEquipShipVO(arg_61_0.equipData)
	local var_61_1 = getInputText(arg_61_0.nameSearchInput)

	return underscore.filter(arg_61_0.spWeapons, function(arg_62_0)
		return (not arg_62_0.shipId or arg_61_0.equipingFlag) and arg_62_0 ~= arg_61_0.equipData[6] and not var_61_0:IsSpWeaponForbidden(arg_62_0) and IndexConst.filterSpWeaponByType(arg_62_0, arg_61_0.spweaponIndexDatas.typeIndex) and IndexConst.filterSpWeaponByRarity(arg_62_0, arg_61_0.spweaponIndexDatas.rarityIndex) and (var_61_1 == "" or arg_62_0:IsMatchKey(var_61_1))
	end)
end

function var_0_0.willExit(arg_63_0)
	if arg_63_0.ltID then
		LeanTween.cancel(arg_63_0.ltID)

		arg_63_0.ltID = nil
	end
end

return var_0_0
