local var_0_0 = class("BuildShipRegularExchangeLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BuildShipRegularExchangeUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"regularexchangeicon",
		"shiptype"
	}
	local var_2_1 = pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID]

	for iter_2_0, iter_2_1 in ipairs(var_2_1.exchange_ship_id or {}) do
		local var_2_2 = pg.ship_data_statistics[iter_2_1]
		local var_2_3 = var_2_2 and pg.ship_skin_template[var_2_2.skin_id]

		if var_2_3 and noEmptyStr(var_2_3.painting) then
			table.insertto(var_2_0, ResPathSupport.GetPaintingListByPaintingName(var_2_3.painting))
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.preload(arg_3_0, arg_3_1)
	arg_3_0.cfg = pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID]
	arg_3_0.ids = arg_3_0.cfg.exchange_ship_id
	arg_3_0.iconSprites = {}

	AssetBundleHelper.LoadManyAssets("RegularExchangeIcon", underscore.map(arg_3_0.ids, function(arg_4_0)
		return tostring(arg_4_0)
	end), typeof(Sprite), true, function(arg_5_0)
		for iter_5_0, iter_5_1 in pairs(arg_5_0) do
			arg_3_0.iconSprites[tonumber(iter_5_0)] = iter_5_1
		end

		existCall(arg_3_1)
	end, true)
end

function var_0_0.setCount(arg_6_0, arg_6_1)
	arg_6_0.count = arg_6_1

	setText(arg_6_0.textCount, arg_6_0.count .. "/" .. arg_6_0.cfg.exchange_request)
	setGray(arg_6_0.btnConfirm, arg_6_0.count < arg_6_0.cfg.exchange_request)
end

function var_0_0.init(arg_7_0)
	arg_7_0.btnBack = arg_7_0._tf:Find("top/bg/btn_back")

	onButton(arg_7_0, arg_7_0.btnBack, function()
		arg_7_0:closeView()
	end, SFX_CANCEL)

	local var_7_0 = arg_7_0._tf:Find("select/view/container")

	arg_7_0.iconList = UIItemList.New(var_7_0, var_7_0:Find("tpl"))

	arg_7_0.iconList:make(function(arg_9_0, arg_9_1, arg_9_2)
		arg_9_1 = arg_9_1 + 1

		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = Ship.New({
				configId = arg_7_0.ids[arg_9_1]
			})

			setImageSprite(arg_9_2:Find("Image"), arg_7_0.iconSprites[var_9_0.configId], true)
			setActive(arg_9_2:Find("noget"), not getProxy(CollectionProxy):getShipGroup(var_9_0:getGroupId()))
			onToggle(arg_7_0, arg_9_2, function(arg_10_0)
				if arg_10_0 then
					arg_7_0:setSelectedShip(var_9_0)
				end
			end, SFX_PANEL)
			triggerToggle(arg_9_2, arg_9_1 == 1)
		end
	end)
	onButton(arg_7_0, arg_7_0._tf:Find("select/operation/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("Normalbuild_URexchange_help")
		})
	end, SFX_PANEL)
	setText(arg_7_0._tf:Find("select/operation/count/Text"), i18n("Normalbuild_URexchange_text2") .. ":")

	arg_7_0.textCount = arg_7_0._tf:Find("select/operation/count/num")
	arg_7_0.btnConfirm = arg_7_0._tf:Find("select/operation/confirm")

	onButton(arg_7_0, arg_7_0.btnConfirm, function()
		if arg_7_0.count < arg_7_0.cfg.exchange_request then
			pg.TipsMgr.GetInstance():ShowTips(i18n("Normalbuild_URexchange_warning1"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("Normalbuild_URexchange_confirm", arg_7_0.shipVO:getName()),
				onYes = function()
					arg_7_0:emit(BuildShipRegularExchangeMediator.EXCHAGNE_SHIP, arg_7_0.shipVO.configId)
					arg_7_0:closeView()
				end
			})
		end
	end, SFX_CONFIRM)

	arg_7_0.rtName = arg_7_0._tf:Find("select/name_bg")
	arg_7_0.rtPaint = arg_7_0._tf:Find("main/paint")

	arg_7_0:OverlayPanel(arg_7_0._tf)
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
	mergeSort(arg_15_0.ids, CompareFuncs({
		function(arg_16_0)
			local var_16_0 = Ship.New({
				configId = arg_16_0
			})

			return getProxy(CollectionProxy):getShipGroup(var_16_0:getGroupId()) and 1 or 0
		end
	}, true))
	arg_15_0.iconList:align(#arg_15_0.ids)
end

function var_0_0.didEnter(arg_17_0)
	arg_17_0:flush()
end

function var_0_0.willExit(arg_18_0)
	arg_18_0.iconSprites = nil

	if arg_18_0.shipVO then
		retPaintingPrefab(arg_18_0.rtPaint, arg_18_0.shipVO:getPainting())
	end

	arg_18_0:UnOverlayPanel(arg_18_0._tf)
end

return var_0_0
