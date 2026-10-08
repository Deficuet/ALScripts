local var_0_0 = class("AssignedShipForBuildURScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AssignedShipBuildURUI"
end

function var_0_0.setItemVO(arg_2_0, arg_2_1)
	arg_2_0.itemVO = arg_2_1
end

function var_0_0.preload(arg_3_0, arg_3_1)
	arg_3_0.shipUsageDic = {}
	arg_3_0.ids = underscore.map(arg_3_0.contextData.itemVO:getConfig("usage_arg"), function(arg_4_0)
		local var_4_0 = pg.item_usage_invitation[arg_4_0].ship_id

		arg_3_0.shipUsageDic[var_4_0] = arg_4_0

		return var_4_0
	end)
	arg_3_0.iconSprites = {}

	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.ids) do
		table.insert(var_3_0, function(arg_5_0)
			GetSpriteFromAtlasAsync("RegularExchangeIcon", tostring(iter_3_1), function(arg_6_0)
				arg_3_0.iconSprites[iter_3_1] = arg_6_0

				arg_5_0()
			end)
		end)
	end

	seriesAsync(var_3_0, arg_3_1)
end

function var_0_0.getResource(arg_7_0)
	local var_7_0 = var_0_0.super.getResource(arg_7_0)
	local var_7_1 = {
		"RegularExchangeIcon"
	}
	local var_7_2 = arg_7_0.contextData.itemVO or arg_7_0.itemVO

	if var_7_2 then
		for iter_7_0, iter_7_1 in ipairs(var_7_2:getConfig("usage_arg")) do
			local var_7_3 = pg.item_usage_invitation[iter_7_1].ship_id
			local var_7_4 = Ship.New({
				configId = var_7_3
			}):getPainting()

			if noEmptyStr(var_7_4) then
				table.insert(var_7_1, "painting/" .. var_7_4)
			end
		end
	end

	for iter_7_2, iter_7_3 in ipairs(var_7_1) do
		if not table.contains(var_7_0, iter_7_3) then
			table.insert(var_7_0, iter_7_3)
		end
	end

	return var_7_0
end

function var_0_0.init(arg_8_0)
	arg_8_0.backBtn = arg_8_0._tf:Find("top/bg/btn_back")

	onButton(arg_8_0, arg_8_0.backBtn, function()
		arg_8_0:closeView()
	end, SFX_CANCEL)

	local var_8_0 = arg_8_0._tf:Find("select/view/container")

	arg_8_0.iconList = UIItemList.New(var_8_0, var_8_0:Find("tpl"))

	arg_8_0.iconList:make(function(arg_10_0, arg_10_1, arg_10_2)
		arg_10_1 = arg_10_1 + 1

		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = Ship.New({
				configId = arg_8_0.ids[arg_10_1]
			})

			setImageSprite(arg_10_2:Find("Image"), arg_8_0.iconSprites[var_10_0.configId], true)
			setActive(arg_10_2:Find("noget"), not getProxy(CollectionProxy):getShipGroup(var_10_0:getGroupId()))
			onToggle(arg_8_0, arg_10_2, function(arg_11_0)
				if arg_11_0 then
					arg_8_0:setSelectedShip(var_10_0)
				end
			end, SFX_PANEL)
			triggerToggle(arg_10_2, arg_10_1 == 1)
		end
	end)

	arg_8_0.btnConfirm = arg_8_0._tf:Find("select/operation/confirm")

	onButton(arg_8_0, arg_8_0.btnConfirm, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("handbook_ur_double_check", arg_8_0.shipVO:getName()),
			onYes = function()
				arg_8_0:emit(AssignedShipMediator.ON_USE_ITEM, arg_8_0.itemVO.id, 1, {
					arg_8_0.shipUsageDic[arg_8_0.shipVO:GetConfigID()]
				})
			end
		})
	end, SFX_CONFIRM)

	arg_8_0.rtName = arg_8_0._tf:Find("select/name_bg")
	arg_8_0.rtPaint = arg_8_0._tf:Find("main/paint")
end

function var_0_0.setSelectedShip(arg_14_0, arg_14_1)
	if arg_14_0.shipVO then
		retPaintingPrefab(arg_14_0.rtPaint, arg_14_0.shipVO:getPainting())
	end

	arg_14_0.shipVO = arg_14_1

	local var_14_0 = ShipType.Type2BattlePrint(arg_14_1:getShipType())

	GetImageSpriteFromAtlasAsync("shiptype", var_14_0, arg_14_0.rtName:Find("shiptype/Image"), true)
	setText(arg_14_0.rtName:Find("name"), arg_14_1:getName())
	setText(arg_14_0.rtName:Find("english"), string.upper(arg_14_1:getConfig("english_name")))
	setPaintingPrefabAsync(arg_14_0.rtPaint, arg_14_1:getPainting(), "huode")
end

function var_0_0.flush(arg_15_0)
	arg_15_0.iconList:align(#arg_15_0.ids)
end

function var_0_0.didEnter(arg_16_0)
	arg_16_0:flush()
end

function var_0_0.willExit(arg_17_0)
	arg_17_0.iconSprites = nil

	if arg_17_0.shipVO then
		retPaintingPrefab(arg_17_0.rtPaint, arg_17_0.shipVO:getPainting())
	end
end

return var_0_0
