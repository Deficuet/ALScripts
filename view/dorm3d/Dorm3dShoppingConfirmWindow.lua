local var_0_0 = class("Dorm3dShoppingConfirmWindow", import("view.base.BaseUI"))

var_0_0.SELECTED_WIDTH = 52
var_0_0.UNSELECTED_WIDTH = 12
var_0_0.LOOP_DURATION = 5

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dShopWindow"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes",
		"ui/shoptip_atlas"
	}
	local var_2_1 = (arg_2_1 or arg_2_0.contextData or {}).drop

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	local function var_2_3(arg_4_0)
		for iter_4_0, iter_4_1 in ipairs(arg_4_0 or {}) do
			var_2_2("dorm3dbanner/" .. iter_4_1)
		end
	end

	if var_2_1 then
		var_2_2(var_2_1:GetIcon())

		if var_2_1.__cname == "Dorm3dGift" then
			local var_2_4 = pg.dorm3d_gift[var_2_1.configId]

			if var_2_4 then
				for iter_2_0, iter_2_1 in ipairs(var_2_4.unlock_banners or {}) do
					var_2_3(iter_2_1[2])
				end
			end
		elseif var_2_1.__cname == "Dorm3dFurniture" then
			local var_2_5 = pg.dorm3d_furniture_template[var_2_1.configId]

			var_2_3(var_2_5 and var_2_5.unlock_banners)
		elseif var_2_1.__cname == "Dorm3dSkin" then
			local var_2_6 = pg.dorm3d_resource[var_2_1.configId]

			var_2_3(var_2_6 and var_2_6.unlock_banners)
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.init(arg_5_0)
	arg_5_0.previewTf = arg_5_0._tf:Find("Window/Preview")
	arg_5_0.bubbleContent = arg_5_0._tf:Find("Window/Bubbles/content")
	arg_5_0.bubbleTpl = arg_5_0._tf:Find("Window/Bubbles/tpl")
	arg_5_0.bubbleList = UIItemList.New(arg_5_0.bubbleContent, arg_5_0.bubbleTpl)
	arg_5_0.scrollSnap = BannerScrollRect4Dorm.New(arg_5_0._tf:Find("Window/banner/mask/content"), arg_5_0._tf:Find("Window/banner/dots"))

	setActive(arg_5_0.bubbleTpl, false)
	switch(arg_5_0.contextData.drop.__cname, {
		Dorm3dGift = function()
			arg_5_0.unlockTips = pg.dorm3d_gift[arg_5_0.contextData.drop.configId].unlock_tips or {}

			local var_6_0 = arg_5_0.contextData.groupId
			local var_6_1 = pg.dorm3d_gift[arg_5_0.contextData.drop.configId].unlock_banners or {}
			local var_6_2 = table.Find(var_6_1, function(arg_7_0, arg_7_1)
				if var_6_0 == nil or arg_7_1[1] == var_6_0 then
					return true
				end
			end) or table.Find(var_6_1, function(arg_8_0)
				if arg_8_0[1] == 0 then
					return true
				end
			end)

			arg_5_0.unlockBanners = var_6_2 and var_6_2[2]
			arg_5_0.isExclusive = pg.dorm3d_gift[arg_5_0.contextData.drop.configId].ship_group_id ~= 0
			arg_5_0.addFavor = pg.dorm3d_favor_trigger[pg.dorm3d_gift[arg_5_0.contextData.drop.configId].favor_trigger_id].num

			setActive(arg_5_0._tf:Find("Window/Title/gift"), true)
		end,
		Dorm3dFurniture = function()
			arg_5_0.unlockTips = pg.dorm3d_furniture_template[arg_5_0.contextData.drop.configId].unlock_tips or {}
			arg_5_0.unlockBanners = pg.dorm3d_furniture_template[arg_5_0.contextData.drop.configId].unlock_banners or {}
			arg_5_0.isExclusive = pg.dorm3d_furniture_template[arg_5_0.contextData.drop.configId].is_exclusive == 1
			arg_5_0.isSpecial = pg.dorm3d_furniture_template[arg_5_0.contextData.drop.configId].is_special == 1

			setActive(arg_5_0._tf:Find("Window/Title/furniture"), true)
		end,
		Dorm3dSkin = function()
			arg_5_0.unlockTips = pg.dorm3d_resource[arg_5_0.contextData.drop.configId].unlock_tips or {}
			arg_5_0.unlockBanners = pg.dorm3d_resource[arg_5_0.contextData.drop.configId].unlock_banners or {}

			setActive(arg_5_0._tf:Find("Window/Title/skin"), true)
		end
	})
end

