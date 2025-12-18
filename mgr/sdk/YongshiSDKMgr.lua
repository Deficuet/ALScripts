local var_0_0 = {}
local var_0_1 = YongshiSdkMgr.inst
local var_0_2 = "com.hkmanjuu.azurlane.gp.mc"
local var_0_3 = "com.hkmanjuu.azurlane.gp"
local var_0_4 = "com.hkmanjuu.azurlane.ios1"

function var_0_0.CheckPretest()
	return NetConst.GATEWAY_HOST == "ts-all-login.azurlane.tw" and (NetConst.GATEWAY_PORT == 11001 or NetConst.GATEWAY_PORT == 11101) or IsUnityEditor
end

function var_0_0.InitSDK()
	var_0_1:Init()
end

function var_0_0.GoSDkLoginScene()
	var_0_1:GoLoginScene()
end

function var_0_0.LoginSdk(arg_4_0)
	var_0_1:Login(0)
end

function var_0_0.TryLoginSdk()
	var_0_1:TryLogin()
end

function var_0_0.SdkGateWayLogined()
	var_0_1:OnGatewayLogined()
end

function var_0_0.SdkLoginGetaWayFailed()
	var_0_1:OnLoginGatewayFailed()
end

function var_0_0.IsBindApple()
	return var_0_1.bindInfo:IsBindApple()
end

function var_0_0.IsBindFaceBook()
	return var_0_1.bindInfo:IsBindFaceBook()
end

function var_0_0.IsBindGoogle()
	return var_0_1.bindInfo:IsBindGoogle()
end

function var_0_0.IsBindPhone()
	return var_0_1.bindInfo:IsBindPhone()
end

function var_0_0.BindApple()
	var_0_1:BindApple()
end

function var_0_0.BindFaceBook()
	var_0_1:BindFaceBook()
end

function var_0_0.BindGoogle()
	var_0_1:BindGoogle()
end

function var_0_0.BindPhone()
	var_0_1:BindPhone()
end

function var_0_0.UnBindPhone()
	var_0_1:UnBindPhone()
end

function var_0_0.UnBindApple()
	var_0_1:UnBindApple()
end

function var_0_0.UnBindFaceBook()
	var_0_1:UnBindFaceBook()
end

function var_0_0.UnBindGoogle()
	var_0_1:UnBindGoogle()
end

function var_0_0.CanTriggerDeepLinking()
	return var_0_1:CanTriggerDeepLinking()
end

function var_0_0.TriggerDeepLinking()
	var_0_1:TriggerDeepLinking()
end

function var_0_0.SdkPay(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5, arg_22_6, arg_22_7, arg_22_8, arg_22_9)
	local var_22_0 = getProxy(UserProxy):getData().uid
	local var_22_1 = getProxy(ServerProxy):getLastServer(var_22_0)
	local var_22_2 = var_22_1.id
	local var_22_3 = var_22_1.name
	local var_22_4 = getProxy(PlayerProxy):getRawData()
	local var_22_5 = var_22_4.id
	local var_22_6 = var_22_4.name
	local var_22_7 = var_22_4.level

	var_0_1:Pay(arg_22_0, arg_22_2, arg_22_5, arg_22_1, "1", arg_22_3, "1", var_22_2, var_22_3, var_22_2, var_22_5, var_22_6, var_22_7, arg_22_8, "1", arg_22_4, arg_22_6, arg_22_9)
end

function var_0_0.UserEventUpload(arg_23_0)
	var_0_1:UserEventUpload(arg_23_0)
end

function var_0_0.LogoutSDK()
	var_0_1:LocalLogout()
end

function var_0_0.BindCPU()
	var_0_1:callSdkApi("bindCpu", nil)
end

function var_0_0.DeleteAccount()
	var_0_1:Delete()
end

function var_0_0.OnAndoridBackPress()
	PressBack()
end

function var_0_0.ShareImg(arg_28_0, arg_28_1)
	var_0_1:Share(arg_28_0)
end

function var_0_0.GetBiliServerId()
	local var_29_0 = var_0_1.serverId

	originalPrint("serverId : " .. var_29_0)

	return var_29_0
end

function var_0_0.GetChannelUID()
	local var_30_0 = var_0_1.channelUID

	originalPrint("channelUID : " .. var_30_0)

	return var_30_0
end

function var_0_0.GetLoginType()
	return var_0_1.loginType
end

