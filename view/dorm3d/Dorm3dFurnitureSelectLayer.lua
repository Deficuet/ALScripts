local var_0_0 = class("Dorm3dFurnitureSelectLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dFurnitureSelectUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.zoneList = arg_2_0._tf:Find("ZoneList")

	setActive(arg_2_0.zoneList, false)

	local var_2_0 = arg_2_0._tf:Find("Right/Panel/Container/Furnitures")

	arg_2_0.furnitureScroll = var_2_0:Find("Scroll/Content"):GetComponent("LScrollRect")
	arg_2_0.furnitureEmpty = var_2_0:Find("Empty")
	arg_2_0.lableTrans = arg_2_0._tf:Find("Main/Label")

	setActive(arg_2_0.lableTrans, false)

	local var_2_1 = arg_2_0.furnitureScroll.prefabItem.transform

	setText(var_2_1:Find("Unfit/Icon/Text"), i18n("dorm3d_furniture_unfit"))
	setText(var_2_1:Find("Lack/Icon/Text"), i18n("ryza_tip_control_buff_not_obtain"))
end

function var_0_0.SetSceneRoot(arg_3_0, arg_3_1)
	arg_3_0.scene = arg_3_1
end

function var_0_0.SetRoom(arg_4_0, arg_4_1)
	arg_4_0.room = arg_4_1:clone()
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0.allZones = arg_5_0.room:GetFurnitureZones()
	arg_5_0.globalZones = _.select(arg_5_0.allZones, function(arg_6_0)
		return arg_6_0:IsGlobal()
	end)
	arg_5_0.normalZones = _.select(arg_5_0.allZones, function(arg_7_0)
		return not arg_7_0:IsGlobal()
	end)

	local var_5_0 = arg_5_0.normalZones

	arg_5_0.zoneIndex = 1

	local var_5_1 = arg_5_0.scene:GetAttachedFurnitureName()

	if var_5_1 then
		table.Ipairs(var_5_0, function(arg_8_0, arg_8_1)
			if arg_8_1:GetWatchCameraName() == var_5_1 then
				arg_5_0.zoneIndex = arg_8_0
			end
		end)
	end

	onButton(arg_5_0, arg_5_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch"), function()
		setActive(arg_5_0.zoneList, true)
	end, SFX_PANEL)
	setActive(arg_5_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch/New"), false)
	onButton(arg_5_0, arg_5_0.zoneList:Find("Mask"), function()
		setActive(arg_5_0.zoneList, false)
	end)
	onButton(arg_5_0, arg_5_0._tf:Find("Top/Back"), function()
		arg_5_0:onBackPressed()
	end)
	onButton(arg_5_0, arg_5_0._tf:Find("Right/Save"), function()
		arg_5_0:ShowReplaceWindow()
	end, SFX_PANEL)

	local function var_5_2(arg_13_0)
		arg_5_0._tf:Find("Right/Popup"):GetComponent(typeof(Image)).raycastTarget = not arg_13_0
		arg_5_0._tf:Find("Right/Collapse"):GetComponent(typeof(Image)).raycastTarget = arg_13_0

		if arg_13_0 then
			quickPlayAnimation(arg_5_0._tf, "anim_dorm3d_furniture_in")
		else
			quickPlayAnimation(arg_5_0._tf, "anim_dorm3d_furniture_hide")
		end
	end

	arg_5_0._tf:Find("Right/Popup"):GetComponent(typeof(Image)).raycastTarget = false
	arg_5_0._tf:Find("Right/Collapse"):GetComponent(typeof(Image)).raycastTarget = true

	onButton(arg_5_0, arg_5_0._tf:Find("Right/Popup"), function()
		var_5_2(true)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Right/Collapse"), function()
		var_5_2(false)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Right/Auto"), function()
		arg_5_0:AutoReplaceFurniture()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.lableTrans, function()
		arg_5_0:CleanSlot()
	end, "ui-dorm_furniture_removal")

	arg_5_0.furnitureItems = {}

	function arg_5_0.furnitureScroll.onUpdateItem(arg_18_0, arg_18_1)
		arg_18_0 = arg_18_0 + 1
		arg_5_0.furnitureItems[arg_18_0] = arg_18_1

		arg_5_0:UpdateViewFurnitureItem(arg_18_0)
	end

	function arg_5_0.furnitureScroll.onReturnItem(arg_19_0, arg_19_1)
		if arg_5_0.exited then
			return
		end

		arg_19_0 = arg_19_0 + 1
		arg_5_0.furnitureItems[arg_19_0] = nil
	end

	arg_5_0.replaceFurnitures = {}

	arg_5_0:UpdateDataZone()
	arg_5_0:InitViewZoneList()
	arg_5_0:InitViewTypeList()
	arg_5_0.scene:EnterFurnitureWatchMode()
	arg_5_0.scene:SwitchFurnitureZone(arg_5_0.normalZones[arg_5_0.zoneIndex])
	onNextTick(function()
		arg_5_0.furnitureScroll.enabled = true

		arg_5_0:UpdateView()
	end)

	arg_5_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_5_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_5_0.updateHandler)
end

function var_0_0.Update(arg_24_0)
	if arg_24_0.labelSettings then
		local var_24_0 = arg_24_0.scene:GetSlotByID(arg_24_0.labelSettings.slotId)
		local var_24_1 = arg_24_0.scene:GetScreenPosition(var_24_0.position)
		local var_24_2 = arg_24_0.scene:GetLocalPosition(var_24_1, arg_24_0.lableTrans.parent)

		setLocalPosition(arg_24_0.lableTrans, var_24_2)
	end
end

function var_0_0.UpdateDataZone(arg_25_0)
	local var_25_0 = arg_25_0.normalZones[arg_25_0.zoneIndex]
	local var_25_1 = {
		var_25_0,
		unpack(arg_25_0.globalZones)
	}
	local var_25_2 = _.reduce(var_25_1, {}, function(arg_26_0, arg_26_1)
		table.insertto(arg_26_0, arg_26_1:GetSlots())

		return arg_26_0
	end)
	local var_25_3 = {}

	_.each(var_25_2, function(arg_27_0)
		var_25_3[arg_27_0:GetType()] = true
	end)

	arg_25_0.activeFurnitureTypes = _.keys(var_25_3)

	var_25_0:SortTypes(arg_25_0.activeFurnitureTypes)

	arg_25_0.furnitureType = arg_25_0.activeFurnitureTypes[1]

	arg_25_0:ResetSelectSetting()
	arg_25_0:UpdateDataDisplayFurnitures()
	arg_25_0:FilterDataFurnitures()
end

function var_0_0.ResetSelectSetting(arg_28_0)
	arg_28_0.selectFurnitureId = nil
	arg_28_0.selectSlotId = nil
end

function var_0_0.UpdateDataDisplayFurnitures(arg_29_0)
	local var_29_0 = arg_29_0.room
	local var_29_1 = arg_29_0.furnitureType
	local var_29_2 = arg_29_0.normalZones[arg_29_0.zoneIndex]
	local var_29_3 = {
		var_29_2,
		unpack(arg_29_0.globalZones)
	}
	local var_29_4 = _.reduce(var_29_3, {}, function(arg_30_0, arg_30_1)
		table.insertto(arg_30_0, arg_30_1:GetSlots())

		return arg_30_0
	end)
	local var_29_5 = var_29_0:GetFurnitureIDList()
	local var_29_6 = var_29_0:GetFurnitures()
	local var_29_7 = {}
	local var_29_8 = {}

	_.each(var_29_5, function(arg_31_0)
		local var_31_0 = Dorm3dFurniture.New({
			configId = arg_31_0
		})

		if var_31_0:GetType() ~= var_29_1 then
			return
		end

		if not _.any(var_29_4, function(arg_32_0)
			return arg_32_0:CanUseFurniture(var_31_0)
		end) then
			warning("家具没有可用槽位，检查类型是否一致 FURNITUREID = " .. arg_31_0)

			return
		end

		table.insert(var_29_8, {
			useable = 0,
			count = 0,
			id = arg_31_0,
			template = var_31_0
		})

		var_29_7[arg_31_0] = #var_29_8
	end)
	_.each(var_29_6, function(arg_33_0)
		if arg_33_0:GetType() ~= var_29_1 then
			return
		end

		if not _.any(var_29_4, function(arg_34_0)
			return arg_34_0:CanUseFurniture(arg_33_0)
		end) then
			return
		end

		local var_33_0 = arg_33_0:GetConfigID()
		local var_33_1 = var_29_8[var_29_7[var_33_0]]

		var_33_1.count = var_33_1.count + 1

		if arg_33_0:GetSlotID() == 0 then
			var_33_1.useable = var_33_1.useable + 1
		end

		var_33_1.viewedFlag = Dorm3dFurniture.GetViewedFlag(var_33_0) ~= 0
	end)

	var_29_8 = _.filter(var_29_8, function(arg_35_0)
		return arg_35_0.count > 0 or arg_35_0.template:InShopTime()
	end)
	arg_29_0.displayFurnitures = var_29_8
end

function var_0_0.FilterDataFurnitures(arg_36_0)
	local var_36_0 = {
		function(arg_37_0)
			return arg_37_0.useable > 0 and 0 or 1
		end,
		function(arg_38_0)
			return -arg_38_0.template:GetRarity()
		end,
		function(arg_39_0)
			return -arg_39_0.template:GetTargetSlotID()
		end,
		function(arg_40_0)
			return -arg_40_0.id
		end
	}

	table.sort(arg_36_0.displayFurnitures, CompareFuncs(var_36_0))
end

function var_0_0.InitViewZoneList(arg_41_0)
	local var_41_0 = arg_41_0.normalZones

	UIItemList.StaticAlign(arg_41_0.zoneList:Find("List"), arg_41_0.zoneList:Find("List"):GetChild(0), #var_41_0, function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_42_1 = arg_42_1 + 1

		local var_42_0 = var_41_0[arg_42_1]

		arg_42_2.name = var_42_0:GetWatchCameraName()

		setText(arg_42_2:Find("Name"), var_42_0:GetName())
		onButton(arg_41_0, arg_42_2, function()
			arg_41_0.zoneIndex = arg_42_1

			arg_41_0:UpdateDataZone()
			arg_41_0.scene:SwitchFurnitureZone(var_42_0)
			arg_41_0:InitViewTypeList()
			arg_41_0:UpdateView()
			quickPlayAnimation(arg_41_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_41_0.zoneList, false)
		end, SFX_PANEL)
		setActive(arg_42_2:Find("Line"), arg_42_1 < #var_41_0)
		setActive(arg_42_2:Find("New"), false)
	end)
end

function var_0_0.InitViewTypeList(arg_44_0)
	UIItemList.StaticAlign(arg_44_0._tf:Find("Right/Panel/Container/Types"), arg_44_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_44_0.activeFurnitureTypes, function(arg_45_0, arg_45_1, arg_45_2)
		if arg_45_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_45_1 = arg_45_1 + 1

		local var_45_0 = arg_44_0.activeFurnitureTypes[arg_45_1]

		setText(arg_45_2:Find("Name"), i18n(Dorm3dFurniture.TYPE2NAME[var_45_0]))
		onButton(arg_44_0, arg_45_2, function()
			if arg_44_0.furnitureType == var_45_0 then
				return
			end

			arg_44_0.furnitureType = var_45_0

			arg_44_0:ResetSelectSetting()
			arg_44_0:UpdateDataDisplayFurnitures()
			arg_44_0:FilterDataFurnitures()
			arg_44_0:UpdateView()
			quickPlayAnimation(arg_44_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_44_0.zoneList, false)
		end, SFX_PANEL)
	end)
end

function var_0_0.UpdateView(arg_47_0)
	local var_47_0 = arg_47_0.normalZones
	local var_47_1 = var_47_0[arg_47_0.zoneIndex]

	setText(arg_47_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Name"), var_47_1:GetName())
	UIItemList.StaticAlign(arg_47_0.zoneList:Find("List"), arg_47_0.zoneList:Find("List"):GetChild(0), #var_47_0, function(arg_48_0, arg_48_1, arg_48_2)
		if arg_48_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_48_1 = arg_48_1 + 1

		local var_48_0 = arg_48_2:Find("Name"):GetComponent(typeof(Text)).color
		local var_48_1 = arg_47_0.zoneIndex == arg_48_1 and Color.NewHex("39bfff") or Color.white

		var_48_1.a = var_48_0.a

		setTextColor(arg_48_2:Find("Name"), var_48_1)
		setActive(arg_48_2:Find("New"), false)
	end)

	local var_47_2 = arg_47_0.room:GetFurnitures()

	;(function()
		local var_49_0 = false

		table.Ipairs(arg_47_0.normalZones, function(arg_50_0, arg_50_1)
			local var_50_0 = false

			if arg_50_1 ~= var_47_1 then
				var_50_0 = _.any(arg_50_1:GetSlots(), function(arg_51_0)
					return _.any(var_47_2, function(arg_52_0)
						if not arg_51_0:CanUseFurniture(arg_52_0) then
							return
						end

						return Dorm3dFurniture.GetViewedFlag(arg_52_0:GetConfigID()) == 0
					end)
				end)
			end

			setActive(arg_47_0.zoneList:Find("List"):GetChild(arg_50_0 - 1):Find("New"), var_50_0)

			var_49_0 = var_49_0 or var_50_0
		end)
		setActive(arg_47_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch/New"), var_49_0)
	end)()
	setActive(arg_47_0._tf:Find("Right/Panel/Container/Types"), #arg_47_0.activeFurnitureTypes > 1)
	UIItemList.StaticAlign(arg_47_0._tf:Find("Right/Panel/Container/Types"), arg_47_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_47_0.activeFurnitureTypes, function(arg_53_0, arg_53_1, arg_53_2)
		if arg_53_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_53_1 = arg_53_1 + 1

		local var_53_0 = arg_47_0.activeFurnitureTypes[arg_53_1]

		setActive(arg_53_2:Find("Selected"), arg_47_0.furnitureType == var_53_0)

		local var_53_1 = _.any(var_47_1:GetSlots(), function(arg_54_0)
			return _.any(var_47_2, function(arg_55_0)
				if arg_55_0:GetType() ~= var_53_0 then
					return
				end

				if not arg_54_0:CanUseFurniture(arg_55_0) then
					return
				end

				return Dorm3dFurniture.GetViewedFlag(arg_55_0:GetConfigID()) == 0
			end)
		end)

		setActive(arg_53_2:Find("New"), var_53_1)
	end)

	arg_47_0.furnitureItems = {}

	arg_47_0.furnitureScroll:SetTotalCount(#arg_47_0.displayFurnitures)
	setActive(arg_47_0.furnitureEmpty, #arg_47_0.displayFurnitures == 0)

	if arg_47_0.timerRefreshShop then
		arg_47_0.timerRefreshShop:Stop()
	end

	arg_47_0.timerRefreshShop = Timer.New(function()
		table.Foreach(arg_47_0.furnitureItems, function(arg_57_0, arg_57_1)
			arg_47_0:UpdateViewFurnitureItem(arg_57_0)
		end)
	end, 1, -1)

	arg_47_0.timerRefreshShop:Start()

	local var_47_3 = {}
	local var_47_4 = arg_47_0.furnitureType
	local var_47_5 = {
		var_47_1,
		unpack(arg_47_0.globalZones)
	}
	local var_47_6 = _.reduce(var_47_5, {}, function(arg_58_0, arg_58_1)
		table.insertto(arg_58_0, arg_58_1:GetSlots())

		return arg_58_0
	end)
	local var_47_7 = _.select(var_47_6, function(arg_59_0)
		return arg_59_0:GetType() == var_47_4
	end)

	_.each(var_47_7, function(arg_60_0)
		local var_60_0 = arg_60_0:GetConfigID()

		var_47_3[var_60_0] = 0
	end)

	local var_47_8 = false

	if arg_47_0.selectSlotId then
		local var_47_9 = Dorm3dFurnitureSlot.New({
			configId = arg_47_0.selectSlotId
		})

		if var_47_9:GetType() == Dorm3dFurniture.TYPE.DECORATION then
			local var_47_10 = arg_47_0.room:GetFurnitures()

			if _.detect(var_47_10, function(arg_61_0)
				return arg_61_0:GetSlotID() == var_47_9:GetConfigID()
			end) then
				arg_47_0:CleanSlot()
			end
		end
	end

	if not var_47_8 then
		arg_47_0.labelSettings = nil
	end

	setActive(arg_47_0.lableTrans, var_47_8)
	arg_47_0.scene:DisplayFurnitureSlots(_.map(var_47_7, function(arg_62_0)
		return arg_62_0:GetConfigID()
	end))
	arg_47_0.scene:UpdateDisplaySlots(var_47_3)
	arg_47_0.scene:RefreshSlots(arg_47_0.room)
end

function var_0_0.UpdateViewFurnitureItem(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0.furnitureItems[arg_63_1]
	local var_63_1 = arg_63_0.displayFurnitures[arg_63_1]

	if not var_63_0 then
		return
	end

	local var_63_2 = tf(var_63_0)

	var_63_2.name = var_63_1.id

	updateCustomDrop(var_63_2:Find("Item/Dorm3dIconTpl"), Drop.New({
		type = DROP_TYPE_DORM3D_FURNITURE,
		id = var_63_1.id,
		count = var_63_1.count
	}))
	setText(var_63_2:Find("Item/Name"), var_63_1.template:GetName())

	local var_63_3 = i18n("dorm3d_furniture_count", var_63_1.useable .. "/" .. var_63_1.count)

	if var_63_1.useable < var_63_1.count then
		var_63_3 = i18n("dorm3d_furniture_used") .. var_63_3
	elseif var_63_1.count == 0 then
		var_63_3 = i18n("dorm3d_furniture_lack") .. var_63_3
	end

	setText(var_63_2:Find("Item/Count"), var_63_3)
	setActive(var_63_2:Find("Selected"), arg_63_0.selectFurnitureId == var_63_1.id)
	setCanvasGroupAlpha(var_63_2:Find("Item"), 1)

	local var_63_4 = var_63_1.template:IsValuable()
	local var_63_5 = var_63_1.template:IsSpecial()
	local var_63_6 = 0

	if var_63_5 then
		var_63_6 = 2
	elseif var_63_4 then
		var_63_6 = 1
	end

	setActive(var_63_2:Find("Item/BG/Pro"), var_63_6 == 1)
	setActive(var_63_2:Find("Item/LabelPro"), var_63_6 == 1)
	setActive(var_63_2:Find("Item/BG/SP"), var_63_6 == 2)
	setActive(var_63_2:Find("Item/LabelSP"), var_63_6 == 2)
	setActive(var_63_2:Find("Item/Action"), false)

	local var_63_7 = var_63_1.template:GetEndTime()
	local var_63_8 = var_63_1.count == 0 and var_63_7 > 0 and var_63_7 > pg.TimeMgr.GetInstance():GetServerTime()

	setActive(var_63_2:Find("TimeLimit"), var_63_8)

	if var_63_8 then
		setText(var_63_2:Find("TimeLimit/Text"), skinCommdityTimeStamp(var_63_7))
	end

	onButton(arg_63_0, var_63_2:Find("Item/Tip"), function()
		arg_63_0:emit(Dorm3dFurnitureSelectMediator.SHOW_FURNITURE_ACESSES, {
			showGOBtn = true,
			title = i18n("courtyard_label_detail"),
			drop = {
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_63_1.id,
				count = var_63_1.count
			},
			list = var_63_1.template:GetAcesses()
		})
	end, SFX_PANEL)

	local var_63_9 = var_63_1.count > 0 and not var_63_1.viewedFlag

	setActive(var_63_2:Find("Item/New"), var_63_9)

	if var_63_9 then
		Dorm3dFurniture.SetViewedFlag(var_63_1.id)
	end

	onButton(arg_63_0, var_63_2, function()
		if var_63_1.count > 0 then
			setActive(var_63_2:Find("Item/New"), false)

			var_63_1.viewedFlag = true
		end

		local var_65_0 = var_63_1.template:GetTargetSlotID()

		arg_63_0.selectSlotId = nil

		if var_63_1.useable > 0 then
			arg_63_0.room:ReplaceFurniture(var_65_0, var_63_1.id)
			table.insert(arg_63_0.replaceFurnitures, {
				slotId = var_65_0,
				furnitureId = var_63_1.id
			})
			arg_63_0:UpdateDataDisplayFurnitures()
			arg_63_0:UpdateView()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
		elseif var_63_1.useable < var_63_1.count then
			arg_63_0.selectSlotId = var_65_0

			arg_63_0:UpdateView()
		end
	end)

	local var_63_10 = var_63_1.count == 0 and var_63_1.template:GetShopID() or 0

	setActive(var_63_2:Find("GO"), var_63_10 ~= 0)

	if var_63_10 ~= 0 then
		local var_63_11 = CommonCommodity.New({
			id = var_63_10
		}, Goods.TYPE_SHOPSTREET)
		local var_63_12, var_63_13, var_63_14 = var_63_11:GetPrice()
		local var_63_15 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_63_11:GetResType(),
			count = var_63_12
		})
		local var_63_16 = pg.shop_template[var_63_10]

		onButton(arg_63_0, var_63_2:Find("GO"), function()
			local var_66_0 = var_63_1.template:GetEndTime()

			arg_63_0:emit(Dorm3dFurnitureSelectMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
				content = {
					icon = "<icon name=" .. var_63_11:GetResIcon() .. " w=1.1 h=1.1/>",
					off = var_63_13,
					cost = var_63_15.count,
					old = var_63_14,
					name = var_63_1.template:GetName()
				},
				tip = i18n("dorm3d_shop_gift_tip"),
				drop = var_63_1.template,
				endTime = var_66_0,
				onYes = function()
					if not var_63_1.template:InShopTime() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_purchase_outtime"))

						return
					end

					arg_63_0:emit(GAME.SHOPPING, {
						silentTip = true,
						count = 1,
						shopId = var_63_10
					})
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.CleanSlot(arg_68_0)
	if not arg_68_0.selectSlotId then
		return
	end

	local var_68_0 = arg_68_0.selectSlotId

	arg_68_0.room:ReplaceFurniture(var_68_0, 0)
	table.insert(arg_68_0.replaceFurnitures, {
		furnitureId = 0,
		slotId = var_68_0
	})
	arg_68_0:ResetSelectSetting()
	arg_68_0:UpdateDataDisplayFurnitures()
	arg_68_0:UpdateView()
end

function var_0_0.OnReplaceFurnitureDone(arg_69_0)
	arg_69_0.replaceFurnitures = {}

	existCall(arg_69_0.replaceFurnitureCallback)

	arg_69_0.replaceFurnitureCallback = nil
end

function var_0_0.OnReplaceFurnitureError(arg_70_0)
	arg_70_0.replaceFurnitureCallback = nil
end

function var_0_0.AutoReplaceFurniture(arg_71_0)
	local var_71_0 = arg_71_0.normalZones[arg_71_0.zoneIndex]:GetSlots()

	_.each(var_71_0, function(arg_72_0)
		if arg_72_0:GetType() == Dorm3dFurniture.TYPE.FLOOR or arg_72_0:GetType() == Dorm3dFurniture.TYPE.WALLPAPER then
			return
		end

		local var_72_0 = arg_71_0.room:GetFurnitures()
		local var_72_1 = _.detect(var_72_0, function(arg_73_0)
			return arg_73_0:GetSlotID() == arg_72_0:GetConfigID()
		end)

		if var_72_1 and var_72_1:GetConfigID() ~= arg_72_0:GetDefaultFurniture() then
			return
		end

		local var_72_2 = table.shallowCopy(var_72_0)
		local var_72_3 = {
			function(arg_74_0)
				return arg_74_0:GetSlotID() == 0 and arg_72_0:CanUseFurniture(arg_74_0) and 0 or 1
			end,
			function(arg_75_0)
				return -arg_75_0:GetRarity()
			end,
			function(arg_76_0)
				return -arg_76_0:GetConfigID()
			end
		}

		table.sort(var_72_2, CompareFuncs(var_72_3))

		local var_72_4 = var_72_2[1]

		if not var_72_4 or var_72_4:GetSlotID() ~= 0 or not arg_72_0:CanUseFurniture(var_72_4) then
			return
		end

		arg_71_0.room:ReplaceFurniture(arg_72_0:GetConfigID(), var_72_4:GetConfigID())
		table.insert(arg_71_0.replaceFurnitures, {
			slotId = arg_72_0:GetConfigID(),
			furnitureId = var_72_4:GetConfigID()
		})
	end)
	arg_71_0:ResetSelectSetting()
	arg_71_0:UpdateDataDisplayFurnitures()
	arg_71_0:UpdateView()
end

function var_0_0.ShowReplaceWindow(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = arg_77_0.replaceFurnitures

	if #var_77_0 == 0 then
		return existCall(arg_77_1)
	end

	arg_77_0:emit(Dorm3dFurnitureSelectMediator.SHOW_CONFIRM_WINDOW, {
		title = i18n("title_info"),
		content = i18n("dorm3d_furniture_sure_save"),
		onYes = function()
			arg_77_0:emit(GAME.APARTMENT_REPLACE_FURNITURE, {
				roomId = arg_77_0.room:GetConfigID(),
				furnitures = var_77_0
			})

			arg_77_0.replaceFurnitureCallback = arg_77_1
		end,
		onNo = arg_77_2
	})
end

function var_0_0.onBackPressed(arg_79_0)
	seriesAsync({
		function(arg_80_0)
			arg_79_0:ShowReplaceWindow(arg_80_0, arg_80_0)
		end,
		function(arg_81_0)
			GetOrAddComponent(arg_79_0._tf, typeof(CanvasGroup)).alpha = 0

			arg_79_0.scene:ExitFurnitureWatchMode(function()
				var_0_0.super.onBackPressed(arg_79_0)
			end)
		end
	})
end

function var_0_0.willExit(arg_83_0)
	arg_83_0.furnitureScroll.enabled = false

	if arg_83_0.timerRefreshShop then
		arg_83_0.timerRefreshShop:Stop()
	end

	UpdateBeat:RemoveListener(arg_83_0.updateHandler)
end

return var_0_0
