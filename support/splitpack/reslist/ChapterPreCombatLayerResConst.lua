ResList = ResList or {}
ResList.ChapterPreCombatLayerResConst = {}

local var_0_0 = ResList.ChapterPreCombatLayerResConst

function var_0_0.GetConstResource()
	return {
		"energy",
		"shiptype",
		"weaponframes",
		"ui/iconcolorful",
		"ui/msgbox"
	}
end

function var_0_0.GetShipResList(arg_2_0)
	local var_2_0 = {}

	if not arg_2_0 then
		return var_2_0
	end

	local var_2_1 = arg_2_0:getPainting()

	if noEmptyStr(var_2_1) then
		table.insertto(var_2_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(var_2_1))
	end

	local var_2_2 = arg_2_0:getPrefab()

	if noEmptyStr(var_2_2) then
		table.insertto(var_2_0, ResPathSupport.GetSpineCharListByPrefabName(var_2_2))
	end

	if arg_2_0.equipments then
		for iter_2_0, iter_2_1 in pairs(arg_2_0:getAttachmentPrefab()) do
			local var_2_3 = iter_2_1.config[SpineRole.ORBIT_KEY_UI]

			if noEmptyStr(var_2_3) then
				table.insert(var_2_0, ResPathSupport.CombinePath("orbit", var_2_3))
			end
		end
	end

	return var_2_0
end

function var_0_0.GetDropResList(arg_3_0)
	local var_3_0 = {
		"weaponframes",
		"ui/iconcolorful"
	}

	Drop.Change(arg_3_0)

	if arg_3_0.type == DROP_TYPE_RESOURCE then
		table.insertto(var_3_0, var_0_0.GetDropResList({
			type = DROP_TYPE_ITEM,
			id = id2ItemId(arg_3_0.id),
			count = arg_3_0.count
		}))
	elseif arg_3_0.type == DROP_TYPE_ITEM or arg_3_0.type == DROP_TYPE_VITEM or arg_3_0.type == DROP_TYPE_META_PT or arg_3_0.type == DROP_TYPE_LOVE_LETTER then
		local var_3_1 = arg_3_0:getSubClass()
		local var_3_2 = var_3_1.icon or var_3_1:getConfig("icon")

		if var_3_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
			local var_3_3 = ShipGroup.getDefaultSkin(var_3_1.extra)

			if var_3_3 and noEmptyStr(var_3_3.painting) then
				table.insertto(var_3_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(var_3_3.painting))
			end

			var_3_2 = nil
		end

		if noEmptyStr(var_3_2) then
			table.insert(var_3_0, var_3_2)
		end
	elseif arg_3_0.type == DROP_TYPE_EQUIP then
		local var_3_4 = arg_3_0:getSubClass()

		table.insert(var_3_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.Equipment.Equip, var_3_4:getConfig("icon")))
	elseif arg_3_0.type == DROP_TYPE_SHIP or arg_3_0.type == DROP_TYPE_OPERATION then
		table.insertto(var_3_0, var_0_0.GetShipResList(arg_3_0.ship))
	elseif arg_3_0.type == DROP_TYPE_SKIN or arg_3_0.type == DROP_TYPE_SKIN_TIMELIMIT then
		table.insertto(var_3_0, var_0_0.GetShipResList(Ship.New({
			configId = tonumber(arg_3_0:getConfig("ship_group") .. "1"),
			skin_id = arg_3_0.id
		})))
	elseif arg_3_0.type == DROP_TYPE_FURNITURE then
		table.insert(var_3_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.FurnitureIcon, arg_3_0:getIcon()))
	elseif arg_3_0.type == DROP_TYPE_STRATEGY then
		table.insert(var_3_0, ResPathSupport.CombinePath(arg_3_0.isWorldBuff and "world/buff" or ResPathSupport.ConstPath.StrategyIcon, arg_3_0:getIcon()))
	elseif arg_3_0.type == DROP_TYPE_EQUIPMENT_SKIN then
		table.insert(var_3_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.Equipment.Equip, arg_3_0:getConfig("icon")))
	elseif arg_3_0.type == DROP_TYPE_SPWEAPON then
		local var_3_5 = SpWeapon.New({
			id = arg_3_0.id
		})

		table.insert(var_3_0, var_3_5:GetIconPath())
	else
		local var_3_6 = arg_3_0:getIcon()

		if noEmptyStr(var_3_6) then
			table.insert(var_3_0, var_3_6)
		end
	end

	return var_3_0
