local var_0_0 = class("MallUtil")

var_0_0.FLOOR_RANK = {
	CLOSE = 4,
	S = 1,
	A = 2,
	B = 3
}
var_0_0.RANK2NAME = {
	[var_0_0.FLOOR_RANK.S] = i18n("mall_rank_s"),
	[var_0_0.FLOOR_RANK.A] = i18n("mall_rank_a"),
	[var_0_0.FLOOR_RANK.B] = i18n("mall_rank_b"),
	[var_0_0.FLOOR_RANK.CLOSE] = i18n("mall_rank_close")
}

function var_0_0.GetFloorRank(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0 / arg_1_1

	if var_1_0 <= 0 then
		return var_0_0.FLOOR_RANK.CLOSE
	end

	if var_1_0 >= 1.5 then
		return var_0_0.FLOOR_RANK.S
	end

	if var_1_0 >= 1 and var_1_0 < 1.5 then
		return var_0_0.FLOOR_RANK.A
	end

	return var_0_0.FLOOR_RANK.B
end

function var_0_0.GetFloorFactor(arg_2_0)
	local var_2_0 = pg.gameset.activity_mall_profit_factor.description

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		if arg_2_0 == var_2_0[1] then
			return iter_2_1[2]
		end
	end

	return var_2_0[#var_2_0][2]
end

return var_0_0
