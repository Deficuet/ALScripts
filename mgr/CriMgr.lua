pg = pg or {}

local var_0_0 = pg

var_0_0.CriMgr = singletonClass("CriMgr")

local var_0_1 = var_0_0.CriMgr

var_0_1.Category_CV = "Category_CV"
var_0_1.Category_BGM = "Category_BGM"
var_0_1.Category_SE = "Category_SE"
var_0_1.Category_Mute_Other_CV = "Mute_Other_CV"
var_0_1.C_BGM = "C_BGM"
var_0_1.C_VOICE = "cv"
var_0_1.C_SE = "C_SE"
var_0_1.C_BATTLE_SE = "C_BATTLE_SE"
var_0_1.C_GALLERY_MUSIC = "C_GALLERY_MUSIC"
var_0_1.C_BATTLE_CV_EXTRA = "C_BATTLE_CV_EXTRA"
var_0_1.C_TIMELINE = "C_TIMELINE"
var_0_1.NEXT_VER = 40

function var_0_1.Init(arg_1_0, arg_1_1)
	print("initializing cri manager...")
	seriesAsync({
		function(arg_2_0)
			arg_1_0:InitCri(arg_2_0)
		end,
		function(arg_3_0)
			local var_3_0 = CueData.GetCueData()

			var_3_0.cueSheetName = "se-ui"
			var_3_0.channelName = var_0_1.C_SE

			arg_1_0.criInst:LoadCueSheet(var_3_0, function(arg_4_0)
				arg_3_0()
			end, true)
		end,
		function(arg_5_0)
			local var_5_0 = CueData.GetCueData()

			var_5_0.cueSheetName = "se-battle"
			var_5_0.channelName = var_0_1.C_BATTLE_SE

			arg_1_0.criInst:LoadCueSheet(var_5_0, function(arg_6_0)
				arg_5_0()
			end, true)
		end,
		function(arg_7_0)
			arg_1_0:InitBgmCfg(arg_7_0)
		end
	}, arg_1_1)
end

function var_0_1.InitCri(arg_8_0, arg_8_1)
	local var_8_0 = GameObject.Find("CRIWARE")

	var_8_0:AddComponent(typeof(CriWareMgr))

	arg_8_0.criInitializer = var_8_0:GetComponent(typeof(CriWare.CriWareInitializer))
	arg_8_0.criInitializer.fileSystemConfig.numberOfLoaders = 128
	arg_8_0.criInitializer.manaConfig.numberOfDecoders = 128
	arg_8_0.criInitializer.atomConfig.useRandomSeedWithTime = true
	arg_8_0.criInitializer.DecrypterConfig.key = "621561580448882"

	arg_8_0.criInitializer:Initialize()

	arg_8_0.criInst = CriWareMgr.Inst

	arg_8_0.criInst:Init(function()
		arg_8_0:ResetAllVolume()

		local var_9_0 = arg_8_0.criInst:GetChannelData(var_0_1.C_VOICE)

		arg_8_0.criInst:CreateChannel(var_0_1.C_GALLERY_MUSIC, CriWareMgr.CRI_CHANNEL_TYPE.SINGLE)

		arg_8_0.criInst:GetChannelData(var_0_1.C_BGM).channelPlayer.loop = true

		arg_8_0.criInst:CreateChannel(var_0_1.C_BATTLE_CV_EXTRA, CriWareMgr.CRI_CHANNEL_TYPE.SINGLE)

		arg_8_0.criInst:GetChannelData(var_0_1.C_BATTLE_CV_EXTRA).channelPlayer.volume = 0.6

		local var_9_1 = GameObject.Find("CRIWARE/C_BGM")

		arg_8_0.bgmWaveAnalyzer = GetOrAddComponent(var_9_1, typeof(CriAtomWaveAnalyzer))

		arg_8_0.bgmWaveAnalyzer:Init()
		arg_8_1()
	end)
end

