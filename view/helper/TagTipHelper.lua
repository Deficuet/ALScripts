local var_0_0 = class("TagTipHelper")

function var_0_0.FuDaiTagTip(arg_1_0)
	triggerToggle(arg_1_0, false)

	local var_1_0 = {}
	local var_1_1 = pg.pay_data_display

	for iter_1_0, iter_1_1 in ipairs(var_1_1.all) do
		if var_1_1[iter_1_1].type == 1 and pg.TimeMgr.GetInstance():inTime(var_1_1[iter_1_1].time) and type(var_1_1[iter_1_1].time) == "table" then
			table.insert(var_1_0, var_1_1[iter_1_1])
		end
	end

	if #var_1_0 > 0 then
		local function var_1_2(arg_2_0)
			table.sort(var_1_0, function(arg_3_0, arg_3_1)
				return pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_3_0.time[1]) > pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_3_1.time[1])
			end)

			local var_2_0 = var_1_0[1]
			local var_2_1 = arg_2_0[var_2_0.id] ~= nil
			local var_2_2 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_2_0.time[1])
			local var_2_3 = PlayerPrefs.GetInt("Ever_Enter_Mall_", 0)

			if not var_2_1 and var_2_3 < var_2_2 then
				var_0_0.FudaiTime = var_2_2

				triggerToggle(arg_1_0, true)
			end
		end

		local var_1_3 = getProxy(ShopsProxy)
		local var_1_4 = var_1_3:getChargedList()

		if not var_1_4 then
			pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
				callback = function()
					var_1_4 = var_1_3:getChargedList()

					var_1_2(var_1_4)
				end
			})
		else
			var_1_2(var_1_4)
		end
	end
end

function var_0_0.SetFuDaiTagMark()
	if var_0_0.FudaiTime then
		PlayerPrefs.SetInt("Ever_Enter_Mall_", var_0_0.FudaiTime)
		PlayerPrefs.Save()

		var_0_0.FudaiTime = nil
	end
end

function var_0_0.SkinTagTip(arg_6_0)
	triggerToggle(arg_6_0, false)

	local var_6_0 = getProxy(ShipSkinProxy):GetAllSkins()
	local var_6_1 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		if iter_6_1.type == Goods.TYPE_SKIN and type(iter_6_1:getConfig("time")) == "table" and iter_6_1.genre ~= ShopArgs.SkinShopTimeLimit then
			table.insert(var_6_1, pg.TimeMgr.GetInstance():parseTimeFromConfig(iter_6_1:getConfig("time")[1]))
		end
	end

	if #var_6_1 > 0 then
		table.sort(var_6_1, function(arg_7_0, arg_7_1)
			return arg_7_1 < arg_7_0
		end)

		local var_6_2 = var_6_1[1]
		local var_6_3 = var_6_2 > PlayerPrefs.GetInt("Ever_Enter_Skin_Shop_", 0)

		if var_6_3 then
			var_0_0.SkinTime = var_6_2
		end

		triggerToggle(arg_6_0, var_6_3)
	end
end

function var_0_0.SetSkinTagMark()
	if var_0_0.SkinTime then
		PlayerPrefs.SetInt("Ever_Enter_Skin_Shop_", var_0_0.SkinTime)
		PlayerPrefs.Save()

		var_0_0.SkinTime = nil
	end
end

function var_0_0.MonthCardTagTip(arg_9_0)
	local var_9_0 = MonthCardOutDateTipPanel.GetShowMonthCardTag()

	triggerToggle(arg_9_0, var_9_0)
end

function var_0_0.GiftPackagesTag(arg_10_0)
	getProxy(ShopsProxy):GiftPackageRedDotTip(arg_10_0, nil)
end

function var_0_0.FreeGiftTag(arg_11_0)
	local var_11_0 = getProxy(ShopsProxy)

	if not var_11_0:getChargedList() then
		pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
			callback = function()
				if _.all(arg_11_0, function(arg_13_0)
					return not IsNil(arg_13_0)
				end) then
					for iter_12_0, iter_12_1 in ipairs(arg_11_0) do
						setActive(iter_12_1, var_11_0:checkHasFreeNormal())
					end
				end
			end
		})
	else
		for iter_11_0, iter_11_1 in ipairs(arg_11_0) do
			setActive(iter_11_1, var_11_0:checkHasFreeNormal())
		end
	end
end

function var_0_0.FreeBuildTicketTip(arg_14_0, arg_14_1)
	local var_14_0 = getProxy(ActivityProxy):IsShowFreeBuildMark(false)

	if var_14_0 then
		setActive(arg_14_0, true)
		LoadImageSpriteAtlasAsync(Drop.New({
			type = DROP_TYPE_VITEM,
			id = var_14_0:getConfig("config_client")[1]
		}):getIcon(), "", arg_14_0:Find("Image"))

		local var_14_1 = tostring(var_14_0.data1)

		if var_14_0.data1 < 10 then
			var_14_1 = var_14_1 .. " "
		end

		setText(arg_14_0:Find("Text"), i18n("build_ticket_expire_warning", var_14_1))

		var_0_0.BuildMark = true
	else
		setActive(arg_14_0, false)
	end
end

function var_0_0.TecShipGiftTip(arg_15_0)
	local var_15_0 = {
		2001,
		2002,
		2003,
		2004,
		2005,
		2006,
		2007,
		2008
	}
	local var_15_1 = 30 <= getProxy(PlayerProxy):getData().level
	local var_15_2 = PlayerPrefs.GetInt("Tec_Ship_Gift_Enter_Tag", 0) > 0
	local var_15_3 = false

	for iter_15_0, iter_15_1 in ipairs(pg.pay_data_display.all) do
		if table.contains(var_15_0, iter_15_1) then
			var_15_3 = true

			break
		end
	end

	if var_15_3 and var_15_1 and not var_15_2 then
		triggerToggle(arg_15_0, true)
	else
		triggerToggle(arg_15_0, false)
	end
end

function var_0_0.SetFreeBuildMark()
	if var_0_0.BuildMark then
		local var_16_0 = getProxy(ActivityProxy):IsShowFreeBuildMark(false)

		if var_16_0 then
			PlayerPrefs.SetString("Free_Build_Ticket_" .. var_16_0.id, pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))
			PlayerPrefs.Save()
		end

		var_0_0.BuildMark = nil
	end
end

return var_0_0
