local var_0_0 = class("ReversePacmanActivity", import(".VirtualBagActivity"))

var_0_0.KEY_VIRTUAL_ITEM = 1
var_0_0.KEY_STAGE_DATA = 2
var_0_0.KEY_FAVORABILITY = 3

function var_0_0.Ctor(arg_1_0, ...)
	var_0_0.super.Ctor(arg_1_0, ...)
	pg.m02:sendNotification(GAME.GET_ACTIVITY_SHOP)
end

function var_0_0.GetVitemNumber(arg_2_0, arg_2_1)
	return var_0_0.super.getVitemNumber(arg_2_0, arg_2_1)
end

function var_0_0.SetVitemNumber(arg_3_0, arg_3_1, arg_3_2)
	var_0_0.super.setVitemNumber(arg_3_0, arg_3_1, arg_3_2)
end

function var_0_0.AddVitemNumber(arg_4_0, arg_4_1, arg_4_2)
	var_0_0.super.addVitemNumber(arg_4_0, arg_4_1, arg_4_2)
end

function var_0_0.SubVitemNumber(arg_5_0, arg_5_1, arg_5_2)
	var_0_0.super.subVitemNumber(arg_5_0, arg_5_1, arg_5_2)
end

function var_0_0.GetStageDataList(arg_6_0)
	return arg_6_0.data1KeyValueList[var_0_0.KEY_STAGE_DATA] or {}
end

function var_0_0.UpdatePassStage(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.data1KeyValueList[var_0_0.KEY_STAGE_DATA] = arg_7_0.data1KeyValueList[var_0_0.KEY_STAGE_DATA] or {}

	local var_7_0 = arg_7_0.data1KeyValueList[var_0_0.KEY_STAGE_DATA][arg_7_1] or 0

	if var_7_0 == 0 or arg_7_2 < var_7_0 then
		arg_7_0.data1KeyValueList[var_0_0.KEY_STAGE_DATA][arg_7_1] = arg_7_2
	end
end

function var_0_0.IsUnlockStage(arg_8_0, arg_8_1)
	local var_8_0 = pg.activity_chasing_level[arg_8_1].unlock_date

	return var_8_0 and pg.TimeMgr.GetInstance():passTime(var_8_0[1])
end

function var_0_0.GetRoleIds(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0:GetFavorabilityList()) do
		table.insert(var_9_0, iter_9_0)
	end

	return var_9_0
end

function var_0_0.GetFavorabilityList(arg_10_0)
	return arg_10_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY] or {}
end

function var_0_0.AddFavorability(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY] = arg_11_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY] or {}
	arg_11_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY][arg_11_1] = (arg_11_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY][arg_11_1] or 0) + arg_11_2
end

function var_0_0.GetFavorability(arg_12_0, arg_12_1)
	return arg_12_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY] and arg_12_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY][arg_12_1] or 0
end

function var_0_0.readyToAchieve(arg_13_0)
	if arg_13_0:isEnd() then
		return false
	end

	return arg_13_0:GetHireTip() or arg_13_0:GetTechnologyTip() or arg_13_0:GetTaskTip() or arg_13_0:GetGameTip()
end

function var_0_0.GetHireTip(arg_14_0)
	local var_14_0 = ReversePacmanTools.GetInterviewItemID()

	if ReversePacmanTools.GetItemCnt(var_14_0) <= 0 then
		return false
	end

	if arg_14_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY] == nil then
		return true
	end

	local var_14_1 = ReversePacmanTools.GetActivity():getConfig("config_client").chasing_char

	for iter_14_0, iter_14_1 in ipairs(var_14_1) do
		if arg_14_0.data1KeyValueList[var_0_0.KEY_FAVORABILITY][iter_14_1] == nil then
			return true
		end
	end

	return false
end

function var_0_0.GetTechnologyTip(arg_15_0)
	if not ReversePacmanTools.HasHireRole() then
		return false
	end

	return arg_15_0:GetGiftTip() or arg_15_0:GetRoleSkillTip() or arg_15_0:GetPlayerSkillTip()
end

function var_0_0.GetGiftTip(arg_16_0)
	local var_16_0 = ReversePacmanTools.GetGiftItemID()
	local var_16_1 = ReversePacmanTools.GetItemCnt(var_16_0)

	if var_16_1 < 0 then
		return false
	end

	local var_16_2 = getProxy(PlayerProxy):getRawData().id
	local var_16_3 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	if PlayerPrefs.GetString(string.format("REVERSE_PACMAN_GIFT_%s_%s", var_16_2, arg_16_0.id)) == var_16_3 then
		return false
	end

	for iter_16_0, iter_16_1 in pairs(arg_16_0:GetFavorabilityList()) do
		if ReversePacmanTools.GetMaxFavorabilityValue(iter_16_0) > ReversePacmanTools.GetFavorabilityValue(iter_16_0) and var_16_1 >= pg.activity_chasing_character[iter_16_0].need[2] then
			return true
		end
	end

	return false
