ys.Battle.BattleConfig = ys.Battle.BattleConfig or {}

local var_0_0 = ys.Battle.BattleConfig

var_0_0.COMBAT_DELAY_ACTIVE = 0.6
var_0_0.calcFPS = 30
var_0_0.viewFPS = 30
var_0_0.AIFPS = 10
var_0_0.calcInterval = 1 / var_0_0.calcFPS
var_0_0.viewInterval = 1 / var_0_0.viewFPS
var_0_0.AIInterval = 1 / var_0_0.AIFPS
var_0_0.FRIENDLY_CODE = 1
var_0_0.FOE_CODE = -1
var_0_0.SHIELD_CENTER_CONST = 3.14
var_0_0.SHIELD_CENTER_CONST_2 = 2.0933333333333333
var_0_0.SHIELD_CENTER_CONST_4 = 4.1866666666666665
var_0_0.SHIELD_ROTATE_CONST = 30 / math.pi * 18
var_0_0.K1 = 6
var_0_0.K2 = 100
var_0_0.K3 = 3.14
var_0_0.AIR_ASSIST_RELOAD_RATIO = 220
var_0_0.RANDOM_DAMAGE_MIN = 0
var_0_0.RANDOM_DAMAGE_MAX = 2
var_0_0.BASIC_TIME_SCALE = 1
var_0_0.SPINE_SCALE = 2
var_0_0.BULLET_UPPER_BOUND_VISION_OFFSET = 30
var_0_0.BULLET_LEFT_BOUND_SPLIT_OFFSET = 8
var_0_0.BULLET_LOWER_BOUND_SPLIT_OFFSET = 8
var_0_0.BULLET_SPLIT_SHIFT_DELAY = 0.2
var_0_0.CAMERA_INIT_POS = Vector3(0, 62, -10)
var_0_0.CAMERA_SIZE = 20
var_0_0.CAMERA_BASE_HEIGH = 8
var_0_0.CAMERA_GOLDEN_RATE = 0.618
var_0_0.AntiAirConfig = {}
var_0_0.AntiAirConfig.const_n = 10
var_0_0.AntiAirConfig.const_K = 1000
var_0_0.AntiAirConfig.const_N = 5
var_0_0.AntiAirConfig.const_A = 20
var_0_0.AntiAirConfig.const_B = 40
var_0_0.AntiAirConfig.Restore_Interval = 1
var_0_0.AntiAirConfig.Precast_duration = 0.25
var_0_0.AntiAirConfig.RangeBulletID = 2001
var_0_0.AntiAirConfig.RangeBarrageID = 1
var_0_0.AntiAirConfig.RangeAntiAirBone = "rangeantiaircraft"
var_0_0.AirSupportUnitPos = Vector3(-105, 0, 58)
var_0_0.AnitAirRepeaterConfig = {}
var_0_0.AnitAirRepeaterConfig.const_A = 32
var_0_0.AnitAirRepeaterConfig.const_B = 12
var_0_0.AnitAirRepeaterConfig.const_C = 220
var_0_0.AnitAirRepeaterConfig.upper_range = 35
var_0_0.AnitAirRepeaterConfig.lower_range = 15
var_0_0.ChargeWeaponConfig = {}
var_0_0.ChargeWeaponConfig.a1 = 0
var_0_0.ChargeWeaponConfig.K1 = 0
var_0_0.ChargeWeaponConfig.K2 = 1000
var_0_0.ChargeWeaponConfig.FIX_CD = 7
var_0_0.ChargeWeaponConfig.MEGA_FIX_CD = 3
var_0_0.ChargeWeaponConfig.GCD = 1
var_0_0.ChargeWeaponConfig.Enhance = 1.2
var_0_0.ChargeWeaponConfig.SIGHT_A = 0.35
var_0_0.ChargeWeaponConfig.SIGHT_B = -40
var_0_0.ChargeWeaponConfig.SIGHT_C = 38
var_0_0.TorpedoCFG = {}
var_0_0.TorpedoCFG.T = 10
var_0_0.TorpedoCFG.N = 1000
var_0_0.TorpedoCFG.GCD = 0.5
var_0_0.AirAssistCFG = {}
var_0_0.AirAssistCFG.GCD = 0.5
var_0_0.HammerCFG = {}
var_0_0.HammerCFG.PreventUpperBound = 0.8
var_0_0.BulletHeight = 1
var_0_0.HeightOffsetRate = 1.5
var_0_0.CharacterFeetHight = -0.5
var_0_0.BombDetonateHeight = 1.2
var_0_0.CameraSizeChangeSpeed = 0.04
var_0_0.AircraftHeight = 10
var_0_0.AirFighterOffsetZ = 3
var_0_0.AirFighterHeight = 10
var_0_0.CommonBone = {
	rangeantiaircraft = {
		{
			1.5,
			1.1,
			0
		}
	}
}
var_0_0.MaxLeft = -10000
var_0_0.MaxRight = 10000
var_0_0.BornOffset = Vector3(0, 0, 0.1)
var_0_0.FORMATION_ID = 10001
var_0_0.CelebrateDuration = 3
var_0_0.EscapeDuration = 5
var_0_0.BulletMotionRate = 0.4
var_0_0.BulletSpeedConvertConst = 0.1
var_0_0.ShipSpeedConvertConst = 0.01
var_0_0.AircraftSpeedConvertConst = 0.01
var_0_0.PLAYER_WEAPON_GLOBAL_COOL_DOWN_DURATION = 0.5
var_0_0.PLAYER_DEFAULT = 0
var_0_0.SPECTRE_UNIT_TYPE = -99
var_0_0.VISIBLE_SPECTRE_UNIT_TYPE = -100
var_0_0.FUSION_ELEMENT_UNIT_TYPE = -10000
var_0_0.COUNT_DOWN_ESCAPE_AI_ID = 80006
var_0_0.ESCAPE_EXPLO_TAG = {
	"unexit"
}
var_0_0.RESOURCE_STEP = 10
var_0_0.RESOURCE_STAY_DURATION = 2
var_0_0.CAST_CAM_ZOOM_SIZE = 14
var_0_0.CAST_CAM_ZOOM_IN_DURATION = 0.1
var_0_0.CAST_CAM_ZOOM_IN_DURATION_SKILL = 0.04
var_0_0.CAST_CAM_ZOOM_OUT_DURATION_CANNON = 0.1
var_0_0.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON = 0.04
var_0_0.CAST_CAM_ZOOM_OUT_DELAY_CANNON = 0
var_0_0.CAST_CAM_ZOOM_OUT_DURATION_AIR = 0.1
var_0_0.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_AIR = 0.03
var_0_0.CAST_CAM_ZOOM_OUT_DELAY_AIR = 0.05
var_0_0.AIR_ASSIST_SPEED_RATE = 2.8
var_0_0.CAST_CAM_ZOOM_OUT_DURATION_SKILL = 0.04
var_0_0.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_SKILL = 0
var_0_0.CAST_CAM_ZOOM_OUT_DELAY_SKILL = 0
var_0_0.CALIBRATE_ACCELERATION = 1.2
var_0_0.CAST_CAM_OVERLOOK_SIZE = 24
var_0_0.CAST_CAM_OVERLOOK_REVERT_DURATION = 1.5
var_0_0.CAM_RESET_DURATION = 0.7
var_0_0.SPEED_FACTOR_FOCUS_CHARACTER = "focusCharacter"
var_0_0.FOCUS_MAP_RATE = 0.1
var_0_0.MAIN_UNIT_POS = {
	[var_0_0.FRIENDLY_CODE] = {
		Vector3(-105, 0, 58),
		Vector3(-105, 0, 78),
		Vector3(-105, 0, 38)
	},
	[var_0_0.FOE_CODE] = {
		Vector3(15, 0, 58),
		Vector3(15, 0, 78),
		Vector3(15, 0, 38)
	}
}
var_0_0.FIELD_RIGHT_BOUND_BIAS = 0
var_0_0.SUB_UNIT_POS_Z = {
	58,
	78,
	38
}
var_0_0.SUB_UNIT_OFFSET_X = -5
var_0_0.SUB_BENCH_POS = {
	Vector3(-325, 0, 228),
	Vector3(-325, 0, 128)
}
var_0_0.SHIP_CLD_INTERVAL = 1
var_0_0.SHIP_CLD_BUFF = 8010
var_0_0.START_SPEED_CONST_A = 2.5
var_0_0.START_SPEED_CONST_B = 0.25
var_0_0.START_SPEED_CONST_C = 0.3
var_0_0.START_SPEED_CONST_D = 2.5
var_0_0.GRAVITY = -0.05
var_0_0.DUEL_MAIN_RAGE_BUFF = 6
var_0_0.DULE_BALANCE_BUFF = 19
var_0_0.SIMULATION_BALANCE_BUFF = 49
var_0_0.ARENA_LIST = {
	80000,
	80001,
	80002,
	80003
}
var_0_0.SIMULATION_FREE_BUFF = 41
var_0_0.SIMULATION_ADVANTAGE_BUFF = 42
var_0_0.SIMULATION_ADVANTAGE_CANCEL_LIST = {
	42,
	44,
	45
}
var_0_0.SIMULATION_DISADVANTAGE_BUFF = 43
var_0_0.SIMULATION_RIVAL_RAGE_TOTAL_COUNT = 30
var_0_0.CHALLENGE_INVINCIBLE_BUFF = 50
var_0_0.WARNING_HP_RATE = 0.7
var_0_0.WARNING_HP_RATE_MAIN = 0.3
var_0_0.SKILL_BUTTON_DEFAULT_PREFERENCE = {}
var_0_0.SKILL_BUTTON_DEFAULT_PREFERENCE[1] = {
	x = 0.924,
	scale = 1,
	y = 0.135
}
var_0_0.SKILL_BUTTON_DEFAULT_PREFERENCE[2] = {
	x = 0.81,
	scale = 1,
	y = 0.135
}
var_0_0.SKILL_BUTTON_DEFAULT_PREFERENCE[3] = {
	x = 0.696,
	scale = 1,
	y = 0.135
}
var_0_0.SKILL_BUTTON_DEFAULT_PREFERENCE[4] = {
	x = 0.58,
	scale = 1,
	y = 0.135
}
var_0_0.JOY_STICK_DEFAULT_PREFERENCE = {
	x = 0.12,
	scale = 1,
	y = 0.183
}
var_0_0.AUTO_DEFAULT_PREFERENCE = {
	x = 0.0625,
	scale = 1,
	y = 0.925
}
var_0_0.DOT_CONFIG = {}
var_0_0.DOT_CONFIG[1] = {
	reduce = "igniteReduce",
	shorten = "igniteShorten",
	prolong = "igniteProlong",
	resist = "igniteResist",
	enhance = "igniteEnhance",
	hit = "ignite_accuracy"
}
var_0_0.DOT_CONFIG[2] = {
	reduce = "floodingReduce",
	shorten = "floodingShorten",
	prolong = "floodingProlong",
	resist = "floodingResist",
	enhance = "floodingEnhance",
	hit = "flooding_accuracy"
}
var_0_0.DOT_CONFIG[10] = {}
var_0_0.DOT_CONFIG[20516] = {}
var_0_0.DOT_CONFIG_DEFAULT = {
	reduce = 0,
	shorten = 0,
	prolong = 0,
	resist = 0,
	enhance = 0,
	hit = 0
}
var_0_0.AMMO_DAMAGE_ENHANCE = {
	"damageRatioByAmmoType_1",
	"damageRatioByAmmoType_2",
	"damageRatioByAmmoType_3",
	"damageRatioByAmmoType_4",
	nil,
	nil,
	"damageRatioByAmmoType_7"
}
var_0_0.AMMO_DAMAGE_REDUCE = {
	"damageReduceFromAmmoType_1",
	"damageReduceFromAmmoType_2",
	"damageReduceFromAmmoType_3",
	"damageReduceFromAmmoType_4",
	nil,
	nil,
	"damageReduceFromAmmoType_7"
}
var_0_0.DAMAGE_AMMO_TO_ARMOR_RATE_ENHANCE = {
	"damageAmmoToArmorRateEnhance_1",
	"damageAmmoToArmorRateEnhance_2",
	"damageAmmoToArmorRateEnhance_3"
}
var_0_0.DAMAGE_TO_ARMOR_RATE_ENHANCE = {
	"damageToArmorRateEnhance_1",
	"damageToArmorRateEnhance_2",
	"damageToArmorRateEnhance_3"
}
var_0_0.SHIP_TYPE_ACCURACY_ENHANCE = {
	[ShipType.QuZhu] = "accuracyToShipType_1",
	[ShipType.QingXun] = "accuracyToShipType_2",
	[ShipType.ZhongXun] = "accuracyToShipType_3",
	[ShipType.ZhanXun] = "accuracyToShipType_4",
	[ShipType.ZhanLie] = "accuracyToShipType_5",
	[ShipType.QingHang] = "accuracyToShipType_6",
	[ShipType.ZhengHang] = "accuracyToShipType_7",
	[ShipType.QianTing] = "accuracyToShipType_8",
	[ShipType.HangXun] = "accuracyToShipType_9",
	[ShipType.HangZhan] = "accuracyToShipType_10",
	[ShipType.LeiXun] = "accuracyToShipType_11",
	[ShipType.WeiXiu] = "accuracyToShipType_12",
	[ShipType.ZhongPao] = "accuracyToShipType_13",
	[ShipType.YuLeiTing] = "accuracyToShipType_14",
	[ShipType.JinBi] = "accuracyToShipType_15",
	[ShipType.ZiBao] = "accuracyToShipType_16",
	[ShipType.QianMu] = "accuracyToShipType_17",
	[ShipType.ChaoXun] = "accuracyToShipType_18",
	[ShipType.Yunshu] = "accuracyToShipType_19",
	[ShipType.DaoQuV] = "accuracyToShipType_20",
	[ShipType.DaoQuM] = "accuracyToShipType_21",
	[ShipType.FengFanS] = "accuracyToShipType_22",
	[ShipType.FengFanV] = "accuracyToShipType_23",
	[ShipType.FengFanM] = "accuracyToShipType_24"
}
var_0_0.OXY_RAID_BASE_LINE_PVE = -20
var_0_0.OXY_RAID_BASE_LINE_PVP = -20
var_0_0.SUB_DEFAULT_STAY_AI = 10006
var_0_0.SUB_DEFAULT_ENGAGE_AI = 90001
var_0_0.SUB_DEFAULT_RETREAT_AI = 90002
var_0_0.SONAR_DURATION_K = 0.1
var_0_0.SONAR_INTERVAL_K = 0.1
var_0_0.VAN_SONAR_PROPERTY = {
	[ShipType.QuZhu] = {
		maxRange = 100,
		a = 2,
		minRange = 45,
		b = 32
	},
	[ShipType.QingXun] = {
		maxRange = 80,
		a = 2.86,
		minRange = 30,
		b = 0
	},
	[ShipType.DaoQuV] = {
		maxRange = 100,
		a = 2,
		minRange = 45,
		b = 32
	}
}
var_0_0.MAIN_SONAR_PROPERTY = {
	maxRange = 15,
	a = 24,
	minRange = 0
}
var_0_0.SUB_EXPOSE_LASTING_DURATION = 0.5
var_0_0.SUB_FADE_IN_DURATION = 0.5
var_0_0.SUB_FADE_OUT_DURATION = 0.5
var_0_0.SUB_DIVE_IMMUNE_IGNITE_BUFF = 314
var_0_0.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF = 315
var_0_0.PLAYER_SUB_BUBBLE_FX = "bubble"
var_0_0.PLAYER_SUB_BUBBLE_INIT = 200
var_0_0.PLAYER_SUB_BUBBLE_INTERVAL = 3
var_0_0.MONSTER_SUB_KAMIKAZE_DUAL_K = 50
var_0_0.MONSTER_SUB_KAMIKAZE_DUAL_P = 0.15
var_0_0.BATTLE_SHADER = {}
var_0_0.BATTLE_SHADER.SEMI_TRANSPARENT = "M02/Unlit_Colored_Semitransparent"
var_0_0.BATTLE_SHADER.GRID_TRANSPARENT = "M02/Skeleton Colored_Additive"
var_0_0.BATTLE_SHADER.COLORED_ALPHA = "M02/Unlit Colored_Alpha"
var_0_0.BATTLE_DODGEM_STAGES = {
	1140101,
	1140102,
	1140103
}
var_0_0.BATTLE_DODGEM_PASS_SCORE = 10
var_0_0.SR_CONFIG = {}
var_0_0.SR_CONFIG.FLOAT_CD = 2
var_0_0.SR_CONFIG.DIVE_CD = 2
var_0_0.SR_CONFIG.BOOST_CD = 10
var_0_0.SR_CONFIG.SHIFT_CD = 5
var_0_0.SR_CONFIG.BOOST_SPEED = 2
var_0_0.SR_CONFIG.BOOST_DECAY = 0.2
var_0_0.SR_CONFIG.BOOST_DURATION = 12
var_0_0.SR_CONFIG.BOOST_DECAY_STAMP = 9
var_0_0.SR_CONFIG.BASE_POINT = 100
var_0_0.SR_CONFIG.POINT = 10
var_0_0.SR_CONFIG.DEAD_POINT = 15
var_0_0.SR_CONFIG.M = 2
var_0_0.CHALLENGE_ENHANCE = {}
var_0_0.CHALLENGE_ENHANCE.K = 1
var_0_0.CHALLENGE_ENHANCE.X = 3
var_0_0.CHALLENGE_ENHANCE.A = 2
var_0_0.CHALLENGE_ENHANCE.X1 = 5
var_0_0.CHALLENGE_ENHANCE.X2 = 5
var_0_0.CHALLENGE_ENHANCE.Y1 = 10
var_0_0.CHALLENGE_ENHANCE.Y2 = 5
var_0_0.LOADING_TIPS_LIMITED_SYSTEM = {
	SYSTEM_WORLD
}
var_0_0.WORLD_ENEMY_ENHANCEMENT_CONST_B = 80
var_0_0.WORLD_ENEMY_ENHANCEMENT_CONST_C = 1.1
var_0_0.BULLET_DECREASE_DMG_FONT = {
	4,
	0.9
}
var_0_0.CLOAK_EXPOSE_CONST = 50
var_0_0.CLOAK_EXPOSE_BASE_MIN = 100
var_0_0.CLOAK_EXPOSE_SKILL_MIN = 60
var_0_0.CLOAK_BASE_RESTORE_DELTA = -60
var_0_0.CLOAK_RECOVERY = 5
var_0_0.BASE_ARP = 0.1
var_0_0.CLOAK_STRIKE_ADDITIVE = 6
var_0_0.CLOAK_STRIKE_ADDITIVE_LIMIT = 60
var_0_0.CLOAK_BOMBARD_BASE_EXPOSE = 10
var_0_0.AIM_BIAS_FLEET_RANGE_MOD = 0.18
var_0_0.AIM_BIAS_SUB_RANGE_MOD = 0.18
var_0_0.AIM_BIAS_MONSTER_RANGE_MOD = 0.4
var_0_0.AIM_BIAS_DECAY_MOD = 0.01
var_0_0.AIM_BIAS_DECAY_MOD_MONSTER = 0.01
var_0_0.AIM_BIAS_DECAY_BASE = 0
var_0_0.AIM_BIAS_DECAY_SUB_CONST = 50
var_0_0.AIM_BIAS_DECAY_SMOKE = 1
var_0_0.AIM_BIAS_DECAY_SMOKE_NIGHT = 0.8
var_0_0.AIM_BIAS_SMOKE_RESTORE_DURATION = 3
var_0_0.AIM_BIAS_SMOKE_RECOVERY_RATE = 0.6
var_0_0.AIM_BIAS_DECAY_SPEED_MAX_SCOUT = 3
var_0_0.AIM_BIAS_DECAY_SPEED_MAX_MONSTER = 3
var_0_0.AIM_BIAS_DECAY_SPEED_MAX_SUB = 100
var_0_0.AIM_BIAS_MIN_RANGE_SCOUT = {
	3,
	4,
	5,
	5
}
var_0_0.AIM_BIAS_MIN_RANGE_MONSTER = 4
var_0_0.AIM_BIAS_MIN_RANGE_SUB = 4
var_0_0.AIM_BIAS_MAX_RANGE_SCOUT = 25
var_0_0.AIM_BIAS_MAX_RANGE_MONSTER = 60
var_0_0.AIM_BIAS_MAX_RANGE_SUB = 25
var_0_0.AIM_BIAS_ENEMY_INIT_TIME = 1.5
var_0_0.FLEET_ATTR_CAP = {
	kuangsanshuliang = 3,
	shenpanzhijian = 6,
	yuanchou = 9,
	Judgement = 12,
	YumiaManaFlow = 10,
	kuangsanshijian = 50,
	ReisalinAP = 99,
	KansasSP = 3,
	YumiaMANA = 100,
	huohun = 5
}
var_0_0.TARGET_SELECT_PRIORITY = {
	C14_1 = 10,
	leastHP = 998,
	QEM_highlight = 99,
	C14_highlight = 11,
	farthest = 999,
	highlight = 99,
	xuzhang_hude = 1
}
var_0_0.EQUIPMENT_ACTIVE_LIMITED_BY_TYPE = {
	[31] = {
		21
	},
	[32] = {
		20
	}
}
var_0_0.TRIGGER_PRIORITY = {
	[ys.Battle.BattleConst.BuffEffectType.ON_TAKE_DAMAGE] = {
		BattleBuffHPLink = 15,
		BattleBuffCount = 30,
		BattleBuffShield = 20,
		BattleBuffLockHealth = 10,
		BattleBuffOverHealingShield = 20,
		BattleBuffRecordShield = 20,
		BattleBuffBarrier = 20,
		BattleBuffCastSkillDamageCount = 25
	}
}
var_0_0.TRIGGER_PRIORITY_LOWEST = 99
var_0_0.SWEET_DEATH_NATIONALITY = {
	107
}
var_0_0.ALCHEMIST_AP_UI = {
	109
}
var_0_0.ALCHEMIST_AP_NAME = "ReisalinAP"
var_0_0.YUMIA_MANA_UI = {
	113
}
var_0_0.YUMIA_MANA_NAME = "YumiaMANA"
var_0_0.MIRROR_QICON_KEY = "_turn"
var_0_0.MIRROR_QICON_SHIP_GROUP = {
	1150005
}
