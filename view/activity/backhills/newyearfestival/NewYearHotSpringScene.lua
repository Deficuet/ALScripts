local var_0_0 = class("NewYearHotSpringScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewYearHotSpringUI"
end

local var_0_1 = 0.85

function var_0_0.init(arg_2_0)
	arg_2_0.scrollRect = arg_2_0._tf:Find("ScrollRect")
	arg_2_0.scrollContent = arg_2_0.scrollRect:GetComponent(typeof(ScrollRect)).content
	arg_2_0.slotTFs = _.map(_.range(4, 13), function(arg_3_0)
		return arg_2_0.scrollRect:Find("Pool"):GetChild(arg_3_0 - 1)
	end)
	arg_2_0.slotOriginalPos = _.map(arg_2_0.slotTFs, function(arg_4_0)
		return arg_4_0.anchoredPosition
	end)
	arg_2_0.slotShipPos = Clone(arg_2_0.slotOriginalPos)

	table.Foreach(arg_2_0:GetRecordPos(), function(arg_5_0, arg_5_1)
		arg_2_0.slotShipPos[arg_5_0] = arg_5_1
	end)

	arg_2_0.poolItems = _.map(_.range(arg_2_0.scrollRect:Find("Pool").childCount), function(arg_6_0)
		return arg_2_0.scrollRect:Find("Pool"):GetChild(arg_6_0 - 1)
	end)

	Canvas.ForceUpdateCanvases()

	arg_2_0.scrollBGs = _.map({
		{
			"1",
			0.5
		},
		{
			"2",
			0.6
		},
		{
			"3",
			var_0_1
		},
		{
			"Pool",
			var_0_1
		},
		{
			"4",
			1
		},
		{
			"5",
			1
		}
	}, function(arg_7_0)
		local var_7_0 = {
			arg_2_0.scrollRect:Find(arg_7_0[1]),
			arg_7_0[2]
		}

		var_7_0[3] = var_7_0[1].anchoredPosition.x

		arg_2_0:UpdateScrollContent(0, unpack(var_7_0))

		return var_7_0
	end)
	arg_2_0.top = arg_2_0._tf:Find("Top")

	pg.ViewUtils.SetSortingOrder(arg_2_0._tf, -1001)

	arg_2_0.spineRoles = {}
	arg_2_0.washMaterial = Material.New(pg.ShaderMgr.GetInstance():GetShader("M02/Unlit_Colored_Semitransparent"))

	arg_2_0.washMaterial:SetFloat("_Height", 0.5)
end

function var_0_0.SetActivity(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.activity

	arg_8_0.activity = arg_8_1

	if not var_8_0 then
		return
	end

	table.Foreach(var_8_0:GetShipIds(), function(arg_9_0, arg_9_1)
		if arg_9_1 > 0 and (arg_8_1:GetShipIds()[arg_9_0] or 0) == 0 then
			arg_8_0.slotShipPos[arg_9_0] = Clone(arg_8_0.slotOriginalPos[arg_9_0])
		end
	end)
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0._tf:Find("Top/Back"), function()
		arg_10_0:closeView()
	end, SOUND_BACK)
	onButton(arg_10_0, arg_10_0._tf:Find("Top/Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.hotspring_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf:Find("Top/Manage"), function()
		arg_10_0:emit(NewYearHotSpringMediator.OPEN_INFO)
	end, SFX_PANEL)

	local var_10_0 = string.split(i18n("hotspring_buff"), "|")

	assert(var_10_0)
	onButton(arg_10_0, arg_10_0._tf:Find("Top/Buff"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideIconBG = true,
			type = MSGBOX_TYPE_DROP_ITEM,
			iconPath = {
				"UI/NewYearHotSpringUI_atlas",
				"buff_hotspring"
			},
			name = var_10_0[1],
			content = var_10_0[2]
		})
	end, SFX_PANEL)
	onScroll(arg_10_0, arg_10_0.scrollRect, function(arg_15_0)
		_.each(arg_10_0.scrollBGs, function(arg_16_0)
			arg_10_0:UpdateScrollContent(arg_10_0.scrollContent.anchoredPosition.x, unpack(arg_16_0))
		end)
	end)
	arg_10_0:InitSlots()
	arg_10_0:UpdateView()

	arg_10_0.timer = FrameTimer.New(function()
		local var_17_0 = _.map(_.range(arg_10_0.scrollRect:Find("Pool").childCount), function(arg_18_0)
			return arg_10_0.scrollRect:Find("Pool"):GetChild(arg_18_0 - 1)
		end)

		mergeSort(var_17_0, function(arg_19_0, arg_19_1)
			return arg_19_0.anchoredPosition.y >= arg_19_1.anchoredPosition.y
		end)
		table.Foreach(var_17_0, function(arg_20_0, arg_20_1)
			arg_20_1:SetSiblingIndex(arg_20_0 - 1)
		end)
	end, 1, -1)

	arg_10_0.timer:Start()
	onNextTick(function()
		local var_21_0 = arg_10_0.activity:GetSlotCount() + 1

		if var_21_0 <= #arg_10_0.slotTFs then
			local var_21_1 = arg_10_0.scrollRect.rect.width
			local var_21_2 = arg_10_0.scrollContent.rect.width
			local var_21_3 = arg_10_0.scrollRect:Find("Pool")
			local var_21_4 = var_21_3.anchoredPosition.x + arg_10_0.slotTFs[var_21_0].anchoredPosition.x + var_21_3.rect.width * 0.5
			local var_21_5 = math.clamp((var_21_4 - var_21_1 * 0.5) / var_0_1, 0, var_21_2 - var_21_1)

			setAnchoredPosition(arg_10_0.scrollContent, {
				x = var_21_5
			})
			_.each(arg_10_0.scrollBGs, function(arg_22_0)
				arg_10_0:UpdateScrollContent(-var_21_5, unpack(arg_22_0))
			end)
		end
	end)
	arg_10_0:OverlayPanel(arg_10_0.top)
end

function var_0_0.UpdateScrollContent(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	arg_23_1 = arg_23_1 * arg_23_3

	setAnchoredPosition(arg_23_2, {
		x = arg_23_1 + arg_23_4
	})
end

function var_0_0.InitSlots(arg_24_0)
	arg_24_0:CleanSpines()
	table.Foreach(arg_24_0.slotTFs, function(arg_25_0, arg_25_1)
		onButton(arg_24_0, arg_25_1:Find("Usable"), function()
			arg_24_0:emit(NewYearHotSpringMediator.UNLOCK_SLOT, arg_24_0.activity.id)
		end, SFX_PANEL)

		local function var_25_0()
			local var_27_0 = arg_24_0.activity:GetShipIds()[arg_25_0] or 0
			local var_27_1 = var_27_0 > 0 and getProxy(BayProxy):RawGetShipById(var_27_0)

			arg_24_0:emit(NewYearHotSpringMediator.OPEN_CHUANWU, arg_25_0, var_27_1)
		end

		onButton(arg_24_0, arg_25_1:Find("Enter"), var_25_0, SFX_PANEL)
		onButton(arg_24_0, arg_25_1:Find("Ship/Click"), function()
			if arg_24_0._modelDrag then
				return
			end

			var_25_0()
		end, SFX_PANEL)

		local var_25_1 = pg.UIMgr.GetInstance().uiCamera:GetComponent(typeof(Camera))
		local var_25_2 = arg_24_0.scrollRect:Find("Pool")
		local var_25_3 = GetComponent(arg_25_1:Find("Ship/Click"), "EventTriggerListener")

		var_25_3:AddBeginDragFunc(function()
			if arg_24_0._modelDrag then
				return
			end

			arg_24_0._modelDrag = arg_25_1
			arg_24_0._currentDragDelegate = var_25_3
			arg_24_0._lastDragBeginPosition = arg_25_1.anchoredPosition

			setParent(arg_25_1, arg_24_0._tf)

			local var_29_0 = arg_24_0.spineRoles[arg_25_0]

			var_29_0:RevertMaterial()
			var_29_0:SetAction("tuozhuai")
			setActive(arg_25_1:Find("wenquan_bowen"), false)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_HOME_DRAG)
		end)
		var_25_3:AddDragFunc(function(arg_30_0, arg_30_1)
			if arg_24_0._modelDrag ~= arg_25_1 then
				return
			end

			local var_30_0 = LuaHelper.ScreenToLocal(arg_24_0._tf, arg_30_1.position, var_25_1)

			arg_25_1.anchoredPosition = var_30_0
		end)
		var_25_3:AddDragEndFunc(function(arg_31_0, arg_31_1)
			if arg_24_0._modelDrag ~= arg_25_1 then
				return
			end

			arg_24_0._modelDrag = false

			local var_31_0 = arg_24_0._forceDropCharacter

			arg_24_0._forceDropCharacter = nil
			arg_24_0._currentDragDelegate = nil

			local var_31_1 = arg_24_0.spineRoles[arg_25_0]

			setParent(arg_25_1, var_25_2, true)

			local function var_31_2()
				if arg_24_0._lastDragBeginPosition ~= nil then
					arg_25_1.anchoredPosition = arg_24_0._lastDragBeginPosition
				end
			end

			if var_31_0 then
				var_31_2()

				return
			end

			local var_31_3 = var_25_2.rect

			var_31_3.center = var_31_3.center + Vector2.New(-var_31_3.size.x * 0.5)

			local var_31_4 = arg_25_1.anchoredPosition

			if not var_31_3:Contains(var_31_4) then
				var_31_4 = Vector2.Min(Vector2.Max(var_31_4, var_31_3.min), var_31_3.max)
				arg_25_1.anchoredPosition = var_31_4
			end

			arg_24_0.slotShipPos[arg_25_0] = var_31_4

			arg_24_0:SetSpineWash(var_31_1)
			setActive(arg_25_1:Find("wenquan_bowen"), true)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_HOME_PUT)
		end)
	end)
