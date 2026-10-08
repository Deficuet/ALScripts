pg = pg or {}
pg.SdkMgr = singletonClass("SdkMgr")

local var_0_0 = pg.SdkMgr

function var_0_0.Ctor(arg_1_0)
	if PLATFORM_CODE == PLATFORM_CH then
		arg_1_0.instance = require("Mgr.Sdk.BiliSDKMgr")
	elseif PLATFORM_CODE == PLATFORM_JP then
		arg_1_0.instance = require("Mgr.Sdk.YoStarMgr")

		arg_1_0.instance.InitJP()
	elseif PLATFORM_CODE == PLATFORM_KR then
		arg_1_0.instance = require("Mgr.Sdk.TxwyKrSDKMgr")
	elseif PLATFORM_CODE == PLATFORM_US then
		arg_1_0.instance = require("Mgr.Sdk.YoStarMgr")

		arg_1_0.instance.InitUS()
	elseif PLATFORM_CODE == PLATFORM_CHT then
		arg_1_0.instance = require("Mgr.Sdk.YongshiSdkMgr")
	end

	arg_1_0.pcode = arg_1_0:GetPlatformCode(Application.identifier)
end

function var_0_0.Call(arg_2_0, arg_2_1, ...)
	assert(arg_2_0.instance)

	if arg_2_0.instance[arg_2_1] then
		arg_2_0.instance[arg_2_1](...)
	end
end

function var_0_0.Get(arg_3_0, arg_3_1, ...)
	assert(arg_3_0.instance)
	assert(arg_3_0.instance[arg_3_1], "func should exist " .. arg_3_1)

	return arg_3_0.instance[arg_3_1](...)
end

function EnterMultiWindow(arg_4_0)
	originalPrint(".......EnterMultiWindow")
end

function ExitMultiWindow(arg_5_0)
	originalPrint(".......ExitMultiWindow")
end

function var_0_0.InitSDK(arg_6_0)
	arg_6_0:Call("InitSDK")
end

function var_0_0.GoSDkLoginScene(arg_7_0)
	arg_7_0:Call("GoSDkLoginScene")
end

function var_0_0.LoginSdk(arg_8_0, arg_8_1)
	arg_8_0:Call("LoginSdk", arg_8_1)
end

function var_0_0.TryLoginSdk(arg_9_0)
	arg_9_0:Call("TryLoginSdk")
end

