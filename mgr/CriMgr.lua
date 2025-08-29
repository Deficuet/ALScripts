pg = pg or {}

local var_0_0 = pg

var_0_0.CriMgr = singletonClass("CriMgr")

local var_0_1 = var_0_0.CriMgr

var_0_1.Category_CV = "Category_CV"
var_0_1.Category_BGM = "Category_BGM"
var_0_1.Category_SE = "Category_SE"
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
		CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, arg_8_0:getCVVolume())
		CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, arg_8_0:getSEVolume())
		CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, arg_8_0:getBGMVolume())

		local var_9_0 = arg_8_0.criInst:GetChannelData(var_0_1.C_VOICE)

		arg_8_0.criInst:CreateChannel(var_0_1.C_GALLERY_MUSIC, CriWareMgr.CRI_CHANNEL_TYPE.SINGLE)

		arg_8_0.criInst:GetChannelData(var_0_1.C_BGM).channelPlayer.loop = true

		arg_8_0.criInst:CreateChannel(var_0_1.C_BATTLE_CV_EXTRA, CriWareMgr.CRI_CHANNEL_TYPE.SINGLE)

		arg_8_0.criInst:GetChannelData(var_0_1.C_BATTLE_CV_EXTRA).channelPlayer.volume = 0.6

		local var_9_1 = GameObject.Find("CRIWARE/C_BGM")

		arg_8_0.bgmWaveAnalyzer = GetOrAddComponent(var_9_1, typeof(CriAtomWaveAnalyzer))

		arg_8_0.bgmWaveAnalyzer:Init()
		arg_8_0.criInst:RemoveChannel(var_0_1.C_TIMELINE)
		arg_8_0.criInst:CreateChannel(var_0_1.C_TIMELINE, CriWareMgr.CRI_CHANNEL_TYPE.MULTI)
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

