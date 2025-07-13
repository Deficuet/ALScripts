local var_0_0 = class("RecordShipEquipmentCommand", pm.SimpleCommand)
local var_0_1 = {
	"#CFCFCF",
	"#9FECFF",
	"#B8CFF9",
	"#FDF3AA",
	"#8EA7EB"
}

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.shipId
	local var_1_2 = var_1_0.index
	local var_1_3 = var_1_0.type

	if not var_1_3 then
		return
	end

	if not var_1_1 then
		return
	end

	if not var_1_2 then
		return
	end

	local var_1_4 = getProxy(PlayerProxy):getData()
	local var_1_5 = getProxy(BayProxy)
	local var_1_6 = var_1_5:getShipById(var_1_1)

	var_1_6:getEquipmentRecord(var_1_4.id)

	local var_1_7 = Clone(var_1_6.equipments)
	local var_1_8 = var_1_6:GetSpWeaponRecord(var_1_4.id)

	if var_1_3 == 1 then
		for iter_1_0, iter_1_1 in ipairs(var_1_7) do
			var_1_6.equipmentRecords[var_1_2][iter_1_0] = iter_1_1 and iter_1_1.id or -1
		end

		var_1_6:setEquipmentRecord(var_1_4.id, var_1_6.equipmentRecords)

		if not LOCK_SP_WEAPON then
			var_1_8[var_1_2] = var_1_6:GetSpWeapon()

			var_1_6:SetSpWeaponRecord(var_1_4.id, var_1_8)
		end

		var_1_5:updateShip(var_1_6)
	elseif var_1_3 == 2 then
		local var_1_9 = getProxy(EquipmentProxy)
		local var_1_10 = Clone(var_1_6.equipmentRecords[var_1_2])
		local var_1_11 = var_1_8[var_1_2]

		if #var_1_10 == 0 or _.all(var_1_10, function(arg_2_0)
			return arg_2_0 == -1
		end) and var_1_11 == nil then
			return
		end

		local function var_1_12(arg_3_0, arg_3_1)
			if var_1_7[arg_3_0] and var_1_7[arg_3_0].id == arg_3_1 then
				return true
			end

			return false
		end

		local var_1_13 = {}

		for iter_1_2, iter_1_3 in ipairs(var_1_10) do
			if iter_1_3 ~= -1 then
				local var_1_14 = var_1_9:getEquipmentById(iter_1_3)

				if (not var_1_14 or var_1_14.count <= 0) and not var_1_12(iter_1_2, iter_1_3) then
					local var_1_15 = Equipment.New({
						id = iter_1_3
					})

					var_1_10[iter_1_2] = var_1_9:getSameTypeEquipmentId(var_1_15) or 0

					local var_1_16 = var_0_1[var_1_15.config.rarity - 1]
					local var_1_17 = string.format("<color=%s>%s+%s</color>", var_1_16, var_1_15.config.name, var_1_15.config.level - 1)

					table.insert(var_1_13, var_1_17)
				end
			end
		end

		local var_1_18 = var_1_6:GetSpWeapon()
		local var_1_19 = var_1_11 and var_1_11:GetConfigID() or 0
		local var_1_20 = var_1_18 and var_1_18:GetConfigID() or 0
		local var_1_21

		if var_1_11 and var_1_19 ~= var_1_20 then
			var_1_21 = var_1_9:GetSameTypeSpWeapon(var_1_11)

			if not var_1_21 or var_1_21:GetConfigID() ~= var_1_19 then
				local var_1_22 = var_0_1[var_1_11:GetRarity()]
				local var_1_23 = string.format("<color=%s>%s+%s</color>", var_1_22, var_1_11:GetName(), var_1_11:GetLevel() - 1)

				table.insert(var_1_13, var_1_23)
			end
		end

		local function var_1_24(arg_4_0)
			local var_4_0 = {}

			for iter_4_0, iter_4_1 in ipairs(arg_4_0) do
				if not var_1_7[iter_4_0] or var_1_7[iter_4_0].id ~= iter_4_1 then
					if iter_4_1 == 0 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("ship_quick_change_noequip"))
					elseif iter_4_1 == -1 and var_1_7[iter_4_0] then
						table.insert(var_4_0, function(arg_5_0)
							arg_1_0:sendNotification(GAME.UNEQUIP_FROM_SHIP, {
								shipId = var_1_1,
								pos = iter_4_0,
								callback = arg_5_0
							})
						end)
					elseif iter_4_1 ~= -1 then
						table.insert(var_4_0, function(arg_6_0)
							arg_1_0:sendNotification(GAME.EQUIP_TO_SHIP, {
								equipmentId = iter_4_1,
								shipId = var_1_1,
								pos = iter_4_0,
								callback = arg_6_0
							})
						end)
					end
				end
			end

			if not LOCK_SP_WEAPON then
				table.insert(var_4_0, function(arg_7_0)
					if var_1_11 then
						if var_1_19 ~= var_1_20 then
							if not var_1_21 then
								pg.TipsMgr.GetInstance():ShowTips(i18n("ship_quick_change_noequip"))

								return
							else
								arg_1_0:sendNotification(GAME.EQUIP_SPWEAPON_TO_SHIP, {
									spWeaponUid = var_1_21:GetUID(),
									shipId = var_1_1,
									callback = arg_7_0
								})

								return
							end
						end
					elseif var_1_18 then
						arg_1_0:sendNotification(GAME.EQUIP_SPWEAPON_TO_SHIP, {
							shipId = var_1_1,
							callback = arg_7_0
						})

						return
					end

					arg_7_0()
				end)
			end

			seriesAsync(var_4_0)
		end

		if #var_1_13 > 0 then
			local var_1_25 = ""

			if #var_1_13 > 2 then
				var_1_25 = table.concat(_.slice(var_1_13, 1, 2), "、") .. i18n("word_wait")
			else
				var_1_25 = table.concat(var_1_13, "、")
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("no_found_record_equipment", var_1_25),
				onYes = function()
					var_1_24(var_1_10)
				end
			})
		else
			var_1_24(var_1_10)
		end
	end

	arg_1_0:sendNotification(GAME.RECORD_SHIP_EQUIPMENT_DONE, {
		shipId = var_1_1,
		index = var_1_2,
		type = var_1_3
	})
end

return var_0_0
