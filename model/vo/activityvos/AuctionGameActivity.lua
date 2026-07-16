local var_0_0 = class("AuctionGameActivity", import("model.vo.Activity"))

function var_0_0.readyToAchieve(arg_1_0)
	if arg_1_0:isEnd() then
		return false
	end

	return arg_1_0:GetPreorderTip() or arg_1_0:GetOpenPreorderTip() or arg_1_0:GetTaskTip() or arg_1_0:GetAllLocationTip() or arg_1_0:GetReliefTip()
end

function var_0_0.GetPreorderTip(arg_2_0)
	local var_2_0 = getProxy(AuctionGameBaseProxy)
	local var_2_1 = var_2_0:GetPreorderState()
	local var_2_2 = var_2_0:GetPreorderTimestamp()
	local var_2_3 = pg.TimeMgr.GetInstance():GetServerTime()

	if var_2_1 == 1 then
		return false
	end

	if pg.TimeMgr.GetInstance():IsSameDay(var_2_3, arg_2_0.stopTime) then
		return false
	end

	local var_2_4 = getProxy(PlayerProxy):getRawData().id
	local var_2_5 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	return PlayerPrefs.GetString(string.format("AUCTION_GAME_PREORDER_%s_%s", var_2_4, arg_2_0.id)) ~= var_2_5
end

function var_0_0.SetPreorderTip(arg_3_0)
	if getProxy(AuctionGameBaseProxy):GetPreorderState() == 1 then
		return
	end

	local var_3_0 = getProxy(PlayerProxy):getRawData().id
	local var_3_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")

	PlayerPrefs.SetString(string.format("AUCTION_GAME_PREORDER_%s_%s", var_3_0, arg_3_0.id), var_3_1)
end

function var_0_0.GetOpenPreorderTip(arg_4_0)
	local var_4_0 = getProxy(AuctionGameBaseProxy)
	local var_4_1 = var_4_0:GetPreorderState()
	local var_4_2 = var_4_0:GetPreorderTimestamp()
	local var_4_3 = pg.TimeMgr.GetInstance():GetServerTime()

	if var_4_1 == 1 and var_4_2 <= var_4_3 then
		return true
	end

	return false
end

function var_0_0.GetTaskTip(arg_5_0)
	local var_5_0 = arg_5_0:getConfig("config_client").taskActID
	local var_5_1 = getProxy(ActivityProxy):getActivityById(var_5_0)

	return var_5_1 and var_5_1:readyToAchieve()
end

function var_0_0.GetAllLocationTip(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(pg.auction_session.all) do
		if pg.auction_session[iter_6_1].game_type ~= 0 and arg_6_0:GetLocationTip(iter_6_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetLocationTip(arg_7_0, arg_7_1)
	local var_7_0 = pg.auction_session[arg_7_1]
	local var_7_1 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(string.format("AUCTION_GAME_LOCATION_%s_%s_%s", var_7_1, arg_7_0.id, arg_7_1), 0) == 0 and AuctionGameTools.GetCurrencyCnt() >= var_7_0.threshold
end

function var_0_0.SetLocationTip(arg_8_0, arg_8_1)
	local var_8_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(string.format("AUCTION_GAME_LOCATION_%s_%s_%s", var_8_0, arg_8_0.id, arg_8_1), 1)
end

function var_0_0.GetReliefTip(arg_9_0)
	local var_9_0 = getProxy(AuctionGameBaseProxy)

	if var_9_0.gold < pg.gameset.auction_relief_payment_limit.key_value and var_9_0.reliefCnt < pg.gameset.auction_relief_payment_count.key_value then
		return true
	end

	return false
end

return var_0_0
