local var_0_0 = class("Dorm3dRoomUnlockWindow", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dRoomUnlockWindow"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = arg_2_1 or arg_2_0.contextData or {}

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	local var_2_3 = var_2_1.roomId and ApartmentRoom.New({
		id = var_2_1.roomId
	})

	if var_2_1.groupId then
		var_2_2("ui/shoptip_atlas")

		local var_2_4 = var_2_3 and Apartment.getGroupConfig(var_2_1.groupId, var_2_3:getConfig("invite_banner")) or {}

		for iter_2_0, iter_2_1 in ipairs(var_2_4) do
			var_2_2("dorm3dbanner/" .. iter_2_1)
		end
	elseif var_2_3 then
		var_2_2("dorm3dbanner/" .. string.lower(var_2_3:getConfig("assets_prefix")))
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.init(arg_4_0)
	arg_4_0.bubbleContent = arg_4_0._tf:Find("Window/Bubbles/content")
	arg_4_0.bubbleTpl = arg_4_0._tf:Find("Window/Bubbles/tpl")
	arg_4_0.bubbleList = UIItemList.New(arg_4_0.bubbleContent, arg_4_0.bubbleTpl)
	arg_4_0.scrollSnap = BannerScrollRect4Dorm.New(arg_4_0._tf:Find("Window/banner/mask/content"), arg_4_0._tf:Find("Window/banner/dots"))

	setActive(arg_4_0.bubbleTpl, false)
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("Window/Confirm"), function()
		if arg_5_0.contextData.groupId then
			arg_5_0:emit(Dorm3dRoomUnlockWindowMediator.ON_UNLOCK_ROOM_INVITE, arg_5_0.contextData.roomId, arg_5_0.contextData.groupId)
		else
			arg_5_0:emit(Dorm3dRoomUnlockWindowMediator.ON_UNLOCK_DORM_ROOM, arg_5_0.contextData.roomId)
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Window/Cancel"), function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._tf:Find("bg"), function()
		arg_5_0:closeView()
	end)
	setActive(arg_5_0._tf:Find("Window/Title/unlock"), not arg_5_0.contextData.groupId)
	setActive(arg_5_0._tf:Find("Window/Title/invite"), arg_5_0.contextData.groupId)

	if arg_5_0.contextData.groupId then
		local var_5_0 = getProxy(ApartmentProxy):getRoom(arg_5_0.contextData.roomId)
		local var_5_1 = Apartment.getGroupConfig(arg_5_0.contextData.groupId, var_5_0:getConfig("invite_cost"))
		local var_5_2 = CommonCommodity.New({
			id = var_5_1
		}, Goods.TYPE_SHOPSTREET)
		local var_5_3, var_5_4, var_5_5 = var_5_2:GetPrice()
		local var_5_6 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_5_2:GetResType(),
			count = var_5_3
		})

		if var_5_6.count == 0 then
			setText(arg_5_0._tf:Find("Window/Content"), i18n("dorm3d_invite_confirm_free", "<icon name=" .. var_5_2:GetResIcon() .. " w=1.1 h=1.1/>", var_5_5, ShipGroup.getDefaultShipNameByGroupID(arg_5_0.contextData.groupId), var_5_0:getConfig("room")))
		elseif var_5_4 > 0 then
			setText(arg_5_0._tf:Find("Window/Content"), i18n("dorm3d_invite_confirm_discount", "<icon name=" .. var_5_2:GetResIcon() .. " w=1.1 h=1.1/>", var_5_6.count, var_5_5, ShipGroup.getDefaultShipNameByGroupID(arg_5_0.contextData.groupId), var_5_0:getConfig("room")))
		else
			setText(arg_5_0._tf:Find("Window/Content"), i18n("dorm3d_invite_confirm_original", "<icon name=" .. var_5_2:GetResIcon() .. " w=1.1 h=1.1/>", var_5_6.count, ShipGroup.getDefaultShipNameByGroupID(arg_5_0.contextData.groupId), var_5_0:getConfig("room")))
		end

		setText(arg_5_0._tf:Find("Window/Download"), "")
		setActive(arg_5_0._tf:Find("Window/Preview"), false)

		arg_5_0.bannerConfig = Apartment.getGroupConfig(arg_5_0.contextData.groupId, var_5_0:getConfig("invite_banner"))
		arg_5_0.markConfig = Apartment.getGroupConfig(arg_5_0.contextData.groupId, var_5_0:getConfig("invite_mark"))

		arg_5_0:InitBanner()
		arg_5_0:InitUIList()
	else
		local var_5_7 = ApartmentRoom.New({
			id = arg_5_0.contextData.roomId
		})

		setText(arg_5_0._tf:Find("Window/Content"), i18n("dorm3d_beach_buy", table.concat(underscore.map(var_5_7:getConfig("unlock_item"), function(arg_9_0)
			local var_9_0 = Drop.Create(arg_9_0)

			return string.format("%s*%d", var_9_0:getName(), var_9_0.count)
		end)), var_5_7:getConfig("room")))

		if var_5_7:needDownload() then
			local var_5_8, var_5_9 = var_5_7:getDownloadNeedSize()

			setText(arg_5_0._tf:Find("Window/Download"), i18n("dorm3d_beach_download", var_5_9))
		else
			setText(arg_5_0._tf:Find("Window/Download"), "")
		end

		GetImageSpriteFromAtlasAsync("dorm3dbanner/" .. string.lower(var_5_7:getConfig("assets_prefix")), "", arg_5_0._tf:Find("Window/Preview/Image"))
	end

	setText(arg_5_0._tf:Find("Window/Confirm/Text"), i18n("msgbox_text_confirm"))
	setText(arg_5_0._tf:Find("Window/Cancel/Text"), i18n("msgbox_text_cancel"))
	pg.UIMgr.GetInstance():OverlayPanel(arg_5_0._tf)
end

function var_0_0.InitBanner(arg_10_0)
	for iter_10_0 = 1, #arg_10_0.bannerConfig do
		local var_10_0 = arg_10_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("dorm3dbanner/" .. arg_10_0.bannerConfig[iter_10_0], var_10_0)
	end

	arg_10_0.scrollSnap:SetUp()
end

function var_0_0.InitUIList(arg_11_0)
	arg_11_0.bubbleList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventInit then
			local var_12_0 = arg_12_1 + 1
			local var_12_1 = arg_11_0.markConfig[var_12_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_12_1, arg_12_2:Find("icon/icon"), true)
			setText(arg_12_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_12_1))
			setActive(arg_12_2:Find("bubble"), false)
			onToggle(arg_11_0, arg_12_2, function(arg_13_0)
				setActive(arg_12_2:Find("icon/select"), arg_13_0)
				setActive(arg_12_2:Find("icon/unselect"), not arg_13_0)
				setActive(arg_12_2:Find("bubble"), arg_13_0)
			end)
		end
	end)
	arg_11_0.bubbleList:align(#arg_11_0.markConfig)
end

function var_0_0.willExit(arg_14_0)
	arg_14_0.scrollSnap:Dispose()

	arg_14_0.scrollSnap = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_14_0._tf)
end

return var_0_0