function var_0_0.GetIsPlatform()
	return var_0_1.isPlatform
end

function var_0_0.GetPackageCode(arg_33_0)
	if arg_33_0 == var_0_2 then
		return "2"
	elseif arg_33_0 == var_0_3 then
		return "1"
	elseif arg_33_0 == var_0_4 then
		return "3"
	end

	return "0"
end

function var_0_0.QueryWithProduct()
	if var_0_2 == Application.identifier then
		return
	end

	local var_34_0 = {}
	local var_34_1 = pg.pay_data_display

	for iter_34_0, iter_34_1 in pairs(var_34_1.all) do
		local var_34_2 = var_34_1[iter_34_1]

		table.insert(var_34_0, var_34_2.id_str)
	end

	var_0_1:Query(var_34_0)
end

function var_0_0.GetProduct(arg_35_0)
	return var_0_1:GetProduct(arg_35_0)
end

function StartSdkLogin()
	Timer.New(function()
		var_0_1:OnLoginTimeOut()
	end, 30, 1):Start()
end

function GoLoginScene()
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN)
	gcAll()
end

function SDKLogined(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	local var_39_0 = User.New({
		type = 1,
		arg1 = arg_39_0,
		arg2 = arg_39_1,
		arg3 = arg_39_2,
		arg4 = arg_39_3
	})

	pg.SdkMgr.GetInstance().airi_uid = arg_39_1 or "test"

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = var_39_0
	})
end

function SDKLogouted(arg_40_0)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.LOGOUT, {
		code = arg_40_0
	})
end

function PaySuccess(arg_41_0, arg_41_1)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()
	originalPrint(arg_41_0 + " - " + arg_41_1)
	pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
		payId = arg_41_0,
		bsId = arg_41_1
	})
end

function PayFailed(arg_42_0, arg_42_1)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()

	arg_42_1 = tonumber(arg_42_1)

	if not arg_42_1 then
		return
	end

	if PLATFORM_CODE == PLATFORM_CHT and var_0_0.GetChannelUID() == "2" then
		return
	end

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = arg_42_0,
		code = arg_42_1
	})
end

function GetUserInfoSuccess()
	return
end

function GetUserInfoFailed()
	return
end

local function var_0_5(arg_45_0, arg_45_1, arg_45_2)
	if arg_45_0 == YongshiSdkUserBindInfo.FACEBOOK then
		pg.TipsMgr.GetInstance():ShowTips(arg_45_1 .. "facebook" .. arg_45_2)
	elseif arg_45_0 == YongshiSdkUserBindInfo.APPLE then
		pg.TipsMgr.GetInstance():ShowTips(arg_45_1 .. "Apple Id" .. arg_45_2)
	elseif arg_45_0 == YongshiSdkUserBindInfo.GOOGLE then
		pg.TipsMgr.GetInstance():ShowTips(arg_45_1 .. "google" .. arg_45_2)
	elseif arg_45_0 == YongshiSdkUserBindInfo.PHONE then
		if arg_45_1 == "解綁" then
			arg_45_1 = "换绑"
		end

		pg.TipsMgr.GetInstance():ShowTips(arg_45_1 .. "手機" .. arg_45_2)
	else
		print("this platform is not supported")
	end
end

function BindSuccess(arg_46_0)
	var_0_5(arg_46_0, "綁定", "成功")
	pg.m02:sendNotification(GAME.CHT_SOCIAL_LINK_STATE_CHANGE, arg_46_0)
end

function BindFailed(arg_47_0, arg_47_1)
	if arg_47_1 and arg_47_1 ~= "" then
		pg.TipsMgr.GetInstance():ShowTips(arg_47_1)
	else
		var_0_5(arg_47_0, "綁定", "失敗")
	end
end

function UnBindSuccess(arg_48_0)
	var_0_5(arg_48_0, "解綁", "成功")
	pg.m02:sendNotification(GAME.CHT_SOCIAL_LINK_STATE_CHANGE)
end

function UnBindFailed(arg_49_0, arg_49_1)
	if arg_49_1 and arg_49_1 ~= "" then
		pg.TipsMgr.GetInstance():ShowTips(arg_49_1)
	else
		var_0_5(arg_49_0, "解綁", "失敗")
	end
end

function OnDeepLinking(arg_50_0)
	pg.YongshiDeepLinkingMgr.GetInstance():SetData(arg_50_0)
end

return var_0_0
