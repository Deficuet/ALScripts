local var_0_0 = class("CourtyardInteractionPreview", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "BackYardInterActionPreview"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/close")
	arg_2_0.mask = arg_2_0._tf:Find("frame/mask")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Destroy()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Destroy()
	end, SFX_PANEL)
	setText(arg_3_0._tf:Find("frame/title"), i18n("word_preview"))
end

function var_0_0.Show(arg_6_0, arg_6_1, arg_6_2)
	var_0_0.super.Show(arg_6_0)

	arg_6_0.storeyId = 999
	arg_6_0.furnitureId = arg_6_1

	local var_6_0 = pg.ship_skin_template[arg_6_2]

	arg_6_0.shipId = ShipGroup.getDefaultShipConfig(var_6_0.ship_group).id
	arg_6_0.shipSkinId = arg_6_2
	arg_6_0.furniturePosition = Vector2(0, 0)
	arg_6_0.step = 0
	arg_6_0.instance = nil

	arg_6_0:SetUp()
end

function var_0_0.SetUp(arg_7_0)
	setActive(arg_7_0.mask, false)

	arg_7_0.instance = CourtYardBridge.New(arg_7_0:GenCourtYardData(id))

	local var_7_0 = arg_7_0.instance:GetController()
	local var_7_1 = arg_7_0.instance:GetView()
	local var_7_2 = arg_7_0:GetPutFurniture()
	local var_7_3 = 0

	arg_7_0.timer = Timer.New(function()
		if arg_7_0.step == 2 then
			local var_8_0 = var_7_0:GetStorey():GetFurniture(var_7_2.id)

			if var_8_0 and not var_8_0:AnySlotIsLoop() and not var_8_0:IsInteractionState() then
				GetOrAddComponent(var_7_1:GetRect(), typeof(CanvasGroup)).alpha = 0

				setActive(arg_7_0.mask, true)
				onButton(arg_7_0, arg_7_0.mask, function()
					arg_7_0.step = 1

					setActive(arg_7_0.mask, false)
				end, SFX_PANEL)

				arg_7_0.step = 3
			end
		end

		if arg_7_0.step == 1 and var_7_1:GetCurrStorey():ItemsIsLoaded() then
			arg_7_0:StartInteraction(var_7_0)

			GetOrAddComponent(var_7_1:GetRect(), typeof(CanvasGroup)).alpha = 1
			arg_7_0.step = 2
		end

		if var_7_1:IsInit() and var_7_0:IsLoaed() and arg_7_0.step == 0 then
			arg_7_0.step = 1
			GetOrAddComponent(var_7_1:GetRect(), typeof(CanvasGroup)).alpha = 0

			var_7_0:AddFurniture(var_7_2)
			var_7_0:AddShip(arg_7_0:GetPutShip())
		end
	end, 0.01, -1)

	arg_7_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_10_0)
	if arg_10_0.timer then
		arg_10_0.timer:Stop()

		arg_10_0.timer = nil
	end
end

function var_0_0.StartInteraction(arg_11_0, arg_11_1)
	if arg_11_0.shipId then
		arg_11_1:DragShip(arg_11_0.shipId)
		arg_11_1:DragShipEnd(arg_11_0.shipId, arg_11_0.furniturePosition)
	end
end

function var_0_0.Hide(arg_12_0)
	var_0_0.super.Hide(arg_12_0)
	arg_12_0:RemoveTimer()

	if arg_12_0.instance then
		arg_12_0.instance:Dispose()
	end

	arg_12_0.instance = nil
end

function var_0_0.GenCourtYardData(arg_13_0)
	local var_13_0 = arg_13_0.storeyId
	local var_13_1 = 4
	local var_13_2 = {
		[var_13_0] = {
			id = var_13_0,
			level = var_13_1,
			furnitures = {},
			ships = {}
		}
	}
	local var_13_3 = Dorm.StaticGetMapSize(var_13_1)

	return {
		system = CourtYardConst.SYSTEM_VISIT,
		storeys = var_13_2,
		storeyId = var_13_0,
		style = CourtYardConst.STYLE_PREVIEW,
		mapSize = var_13_3,
		name = arg_13_0:getUIName()
	}
end

function var_0_0.GetPutFurniture(arg_14_0)
	return (BackyardThemeFurniture.New({
		id = 9999,
		isNewStyle = true,
		configId = arg_14_0.furnitureId,
		position = arg_14_0.furniturePosition
	}))
end

function var_0_0.GetPutShip(arg_15_0)
	if not arg_15_0.shipId or arg_15_0.shipId <= 0 then
		return {}
	end

	return (Ship.New({
		id = arg_15_0.shipId,
		template_id = arg_15_0.shipId,
		skin_id = arg_15_0.shipSkinId
	}))
end

function var_0_0.OnDestroy(arg_16_0)
	arg_16_0:Hide()
end

return var_0_0
