local var_0_0 = {}
local var_0_1 = TxwyKrSdkMgr.inst

function var_0_0.CheckPretest()
	return NetConst.GATEWAY_HOST == "bl-kr-test.xdg.com" and NetConst.GATEWAY_PORT == 30001 or IsUnityEditor
end

function var_0_0.GetPNInfo()
	local var_2_0 = "null"
	local var_2_1 = "null"
	local var_2_2 = "not logged in"
	local var_2_3 = getProxy(PlayerProxy)

	if var_2_3 then
		var_2_0 = var_2_3:getData().id
		var_2_1 = var_2_3:getData().level
		var_2_2 = var_2_3:getData().name
	end

	local var_2_4 = "none"
	local var_2_5 = getProxy(UserProxy):getData()

	if var_2_5 then
		var_2_4 = getProxy(ServerProxy):getLastServer(var_2_5.uid).id
	end

	local var_2_6 = PNInfo.New(var_2_0, var_2_1)

	return {
		info = PNInfo.New(var_2_0, var_2_1),
		playerID = var_2_0,
		playerName = var_2_2,
		playerLevel = var_2_1,
		serverID = var_2_4
	}
end

function var_0_0.GetClientVer()
	return (BundleWizard.Inst:GetGroupMgr(GroupMainHelper.DefaultGroupName).CurrentVersion:ToString())
end

function var_0_0.GetSDKServerID()
	local var_4_0 = {
		[0] = "1",
		"2001",
		"1001",
		"not_define"
	}
	local var_4_1 = var_4_0[NetConst.getwayType]

	originalPrint("SDK ServerID:" .. tostring(var_4_1))

	return var_4_0[var_4_1]
end

function var_0_0.GoSDkLoginScene()
	var_0_1:GoLoginScene()
end

function var_0_0.LoginSdk(arg_6_0)
	var_0_1:Login()
end

function var_0_0.SdkGateWayLogined()
	var_0_1:OnGatewayLogined()
end

function var_0_0.SdkLoginGetaWayFailed()
	var_0_1:OnLoginGatewayFailed()
end

function var_0_0.LogoutSDK()
	var_0_1:LocalLogout()
end

function var_0_0.EnterServer(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6)
	return
end

function var_0_0.SdkLevelUp(arg_11_0, arg_11_1)
	return
end

function var_0_0.UserCenter()
	local var_12_0 = var_0_0.GetPNInfo()
	local var_12_1 = var_0_0.GetClientVer()

	var_0_1:UserCenter(var_12_0.playerName, var_12_1, var_12_0.serverID, var_12_0.info)
end

function var_0_0.BugReport()
	local var_13_0 = var_0_0.GetPNInfo()
	local var_13_1 = var_0_0.GetClientVer()

	var_0_1:BugReport(var_13_0.playerName, var_13_1, var_13_0.serverID, var_13_0.info)
end

function var_0_0.StoreReview()
	if var_0_0.GetIsPlatform() then
		local var_14_0 = var_0_0.GetPNInfo()
		local var_14_1 = var_0_0.GetClientVer()

		var_0_1:StoreReview(var_14_0.playerName, var_14_1, var_14_0.serverID, var_14_0.info)
	end
end

function var_0_0.ShareImg(arg_15_0)
	var_0_1:ShareImg(arg_15_0, "")
end

function var_0_0.CompletedTutorial()
	return
end

function var_0_0.UnlockAchievement()
	return
end

function var_0_0.OnAndoridBackPress()
	PressBack()
end

function var_0_0.QueryWithProduct()
	return
end

function var_0_0.QueryPendingTransaction()
	if var_0_0.GetIsPlatform() then
		var_0_1:SDK_QueryPendingTransaction()
	end
end

function var_0_0.SdkPay(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4, arg_21_5, arg_21_6, arg_21_7, arg_21_8, arg_21_9)
	local var_21_0 = var_0_0.GetPNInfo()
	local var_21_1 = var_21_0.serverID .. "-" .. var_21_0.playerID .. "-" .. arg_21_4

	originalPrint("SdkPay nonce", tostring(var_21_1))

	local var_21_2 = var_0_0.GetSDKServerID()

	var_0_1:SDK_PayWithProductID(arg_21_0, var_21_2, var_21_1, var_21_0.info:GetJson())
end

function var_0_0.BindCPU()
	var_0_1:callSdkApi("bindCpu", nil)
end

function var_0_0.SwitchAccount()
	var_0_1:LocalLogout()
	onDelayTick(function()
		var_0_1:Login()
	end, 0.1)
end

function var_0_0.EventTrack(arg_25_0)
	var_0_1:SDK_EvtTrack(arg_25_0)
end

function var_0_0.GetBiliServerId()
	local var_26_0 = var_0_1.serverId

	originalPrint("serverId : " .. var_26_0)

	return var_26_0
end

function var_0_0.GetChannelUID()
	local var_27_0 = var_0_1.channelUID

	originalPrint("channelUID : " .. var_27_0)

	return var_27_0
end

function var_0_0.GetLoginType()
	return var_0_1.loginType
end

function var_0_0.GetIsPlatform()
	return var_0_1.isPlatform
end

function var_0_0.GetDeviceModel()
	return var_0_1:GetDeviceModel()
end

function var_0_0.OnAndoridBackPress()
	PressBack()
end

function GoLoginScene()
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN)
	gcAll()
end

function SDKLogined(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	local var_33_0 = User.New({
		type = 1,
		arg1 = arg_33_0,
		arg2 = arg_33_1,
		arg3 = arg_33_2,
		arg4 = arg_33_3
	})

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = var_33_0
	})
end

function SDKLogouted(arg_34_0)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.LOGOUT, {
		code = arg_34_0
	})
end

function PaySuccess(arg_35_0, arg_35_1)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()
end

function PayFailed(arg_36_0, arg_36_1)
	getProxy(ShopsProxy):removeWaitTimer()

	arg_36_1 = tonumber(arg_36_1)

	if not arg_36_1 then
		return
	end

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = arg_36_0,
		code = arg_36_1
	})

	if arg_36_1 == -202 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("pay_cancel") .. arg_36_1)
	end
end

function var_0_0.Survey(arg_37_0)
	Application.OpenURL(arg_37_0)
end

function OnQueryProductsSucess(arg_38_0)
	local function var_38_0(arg_39_0, arg_39_1)
		for iter_39_0, iter_39_1 in ipairs(pg.pay_data_display.all) do
			local var_39_0 = pg.pay_data_display[iter_39_1]

			if var_39_0.id_str == arg_39_0 and var_39_0.money ~= arg_39_1 then
				-- block empty
			end
		end
	end

	local var_38_1 = arg_38_0.Count

	for iter_38_0 = 0, var_38_1 - 1 do
		local var_38_2 = arg_38_0[iter_38_0]
		local var_38_3 = var_38_2.ProductID
		local var_38_4 = var_38_2.Price

		var_38_0(var_38_3, var_38_4)
	end
end

function OnAdRewards(arg_40_0)
	return
end

function OnQuerySubscriptionSuccess(arg_41_0)
	return
end

function OnRequestPayment(arg_42_0)
	local var_42_0 = var_0_0.GetPNInfo()
	local var_42_1 = ""

	originalPrint("SdkPay OnRequestPayment")

	local var_42_2 = var_0_0.GetSDKServerID()

	var_0_1:SDK_PayWithProductID(arg_42_0, var_42_2, var_42_1, var_42_0.info:GetJson())
end

function OnQuerySuccess(arg_43_0, arg_43_1)
	return
end

return var_0_0