function var_0_0.didEnter(arg_11_0)
	onButton(arg_11_0, arg_11_0._tf:Find("Window/Confirm"), function()
		local var_12_0 = arg_11_0.contextData.onYes

		arg_11_0:closeView()
		existCall(var_12_0)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0._tf:Find("Window/Cancel"), function()
		local var_13_0 = arg_11_0.contextData.onNo

		arg_11_0:closeView()
		existCall(var_13_0)
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0._tf:Find("Mask"), function()
		local var_14_0 = arg_11_0.contextData.onClose

		arg_11_0:closeView()
		existCall(var_14_0)
	end)
	arg_11_0:InitUIList()
	arg_11_0:InitDropIcon()
	arg_11_0:InitBanner()

	local var_11_0

	if arg_11_0.contextData.content.cost == 0 then
		var_11_0 = i18n("dorm3d_purchase_confirm_free", arg_11_0.contextData.content.icon, "x" .. arg_11_0.contextData.content.cost, arg_11_0.contextData.content.name)
	elseif arg_11_0.contextData.content.off > 0 then
		var_11_0 = i18n("dorm3d_purchase_confirm_discount", arg_11_0.contextData.content.icon, "x" .. arg_11_0.contextData.content.cost, arg_11_0.contextData.content.old, arg_11_0.contextData.content.name)
	else
		var_11_0 = i18n("dorm3d_purchase_confirm_original", arg_11_0.contextData.content.icon, "x" .. arg_11_0.contextData.content.cost, arg_11_0.contextData.content.name)
	end

	switch(arg_11_0.contextData.drop.__cname, {
		Dorm3dGift = function()
			local var_15_0 = arg_11_0.contextData.content.weekLimit

			if var_15_0 then
				var_11_0 = var_11_0 .. i18n("dorm3d_purchase_weekly_limit", var_15_0[1], var_15_0[2])
			end
		end,
		Dorm3dFurniture = function()
			local var_16_0 = arg_11_0.contextData.endTime

			if var_16_0 and var_16_0 > 0 then
				local function var_16_1(arg_17_0)
					local var_17_0 = pg.TimeMgr.GetInstance():GetServerTime()
					local var_17_1 = math.max(arg_17_0 - var_17_0, 0)
					local var_17_2 = math.floor(var_17_1 / 86400)

					if var_17_2 > 0 then
						return var_17_2 .. i18n("word_date")
					else
						local var_17_3 = math.floor(var_17_1 / 3600)

						if var_17_3 > 0 then
							return var_17_3 .. i18n("word_hour")
						else
							local var_17_4 = math.floor(var_17_1 / 60)

							if var_17_4 > 0 then
								return var_17_4 .. i18n("word_minute")
							else
								return var_17_1 .. i18n("word_second")
							end
						end
					end
				end

				local var_16_2 = var_11_0

				arg_11_0.timerRefreshTime = Timer.New(function()
					local var_18_0 = var_16_2 .. string.format("\n<size=28><color=#7c7e81>%s</color><color=#169fff>%s</color></size>", i18n("time_remaining_tip"), var_16_1(var_16_0))

					setText(arg_11_0._tf:Find("Window/Content"), var_18_0)
				end, 1, -1)

				arg_11_0.timerRefreshTime:Start()

				var_11_0 = var_11_0 .. string.format("\n<size=28><color=#7c7e81>%s</color><color=#169fff>%s</color></size>", i18n("time_remaining_tip"), var_16_1(var_16_0))
			end
		end
	})
	setText(arg_11_0._tf:Find("Window/Content"), var_11_0)
	setText(arg_11_0._tf:Find("Window/Confirm/Text"), i18n("msgbox_text_confirm"))
	setText(arg_11_0._tf:Find("Window/Cancel/Text"), i18n("msgbox_text_cancel"))
	pg.UIMgr.GetInstance():OverlayPanel(arg_11_0._tf)
end

function var_0_0.InitBanner(arg_19_0)
	for iter_19_0 = 1, #arg_19_0.unlockBanners do
		local var_19_0 = arg_19_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("dorm3dbanner/" .. arg_19_0.unlockBanners[iter_19_0], var_19_0)
	end

	arg_19_0.scrollSnap:SetUp()
end

function var_0_0.InitUIList(arg_20_0)
	arg_20_0.bubbleList:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventInit then
			local var_21_0 = arg_21_1 + 1
			local var_21_1 = arg_20_0.unlockTips[var_21_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_21_1, arg_21_2:Find("icon/icon"), true)
			setText(arg_21_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_21_1))
			setActive(arg_21_2:Find("bubble"), false)
			onToggle(arg_20_0, arg_21_2, function(arg_22_0)
				setActive(arg_21_2:Find("icon/select"), arg_22_0)
				setActive(arg_21_2:Find("icon/unselect"), not arg_22_0)
				setActive(arg_21_2:Find("bubble"), arg_22_0)
			end)
		end
	end)
	arg_20_0.bubbleList:align(#arg_20_0.unlockTips)
end

function var_0_0.InitDropIcon(arg_23_0)
	LoadImageSpriteAtlasAsync(arg_23_0.contextData.drop:GetIcon(), "", arg_23_0._tf:Find("Window/Item/Dorm3dIconTpl/icon"), true)
	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(arg_23_0.contextData.drop:GetRarity()), arg_23_0._tf:Find("Window/Item/Dorm3dIconTpl"))
	setActive(arg_23_0._tf:Find("Window/Item/sp"), arg_23_0.isExclusive or arg_23_0.isSpecial)

	if arg_23_0.isSpecial then
		setText(arg_23_0._tf:Find("Window/Item/sp/Text"), i18n("dorm3d_purchase_label_special"))
	elseif arg_23_0.isExclusive then
		setText(arg_23_0._tf:Find("Window/Item/sp/Text"), i18n("dorm3d_purchase_confirm_tip"))
	end

	if arg_23_0.addFavor then
		setActive(arg_23_0._tf:Find("Window/Item/gift"), true)
		setText(arg_23_0._tf:Find("Window/Item/gift/Text"), "+" .. arg_23_0.addFavor)
	end
end

function var_0_0.willExit(arg_24_0)
	if arg_24_0.timerRefreshTime then
		arg_24_0.timerRefreshTime:Stop()

		arg_24_0.timerRefreshTime = nil
	end

	arg_24_0.scrollSnap:Dispose()

	arg_24_0.scrollSnap = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_24_0._tf)
end

return var_0_0
