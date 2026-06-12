local var_0_0 = class("BackYardShipCard", import(".BackYardBaseCard"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.info = BackYardFormationCard.New(arg_1_0._go)

	onButton(arg_1_0, arg_1_0._content, function()
		arg_1_0:emit(NewBackYardShipInfoMediator.OPEN_CHUANWU, arg_1_0.type, arg_1_0.ship)
	end, SFX_PANEL)

	arg_1_0.press = GetOrAddComponent(arg_1_0._content, typeof(UILongPressTrigger))

	arg_1_0.press.onLongPressed:RemoveAllListeners()
	arg_1_0.press.onLongPressed:AddListener(function()
		if not arg_1_0.ship then
			return
		end

		arg_1_0:emit(NewBackYardShipInfoMediator.LOOG_PRESS_SHIP, arg_1_0.type, arg_1_0.ship)
	end)
end

function var_0_0.OnFlush(arg_4_0)
	local var_4_0 = arg_4_0.ship
	local var_4_1 = arg_4_0.info

	if not arg_4_0.targteShipId or arg_4_0.targteShipId ~= var_4_0.id then
		var_4_1:update(var_4_0)

		arg_4_0.targteShipId = var_4_0.id
	end

	local var_4_2 = var_4_0:getLevelExpConfig()
	local var_4_3 = arg_4_0:CalcShipAddExpSpeed()
	local var_4_4 = {}
	local var_4_5 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_HOTSPRING)

	table.Foreach(var_4_5, function(arg_5_0, arg_5_1)
		if arg_5_1 and not arg_5_1:isEnd() then
			local var_5_0 = arg_5_1:getConfig("config_data")[1][4]

			_.each(arg_5_1:getData1List(), function(arg_6_0)
				var_4_4[arg_6_0] = (var_4_4[arg_6_0] or 0) + var_5_0
			end)
		end
	end)

	local var_4_6 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_HOTSPRING_2)

	table.Foreach(var_4_6, function(arg_7_0, arg_7_1)
		if arg_7_1 and not arg_7_1:isEnd() then
			local var_7_0 = arg_7_1:getConfig("config_data")[1]

			_.each(arg_7_1:getData1List(), function(arg_8_0)
				var_4_4[arg_8_0] = (var_4_4[arg_8_0] or 0) + var_7_0
			end)
		end
	end)

	local var_4_7 = 0
	local var_4_8 = 0

	for iter_4_0, iter_4_1 in ipairs(BuffHelper.GetBackYardEnergyBuffs()) do
		var_4_8 = var_4_8 + tonumber(iter_4_1:getConfig("benefit_effect"))
	end

	if arg_4_0.type == DormShip.FLOOR_1 then
		local var_4_9 = var_4_0:getRecoverEnergyPoint() + Ship.BACKYARD_1F_ENERGY_ADDITION + (var_4_4[var_4_0.id] or 0)

		var_4_1:updateProps({
			{
				i18n("word_lv"),
				var_4_0.level
			},
			{
				i18n("word_next_level"),
				math.max(var_4_2.exp - var_4_0.exp, 0)
			},
			{
				i18n("word_exp_chinese") .. i18n("word_get"),
				var_4_3
			},
			{
				i18n("word_nowenergy"),
				var_4_0.energy
			},
			{
				i18n("word_energy_recov_speed"),
				10 * var_4_9 .. (var_4_8 > 0 and setColorStr("+" .. 10 * var_4_8, COLOR_GREEN) or "") .. "/h"
			}
		})
	elseif arg_4_0.type == DormShip.FLOOR_2 then
		local var_4_10 = var_4_0:getRecoverEnergyPoint() + Ship.BACKYARD_2F_ENERGY_ADDITION + (var_4_4[var_4_0.id] or 0)

		var_4_1:updateProps1({
			{
				i18n("word_lv"),
				var_4_0.level
			},
			{
				i18n("word_nowenergy"),
				var_4_0.energy
			},
			{
				i18n("word_energy_recov_speed"),
				10 * var_4_10 .. (var_4_8 > 0 and setColorStr("+" .. 10 * var_4_8, COLOR_GREEN) or "") .. "/h"
			}
		})
	end

	setActive(var_4_1.propsTr, arg_4_0.type == DormShip.FLOOR_1)
	setActive(var_4_1.propsTr1, arg_4_0.type == DormShip.FLOOR_2)
end

function var_0_0.CalcShipAddExpSpeed(arg_9_0)
	local var_9_0 = 0
	local var_9_1 = getProxy(DormProxy):getRawData()
	local var_9_2 = arg_9_0:GetBaseExp(var_9_1)

	return (math.floor(var_9_2 * 3600 / pg.dorm_data_template[var_9_1.id].time))
end

function var_0_0.GetBaseExp(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(PlayerProxy):getRawData()
	local var_10_1 = arg_10_1:GetFloorShipCnt(DormShip.FLOOR_1)

	if var_10_1 <= 0 then
		return 0
	end

	local var_10_2 = pg.dorm_data_template[arg_10_1.id]
	local var_10_3 = BuffHelper.GetBackYardExpBuffs()
	local var_10_4 = 1

	for iter_10_0, iter_10_1 in pairs(var_10_3) do
		if iter_10_1:isActivate() then
			local var_10_5 = iter_10_1:getConfig("benefit_effect")

			var_10_4 = tonumber(var_10_5) / 100 + var_10_4
		end
	end

	local var_10_6 = pg.gameset.dorm_exp_base.key_value
	local var_10_7 = pg.gameset.dorm_exp_ratio_comfort_degree.key_value
	local var_10_8 = pg.gameset["dorm_exp_ratio_by_" .. var_10_1].key_value / 100
	local var_10_9 = arg_10_1:getComfortable()

	return var_10_8 * (var_10_6 + var_10_2.exp * (var_10_9 / (var_10_9 + var_10_7))) * var_10_4 * (1 + 0.05 * var_10_0.level)
end

function var_0_0.OnDispose(arg_11_0)
	arg_11_0.press.onLongPressed:RemoveAllListeners()
	arg_11_0.press.onLongPressed:AddListener(nil)

	if arg_11_0.info then
		arg_11_0.info:clear()
	end
end

return var_0_0