function var_0_1.LoadCV(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = var_0_1.GetCVBankName(arg_14_1)

	arg_14_0:LoadCueSheet(var_14_0, arg_14_2)
end

function var_0_1.LoadBattleCV(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = var_0_1.GetBattleCVBankName(arg_15_1)

	arg_15_0:LoadCueSheet(var_15_0, arg_15_2)
end

function var_0_1.UnloadCVBank(arg_16_0)
	var_0_1.GetInstance():UnloadCueSheet(arg_16_0)
end

function var_0_1.GetCVBankName(arg_17_0)
	return "cv-" .. arg_17_0
end

function var_0_1.GetBattleCVBankName(arg_18_0)
	return "cv-" .. arg_18_0 .. "-battle"
end

function var_0_1.CheckFModeEvent(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if not arg_19_1 then
		return
	end

	local var_19_0
	local var_19_1

	string.gsub(arg_19_1, "event:/cv/(.+)/(.+)", function(arg_20_0, arg_20_1)
		local var_20_0 = string.gsub(arg_20_1, "_%w+", "")
		local var_20_1 = tobool(ShipWordHelper.CVBattleKey[var_20_0])

		var_19_0 = "cv-" .. arg_20_0 .. (var_20_1 and "-battle" or "")
		var_19_1 = arg_20_1
	end)
	string.gsub(arg_19_1, "event:/tb/(.+)/(.+)", function(arg_21_0, arg_21_1)
		var_19_0 = "tb-" .. arg_21_0
		var_19_1 = arg_21_1
	end)
	string.gsub(arg_19_1, "event:/educate/(.+)/(.+)", function(arg_22_0, arg_22_1)
		var_19_0 = "educate-" .. arg_22_0
		var_19_1 = arg_22_1
	end)
	string.gsub(arg_19_1, "event:/dorm/(.+)/(.+)", function(arg_23_0, arg_23_1)
		var_19_0 = arg_23_0
		var_19_1 = arg_23_1
	end)

	if string.find(arg_19_1, "event:/educate%-cv/") then
		local var_19_2 = string.split(arg_19_1, "/")

		var_19_1 = var_19_2[#var_19_2]
		var_19_0 = var_19_2[#var_19_2 - 1]
	end

	if var_19_0 and var_19_1 then
		arg_19_2(var_19_0, var_19_1)
	else
		var_19_1 = arg_19_1
		var_19_1 = string.gsub(var_19_1, "event:/(battle)/(.+)", "%1-%2")
		var_19_1 = string.gsub(var_19_1, "event:/(ui)/(.+)", "%1-%2")

		arg_19_3(var_19_1)
	end
end

function var_0_1.CheckHasCue(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = CriWare.CriAtom.GetCueSheet(arg_24_1)

	return var_24_0 ~= nil and var_24_0.acb:Exists(arg_24_2)
end

function var_0_1.PlaySoundEffect_V3(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0:CheckFModeEvent(arg_25_1, function(arg_26_0, arg_26_1)
		arg_25_0:PlayCV_V3(arg_26_0, arg_26_1, arg_25_2)
	end, function(arg_27_0)
		arg_25_0:PlaySE_V3(arg_27_0, arg_25_2)
	end)
end

function var_0_1.PlayMultipleSound_V3(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0:CheckFModeEvent(arg_28_1, function(arg_29_0, arg_29_1)
		arg_28_0:CreateCvMultipleHandler(arg_29_0, arg_29_1, arg_28_2)
	end, function(arg_30_0)
		arg_28_0:PlaySE_V3(arg_30_0, arg_28_2)
	end)
end

function var_0_1.StopSoundEffect_V3(arg_31_0, arg_31_1)
	arg_31_0:CheckFModeEvent(arg_31_1, function(arg_32_0, arg_32_1)
		arg_31_0:StopCV_V3()
	end, function(arg_33_0)
		arg_31_0:StopSE_V3()
	end)
end

function var_0_1.UnloadSoundEffect_V3(arg_34_0, arg_34_1)
	arg_34_0:CheckFModeEvent(arg_34_1, function(arg_35_0, arg_35_1)
		arg_34_0:UnloadCueSheet(arg_35_0)
	end, function(arg_36_0)
		arg_34_0:StopSE_V3()
	end)
end

function var_0_1.PlayCV_V3(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	assert(arg_37_1, "cueSheetName can not be nil.")
	assert(arg_37_2, "cueName can not be nil.")
	arg_37_0.criInst:PlayVoice(arg_37_2, CriWareMgr.CRI_FADE_TYPE.NONE, arg_37_1, function(arg_38_0)
		if arg_37_3 ~= nil then
			arg_37_3(arg_38_0)
		end
	end)
end

function var_0_1.CreateCvMultipleHandler(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if not arg_39_0.luHandle then
		arg_39_0.luHandle = LateUpdateBeat:CreateListener(arg_39_0.LateCvHandler, arg_39_0)

		LateUpdateBeat:AddListener(arg_39_0.luHandle)
	end

	arg_39_0.cvCacheDataList = arg_39_0.cvCacheDataList or {}

	local var_39_0 = true

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.cvCacheDataList) do
		if iter_39_1[1] == arg_39_1 and iter_39_1[2] == arg_39_2 then
			var_39_0 = false

			break
		end
	end

	if var_39_0 then
		arg_39_0.cvCacheDataList[#arg_39_0.cvCacheDataList + 1] = {
			arg_39_1,
			arg_39_2,
			arg_39_3
		}
	end
end

function var_0_1.LateCvHandler(arg_40_0)
	for iter_40_0, iter_40_1 in ipairs(arg_40_0.cvCacheDataList) do
		local var_40_0 = iter_40_1[1]
		local var_40_1 = iter_40_1[2]
		local var_40_2 = iter_40_1[3]

		if iter_40_0 == 1 then
			arg_40_0.criInst:PlayVoice(var_40_1, CriWareMgr.CRI_FADE_TYPE.NONE, var_40_0, function(arg_41_0)
				if var_40_2 ~= nil then
					var_40_2(arg_41_0)
				end
			end)
		else
			local var_40_3 = CueData.GetCueData()

			var_40_3.cueSheetName = var_40_0
			var_40_3.channelName = var_0_1.C_BATTLE_CV_EXTRA
			var_40_3.cueName = var_40_1

			onDelayTick(function()
				arg_40_0.criInst:PlaySound(var_40_3, CriWareMgr.CRI_FADE_TYPE.FADE_CROSS, function(arg_43_0)
					if var_40_2 ~= nil then
						var_40_2(arg_43_0)
					end
				end)
			end, iter_40_0 * 0.4)
		end
	end

	arg_40_0.cvCacheDataList = nil

	if arg_40_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_40_0.luHandle)

		arg_40_0.luHandle = nil
	end
end

function var_0_1.StopCV_V3(arg_44_0)
	arg_44_0.criInst:GetChannelData(var_0_1.C_VOICE).channelPlayer:Stop()
end

function var_0_1.PlaySE_V3(arg_45_0, arg_45_1, arg_45_2)
	assert(arg_45_1, "cueName can not be nil.")
	arg_45_0.criInst:PlayAnySE(arg_45_1, nil, function(arg_46_0)
		if arg_45_2 ~= nil then
			arg_45_2(arg_46_0)
		end
	end)
end

function var_0_1.StopSE_V3(arg_47_0)
	arg_47_0.criInst:GetChannelData(var_0_1.C_SE).channelPlayer:Stop()
	arg_47_0.criInst:GetChannelData(var_0_1.C_BATTLE_SE).channelPlayer:Stop()
end

function var_0_1.StopSEBattle_V3(arg_48_0)
	arg_48_0.criInst:GetChannelData(var_0_1.C_BATTLE_SE).channelPlayer:Stop()
end

function var_0_1.LoadCueSheet(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = CueData.GetCueData()

	var_49_0.cueSheetName = arg_49_1

	arg_49_0.criInst:LoadCueSheet(var_49_0, function(arg_50_0)
		existCall(arg_49_2, arg_50_0)
	end, true)
end

function var_0_1.UnloadCueSheet(arg_51_0, arg_51_1)
	arg_51_0.criInst:UnloadCueSheet(arg_51_1)
end

function var_0_1.getCVVolume(arg_52_0)
	return PlayerPrefs.GetFloat("cv_vol", DEFAULT_CVVOLUME)
end

function var_0_1.setCVVolume(arg_53_0, arg_53_1)
	PlayerPrefs.SetFloat("cv_vol", arg_53_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, arg_53_1)
end

function var_0_1.getBGMVolume(arg_54_0)
	return PlayerPrefs.GetFloat("bgm_vol", DEFAULT_BGMVOLUME)
end

function var_0_1.setBGMVolume(arg_55_0, arg_55_1)
	PlayerPrefs.SetFloat("bgm_vol", arg_55_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, arg_55_1)
end

function var_0_1.getSEVolume(arg_56_0)
	return PlayerPrefs.GetFloat("se_vol", DEFAULT_SEVOLUME)
end

function var_0_1.setSEVolume(arg_57_0, arg_57_1)
	PlayerPrefs.SetFloat("se_vol", arg_57_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, arg_57_1)
end

function var_0_1.InitBgmCfg(arg_58_0, arg_58_1)
	arg_58_0.isDefaultBGM = false

	if OPEN_SPECIAL_IP_BGM and PLATFORM_CODE == PLATFORM_US then
		if Application.isEditor then
			if arg_58_1 then
				arg_58_1()
			end

			return
		end

		local var_58_0 = {
			"Malaysia",
			"Indonesia"
		}
		local var_58_1 = "https://pro.ip-api.com/json/?key=TShzQlq7O9KuthI"
		local var_58_2 = ""

		local function var_58_3(arg_59_0)
			local var_59_0 = "\"country\":\""
			local var_59_1 = "\","
			local var_59_2, var_59_3 = string.find(arg_59_0, var_59_0)

			if var_59_3 then
				arg_59_0 = string.sub(arg_59_0, var_59_3 + 1)
			end

			local var_59_4 = string.find(arg_59_0, var_59_1)

			if var_59_4 then
				arg_59_0 = string.sub(arg_59_0, 1, var_59_4 - 1)
			end

			return arg_59_0
		end

		local function var_58_4(arg_60_0)
			local var_60_0 = false

			for iter_60_0, iter_60_1 in ipairs(var_58_0) do
				if iter_60_1 == arg_60_0 then
					var_60_0 = true
				end
			end

			return var_60_0
		end

		VersionMgr.Inst:WebRequest(var_58_1, function(arg_61_0, arg_61_1)
			local var_61_0 = var_58_3(arg_61_1)

			originalPrint("content: " .. arg_61_1)
			originalPrint("country is: " .. var_61_0)

			arg_58_0.isDefaultBGM = var_58_4(var_61_0)

			originalPrint("IP limit: " .. tostring(arg_58_0.isDefaultBGM))

			if arg_58_1 then
				arg_58_1()
			end
		end)
	elseif arg_58_1 then
		arg_58_1()
	end
end

function var_0_1.IsDefaultBGM(arg_62_0)
	return arg_62_0.isDefaultBGM
end

function var_0_1.getAtomSource(arg_63_0, arg_63_1)
	return GetComponent(GameObject.Find("CRIWARE/" .. arg_63_1), "CriAtomSource")
end

function var_0_1.GetCueInfo(arg_64_0, arg_64_1, arg_64_2, arg_64_3, arg_64_4)
	arg_64_0:LoadCueSheet(arg_64_1, function(arg_65_0)
		if not arg_65_0 then
			warning("加载CueSheet失败")

			return
		end

		local var_65_0 = arg_64_0.criInst:GetCueInfo(arg_64_1, arg_64_2)

		arg_64_3(var_65_0)

		if not arg_64_4 then
			arg_64_0:UnloadCueSheet(arg_64_1)
		end
	end)
end

function var_0_1.SetBgmWaveAnalyzerOnCapture(arg_66_0, arg_66_1, arg_66_2)
	arg_66_0.bgmWaveAnalyzer.OnCaptureL = arg_66_1
	arg_66_0.bgmWaveAnalyzer.OnCaptureR = arg_66_2
end
