local var_0_0 = class("SettingsProxy", pm.Proxy)

function var_0_0.onRegister(arg_1_0)
	arg_1_0._isBgmEnble = PlayerPrefs.GetInt("ShipSkinBGM", 1) > 0
	arg_1_0._ShowBg = PlayerPrefs.GetInt("disableBG", 1) > 0
	arg_1_0._ShowLive2d = PlayerPrefs.GetInt("disableLive2d", 1) > 0
	arg_1_0._selectedShipId = PlayerPrefs.GetInt("playerShipId")
	arg_1_0._backyardFoodRemind = PlayerPrefs.GetString("backyardRemind")
	arg_1_0._userAgreement = PlayerPrefs.GetInt("userAgreement", 0)
	arg_1_0._showMaxLevelHelp = PlayerPrefs.GetInt("maxLevelHelp", 0) > 0
	arg_1_0._nextTipAutoBattleTime = PlayerPrefs.GetInt("AutoBattleTip", 0)
	arg_1_0._setFlagShip = PlayerPrefs.GetInt("setFlagShip", 0) > 0
	arg_1_0._setFlagShipForSkinAtlas = PlayerPrefs.GetInt("setFlagShipforskinatlas", 0) > 0
	arg_1_0._setFlagRandom = PlayerPrefs.GetInt("setFlagRandom", 0) > 0
	arg_1_0._screenRatio = PlayerPrefs.GetFloat("SetScreenRatio", ADAPT_TARGET)
	arg_1_0.storyAutoPlayCode = PlayerPrefs.GetInt("story_autoplay_flag", 0)
	NotchAdapt.CheckNotchRatio = arg_1_0._screenRatio
	arg_1_0._nextTipActBossTime = PlayerPrefs.GetInt("ActBossTipLastTime", 0)

	if GetZeroTime() <= arg_1_0._nextTipActBossTime then
		arg_1_0.nextTipActBossExchangeTicket = PlayerPrefs.GetInt("ActBossTip", 0)
	end

	arg_1_0:resetEquipSceneIndex()

	arg_1_0._isShowCollectionHelp = PlayerPrefs.GetInt("collection_Help", 0) > 0
	arg_1_0.showMainSceneWordTip = PlayerPrefs.GetInt("main_scene_word_toggle", 1) > 0
	arg_1_0.lastRequestVersionTime = nil
	arg_1_0.worldBossFlag = {}
	arg_1_0.worldFlag = {}
end