function var_0_0.CreateRole(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	arg_10_0:Call("CreateRole", arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
end

function var_0_0.EnterServer(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6, arg_11_7)
	arg_11_0:Call("EnterServer", arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6, arg_11_7)
end

function var_0_0.ChooseServer(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0:Call("ChooseServer", arg_12_1, arg_12_2)
end

function var_0_0.SdkGateWayLogined(arg_13_0)
	arg_13_0:Call("SdkGateWayLogined")
end

function var_0_0.SdkLoginGetaWayFailed(arg_14_0)
	arg_14_0:Call("SdkLoginGetaWayFailed")
end

function var_0_0.SdkLevelUp(arg_15_0)
	arg_15_0:Call("SdkLevelUp")
end

function var_0_0.SdkPay(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5, arg_16_6, arg_16_7, arg_16_8, arg_16_9, arg_16_10)
	arg_16_0:Call("SdkPay", arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5, arg_16_6, arg_16_7, arg_16_8, arg_16_9, arg_16_10)
end

function var_0_0.LogoutSDK(arg_17_0, arg_17_1)
	arg_17_0:Call("LogoutSDK", arg_17_1)
end

function var_0_0.BindCPU(arg_18_0)
	arg_18_0:Call("BindCPU")
end

function var_0_0.OnAndoridBackPress(arg_19_0)
	arg_19_0:Call("OnAndoridBackPress")
end

function var_0_0.DeleteAccount(arg_20_0)
	arg_20_0:Call("DeleteAccount")
end

function var_0_0.GetChannelUID(arg_21_0)
	local var_21_0 = arg_21_0:Get("GetChannelUID")

	if var_21_0 == "" then
		var_21_0 = PLATFORM_LOCAL
	end

	return var_21_0
end

function var_0_0.IsTestServer(arg_22_0)
	return NetConst.getwayType == 2
end

function var_0_0.GetChannelUIDIncludeHarmony(arg_23_0)
	local function var_23_0()
		local var_24_0 = arg_23_0:GetChannelUID()

		if var_24_0 == "harmony" then
			return 9999
		else
			local var_24_1 = tonumber(var_24_0)

			if var_24_1 then
				return var_24_1
			else
				return var_24_0 or 0
			end
		end
	end

	if arg_23_0:IsTestServer() or IsUnityEditor then
		local var_23_1

		if IsUnityEditor then
			var_23_1 = PathMgr.getAssetBundle("../localization.txt")
		else
			var_23_1 = Application.persistentDataPath .. "/localization.txt"
		end

		if not PathMgr.FileExists(var_23_1) then
			return var_23_0()
		end

		local var_23_2 = PathMgr.ReadAllLines(var_23_1)
		local var_23_3 = var_23_2.Length > 2 and var_23_2[2] or ""

		if not var_23_3 or var_23_3 == "" then
			return var_23_0()
		end

		local var_23_4 = var_23_3:match("^%s*ChannelUID%s*=%s*(%d+)")
		local var_23_5 = tonumber(var_23_4)

		if var_23_5 then
			return var_23_5
		else
			return var_23_0()
		end
	else
		return var_23_0()
	end
end

function var_0_0.GetLoginType(arg_25_0)
	local var_25_0 = Application.persistentDataPath .. "/server_config.txt"

	if PathMgr.FileExists(var_25_0) then
		return LoginType.PLATFORM_INNER
	end

	if string.match(NetConst.GATEWAY_HOST, "^10%.0") then
		return LoginType.PLATFORM_INNER
	end

	return arg_25_0:Get("GetLoginType")
end

function var_0_0.GetIsPlatform(arg_26_0)
	return arg_26_0:Get("GetIsPlatform")
end

function var_0_0.EnterLoginScene(arg_27_0)
	arg_27_0.inLoginScene = true
end

function var_0_0.ExitLoginScene(arg_28_0)
	arg_28_0.inLoginScene = false
end

function var_0_0.IsInLoginScene(arg_29_0)
	return arg_29_0.inLoginScene
end

function var_0_0.IsYunPackage(arg_30_0)
	return PLATFORM_CODE == PLATFORM_CH and arg_30_0:GetChannelUID() == "yun"
end

function var_0_0.Service(arg_31_0)
	arg_31_0:Call("Service")
end

function var_0_0.Survey(arg_32_0, arg_32_1)
	arg_32_0:Call("Survey", arg_32_1)
end

function var_0_0.IsHuaweiPackage(arg_33_0)
	return PLATFORM_CODE == PLATFORM_CH and arg_33_0:Get("IsHuaweiPackage")
end

function var_0_0.CheckAudit(arg_34_0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return arg_34_0:Get("CheckAudit")
	else
		return false
	end
end

function var_0_0.CheckPreAudit(arg_35_0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return arg_35_0:Get("CheckPreAudit")
	else
		return false
	end
end

function var_0_0.CheckPretest(arg_36_0)
	return arg_36_0:Get("CheckPretest")
end

function var_0_0.CheckGoogleSimulator(arg_37_0)
	return arg_37_0:Get("CheckGoogleSimulator")
end

function var_0_0.CheckWorldTest(arg_38_0)
	if PLATFORM_CODE == PLATFORM_CH then
		return arg_38_0:Get("CheckWorldTest")
	else
		return false
	end
end

function var_0_0.OnAppPauseForSDK(arg_39_0, arg_39_1)
	arg_39_0:Call("OnAppPauseForSDK", arg_39_1)
end

function var_0_0.UserEventUpload(arg_40_0, arg_40_1)
	arg_40_0:Call("UserEventUpload", arg_40_1)
end

function var_0_0.GameShare(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0:Call("GameShare", arg_41_1, arg_41_2)
end

local function var_0_1()
	function var_0_0.YoStarLoginSDK(arg_43_0)
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			arg_43_0:Call("Login")
		end
	end

	function var_0_0.YoStarPay(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			arg_44_0:Call("Pay", arg_44_1, arg_44_2, arg_44_3)
		end
	end

	function var_0_0.GameShare(arg_45_0, arg_45_1, arg_45_2)
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			arg_45_0:Call("SystemShare", arg_45_1, arg_45_2)
		end
	end

	function var_0_0.YostarOpenAiHelp(arg_46_0)
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			arg_46_0:Call("ShowAihelp")
		end
	end

	function var_0_0.OnAppPauseForSDK(arg_47_0, arg_47_1)
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			arg_47_0:Call("OnAppPauseForSDK", arg_47_1)
		end
	end

	function var_0_0.YoStarShowSurvey(arg_48_0, arg_48_1, arg_48_2)
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			return arg_48_0:Call("ShowSurvey", arg_48_1, arg_48_2)
		end
	end

	function var_0_0.YoStarCheckCanBuy(arg_49_0)
		if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			return arg_49_0:Get("CheckYoStarCanBuy")
		end
	end

	function var_0_0.YoStarCheckHadAccountCache(arg_50_0)
		if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			return arg_50_0:Get("CheckHadAccountCache")
		end
	end

	function var_0_0.YoStarShowUserCenter(arg_51_0)
		if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			return arg_51_0:Get("ShowUserCenter")
		end
	end

	function var_0_0.YoStarRoleInfoUpload(arg_52_0)
		if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			return arg_52_0:Get("RoleInfoUpload")
		end
	end

	function var_0_0.YoStarShowSwitchAccount(arg_53_0)
		if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			return arg_53_0:Get("ShowSwitchAccount")
		end
	end

	function var_0_0.YoStarShowAccountCenter(arg_54_0)
		if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			return arg_54_0:Get("ShowAccountCenter")
		end
	end

	function var_0_0.UserEventUpload(arg_55_0, arg_55_1)
		arg_55_0:Call("UserEventUpload", arg_55_1)
	end
end

if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
	var_0_1()
end

function var_0_0.UserCenter(arg_56_0)
	arg_56_0:Call("UserCenter")
end

function var_0_0.BugReport(arg_57_0)
	arg_57_0:Call("BugReport")
end

function var_0_0.StoreReview(arg_58_0)
	arg_58_0:Call("StoreReview")
end

function var_0_0.QueryWithProduct(arg_59_0)
	arg_59_0:Call("QueryWithProduct")
end

function var_0_0.QueryPendingTransaction(arg_60_0)
	arg_60_0:Call("QueryPendingTransaction")
end

function var_0_0.ShareImg(arg_61_0, arg_61_1, arg_61_2)
	arg_61_0:Call("ShareImg", arg_61_1, arg_61_2)
end

function var_0_0.SwitchAccount(arg_62_0)
	arg_62_0:Call("SwitchAccount")
end

function var_0_0.EventTrack(arg_63_0, arg_63_1)
	arg_63_0:Call("EventTrack", arg_63_1)
end

function var_0_0.EventTrack(arg_64_0, arg_64_1)
	arg_64_0:Call("EventTrack", arg_64_1)
end

function var_0_0.IsBindFaceBook(arg_65_0)
	if PLATFORM_CODE == PLATFORM_CHT then
		return arg_65_0:Get("IsBindFaceBook")
	end
end

function var_0_0.IsBindApple(arg_66_0)
	if PLATFORM_CODE == PLATFORM_CHT then
		return arg_66_0:Get("IsBindApple")
	end
end

function var_0_0.IsBindGoogle(arg_67_0)
	if PLATFORM_CODE == PLATFORM_CHT then
		return arg_67_0:Get("IsBindGoogle")
	end
end

function var_0_0.IsBindPhone(arg_68_0)
	if PLATFORM_CODE == PLATFORM_CHT then
		return arg_68_0:Get("IsBindPhone")
	end
end

function var_0_0.IsBindGameCenter(arg_69_0)
	if PLATFORM_CODE == PLATFORM_CHT then
		return false
	end
end

function var_0_0.CanTriggerDeepLinking(arg_70_0)
	if PLATFORM_CODE == PLATFORM_CHT then
		return arg_70_0:Get("CanTriggerDeepLinking")
	else
		return false
	end
end

function var_0_0.TriggerDeepLinking(arg_71_0)
	arg_71_0:Call("TriggerDeepLinking")
end

function var_0_0.BindSocial(arg_72_0, arg_72_1)
	if arg_72_1 == 1 then
		arg_72_0:BindFaceBook()
	elseif arg_72_1 == 2 then
		arg_72_0:BindGoogle()
	elseif arg_72_1 == 3 then
		arg_72_0:BindPhone()
	elseif arg_72_1 == 4 then
		-- block empty
	elseif arg_72_1 == 5 then
		arg_72_0:BindApple()
	end
end

function var_0_0.UnbindSocial(arg_73_0, arg_73_1)
	if arg_73_1 == 1 then
		arg_73_0:UnBindFaceBook()
	elseif arg_73_1 == 2 then
		arg_73_0:UnBindGoogle()
	elseif arg_73_1 == 3 then
		arg_73_0:UnBindPhone()
	elseif arg_73_1 == 4 then
		-- block empty
	end
end

function var_0_0.BindFaceBook(arg_74_0)
	arg_74_0:Call("BindFaceBook")
end

function var_0_0.BindApple(arg_75_0)
	arg_75_0:Call("BindApple")
end

function var_0_0.BindGoogle(arg_76_0)
	arg_76_0:Call("BindGoogle")
end

function var_0_0.BindPhone(arg_77_0)
	arg_77_0:Call("BindPhone")
end

function var_0_0.UnBindFaceBook(arg_78_0)
	arg_78_0:Call("UnBindFaceBook")
end

function var_0_0.UnBindGoogle(arg_79_0)
	arg_79_0:Call("UnBindGoogle")
end

function var_0_0.UnBindPhone(arg_80_0)
	arg_80_0:Call("UnBindPhone")
end

function var_0_0.ShowLicence(arg_81_0)
	arg_81_0:Call("ShowLicence")
end

function var_0_0.ShowPrivate(arg_82_0)
	arg_82_0:Call("ShowPrivate")
end

function var_0_0.OpenMiniProgram(arg_83_0)
	arg_83_0:Call("OpenMiniProgram")
end

function var_0_0.GetProduct(arg_84_0, arg_84_1)
	if PLATFORM_CODE == PLATFORM_CHT then
		return arg_84_0:Get("GetProduct", arg_84_1)
	end
end

function var_0_0.GetDeviceId(arg_85_0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return arg_85_0:Get("GetDeviceId")
	elseif PLATFORM_CODE == PLATFORM_KR then
		return arg_85_0:Get("GetDeviceModel")
	elseif PLATFORM_CODE == PLATFORM_CHT then
		return SystemInfo.deviceUniqueIdentifier
	else
		return ""
	end
end

function InLoginScene()
	local function var_86_0()
		return getProxy(UserProxy):GetLoginedFlag()
	end

	if pg.SdkMgr.GetInstance():IsInLoginScene() and not var_86_0() then
		return true
	end

	return false
end

function var_0_0.GetPlatformCode(arg_88_0, arg_88_1)
	if PLATFORM_CODE == PLATFORM_CHT then
		return arg_88_0:Get("GetPackageCode", arg_88_1)
	else
		return nil
	end
end

function var_0_0.IgnorePlatform(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_0.pcode

	if var_89_0 and arg_89_1 and #arg_89_1 > 0 and _.any(arg_89_1, function(arg_90_0)
		return tostring(arg_90_0) == var_89_0
	end) then
		return true
	end

	return false
end