end

function var_0_0.GetStageDropResList(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = pg.expedition_data_template[arg_4_0]

	if not var_4_1 then
		return var_4_0
	end

	local var_4_2 = Clone(var_4_1.award_display)
	local var_4_3 = checkExist(pg.expedition_activity_template[arg_4_0], {
		"pt_drop_display"
	})

	if var_4_3 and type(var_4_3) == "table" then
		local var_4_4 = getProxy(ActivityProxy)

		for iter_4_0 = #var_4_3, 1, -1 do
			local var_4_5 = var_4_4:getActivityById(var_4_3[iter_4_0][1])

			if var_4_5 and not var_4_5:isEnd() then
				table.insert(var_4_2, 1, {
					2,
					id2ItemId(var_4_3[iter_4_0][2])
				})
			end
		end
	end

	for iter_4_1 = 1, math.min(#var_4_2, 6) do
		local var_4_6 = var_4_2[iter_4_1]

		table.insertto(var_4_0, var_0_0.GetDropResList({
			type = var_4_6[1],
			id = var_4_6[2],
			count = var_4_6[3]
		}))
	end

	return var_4_0
end

function var_0_0.GetBattleFleetResList(arg_5_0)
	local var_5_0 = {}

	local function var_5_1(arg_6_0)
		for iter_6_0, iter_6_1 in ipairs(arg_6_0) do
			table.insertto(var_5_0, var_0_0.GetShipResList(iter_6_1))
		end
	end

	var_5_1(arg_5_0:getShipsByTeam(TeamType.Main, true))
	var_5_1(arg_5_0:getShipsByTeam(TeamType.Vanguard, true))

	return var_5_0
end

function var_0_0.GetStrategyResList(arg_7_0)
	local var_7_0 = {}
	local var_7_1 = arg_7_0:getStrategies()
	local var_7_2 = _.detect(var_7_1, function(arg_8_0)
		return arg_8_0.id == ChapterConst.StrategyRepair
	end)

	if var_7_2 then
		local var_7_3 = pg.strategy_data_template[var_7_2.id]

		if var_7_3 and noEmptyStr(var_7_3.icon) then
			table.insert(var_7_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_7_3.icon))
		end
	end

	local var_7_4 = arg_7_0:getFormationStg()
	local var_7_5 = pg.strategy_data_template[var_7_4]

	if var_7_5 and noEmptyStr(var_7_5.icon) then
		table.insert(var_7_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_7_5.icon))
	end

	return var_7_0
end

function var_0_0.GetExtraCostBuffResList(arg_9_0)
	local var_9_0 = {}
	local var_9_1, var_9_2 = arg_9_0:GetExtraCostRate()

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		if iter_9_1.benefit_type == Chapter.OPERATION_BUFF_TYPE_DESC then
			local var_9_3 = ActivityBuff.GetBenefitCondition(iter_9_1.benefit_condition)

			if var_9_3[1] == "item" then
				table.insertto(var_9_0, var_0_0.GetDropResList({
					count = 1,
					type = DROP_TYPE_ITEM,
					id = var_9_3[2]
				}))
			end
		end
	end

	return var_9_0
end

function var_0_0.GetResource(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = arg_10_0.fleet
	local var_10_2 = arg_10_0:getStageId(var_10_1.line.row, var_10_1.line.column)

	table.insertto(var_10_0, var_0_0.GetStageDropResList(var_10_2))
	table.insertto(var_10_0, var_0_0.GetBattleFleetResList(var_10_1))
	table.insertto(var_10_0, var_0_0.GetStrategyResList(var_10_1))
	table.insertto(var_10_0, var_0_0.GetExtraCostBuffResList(arg_10_0))

	return var_10_0
end

return var_0_0