function var_0_0.SetWorldBossFlag(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.worldBossFlag[arg_2_1] ~= arg_2_2 then
		arg_2_0.worldBossFlag[arg_2_1] = arg_2_2

		PlayerPrefs.SetInt("worldBossFlag" .. arg_2_1, arg_2_2 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldBossFlag(arg_3_0, arg_3_1)
	if not arg_3_0.worldBossFlag[arg_3_1] then
		arg_3_0.worldBossFlag[arg_3_1] = PlayerPrefs.GetInt("worldBossFlag" .. arg_3_1, 1) > 0
	end

	return arg_3_0.worldBossFlag[arg_3_1]
end

function var_0_0.SetWorldFlag(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.worldFlag[arg_4_1] ~= arg_4_2 then
		arg_4_0.worldFlag[arg_4_1] = arg_4_2

		PlayerPrefs.SetInt("world_flag_" .. arg_4_1, arg_4_2 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldFlag(arg_5_0, arg_5_1)
	if not arg_5_0.worldFlag[arg_5_1] then
		arg_5_0.worldFlag[arg_5_1] = PlayerPrefs.GetInt("world_flag_" .. arg_5_1, 0) > 0
	end

	return arg_5_0.worldFlag[arg_5_1]
end

function var_0_0.GetDockYardLockBtnFlag(arg_6_0)
	if not arg_6_0.dockYardLockFlag then
		local var_6_0 = getProxy(PlayerProxy):getRawData().id

		arg_6_0.dockYardLockFlag = PlayerPrefs.GetInt("DockYardLockFlag" .. var_6_0, 0) > 0
	end

	return arg_6_0.dockYardLockFlag
end

function var_0_0.SetDockYardLockBtnFlag(arg_7_0, arg_7_1)
	if arg_7_0.dockYardLockFlag ~= arg_7_1 then
		local var_7_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("DockYardLockFlag" .. var_7_0, arg_7_1 and 1 or 0)
		PlayerPrefs.Save()

		arg_7_0.dockYardLockFlag = arg_7_1
	end
end

function var_0_0.GetDockYardLevelBtnFlag(arg_8_0)
	if not arg_8_0.dockYardLevelFlag then
		local var_8_0 = getProxy(PlayerProxy):getRawData().id

		arg_8_0.dockYardLevelFlag = PlayerPrefs.GetInt("DockYardLevelFlag" .. var_8_0, 0) > 0
	end

	return arg_8_0.dockYardLevelFlag
end

function var_0_0.SetDockYardLevelBtnFlag(arg_9_0, arg_9_1)
	if arg_9_0.dockYardLevelFlag ~= arg_9_1 then
		local var_9_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("DockYardLevelFlag" .. var_9_0, arg_9_1 and 1 or 0)
		PlayerPrefs.Save()

		arg_9_0.dockYardLevelFlag = arg_9_1
	end
end

function var_0_0.IsShowCollectionHelp(arg_10_0)
	return arg_10_0._isShowCollectionHelp
end

function var_0_0.SetCollectionHelpFlag(arg_11_0, arg_11_1)
	if arg_11_0._isShowCollectionHelp ~= arg_11_1 then
		arg_11_0._isShowCollectionHelp = arg_11_1

		PlayerPrefs.SetInt("collection_Help", arg_11_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsBGMEnable(arg_12_0)
	return arg_12_0._isBgmEnble
end

function var_0_0.SetBgmFlag(arg_13_0, arg_13_1)
	if arg_13_0._isBgmEnble ~= arg_13_1 then
		arg_13_0._isBgmEnble = arg_13_1

		PlayerPrefs.SetInt("ShipSkinBGM", arg_13_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsEnableMainMusicPlayer(arg_14_0)
	return true
end

function var_0_0.getSkinPosSetting(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:GetRecordPosKey()
	local var_15_1 = arg_15_0:GetCurrMainUIStyleKeyForSkinShop()

	if PlayerPrefs.HasKey(var_15_1 .. tostring(var_15_0) .. "_scale") then
		local var_15_2 = PlayerPrefs.GetFloat(var_15_1 .. tostring(var_15_0) .. "_x", 0)
		local var_15_3 = PlayerPrefs.GetFloat(var_15_1 .. tostring(var_15_0) .. "_y", 0)
		local var_15_4 = PlayerPrefs.GetFloat(var_15_1 .. tostring(var_15_0) .. "_scale", 1)

		return var_15_2, var_15_3, var_15_4
	else
		return nil
	end
end

function var_0_0.setSkinPosSetting(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	local var_16_0 = arg_16_1:GetRecordPosKey()
	local var_16_1 = arg_16_0:GetCurrMainUIStyleKeyForSkinShop()

	PlayerPrefs.SetFloat(var_16_1 .. tostring(var_16_0) .. "_x", arg_16_2)
	PlayerPrefs.SetFloat(var_16_1 .. tostring(var_16_0) .. "_y", arg_16_3)
	PlayerPrefs.SetFloat(var_16_1 .. tostring(var_16_0) .. "_scale", arg_16_4)
	PlayerPrefs.Save()
end

function var_0_0.setSkinScaleSetting(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = arg_17_1:GetRecordPosKey()
	local var_17_1 = tostring(var_17_0) .. arg_17_2 .. "_" .. arg_17_3 .. "_part_scale"

	PlayerPrefs.SetFloat(tostring(var_17_0) .. arg_17_2 .. "_" .. arg_17_3 .. "_part_scale", arg_17_4)
end

function var_0_0.getSkinScaleSetting(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0
	local var_18_1 = arg_18_1:GetRecordPosKey()
	local var_18_2 = tostring(var_18_1) .. arg_18_2 .. "_" .. arg_18_3 .. "_part_scale"

	if PlayerPrefs.HasKey(var_18_2) then
		var_18_0 = PlayerPrefs.GetFloat(var_18_2, 1)
	else
		return 1
	end

	return var_18_0
end

function var_0_0.GetCurrMainUIStyleKeyForSkinShop(arg_19_0)
	local var_19_0 = arg_19_0:GetMainSceneThemeStyle()

	if var_19_0 == NewMainScene.THEME_CLASSIC then
		return ""
	else
		return var_19_0
	end
end

function var_0_0.resetSkinPosSetting(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1:GetRecordPosKey()

	PlayerPrefs.DeleteKey(tostring(var_20_0) .. "_x")
	PlayerPrefs.DeleteKey(tostring(var_20_0) .. "_y")
	PlayerPrefs.DeleteKey(tostring(var_20_0) .. "_scale")
	PlayerPrefs.Save()
end

function var_0_0.getCharacterSetting(arg_21_0, arg_21_1, arg_21_2)
	return PlayerPrefs.GetInt(tostring(arg_21_1) .. "_" .. arg_21_2, 1) > 0
end

function var_0_0.setCharacterSetting(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	PlayerPrefs.SetInt(tostring(arg_22_1) .. "_" .. arg_22_2, arg_22_3 and 1 or 0)
	PlayerPrefs.Save()
end

function var_0_0.getCurrentSecretaryIndex(arg_23_0)
	local var_23_0 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)

	if var_23_0 > PlayerVitaeShipsPage.GetAllUnlockSlotCnt() then
		arg_23_0:setCurrentSecretaryIndex(1)

		return 1
	else
		return PlayerVitaeShipsPage.GetSlotIndexList()[var_23_0]
	end
end

function var_0_0.rotateCurrentSecretaryIndex(arg_24_0)
	local function var_24_0()
		return getProxy(PlayerProxy):getRawData():ExistEducateChar() and getProxy(SettingsProxy):GetFlagShipDisplayMode() ~= FlAG_SHIP_DISPLAY_ONLY_SHIP
	end

	local var_24_1 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)
	local var_24_2 = PlayerVitaeShipsPage.GetAllUnlockSlotCnt()
	local var_24_3 = var_24_1 + 1

	if var_24_2 < var_24_3 or var_24_3 == PlayerVitaeShipsPage.EDUCATE_CHAR_SLOT_ID and not var_24_0() then
		var_24_3 = 1
	end

	arg_24_0:setCurrentSecretaryIndex(var_24_3)
	pg.m02:sendNotification(GAME.ROTATE_PAINTING_INDEX)
end

function var_0_0.setCurrentSecretaryIndex(arg_26_0, arg_26_1)
	PlayerPrefs.SetInt("currentSecretaryIndex", arg_26_1)
	PlayerPrefs.Save()
end

function var_0_0.SetFlagShip(arg_27_0, arg_27_1)
	if arg_27_0._setFlagShip ~= arg_27_1 then
		arg_27_0._setFlagShip = arg_27_1

		PlayerPrefs.SetInt("setFlagShip", arg_27_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShip(arg_28_0)
	return arg_28_0._setFlagShip
end

function var_0_0.SetFlagShipForSkinAtlas(arg_29_0, arg_29_1)
	if arg_29_0._setFlagShipForSkinAtlas ~= arg_29_1 then
		arg_29_0._setFlagShipForSkinAtlas = arg_29_1

		PlayerPrefs.SetInt("setFlagShipforskinatlas", arg_29_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShipForSkinAtlas(arg_30_0)
	return arg_30_0._setFlagShipForSkinAtlas
end

function var_0_0.SetFlagRandom(arg_31_0, arg_31_1)
	if arg_31_0._setFlagRandom ~= arg_31_1 then
		arg_31_0._setFlagRandom = arg_31_1

		PlayerPrefs.SetInt("setFlagRandom", arg_31_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetFlagRandom(arg_32_0)
	return arg_32_0._setFlagRandom
end

function var_0_0.CheckNeedUserAgreement(arg_33_0)
	if PLATFORM_CODE == PLATFORM_KR then
		return false
	elseif PLATFORM_CODE == PLATFORM_CH then
		return false
	elseif PLATFORM_CODE == PLATFORM_JP then
		return false
	else
		return arg_33_0:GetUserAgreementFlag() > arg_33_0._userAgreement
	end
end

function var_0_0.GetUserAgreementFlag(arg_34_0)
	local var_34_0 = USER_AGREEMENT_FLAG_DEFAULT

	if PLATFORM_CODE == PLATFORM_CHT then
		var_34_0 = USER_AGREEMENT_FLAG_TW
	end

	return var_34_0
end

function var_0_0.SetUserAgreement(arg_35_0)
	if arg_35_0:CheckNeedUserAgreement() then
		local var_35_0 = arg_35_0:GetUserAgreementFlag()

		PlayerPrefs.SetInt("userAgreement", var_35_0)
		PlayerPrefs.Save()

		arg_35_0._userAgreement = var_35_0
	end
end

function var_0_0.IsLive2dEnable(arg_36_0)
	return arg_36_0._ShowLive2d
end

function var_0_0.IsBGEnable(arg_37_0)
	return arg_37_0._ShowBg
end

function var_0_0.SetSelectedShipId(arg_38_0, arg_38_1)
	if arg_38_0._selectedShipId ~= arg_38_1 then
		arg_38_0._selectedShipId = arg_38_1

		PlayerPrefs.SetInt("playerShipId", arg_38_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSelectedShipId(arg_39_0)
	return arg_39_0._selectedShipId
end

function var_0_0.setEquipSceneIndex(arg_40_0, arg_40_1)
	arg_40_0._equipSceneIndex = arg_40_1
end

function var_0_0.getEquipSceneIndex(arg_41_0)
	return arg_41_0._equipSceneIndex
end

function var_0_0.resetEquipSceneIndex(arg_42_0)
	arg_42_0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

function var_0_0.setActivityLayerIndex(arg_43_0, arg_43_1)
	arg_43_0._activityLayerIndex = arg_43_1
end

function var_0_0.getActivityLayerIndex(arg_44_0)
	return arg_44_0._activityLayerIndex
end

function var_0_0.resetActivityLayerIndex(arg_45_0)
	arg_45_0._activityLayerIndex = 1
end

function var_0_0.setBackyardRemind(arg_46_0)
	local var_46_0 = GetZeroTime()

	if arg_46_0._backyardFoodRemind ~= tostring(var_46_0) then
		PlayerPrefs.SetString("backyardRemind", var_46_0)
		PlayerPrefs.Save()

		arg_46_0._backyardFoodRemind = var_46_0
	end
end

function var_0_0.getBackyardRemind(arg_47_0)
	if not arg_47_0._backyardFoodRemind or arg_47_0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(arg_47_0._backyardFoodRemind)
	end
end

function var_0_0.getMaxLevelHelp(arg_48_0)
	return arg_48_0._showMaxLevelHelp
end

function var_0_0.setMaxLevelHelp(arg_49_0, arg_49_1)
	if arg_49_0._showMaxLevelHelp ~= arg_49_1 then
		arg_49_0._showMaxLevelHelp = arg_49_1

		PlayerPrefs.SetInt("maxLevelHelp", arg_49_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.setStopBuildSpeedupRemind(arg_50_0)
	arg_50_0.isStopBuildSpeedupReamind = true
end

function var_0_0.getStopBuildSpeedupRemind(arg_51_0)
	return arg_51_0.isStopBuildSpeedupReamind
end

function var_0_0.checkReadHelp(arg_52_0, arg_52_1)
	if not getProxy(PlayerProxy):getData() then
		return true
	end

	if arg_52_1 == "help_backyard" then
		return true
	elseif pg.SeriesGuideMgr.GetInstance():isEnd() then
		local var_52_0 = PlayerPrefs.GetInt(arg_52_1, 0)

		return PlayerPrefs.GetInt(arg_52_1, 0) > 0
	end

	return true
end

function var_0_0.recordReadHelp(arg_53_0, arg_53_1)
	PlayerPrefs.SetInt(arg_53_1, 1)
	PlayerPrefs.Save()
end

function var_0_0.clearAllReadHelp(arg_54_0)
	PlayerPrefs.DeleteKey("tactics_lesson_system_introduce")
	PlayerPrefs.DeleteKey("help_shipinfo_equip")
	PlayerPrefs.DeleteKey("help_shipinfo_detail")
	PlayerPrefs.DeleteKey("help_shipinfo_intensify")
	PlayerPrefs.DeleteKey("help_shipinfo_upgrate")
	PlayerPrefs.DeleteKey("help_backyard")
	PlayerPrefs.DeleteKey("has_entered_class")
	PlayerPrefs.DeleteKey("help_commander_info")
	PlayerPrefs.DeleteKey("help_commander_play")
	PlayerPrefs.DeleteKey("help_commander_ability")
	PlayerPrefs.DeleteKey("loveactivity_help_tips")
end

function var_0_0.setAutoBattleTip(arg_55_0)
	local var_55_0 = GetZeroTime()

	arg_55_0._nextTipAutoBattleTime = var_55_0

	PlayerPrefs.SetInt("AutoBattleTip", var_55_0)
	PlayerPrefs.Save()
end

function var_0_0.IsShowStickInCombat(arg_56_0)
	return PlayerPrefs.GetInt("combat_ui_always_show_stick", 0) > 0
end

function var_0_0.SetShowStickInCombat(arg_57_0, arg_57_1)
	PlayerPrefs.SetInt("combat_ui_always_show_stick", arg_57_1 and 1 or 0)
	PlayerPrefs.Save()
end

function var_0_0.isTipAutoBattle(arg_58_0)
	return pg.TimeMgr.GetInstance():GetServerTime() > arg_58_0._nextTipAutoBattleTime
end

function var_0_0.setActBossExchangeTicketTip(arg_59_0, arg_59_1)
	if arg_59_0.nextTipActBossExchangeTicket == arg_59_1 then
		return
	end

	arg_59_0.nextTipActBossExchangeTicket = arg_59_1

	local var_59_0 = GetZeroTime()

	if var_59_0 > arg_59_0._nextTipActBossTime then
		arg_59_0._nextTipActBossTime = var_59_0

		PlayerPrefs.SetInt("ActBossTipLastTime", var_59_0)
	end

	PlayerPrefs.SetInt("ActBossTip", arg_59_1)
	PlayerPrefs.Save()
end

function var_0_0.isTipActBossExchangeTicket(arg_60_0)
	if pg.TimeMgr.GetInstance():GetServerTime() > arg_60_0._nextTipActBossTime then
		return nil
	end

	return arg_60_0.nextTipActBossExchangeTicket
end

function var_0_0.SetScreenRatio(arg_61_0, arg_61_1)
	if arg_61_0._screenRatio ~= arg_61_1 then
		arg_61_0._screenRatio = arg_61_1

		PlayerPrefs.SetFloat("SetScreenRatio", arg_61_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetScreenRatio(arg_62_0)
	return arg_62_0._screenRatio
end

function var_0_0.CheckLargeScreen(arg_63_0)
	return Screen.width / Screen.height > 2
end

function var_0_0.IsShowBeatMonseterNianCurtain(arg_64_0)
	local var_64_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > tonumber(PlayerPrefs.GetString("HitMonsterNianLayer2020" .. var_64_0.id, "0"))
end

function var_0_0.SetBeatMonseterNianFlag(arg_65_0)
	local var_65_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetString("HitMonsterNianLayer2020" .. var_65_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.ShouldShowEventActHelp(arg_66_0)
	if not arg_66_0.actEventFlag then
		local var_66_0 = getProxy(PlayerProxy):getRawData().id

		arg_66_0.actEventFlag = PlayerPrefs.GetInt("event_act_help1" .. var_66_0, 0) > 0
	end

	return not arg_66_0.actEventFlag
end

function var_0_0.MarkEventActHelpFlag(arg_67_0)
	if not arg_67_0.actEventFlag then
		arg_67_0.actEventFlag = true

		local var_67_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("event_act_help1" .. var_67_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.SetStorySpeed(arg_68_0, arg_68_1)
	arg_68_0.storySpeed = arg_68_1

	local var_68_0

	if getProxy(PlayerProxy) then
		var_68_0 = getProxy(PlayerProxy):getRawData().id
	else
		var_68_0 = 1
	end

	PlayerPrefs.SetInt("story_speed_flag" .. var_68_0, arg_68_1)
	PlayerPrefs.Save()
end

function var_0_0.GetStorySpeed(arg_69_0)
	if not arg_69_0.storySpeed then
		local var_69_0

		if getProxy(PlayerProxy) then
			var_69_0 = getProxy(PlayerProxy):getRawData().id
		else
			var_69_0 = 1
		end

		arg_69_0.storySpeed = PlayerPrefs.GetInt("story_speed_flag" .. var_69_0, 0)
	end

	return arg_69_0.storySpeed
end

function var_0_0.GetStoryAutoPlayFlag(arg_70_0)
	return arg_70_0.storyAutoPlayCode > 0
end

function var_0_0.SetStoryAutoPlayFlag(arg_71_0, arg_71_1)
	if arg_71_0.storyAutoPlayCode ~= arg_71_1 then
		PlayerPrefs.SetInt("story_autoplay_flag", arg_71_1)
		PlayerPrefs.Save()

		arg_71_0.storyAutoPlayCode = arg_71_1
	end
end

function var_0_0.GetPaintingDownloadPrefs(arg_72_0)
	return PlayerPrefs.GetInt("Painting_Download_Prefs", 0)
end

function var_0_0.SetPaintingDownloadPrefs(arg_73_0, arg_73_1)
	PlayerPrefs.SetInt("Painting_Download_Prefs", arg_73_1)
end

function var_0_0.ShouldShipMainSceneWord(arg_74_0)
	return arg_74_0.showMainSceneWordTip
end

function var_0_0.SaveMainSceneWordFlag(arg_75_0, arg_75_1)
	if arg_75_0.showMainSceneWordTip ~= arg_75_1 then
		arg_75_0.showMainSceneWordTip = arg_75_1

		PlayerPrefs.SetInt("main_scene_word_toggle", arg_75_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordFrameRate(arg_76_0)
	if not arg_76_0.originalFrameRate then
		arg_76_0.originalFrameRate = Application.targetFrameRate
	end
end

function var_0_0.RestoreFrameRate(arg_77_0)
	if arg_77_0.originalFrameRate then
		Application.targetFrameRate = arg_77_0.originalFrameRate
		arg_77_0.originalFrameRate = nil
	end
end

function var_0_0.ResetTimeLimitSkinShopTip(arg_78_0)
	arg_78_0.isTipLimitSkinShop = PlayerPrefs.GetInt("tipLimitSkinShopTime_", 0) <= pg.TimeMgr.GetInstance():GetServerTime()

	if arg_78_0.isTipLimitSkinShop then
		arg_78_0.nextTipLimitSkinShopTime = GetZeroTime()
	end
end

function var_0_0.ShouldTipTimeLimitSkinShop(arg_79_0)
	return arg_79_0.isTipLimitSkinShop
end

function var_0_0.SetNextTipTimeLimitSkinShop(arg_80_0)
	if arg_80_0.isTipLimitSkinShop and arg_80_0.nextTipLimitSkinShopTime then
		PlayerPrefs.SetInt("tipLimitSkinShopTime_", arg_80_0.nextTipLimitSkinShopTime)
		PlayerPrefs.Save()

		arg_80_0.nextTipLimitSkinShopTime = nil
		arg_80_0.isTipLimitSkinShop = false
	end
end

function var_0_0.WorldBossProgressTipFlag(arg_81_0, arg_81_1)
	if arg_81_0.WorldBossProgressTipValue ~= arg_81_1 then
		arg_81_0.WorldBossProgressTipValue = arg_81_1

		PlayerPrefs.SetString("_WorldBossProgressTipFlag_", arg_81_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldBossProgressTipFlag(arg_82_0)
	if not arg_82_0.WorldBossProgressTipValue then
		local var_82_0 = pg.gameset.joint_boss_ticket.description
		local var_82_1 = var_82_0[1] + var_82_0[2]
		local var_82_2 = var_82_0[1] .. "&" .. var_82_1
		local var_82_3 = PlayerPrefs.GetString("_WorldBossProgressTipFlag_", var_82_2)

		arg_82_0.WorldBossProgressTipValue = var_82_3

		return var_82_3
	else
		return arg_82_0.WorldBossProgressTipValue
	end
end

function var_0_0.GetWorldBossProgressTipTable(arg_83_0)
	local var_83_0 = arg_83_0:GetWorldBossProgressTipFlag()

	if not var_83_0 or var_83_0 == "" then
		return {}
	end

	return string.split(var_83_0, "&")
end

function var_0_0.GetChatFlag(arg_84_0)
	if not arg_84_0.chatFlag then
		local var_84_0 = {
			ChatConst.ChannelWorld,
			ChatConst.ChannelPublic,
			ChatConst.ChannelFriend
		}

		if getProxy(GuildProxy):getRawData() then
			table.insert(var_84_0, ChatConst.ChannelGuild)
		end

		arg_84_0.chatFlag = PlayerPrefs.GetInt("chat__setting", IndexConst.Flags2Bits(var_84_0))
	end

	return arg_84_0.chatFlag
end

function var_0_0.SetChatFlag(arg_85_0, arg_85_1)
	if arg_85_0.chatFlag ~= arg_85_1 then
		arg_85_0.chatFlag = arg_85_1

		PlayerPrefs.SetInt("chat__setting", arg_85_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsShowActivityMapSPTip()
	local var_86_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("ActivityMapSPTip" .. var_86_0.id, 0)
end

function var_0_0.SetActivityMapSPTip()
	local var_87_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetInt("ActivityMapSPTip" .. var_87_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.IsTipNewTheme(arg_88_0)
	local var_88_0 = pg.backyard_theme_template
	local var_88_1 = var_88_0.all[#var_88_0.all]
	local var_88_2 = var_88_0[var_88_1].ids[1]
	local var_88_3 = pg.furniture_shop_template[var_88_2]
	local var_88_4 = getProxy(PlayerProxy):getRawData().id
	local var_88_5 = PlayerPrefs.GetInt(var_88_4 .. "IsTipNewTheme" .. var_88_1, 0) == 0

	if var_88_3 and var_88_3.new == 1 and pg.TimeMgr.GetInstance():inTime(var_88_3.time) and var_88_5 then
		arg_88_0.lastThemeId = var_88_1
	else
		arg_88_0.lastThemeId = nil
	end

	return arg_88_0.lastThemeId ~= nil
end

function var_0_0.UpdateNewThemeValue(arg_89_0)
	if arg_89_0.lastThemeId then
		local var_89_0 = arg_89_0.lastThemeId
		local var_89_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt(var_89_1 .. "IsTipNewTheme" .. var_89_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetNewGemFurnitureLocalCache(arg_90_0)
	if not arg_90_0.cacheGemFuruitures then
		arg_90_0.cacheGemFuruitures = {}

		local var_90_0 = getProxy(PlayerProxy):getRawData().id
		local var_90_1 = PlayerPrefs.GetString(var_90_0 .. "IsTipNewGenFurniture")

		if var_90_1 ~= "" then
			local var_90_2 = string.split(var_90_1, "#")

			for iter_90_0, iter_90_1 in ipairs(var_90_2) do
				arg_90_0.cacheGemFuruitures[tonumber(iter_90_1)] = true
			end
		end
	end

	return arg_90_0.cacheGemFuruitures
end

function var_0_0.IsTipNewGemFurniture(arg_91_0)
	local var_91_0 = arg_91_0:GetNewGemFurnitureLocalCache()
	local var_91_1 = getProxy(DormProxy):GetTag7Furnitures()

	if _.any(var_91_1, function(arg_92_0)
		return pg.furniture_shop_template[arg_92_0].new == 1 and not var_91_0[arg_92_0]
	end) then
		arg_91_0.newGemFurniture = var_91_1
	else
		arg_91_0.newGemFurniture = nil
	end

	return arg_91_0.newGemFurniture ~= nil
end

function var_0_0.UpdateNewGemFurnitureValue(arg_93_0)
	if arg_93_0.newGemFurniture then
		for iter_93_0, iter_93_1 in pairs(arg_93_0.newGemFurniture) do
			arg_93_0.cacheGemFuruitures[iter_93_1] = true
		end

		local var_93_0 = table.concat(arg_93_0.newGemFurniture, "#")
		local var_93_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString(var_93_1 .. "IsTipNewGenFurniture", var_93_0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetRandomFlagShipList(arg_94_0)
	if arg_94_0.randomFlagShipList then
		return arg_94_0.randomFlagShipList
	end

	local var_94_0 = getProxy(PlayerProxy):getRawData().id
	local var_94_1 = PlayerPrefs.GetString("RandomFlagShipList" .. var_94_0, "")

	if var_94_1 == "" then
		arg_94_0.randomFlagShipList = {}
	else
		arg_94_0.randomFlagShipList = string.split(var_94_1, "#")
	end

	return arg_94_0.randomFlagShipList
end

function var_0_0.IsRandomFlagShip(arg_95_0, arg_95_1)
	if not arg_95_0.randomFlagShipMap then
		arg_95_0.randomFlagShipMap = {}

		for iter_95_0, iter_95_1 in ipairs(arg_95_0:GetRandomFlagShipList()) do
			arg_95_0.randomFlagShipMap[iter_95_1] = true
		end
	end

	return arg_95_0.randomFlagShipMap[arg_95_1] == true
end

function var_0_0.IsOpenRandomFlagShip(arg_96_0)
	local var_96_0 = arg_96_0:GetRandomFlagShipList()
	local var_96_1 = getProxy(BayProxy)

	return #var_96_0 > 0 and _.any(var_96_0, function(arg_97_0)
		local var_97_0, var_97_1 = ShipPhantom.UnpackMark(arg_97_0)

		return var_96_1:RawGetShipById(var_97_0) ~= nil
	end)
end

function var_0_0.UpdateRandomFlagShipList(arg_98_0, arg_98_1)
	arg_98_0.randomFlagShipMap = nil
	arg_98_0.randomFlagShipList = arg_98_1

	for iter_98_0, iter_98_1 in ipairs(arg_98_1) do
		local var_98_0 = getProxy(BayProxy):GetShipPhantom(iter_98_1)

		if var_98_0 and var_98_0.phantomId > 0 then
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildPhantom(var_98_0:getSkinId()))
		end
	end

	local var_98_1 = table.concat(arg_98_1, "#")
	local var_98_2 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("RandomFlagShipList" .. var_98_2, var_98_1)
	PlayerPrefs.Save()
end

function var_0_0.GetPrevRandomFlagShipTime(arg_99_0)
	if arg_99_0.prevRandomFlagShipTime then
		return arg_99_0.prevRandomFlagShipTime
	end

	local var_99_0 = getProxy(PlayerProxy):getRawData().id

	arg_99_0.prevRandomFlagShipTime = PlayerPrefs.GetInt("RandomFlagShipTime" .. var_99_0, 0)

	return arg_99_0.prevRandomFlagShipTime
end

function var_0_0.SetPrevRandomFlagShipTime(arg_100_0, arg_100_1)
	if arg_100_0.prevRandomFlagShipTime == arg_100_1 then
		return
	end

	arg_100_0.prevRandomFlagShipTime = arg_100_1

	local var_100_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("RandomFlagShipTime" .. var_100_0, arg_100_1)
	PlayerPrefs.Save()
end

function var_0_0.GetFlagShipDisplayMode(arg_101_0)
	if not arg_101_0.flagShipDisplayMode then
		local var_101_0 = getProxy(PlayerProxy):getRawData().id

		arg_101_0.flagShipDisplayMode = PlayerPrefs.GetInt("flag-ship-display-mode" .. var_101_0, FlAG_SHIP_DISPLAY_ALL)
	end

	return arg_101_0.flagShipDisplayMode
end

function var_0_0.SetFlagShipDisplayMode(arg_102_0, arg_102_1)
	if arg_102_0.flagShipDisplayMode ~= arg_102_1 then
		arg_102_0.flagShipDisplayMode = arg_102_1

		local var_102_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("flag-ship-display-mode" .. var_102_0, arg_102_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordContinuousOperationAutoSubStatus(arg_103_0, arg_103_1)
	if arg_103_1 then
		return
	end

	local var_103_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_103_0, 1)
	PlayerPrefs.Save()
end

function var_0_0.ResetContinuousOperationAutoSub(arg_104_0)
	local var_104_0 = getProxy(PlayerProxy):getRawData().id

	if PlayerPrefs.GetInt("AutoBotCOFlag" .. var_104_0, 0) == 0 then
		return
	end

	pg.m02:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = true,
		system = SYSTEM_ACT_BOSS
	})
	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_104_0, 0)
	PlayerPrefs.Save()
end

function var_0_0.SetWorkbenchDailyTip(arg_105_0)
	local var_105_0 = getProxy(PlayerProxy):getRawData().id
	local var_105_1 = GetZeroTime()

	PlayerPrefs.SetInt("WorkbenchDailyTip" .. var_105_0, var_105_1)
	PlayerPrefs.Save()
end

function var_0_0.IsTipWorkbenchDaily(arg_106_0)
	local var_106_0 = getProxy(PlayerProxy):getRawData().id

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("WorkbenchDailyTip" .. var_106_0, 0)
end

function var_0_0.IsDisplayResultPainting(arg_107_0)
	local var_107_0 = PlayerPrefs.HasKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
	local var_107_1 = false

	if var_107_0 then
		var_107_1 = PlayerPrefs.GetInt(BATTLERESULT_SKIP_DISPAY_PAINTING) <= 0

		PlayerPrefs.DeleteKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
		PlayerPrefs.SetInt(BATTLERESULT_DISPAY_PAINTING, var_107_1 and 1 or 0)
		PlayerPrefs.Save()
	else
		var_107_1 = PlayerPrefs.GetInt(BATTLERESULT_DISPAY_PAINTING, 0) >= 1
	end

	return var_107_1
end

function var_0_0.IsDisplayCommanderCatCustomName(arg_108_0)
	if not arg_108_0.customFlag then
		local var_108_0 = getProxy(PlayerProxy):getRawData().id

		arg_108_0.customFlag = PlayerPrefs.GetInt("DisplayCommanderCatCustomName" .. var_108_0, 0) == 0
	end

	return arg_108_0.customFlag
end

function var_0_0.SetDisplayCommanderCatCustomName(arg_109_0, arg_109_1)
	if arg_109_1 == arg_109_0.customFlag then
		return
	end

	arg_109_0.customFlag = arg_109_1

	local var_109_0 = arg_109_0.customFlag and 0 or 1
	local var_109_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DisplayCommanderCatCustomName" .. var_109_1, var_109_0)
	PlayerPrefs.Save()
end

function var_0_0.GetCommanderQuicklyToolRarityConfig(arg_110_0)
	if not arg_110_0.quicklyToolRarityConfig then
		local var_110_0 = getProxy(PlayerProxy):getRawData().id
		local var_110_1 = PlayerPrefs.GetString("CommanderQuicklyToolRarityConfig" .. var_110_0, "1#1#1")
		local var_110_2 = string.split(var_110_1, "#")

		arg_110_0.quicklyToolRarityConfig = _.map(var_110_2, function(arg_111_0)
			return tonumber(arg_111_0) == 1
		end)
	end

	return arg_110_0.quicklyToolRarityConfig
end

function var_0_0.SaveCommanderQuicklyToolRarityConfig(arg_112_0, arg_112_1)
	local var_112_0 = false

	for iter_112_0, iter_112_1 in ipairs(arg_112_0.quicklyToolRarityConfig) do
		if arg_112_1[iter_112_0] ~= iter_112_1 then
			var_112_0 = true

			break
		end
	end

	if var_112_0 then
		arg_112_0.quicklyToolRarityConfig = arg_112_1

		local var_112_1 = _.map(arg_112_0.quicklyToolRarityConfig, function(arg_113_0)
			return arg_113_0 and "1" or "0"
		end)
		local var_112_2 = table.concat(var_112_1, "#")
		local var_112_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderQuicklyToolRarityConfig" .. var_112_3, var_112_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagRarityConfig(arg_114_0)
	if not arg_114_0.lockFlagRarityConfig then
		local var_114_0 = getProxy(PlayerProxy):getRawData().id
		local var_114_1 = PlayerPrefs.GetString("CommanderLockFlagRarityConfig_" .. var_114_0, "1#0#0")
		local var_114_2 = string.split(var_114_1, "#")

		arg_114_0.lockFlagRarityConfig = _.map(var_114_2, function(arg_115_0)
			return tonumber(arg_115_0) == 1
		end)
	end

	return arg_114_0.lockFlagRarityConfig
end

function var_0_0.SaveCommanderLockFlagRarityConfig(arg_116_0, arg_116_1)
	local var_116_0 = false

	for iter_116_0, iter_116_1 in ipairs(arg_116_0.lockFlagRarityConfig) do
		if arg_116_1[iter_116_0] ~= iter_116_1 then
			var_116_0 = true

			break
		end
	end

	if var_116_0 then
		arg_116_0.lockFlagRarityConfig = arg_116_1

		local var_116_1 = _.map(arg_116_0.lockFlagRarityConfig, function(arg_117_0)
			return arg_117_0 and "1" or "0"
		end)
		local var_116_2 = table.concat(var_116_1, "#")
		local var_116_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderLockFlagRarityConfig_" .. var_116_3, var_116_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagTalentConfig(arg_118_0)
	if not arg_118_0.lockFlagTalentConfig then
		local var_118_0 = getProxy(PlayerProxy):getRawData().id
		local var_118_1 = PlayerPrefs.GetString("CommanderLockFlagTalentConfig" .. var_118_0, "")
		local var_118_2 = {}

		if var_118_1 == "" then
			for iter_118_0, iter_118_1 in ipairs(CommanderCatUtil.GetAllTalentNames()) do
				var_118_2[iter_118_1.id] = true
			end
		else
			for iter_118_2, iter_118_3 in ipairs(string.split(var_118_1, "#")) do
				local var_118_3 = string.split(iter_118_3, "*")

				if #var_118_3 == 2 then
					var_118_2[tonumber(var_118_3[1])] = tonumber(var_118_3[2]) == 1
				end
			end
		end

		arg_118_0.lockFlagTalentConfig = var_118_2
	end

	return arg_118_0.lockFlagTalentConfig
end

function var_0_0.SaveCommanderLockFlagTalentConfig(arg_119_0, arg_119_1)
	arg_119_0.lockFlagTalentConfig = arg_119_1

	local var_119_0 = {}

	for iter_119_0, iter_119_1 in pairs(arg_119_1) do
		table.insert(var_119_0, iter_119_0 .. "*" .. (iter_119_1 and "1" or "0"))
	end

	local var_119_1 = table.concat(var_119_0, "#")
	local var_119_2 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("CommanderLockFlagTalentConfig" .. var_119_2, var_119_1)
	PlayerPrefs.Save()
end

function var_0_0.GetMainPaintingVariantFlag(arg_120_0, arg_120_1)
	if not arg_120_0.mainPaintingVariantFlag then
		arg_120_0.mainPaintingVariantFlag = {}
	end

	if not arg_120_0.mainPaintingVariantFlag[arg_120_1] then
		local var_120_0 = getProxy(PlayerProxy):getRawData().id
		local var_120_1 = PlayerPrefs.GetInt(arg_120_1 .. "_mainMeshImagePainting_ex_" .. var_120_0, 0)

		arg_120_0.mainPaintingVariantFlag[arg_120_1] = var_120_1
	end

	return arg_120_0.mainPaintingVariantFlag[arg_120_1]
end

function var_0_0.SwitchMainPaintingVariantFlag(arg_121_0, arg_121_1)
	local var_121_0 = 1 - arg_121_0:GetMainPaintingVariantFlag(arg_121_1)

	arg_121_0.mainPaintingVariantFlag[arg_121_1] = var_121_0

	local var_121_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(arg_121_1 .. "_mainMeshImagePainting_ex_" .. var_121_1, var_121_0)
	PlayerPrefs.Save()
end

function var_0_0.IsTipDay(arg_122_0, arg_122_1, arg_122_2, arg_122_3)
	local var_122_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_122_0 .. "educate_char_" .. arg_122_1 .. arg_122_2 .. arg_122_3, 0) == 1
end

function var_0_0.RecordTipDay(arg_123_0, arg_123_1, arg_123_2, arg_123_3)
	local var_123_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_123_0 .. "educate_char_" .. arg_123_1 .. arg_123_2 .. arg_123_3, 1)
	PlayerPrefs.Save()
end

function var_0_0.UpdateEducateCharTip(arg_124_0, arg_124_1)
	local var_124_0 = getProxy(PlayerProxy):getRawData().id
	local var_124_1 = NewEducateHelper.GetAllUnlockSecretaryIds()
	local var_124_2 = {}

	for iter_124_0, iter_124_1 in ipairs(arg_124_1 or {}) do
		var_124_2[iter_124_1] = true
	end

	for iter_124_2, iter_124_3 in ipairs(var_124_1 or {}) do
		local var_124_3 = var_124_0 .. "educate_char_tip" .. iter_124_3

		if var_124_2[iter_124_3] ~= true then
			PlayerPrefs.SetInt(var_124_3, 1)
			PlayerPrefs.Save()
		end
	end

	arg_124_0:RefillEducateCharTipList()
end

function var_0_0.RefillEducateCharTipList(arg_125_0)
	local var_125_0 = getProxy(PlayerProxy):getRawData().id

	arg_125_0.educateCharTipList = {}

	if LOCK_EDUCATE_SYSTEM then
		return
	end

	local var_125_1 = NewEducateHelper.GetAllUnlockSecretaryIds()

	for iter_125_0, iter_125_1 in ipairs(var_125_1 or {}) do
		if PlayerPrefs.GetInt(var_125_0 .. "educate_char_tip" .. iter_125_1, 0) == 1 then
			table.insert(arg_125_0.educateCharTipList, iter_125_1)
		end
	end
end

function var_0_0.ShouldEducateCharTip(arg_126_0)
	if NewEducateHelper.GetEducateCharSlotMaxCnt() == 0 then
		return false
	end

	if not arg_126_0.educateCharTipList or #arg_126_0.educateCharTipList == 0 then
		arg_126_0:RefillEducateCharTipList()
	end

	return _.any(arg_126_0.educateCharTipList, function(arg_127_0)
		return NewEducateHelper.IsUnlockDefaultShip(arg_127_0)
	end)
end

function var_0_0._ShouldEducateCharTip(arg_128_0, arg_128_1)
	if not arg_128_0.educateCharTipList or #arg_128_0.educateCharTipList == 0 then
		arg_128_0:RefillEducateCharTipList()
	end

	if table.contains(arg_128_0.educateCharTipList, arg_128_1) and NewEducateHelper.IsUnlockDefaultShip(arg_128_1) then
		return true
	end

	return false
end

function var_0_0.ClearEducateCharTip(arg_129_0, arg_129_1)
	if not arg_129_0:_ShouldEducateCharTip(arg_129_1) then
		return false
	end

	table.removebyvalue(arg_129_0.educateCharTipList, arg_129_1)

	local var_129_0 = getProxy(PlayerProxy):getRawData().id .. "educate_char_tip" .. arg_129_1

	if PlayerPrefs.HasKey(var_129_0) then
		PlayerPrefs.DeleteKey(var_129_0)
		PlayerPrefs.Save()
	end

	pg.m02:sendNotification(GAME.CLEAR_EDUCATE_TIP, {
		id = arg_129_1
	})

	return true
end

function var_0_0.GetMainSceneThemeStyle(arg_130_0)
	if PlayerPrefs.GetInt(USAGE_NEW_MAINUI, 1) == 1 then
		return NewMainScene.THEME_MELLOW
	else
		return NewMainScene.THEME_CLASSIC
	end
end

function var_0_0.IsMellowStyle(arg_131_0)
	local var_131_0 = arg_131_0:GetMainSceneThemeStyle()

	return NewMainScene.THEME_MELLOW == var_131_0
end

function var_0_0.GetMainSceneScreenSleepTime(arg_132_0)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		return SleepTimeout.SystemSetting
	end

	local var_132_0 = pg.settings_other_template[20]

	if PlayerPrefs.GetInt(_G[var_132_0.name], var_132_0.default) == 1 then
		return SleepTimeout.NeverSleep
	else
		return SleepTimeout.SystemSetting
	end
end

function var_0_0.ShowL2dResetInMainScene(arg_133_0)
	local var_133_0 = pg.settings_other_template[21]

	return PlayerPrefs.GetInt(_G[var_133_0.name], var_133_0.default) == 1
end

function var_0_0.GetRecommendLowEnerySkipEnable(arg_134_0)
	local var_134_0 = pg.settings_other_template[25]

	return PlayerPrefs.GetInt(_G[var_134_0.name], var_134_0.default) == 1
end

local var_0_1 = "ISLAND_REST_EVENT"

function var_0_0.ShouldTipIslandRestEvet(arg_135_0)
	local var_135_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_0_1 .. var_135_0, 0) < pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.RecordIslandRestEvet(arg_136_0)
	local var_136_0 = GetZeroTime()
	local var_136_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_0_1 .. var_136_1, var_136_0)
	PlayerPrefs.Save()
end

function var_0_0.Reset(arg_137_0)
	arg_137_0:resetEquipSceneIndex()
	arg_137_0:resetActivityLayerIndex()

	arg_137_0.isStopBuildSpeedupReamind = false

	arg_137_0:RestoreFrameRate()

	arg_137_0.randomFlagShipList = nil
	arg_137_0.prevRandomFlagShipTime = nil
	arg_137_0.randomFlagShipMap = nil
	arg_137_0.educateCharTipList = {}
end

function var_0_0.IsExchangeCodeActive()
	return getGameset("exchangecode_ios_on")[1] == 1
end

return var_0_0