function var_0_1.PlayBGM(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = "bgm-" .. arg_10_1

	if arg_10_0.bgmName == var_10_0 then
		return
	end

	arg_10_0.bgmName = var_10_0

	arg_10_0.criInst:PlayBGM(var_10_0, CriWareMgr.CRI_FADE_TYPE.FADE_INOUT, function(arg_11_0)
		if arg_11_0 == nil then
			warning("Missing BGM :" .. (arg_10_1 or "NIL"))
		end
	end)
end

function var_0_1.StopBGM(arg_12_0)
	arg_12_0.criInst:StopBGM(CriWareMgr.CRI_FADE_TYPE.FADE_INOUT)

	arg_12_0.bgmName = nil
end

function var_0_1.StopPlaybackInfoForce(arg_13_0, arg_13_1)
	arg_13_1.playback:Stop(true)
end

function var_0_1.playCueSheetVoice(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	assert(arg_14_1, "cueSheetName can not be nil.")
	assert(arg_14_2, "cueName can not be nil.")

	if arg_14_3 then
		arg_14_0.criInst:PlaySE(arg_14_2, arg_14_1, function(arg_15_0)
			if arg_14_4 ~= nil then
				arg_14_4(arg_15_0)
			end
		end)
	else
		arg_14_0.criInst:PlayVoice(arg_14_2, CriWareMgr.CRI_FADE_TYPE.NONE, arg_14_1, function(arg_16_0)
			if arg_14_4 ~= nil then
				arg_14_4(arg_16_0)
			end
		end)
	end
end

function var_0_1.LoadCV(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = var_0_1.GetCVBankName(arg_17_1)

	arg_17_0:LoadCueSheet(var_17_0, arg_17_2)
end

function var_0_1.LoadBattleCV(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = var_0_1.GetBattleCVBankName(arg_18_1)

	arg_18_0:LoadCueSheet(var_18_0, arg_18_2)
end

function var_0_1.UnloadCVBank(arg_19_0)
	var_0_1.GetInstance():UnloadCueSheet(arg_19_0)
end

function var_0_1.GetCVBankName(arg_20_0)
	return "cv-" .. arg_20_0
end

function var_0_1.GetBattleCVBankName(arg_21_0)
	return "cv-" .. arg_21_0 .. "-battle"
end

function var_0_1.CheckFModeEvent(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if not arg_22_1 then
		return
	end

	local var_22_0
	local var_22_1

	string.gsub(arg_22_1, "event:/cv/(.+)/(.+)", function(arg_23_0, arg_23_1)
		local var_23_0 = string.gsub(arg_23_1, "_%w+", "")
		local var_23_1 = tobool(ShipWordHelper.CVBattleKey[var_23_0])

		var_22_0 = "cv-" .. arg_23_0 .. (var_23_1 and "-battle" or "")
		var_22_1 = arg_23_1
	end)
	string.gsub(arg_22_1, "event:/tb/(.+)/(.+)", function(arg_24_0, arg_24_1)
		var_22_0 = "tb-" .. arg_24_0
		var_22_1 = arg_24_1
	end)
	string.gsub(arg_22_1, "event:/educate/(.+)/(.+)", function(arg_25_0, arg_25_1)
		var_22_0 = "educate-" .. arg_25_0
		var_22_1 = arg_25_1
	end)
	string.gsub(arg_22_1, "event:/dorm/(.+)/(.+)", function(arg_26_0, arg_26_1)
		var_22_0 = arg_26_0
		var_22_1 = arg_26_1
	end)

	if string.find(arg_22_1, "event:/educate%-cv/") then
		local var_22_2 = string.split(arg_22_1, "/")

		var_22_1 = var_22_2[#var_22_2]
		var_22_0 = var_22_2[#var_22_2 - 1]
	end

	if var_22_0 and var_22_1 then
		arg_22_2(var_22_0, var_22_1)
	else
		var_22_1 = arg_22_1
		var_22_1 = string.gsub(var_22_1, "event:/(battle)/(.+)", "%1-%2")
		var_22_1 = string.gsub(var_22_1, "event:/(ui)/(.+)", "%1-%2")

		arg_22_3(var_22_1)
	end
end

function var_0_1.CheckHasCue(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = CriWare.CriAtom.GetCueSheet(arg_27_1)

	return var_27_0 ~= nil and var_27_0.acb:Exists(arg_27_2)
end

function var_0_1.PlaySoundEffect_V3(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0:CheckFModeEvent(arg_28_1, function(arg_29_0, arg_29_1)
		arg_28_0:PlayCV_V3(arg_29_0, arg_29_1, arg_28_2)
	end, function(arg_30_0)
		arg_28_0:PlaySE_V3(arg_30_0, arg_28_2)
	end)
end

function var_0_1.PlayMultipleSound_V3(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0:CheckFModeEvent(arg_31_1, function(arg_32_0, arg_32_1)
		arg_31_0:CreateCvMultipleHandler(arg_32_0, arg_32_1, arg_31_2)
	end, function(arg_33_0)
		arg_31_0:PlaySE_V3(arg_33_0, arg_31_2)
	end)
end

function var_0_1.StopSoundEffect_V3(arg_34_0, arg_34_1)
	arg_34_0:CheckFModeEvent(arg_34_1, function(arg_35_0, arg_35_1)
		arg_34_0:StopCV_V3()
	end, function(arg_36_0)
		arg_34_0:StopSE_V3()
	end)
end

function var_0_1.UnloadSoundEffect_V3(arg_37_0, arg_37_1)
	arg_37_0:CheckFModeEvent(arg_37_1, function(arg_38_0, arg_38_1)
		arg_37_0:UnloadCueSheet(arg_38_0)
	end, function(arg_39_0)
		arg_37_0:StopSE_V3()
	end)
end

function var_0_1.PlayCV_V3(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	assert(arg_40_1, "cueSheetName can not be nil.")
	assert(arg_40_2, "cueName can not be nil.")
	arg_40_0.criInst:PlayVoice(arg_40_2, CriWareMgr.CRI_FADE_TYPE.NONE, arg_40_1, function(arg_41_0)
		if arg_40_3 ~= nil then
			arg_40_3(arg_41_0)
		end
	end)
end

function var_0_1.CreateCvMultipleHandler(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	if not arg_42_0.luHandle then
		arg_42_0.luHandle = LateUpdateBeat:CreateListener(arg_42_0.LateCvHandler, arg_42_0)

		LateUpdateBeat:AddListener(arg_42_0.luHandle)
	end

	arg_42_0.cvCacheDataList = arg_42_0.cvCacheDataList or {}

	local var_42_0 = true

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.cvCacheDataList) do
		if iter_42_1[1] == arg_42_1 and iter_42_1[2] == arg_42_2 then
			var_42_0 = false

			break
		end
	end

	if var_42_0 then
		arg_42_0.cvCacheDataList[#arg_42_0.cvCacheDataList + 1] = {
			arg_42_1,
			arg_42_2,
			arg_42_3
		}
	end
end

function var_0_1.LateCvHandler(arg_43_0)
	for iter_43_0, iter_43_1 in ipairs(arg_43_0.cvCacheDataList) do
		local var_43_0 = iter_43_1[1]
		local var_43_1 = iter_43_1[2]
		local var_43_2 = iter_43_1[3]

		if iter_43_0 == 1 then
			arg_43_0.criInst:PlayVoice(var_43_1, CriWareMgr.CRI_FADE_TYPE.NONE, var_43_0, function(arg_44_0)
				if var_43_2 ~= nil then
					var_43_2(arg_44_0)
				end
			end)
		else
			local var_43_3 = CueData.GetCueData()

			var_43_3.cueSheetName = var_43_0
			var_43_3.channelName = var_0_1.C_BATTLE_CV_EXTRA
			var_43_3.cueName = var_43_1

			onDelayTick(function()
				arg_43_0.criInst:PlaySound(var_43_3, CriWareMgr.CRI_FADE_TYPE.FADE_CROSS, function(arg_46_0)
					if var_43_2 ~= nil then
						var_43_2(arg_46_0)
					end
				end)
			end, iter_43_0 * 0.4)
		end
	end

	arg_43_0.cvCacheDataList = nil

	if arg_43_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_43_0.luHandle)

		arg_43_0.luHandle = nil
	end
end

function var_0_1.StopCV_V3(arg_47_0)
	arg_47_0.criInst:GetChannelData(var_0_1.C_VOICE).channelPlayer:Stop()
end

function var_0_1.PlaySE_V3(arg_48_0, arg_48_1, arg_48_2)
	assert(arg_48_1, "cueName can not be nil.")
	arg_48_0.criInst:PlayAnySE(arg_48_1, nil, function(arg_49_0)
		if arg_48_2 ~= nil then
			arg_48_2(arg_49_0)
		end
	end)
end

function var_0_1.StopSE_V3(arg_50_0)
	arg_50_0.criInst:GetChannelData(var_0_1.C_SE).channelPlayer:Stop()
	arg_50_0.criInst:GetChannelData(var_0_1.C_BATTLE_SE).channelPlayer:Stop()
end

function var_0_1.StopSEBattle_V3(arg_51_0)
	arg_51_0.criInst:GetChannelData(var_0_1.C_BATTLE_SE).channelPlayer:Stop()
end

function var_0_1.LoadCueSheet(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = CueData.GetCueData()

	var_52_0.cueSheetName = arg_52_1

	arg_52_0.criInst:LoadCueSheet(var_52_0, function(arg_53_0)
		existCall(arg_52_2, arg_53_0)
	end, true)
end

function var_0_1.UnloadCueSheet(arg_54_0, arg_54_1)
	arg_54_0.criInst:UnloadCueSheet(arg_54_1)
end

function var_0_1.getCVVolume(arg_55_0)
	return PlayerPrefs.GetFloat("cv_vol", DEFAULT_CVVOLUME)
end

function var_0_1.setCVVolume(arg_56_0, arg_56_1)
	PlayerPrefs.SetFloat("cv_vol", arg_56_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, arg_56_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_Mute_Other_CV, arg_56_1)
end

function var_0_1.getBGMVolume(arg_57_0)
	return PlayerPrefs.GetFloat("bgm_vol", DEFAULT_BGMVOLUME)
end

function var_0_1.setBGMVolume(arg_58_0, arg_58_1)
	PlayerPrefs.SetFloat("bgm_vol", arg_58_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, arg_58_1)
end

function var_0_1.getSEVolume(arg_59_0)
	return PlayerPrefs.GetFloat("se_vol", DEFAULT_SEVOLUME)
end

function var_0_1.setSEVolume(arg_60_0, arg_60_1)
	PlayerPrefs.SetFloat("se_vol", arg_60_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, arg_60_1)
end

function var_0_1.MuteAllVolume(arg_61_0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, 0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_Mute_Other_CV, 0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, 0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, 0)
end

function var_0_1.ResetAllVolume(arg_62_0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, arg_62_0:getCVVolume())
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_Mute_Other_CV, arg_62_0:getCVVolume())
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, arg_62_0:getBGMVolume())
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, arg_62_0:getSEVolume())
end

function var_0_1.InitBgmCfg(arg_63_0, arg_63_1)
	arg_63_0.isDefaultBGM = false

	if OPEN_SPECIAL_IP_BGM and PLATFORM_CODE == PLATFORM_US then
		if Application.isEditor then
			if arg_63_1 then
				arg_63_1()
			end

			return
		end

		local var_63_0 = {
			"Malaysia",
			"Indonesia"
		}
		local var_63_1 = "https://pro.ip-api.com/json/?key=TShzQlq7O9KuthI"
		local var_63_2 = ""

		local function var_63_3(arg_64_0)
			local var_64_0 = "\"country\":\""
			local var_64_1 = "\","
			local var_64_2, var_64_3 = string.find(arg_64_0, var_64_0)

			if var_64_3 then
				arg_64_0 = string.sub(arg_64_0, var_64_3 + 1)
			end

			local var_64_4 = string.find(arg_64_0, var_64_1)

			if var_64_4 then
				arg_64_0 = string.sub(arg_64_0, 1, var_64_4 - 1)
			end

			return arg_64_0
		end

		local function var_63_4(arg_65_0)
			local var_65_0 = false

			for iter_65_0, iter_65_1 in ipairs(var_63_0) do
				if iter_65_1 == arg_65_0 then
					var_65_0 = true
				end
			end

			return var_65_0
		end

		VersionMgr.Inst:WebRequest(var_63_1, function(arg_66_0, arg_66_1)
			local var_66_0 = var_63_3(arg_66_1)

			originalPrint("content: " .. arg_66_1)
			originalPrint("country is: " .. var_66_0)

			arg_63_0.isDefaultBGM = var_63_4(var_66_0)

			originalPrint("IP limit: " .. tostring(arg_63_0.isDefaultBGM))

			if arg_63_1 then
				arg_63_1()
			end
		end)
	elseif arg_63_1 then
		arg_63_1()
	end
end

function var_0_1.IsDefaultBGM(arg_67_0)
	return arg_67_0.isDefaultBGM
end

function var_0_1.getAtomSource(arg_68_0, arg_68_1)
	return GetComponent(GameObject.Find("CRIWARE/" .. arg_68_1), "CriAtomSource")
end

function var_0_1.GetCueInfo(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4)
	arg_69_0:LoadCueSheet(arg_69_1, function(arg_70_0)
		if not arg_70_0 then
			warning("加载CueSheet失败")

			return
		end

		local var_70_0 = arg_69_0.criInst:GetCueInfo(arg_69_1, arg_69_2)

		arg_69_3(var_70_0)

		if not arg_69_4 then
			arg_69_0:UnloadCueSheet(arg_69_1)
		end
	end)
end

function var_0_1.SetBgmWaveAnalyzerOnCapture(arg_71_0, arg_71_1, arg_71_2)
	arg_71_0.bgmWaveAnalyzer.OnCaptureL = arg_71_1
	arg_71_0.bgmWaveAnalyzer.OnCaptureR = arg_71_2
end