end

function var_0_0.SetGiftTip(arg_17_0)
	local var_17_0 = getProxy(PlayerProxy):getRawData().id
	local var_17_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	PlayerPrefs.SetString(string.format("REVERSE_PACMAN_GIFT_%s_%s", var_17_0, arg_17_0.id), var_17_1)
	pg.m02:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
end

function var_0_0.GetRoleSkillTip(arg_18_0)
	if ReversePacmanTools:GetTechnologyPTDrop():getOwnedCount() <= 0 then
		return false
	end

	local var_18_0 = getProxy(PlayerProxy):getRawData().id
	local var_18_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	if PlayerPrefs.GetString(string.format("REVERSE_PACMAN_ROLE_SKILL_%s_%s", var_18_0, arg_18_0.id)) == var_18_1 then
		return false
	end

	for iter_18_0, iter_18_1 in ipairs(arg_18_0:getConfig("config_client").technologyShopIDList) do
		local var_18_2 = pg.activity_shop_template[iter_18_1]

		if getProxy(ShopsProxy):getActivityShopById(var_18_2.activity):getGoodsById(iter_18_1):CheckCntLimit() then
			return true
		end
	end

	return false
end

function var_0_0.SetRoleSkillTip(arg_19_0)
	local var_19_0 = getProxy(PlayerProxy):getRawData().id
	local var_19_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	PlayerPrefs.SetString(string.format("REVERSE_PACMAN_ROLE_SKILL_%s_%s", var_19_0, arg_19_0.id), var_19_1)
	pg.m02:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
end

function var_0_0.GetPlayerSkillTip(arg_20_0)
	if ReversePacmanTools:GetTechnologyPTDrop():getOwnedCount() <= 0 then
		return false
	end

	local var_20_0 = getProxy(PlayerProxy):getRawData().id
	local var_20_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	if PlayerPrefs.GetString(string.format("REVERSE_PACMAN_PLAYER_SKILL_%s_%s", var_20_0, arg_20_0.id)) == var_20_1 then
		return false
	end

	for iter_20_0, iter_20_1 in ipairs(arg_20_0:getConfig("config_client").playerSkillShopIDList) do
		local var_20_2 = pg.activity_shop_template[iter_20_1]

		if getProxy(ShopsProxy):getActivityShopById(var_20_2.activity):getGoodsById(iter_20_1):CheckCntLimit() then
			return true
		end
	end

	return false
end

function var_0_0.SetPlayerSkillTip(arg_21_0)
	local var_21_0 = getProxy(PlayerProxy):getRawData().id
	local var_21_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	PlayerPrefs.SetString(string.format("REVERSE_PACMAN_PLAYER_SKILL_%s_%s", var_21_0, arg_21_0.id), var_21_1)
	pg.m02:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
end

function var_0_0.GetTaskTip(arg_22_0)
	local var_22_0 = arg_22_0:getConfig("config_client").taskActivityID
	local var_22_1 = getProxy(ActivityProxy):getActivityById(var_22_0)

	return var_22_1 and var_22_1:readyToAchieve()
end

function var_0_0.GetGameTip(arg_23_0)
	if not ReversePacmanTools.HasHireRole() then
		return false
	end

	local var_23_0 = ReversePacmanTools.GetUnPassLevelIds()

	if #var_23_0 <= 0 then
		return false
	end

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		if arg_23_0:IsLevelTip(iter_23_1) then
			return true
		end
	end

	return false
end

function var_0_0.IsLevelTip(arg_24_0, arg_24_1)
	local var_24_0 = getProxy(PlayerProxy):getRawData().id
	local var_24_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
	local var_24_2 = string.format("REVERSE_PACMAN_LEVEL_TIP_%s_%s_%s_%s", var_24_0, arg_24_0.id, var_24_1, arg_24_1)

	if PlayerPrefs.GetInt(var_24_2) ~= 1 then
		return true
	end

	return false
end

function var_0_0.SetLevelTip(arg_25_0, arg_25_1)
	local var_25_0 = getProxy(PlayerProxy):getRawData().id
	local var_25_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
	local var_25_2 = string.format("REVERSE_PACMAN_LEVEL_TIP_%s_%s_%s_%s", var_25_0, arg_25_0.id, var_25_1, arg_25_1)

	PlayerPrefs.SetInt(var_25_2, 1)
end

return var_0_0
