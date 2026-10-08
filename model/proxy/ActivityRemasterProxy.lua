local var_0_0 = class("ActivityRemasterProxy", import("model.proxy.NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0.actTimeID = 0
	arg_1_0.activeActID = 0
	arg_1_0.remasterActList = {}

	for iter_1_0, iter_1_1 in ipairs(pg.activity_re.all) do
		arg_1_0.remasterActList[iter_1_1] = ActivityRemasterData.New({
			id = iter_1_1
		})
	end

	arg_1_0:on(11213, function(arg_2_0)
		arg_1_0.actTimeID = arg_2_0.activity_re_timer_id
		arg_1_0.activeActID = arg_2_0.activity_re_id

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.finish_re_id) do
			arg_1_0:SetRemasterDataFinish(iter_2_1)
		end
	end)
end

function var_0_0.CanActiveRemaster(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:GetReamsterData(arg_3_1)

	if not var_3_0 then
		return false
	end

	if var_3_0:IsSpecial() then
		return true
	end

	if var_3_0:IsFinish() then
		return false
	end

	return true
end

function var_0_0.ActiveActivity(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.activeActID = arg_4_1
	arg_4_0.actTimeID = arg_4_2

	arg_4_0:SetRemasterDataFinish(arg_4_1)
end

function var_0_0.SetRemasterDataFinish(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0:GetReamsterData(arg_5_1)

	if var_5_0 then
		var_5_0:MarkFinish()
	end
end

function var_0_0.GetActivaingReamsterData(arg_6_0)
	return arg_6_0:GetReamsterData(arg_6_0.activeActID)
end

function var_0_0.GetRemasterActList(arg_7_0)
	return arg_7_0.remasterActList
end

function var_0_0.GetReamsterData(arg_8_0, arg_8_1)
	return arg_8_0.remasterActList[arg_8_1]
end

function var_0_0.InActTime(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(pg.activity_re_timer.all) do
		local var_9_0 = pg.activity_re_timer[iter_9_1]

		if pg.TimeMgr.GetInstance():inTime(var_9_0.timer) then
			return true, iter_9_1
		end
	end

	return false, arg_9_0.actTimeID
end

function var_0_0.GetActiveActID(arg_10_0)
	return arg_10_0.activeActID
end

function var_0_0.IsActivating(arg_11_0)
	if not arg_11_0.activeActID or arg_11_0.activeActID == 0 then
		return false
	end

	if not arg_11_0.actTimeID or arg_11_0.actTimeID == 0 then
		return false
	end

	local var_11_0 = pg.activity_re_timer[arg_11_0.actTimeID]

	if not var_11_0 then
		return false
	end

	return (pg.TimeMgr.GetInstance():inTime(var_11_0.timer))
end

function var_0_0.IsShowTime(arg_12_0)
	if not arg_12_0.activeActID or arg_12_0.activeActID == 0 then
		return false
	end

	if not arg_12_0.actTimeID or arg_12_0.actTimeID == 0 then
		return false
	end

	local var_12_0 = arg_12_0:GetReamsterData(arg_12_0.activeActID):GetActList()
	local var_12_1 = getProxy(ActivityProxy)
	local var_12_2 = 0

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		local var_12_3 = var_12_1:RawGetActivityById(iter_12_1)

		if var_12_3 and var_12_2 < var_12_3.stopTime then
			var_12_2 = var_12_3.stopTime
		end
	end

	if var_12_2 <= 0 then
		return false
	end

	return var_12_2 > pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.ShouldShowActiveBtn(arg_13_0)
	return getProxy(ActivityRemasterProxy):InActTime() and not getProxy(ActivityRemasterProxy):IsActivating()
end

function var_0_0.GetBanners(arg_14_0)
	if not arg_14_0:IsActivating() then
		return {}
	end

	local var_14_0 = pg.activity_re[arg_14_0.activeActID]

	if not var_14_0 then
		return {}
	end

	local var_14_1 = {}

	for iter_14_0, iter_14_1 in ipairs(var_14_0.act_time or {}) do
		local var_14_2 = iter_14_1[1]
		local var_14_3 = iter_14_1[2]
		local var_14_4 = iter_14_1[3] or 0

		if var_14_4 > 0 then
			table.insert(var_14_1, var_14_4)
		end
	end

	return var_14_1
end

function var_0_0.GetShopBanner(arg_15_0)
	if not arg_15_0:ExistShopBanner() then
		return nil
	end

	local var_15_0 = pg.shop_banner_template.all
	local var_15_1 = var_15_0[#var_15_0]
	local var_15_2 = pg.shop_banner_template[var_15_1]
	local var_15_3 = Clone(var_15_2)

	var_15_3.pic = "shopbanner_remaster/" .. arg_15_0.activeActID
	var_15_3.param = {
		"scene shop",
		{
			warp = "activity"
		}
	}
	var_15_3.relation_param = ""
	var_15_3.name = "banner_small3"
	var_15_3.time = "always"
	var_15_3.time_lable = 0
	var_15_3.type = 2

	return var_15_3
end

function var_0_0.ExistShopBanner(arg_16_0)
	if not arg_16_0.activeActID or arg_16_0.activeActID == 0 then
		return false
	end

	if not arg_16_0.actTimeID or arg_16_0.actTimeID == 0 then
		return false
	end

	local var_16_0 = arg_16_0:GetReamsterData(arg_16_0.activeActID)

	if not var_16_0 then
		return false
	end

	local var_16_1 = getProxy(ActivityProxy)

	for iter_16_0, iter_16_1 in ipairs(var_16_0:GetActList()) do
		local var_16_2 = var_16_1:RawGetActivityById(iter_16_1)

		if var_16_2 and not var_16_2:isEnd() and var_16_2:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SHOP then
			return true
		end
	end

	return false
end

function var_0_0.remove(arg_17_0)
	return
end

return var_0_0
