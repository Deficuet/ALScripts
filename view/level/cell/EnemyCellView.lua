local var_0_0 = class("EnemyCellView")

function var_0_0.Ctor(arg_1_0)
	arg_1_0._extraEffectList = {}
end

function var_0_0.SetPoolType(arg_2_0, arg_2_1)
	arg_2_0.poolType = arg_2_1
end

function var_0_0.GetPoolType(arg_3_0)
	return arg_3_0.poolType
end

function var_0_0.ClearExtraEffects(arg_4_0)
	for iter_4_0, iter_4_1 in pairs(arg_4_0._extraEffectList) do
		if not IsNil(iter_4_1) then
			Destroy(iter_4_1)
		end
	end

	table.clear(arg_4_0._extraEffectList)
end

function var_0_0.LoadExtraEffects(arg_5_0, arg_5_1)
	if arg_5_1 and #arg_5_1 > 0 then
		local var_5_0 = "effect/" .. arg_5_1

		arg_5_0:GetLoader():LoadPrefab(var_5_0, arg_5_1, function(arg_6_0)
			arg_5_0._extraEffectList[var_5_0] = arg_6_0

			local var_6_0 = arg_6_0.transform.localScale

			setParent(arg_6_0, arg_5_0.tf, false)

			arg_6_0.transform.localScale = var_6_0

			arg_5_0:ResetCanvasOrder()
		end)
	end
end

function var_0_0.RefreshEnemyTplIcons(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.tf:Find("random_buff_container")

	if not var_7_0 then
		return
	end

	local var_7_1 = {}

	if arg_7_1.icon_type == 1 then
		local var_7_2 = arg_7_1.type

		if ChapterConst.EnemySize[var_7_2] == 1 or not ChapterConst.EnemySize[var_7_2] then
			table.insert(var_7_1, "xiao")
		elseif ChapterConst.EnemySize[var_7_2] == 2 then
			table.insert(var_7_1, "zhong")
		elseif ChapterConst.EnemySize[var_7_2] == 3 then
			table.insert(var_7_1, "da")
		end
	end

	if arg_7_1.bufficon and #arg_7_1.bufficon > 0 then
		table.insertto(var_7_1, arg_7_1.bufficon)
	end

	underscore(arg_7_2:GetWeather(arg_7_0.line.row, arg_7_0.line.column)):chain():filter(function(arg_8_0)
		return arg_8_0 == ChapterConst.FlagWeatherFog
	end):each(function(arg_9_0)
		table.insert(var_7_1, pg.weather_data_template[arg_9_0].buff_icon)
	end)
	setActive(var_7_0, true)
	LevelGrid.AlignListContainer(var_7_0, #var_7_1)

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		if #iter_7_1 > 0 then
			local var_7_3 = var_7_0:GetChild(iter_7_0 - 1)

			arg_7_0:GetLoader():GetSpriteQuiet("ui/share/ship_gizmos_atlas", iter_7_1, var_7_3)
		end
	end
end

function var_0_0.Clear(arg_10_0)
	LevelCellView.Clear(arg_10_0)
	arg_10_0.ClearExtraEffects(arg_10_0)
end

return var_0_0
