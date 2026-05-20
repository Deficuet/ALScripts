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
var_0_1.C_SE_LOOP = "C_SE_LOOP"
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

		arg_8_0.criInst:CreateChannel(var_0_1.C_SE_LOOP, CriWareMgr.CRI_CHANNEL_TYPE.MULTI_NOT_REPEAT)

		arg_8_0.criInst:GetChannelData(var_0_1.C_SE_LOOP).channelPlayer.loop = true

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

function var_0_1.PlayPaintingBgm(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5)
	if not arg_17_0._paintingBgmSheets then
		arg_17_0._paintingBgmSheets = {}
	end

	if not arg_17_0._paintingBgmSheetInfo then
		arg_17_0._paintingBgmSheetInfo = {}
	end

	if not arg_17_0._paintingBgmSheetVolume then
		arg_17_0._paintingBgmSheetVolume = {}
	end

	if not table.contains(arg_17_0._paintingBgmSheets, arg_17_1) then
		table.insert(arg_17_0._paintingBgmSheets, arg_17_1)
	end

	if arg_17_3 and arg_17_0._paintingBgmSheetInfo[arg_17_2] then
		return
	end

	arg_17_0._paintingBgmVolumeRate = arg_17_5 or 1

	if arg_17_0._paintingBgmSheetInfo[arg_17_2] and arg_17_0._paintingBgmSheetInfo[arg_17_2].channelPlayer then
		arg_17_0._paintingBgmSheetInfo[arg_17_2].channelPlayer.volume = arg_17_4 * arg_17_5

		print("设置 painting bgm = " .. arg_17_2 .. " 音量 = " .. arg_17_4 .. " 当前音量 = " .. arg_17_0._paintingBgmSheetInfo[arg_17_2].channelPlayer.volume)
	else
		var_0_0.CriMgr.GetInstance():PlaySE_Loop(arg_17_1, arg_17_2, function(arg_18_0)
			if arg_18_0 then
				arg_18_0.channelPlayer.volume = arg_17_4 * arg_17_5

				print("播放 painting bgm = " .. arg_17_2 .. " volume = " .. arg_18_0.channelPlayer.volume)

				arg_17_0._paintingBgmSheetInfo[arg_17_2] = arg_18_0
				arg_17_0._paintingBgmSheetVolume[arg_17_2] = arg_17_4
			end
		end)
	end
end

function var_0_1.ChangeBgmVolume(arg_19_0, arg_19_1)
	if arg_19_0._paintingBgmVolumeRate and arg_19_0._paintingBgmVolumeRate == arg_19_1 then
		return
	end

	arg_19_0._paintingBgmVolumeRate = arg_19_1 or 1

	if arg_19_0._paintingBgmSheetInfo then
		for iter_19_0, iter_19_1 in pairs(arg_19_0._paintingBgmSheetInfo) do
			if iter_19_1 and iter_19_1.channelPlayer then
				iter_19_1.channelPlayer.volume = arg_19_0._paintingBgmSheetVolume[iter_19_0] * arg_19_1

				print("设置 painting bgm = " .. iter_19_0 .. " 音量 = " .. arg_19_1 .. " 当前音量 = " .. iter_19_1.channelPlayer.volume)
			end
		end
	end
end

function var_0_1.StopPaintingBgm(arg_20_0, arg_20_1)
	if arg_20_0._paintingBgmSheetInfo and arg_20_0._paintingBgmSheetInfo[arg_20_1] then
		arg_20_0.criInst:StopSound(arg_20_0._paintingBgmSheetInfo[arg_20_1], CriWareMgr.CRI_FADE_TYPE.FADE_INOUT)

		arg_20_0._paintingBgmSheetInfo[arg_20_1] = nil
	end
end

function var_0_1.DisposePaintingBgm(arg_21_0)
	arg_21_0._paintingBgmSheetInfo = {}
	arg_21_0._paintingBgmSheetVolume = {}

	if arg_21_0._paintingBgmSheets then
		for iter_21_0, iter_21_1 in ipairs(arg_21_0._paintingBgmSheets) do
			var_0_0.CriMgr.GetInstance():UnloadCueSheet(iter_21_1)
		end

		arg_21_0._paintingBgmSheets = nil
	end
end

