local var_0_0 = class("GuildShipEquipmentsPage", import("....base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "GuildShipEquipmentsPage"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"shiptype",
		"weaponframes",
		"ui/iconcolorful"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.getEquipmentResList(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = arg_3_1 and arg_3_1:getActiveEquipments() or {}

	_.each(var_3_1, function(arg_4_0)
		if arg_4_0 then
			local var_4_0 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Equipment.Equip, arg_4_0:getConfig("icon"))

			table.insert(var_3_0, var_4_0)
		end
	end)

	return var_3_0
end

function var_0_0.OnLoaded(arg_5_0)
	arg_5_0.shipNameTxt = arg_5_0._tf:Find("frame/ship_info/shipname"):GetComponent(typeof(Text))
	arg_5_0.userNameTxt = arg_5_0._tf:Find("frame/ship_info/username"):GetComponent(typeof(Text))
	arg_5_0.shipTypeIcon = arg_5_0._tf:Find("frame/ship_info/ship_type"):GetComponent(typeof(Image))
	arg_5_0.shipStarList = UIItemList.New(arg_5_0._tf:Find("frame/ship_info/stars"), arg_5_0._tf:Find("frame/ship_info/stars/star_tpl"))
	arg_5_0.shipLvTxt = arg_5_0._tf:Find("frame/ship_info/lv/Text"):GetComponent(typeof(Text))
	arg_5_0.equipmentList = UIItemList.New(arg_5_0._tf:Find("frame/equipemtns"), arg_5_0._tf:Find("frame/equipemtns/equipment_tpl"))
	arg_5_0.playerId = getProxy(PlayerProxy):getRawData().id
	arg_5_0.nextBtn = arg_5_0._tf:Find("frame/next")
	arg_5_0.prevBtn = arg_5_0._tf:Find("frame/prev")
end

function var_0_0.OnInit(arg_6_0)
	onButton(arg_6_0, arg_6_0._tf, function()
		arg_6_0:Hide()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.nextBtn, function()
		if arg_6_0.onNext then
			arg_6_0.onNext()
		end
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.prevBtn, function()
		if arg_6_0.onPrev then
			arg_6_0.onPrev()
		end
	end, SFX_PANEL)
end

function var_0_0.SetCallBack(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.onPrev = arg_10_1
	arg_10_0.onNext = arg_10_2
end

function var_0_0.downloadEquipmentResList(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0:getEquipmentResList(arg_11_1)

	SplitPackConst.DownloadByLuaArr(var_11_0, function()
		if arg_11_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_11_2()
	end)
end

function var_0_0.Show(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	arg_13_0:downloadEquipmentResList(arg_13_1, function()
		var_0_0.super.Show(arg_13_0)

		arg_13_0.OnHide = arg_13_3

		if arg_13_4 then
			arg_13_4()
		end

		arg_13_0:Flush(arg_13_1, arg_13_2)
		pg.UIMgr.GetInstance():BlurPanel(arg_13_0._tf)
		setActive(arg_13_0.nextBtn, arg_13_0.onNext ~= nil)
		SetActive(arg_13_0.prevBtn, arg_13_0.onPrev ~= nil)
	end)
end

function var_0_0.Flush(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.ship = arg_15_1
	arg_15_0.member = arg_15_2

	arg_15_0:UpdateShipInfo()
	arg_15_0:UpdateEquipments()
end

function var_0_0.Refresh(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0:downloadEquipmentResList(arg_16_1, function()
		arg_16_0:Flush(arg_16_1, arg_16_2)
	end)
end

function var_0_0.UpdateShipInfo(arg_18_0)
	local var_18_0 = arg_18_0.ship
	local var_18_1 = arg_18_0.member

	arg_18_0.shipNameTxt.text = var_18_0:getName()

	local var_18_2 = arg_18_0.playerId == var_18_1.id and "" or i18n("guild_ship_from") .. var_18_1.name

	arg_18_0.userNameTxt.text = var_18_2

	local var_18_3 = pg.ship_data_statistics[var_18_0.configId]

	arg_18_0.shipTypeIcon.sprite = GetSpriteFromAtlas("shiptype", shipType2print(var_18_3.type))

	local var_18_4 = var_18_0:getMaxStar()
	local var_18_5 = var_18_0:getStar()

	arg_18_0.shipStarList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			setActive(arg_19_2:Find("star_tpl"), arg_19_1 <= var_18_5)
		end
	end)
	arg_18_0.shipStarList:align(var_18_4)

	arg_18_0.shipLvTxt.text = var_18_0.level
end

function var_0_0.UpdateEquipments(arg_20_0)
	local var_20_0 = arg_20_0.ship:getActiveEquipments()

	arg_20_0.equipmentList:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = var_20_0[arg_21_1 + 1]

			setActive(arg_21_2:Find("info"), var_21_0)
			setActive(arg_21_2:Find("empty"), not var_21_0)

			if var_21_0 then
				updateEquipment(arg_21_2:Find("info"), var_21_0)
				setText(arg_21_2:Find("info/name_bg/Text"), shortenString(var_21_0:getConfig("name"), 5))
			end
		end
	end)
	arg_20_0.equipmentList:align(5)
end

function var_0_0.Hide(arg_22_0)
	var_0_0.super.Hide(arg_22_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_22_0._tf, arg_22_0._parentTf)

	if arg_22_0.OnHide then
		arg_22_0.OnHide()

		arg_22_0.OnHide = nil
	end
end

function var_0_0.OnDestroy(arg_23_0)
	arg_23_0:Hide()
end

return var_0_0