end

function var_0_0.UpdateView(arg_33_0)
	arg_33_0:UpdateSlots()
	setText(arg_33_0.top:Find("Ticket/Text"), arg_33_0.activity:GetCoins())
end

function var_0_0.UpdateSlots(arg_34_0)
	arg_34_0:CleanSpines()
	table.Foreach(arg_34_0.slotTFs, function(arg_35_0, arg_35_1)
		arg_34_0:UpdateSlot(arg_35_0, arg_35_1)
	end)
end

function var_0_0.RectContainsRect(arg_36_0, arg_36_1)
	return arg_36_0:Contains(arg_36_1.min) and arg_36_0:Contains(arg_36_1.max)
end

function var_0_0.UpdateSlot(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = math.clamp(arg_37_1 - arg_37_0.activity:GetSlotCount(), 0, 2)

	setActive(arg_37_2:Find("Lock"), var_37_0 == 2)
	setActive(arg_37_2:Find("Usable"), var_37_0 == 1)

	local var_37_1 = arg_37_0.activity:GetShipIds()[arg_37_1] or 0
	local var_37_2 = var_37_0 == 0
	local var_37_3 = var_37_1 > 0 and getProxy(BayProxy):RawGetShipById(var_37_1)
	local var_37_4 = arg_37_2:Find("Ship")

	setActive(arg_37_2:Find("Enter"), var_37_2 and not var_37_3)
	setActive(var_37_4, var_37_2 and var_37_3 and true)

	local var_37_5 = (var_37_3 and arg_37_0.slotShipPos or arg_37_0.slotOriginalPos)[arg_37_1]

	setAnchoredPosition(arg_37_2, var_37_5)

	if var_37_3 then
		local var_37_6 = SpineRole.New()

		var_37_6:SetData(var_37_3:getPrefab())
		arg_37_0:LoadingOn()
		var_37_6:Load(function()
			var_37_6:SetParent(var_37_4:Find("Model"))
			arg_37_0:SetSpineWash(var_37_6)
			arg_37_0:LoadingOff()
		end, true)

		arg_37_0.spineRoles[arg_37_1] = var_37_6
	end
end

function var_0_0.SetSpineWash(arg_39_0, arg_39_1)
	arg_39_1:SetAction("wash")
	arg_39_1:ChangeMaterial(Object.Instantiate(arg_39_0.washMaterial))

	local var_39_0 = arg_39_1.model.transform.position.y

	arg_39_1._modleGraphic.material:SetFloat("_PositionY", var_39_0 + 1.5)
end

function var_0_0.CleanSpines(arg_40_0)
	arg_40_0:ForceDropChar()
	table.Foreach(arg_40_0.spineRoles, function(arg_41_0, arg_41_1)
		arg_41_1:Dispose()
	end)

	arg_40_0.spineRoles = {}
end

function var_0_0.ForceDropChar(arg_42_0)
	if arg_42_0._currentDragDelegate then
		arg_42_0._forceDropCharacter = true

		LuaHelper.triggerEndDrag(arg_42_0._currentDragDelegate)
	end
end

function var_0_0.GetRecordPos(arg_43_0)
	local var_43_0 = PlayerPrefs.GetString("hotspring_ship_pos", "")
	local var_43_1 = _.map(string.split(var_43_0, ";"), function(arg_44_0)
		return tonumber(arg_44_0)
	end)
	local var_43_2 = {}

	for iter_43_0 = 1, #var_43_1, 2 do
		table.insert(var_43_2, Vector2.New(var_43_1[iter_43_0], var_43_1[iter_43_0 + 1]))
	end

	return var_43_2
end

function var_0_0.RecordPos(arg_45_0, arg_45_1)
	if not arg_45_1 then
		return
	end

	local var_45_0 = table.concat(_.reduce(arg_45_1, {}, function(arg_46_0, arg_46_1)
		table.insert(arg_46_0, arg_46_1.x)
		table.insert(arg_46_0, arg_46_1.y)

		return arg_46_0
	end), ";")

	PlayerPrefs.SetString("hotspring_ship_pos", var_45_0)
end

function var_0_0.LoadingOn(arg_47_0)
	if arg_47_0.animating then
		return
	end

	arg_47_0.animating = true

	pg.UIMgr.GetInstance():LoadingOn(false)
end

function var_0_0.LoadingOff(arg_48_0)
	if not arg_48_0.animating then
		return
	end

	pg.UIMgr.GetInstance():LoadingOff()

	arg_48_0.animating = false
end

function var_0_0.willExit(arg_49_0)
	arg_49_0:UnOverlayPanel(arg_49_0.top, arg_49_0._tf)
	Object.Destroy(arg_49_0.washMaterial)
	arg_49_0:RecordPos(arg_49_0.slotShipPos)
	arg_49_0:CleanSpines()
	arg_49_0.timer:Stop()
	arg_49_0:LoadingOff()
end

return var_0_0