function var_0_1.LoadCV(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = var_0_1.GetCVBankName(arg_22_1)

	arg_22_0:LoadCueSheet(var_22_0, arg_22_2)
end

function var_0_1.LoadBattleCV(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = var_0_1.GetBattleCVBankName(arg_23_1)

	arg_23_0:LoadCueSheet(var_23_0, arg_23_2)
end

function var_0_1.UnloadCVBank(arg_24_0)
	var_0_1.GetInstance():UnloadCueSheet(arg_24_0)
end

function var_0_1.GetCVBankName(arg_25_0)
	return "cv-" .. arg_25_0
end

function var_0_1.GetBattleCVBankName(arg_26_0)
	return "cv-" .. arg_26_0 .. "-battle"
end

function var_0_1.CheckFModeEvent(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	if not arg_27_1 then
		return
	end

	local var_27_0
	local var_27_1

	string.gsub(arg_27_1, "event:/cv/(.+)/(.+)", function(arg_28_0, arg_28_1)
		local var_28_0 = string.gsub(arg_28_1, "_%w+", "")
		local var_28_1 = tobool(ShipWordHelper.CVBattleKey[var_28_0])

		var_27_0 = "cv-" .. arg_28_0 .. (var_28_1 and "-battle" or "")
		var_27_1 = arg_28_1
	end)
	string.gsub(arg_27_1, "event:/tb/(.+)/(.+)", function(arg_29_0, arg_29_1)
		var_27_0 = "tb-" .. arg_29_0
		var_27_1 = arg_29_1
	end)
	string.gsub(arg_27_1, "event:/educate/(.+)/(.+)", function(arg_30_0, arg_30_1)
		var_27_0 = "educate-" .. arg_30_0
		var_27_1 = arg_30_1
	end)
	string.gsub(arg_27_1, "event:/dorm/(.+)/(.+)", function(arg_31_0, arg_31_1)
		var_27_0 = arg_31_0
		var_27_1 = arg_31_1
	end)

	if string.find(arg_27_1, "event:/educate%-cv/") then
		local var_27_2 = string.split(arg_27_1, "/")

		var_27_1 = var_27_2[#var_27_2]
		var_27_0 = var_27_2[#var_27_2 - 1]
	end

	if var_27_0 and var_27_1 then
		arg_27_2(var_27_0, var_27_1)
	else
		var_27_1 = arg_27_1
		var_27_1 = string.gsub(var_27_1, "event:/(battle)/(.+)", "%1-%2")
		var_27_1 = string.gsub(var_27_1, "event:/(ui)/(.+)", "%1-%2")

		arg_27_3(var_27_1)
	end

	return var_27_0
end

function var_0_1.CheckHasCue(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = CriWare.CriAtom.GetCueSheet(arg_32_1)

	return var_32_0 ~= nil and var_32_0.acb:Exists(arg_32_2)
end

function var_0_1.PlaySoundEffect_V3(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0:CheckFModeEvent(arg_33_1, function(arg_34_0, arg_34_1)
		arg_33_0:PlayCV_V3(arg_34_0, arg_34_1, arg_33_2)
	end, function(arg_35_0)
		arg_33_0:PlaySE_V3(arg_35_0, arg_33_2)
	end)
end

function var_0_1.PlayMultipleSound_V3(arg_36_0, arg_36_1, arg_36_2)
	arg_36_0:CheckFModeEvent(arg_36_1, function(arg_37_0, arg_37_1)
		arg_36_0:CreateCvMultipleHandler(arg_37_0, arg_37_1, arg_36_2)
	end, function(arg_38_0)
		arg_36_0:PlaySE_V3(arg_38_0, arg_36_2)
	end)
end

function var_0_1.StopSoundEffect_V3(arg_39_0, arg_39_1)
	arg_39_0:CheckFModeEvent(arg_39_1, function(arg_40_0, arg_40_1)
		arg_39_0:StopCV_V3()
	end, function(arg_41_0)
		arg_39_0:StopSE_V3()
	end)
end

function var_0_1.UnloadSoundEffect_V3(arg_42_0, arg_42_1)
	arg_42_0:CheckFModeEvent(arg_42_1, function(arg_43_0, arg_43_1)
		arg_42_0:UnloadCueSheet(arg_43_0)
	end, function(arg_44_0)
		arg_42_0:StopSE_V3()
	end)
end

function var_0_1.PlayCV_V3(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	assert(arg_45_1, "cueSheetName can not be nil.")
	assert(arg_45_2, "cueName can not be nil.")
	arg_45_0.criInst:PlayVoice(arg_45_2, CriWareMgr.CRI_FADE_TYPE.NONE, arg_45_1, function(arg_46_0)
		if arg_45_3 ~= nil then
			arg_45_3(arg_46_0)
		end
	end)
end

function var_0_1.CreateCvMultipleHandler(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	if not arg_47_0.luHandle then
		arg_47_0.luHandle = LateUpdateBeat:CreateListener(arg_47_0.LateCvHandler, arg_47_0)

		LateUpdateBeat:AddListener(arg_47_0.luHandle)
	end

	arg_47_0.cvCacheDataList = arg_47_0.cvCacheDataList or {}

	local var_47_0 = true

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.cvCacheDataList) do
		if iter_47_1[1] == arg_47_1 and iter_47_1[2] == arg_47_2 then
			var_47_0 = false

			break
		end
	end

	if var_47_0 then
		arg_47_0.cvCacheDataList[#arg_47_0.cvCacheDataList + 1] = {
			arg_47_1,
			arg_47_2,
			arg_47_3
		}
	end
end

function var_0_1.LateCvHandler(arg_48_0)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.cvCacheDataList) do
		local var_48_0 = iter_48_1[1]
		local var_48_1 = iter_48_1[2]
		local var_48_2 = iter_48_1[3]

		if iter_48_0 == 1 then
			arg_48_0.criInst:PlayVoice(var_48_1, CriWareMgr.CRI_FADE_TYPE.NONE, var_48_0, function(arg_49_0)
				if var_48_2 ~= nil then
					var_48_2(arg_49_0)
				end
			end)
		else
			local var_48_3 = CueData.GetCueData()

			var_48_3.cueSheetName = var_48_0
			var_48_3.channelName = var_0_1.C_BATTLE_CV_EXTRA
			var_48_3.cueName = var_48_1

			onDelayTick(function()
				arg_48_0.criInst:PlaySound(var_48_3, CriWareMgr.CRI_FADE_TYPE.FADE_CROSS, function(arg_51_0)
					if var_48_2 ~= nil then
						var_48_2(arg_51_0)
					end
				end)
			end, iter_48_0 * 0.4)
		end
	end

	arg_48_0.cvCacheDataList = nil

	if arg_48_0.luHandle then
		LateUpdateBeat:RemoveListener(arg_48_0.luHandle)

		arg_48_0.luHandle = nil
	end
end

function var_0_1.StopCV_V3(arg_52_0)
	arg_52_0.criInst:GetChannelData(var_0_1.C_VOICE).channelPlayer:Stop()
end

function var_0_1.PlaySE_V3(arg_53_0, arg_53_1, arg_53_2)
	assert(arg_53_1, "cueName can not be nil.")
	arg_53_0.criInst:PlayAnySE(arg_53_1, nil, function(arg_54_0)
		if arg_53_2 ~= nil then
			arg_53_2(arg_54_0)
		end
	end)
end

function var_0_1.StopSE_V3(arg_55_0)
	arg_55_0.criInst:GetChannelData(var_0_1.C_SE).channelPlayer:Stop()
	arg_55_0.criInst:GetChannelData(var_0_1.C_BATTLE_SE).channelPlayer:Stop()
end

function var_0_1.StopSEBattle_V3(arg_56_0)
	arg_56_0.criInst:GetChannelData(var_0_1.C_BATTLE_SE).channelPlayer:Stop()
end

function var_0_1.PlaySE_Loop(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
	local var_57_0 = CueData.GetCueDataAndInit(var_0_1.C_SE_LOOP, arg_57_1, arg_57_2)

	arg_57_0.criInst:PlaySound(var_57_0, CriWareMgr.CRI_FADE_TYPE.FADE_INOUT, function(arg_58_0)
		if arg_57_3 ~= nil then
			arg_57_3(arg_58_0)
		end
	end)
end

function var_0_1.StopSE_Loop(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = CueData.GetCueDataAndInit(var_0_1.C_SE_LOOP, arg_59_1, arg_59_2)

	arg_59_0.criInst:StopSound(var_59_0, CriWareMgr.CRI_FADE_TYPE.FADE_INOUT)
end

function var_0_1.LoadCueSheet(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = CueData.GetCueData()

	var_60_0.cueSheetName = arg_60_1

	arg_60_0.criInst:LoadCueSheet(var_60_0, function(arg_61_0)
		existCall(arg_60_2, arg_61_0)
	end, true)
end

function var_0_1.UnloadCueSheet(arg_62_0, arg_62_1)
	arg_62_0.criInst:UnloadCueSheet(arg_62_1)
end

function var_0_1.getCVVolume(arg_63_0)
	return PlayerPrefs.GetFloat("cv_vol", DEFAULT_CVVOLUME)
end

function var_0_1.setCVVolume(arg_64_0, arg_64_1)
	PlayerPrefs.SetFloat("cv_vol", arg_64_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, arg_64_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_Mute_Other_CV, arg_64_1)
end

function var_0_1.getBGMVolume(arg_65_0)
	return PlayerPrefs.GetFloat("bgm_vol", DEFAULT_BGMVOLUME)
end

function var_0_1.setBGMVolume(arg_66_0, arg_66_1)
	PlayerPrefs.SetFloat("bgm_vol", arg_66_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, arg_66_1)
end

function var_0_1.getSEVolume(arg_67_0)
	return PlayerPrefs.GetFloat("se_vol", DEFAULT_SEVOLUME)
end

function var_0_1.setSEVolume(arg_68_0, arg_68_1)
	PlayerPrefs.SetFloat("se_vol", arg_68_1)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, arg_68_1)
end

function var_0_1.MuteAllVolume(arg_69_0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, 0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_Mute_Other_CV, 0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, 0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, 0)
end

function var_0_1.ResetAllVolume(arg_70_0)
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_CV, arg_70_0:getCVVolume())
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_Mute_Other_CV, arg_70_0:getCVVolume())
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_BGM, arg_70_0:getBGMVolume())
	CriWare.CriAtom.SetCategoryVolume(var_0_1.Category_SE, arg_70_0:getSEVolume())
end

function var_0_1.InitBgmCfg(arg_71_0, arg_71_1)
	arg_71_0.isDefaultBGM = false

	if OPEN_SPECIAL_IP_BGM and PLATFORM_CODE == PLATFORM_US then
		if Application.isEditor then
			if arg_71_1 then
				arg_71_1()
			end

			return
		end

		local var_71_0 = {
			"Malaysia",
			"Indonesia"
		}
		local var_71_1 = "https://pro.ip-api.com/json/?key=TShzQlq7O9KuthI"
		local var_71_2 = ""

		local function var_71_3(arg_72_0)
			local var_72_0 = "\"country\":\""
			local var_72_1 = "\","
			local var_72_2, var_72_3 = string.find(arg_72_0, var_72_0)

			if var_72_3 then
				arg_72_0 = string.sub(arg_72_0, var_72_3 + 1)
			end

			local var_72_4 = string.find(arg_72_0, var_72_1)

			if var_72_4 then
				arg_72_0 = string.sub(arg_72_0, 1, var_72_4 - 1)
			end

			return arg_72_0
		end

		local function var_71_4(arg_73_0)
			local var_73_0 = false

			for iter_73_0, iter_73_1 in ipairs(var_71_0) do
				if iter_73_1 == arg_73_0 then
					var_73_0 = true
				end
			end

			return var_73_0
		end

		VersionMgr.Inst:WebRequest(var_71_1, function(arg_74_0, arg_74_1)
			local var_74_0 = var_71_3(arg_74_1)

			originalPrint("content: " .. arg_74_1)
			originalPrint("country is: " .. var_74_0)

			arg_71_0.isDefaultBGM = var_71_4(var_74_0)

			originalPrint("IP limit: " .. tostring(arg_71_0.isDefaultBGM))

			if arg_71_1 then
				arg_71_1()
			end
		end)
	elseif arg_71_1 then
		arg_71_1()
	end
end

function var_0_1.IsDefaultBGM(arg_75_0)
	return arg_75_0.isDefaultBGM
end

function var_0_1.getAtomSource(arg_76_0, arg_76_1)
	return GetComponent(GameObject.Find("CRIWARE/" .. arg_76_1), "CriAtomSource")
end

function var_0_1.GetCueInfo(arg_77_0, arg_77_1, arg_77_2, arg_77_3, arg_77_4)
	arg_77_0:LoadCueSheet(arg_77_1, function(arg_78_0)
		if not arg_78_0 then
			warning("加载CueSheet失败")

			return
		end

		local var_78_0 = arg_77_0.criInst:GetCueInfo(arg_77_1, arg_77_2)

		arg_77_3(var_78_0)

		if not arg_77_4 then
			arg_77_0:UnloadCueSheet(arg_77_1)
		end
	end)
end

function var_0_1.SetBgmWaveAnalyzerOnCapture(arg_79_0, arg_79_1, arg_79_2)
	arg_79_0.bgmWaveAnalyzer.OnCaptureL = arg_79_1
	arg_79_0.bgmWaveAnalyzer.OnCaptureR = arg_79_2
end
