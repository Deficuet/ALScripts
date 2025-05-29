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

function var_0_0.GoSDkLoginScene()
	var_0_1:GoLoginScene()
end

function var_0_0.LoginSdk(arg_5_0)
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

function var_0_0.EnterServer(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6)
	return
end

function var_0_0.SdkLevelUp(arg_10_0, arg_10_1)
	return
end

function var_0_0.UserCenter()
	local var_11_0 = var_0_0.GetPNInfo()
	local var_11_1 = var_0_0.GetClientVer()

	var_0_1:UserCenter(var_11_0.playerName, var_11_1, var_11_0.serverID, var_11_0.info)
end

function var_0_0.BugReport()
	local var_12_0 = var_0_0.GetPNInfo()
	local var_12_1 = var_0_0.GetClientVer()

	var_0_1:BugReport(var_12_0.playerName, var_12_1, var_12_0.serverID, var_12_0.info)
end

function var_0_0.StoreReview()
	local var_13_0 = var_0_0.GetPNInfo()
	local var_13_1 = var_0_0.GetClientVer()

	var_0_1:StoreReview(var_13_0.playerName, var_13_1, var_13_0.serverID, var_13_0.info)
end

function var_0_0.ShareImg(arg_14_0)
	var_0_1:ShareImg(arg_14_0, "")
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

function var_0_0.SdkPay(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5, arg_20_6, arg_20_7, arg_20_8, arg_20_9)
	local var_20_0 = var_0_0.GetPNInfo()
	local var_20_1 = var_20_0.serverID .. "-" .. var_20_0.playerID .. "-" .. arg_20_4

	originalPrint("SdkPay nonce", tostring(var_20_1))
	var_0_1:Pay(arg_20_0, var_20_1, var_20_0.info)
end

function var_0_0.BindCPU()
	var_0_1:callSdkApi("bindCpu", nil)
end

function var_0_0.SwitchAccount()
	var_0_1:SwitchAccount()
end

function var_0_0.EventTrack(arg_23_0)
	var_0_1:SDK_EvtTrack(arg_23_0)
end

function var_0_0.GetBiliServerId()
	local var_24_0 = var_0_1.serverId

	originalPrint("serverId : " .. var_24_0)

	return var_24_0
end

function var_0_0.GetChannelUID()
	local var_25_0 = var_0_1.channelUID

	originalPrint("channelUID : " .. var_25_0)

	return var_25_0
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

function SDKLogined(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	local var_31_0 = User.New({
		type = 1,
		arg1 = arg_31_0,
		arg2 = arg_31_1,
		arg3 = arg_31_2,
		arg4 = arg_31_3
	})

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = var_31_0
	})
end

function SDKLogouted(arg_32_0)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.LOGOUT, {
		code = arg_32_0
	})
end

function PaySuccess(arg_33_0, arg_33_1)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()
end

function PayFailed(arg_34_0, arg_34_1)
	getProxy(ShopsProxy):removeWaitTimer()

	arg_34_1 = tonumber(arg_34_1)

	if not arg_34_1 then
		return
	end

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = arg_34_0,
		code = arg_34_1
	})

	if arg_34_1 == -202 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("pay_cancel") .. arg_34_1)
	end
end

function var_0_0.Survey(arg_35_0)
	Application.OpenURL(arg_35_0)
end

function OnQueryProductsSucess(arg_36_0)
	local function var_36_0(arg_37_0, arg_37_1)
		for iter_37_0, iter_37_1 in ipairs(pg.pay_data_display.all) do
			local var_37_0 = pg.pay_data_display[iter_37_1]

			if var_37_0.id_str == arg_37_0 and var_37_0.money ~= arg_37_1 then
				-- block empty
			end
		end
	end

	local var_36_1 = arg_36_0.Count

	for iter_36_0 = 0, var_36_1 - 1 do
		local var_36_2 = arg_36_0[iter_36_0]
		local var_36_3 = var_36_2.ProductID
		local var_36_4 = var_36_2.Price

		var_36_0(var_36_3, var_36_4)
	end
end

function OnAdRewards(arg_38_0)
	return
end

function OnQuerySubscriptionSuccess(arg_39_0)
	return
end

function OnRequestPayment(arg_40_0)
	local var_40_0 = var_0_0.GetPNInfo()
	local var_40_1 = ""

	originalPrint("SdkPay OnRequestPayment")
	var_0_1:Pay(arg_40_0, var_40_1, var_40_0.info)
end

function OnQuerySuccess(arg_41_0, arg_41_1)
	return
end

return var_0_0
