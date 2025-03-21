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

function var_0_0.getSkinPosSetting(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1:GetRecordPosKey()
	local var_14_1 = arg_14_0:GetCurrMainUIStyleKeyForSkinShop()

	if PlayerPrefs.HasKey(var_14_1 .. tostring(var_14_0) .. "_scale") then
		local var_14_2 = PlayerPrefs.GetFloat(var_14_1 .. tostring(var_14_0) .. "_x", 0)
		local var_14_3 = PlayerPrefs.GetFloat(var_14_1 .. tostring(var_14_0) .. "_y", 0)
		local var_14_4 = PlayerPrefs.GetFloat(var_14_1 .. tostring(var_14_0) .. "_scale", 1)

		return var_14_2, var_14_3, var_14_4
	else
		return nil
	end
end

function var_0_0.setSkinPosSetting(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = arg_15_1:GetRecordPosKey()
	local var_15_1 = arg_15_0:GetCurrMainUIStyleKeyForSkinShop()

	PlayerPrefs.SetFloat(var_15_1 .. tostring(var_15_0) .. "_x", arg_15_2)
	PlayerPrefs.SetFloat(var_15_1 .. tostring(var_15_0) .. "_y", arg_15_3)
	PlayerPrefs.SetFloat(var_15_1 .. tostring(var_15_0) .. "_scale", arg_15_4)
	PlayerPrefs.Save()
end

function var_0_0.GetCurrMainUIStyleKeyForSkinShop(arg_16_0)
	local var_16_0 = arg_16_0:GetMainSceneThemeStyle()

	if var_16_0 == NewMainScene.THEME_CLASSIC then
		return ""
	else
		return var_16_0
	end
end

function var_0_0.resetSkinPosSetting(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:GetRecordPosKey()

	PlayerPrefs.DeleteKey(tostring(var_17_0) .. "_x")
	PlayerPrefs.DeleteKey(tostring(var_17_0) .. "_y")
	PlayerPrefs.DeleteKey(tostring(var_17_0) .. "_scale")
	PlayerPrefs.Save()
end

function var_0_0.getCharacterSetting(arg_18_0, arg_18_1, arg_18_2)
	return PlayerPrefs.GetInt(tostring(arg_18_1) .. "_" .. arg_18_2, 1) > 0
end

function var_0_0.setCharacterSetting(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	PlayerPrefs.SetInt(tostring(arg_19_1) .. "_" .. arg_19_2, arg_19_3 and 1 or 0)
	PlayerPrefs.Save()
end

function var_0_0.getCurrentSecretaryIndex(arg_20_0)
	local var_20_0 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)

	if var_20_0 > PlayerVitaeShipsPage.GetAllUnlockSlotCnt() then
		arg_20_0:setCurrentSecretaryIndex(1)

		return 1
	else
		return PlayerVitaeShipsPage.GetSlotIndexList()[var_20_0]
	end
end

function var_0_0.rotateCurrentSecretaryIndex(arg_21_0)
	local function var_21_0()
		return getProxy(PlayerProxy):getRawData():ExistEducateChar() and getProxy(SettingsProxy):GetFlagShipDisplayMode() ~= FlAG_SHIP_DISPLAY_ONLY_SHIP
	end

	local var_21_1 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)
	local var_21_2 = PlayerVitaeShipsPage.GetAllUnlockSlotCnt()
	local var_21_3 = var_21_1 + 1

	if var_21_2 < var_21_3 or var_21_3 == PlayerVitaeShipsPage.EDUCATE_CHAR_SLOT_ID and not var_21_0() then
		var_21_3 = 1
	end

	arg_21_0:setCurrentSecretaryIndex(var_21_3)
	pg.m02:sendNotification(GAME.ROTATE_PAINTING_INDEX)
end

function var_0_0.setCurrentSecretaryIndex(arg_23_0, arg_23_1)
	PlayerPrefs.SetInt("currentSecretaryIndex", arg_23_1)
	PlayerPrefs.Save()
end

function var_0_0.SetFlagShip(arg_24_0, arg_24_1)
	if arg_24_0._setFlagShip ~= arg_24_1 then
		arg_24_0._setFlagShip = arg_24_1

		PlayerPrefs.SetInt("setFlagShip", arg_24_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShip(arg_25_0)
	return arg_25_0._setFlagShip
end

function var_0_0.SetFlagShipForSkinAtlas(arg_26_0, arg_26_1)
	if arg_26_0._setFlagShipForSkinAtlas ~= arg_26_1 then
		arg_26_0._setFlagShipForSkinAtlas = arg_26_1

		PlayerPrefs.SetInt("setFlagShipforskinatlas", arg_26_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShipForSkinAtlas(arg_27_0)
	return arg_27_0._setFlagShipForSkinAtlas
end

function var_0_0.CheckNeedUserAgreement(arg_28_0)
	if PLATFORM_CODE == PLATFORM_KR then
		return false
	elseif PLATFORM_CODE == PLATFORM_CH then
		return false
	else
		return arg_28_0:GetUserAgreementFlag() > arg_28_0._userAgreement
	end
end

function var_0_0.GetUserAgreementFlag(arg_29_0)
	local var_29_0 = USER_AGREEMENT_FLAG_DEFAULT

	if PLATFORM_CODE == PLATFORM_CHT then
		var_29_0 = USER_AGREEMENT_FLAG_TW
	end

	return var_29_0
end

function var_0_0.SetUserAgreement(arg_30_0)
	if arg_30_0:CheckNeedUserAgreement() then
		local var_30_0 = arg_30_0:GetUserAgreementFlag()

		PlayerPrefs.SetInt("userAgreement", var_30_0)
		PlayerPrefs.Save()

		arg_30_0._userAgreement = var_30_0
	end
end

function var_0_0.IsLive2dEnable(arg_31_0)
	return arg_31_0._ShowLive2d
end

function var_0_0.IsBGEnable(arg_32_0)
	return arg_32_0._ShowBg
end

function var_0_0.SetSelectedShipId(arg_33_0, arg_33_1)
	if arg_33_0._selectedShipId ~= arg_33_1 then
		arg_33_0._selectedShipId = arg_33_1

		PlayerPrefs.SetInt("playerShipId", arg_33_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSelectedShipId(arg_34_0)
	return arg_34_0._selectedShipId
end

function var_0_0.setEquipSceneIndex(arg_35_0, arg_35_1)
	arg_35_0._equipSceneIndex = arg_35_1
end

function var_0_0.getEquipSceneIndex(arg_36_0)
	return arg_36_0._equipSceneIndex
end

function var_0_0.resetEquipSceneIndex(arg_37_0)
	arg_37_0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

function var_0_0.setActivityLayerIndex(arg_38_0, arg_38_1)
	arg_38_0._activityLayerIndex = arg_38_1
end

function var_0_0.getActivityLayerIndex(arg_39_0)
	return arg_39_0._activityLayerIndex
end

function var_0_0.resetActivityLayerIndex(arg_40_0)
	arg_40_0._activityLayerIndex = 1
end

function var_0_0.setBackyardRemind(arg_41_0)
	local var_41_0 = GetZeroTime()

	if arg_41_0._backyardFoodRemind ~= tostring(var_41_0) then
		PlayerPrefs.SetString("backyardRemind", var_41_0)
		PlayerPrefs.Save()

		arg_41_0._backyardFoodRemind = var_41_0
	end
end

function var_0_0.getBackyardRemind(arg_42_0)
	if not arg_42_0._backyardFoodRemind or arg_42_0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(arg_42_0._backyardFoodRemind)
	end
end

function var_0_0.getMaxLevelHelp(arg_43_0)
	return arg_43_0._showMaxLevelHelp
end

function var_0_0.setMaxLevelHelp(arg_44_0, arg_44_1)
	if arg_44_0._showMaxLevelHelp ~= arg_44_1 then
		arg_44_0._showMaxLevelHelp = arg_44_1

		PlayerPrefs.SetInt("maxLevelHelp", arg_44_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.setStopBuildSpeedupRemind(arg_45_0)
	arg_45_0.isStopBuildSpeedupReamind = true
end

function var_0_0.getStopBuildSpeedupRemind(arg_46_0)
	return arg_46_0.isStopBuildSpeedupReamind
end

function var_0_0.checkReadHelp(arg_47_0, arg_47_1)
	if not getProxy(PlayerProxy):getData() then
		return true
	end

	if arg_47_1 == "help_backyard" then
		return true
	elseif pg.SeriesGuideMgr.GetInstance():isEnd() then
		local var_47_0 = PlayerPrefs.GetInt(arg_47_1, 0)

		return PlayerPrefs.GetInt(arg_47_1, 0) > 0
	end

	return true
end

function var_0_0.recordReadHelp(arg_48_0, arg_48_1)
	PlayerPrefs.SetInt(arg_48_1, 1)
	PlayerPrefs.Save()
end

function var_0_0.clearAllReadHelp(arg_49_0)
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
end

function var_0_0.setAutoBattleTip(arg_50_0)
	local var_50_0 = GetZeroTime()

	arg_50_0._nextTipAutoBattleTime = var_50_0

	PlayerPrefs.SetInt("AutoBattleTip", var_50_0)
	PlayerPrefs.Save()
end

function var_0_0.isTipAutoBattle(arg_51_0)
	return pg.TimeMgr.GetInstance():GetServerTime() > arg_51_0._nextTipAutoBattleTime
end

function var_0_0.setActBossExchangeTicketTip(arg_52_0, arg_52_1)
	if arg_52_0.nextTipActBossExchangeTicket == arg_52_1 then
		return
	end

	arg_52_0.nextTipActBossExchangeTicket = arg_52_1

	local var_52_0 = GetZeroTime()

	if var_52_0 > arg_52_0._nextTipActBossTime then
		arg_52_0._nextTipActBossTime = var_52_0

		PlayerPrefs.SetInt("ActBossTipLastTime", var_52_0)
	end

	PlayerPrefs.SetInt("ActBossTip", arg_52_1)
	PlayerPrefs.Save()
end

function var_0_0.isTipActBossExchangeTicket(arg_53_0)
	if pg.TimeMgr.GetInstance():GetServerTime() > arg_53_0._nextTipActBossTime then
		return nil
	end

	return arg_53_0.nextTipActBossExchangeTicket
end

function var_0_0.SetScreenRatio(arg_54_0, arg_54_1)
	if arg_54_0._screenRatio ~= arg_54_1 then
		arg_54_0._screenRatio = arg_54_1

		PlayerPrefs.SetFloat("SetScreenRatio", arg_54_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetScreenRatio(arg_55_0)
	return arg_55_0._screenRatio
end

function var_0_0.CheckLargeScreen(arg_56_0)
	return Screen.width / Screen.height > 2
end

function var_0_0.IsShowBeatMonseterNianCurtain(arg_57_0)
	local var_57_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > tonumber(PlayerPrefs.GetString("HitMonsterNianLayer2020" .. var_57_0.id, "0"))
end

function var_0_0.SetBeatMonseterNianFlag(arg_58_0)
	local var_58_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetString("HitMonsterNianLayer2020" .. var_58_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.ShouldShowEventActHelp(arg_59_0)
	if not arg_59_0.actEventFlag then
		local var_59_0 = getProxy(PlayerProxy):getRawData().id

		arg_59_0.actEventFlag = PlayerPrefs.GetInt("event_act_help1" .. var_59_0, 0) > 0
	end

	return not arg_59_0.actEventFlag
end

function var_0_0.MarkEventActHelpFlag(arg_60_0)
	if not arg_60_0.actEventFlag then
		arg_60_0.actEventFlag = true

		local var_60_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("event_act_help1" .. var_60_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.SetStorySpeed(arg_61_0, arg_61_1)
	arg_61_0.storySpeed = arg_61_1

	local var_61_0

	if getProxy(PlayerProxy) then
		var_61_0 = getProxy(PlayerProxy):getRawData().id
	else
		var_61_0 = 1
	end

	PlayerPrefs.SetInt("story_speed_flag" .. var_61_0, arg_61_1)
	PlayerPrefs.Save()
end

function var_0_0.GetStorySpeed(arg_62_0)
	if not arg_62_0.storySpeed then
		local var_62_0

		if getProxy(PlayerProxy) then
			var_62_0 = getProxy(PlayerProxy):getRawData().id
		else
			var_62_0 = 1
		end

		arg_62_0.storySpeed = PlayerPrefs.GetInt("story_speed_flag" .. var_62_0, 0)
	end

	return arg_62_0.storySpeed
end

function var_0_0.GetStoryAutoPlayFlag(arg_63_0)
	return arg_63_0.storyAutoPlayCode > 0
end

function var_0_0.SetStoryAutoPlayFlag(arg_64_0, arg_64_1)
	if arg_64_0.storyAutoPlayCode ~= arg_64_1 then
		PlayerPrefs.SetInt("story_autoplay_flag", arg_64_1)
		PlayerPrefs.Save()

		arg_64_0.storyAutoPlayCode = arg_64_1
	end
end

function var_0_0.GetPaintingDownloadPrefs(arg_65_0)
	return PlayerPrefs.GetInt("Painting_Download_Prefs", 0)
end

function var_0_0.SetPaintingDownloadPrefs(arg_66_0, arg_66_1)
	PlayerPrefs.SetInt("Painting_Download_Prefs", arg_66_1)
end

function var_0_0.ShouldShipMainSceneWord(arg_67_0)
	return arg_67_0.showMainSceneWordTip
end

function var_0_0.SaveMainSceneWordFlag(arg_68_0, arg_68_1)
	if arg_68_0.showMainSceneWordTip ~= arg_68_1 then
		arg_68_0.showMainSceneWordTip = arg_68_1

		PlayerPrefs.SetInt("main_scene_word_toggle", arg_68_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordFrameRate(arg_69_0)
	if not arg_69_0.originalFrameRate then
		arg_69_0.originalFrameRate = Application.targetFrameRate
	end
end

function var_0_0.RestoreFrameRate(arg_70_0)
	if arg_70_0.originalFrameRate then
		Application.targetFrameRate = arg_70_0.originalFrameRate
		arg_70_0.originalFrameRate = nil
	end
end

function var_0_0.ResetTimeLimitSkinShopTip(arg_71_0)
	arg_71_0.isTipLimitSkinShop = PlayerPrefs.GetInt("tipLimitSkinShopTime_", 0) <= pg.TimeMgr.GetInstance():GetServerTime()

	if arg_71_0.isTipLimitSkinShop then
		arg_71_0.nextTipLimitSkinShopTime = GetZeroTime()
	end
end

function var_0_0.ShouldTipTimeLimitSkinShop(arg_72_0)
	return arg_72_0.isTipLimitSkinShop
end

function var_0_0.SetNextTipTimeLimitSkinShop(arg_73_0)
	if arg_73_0.isTipLimitSkinShop and arg_73_0.nextTipLimitSkinShopTime then
		PlayerPrefs.SetInt("tipLimitSkinShopTime_", arg_73_0.nextTipLimitSkinShopTime)
		PlayerPrefs.Save()

		arg_73_0.nextTipLimitSkinShopTime = nil
		arg_73_0.isTipLimitSkinShop = false
	end
end

function var_0_0.WorldBossProgressTipFlag(arg_74_0, arg_74_1)
	if arg_74_0.WorldBossProgressTipValue ~= arg_74_1 then
		arg_74_0.WorldBossProgressTipValue = arg_74_1

		PlayerPrefs.SetString("_WorldBossProgressTipFlag_", arg_74_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldBossProgressTipFlag(arg_75_0)
	if not arg_75_0.WorldBossProgressTipValue then
		local var_75_0 = pg.gameset.joint_boss_ticket.description
		local var_75_1 = var_75_0[1] + var_75_0[2]
		local var_75_2 = var_75_0[1] .. "&" .. var_75_1
		local var_75_3 = PlayerPrefs.GetString("_WorldBossProgressTipFlag_", var_75_2)

		arg_75_0.WorldBossProgressTipValue = var_75_3

		return var_75_3
	else
		return arg_75_0.WorldBossProgressTipValue
	end
end

function var_0_0.GetWorldBossProgressTipTable(arg_76_0)
	local var_76_0 = arg_76_0:GetWorldBossProgressTipFlag()

	if not var_76_0 or var_76_0 == "" then
		return {}
	end

	return string.split(var_76_0, "&")
end

function var_0_0.GetChatFlag(arg_77_0)
	if not arg_77_0.chatFlag then
		local var_77_0 = {
			ChatConst.ChannelWorld,
			ChatConst.ChannelPublic,
			ChatConst.ChannelFriend
		}

		if getProxy(GuildProxy):getRawData() then
			table.insert(var_77_0, ChatConst.ChannelGuild)
		end

		arg_77_0.chatFlag = PlayerPrefs.GetInt("chat__setting", IndexConst.Flags2Bits(var_77_0))
	end

	return arg_77_0.chatFlag
end

function var_0_0.SetChatFlag(arg_78_0, arg_78_1)
	if arg_78_0.chatFlag ~= arg_78_1 then
		arg_78_0.chatFlag = arg_78_1

		PlayerPrefs.SetInt("chat__setting", arg_78_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsShowActivityMapSPTip()
	local var_79_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("ActivityMapSPTip" .. var_79_0.id, 0)
end

function var_0_0.SetActivityMapSPTip()
	local var_80_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetInt("ActivityMapSPTip" .. var_80_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.IsTipNewTheme(arg_81_0)
	local var_81_0 = pg.backyard_theme_template
	local var_81_1 = var_81_0.all[#var_81_0.all]
	local var_81_2 = var_81_0[var_81_1].ids[1]
	local var_81_3 = pg.furniture_shop_template[var_81_2]
	local var_81_4 = getProxy(PlayerProxy):getRawData().id
	local var_81_5 = PlayerPrefs.GetInt(var_81_4 .. "IsTipNewTheme" .. var_81_1, 0) == 0

	if var_81_3 and var_81_3.new == 1 and pg.TimeMgr.GetInstance():inTime(var_81_3.time) and var_81_5 then
		arg_81_0.lastThemeId = var_81_1
	else
		arg_81_0.lastThemeId = nil
	end

	return arg_81_0.lastThemeId ~= nil
end

function var_0_0.UpdateNewThemeValue(arg_82_0)
	if arg_82_0.lastThemeId then
		local var_82_0 = arg_82_0.lastThemeId
		local var_82_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt(var_82_1 .. "IsTipNewTheme" .. var_82_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetNewGemFurnitureLocalCache(arg_83_0)
	if not arg_83_0.cacheGemFuruitures then
		arg_83_0.cacheGemFuruitures = {}

		local var_83_0 = getProxy(PlayerProxy):getRawData().id
		local var_83_1 = PlayerPrefs.GetString(var_83_0 .. "IsTipNewGenFurniture")

		if var_83_1 ~= "" then
			local var_83_2 = string.split(var_83_1, "#")

			for iter_83_0, iter_83_1 in ipairs(var_83_2) do
				arg_83_0.cacheGemFuruitures[tonumber(iter_83_1)] = true
			end
		end
	end

	return arg_83_0.cacheGemFuruitures
end

function var_0_0.IsTipNewGemFurniture(arg_84_0)
	local var_84_0 = arg_84_0:GetNewGemFurnitureLocalCache()
	local var_84_1 = getProxy(DormProxy):GetTag7Furnitures()

	if _.any(var_84_1, function(arg_85_0)
		return pg.furniture_shop_template[arg_85_0].new == 1 and not var_84_0[arg_85_0]
	end) then
		arg_84_0.newGemFurniture = var_84_1
	else
		arg_84_0.newGemFurniture = nil
	end

	return arg_84_0.newGemFurniture ~= nil
end

function var_0_0.UpdateNewGemFurnitureValue(arg_86_0)
	if arg_86_0.newGemFurniture then
		for iter_86_0, iter_86_1 in pairs(arg_86_0.newGemFurniture) do
			arg_86_0.cacheGemFuruitures[iter_86_1] = true
		end

		local var_86_0 = table.concat(arg_86_0.newGemFurniture, "#")
		local var_86_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString(var_86_1 .. "IsTipNewGenFurniture", var_86_0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetRandomFlagShipList(arg_87_0)
	if arg_87_0.randomFlagShipList then
		return arg_87_0.randomFlagShipList
	end

	local var_87_0 = getProxy(PlayerProxy):getRawData().id
	local var_87_1 = PlayerPrefs.GetString("RandomFlagShipList" .. var_87_0, "")
	local var_87_2 = string.split(var_87_1, "#")

	arg_87_0.randomFlagShipList = _.map(var_87_2, function(arg_88_0)
		return tonumber(arg_88_0)
	end)

	return arg_87_0.randomFlagShipList
end

function var_0_0.IsRandomFlagShip(arg_89_0, arg_89_1)
	if not arg_89_0.randomFlagShipMap then
		arg_89_0.randomFlagShipMap = {}

		for iter_89_0, iter_89_1 in ipairs(arg_89_0:GetRandomFlagShipList()) do
			arg_89_0.randomFlagShipMap[iter_89_1] = true
		end
	end

	return arg_89_0.randomFlagShipMap[arg_89_1] == true
end

function var_0_0.IsOpenRandomFlagShip(arg_90_0)
	local var_90_0 = arg_90_0:GetRandomFlagShipList()
	local var_90_1 = getProxy(BayProxy)

	return #var_90_0 > 0 and _.any(var_90_0, function(arg_91_0)
		return var_90_1:RawGetShipById(arg_91_0) ~= nil
	end)
end

function var_0_0.UpdateRandomFlagShipList(arg_92_0, arg_92_1)
	arg_92_0.randomFlagShipMap = nil
	arg_92_0.randomFlagShipList = arg_92_1

	local var_92_0 = table.concat(arg_92_1, "#")
	local var_92_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("RandomFlagShipList" .. var_92_1, var_92_0)
	PlayerPrefs.Save()
end

function var_0_0.GetPrevRandomFlagShipTime(arg_93_0)
	if arg_93_0.prevRandomFlagShipTime then
		return arg_93_0.prevRandomFlagShipTime
	end

	local var_93_0 = getProxy(PlayerProxy):getRawData().id

	arg_93_0.prevRandomFlagShipTime = PlayerPrefs.GetInt("RandomFlagShipTime" .. var_93_0, 0)

	return arg_93_0.prevRandomFlagShipTime
end

function var_0_0.SetPrevRandomFlagShipTime(arg_94_0, arg_94_1)
	if arg_94_0.prevRandomFlagShipTime == arg_94_1 then
		return
	end

	arg_94_0.prevRandomFlagShipTime = arg_94_1

	local var_94_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("RandomFlagShipTime" .. var_94_0, arg_94_1)
	PlayerPrefs.Save()
end

function var_0_0.GetFlagShipDisplayMode(arg_95_0)
	if not arg_95_0.flagShipDisplayMode then
		local var_95_0 = getProxy(PlayerProxy):getRawData().id

		arg_95_0.flagShipDisplayMode = PlayerPrefs.GetInt("flag-ship-display-mode" .. var_95_0, FlAG_SHIP_DISPLAY_ALL)
	end

	return arg_95_0.flagShipDisplayMode
end

function var_0_0.SetFlagShipDisplayMode(arg_96_0, arg_96_1)
	if arg_96_0.flagShipDisplayMode ~= arg_96_1 then
		arg_96_0.flagShipDisplayMode = arg_96_1

		local var_96_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("flag-ship-display-mode" .. var_96_0, arg_96_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordContinuousOperationAutoSubStatus(arg_97_0, arg_97_1)
	if arg_97_1 then
		return
	end

	local var_97_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_97_0, 1)
	PlayerPrefs.Save()
end

function var_0_0.ResetContinuousOperationAutoSub(arg_98_0)
	local var_98_0 = getProxy(PlayerProxy):getRawData().id

	if PlayerPrefs.GetInt("AutoBotCOFlag" .. var_98_0, 0) == 0 then
		return
	end

	pg.m02:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = true,
		system = SYSTEM_ACT_BOSS
	})
	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_98_0, 0)
	PlayerPrefs.Save()
end

function var_0_0.SetWorkbenchDailyTip(arg_99_0)
	local var_99_0 = getProxy(PlayerProxy):getRawData().id
	local var_99_1 = GetZeroTime()

	PlayerPrefs.SetInt("WorkbenchDailyTip" .. var_99_0, var_99_1)
	PlayerPrefs.Save()
end

function var_0_0.IsTipWorkbenchDaily(arg_100_0)
	local var_100_0 = getProxy(PlayerProxy):getRawData().id

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("WorkbenchDailyTip" .. var_100_0, 0)
end

function var_0_0.IsDisplayResultPainting(arg_101_0)
	local var_101_0 = PlayerPrefs.HasKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
	local var_101_1 = false

	if var_101_0 then
		var_101_1 = PlayerPrefs.GetInt(BATTLERESULT_SKIP_DISPAY_PAINTING) <= 0

		PlayerPrefs.DeleteKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
		PlayerPrefs.SetInt(BATTLERESULT_DISPAY_PAINTING, var_101_1 and 1 or 0)
		PlayerPrefs.Save()
	else
		var_101_1 = PlayerPrefs.GetInt(BATTLERESULT_DISPAY_PAINTING, 0) >= 1
	end

	return var_101_1
end

function var_0_0.IsDisplayCommanderCatCustomName(arg_102_0)
	if not arg_102_0.customFlag then
		local var_102_0 = getProxy(PlayerProxy):getRawData().id

		arg_102_0.customFlag = PlayerPrefs.GetInt("DisplayCommanderCatCustomName" .. var_102_0, 0) == 0
	end

	return arg_102_0.customFlag
end

function var_0_0.SetDisplayCommanderCatCustomName(arg_103_0, arg_103_1)
	if arg_103_1 == arg_103_0.customFlag then
		return
	end

	arg_103_0.customFlag = arg_103_1

	local var_103_0 = arg_103_0.customFlag and 0 or 1
	local var_103_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DisplayCommanderCatCustomName" .. var_103_1, var_103_0)
	PlayerPrefs.Save()
end

function var_0_0.GetCommanderQuicklyToolRarityConfig(arg_104_0)
	if not arg_104_0.quicklyToolRarityConfig then
		local var_104_0 = getProxy(PlayerProxy):getRawData().id
		local var_104_1 = PlayerPrefs.GetString("CommanderQuicklyToolRarityConfig" .. var_104_0, "1#1#1")
		local var_104_2 = string.split(var_104_1, "#")

		arg_104_0.quicklyToolRarityConfig = _.map(var_104_2, function(arg_105_0)
			return tonumber(arg_105_0) == 1
		end)
	end

	return arg_104_0.quicklyToolRarityConfig
end

function var_0_0.SaveCommanderQuicklyToolRarityConfig(arg_106_0, arg_106_1)
	local var_106_0 = false

	for iter_106_0, iter_106_1 in ipairs(arg_106_0.quicklyToolRarityConfig) do
		if arg_106_1[iter_106_0] ~= iter_106_1 then
			var_106_0 = true

			break
		end
	end

	if var_106_0 then
		arg_106_0.quicklyToolRarityConfig = arg_106_1

		local var_106_1 = _.map(arg_106_0.quicklyToolRarityConfig, function(arg_107_0)
			return arg_107_0 and "1" or "0"
		end)
		local var_106_2 = table.concat(var_106_1, "#")
		local var_106_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderQuicklyToolRarityConfig" .. var_106_3, var_106_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagRarityConfig(arg_108_0)
	if not arg_108_0.lockFlagRarityConfig then
		local var_108_0 = getProxy(PlayerProxy):getRawData().id
		local var_108_1 = PlayerPrefs.GetString("CommanderLockFlagRarityConfig_" .. var_108_0, "1#0#0")
		local var_108_2 = string.split(var_108_1, "#")

		arg_108_0.lockFlagRarityConfig = _.map(var_108_2, function(arg_109_0)
			return tonumber(arg_109_0) == 1
		end)
	end

	return arg_108_0.lockFlagRarityConfig
end

function var_0_0.SaveCommanderLockFlagRarityConfig(arg_110_0, arg_110_1)
	local var_110_0 = false

	for iter_110_0, iter_110_1 in ipairs(arg_110_0.lockFlagRarityConfig) do
		if arg_110_1[iter_110_0] ~= iter_110_1 then
			var_110_0 = true

			break
		end
	end

	if var_110_0 then
		arg_110_0.lockFlagRarityConfig = arg_110_1

		local var_110_1 = _.map(arg_110_0.lockFlagRarityConfig, function(arg_111_0)
			return arg_111_0 and "1" or "0"
		end)
		local var_110_2 = table.concat(var_110_1, "#")
		local var_110_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderLockFlagRarityConfig_" .. var_110_3, var_110_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagTalentConfig(arg_112_0)
	if not arg_112_0.lockFlagTalentConfig then
		local var_112_0 = getProxy(PlayerProxy):getRawData().id
		local var_112_1 = PlayerPrefs.GetString("CommanderLockFlagTalentConfig" .. var_112_0, "")
		local var_112_2 = {}

		if var_112_1 == "" then
			for iter_112_0, iter_112_1 in ipairs(CommanderCatUtil.GetAllTalentNames()) do
				var_112_2[iter_112_1.id] = true
			end
		else
			for iter_112_2, iter_112_3 in ipairs(string.split(var_112_1, "#")) do
				local var_112_3 = string.split(iter_112_3, "*")

				if #var_112_3 == 2 then
					var_112_2[tonumber(var_112_3[1])] = tonumber(var_112_3[2]) == 1
				end
			end
		end

		arg_112_0.lockFlagTalentConfig = var_112_2
	end

	return arg_112_0.lockFlagTalentConfig
end

function var_0_0.SaveCommanderLockFlagTalentConfig(arg_113_0, arg_113_1)
	arg_113_0.lockFlagTalentConfig = arg_113_1

	local var_113_0 = {}

	for iter_113_0, iter_113_1 in pairs(arg_113_1) do
		table.insert(var_113_0, iter_113_0 .. "*" .. (iter_113_1 and "1" or "0"))
	end

	local var_113_1 = table.concat(var_113_0, "#")
	local var_113_2 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("CommanderLockFlagTalentConfig" .. var_113_2, var_113_1)
	PlayerPrefs.Save()
end

function var_0_0.GetMainPaintingVariantFlag(arg_114_0, arg_114_1)
	if not arg_114_0.mainPaintingVariantFlag then
		arg_114_0.mainPaintingVariantFlag = {}
	end

	if not arg_114_0.mainPaintingVariantFlag[arg_114_1] then
		local var_114_0 = getProxy(PlayerProxy):getRawData().id
		local var_114_1 = PlayerPrefs.GetInt(arg_114_1 .. "_mainMeshImagePainting_ex_" .. var_114_0, 0)

		arg_114_0.mainPaintingVariantFlag[arg_114_1] = var_114_1
	end

	return arg_114_0.mainPaintingVariantFlag[arg_114_1]
end

function var_0_0.SwitchMainPaintingVariantFlag(arg_115_0, arg_115_1)
	local var_115_0 = 1 - arg_115_0:GetMainPaintingVariantFlag(arg_115_1)

	arg_115_0.mainPaintingVariantFlag[arg_115_1] = var_115_0

	local var_115_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(arg_115_1 .. "_mainMeshImagePainting_ex_" .. var_115_1, var_115_0)
	PlayerPrefs.Save()
end

function var_0_0.IsTipDay(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	local var_116_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_116_0 .. "educate_char_" .. arg_116_1 .. arg_116_2 .. arg_116_3, 0) == 1
end

function var_0_0.RecordTipDay(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	local var_117_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_117_0 .. "educate_char_" .. arg_117_1 .. arg_117_2 .. arg_117_3, 1)
	PlayerPrefs.Save()
end

function var_0_0.UpdateEducateCharTip(arg_118_0, arg_118_1)
	local var_118_0 = getProxy(PlayerProxy):getRawData().id
	local var_118_1 = NewEducateHelper.GetAllUnlockSecretaryIds()
	local var_118_2 = {}

	for iter_118_0, iter_118_1 in ipairs(arg_118_1 or {}) do
		var_118_2[iter_118_1] = true
	end

	for iter_118_2, iter_118_3 in ipairs(var_118_1 or {}) do
		local var_118_3 = var_118_0 .. "educate_char_tip" .. iter_118_3

		if var_118_2[iter_118_3] ~= true then
			PlayerPrefs.SetInt(var_118_3, 1)
			PlayerPrefs.Save()
		end
	end

	arg_118_0:RefillEducateCharTipList()
end

function var_0_0.RefillEducateCharTipList(arg_119_0)
	local var_119_0 = getProxy(PlayerProxy):getRawData().id

	arg_119_0.educateCharTipList = {}

	if LOCK_EDUCATE_SYSTEM then
		return
	end

	local var_119_1 = NewEducateHelper.GetAllUnlockSecretaryIds()

	for iter_119_0, iter_119_1 in ipairs(var_119_1 or {}) do
		if PlayerPrefs.GetInt(var_119_0 .. "educate_char_tip" .. iter_119_1, 0) == 1 then
			table.insert(arg_119_0.educateCharTipList, iter_119_1)
		end
	end
end

function var_0_0.ShouldEducateCharTip(arg_120_0)
	if NewEducateHelper.GetEducateCharSlotMaxCnt() == 0 then
		return false
	end

	if not arg_120_0.educateCharTipList or #arg_120_0.educateCharTipList == 0 then
		arg_120_0:RefillEducateCharTipList()
	end

	return _.any(arg_120_0.educateCharTipList, function(arg_121_0)
		return NewEducateHelper.IsUnlockDefaultShip(arg_121_0)
	end)
end

function var_0_0._ShouldEducateCharTip(arg_122_0, arg_122_1)
	if not arg_122_0.educateCharTipList or #arg_122_0.educateCharTipList == 0 then
		arg_122_0:RefillEducateCharTipList()
	end

	if table.contains(arg_122_0.educateCharTipList, arg_122_1) and NewEducateHelper.IsUnlockDefaultShip(arg_122_1) then
		return true
	end

	return false
end

function var_0_0.ClearEducateCharTip(arg_123_0, arg_123_1)
	if not arg_123_0:_ShouldEducateCharTip(arg_123_1) then
		return false
	end

	table.removebyvalue(arg_123_0.educateCharTipList, arg_123_1)

	local var_123_0 = getProxy(PlayerProxy):getRawData().id .. "educate_char_tip" .. arg_123_1

	if PlayerPrefs.HasKey(var_123_0) then
		PlayerPrefs.DeleteKey(var_123_0)
		PlayerPrefs.Save()
	end

	pg.m02:sendNotification(GAME.CLEAR_EDUCATE_TIP, {
		id = arg_123_1
	})

	return true
end

function var_0_0.GetMainSceneThemeStyle(arg_124_0)
	if PlayerPrefs.GetInt(USAGE_NEW_MAINUI, 1) == 1 then
		return NewMainScene.THEME_MELLOW
	else
		return NewMainScene.THEME_CLASSIC
	end
end

function var_0_0.IsMellowStyle(arg_125_0)
	local var_125_0 = arg_125_0:GetMainSceneThemeStyle()

	return NewMainScene.THEME_MELLOW == var_125_0
end

function var_0_0.GetMainSceneScreenSleepTime(arg_126_0)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		return SleepTimeout.SystemSetting
	end

	local var_126_0 = pg.settings_other_template[20].name

	if PlayerPrefs.GetInt(var_126_0, 1) == 1 then
		return SleepTimeout.NeverSleep
	else
		return SleepTimeout.SystemSetting
	end
end

function var_0_0.ShowL2dResetInMainScene(arg_127_0)
	local var_127_0 = pg.settings_other_template[21].name

	return PlayerPrefs.GetInt(var_127_0, 0) == 1
end

function var_0_0.Reset(arg_128_0)
	arg_128_0:resetEquipSceneIndex()
	arg_128_0:resetActivityLayerIndex()

	arg_128_0.isStopBuildSpeedupReamind = false

	arg_128_0:RestoreFrameRate()

	arg_128_0.randomFlagShipList = nil
	arg_128_0.prevRandomFlagShipTime = nil
	arg_128_0.randomFlagShipMap = nil
	arg_128_0.educateCharTipList = {}
end

return var_0_0
