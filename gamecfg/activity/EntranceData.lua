return {
	{
		banner = "summary",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SUMMARY
		},
		isShow = function()
			return
		end
	},
	{
		banner = "build_pray",
		event = ActivityMediator.GO_PRAY_POOL,
		data = {},
		isShow = function()
			local var_2_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_PRAY_POOL)

			return var_2_0 and not var_2_0:isEnd()
		end
	},
	{
		banner = "build_bisimai",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.GETBOAT,
			{
				projectName = BuildShipScene.PROJECTS.ACTIVITY
			}
		},
		isShow = function()
			local var_3_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.BUILD_BISMARCK_ID)

			return var_3_0 and not var_3_0:isEnd()
		end
	},
	{
		banner = "ming_paint",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.COLORING
		},
		isShow = function()
			local var_4_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_COLORING_ALPHA)

			return var_4_0 and not var_4_0:isEnd()
		end,
		isTip = function()
			return getProxy(ColoringProxy):CheckTodayTip()
		end
	},
	{
		banner = "limit_skin",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SKINSHOP,
			{
				mode = NewSkinShopScene.MODE_EXPERIENCE
			}
		},
		isShow = function()
			if LOCK_SKIN_US and pg.gameset.levellimit_skinentrance.key_value >= getProxy(PlayerProxy):getRawData().level then
				return false
			end

			local var_6_0 = pg.activity_banner.get_id_list_by_type[GAMEUI_BANNER_12]

			return var_6_0 and #var_6_0 > 0 and _.any(var_6_0, function(arg_7_0)
				local var_7_0 = pg.activity_banner[arg_7_0].time

				return pg.TimeMgr.GetInstance():inTime(var_7_0)
			end)
		end,
		isTip = function()
			local var_8_0 = pg.gameset.skin_ticket.key_value
			local var_8_1 = getProxy(PlayerProxy):getRawData():getResource(var_8_0)

			if not var_8_1 or not (var_8_1 > 0) then
				return false
			end

			local var_8_2 = getProxy(ShipSkinProxy)
			local var_8_3 = var_8_2:GetAllSkins()

			return _.any(var_8_3, function(arg_9_0)
				return arg_9_0:getConfig("genre") == ShopArgs.SkinShopTimeLimit and not var_8_2:hasSkin(arg_9_0:getSkinId())
			end) and getProxy(SettingsProxy):ShouldTipTimeLimitSkinShop()
		end
	},
	{
		banner = "banai_shop",
		event = ActivityMediator.GO_SHOPS_LAYER,
		data = {
			{
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = ActivityConst.BISMARCK_PT_SHOP_ID
			}
		},
		isShow = function()
			local var_10_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.BISMARCK_PT_SHOP_ID)

			return var_10_0 and not var_10_0:isEnd()
		end
	},
	{
		banner = "bili_shop",
		event = ActivityMediator.GO_SHOPS_LAYER,
		data = {
			{
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = ActivityConst.BILIBILI_PT_SHOP_ID
			}
		},
		isShow = function()
			local var_11_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.BILIBILI_PT_SHOP_ID)

			return var_11_0 and not var_11_0:isEnd()
		end
	},
	{},
	{
		banner = "commom_build",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.GETBOAT,
			{
				projectName = BuildShipScene.PROJECTS.ACTIVITY
			}
		},
		isShow = function()
			local var_12_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.FRANCE_RE_BUILD)

			return var_12_0 and not var_12_0:isEnd()
		end
	},
	{
		banner = "commom_pt_shop",
		event = ActivityMediator.GO_SHOPS_LAYER,
		data = {
			{
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = ActivityConst.FRANCE_RE_PT_SHOP
			}
		},
		isShow = function()
			local var_13_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.FRANCE_RE_PT_SHOP)

			return var_13_0 and not var_13_0:isEnd()
		end
	},
	{
		banner = "commom_skin_shop",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SKINSHOP
		},
		isShow = function()
			return pg.TimeMgr.GetInstance():inTime({
				{
					{
						2019,
						6,
						27
					},
					{
						0,
						0,
						0
					}
				},
				{
					{
						2019,
						7,
						10
					},
					{
						23,
						59,
						59
					}
				}
			})
		end
	},
	{
		banner = "summer_feast",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SUMMER_FEAST
		},
		isShow = function()
			local var_15_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.SUMMER_FEAST_ID)

			return var_15_0 and not var_15_0:isEnd()
		end
	},
	{
		banner = "event_square",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.NEWYEAR_SQUARE
		},
		isShow = function()
			local var_16_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY)

			return var_16_0 and not var_16_0:isEnd()
		end
	},
	{
		banner = "LanternFestival",
		event = ActivityMediator.GO_MINI_GAME,
		data = setmetatable({}, {
			__index = function(arg_17_0, arg_17_1)
				if arg_17_1 == 1 then
					local var_17_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.LANTERNFESTIVAL)

					if var_17_0 and not var_17_0:isEnd() then
						arg_17_0[arg_17_1] = var_17_0:getConfig("config_client").miniGame

						return arg_17_0[arg_17_1]
					end
				end

				return nil
			end
		}),
		isShow = function()
			local var_18_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.LANTERNFESTIVAL)

			return var_18_0 and not var_18_0:isEnd()
		end,
		isTip = function()
			local var_19_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.LANTERNFESTIVAL)

			if var_19_0 and not var_19_0:isEnd() then
				local var_19_1 = getProxy(MiniGameProxy):GetHubByHubId(var_19_0:getConfig("config_id"))

				return var_19_1.count > 0 and var_19_1.usedtime < 7
			end
		end
	},
	{
		banner = "encode_game",
		event = ActivityMediator.GO_DECODE_MINI_GAME,
		data = {
			11
		},
		isShow = function()
			local var_20_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)
			local var_20_1 = _.detect(var_20_0, function(arg_21_0)
				return arg_21_0:getConfig("config_id") == 7
			end)

			return var_20_1 and not var_20_1:isEnd()
		end,
		isTip = function()
			local var_22_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)
			local var_22_1 = _.detect(var_22_0, function(arg_23_0)
				return arg_23_0:getConfig("config_id") == 7
			end)

			if var_22_1 and not var_22_1:isEnd() then
				local var_22_2 = getProxy(MiniGameProxy):GetHubByHubId(var_22_1:getConfig("config_id"))

				return var_22_2 and var_22_2.id == 7 and var_22_2.count > 0
			end
		end
	},
	{
		banner = "air_fight",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.AIRFORCE_DRAGONEMPERY
		},
		isShow = function()
			do return false end

			local var_24_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE)

			return var_24_0 and not var_24_0:isEnd()
		end,
		isTip = function()
			local var_25_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE)

			if var_25_0 and not var_25_0:isEnd() then
				return var_25_0:readyToAchieve()
			end
		end
	},
	{
		banner = "doa_medal",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.DOA2_MEDAL_COLLECTION_SCENE
		},
		isShow = function()
			local var_26_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.DOA_MEDAL_ACT_ID)

			return var_26_0 and not var_26_0:isEnd()
		end,
		isTip = function()
			local var_27_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.DOA_MEDAL_ACT_ID)

			return Activity.IsActivityReady(var_27_0)
		end
	},
	{
		banner = "meta_entrance_970708",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.METACHARACTER,
			{
				autoOpenShipConfigID = 9707081
			}
		},
		isShow = function()
			local var_28_0 = 970708
			local var_28_1 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(var_28_0)

			return var_28_1 and var_28_1:isInAct()
		end,
		isTip = function()
			local var_29_0 = 970708
			local var_29_1 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(var_29_0)

			if var_29_1:isPassType() then
				return false
			end

			if not var_29_1:isShow() then
				return false
			end

			local var_29_2 = false

			if var_29_1.metaPtData then
				var_29_2 = var_29_1.metaPtData:CanGetAward()
			end

			if var_29_2 == false then
				var_29_2 = getProxy(MetaCharacterProxy):getRedTag(var_29_0)
			end

			return var_29_2
		end
	},
	{
		banner = "activity_permanent",
		event = ActivityMediator.ACTIVITY_PERMANENT,
		data = {},
		isShow = function()
			return not LOCK_PERMANENT_ENTER
		end,
		isTip = function()
			return PlayerPrefs.GetString("permanent_time", "") ~= pg.gameset.permanent_mark.description
		end
	},
	{
		banner = "activity_miniprogram",
		event = ActivityMediator.OPEN_MINI_PROGRAM,
		data = {},
		isShow = function()
			return PLATFORM_CODE == PLATFORM_CH and (PermissionHelper.IsAndroid and LuaHelper.GetCHPackageType() == 1 or PermissionHelper.IsIOS()) and getProxy(ActivityProxy):IsActivityNotEnd(getGameset("WeChat_Mini_Program")[1])
		end,
		isTip = function()
			return false
		end
	},
	{
		banner = "doa_medal",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.OTHERWORLD_BACKHILL
		},
		isShow = function()
			local var_34_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID)

			return var_34_0 and not var_34_0:isEnd()
		end,
		isTip = function()
			local var_35_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID)

			return Activity.IsActivityReady(var_35_0)
		end
	}
}
