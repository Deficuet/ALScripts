local var_0_0 = class("BattleResultMetaExpView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "BattleResultMetaExpUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initUITip()
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:addListener()
	arg_2_0:updateIconList()
end

function var_0_0.OnDestroy(arg_3_0)
	arg_3_0.closeCB()
	arg_3_0:cleanManagedTween(true)
end

function var_0_0.setData(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.lastMetaExpInfoList = arg_4_1
	arg_4_0.closeCB = arg_4_2
end

function var_0_0.initUITip(arg_5_0)
	local var_5_0 = arg_5_0._tf:Find("Notch/Panel/Title/Text")

	setText(var_5_0, i18n("battle_end_subtitle2"))
end

function var_0_0.initData(arg_6_0)
	arg_6_0.metaProxy = getProxy(MetaCharacterProxy)
end

function var_0_0.initUI(arg_7_0)
	arg_7_0.bg = arg_7_0._tf:Find("BG")
	arg_7_0.iconTpl = arg_7_0._tf:Find("IconTpl")
	arg_7_0.panelTF = arg_7_0._tf:Find("Notch/Panel")
	arg_7_0.iconContainer = arg_7_0.panelTF:Find("ScrollView/Content")
	arg_7_0.gridLayoutGroupSC = GetComponent(arg_7_0.iconContainer, typeof(GridLayoutGroup))
	arg_7_0.closeBtn = arg_7_0.panelTF:Find("Button")
	arg_7_0.iconUIItemList = UIItemList.New(arg_7_0.iconContainer, arg_7_0.iconTpl)
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:closePanel()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.closeBtn, function()
		arg_8_0:closePanel()
	end, SFX_PANEL)
end

function var_0_0.updateIconList(arg_11_0)
	local var_11_0 = arg_11_0.lastMetaExpInfoList or arg_11_0.metaProxy:getLastMetaSkillExpInfoList()
	local var_11_1 = arg_11_0:sortDataList(var_11_0)
	local var_11_2 = #var_11_1

	arg_11_0.gridLayoutGroupSC.constraintCount = var_11_2 > 4 and 2 or 1

	arg_11_0.iconUIItemList:make(function(arg_12_0, arg_12_1, arg_12_2)
		arg_12_1 = arg_12_1 + 1

		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = arg_12_2:Find("Light")
			local var_12_1 = arg_12_2:Find("Icon")
			local var_12_2 = arg_12_2:Find("AddExpText")
			local var_12_3 = arg_12_2:Find("LevelMaxText")
			local var_12_4 = arg_12_2:Find("ExpMaxText")
			local var_12_5 = arg_12_2:Find("Slider")
			local var_12_6 = var_11_1[arg_12_1]
			local var_12_7 = var_12_6.shipID
			local var_12_8 = var_12_6.addDayExp
			local var_12_9 = var_12_6.isUpLevel
			local var_12_10 = var_12_6.isMaxLevel
			local var_12_11 = var_12_6.isExpMax
			local var_12_12 = var_12_6.progress
			local var_12_13 = getProxy(BayProxy):getShipById(var_12_7)
			local var_12_14 = var_12_13:getPainting()
			local var_12_15 = "SquareIcon/" .. var_12_14

			setImageSprite(var_12_1, LoadSprite(var_12_15, var_12_14))
			setText(var_12_2, "EXP + " .. var_12_8)
			setActive(var_12_0, var_12_9 and var_12_10)

			if var_12_9 and var_12_10 then
				setActive(var_12_2, false)
				setActive(var_12_3, true)
				setActive(var_12_4, false)
			elseif var_12_11 then
				setActive(var_12_2, false)
				setActive(var_12_3, false)
				setActive(var_12_4, true)
			else
				setActive(var_12_2, true)
				setActive(var_12_3, false)
				setActive(var_12_4, false)
			end

			setSlider(var_12_5, 0, 1, var_12_12)
			onButton(arg_11_0, arg_12_2, function()
				LoadContextCommand.LoadLayerOnTopContext(Context.New({
					viewComponent = MetaSkillDetailBoxLayer,
					mediator = MetaSkillDetailBoxMediator,
					data = {
						metaShipID = var_12_13.id,
						expInfoList = arg_11_0.lastMetaExpInfoList
					},
					onRemoved = function()
						arg_11_0:updateIconList()
					end
				}))
			end, SFX_PANEL)
		end
	end)
	arg_11_0.iconUIItemList:align(#var_11_1)
end

local var_0_1 = 0.3

function var_0_0.openPanel(arg_15_0)
	arg_15_0:cleanManagedTween(true)
	Canvas.ForceUpdateCanvases()

	local var_15_0 = 400
	local var_15_1 = arg_15_0.panelTF.sizeDelta.x
	local var_15_2 = System.Action_float(function(arg_16_0)
		setAnchoredPosition(arg_15_0.panelTF, {
			x = arg_16_0
		})
	end)
	local var_15_3 = System.Action(function()
		setAnchoredPosition(arg_15_0.panelTF, {
			x = 0
		})
	end)

	arg_15_0:managedTween(LeanTween.value, nil, go(arg_15_0.panelTF), var_15_2, 400, 0, var_0_1):setOnComplete(var_15_3)
end

function var_0_0.closePanel(arg_18_0)
	arg_18_0:cleanManagedTween(true)

	local var_18_0 = 400
	local var_18_1 = arg_18_0.panelTF.sizeDelta.x
	local var_18_2 = System.Action_float(function(arg_19_0)
		setAnchoredPosition(arg_18_0.panelTF, {
			x = arg_19_0
		})
	end)
	local var_18_3 = System.Action(function()
		setAnchoredPosition(arg_18_0.panelTF, {
			x = 0
		})
		arg_18_0:Destroy()
	end)

	arg_18_0:managedTween(LeanTween.value, nil, go(arg_18_0.panelTF), var_18_2, 0, 400, var_0_1):setOnComplete(var_18_3)
end

function var_0_0.sortDataList(arg_21_0, arg_21_1)
	table.sort(arg_21_1, function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0.isUpLevel and arg_22_0.isMaxLevel and 9999 or 0
		local var_22_1 = arg_22_1.isUpLevel and arg_22_1.isMaxLevel and 9999 or 0
		local var_22_2 = arg_22_0.progress
		local var_22_3 = arg_22_1.progress
		local var_22_4 = var_22_0 + var_22_2
		local var_22_5 = var_22_1 + var_22_3

		if var_22_5 < var_22_4 then
			return true
		elseif var_22_4 == var_22_5 then
			return arg_22_0.shipID < arg_22_1.shipID
		elseif var_22_4 < var_22_5 then
			return false
		end
	end)

	return arg_21_1
end

return var_0_0
