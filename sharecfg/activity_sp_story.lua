pg = pg or {}
pg.activity_sp_story = {
	{
		story_type = 1,
		pre_event = "",
		name = "EPS-1 A Musician's Dream",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_546",
		story = "HUANMENGJIANZOUQU1",
		change_bgm = "story-richang-light",
		id = 1,
		lock = ""
	},
	{
		story_type = 1,
		name = "EPS-2A Formal Invitation",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "star_level_bg_546",
		id = 2,
		story = "HUANMENGJIANZOUQU2",
		pre_event = {
			1
		},
		lock = {
			{
				4,
				1
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-3 A Casual Meal",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "level-french1",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 3,
		story = "HUANMENGJIANZOUQU3",
		pre_event = {
			2
		},
		lock = {
			{
				4,
				2
			}
		}
	},
	{
		story_type = 2,
		name = "EPS-4 Peace Interlude",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 4,
		story = "1826001",
		pre_event = {
			3
		},
		lock = {
			{
				4,
				3
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-5 Face to Face",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "story-richang-sooth",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_2",
		id = 5,
		story = "HUANMENGJIANZOUQU5",
		pre_event = {
			4
		},
		lock = {
			{
				4,
				4
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-6 Music in the Night",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "story-richang-sooth",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_2",
		id = 6,
		story = "HUANMENGJIANZOUQU6",
		pre_event = {
			5
		},
		lock = {
			{
				4,
				5
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-7 The Secret of the Basilica",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "theme-vichy-church",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_2",
		id = 7,
		story = "HUANMENGJIANZOUQU7",
		pre_event = {
			6
		},
		lock = {
			{
				4,
				6
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-8 The Dream of HER",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 8,
		story = "HUANMENGJIANZOUQU8",
		pre_event = {
			7
		},
		lock = {
			{
				4,
				7
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-9 A Fine Day",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 9,
		story = "HUANMENGJIANZOUQU9",
		pre_event = {
			8
		},
		lock = {
			{
				4,
				8
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-10 Another Fine Day",
		unlock_conditions = "Unlocked by reading the previous story chapter.",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 10,
		story = "HUANMENGJIANZOUQU10",
		pre_event = {
			9
		},
		lock = {
			{
				4,
				9
			}
		}
	},
	{
		story_type = 1,
		pre_event = "",
		name = "EPS-1 The Guardian Fox's Departure",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_531",
		story = "MAIZANGYUBIANZHIHUA1",
		change_bgm = "map-longgong",
		id = 11,
		lock = ""
	},
	{
		story_type = 1,
		name = "EPS-2 Trailing the Mountains",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "star_level_bg_532",
		id = 12,
		story = "MAIZANGYUBIANZHIHUA2",
		pre_event = {
			11
		},
		lock = {
			{
				4,
				11
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-3 The Prime Barrier",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "story-4",
		change_prefab = "",
		change_background = "bg_story_tiancheng6",
		id = 13,
		story = "MAIZANGYUBIANZHIHUA3",
		pre_event = {
			12
		},
		lock = {
			{
				4,
				12
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-4 Ink-Stained Dream",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "musashi-2",
		change_prefab = "",
		change_background = "star_level_bg_508",
		id = 14,
		story = "MAIZANGYUBIANZHIHUA4",
		pre_event = {
			13
		},
		lock = {
			{
				4,
				13
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-5 Misfortune Arriveth",
		unlock_conditions = "Clear EPS-4.",
		change_bgm = "nagato-boss",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 15,
		story = "MAIZANGYUBIANZHIHUA5",
		pre_event = {
			14
		},
		lock = {
			{
				4,
				14
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-6 Obsession Rooted in the Past",
		unlock_conditions = "Clear EPS-5.",
		change_bgm = "musashi-2",
		change_prefab = "",
		change_background = "star_level_bg_510",
		id = 16,
		story = "MAIZANGYUBIANZHIHUA6",
		pre_event = {
			15
		},
		lock = {
			{
				4,
				15
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-7 Planning Interference",
		unlock_conditions = "Clear EPS-6.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 17,
		story = "MAIZANGYUBIANZHIHUA7",
		pre_event = {
			16
		},
		lock = {
			{
				4,
				16
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-8 Decisive Weapon",
		unlock_conditions = "Clear EPS-7.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 18,
		story = "MAIZANGYUBIANZHIHUA8",
		pre_event = {
			17
		},
		lock = {
			{
				4,
				17
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-9 Retreat",
		unlock_conditions = "Clear EPS-8.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 19,
		story = "MAIZANGYUBIANZHIHUA9",
		pre_event = {
			17
		},
		lock = {
			{
				4,
				18
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-10 Scattering Thunder",
		unlock_conditions = "Clear EPS-9.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 20,
		story = "MAIZANGYUBIANZHIHUA10",
		pre_event = {
			19
		},
		lock = {
			{
				4,
				19
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-11 Entrusted Will",
		unlock_conditions = "Clear EPS-10.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 21,
		story = "MAIZANGYUBIANZHIHUA11",
		pre_event = {
			18
		},
		lock = {
			{
				4,
				20
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-12 Fallen Petals",
		unlock_conditions = "Clear EPS-11.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_2",
		id = 22,
		story = "MAIZANGYUBIANZHIHUA12",
		pre_event = {
			21,
			20
		},
		lock = {
			{
				4,
				21
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-13 Our Commander",
		unlock_conditions = "Clear EPS-12.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "Map_1840002",
		change_background = "bg_bianzhihua_2",
		id = 23,
		story = "MAIZANGYUBIANZHIHUA13",
		pre_event = {
			22
		},
		lock = {
			{
				4,
				22
			}
		}
	},
	[31] = {
		story_type = 1,
		pre_event = "",
		name = "EP1-1 A Deal With Observer",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_504",
		story = "HUANXINGCANGHONGZHIYAN1",
		change_bgm = "battle-eagleunion",
		id = 31,
		lock = ""
	},
	[32] = {
		story_type = 1,
		name = "EP1-2 Tester's Destruction",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 32,
		story = "HUANXINGCANGHONGZHIYAN2",
		pre_event = {
			31
		},
		lock = {
			{
				4,
				31
			}
		}
	},
	[33] = {
		story_type = 1,
		name = "EP1-3 Omitter's Destruction",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 33,
		story = "HUANXINGCANGHONGZHIYAN3",
		pre_event = {
			31
		},
		lock = {
			{
				4,
				32
			}
		}
	},
	[34] = {
		story_type = 1,
		name = "EP1-4 Purifier's Destruction",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "story-commander-up",
		change_prefab = "",
		change_background = "bg_story_task",
		id = 34,
		story = "HUANXINGCANGHONGZHIYAN4",
		pre_event = {
			31
		},
		lock = {
			{
				4,
				33
			}
		}
	},
	[35] = {
		story_type = 1,
		name = "EP2-1 To the Singularity",
		unlock_conditions = "Clear EP1-4.",
		change_bgm = "bsm-2",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 35,
		story = "HUANXINGCANGHONGZHIYAN5",
		pre_event = {
			32,
			33,
			34
		},
		lock = {
			{
				4,
				34
			}
		}
	},
	[36] = {
		story_type = 1,
		name = "EP2-2 Making of a World Segment",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 36,
		story = "HUANXINGCANGHONGZHIYAN6",
		pre_event = {
			35
		},
		lock = {
			{
				4,
				35
			}
		}
	},
	[37] = {
		story_type = 1,
		name = "EP2-3 Departure",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "story-finalbattle-unity",
		change_prefab = "",
		change_background = "star_level_bg_507",
		id = 37,
		story = "HUANXINGCANGHONGZHIYAN7",
		pre_event = {
			36
		},
		lock = {
			{
				4,
				36
			}
		}
	},
	[38] = {
		story_type = 1,
		name = "EP3-1 Europa's Fight",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "story-newsakura",
		change_prefab = "",
		change_background = "bg_port_chuanwu1",
		id = 38,
		story = "HUANXINGCANGHONGZHIYAN8",
		pre_event = {
			37
		},
		lock = {
			{
				4,
				37
			}
		}
	},
	[39] = {
		story_type = 1,
		name = "EP3-2 The Floating Dock Returns",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_1",
		id = 39,
		story = "HUANXINGCANGHONGZHIYAN9",
		pre_event = {
			38
		},
		lock = {
			{
				4,
				38
			}
		}
	},
	[40] = {
		story_type = 1,
		name = "EP4-1 Divergent METAmorphosis",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_1",
		id = 40,
		story = "HUANXINGCANGHONGZHIYAN10",
		pre_event = {
			37
		},
		lock = {
			{
				4,
				39
			}
		}
	},
	[41] = {
		story_type = 2,
		name = "EP4-2 A Meeting in the Mist",
		unlock_conditions = "Clear EP4-1.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_1",
		id = 41,
		story = "1856001",
		pre_event = {
			40
		},
		lock = {
			{
				4,
				40
			}
		}
	},
	[42] = {
		story_type = 1,
		name = "EP4-3 As Thanks",
		unlock_conditions = "Clear EP4-2.",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_3",
		id = 42,
		story = "HUANXINGCANGHONGZHIYAN12",
		pre_event = {
			41
		},
		lock = {
			{
				4,
				41
			}
		}
	},
	[43] = {
		story_type = 1,
		name = "EPS-1 The Way Cleared",
		unlock_conditions = "Clear EP4-3.",
		change_bgm = "story-darkplan",
		change_prefab = "",
		change_background = "star_level_bg_499",
		id = 43,
		story = "HUANXINGCANGHONGZHIYAN13",
		pre_event = {
			39,
			42
		},
		lock = {
			{
				4,
				42
			}
		}
	},
	[44] = {
		story_type = 1,
		name = "EPS-2 Amagi's Dream",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "story-tiancheng",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_2",
		id = 44,
		story = "HUANXINGCANGHONGZHIYAN14",
		pre_event = {
			43
		},
		lock = {
			{
				4,
				43
			}
		}
	},
	[45] = {
		story_type = 1,
		name = "EP5-1 Homecoming",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "story-tiancheng",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_2",
		id = 45,
		story = "HUANXINGCANGHONGZHIYAN15",
		pre_event = {
			44
		},
		lock = {
			{
				4,
				44
			}
		}
	},
	[46] = {
		story_type = 1,
		name = "EP5-2 Reunion",
		unlock_conditions = "Clear EP5-1.",
		change_bgm = "theme-amagi-cv",
		change_prefab = "",
		change_background = "star_level_bg_111",
		id = 46,
		story = "HUANXINGCANGHONGZHIYAN16",
		pre_event = {
			45
		},
		lock = {
			{
				4,
				45
			}
		}
	},
	[47] = {
		story_type = 1,
		name = "EP5-3 Face to Face",
		unlock_conditions = "Clear EP5-2.",
		change_bgm = "theme-amagi-cv",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_3",
		id = 47,
		story = "HUANXINGCANGHONGZHIYAN17",
		pre_event = {
			46
		},
		lock = {
			{
				4,
				46
			}
		}
	},
	[48] = {
		story_type = 2,
		name = "EP5-4 When Least Expected",
		unlock_conditions = "Clear EP5-3.",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_1",
		id = 48,
		story = "1856002",
		pre_event = {
			47
		},
		lock = {
			{
				4,
				47
			}
		}
	},
	[49] = {
		story_type = 1,
		name = "EP5-5 Fighting Back",
		unlock_conditions = "Clear EP6-3.",
		change_bgm = "theme-nagato-meta",
		change_prefab = "",
		change_background = "star_level_bg_192",
		id = 49,
		story = "HUANXINGCANGHONGZHIYAN19",
		pre_event = {
			48
		},
		lock = {
			{
				4,
				53
			}
		}
	},
	[50] = {
		story_type = 1,
		name = "EP5-6 Turning the Tables",
		unlock_conditions = "Clear EP5-5.",
		change_bgm = "theme-nagato-meta",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_4",
		id = 50,
		story = "HUANXINGCANGHONGZHIYAN20",
		pre_event = {
			49
		},
		lock = {
			{
				4,
				49
			}
		}
	},
	[51] = {
		story_type = 1,
		name = "EP6-1 Scanning the Singularity",
		unlock_conditions = "Clear EP5-4.",
		change_bgm = "theme-amagi-cv",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_1",
		id = 51,
		story = "HUANXINGCANGHONGZHIYAN21",
		pre_event = {
			44
		},
		lock = {
			{
				4,
				48
			}
		}
	},
	[52] = {
		story_type = 2,
		name = "EP6-2 Obsession's True Form",
		unlock_conditions = "Clear EP6-1.",
		change_bgm = "theme-amagi-cv",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_1",
		id = 52,
		story = "1856003",
		pre_event = {
			51
		},
		lock = {
			{
				4,
				51
			}
		}
	},
	[53] = {
		story_type = 1,
		name = "EP6-3 Purification",
		unlock_conditions = "Clear EP6-2.",
		change_bgm = "theme-akagi-meta",
		change_prefab = "",
		change_background = "star_level_bg_191",
		id = 53,
		story = "HUANXINGCANGHONGZHIYAN23",
		pre_event = {
			52
		},
		lock = {
			{
				4,
				52
			}
		}
	},
	[54] = {
		story_type = 1,
		name = "EPS-3 Heart and Feelings",
		unlock_conditions = "Clear EP5-6.",
		change_bgm = "battle-unknown-approaching",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 54,
		story = "HUANXINGCANGHONGZHIYAN24",
		pre_event = {
			50,
			53
		},
		lock = {
			{
				4,
				50
			}
		}
	},
	[55] = {
		story_type = 1,
		name = "EP7-1 Fragmented",
		unlock_conditions = "Clear EP8-1.",
		change_bgm = "story-amagi-up",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_4",
		id = 55,
		story = "HUANXINGCANGHONGZHIYAN25",
		pre_event = {
			54
		},
		lock = {
			{
				4,
				59
			}
		}
	},
	[56] = {
		story_type = 2,
		name = "EP7-2 Seething Heart",
		unlock_conditions = "Clear EP7-1.",
		change_bgm = "theme-akagi-meta",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_4",
		id = 56,
		story = "1856004",
		pre_event = {
			55
		},
		lock = {
			{
				4,
				55
			}
		}
	},
	[57] = {
		story_type = 1,
		name = "EP7-3 Melting",
		unlock_conditions = "Clear EP7-2.",
		change_bgm = "story-flowerdust-soft",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 57,
		story = "HUANXINGCANGHONGZHIYAN27",
		pre_event = {
			56
		},
		lock = {
			{
				4,
				56
			}
		}
	},
	[58] = {
		story_type = 1,
		name = "EP7-4 Reunion",
		unlock_conditions = "Clear EP8-2.",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 58,
		story = "HUANXINGCANGHONGZHIYAN28",
		pre_event = {
			57
		},
		lock = {
			{
				4,
				60
			}
		}
	},
	[59] = {
		story_type = 1,
		name = "EP8-1 Suppressing Naraka",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "theme-amagi-cv",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_4",
		id = 59,
		story = "HUANXINGCANGHONGZHIYAN29",
		pre_event = {
			54
		},
		lock = {
			{
				4,
				54
			}
		}
	},
	[60] = {
		story_type = 1,
		name = "EP8-2 Core Sector Operation",
		unlock_conditions = "Clear EP7-3.",
		change_bgm = "battle-donghuang-static",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_6",
		id = 60,
		story = "HUANXINGCANGHONGZHIYAN30",
		pre_event = {
			59
		},
		lock = {
			{
				4,
				57
			}
		}
	},
	[61] = {
		story_type = 1,
		name = "EP8-3 Moment of Truth",
		unlock_conditions = "Clear EP7-4.",
		change_bgm = "story-newsakura",
		change_prefab = "",
		change_background = "bg_canghongzhiyan_6",
		id = 61,
		story = "HUANXINGCANGHONGZHIYAN31",
		pre_event = {
			60
		},
		lock = {
			{
				4,
				58
			}
		}
	},
	[62] = {
		story_type = 1,
		name = "EP9-1 The Long Road Home",
		unlock_conditions = "Clear EP8-3.",
		change_bgm = "story-startravel",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 62,
		story = "HUANXINGCANGHONGZHIYAN32",
		pre_event = {
			58,
			61
		},
		lock = {
			{
				4,
				61
			}
		}
	},
	[63] = {
		story_type = 1,
		name = "EX-1 Contingency Plan F",
		unlock_conditions = "Clear EP9-1.",
		change_bgm = "story-darkplan",
		change_prefab = "",
		change_background = "star_level_bg_503",
		id = 63,
		story = "HUANXINGCANGHONGZHIYAN33",
		pre_event = {
			62
		},
		lock = {
			{
				4,
				62
			}
		}
	},
	[64] = {
		story_type = 1,
		name = "EX-2 Error",
		unlock_conditions = "Clear EX-1.",
		change_bgm = "theme-thetowerXVI",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 64,
		story = "HUANXINGCANGHONGZHIYAN34",
		pre_event = {
			63
		},
		lock = {
			{
				4,
				63
			}
		}
	},
	[65] = {
		story_type = 1,
		name = "EX-3 Thus Spake The Tower",
		unlock_conditions = "Clear EX-2.",
		change_bgm = "bsm-2",
		change_prefab = "",
		change_background = "bg_story_tower",
		id = 65,
		story = "HUANXINGCANGHONGZHIYAN35",
		pre_event = {
			64
		},
		lock = {
			{
				4,
				64
			}
		}
	},
	[66] = {
		story_type = 1,
		name = "EX-4 I, Observer",
		unlock_conditions = "Clear EX-3.",
		change_bgm = "theme-themagicianI",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 66,
		story = "HUANXINGCANGHONGZHIYAN36",
		pre_event = {
			65
		},
		lock = {
			{
				4,
				65
			}
		}
	},
	[67] = {
		story_type = 1,
		name = "EX-5 Illusory World",
		unlock_conditions = "Clear EX-4.",
		change_bgm = "theme-akagi-meta",
		change_prefab = "Map_1850004",
		change_background = "bg_canghongzhiyan_6",
		id = 67,
		story = "HUANXINGCANGHONGZHIYAN37",
		pre_event = {
			66
		},
		lock = {
			{
				4,
				66
			}
		}
	},
	[68] = {
		story_type = 1,
		pre_event = "",
		name = "EP1-1 Guided by the Compass",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "bg_jufengv1_2",
		story = "JUFENGYUCHENMIANZHIHAI1",
		change_bgm = "theme-tempest-up",
		id = 68,
		lock = ""
	},
	[69] = {
		story_type = 1,
		name = "EP1-2 Pirate Reunion",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "theme-tempest-up",
		change_prefab = "",
		change_background = "bg_jufengv1_2",
		id = 69,
		story = "JUFENGYUCHENMIANZHIHAI2",
		pre_event = {
			68
		},
		lock = {
			{
				4,
				68
			}
		}
	},
	[70] = {
		story_type = 1,
		name = "EP1-3 The Gang's All Here",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "theme-tempest",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 70,
		story = "JUFENGYUCHENMIANZHIHAI3",
		pre_event = {
			69
		},
		lock = {
			{
				4,
				69
			}
		}
	},
	[71] = {
		story_type = 2,
		name = "EP1-4 The Treasure Hunters",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "story-temepest-2",
		change_prefab = "",
		change_background = "star_level_bg_162",
		id = 71,
		story = "1868001",
		pre_event = {
			70
		},
		lock = {
			{
				4,
				70
			}
		}
	},
	[72] = {
		story_type = 1,
		name = "EP2-1 Rebirth and Eternal Life",
		unlock_conditions = "Clear EP1-4.",
		change_bgm = "story-temepest-2",
		change_prefab = "",
		change_background = "bg_jufengv2_cg1",
		id = 72,
		story = "JUFENGYUCHENMIANZHIHAI5",
		pre_event = {
			71
		},
		lock = {
			{
				4,
				71
			}
		}
	},
	[73] = {
		story_type = 2,
		name = "EP2-2 The Treasure Ship Cruises By",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "theme-tempest-up",
		change_prefab = "",
		change_background = "bg_jufengv1_2",
		id = 73,
		story = "1868002",
		pre_event = {
			72
		},
		lock = {
			{
				4,
				72
			}
		}
	},
	[74] = {
		story_type = 1,
		name = "EP2-3 A New Face",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "theme-SeaAndSun-soft",
		change_prefab = "",
		change_background = "bg_jufengv2_cg4",
		id = 74,
		story = "JUFENGYUCHENMIANZHIHAI7",
		pre_event = {
			73
		},
		lock = {
			{
				4,
				73
			}
		}
	},
	[75] = {
		story_type = 1,
		name = "EP2-4 Crawling Around",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "theme-tempest",
		change_prefab = "",
		change_background = "bg_jufengv1_1",
		id = 75,
		story = "JUFENGYUCHENMIANZHIHAI8",
		pre_event = {
			74
		},
		lock = {
			{
				4,
				74
			}
		}
	},
	[76] = {
		story_type = 1,
		name = "EP3-1 Promising Lead",
		unlock_conditions = "Clear EP2-4.",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "",
		change_background = "bg_jufengv2_1",
		id = 76,
		story = "JUFENGYUCHENMIANZHIHAI9",
		pre_event = {
			75
		},
		lock = {
			{
				4,
				75
			}
		}
	},
	[77] = {
		story_type = 1,
		name = "EP3-2 The Sleeping Sea",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "",
		change_background = "bg_jufengv2_1",
		id = 77,
		story = "JUFENGYUCHENMIANZHIHAI10",
		pre_event = {
			76
		},
		lock = {
			{
				4,
				76
			}
		}
	},
	[78] = {
		story_type = 2,
		name = "EP3-3 The Priest of Wind and Rain",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "",
		change_background = "bg_jufengv2_1",
		id = 78,
		story = "1868003",
		pre_event = {
			77
		},
		lock = {
			{
				4,
				77
			}
		}
	},
	[79] = {
		story_type = 1,
		name = "EP3-4 The Storm and the Temple",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "story-temepest-2",
		change_prefab = "",
		change_background = "star_level_bg_525",
		id = 79,
		story = "JUFENGYUCHENMIANZHIHAI12",
		pre_event = {
			78
		},
		lock = {
			{
				4,
				78
			}
		}
	},
	[80] = {
		story_type = 1,
		name = "EP4-1 The Abyssal Being",
		unlock_conditions = "Clear EP3-4.",
		change_bgm = "story-temepest-2",
		change_prefab = "",
		change_background = "bg_jufengv2_cg6",
		id = 80,
		story = "JUFENGYUCHENMIANZHIHAI13",
		pre_event = {
			79
		},
		lock = {
			{
				4,
				79
			}
		}
	},
	[81] = {
		story_type = 2,
		name = "EP4-2 Silent Souls",
		unlock_conditions = "Clear EP4-1.",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "",
		change_background = "bg_jufengv2_2",
		id = 81,
		story = "1868004",
		pre_event = {
			80
		},
		lock = {
			{
				4,
				80
			}
		}
	},
	[82] = {
		story_type = 1,
		name = "EP4-3 Central Unit of the Goddess",
		unlock_conditions = "Clear EP4-2.",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "",
		change_background = "bg_jufengv2_2",
		id = 82,
		story = "JUFENGYUCHENMIANZHIHAI15",
		pre_event = {
			81
		},
		lock = {
			{
				4,
				81
			}
		}
	},
	[83] = {
		story_type = 1,
		name = "EP4-4 The Choice is Tempesta's",
		unlock_conditions = "Clear EP4-3.",
		change_bgm = "theme-ganjisawai",
		change_prefab = "",
		change_background = "star_level_bg_524",
		id = 83,
		story = "JUFENGYUCHENMIANZHIHAI16",
		pre_event = {
			82
		},
		lock = {
			{
				4,
				82
			}
		}
	},
	[84] = {
		story_type = 1,
		name = "EP5-1 The Storm Approaches",
		unlock_conditions = "Clear EP4-4.",
		change_bgm = "theme-ganjisawai",
		change_prefab = "",
		change_background = "bg_jufengv2_cg7",
		id = 84,
		story = "JUFENGYUCHENMIANZHIHAI17",
		pre_event = {
			83
		},
		lock = {
			{
				4,
				83
			}
		}
	},
	[85] = {
		story_type = 1,
		name = "EP5-2 Echoes of the Wind and Rain",
		unlock_conditions = "Clear EP5-1.",
		change_bgm = "theme-SeaAndSun-soft",
		change_prefab = "",
		change_background = "bg_underwater",
		id = 85,
		story = "JUFENGYUCHENMIANZHIHAI18",
		pre_event = {
			84
		},
		lock = {
			{
				4,
				84
			}
		}
	},
	[86] = {
		story_type = 1,
		name = "EP5-3 Back in My Hand",
		unlock_conditions = "Clear EP5-2.",
		change_bgm = "story-temepest-1",
		change_prefab = "",
		change_background = "star_level_bg_539",
		id = 86,
		story = "JUFENGYUCHENMIANZHIHAI19",
		pre_event = {
			85
		},
		lock = {
			{
				4,
				85
			}
		}
	},
	[87] = {
		story_type = 1,
		name = "EX-1 The Tale of the Sleeping Sea",
		unlock_conditions = "Clear EP5-3.",
		change_bgm = "theme-tempest-up",
		change_prefab = "",
		change_background = "star_level_bg_162",
		id = 87,
		story = "JUFENGYUCHENMIANZHIHAI20",
		pre_event = {
			86
		},
		lock = {
			{
				4,
				86
			}
		}
	},
	[88] = {
		story_type = 1,
		name = "EX-2 Tempesta's Messenger",
		unlock_conditions = "Clear EX-1.",
		change_bgm = "theme-ganjisawai",
		change_prefab = "",
		change_background = "star_level_bg_524",
		id = 88,
		story = "JUFENGYUCHENMIANZHIHAI21",
		pre_event = {
			87
		},
		lock = {
			{
				4,
				87
			}
		}
	},
	[89] = {
		story_type = 1,
		name = "EX-3 A Priest and The Servant",
		unlock_conditions = "Clear EX-2.",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "Map_1860001",
		change_background = "bg_jufengv2_1",
		id = 89,
		story = "JUFENGYUCHENMIANZHIHAI22",
		pre_event = {
			88
		},
		lock = {
			{
				4,
				88
			}
		}
	},
	[90] = {
		story_type = 1,
		pre_event = "",
		name = "EPS-1 The Journey Begins",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "bg_tolove_1",
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA1",
		change_bgm = "story-richang-refreshing",
		id = 90,
		lock = ""
	},
	[91] = {
		story_type = 1,
		name = "EP1-1 Questy MacGuffin",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "bg_tolove_1",
		id = 91,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA2",
		pre_event = {
			90
		},
		lock = {
			{
				4,
				90
			}
		}
	},
	[92] = {
		story_type = 1,
		name = "EP1-2 A Rigging Test Drive",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "bg_tolove_1",
		id = 92,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA3",
		pre_event = {
			91
		},
		lock = {
			{
				4,
				91
			}
		}
	},
	[93] = {
		story_type = 2,
		name = "EP1-3 The Royal Navy Strikes",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "bg_tolove_1",
		id = 93,
		story = "1878001",
		pre_event = {
			92
		},
		lock = {
			{
				4,
				92
			}
		}
	},
	[94] = {
		story_type = 1,
		name = "EP1-4 A Queen's Invitation",
		unlock_conditions = "Clear EP1-4.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "bg_tolove_1",
		id = 94,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA5",
		pre_event = {
			93
		},
		lock = {
			{
				4,
				93
			}
		}
	},
	[95] = {
		story_type = 1,
		name = "EP2-1 They Return",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "bg_tolove_1",
		id = 95,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA6",
		pre_event = {
			94
		},
		lock = {
			{
				4,
				94
			}
		}
	},
	[96] = {
		story_type = 2,
		name = "EP2-2 The Doppelganger's Challenge",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "bg_tolove_1",
		id = 96,
		story = "1878002",
		pre_event = {
			95
		},
		lock = {
			{
				4,
				95
			}
		}
	},
	[97] = {
		story_type = 1,
		name = "EP2-3 Tea Time",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "bg_tolove_1",
		id = 97,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA8",
		pre_event = {
			96
		},
		lock = {
			{
				4,
				96
			}
		}
	},
	[98] = {
		story_type = 1,
		name = "EPS-2 The Next Step",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "story-richang-refreshing",
		change_prefab = "",
		change_background = "star_level_bg_115",
		id = 98,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA9",
		pre_event = {
			97
		},
		lock = {
			{
				4,
				97
			}
		}
	},
	[99] = {
		story_type = 1,
		name = "EP3-1 First Checkpoint",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_2",
		id = 99,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA10",
		pre_event = {
			98
		},
		lock = {
			{
				4,
				98
			}
		}
	},
	[100] = {
		story_type = 1,
		name = "EP3-2 Second Checkpoint",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_2",
		id = 100,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA11",
		pre_event = {
			98
		},
		lock = {
			{
				4,
				99
			}
		}
	},
	[101] = {
		story_type = 1,
		name = "EP3-3 Third Checkpoint",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_2",
		id = 101,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA12",
		pre_event = {
			98
		},
		lock = {
			{
				4,
				100
			}
		}
	},
	[102] = {
		story_type = 2,
		name = "EP3-4 Balance Update",
		unlock_conditions = "Clear EP3-4.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_2",
		id = 102,
		story = "1878003",
		pre_event = {
			99,
			100,
			101
		},
		lock = {
			{
				4,
				101
			}
		}
	},
	[103] = {
		story_type = 1,
		name = "EP4-1 Back at Sea",
		unlock_conditions = "Clear EP4-1.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_2",
		id = 103,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA14",
		pre_event = {
			102
		},
		lock = {
			{
				4,
				102
			}
		}
	},
	[104] = {
		story_type = 2,
		name = "EP4-2 Turning the Tables",
		unlock_conditions = "Clear EP4-2.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_2",
		id = 104,
		story = "1878004",
		pre_event = {
			103
		},
		lock = {
			{
				4,
				103
			}
		}
	},
	[105] = {
		story_type = 2,
		name = "EP5-1 The Final Challenge",
		unlock_conditions = "Clear EP5-1.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_2",
		id = 105,
		story = "1878005",
		pre_event = {
			104
		},
		lock = {
			{
				4,
				104
			}
		}
	},
	[106] = {
		story_type = 1,
		name = "EPS-3 The Epilogue's Only Just Begun",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "main",
		change_prefab = "",
		change_background = "bg_tolove_3",
		id = 106,
		story = "WEIXIANFAMINGPOJINZHONGGUANQIA17",
		pre_event = {
			105
		},
		lock = {
			{
				4,
				105
			}
		}
	},
	[107] = {
		story_type = 1,
		pre_event = "",
		name = "EP1-1 Fated Meeting",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_597",
		story = "XINGGUANGXIADEYUHUI1",
		change_bgm = "story-ironblood-light",
		id = 107,
		lock = ""
	},
	[108] = {
		story_type = 1,
		name = "EP1-2 Building Rapport",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "battle-ironblood-defence",
		change_prefab = "",
		change_background = "bg_yuhui_cg_1",
		id = 108,
		story = "XINGGUANGXIADEYUHUI2",
		pre_event = {
			107
		},
		lock = {
			{
				4,
				107
			}
		}
	},
	[109] = {
		story_type = 1,
		name = "EP1-3 The Resistance",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "story-richang-partynight",
		change_prefab = "",
		change_background = "bg_yuhui_cg_2",
		id = 109,
		story = "XINGGUANGXIADEYUHUI3",
		pre_event = {
			108
		},
		lock = {
			{
				4,
				108
			}
		}
	},
	[110] = {
		story_type = 1,
		name = "EP1-4 The Base at Sunset",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "story-ironblood-light",
		change_prefab = "",
		change_background = "star_level_bg_597",
		id = 110,
		story = "XINGGUANGXIADEYUHUI4",
		pre_event = {
			109
		},
		lock = {
			{
				4,
				109
			}
		}
	},
	[111] = {
		story_type = 2,
		name = "EP1-5 That Sinking Feeling",
		unlock_conditions = "Clear EP1-4.",
		change_bgm = "story-startravel",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 111,
		story = "1886001",
		pre_event = {
			110
		},
		lock = {
			{
				4,
				110
			}
		}
	},
	[112] = {
		story_type = 1,
		name = "EPS1-1 A Distant Bout",
		unlock_conditions = "Clear EP1-5.",
		change_bgm = "theme-amagi-cv",
		change_prefab = "",
		change_background = "star_level_bg_111",
		id = 112,
		story = "XINGGUANGXIADEYUHUI6",
		pre_event = {
			111
		},
		lock = {
			{
				4,
				111
			}
		}
	},
	[113] = {
		story_type = 1,
		name = "EPS1-2 In the Sakura Pavilion",
		unlock_conditions = "Clear EPS1-1.",
		change_bgm = "theme-themagicianI",
		change_prefab = "",
		change_background = "star_level_bg_147",
		id = 113,
		story = "XINGGUANGXIADEYUHUI7",
		pre_event = {
			111
		},
		lock = {
			{
				4,
				112
			}
		}
	},
	[114] = {
		story_type = 1,
		name = "EPS1-3 An Old Friend",
		unlock_conditions = "Clear EPS1-2.",
		change_bgm = "story-ironblood-light",
		change_prefab = "",
		change_background = "star_level_bg_300",
		id = 114,
		story = "XINGGUANGXIADEYUHUI8",
		pre_event = {
			111
		},
		lock = {
			{
				4,
				113
			}
		}
	},
	[115] = {
		story_type = 1,
		name = "EP2-1 A Second Chance",
		unlock_conditions = "Clear EPS1-3.",
		change_bgm = "story-ironblood-light",
		change_prefab = "",
		change_background = "bg_yuhui_1",
		id = 115,
		story = "XINGGUANGXIADEYUHUI9",
		pre_event = {
			112,
			113,
			114
		},
		lock = {
			{
				4,
				114
			}
		}
	},
	[116] = {
		story_type = 1,
		name = "EP2-2 Restoring the Eternal Stars",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "story-ironblood-strong",
		change_prefab = "",
		change_background = "bg_story_chuansong",
		id = 116,
		story = "XINGGUANGXIADEYUHUI10",
		pre_event = {
			115
		},
		lock = {
			{
				4,
				115
			}
		}
	},
	[117] = {
		story_type = 1,
		name = "EP2-3 Crystallized Power",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "story-ironblood-strong",
		change_prefab = "",
		change_background = "star_level_bg_596",
		id = 117,
		story = "XINGGUANGXIADEYUHUI11",
		pre_event = {
			116
		},
		lock = {
			{
				4,
				116
			}
		}
	},
	[118] = {
		story_type = 2,
		name = "EP2-4 Sacrificial Hunt",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "story-startravel",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 118,
		story = "1886002",
		pre_event = {
			117
		},
		lock = {
			{
				4,
				117
			}
		}
	},
	[119] = {
		story_type = 1,
		name = "EPS2-1 Indirect Positioning",
		unlock_conditions = "Clear EP2-4.",
		change_bgm = "theme-unzen",
		change_prefab = "",
		change_background = "star_level_bg_111",
		id = 119,
		story = "XINGGUANGXIADEYUHUI13",
		pre_event = {
			118
		},
		lock = {
			{
				4,
				118
			}
		}
	},
	[120] = {
		story_type = 1,
		name = "EPS2-2 About the Commander",
		unlock_conditions = "Clear EPS2-1.",
		change_bgm = "theme-themagicianI",
		change_prefab = "",
		change_background = "star_level_bg_147",
		id = 120,
		story = "XINGGUANGXIADEYUHUI14",
		pre_event = {
			118
		},
		lock = {
			{
				4,
				119
			}
		}
	},
	[121] = {
		story_type = 1,
		name = "EPS2-3 Deliberation and Discussion",
		unlock_conditions = "Clear EPS2-2.",
		change_bgm = "story-ironblood-strong",
		change_prefab = "",
		change_background = "bg_story_chuansong",
		id = 121,
		story = "XINGGUANGXIADEYUHUI15",
		pre_event = {
			118
		},
		lock = {
			{
				4,
				120
			}
		}
	},
	[122] = {
		story_type = 1,
		name = "EP3-1 Preparations",
		unlock_conditions = "Clear EPS2-3.",
		change_bgm = "story-ironblood-strong",
		change_prefab = "",
		change_background = "bg_yuhui_3",
		id = 122,
		story = "XINGGUANGXIADEYUHUI16",
		pre_event = {
			119,
			120,
			121
		},
		lock = {
			{
				4,
				121
			}
		}
	},
	[123] = {
		story_type = 1,
		name = "EP3-2 To the Headquarters' Defense",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "theme-starbeast",
		change_prefab = "",
		change_background = "bg_yuhui_cg_4",
		id = 123,
		story = "XINGGUANGXIADEYUHUI17",
		pre_event = {
			122
		},
		lock = {
			{
				4,
				122
			}
		}
	},
	[124] = {
		story_type = 2,
		name = "EP3-3 Ruler of the Stars",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "battle-xinnong-image",
		change_prefab = "",
		change_background = "star_level_bg_111",
		id = 124,
		story = "1886003",
		pre_event = {
			123
		},
		lock = {
			{
				4,
				123
			}
		}
	},
	[125] = {
		story_type = 1,
		name = "EPS3-1 Within the Magic Circle",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "theme-themagicianI",
		change_prefab = "",
		change_background = "star_level_bg_147",
		id = 125,
		story = "XINGGUANGXIADEYUHUI19",
		pre_event = {
			124
		},
		lock = {
			{
				4,
				124
			}
		}
	},
	[126] = {
		story_type = 1,
		name = "EPS3-2 The Limits of Possibility",
		unlock_conditions = "Clear EPS3-1.",
		change_bgm = "story-ironblood-strong",
		change_prefab = "",
		change_background = "bg_yuhui_3",
		id = 126,
		story = "XINGGUANGXIADEYUHUI20",
		pre_event = {
			124
		},
		lock = {
			{
				4,
				125
			}
		}
	},
	[127] = {
		story_type = 1,
		name = "EP4-1 Prepare for the Showdown",
		unlock_conditions = "Clear EPS3-2.",
		change_bgm = "battle-ironblood-defence",
		change_prefab = "",
		change_background = "bg_yuhui_cg_6",
		id = 127,
		story = "XINGGUANGXIADEYUHUI21",
		pre_event = {
			125,
			126
		},
		lock = {
			{
				4,
				126
			}
		}
	},
	[128] = {
		story_type = 2,
		name = "EP4-2 Vanish in the Mist",
		unlock_conditions = "Clear EP4-1.",
		change_bgm = "story-ironblood-strong",
		change_prefab = "",
		change_background = "bg_yuhui_4",
		id = 128,
		story = "1886004",
		pre_event = {
			127
		},
		lock = {
			{
				4,
				127
			}
		}
	},
	[129] = {
		story_type = 1,
		name = "EPS4-1 Recollection",
		unlock_conditions = "Clear EP4-2.",
		change_bgm = "theme-akagi-meta",
		change_prefab = "",
		change_background = "star_level_bg_147",
		id = 129,
		story = "XINGGUANGXIADEYUHUI23",
		pre_event = {
			128
		},
		lock = {
			{
				4,
				128
			}
		}
	},
	[130] = {
		story_type = 1,
		name = "EPS4-2 United as One",
		unlock_conditions = "Clear EPS4-1.",
		change_bgm = "battle-ironblood-defence",
		change_prefab = "",
		change_background = "bg_yuhui_3",
		id = 130,
		story = "XINGGUANGXIADEYUHUI24",
		pre_event = {
			128
		},
		lock = {
			{
				4,
				129
			}
		}
	},
	[131] = {
		story_type = 1,
		name = "EP5-1 Another Plan",
		unlock_conditions = "Clear EPS4-2.",
		change_bgm = "story-ironblood-light",
		change_prefab = "",
		change_background = "star_level_bg_499",
		id = 131,
		story = "XINGGUANGXIADEYUHUI25",
		pre_event = {
			129,
			130
		},
		lock = {
			{
				4,
				130
			}
		}
	},
	[132] = {
		story_type = 1,
		name = "EP5-2 Emotion Given Form",
		unlock_conditions = "Clear EP5-1.",
		change_bgm = "story-ironblood-light",
		change_prefab = "",
		change_background = "bg_yuhui_cg_7",
		id = 132,
		story = "XINGGUANGXIADEYUHUI26",
		pre_event = {
			131
		},
		lock = {
			{
				4,
				131
			}
		}
	},
	[133] = {
		story_type = 2,
		name = "EP5-3 Side by Side",
		unlock_conditions = "Clear EP5-2.",
		change_bgm = "theme-themagicianI",
		change_prefab = "",
		change_background = "bg_yuhui_cg_11",
		id = 133,
		story = "1886005",
		pre_event = {
			132
		},
		lock = {
			{
				4,
				132
			}
		}
	},
	[134] = {
		story_type = 1,
		name = "EP5-4 The Magician's Divination",
		unlock_conditions = "Clear EP5-3.",
		change_bgm = "story-mirrorheart-mystic",
		change_prefab = "",
		change_background = "star_level_bg_589",
		id = 134,
		story = "XINGGUANGXIADEYUHUI28",
		pre_event = {
			133
		},
		lock = {
			{
				4,
				133
			}
		}
	},
	[135] = {
		story_type = 1,
		name = "EP5-5 Epilogue",
		unlock_conditions = "Clear EP5-4.",
		change_bgm = "story-startravel",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 135,
		story = "XINGGUANGXIADEYUHUI29",
		pre_event = {
			134
		},
		lock = {
			{
				4,
				134
			}
		}
	},
	[136] = {
		story_type = 1,
		name = "EX-1 The Tip of the Iceberg",
		unlock_conditions = "Clear EP5-5.",
		change_bgm = "story-newsakura",
		change_prefab = "",
		change_background = "bg_guild_blue_n",
		id = 136,
		story = "XINGGUANGXIADEYUHUI30",
		pre_event = {
			135
		},
		lock = {
			{
				4,
				135
			}
		}
	},
	[137] = {
		story_type = 1,
		name = "EX-2 Onwards to the Future",
		unlock_conditions = "Clear EX-1.",
		change_bgm = "theme-richard",
		change_prefab = "",
		change_background = "star_level_bg_589",
		id = 137,
		story = "XINGGUANGXIADEYUHUI31",
		pre_event = {
			136
		},
		lock = {
			{
				4,
				136
			}
		}
	},
	[138] = {
		story_type = 1,
		name = "EX-3 Her New Toy",
		unlock_conditions = "Clear EX-2.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "bg_underheaven_0",
		id = 138,
		story = "XINGGUANGXIADEYUHUI32",
		pre_event = {
			137
		},
		lock = {
			{
				4,
				137
			}
		}
	},
	[139] = {
		story_type = 1,
		name = "EX-4 The Chosen Few",
		unlock_conditions = "Clear EX-3.",
		change_bgm = "story-ironblood-light",
		change_prefab = "",
		change_background = "bg_yuhui_2",
		id = 139,
		story = "XINGGUANGXIADEYUHUI33",
		pre_event = {
			138
		},
		lock = {
			{
				4,
				138
			}
		}
	},
	[141] = {
		story_type = 1,
		pre_event = "",
		name = "EP1-1 Disaster Averted",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_501",
		story = "FANLONGNEIDESHENGUANG1",
		change_bgm = "story-theme-sardinia",
		id = 141,
		lock = ""
	},
	[142] = {
		story_type = 1,
		name = "EP1-2 The Sardegnia League",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "story-theme-sardinia",
		change_prefab = "",
		change_background = "star_level_bg_530",
		id = 142,
		story = "FANLONGNEIDESHENGUANG2",
		pre_event = {
			141
		},
		lock = {
			{
				4,
				141
			}
		}
	},
	[143] = {
		story_type = 1,
		name = "EP1-3 Belief or Conceptualization?",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "battle-shenguang-holy",
		change_prefab = "",
		change_background = "star_level_bg_539",
		id = 143,
		story = "FANLONGNEIDESHENGUANG3",
		pre_event = {
			142
		},
		lock = {
			{
				4,
				142
			}
		}
	},
	[144] = {
		story_type = 1,
		name = "EP1-4 Gate of the Chosen One",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "story-theme-sardinia",
		change_prefab = "",
		change_background = "star_level_bg_305",
		id = 144,
		story = "FANLONGNEIDESHENGUANG4",
		pre_event = {
			143
		},
		lock = {
			{
				4,
				143
			}
		}
	},
	[145] = {
		story_type = 1,
		name = "EPS1-1 First Step Into Night",
		unlock_conditions = "Clear EP1-4.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_505",
		id = 145,
		story = "FANLONGNEIDESHENGUANG5",
		pre_event = {
			144
		},
		lock = {
			{
				4,
				144
			}
		}
	},
	[146] = {
		story_type = 1,
		name = "EPS1-2 Gate II",
		unlock_conditions = "Clear EPS1-1.",
		change_bgm = "story-theme-sardinia",
		change_prefab = "",
		change_background = "star_level_bg_546",
		id = 146,
		story = "FANLONGNEIDESHENGUANG6",
		pre_event = {
			144
		},
		lock = {
			{
				4,
				145
			}
		}
	},
	[147] = {
		story_type = 1,
		name = "EP2-1 Marco Polo's Dream",
		unlock_conditions = "Clear EPS1-2.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_505",
		id = 147,
		story = "FANLONGNEIDESHENGUANG7",
		pre_event = {
			145,
			146
		},
		lock = {
			{
				4,
				146
			}
		}
	},
	[148] = {
		story_type = 1,
		name = "EPS2-1 Gate III",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "story-theme-sardinia",
		change_prefab = "",
		change_background = "bg_shenguang_cg_1",
		id = 148,
		story = "FANLONGNEIDESHENGUANG8",
		pre_event = {
			147
		},
		lock = {
			{
				4,
				147
			}
		}
	},
	[149] = {
		story_type = 1,
		name = "EP2-2 The Apostle's Afternoon",
		unlock_conditions = "Clear EPS2-1.",
		change_bgm = "battle-shenguang-holy",
		change_prefab = "",
		change_background = "bg_story_task",
		id = 149,
		story = "FANLONGNEIDESHENGUANG9",
		pre_event = {
			147
		},
		lock = {
			{
				4,
				148
			}
		}
	},
	[150] = {
		story_type = 1,
		name = "EP2-3 Destroyer of Darkness",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "story-shenguang-holy",
		change_prefab = "",
		change_background = "star_level_bg_506",
		id = 150,
		story = "FANLONGNEIDESHENGUANG10",
		pre_event = {
			148,
			149
		},
		lock = {
			{
				4,
				149
			}
		}
	},
	[151] = {
		story_type = 1,
		name = "EPS2-2 Second Step Into Night",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_505",
		id = 151,
		story = "FANLONGNEIDESHENGUANG11",
		pre_event = {
			150
		},
		lock = {
			{
				4,
				150
			}
		}
	},
	[152] = {
		story_type = 1,
		name = "EPS2-3 Gate IV",
		unlock_conditions = "Clear EPS2-2.",
		change_bgm = "battle-shenguang-freely",
		change_prefab = "",
		change_background = "bg_shenguang_cg_4",
		id = 152,
		story = "FANLONGNEIDESHENGUANG12",
		pre_event = {
			150
		},
		lock = {
			{
				4,
				151
			}
		}
	},
	[153] = {
		story_type = 1,
		name = "EP2-4 Declaration of War",
		unlock_conditions = "Clear EPS2-3.",
		change_bgm = "battle-shenguang-freely",
		change_prefab = "",
		change_background = "bg_shenguang_3",
		id = 153,
		story = "FANLONGNEIDESHENGUANG13",
		pre_event = {
			150
		},
		lock = {
			{
				4,
				152
			}
		}
	},
	[154] = {
		story_type = 2,
		name = "EP3-1 Ambush on the Arno River",
		unlock_conditions = "Clear EP2-4.",
		change_bgm = "story-shenguang-holy",
		change_prefab = "",
		change_background = "bg_shenguang_1",
		id = 154,
		story = "1896001",
		pre_event = {
			151,
			152,
			153
		},
		lock = {
			{
				4,
				153
			}
		}
	},
	[155] = {
		story_type = 1,
		name = "EPS3-1 Third Step Into Night",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "battle-shenguang-holy",
		change_prefab = "",
		change_background = "star_level_bg_500",
		id = 155,
		story = "FANLONGNEIDESHENGUANG15",
		pre_event = {
			154
		},
		lock = {
			{
				4,
				154
			}
		}
	},
	[156] = {
		story_type = 1,
		name = "EP3-2 Rite of the Final Judgment",
		unlock_conditions = "Clear EPS3-1.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_505",
		id = 156,
		story = "FANLONGNEIDESHENGUANG16",
		pre_event = {
			154
		},
		lock = {
			{
				4,
				155
			}
		}
	},
	[157] = {
		story_type = 1,
		name = "EPS3-2 Gate V-VI",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "theme-marcopolo",
		change_prefab = "",
		change_background = "bg_shenguang_1",
		id = 157,
		story = "FANLONGNEIDESHENGUANG17",
		pre_event = {
			154
		},
		lock = {
			{
				4,
				156
			}
		}
	},
	[158] = {
		story_type = 1,
		name = "EP3-3 A Bold Plan",
		unlock_conditions = "Clear EPS3-2.",
		change_bgm = "story-shenguang-holy",
		change_prefab = "",
		change_background = "bg_shenguang_cg_7",
		id = 158,
		story = "FANLONGNEIDESHENGUANG18",
		pre_event = {
			155,
			156,
			157
		},
		lock = {
			{
				4,
				157
			}
		}
	},
	[159] = {
		story_type = 2,
		name = "EP3-4 Showdown Between Light and Dark?",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "theme-thehierophantV",
		change_prefab = "",
		change_background = "bg_shenguang_cg_10",
		id = 159,
		story = "1896002",
		pre_event = {
			158
		},
		lock = {
			{
				4,
				158
			}
		}
	},
	[160] = {
		story_type = 1,
		name = "EP3-5 The Silent Statue",
		unlock_conditions = "Clear EP3-4.",
		change_bgm = "battle-shenguang-freely",
		change_prefab = "",
		change_background = "bg_shenguang_1",
		id = 160,
		story = "FANLONGNEIDESHENGUANG20",
		pre_event = {
			158
		},
		lock = {
			{
				4,
				159
			}
		}
	},
	[161] = {
		story_type = 1,
		name = "EP4-1 Unforeseen Development",
		unlock_conditions = "Clear EP3-5.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_505",
		id = 161,
		story = "FANLONGNEIDESHENGUANG21",
		pre_event = {
			159,
			160
		},
		lock = {
			{
				4,
				160
			}
		}
	},
	[162] = {
		story_type = 1,
		name = "EPS4-1 Gate VII",
		unlock_conditions = "Clear EP4-1.",
		change_bgm = "battle-thechariotVII",
		change_prefab = "",
		change_background = "bg_shenguang_4",
		id = 162,
		story = "FANLONGNEIDESHENGUANG22",
		pre_event = {
			161
		},
		lock = {
			{
				4,
				161
			}
		}
	},
	[163] = {
		story_type = 1,
		name = "EP4-2 Two-Way Interference",
		unlock_conditions = "Clear EPS4-1.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_505",
		id = 163,
		story = "FANLONGNEIDESHENGUANG23",
		pre_event = {
			162
		},
		lock = {
			{
				4,
				162
			}
		}
	},
	[164] = {
		story_type = 1,
		name = "EP4-3 Gate VIII-X",
		unlock_conditions = "Clear EP4-2.",
		change_bgm = "battle-thechariotVII",
		change_prefab = "",
		change_background = "bg_shenguang_4",
		id = 164,
		story = "FANLONGNEIDESHENGUANG24",
		pre_event = {
			163
		},
		lock = {
			{
				4,
				163
			}
		}
	},
	[165] = {
		story_type = 1,
		name = "EP5-1 Baiting the Enemy",
		unlock_conditions = "Clear EP4-3.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_505",
		id = 165,
		story = "FANLONGNEIDESHENGUANG25",
		pre_event = {
			164
		},
		lock = {
			{
				4,
				164
			}
		}
	},
	[166] = {
		story_type = 1,
		name = "EP5-2 Gate XI",
		unlock_conditions = "Clear EP5-1.",
		change_bgm = "battle-thechariotVII",
		change_prefab = "",
		change_background = "bg_shenguang_5",
		id = 166,
		story = "FANLONGNEIDESHENGUANG26",
		pre_event = {
			165
		},
		lock = {
			{
				4,
				165
			}
		}
	},
	[167] = {
		story_type = 2,
		name = "EP5-3 Final Battle - Part 1",
		unlock_conditions = "Clear EP5-2.",
		change_bgm = "battle-thechariotVII",
		change_prefab = "",
		change_background = "star_level_bg_595",
		id = 167,
		story = "1896003",
		pre_event = {
			166
		},
		lock = {
			{
				4,
				166
			}
		}
	},
	[168] = {
		story_type = 2,
		name = "EPS5-1 Final Battle - Part 2",
		unlock_conditions = "Clear EP5-3.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "bg_underheaven_0",
		id = 168,
		story = "1896004",
		pre_event = {
			167
		},
		lock = {
			{
				4,
				167
			}
		}
	},
	[169] = {
		story_type = 2,
		name = "EP6-1 Final Battle - Part 3",
		unlock_conditions = "Clear EPS5-1.",
		change_bgm = "theme-thehierophantV",
		change_prefab = "",
		change_background = "bg_story_tower",
		id = 169,
		story = "1896005",
		pre_event = {
			168
		},
		lock = {
			{
				4,
				168
			}
		}
	},
	[170] = {
		story_type = 1,
		name = "EP6-2 With God By My Side",
		unlock_conditions = "Clear EP6-1.",
		change_bgm = "story-theme-sardinia",
		change_prefab = "",
		change_background = "bg_shenguang_cg_11",
		id = 170,
		story = "FANLONGNEIDESHENGUANG30",
		pre_event = {
			169
		},
		lock = {
			{
				4,
				169
			}
		}
	},
	[171] = {
		story_type = 1,
		name = "EP6-3 Epilogue",
		unlock_conditions = "Clear EP6-2.",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "star_level_bg_595",
		id = 171,
		story = "FANLONGNEIDESHENGUANG31",
		pre_event = {
			170
		},
		lock = {
			{
				4,
				170
			}
		}
	},
	[172] = {
		story_type = 1,
		name = "EX-1 Continuation",
		unlock_conditions = "Clear EP6-3.",
		change_bgm = "theme-underheaven",
		change_prefab = "",
		change_background = "star_level_bg_499",
		id = 172,
		story = "FANLONGNEIDESHENGUANG32",
		pre_event = {
			171
		},
		lock = {
			{
				4,
				171
			}
		}
	},
	[173] = {
		story_type = 1,
		name = "EX-2 We Will Meet Again",
		unlock_conditions = "Clear EX-1.",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "star_level_bg_541",
		id = 173,
		story = "FANLONGNEIDESHENGUANG33",
		pre_event = {
			172
		},
		lock = {
			{
				4,
				172
			}
		}
	},
	[174] = {
		story_type = 1,
		name = "EX-3 The Sprout of Tulipa",
		unlock_conditions = "Clear EX-2.",
		change_bgm = "story-startravel",
		change_prefab = "",
		change_background = "star_level_bg_589",
		id = 174,
		story = "FANLONGNEIDESHENGUANG34",
		pre_event = {
			173
		},
		lock = {
			{
				4,
				173
			}
		}
	},
	[175] = {
		story_type = 1,
		name = "EX-4 Trouble on the Horizon",
		unlock_conditions = "Clear EX-3.",
		change_bgm = "theme-dailyfuture",
		change_prefab = "",
		change_background = "star_level_bg_147",
		id = 175,
		story = "FANLONGNEIDESHENGUANG35",
		pre_event = {
			174
		},
		lock = {
			{
				4,
				174
			}
		}
	},
	[176] = {
		story_type = 1,
		name = "EX-5 Her",
		unlock_conditions = "Clear EX-4.",
		change_bgm = "story-theme-sardinia",
		change_prefab = "",
		change_background = "bg_shenguang_6",
		id = 176,
		story = "FANLONGNEIDESHENGUANG36",
		pre_event = {
			175
		},
		lock = {
			{
				4,
				175
			}
		}
	},
	[181] = {
		story_type = 1,
		pre_event = "",
		name = "EPS-1 The Banquet",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_541",
		story = "YANGQIYUJINZHIQI1",
		change_bgm = "story-richang-light",
		id = 181,
		lock = ""
	},
	[182] = {
		story_type = 1,
		name = "EPS-2 The NA Ocean Purification Campaign",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "story-tulipa",
		change_prefab = "",
		change_background = "star_level_bg_188",
		id = 182,
		story = "YANGQIYUJINZHIQI2",
		pre_event = {
			181
		},
		lock = {
			{
				4,
				181
			}
		}
	},
	[183] = {
		story_type = 1,
		name = "EPS-3 Nieuwe Haven",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "theme-tulipa",
		change_prefab = "",
		change_background = "bg_yujin_1",
		id = 183,
		story = "YANGQIYUJINZHIQI3",
		pre_event = {
			182
		},
		lock = {
			{
				4,
				182
			}
		}
	},
	[184] = {
		story_type = 1,
		name = "EPS-4 Supplementary Intel",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "story-tulipa",
		change_prefab = "",
		change_background = "bg_yujin_2",
		id = 184,
		story = "YANGQIYUJINZHIQI4",
		pre_event = {
			183
		},
		lock = {
			{
				4,
				183
			}
		}
	},
	[185] = {
		story_type = 1,
		name = "EPS-5 Setting Sail",
		unlock_conditions = "Clear EPS-4.",
		change_bgm = "battle-tulipa",
		change_prefab = "",
		change_background = "bg_yujin_cg1",
		id = 185,
		story = "YANGQIYUJINZHIQI5",
		pre_event = {
			184
		},
		lock = {
			{
				4,
				184
			}
		}
	},
	[186] = {
		story_type = 2,
		name = "EPS-6 The Tulipans' First Battle – 1",
		unlock_conditions = "Clear EPS-5.",
		change_bgm = "battle-tulipa",
		change_prefab = "",
		change_background = "bg_yujin_3",
		id = 186,
		story = "1916001",
		pre_event = {
			185
		},
		lock = {
			{
				4,
				185
			}
		}
	},
	[187] = {
		story_type = 2,
		name = "EPS-7 The Tulipans' First Battle – 2",
		unlock_conditions = "Clear EPS-6.",
		change_bgm = "story-tulipa",
		change_prefab = "",
		change_background = "bg_yujin_cg2",
		id = 187,
		story = "1916002",
		pre_event = {
			186
		},
		lock = {
			{
				4,
				186
			}
		}
	},
	[188] = {
		story_type = 1,
		name = "EPS-8 Flames and Sprouts",
		unlock_conditions = "Clear EPS-7.",
		change_bgm = "theme-tulipa",
		change_prefab = "",
		change_background = "bg_yujin_2",
		id = 188,
		story = "YANGQIYUJINZHIQI8",
		pre_event = {
			187
		},
		lock = {
			{
				4,
				187
			}
		}
	},
	[191] = {
		story_type = 1,
		pre_event = "",
		name = "EPS-1 The Usherer of a New Age",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_538",
		story = "GAOTASHANGDEQIANGWEI1",
		change_bgm = "theme-brokenworld-sad",
		id = 191,
		lock = ""
	},
	[192] = {
		story_type = 1,
		name = "EP1-1 The Dead Land",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "theme-lion",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_1",
		id = 192,
		story = "GAOTASHANGDEQIANGWEI2",
		pre_event = {
			191
		},
		lock = {
			{
				4,
				191
			}
		}
	},
	[193] = {
		story_type = 1,
		name = "EP2-1 The Mesektet",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "theme-lion",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_1",
		id = 193,
		story = "GAOTASHANGDEQIANGWEI3",
		pre_event = {
			191
		},
		lock = {
			{
				4,
				192
			}
		}
	},
	[194] = {
		story_type = 1,
		name = "EP2-2 Rising Tide",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "theme-brokenworld-sad",
		change_prefab = "",
		change_background = "star_level_bg_590",
		id = 194,
		story = "GAOTASHANGDEQIANGWEI4",
		pre_event = {
			193
		},
		lock = {
			{
				4,
				193
			}
		}
	},
	[195] = {
		story_type = 1,
		name = "EP1-2 Time-Flow Differentials",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "theme-lion",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_cg2",
		id = 195,
		story = "GAOTASHANGDEQIANGWEI5",
		pre_event = {
			192
		},
		lock = {
			{
				4,
				194
			}
		}
	},
	[196] = {
		story_type = 1,
		name = "EP2-3 Landfall and Adversaries",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "star_level_bg_306",
		id = 196,
		story = "GAOTASHANGDEQIANGWEI6",
		pre_event = {
			194
		},
		lock = {
			{
				4,
				195
			}
		}
	},
	[197] = {
		story_type = 1,
		name = "EPS-2 Eyes on the Battle",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "theme-lion",
		change_prefab = "",
		change_background = "star_level_bg_538",
		id = 197,
		story = "GAOTASHANGDEQIANGWEI7",
		pre_event = {
			195,
			196
		},
		lock = {
			{
				4,
				196
			}
		}
	},
	[198] = {
		story_type = 2,
		name = "EP3-1 The Train and the Barque",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "star_level_bg_600",
		id = 198,
		story = "1926001",
		pre_event = {
			197
		},
		lock = {
			{
				4,
				197
			}
		}
	},
	[199] = {
		story_type = 1,
		name = "EP3-2 Survivors of the Rose Tower",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "story-royalnavy-serious",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_cg3",
		id = 199,
		story = "GAOTASHANGDEQIANGWEI9",
		pre_event = {
			198
		},
		lock = {
			{
				4,
				198
			}
		}
	},
	[200] = {
		story_type = 1,
		name = "EP3-3 A World Without Elizabeth",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "theme-brokenworld-sad",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_1",
		id = 200,
		story = "GAOTASHANGDEQIANGWEI10",
		pre_event = {
			199
		},
		lock = {
			{
				4,
				199
			}
		}
	},
	[201] = {
		story_type = 1,
		name = "EP3-4 Buds of the New Moon",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "theme-camelot",
		change_prefab = "",
		change_background = "star_level_bg_559",
		id = 201,
		story = "GAOTASHANGDEQIANGWEI11",
		pre_event = {
			200
		},
		lock = {
			{
				4,
				200
			}
		}
	},
	[202] = {
		story_type = 1,
		name = "EPS-3 Inspecting the Whale",
		unlock_conditions = "Clear EP3-4.",
		change_bgm = "theme-lion",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_1",
		id = 202,
		story = "GAOTASHANGDEQIANGWEI12",
		pre_event = {
			201
		},
		lock = {
			{
				4,
				201
			}
		}
	},
	[203] = {
		story_type = 1,
		name = "EP4-1 Danger Intensifies",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "story-antix-past",
		change_prefab = "",
		change_background = "star_level_bg_538",
		id = 203,
		story = "GAOTASHANGDEQIANGWEI13",
		pre_event = {
			202
		},
		lock = {
			{
				4,
				202
			}
		}
	},
	[204] = {
		story_type = 1,
		name = "EP5-1 Exploring the Unknown",
		unlock_conditions = "Clear EP4-1.",
		change_bgm = "story-temepest-2",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_2",
		id = 204,
		story = "GAOTASHANGDEQIANGWEI14",
		pre_event = {
			202
		},
		lock = {
			{
				4,
				203
			}
		}
	},
	[205] = {
		story_type = 1,
		name = "EP4-2 Transcendental Insight",
		unlock_conditions = "Clear EP5-1.",
		change_bgm = "story-antix-past",
		change_prefab = "",
		change_background = "star_level_bg_538",
		id = 205,
		story = "GAOTASHANGDEQIANGWEI15",
		pre_event = {
			203
		},
		lock = {
			{
				4,
				204
			}
		}
	},
	[206] = {
		story_type = 1,
		name = "EP5-2 Compiler the Reliable",
		unlock_conditions = "Clear EP4-2.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_1",
		id = 206,
		story = "GAOTASHANGDEQIANGWEI16",
		pre_event = {
			204
		},
		lock = {
			{
				4,
				205
			}
		}
	},
	[207] = {
		story_type = 1,
		name = "EP4-3 A Different Royal Navy",
		unlock_conditions = "Clear EP5-2.",
		change_bgm = "story-lion-up",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_cg4",
		id = 207,
		story = "GAOTASHANGDEQIANGWEI17",
		pre_event = {
			205
		},
		lock = {
			{
				4,
				206
			}
		}
	},
	[208] = {
		story_type = 2,
		name = "EPS-4 Compiler the Overly Reliable",
		unlock_conditions = "Clear EP4-3.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "star_level_bg_306",
		id = 208,
		story = "1926002",
		pre_event = {
			206,
			207
		},
		lock = {
			{
				4,
				207
			}
		}
	},
	[209] = {
		story_type = 1,
		name = "EP6-1 Invasion Plan",
		unlock_conditions = "Clear EPS-4.",
		change_bgm = "theme-lion",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_1",
		id = 209,
		story = "GAOTASHANGDEQIANGWEI19",
		pre_event = {
			208
		},
		lock = {
			{
				4,
				208
			}
		}
	},
	[210] = {
		story_type = 1,
		name = "EP6-2 In the Name of the Eternal Sun",
		unlock_conditions = "Clear EP6-1.",
		change_bgm = "theme-ucnf-image",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_2",
		id = 210,
		story = "GAOTASHANGDEQIANGWEI20",
		pre_event = {
			209
		},
		lock = {
			{
				4,
				209
			}
		}
	},
	[211] = {
		story_type = 1,
		name = "EP6-3 Bridge to the Beyond",
		unlock_conditions = "Clear EP6-2.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "star_level_bg_306",
		id = 211,
		story = "GAOTASHANGDEQIANGWEI21",
		pre_event = {
			210
		},
		lock = {
			{
				4,
				210
			}
		}
	},
	[212] = {
		story_type = 1,
		name = "EP7-1 Greater Plans",
		unlock_conditions = "Clear EP6-3.",
		change_bgm = "battle-ash-strong",
		change_prefab = "",
		change_background = "bg_cccpv2_9",
		id = 212,
		story = "GAOTASHANGDEQIANGWEI22",
		pre_event = {
			211
		},
		lock = {
			{
				4,
				211
			}
		}
	},
	[213] = {
		story_type = 1,
		name = "EP7-2 Admiral Mikhail",
		unlock_conditions = "Clear EP7-1.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_cg5",
		id = 213,
		story = "GAOTASHANGDEQIANGWEI23",
		pre_event = {
			212
		},
		lock = {
			{
				4,
				212
			}
		}
	},
	[214] = {
		story_type = 1,
		name = "EP7-3 Tea Party with Glorious",
		unlock_conditions = "Clear EP7-2.",
		change_bgm = "story-antix-past",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_2",
		id = 214,
		story = "GAOTASHANGDEQIANGWEI24",
		pre_event = {
			213
		},
		lock = {
			{
				4,
				213
			}
		}
	},
	[215] = {
		story_type = 1,
		name = "EP8-1 Preparing for War",
		unlock_conditions = "Clear EP7-3.",
		change_bgm = "story-antix-past",
		change_prefab = "",
		change_background = "star_level_bg_538",
		id = 215,
		story = "GAOTASHANGDEQIANGWEI25",
		pre_event = {
			214
		},
		lock = {
			{
				4,
				214
			}
		}
	},
	[216] = {
		story_type = 2,
		name = "EP8-2 Class II Mimic Entities",
		unlock_conditions = "Clear EP8-1.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "star_level_bg_115",
		id = 216,
		story = "1926003",
		pre_event = {
			215
		},
		lock = {
			{
				4,
				215
			}
		}
	},
	[217] = {
		story_type = 1,
		name = "EP8-3 By a Hair",
		unlock_conditions = "Clear EP8-2.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "star_level_bg_535",
		id = 217,
		story = "GAOTASHANGDEQIANGWEI27",
		pre_event = {
			216
		},
		lock = {
			{
				4,
				216
			}
		}
	},
	[218] = {
		story_type = 1,
		name = "EP8-4 Glorious' Choice",
		unlock_conditions = "Clear EP8-3.",
		change_bgm = "theme-glorious-meta",
		change_prefab = "",
		change_background = "star_level_bg_600",
		id = 218,
		story = "GAOTASHANGDEQIANGWEI28",
		pre_event = {
			217
		},
		lock = {
			{
				4,
				217
			}
		}
	},
	[219] = {
		story_type = 1,
		name = "EP9-1 Impending Decision",
		unlock_conditions = "Clear EP8-4.",
		change_bgm = "story-memory-grief",
		change_prefab = "",
		change_background = "star_level_bg_115",
		id = 219,
		story = "GAOTASHANGDEQIANGWEI29",
		pre_event = {
			218
		},
		lock = {
			{
				4,
				218
			}
		}
	},
	[220] = {
		story_type = 1,
		name = "EP9-2 A Miracle for Me, a Miracle for Thee",
		unlock_conditions = "Clear EP9-1.",
		change_bgm = "theme-thechariotVII",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_4",
		id = 220,
		story = "GAOTASHANGDEQIANGWEI30",
		pre_event = {
			219
		},
		lock = {
			{
				4,
				219
			}
		}
	},
	[221] = {
		story_type = 1,
		name = "EP9-3 The Grand Finale",
		unlock_conditions = "Clear EP9-2.",
		change_bgm = "theme-shallowoftheworld",
		change_prefab = "",
		change_background = "star_level_bg_590",
		id = 221,
		story = "GAOTASHANGDEQIANGWEI31",
		pre_event = {
			220
		},
		lock = {
			{
				4,
				220
			}
		}
	},
	[222] = {
		story_type = 1,
		name = "EX-1 The Price of Victory",
		unlock_conditions = "Clear EP9-3.",
		change_bgm = "theme-thechariotVII",
		change_prefab = "",
		change_background = "bg_gaotaqiangwei_6",
		id = 222,
		story = "GAOTASHANGDEQIANGWEI32",
		pre_event = {
			221
		},
		lock = {
			{
				4,
				221
			}
		}
	},
	[223] = {
		story_type = 1,
		name = "EX-2 Transboundary Experiment",
		unlock_conditions = "Clear EX-1.",
		change_bgm = "story-egypt-mystic",
		change_prefab = "",
		change_background = "star_level_bg_303",
		id = 223,
		story = "GAOTASHANGDEQIANGWEI33",
		pre_event = {
			222
		},
		lock = {
			{
				4,
				222
			}
		}
	},
	[224] = {
		story_type = 1,
		name = "EX-3 All Set",
		unlock_conditions = "Clear EX-2.",
		change_bgm = "theme-frederick",
		change_prefab = "",
		change_background = "star_level_bg_503",
		id = 224,
		story = "GAOTASHANGDEQIANGWEI34",
		pre_event = {
			223
		},
		lock = {
			{
				4,
				223
			}
		}
	},
	[225] = {
		story_type = 1,
		name = "EX-4 Changing the Ashes",
		unlock_conditions = "Clear EX-3.",
		change_bgm = "theme-thetowerXVI",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 225,
		story = "GAOTASHANGDEQIANGWEI35",
		pre_event = {
			224
		},
		lock = {
			{
				4,
				224
			}
		}
	},
	[226] = {
		story_type = 1,
		name = "EX-5 Tower the Guiltless",
		unlock_conditions = "Clear EX-4.",
		change_bgm = "theme-brokenworld-sad",
		change_prefab = "map_1920001",
		change_background = "bg_gaotaqiangwei_2",
		id = 226,
		story = "GAOTASHANGDEQIANGWEI36",
		pre_event = {
			225
		},
		lock = {
			{
				4,
				225
			}
		}
	},
	[231] = {
		story_type = 1,
		pre_event = "",
		name = "EPS-1 The Secret Realm of the Dragon Palace.",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_490",
		story = "QIWUYUTIANYUANZHISHANG1",
		change_bgm = "story-amahara-stage2",
		id = 231,
		lock = ""
	},
	[232] = {
		story_type = 1,
		name = "EP1-1 Ama no Tobira",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "story-amahara-stage2",
		change_prefab = "",
		change_background = "star_level_bg_492",
		id = 232,
		story = "QIWUYUTIANYUANZHISHANG2",
		pre_event = {
			231
		},
		lock = {
			{
				4,
				231
			}
		}
	},
	[233] = {
		story_type = 1,
		name = "EP1-2 Ride the Clouds",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "story-amahara-stage3",
		change_prefab = "",
		change_background = "bg_amahara_cg1",
		id = 233,
		story = "QIWUYUTIANYUANZHISHANG3",
		pre_event = {
			232
		},
		lock = {
			{
				4,
				232
			}
		}
	},
	[234] = {
		story_type = 1,
		name = "EP1-3 A Table in the Sea of Clouds",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "story-amahara-stage1",
		change_prefab = "",
		change_background = "bg_amahara_1",
		id = 234,
		story = "QIWUYUTIANYUANZHISHANG4",
		pre_event = {
			233
		},
		lock = {
			{
				4,
				233
			}
		}
	},
	[235] = {
		story_type = 1,
		name = "EP1-4 Amahara's Scenery",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "story-mayrain",
		change_prefab = "",
		change_background = "star_level_bg_492",
		id = 235,
		story = "QIWUYUTIANYUANZHISHANG5",
		pre_event = {
			234
		},
		lock = {
			{
				4,
				234
			}
		}
	},
	[236] = {
		story_type = 1,
		name = "EP1-5 Dream Stones",
		unlock_conditions = "Clear EP1-4.",
		change_bgm = "story-amahara-stage2",
		change_prefab = "",
		change_background = "star_level_bg_490",
		id = 236,
		story = "QIWUYUTIANYUANZHISHANG6",
		pre_event = {
			235
		},
		lock = {
			{
				4,
				235
			}
		}
	},
	[237] = {
		story_type = 1,
		name = "EP2-1 Cloudsea Wine",
		unlock_conditions = "Clear EP1-5.",
		change_bgm = "story-amahara-stage2",
		change_prefab = "",
		change_background = "bg_amahara_cg5",
		id = 237,
		story = "QIWUYUTIANYUANZHISHANG7",
		pre_event = {
			236
		},
		lock = {
			{
				4,
				236
			}
		}
	},
	[238] = {
		story_type = 1,
		name = "EP2-2 Weaving Dreams",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "story-island-soft",
		change_prefab = "",
		change_background = "star_level_bg_539",
		id = 238,
		story = "QIWUYUTIANYUANZHISHANG8",
		pre_event = {
			237
		},
		lock = {
			{
				4,
				237
			}
		}
	},
	[239] = {
		story_type = 1,
		name = "EP2-3 Peace?",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "bg_tieyiqingfeng_1",
		id = 239,
		story = "QIWUYUTIANYUANZHISHANG9",
		pre_event = {
			238
		},
		lock = {
			{
				4,
				238
			}
		}
	},
	[240] = {
		story_type = 1,
		name = "EP2-4 Unfolding?",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "story-temepest-2",
		change_prefab = "",
		change_background = "star_level_bg_491",
		id = 240,
		story = "QIWUYUTIANYUANZHISHANG10",
		pre_event = {
			239
		},
		lock = {
			{
				4,
				239
			}
		}
	},
	[241] = {
		story_type = 1,
		name = "EP2-5 Anxiety?",
		unlock_conditions = "Clear EP2-4.",
		change_bgm = "musashi-2",
		change_prefab = "",
		change_background = "bg_amahara_2",
		id = 241,
		story = "QIWUYUTIANYUANZHISHANG11",
		pre_event = {
			240
		},
		lock = {
			{
				4,
				240
			}
		}
	},
	[242] = {
		story_type = 1,
		name = "EPS-2 All-Out Invasion",
		unlock_conditions = "Clear EP2-5.",
		change_bgm = "theme-starsea-core",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 242,
		story = "QIWUYUTIANYUANZHISHANG12",
		pre_event = {
			241
		},
		lock = {
			{
				4,
				241
			}
		}
	},
	[243] = {
		story_type = 1,
		name = "EPS-3 The Web of a Bygone Day",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "battle-unzen-1",
		change_prefab = "",
		change_background = "bg_amahara_cg6",
		id = 243,
		story = "QIWUYUTIANYUANZHISHANG13",
		pre_event = {
			241
		},
		lock = {
			{
				4,
				242
			}
		}
	},
	[244] = {
		story_type = 2,
		name = "EP3-1 Push Through the Dark Tide",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "theme-sakuraholyplace",
		change_prefab = "",
		change_background = "bg_amahara_cg7",
		id = 244,
		story = "1966001",
		pre_event = {
			242,
			243
		},
		lock = {
			{
				4,
				243
			}
		}
	},
	[245] = {
		story_type = 1,
		name = "EP3-2 Phase Shift",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "battle-boss-ucnf",
		change_prefab = "",
		change_background = "bg_amahara_3",
		id = 245,
		story = "QIWUYUTIANYUANZHISHANG15",
		pre_event = {
			244
		},
		lock = {
			{
				4,
				244
			}
		}
	},
	[246] = {
		story_type = 1,
		name = "EP3-3 The Depths",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 246,
		story = "QIWUYUTIANYUANZHISHANG16",
		pre_event = {
			245
		},
		lock = {
			{
				4,
				245
			}
		}
	},
	[247] = {
		story_type = 1,
		name = "EP-? Stepping Into Amahara - Part 1",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 247,
		story = "QIWUYUTIANYUANZHISHANG17",
		pre_event = {
			246
		},
		lock = {
			{
				4,
				246
			}
		}
	},
	[248] = {
		story_type = 1,
		name = "EP-? Stepping Into Amahara - Part 2",
		unlock_conditions = "Clear EP-?",
		change_bgm = "story-worldα-brokenlight",
		change_prefab = "",
		change_background = "bg_xiangting_2",
		id = 248,
		story = "QIWUYUTIANYUANZHISHANG18",
		pre_event = {
			247
		},
		lock = {
			{
				4,
				247
			}
		}
	},
	[249] = {
		story_type = 1,
		name = "EP4-1 The Long Island Defense Line, Again",
		unlock_conditions = "Clear EP-?",
		change_bgm = "story-worldα-grief",
		change_prefab = "",
		change_background = "star_level_bg_494",
		id = 249,
		story = "QIWUYUTIANYUANZHISHANG19",
		pre_event = {
			248
		},
		lock = {
			{
				4,
				248
			}
		}
	},
	[250] = {
		story_type = 1,
		name = "EP4-2 Operation: Rescue Anzeel",
		unlock_conditions = "Clear EP4-1",
		change_bgm = "story-worldα-grief",
		change_prefab = "",
		change_background = "star_level_bg_170",
		id = 250,
		story = "QIWUYUTIANYUANZHISHANG20",
		pre_event = {
			249
		},
		lock = {
			{
				4,
				249
			}
		}
	},
	[251] = {
		story_type = 1,
		name = "EP4-3 A Glimmer in the Strings",
		unlock_conditions = "Clear EP4-2",
		change_bgm = "story-worldα-brokenlight",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 251,
		story = "QIWUYUTIANYUANZHISHANG21",
		pre_event = {
			250
		},
		lock = {
			{
				4,
				250
			}
		}
	},
	[252] = {
		story_type = 1,
		name = "EP4-4 Operation: Rescue Anzeel 2.0",
		unlock_conditions = "Clear EP4-3",
		change_bgm = "story-worldα-brokenlight",
		change_prefab = "",
		change_background = "star_level_bg_306",
		id = 252,
		story = "QIWUYUTIANYUANZHISHANG22",
		pre_event = {
			251
		},
		lock = {
			{
				4,
				251
			}
		}
	},
	[253] = {
		story_type = 1,
		name = "EP4-5 Preliminary Prep",
		unlock_conditions = "Clear EP4-4",
		change_bgm = "story-worldα-brokenlight",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 253,
		story = "QIWUYUTIANYUANZHISHANG23",
		pre_event = {
			252
		},
		lock = {
			{
				4,
				252
			}
		}
	},
	[254] = {
		story_type = 1,
		name = "EP4-6 Imprisoned",
		unlock_conditions = "Clear EP4-5",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 254,
		story = "QIWUYUTIANYUANZHISHANG24",
		pre_event = {
			253
		},
		lock = {
			{
				4,
				253
			}
		}
	},
	[255] = {
		story_type = 1,
		name = "EP5-1 Preliminary Prep 2.0",
		unlock_conditions = "Clear EP4-6",
		change_bgm = "story-amahara-stage2",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 255,
		story = "QIWUYUTIANYUANZHISHANG25",
		pre_event = {
			254
		},
		lock = {
			{
				4,
				254
			}
		}
	},
	[256] = {
		story_type = 1,
		name = "EP5-2 Defensive Area A",
		unlock_conditions = "Clear EP5-1",
		change_bgm = "theme-starsea-core",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 256,
		story = "QIWUYUTIANYUANZHISHANG26",
		pre_event = {
			255
		},
		lock = {
			{
				4,
				255
			}
		}
	},
	[257] = {
		story_type = 1,
		name = "EP5-3 Defensive Area B",
		unlock_conditions = "Clear EP5-2",
		change_bgm = "theme-unzen",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 257,
		story = "QIWUYUTIANYUANZHISHANG27",
		pre_event = {
			255
		},
		lock = {
			{
				4,
				256
			}
		}
	},
	[258] = {
		story_type = 1,
		name = "EP5-4 Defensive Area C",
		unlock_conditions = "Clear EP5-3",
		change_bgm = "theme-akagi-inside",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 258,
		story = "QIWUYUTIANYUANZHISHANG28",
		pre_event = {
			255
		},
		lock = {
			{
				4,
				257
			}
		}
	},
	[259] = {
		story_type = 1,
		name = "EP5-5 A Dash of Crimson",
		unlock_conditions = "Clear EP5-4",
		change_bgm = "battle-unknown-approaching",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 259,
		story = "QIWUYUTIANYUANZHISHANG29",
		pre_event = {
			256,
			257,
			258
		},
		lock = {
			{
				4,
				258
			}
		}
	},
	[260] = {
		story_type = 1,
		name = "EP6-1 The Black Wall",
		unlock_conditions = "Clear EP5-5",
		change_bgm = "theme-longgong-another",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 260,
		story = "QIWUYUTIANYUANZHISHANG30",
		pre_event = {
			259
		},
		lock = {
			{
				4,
				259
			}
		}
	},
	[261] = {
		story_type = 1,
		name = "EP6-2 Not a Moment Too Soon",
		unlock_conditions = "Clear EP6-1",
		change_bgm = "theme-helena",
		change_prefab = "",
		change_background = "bg_amahara_cg10",
		id = 261,
		story = "QIWUYUTIANYUANZHISHANG31",
		pre_event = {
			260
		},
		lock = {
			{
				4,
				260
			}
		}
	},
	[262] = {
		story_type = 1,
		name = "EP6-3 As Blue as the Sea",
		unlock_conditions = "Clear EP6-2",
		change_bgm = "theme-helena",
		change_prefab = "",
		change_background = "bg_underwater",
		id = 262,
		story = "QIWUYUTIANYUANZHISHANG32",
		pre_event = {
			261
		},
		lock = {
			{
				4,
				261
			}
		}
	},
	[263] = {
		story_type = 1,
		name = "EP6-4 Farewell",
		unlock_conditions = "Clear EP6-3",
		change_bgm = "story-amahara-stage1",
		change_prefab = "",
		change_background = "bg_amahara_4",
		id = 263,
		story = "QIWUYUTIANYUANZHISHANG33",
		pre_event = {
			262
		},
		lock = {
			{
				4,
				262
			}
		}
	},
	[264] = {
		story_type = 1,
		name = "EP6-5 Epilogue",
		unlock_conditions = "Clear EP6-4",
		change_bgm = "story-amahara-stage1",
		change_prefab = "",
		change_background = "star_level_bg_111",
		id = 264,
		story = "QIWUYUTIANYUANZHISHANG34",
		pre_event = {
			263
		},
		lock = {
			{
				4,
				263
			}
		}
	},
	[265] = {
		story_type = 1,
		name = "EX-1 Amahara Forevermore",
		unlock_conditions = "Clear EP6-5",
		change_bgm = "theme-akagi-inside",
		change_prefab = "",
		change_background = "star_level_bg_492",
		id = 265,
		story = "QIWUYUTIANYUANZHISHANG35",
		pre_event = {
			264
		},
		lock = {
			{
				4,
				264
			}
		}
	},
	[266] = {
		story_type = 1,
		name = "EX-2 A Crimson Farewell",
		unlock_conditions = "Clear EX-1",
		change_bgm = "theme-starsea-core",
		change_prefab = "",
		change_background = "bg_port_chongdong",
		id = 266,
		story = "QIWUYUTIANYUANZHISHANG36",
		pre_event = {
			265
		},
		lock = {
			{
				4,
				265
			}
		}
	},
	[267] = {
		story_type = 1,
		name = "EX-3 Helena's Resolve",
		unlock_conditions = "Clear EX-2",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "star_level_bg_170",
		id = 267,
		story = "QIWUYUTIANYUANZHISHANG37",
		pre_event = {
			266
		},
		lock = {
			{
				4,
				266
			}
		}
	},
	[268] = {
		story_type = 1,
		name = "EX-4 Everything Will Be Fine",
		unlock_conditions = "Clear EX-3",
		change_bgm = "theme-starsea-core",
		change_prefab = "",
		change_background = "star_level_bg_589",
		id = 268,
		story = "QIWUYUTIANYUANZHISHANG38",
		pre_event = {
			267
		},
		lock = {
			{
				4,
				267
			}
		}
	},
	[269] = {
		story_type = 1,
		name = "EX-5 Sweet Bait",
		unlock_conditions = "Clear EX-4",
		change_bgm = "story-amahara-stage1",
		change_prefab = "Map_1960002",
		change_background = "bg_amahara_4",
		id = 269,
		story = "QIWUYUTIANYUANZHISHANG39",
		pre_event = {
			268
		},
		lock = {
			{
				4,
				268
			}
		}
	},
	[271] = {
		story_type = 1,
		pre_event = "",
		name = "EPS-1 The Long and Short of It",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "",
		story = "QINGKONGXIADEXIEHOUGUANQIA1",
		change_bgm = "",
		id = 271,
		lock = ""
	},
	[272] = {
		story_type = 1,
		name = "EP1-1 Hestia's Visit",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 272,
		story = "QINGKONGXIADEXIEHOUGUANQIA2",
		pre_event = {
			271
		},
		lock = {
			{
				4,
				271
			}
		}
	},
	[273] = {
		story_type = 1,
		name = "EP1-2 The God and the Dungeon",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 273,
		story = "QINGKONGXIADEXIEHOUGUANQIA3",
		pre_event = {
			272
		},
		lock = {
			{
				4,
				272
			}
		}
	},
	[274] = {
		story_type = 1,
		name = "EP1-3 Confluence",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 274,
		story = "QINGKONGXIADEXIEHOUGUANQIA4",
		pre_event = {
			273
		},
		lock = {
			{
				4,
				273
			}
		}
	},
	[275] = {
		story_type = 1,
		name = "EP2-1 Ryu's Story",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 275,
		story = "QINGKONGXIADEXIEHOUGUANQIA5",
		pre_event = {
			271
		},
		lock = {
			{
				4,
				274
			}
		}
	},
	[276] = {
		story_type = 1,
		name = "EP2-2 The God and the Adventurer",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 276,
		story = "QINGKONGXIADEXIEHOUGUANQIA6",
		pre_event = {
			275
		},
		lock = {
			{
				4,
				275
			}
		}
	},
	[277] = {
		story_type = 1,
		name = "EP2-3 Supply Issue",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 277,
		story = "QINGKONGXIADEXIEHOUGUANQIA7",
		pre_event = {
			276
		},
		lock = {
			{
				4,
				276
			}
		}
	},
	[278] = {
		story_type = 1,
		name = "EP3-1 Cooking",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 278,
		story = "QINGKONGXIADEXIEHOUGUANQIA8",
		pre_event = {
			274,
			277
		},
		lock = {
			{
				4,
				277
			}
		}
	},
	[279] = {
		story_type = 1,
		name = "EP3-2 Adventurer's Magic",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 279,
		story = "QINGKONGXIADEXIEHOUGUANQIA9",
		pre_event = {
			278
		},
		lock = {
			{
				4,
				278
			}
		}
	},
	[280] = {
		story_type = 1,
		name = "EP3-3 Drops",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 280,
		story = "QINGKONGXIADEXIEHOUGUANQIA10",
		pre_event = {
			279
		},
		lock = {
			{
				4,
				279
			}
		}
	},
	[281] = {
		story_type = 1,
		name = "EP4-1 Riggings",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 281,
		story = "QINGKONGXIADEXIEHOUGUANQIA11",
		pre_event = {
			280
		},
		lock = {
			{
				4,
				280
			}
		}
	},
	[282] = {
		story_type = 1,
		name = "EP4-2 Freely Speeding Across the Sea",
		unlock_conditions = "Clear EP4-1",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 282,
		story = "QINGKONGXIADEXIEHOUGUANQIA12",
		pre_event = {
			281
		},
		lock = {
			{
				4,
				281
			}
		}
	},
	[283] = {
		story_type = 2,
		name = "EP4-3 First Real Battle",
		unlock_conditions = "Clear EP4-2",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 283,
		story = "1967001",
		pre_event = {
			282
		},
		lock = {
			{
				4,
				282
			}
		}
	},
	[284] = {
		story_type = 1,
		name = "EP4-4 A Seasoned Adventurer",
		unlock_conditions = "Clear EP4-3",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 284,
		story = "QINGKONGXIADEXIEHOUGUANQIA14",
		pre_event = {
			283
		},
		lock = {
			{
				4,
				283
			}
		}
	},
	[285] = {
		story_type = 1,
		name = "EP4-5 Welcome to the Port",
		unlock_conditions = "Clear EP4-4",
		change_bgm = "",
		change_prefab = "",
		change_background = "",
		id = 285,
		story = "QINGKONGXIADEXIEHOUGUANQIA15",
		pre_event = {
			284
		},
		lock = {
			{
				4,
				284
			}
		}
	},
	[291] = {
		story_type = 1,
		pre_event = "",
		name = "EPS-1 Treasure Abound",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_163",
		story = "JUFENGYUZIYOUQUNDAO1",
		change_bgm = "theme-SeaAndSun-image",
		id = 291,
		lock = ""
	},
	[292] = {
		story_type = 1,
		name = "EP1-1 You Are Invited",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "theme-SeaAndSun-soft",
		change_prefab = "",
		change_background = "star_level_bg_163",
		id = 292,
		story = "JUFENGYUZIYOUQUNDAO2",
		pre_event = {
			291
		},
		lock = {
			{
				4,
				291
			}
		}
	},
	[293] = {
		story_type = 1,
		name = "EP1-2 The Wooden Compass",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "danmachi-az-story",
		change_prefab = "",
		change_background = "star_level_bg_194",
		id = 293,
		story = "JUFENGYUZIYOUQUNDAO3",
		pre_event = {
			292
		},
		lock = {
			{
				4,
				292
			}
		}
	},
	[294] = {
		story_type = 1,
		name = "EP1-3 Limestone Island",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "story-tempest-marching",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 294,
		story = "JUFENGYUZIYOUQUNDAO4",
		pre_event = {
			293
		},
		lock = {
			{
				4,
				293
			}
		}
	},
	[295] = {
		story_type = 1,
		name = "EP2-1 Tempestuous Dreams",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "story-tempest-marching",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 295,
		story = "JUFENGYUZIYOUQUNDAO5",
		pre_event = {
			294
		},
		lock = {
			{
				4,
				294
			}
		}
	},
	[296] = {
		story_type = 1,
		name = "EP2-2 Veil of the Night Sky",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "theme-tempest-light",
		change_prefab = "",
		change_background = "bg_jufengv3_cg1",
		id = 296,
		story = "JUFENGYUZIYOUQUNDAO6",
		pre_event = {
			295
		},
		lock = {
			{
				4,
				295
			}
		}
	},
	[297] = {
		story_type = 1,
		name = "EP2-3 Arrival on the Isles",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "theme-tempest-light",
		change_prefab = "",
		change_background = "star_level_bg_525",
		id = 297,
		story = "JUFENGYUZIYOUQUNDAO7",
		pre_event = {
			296
		},
		lock = {
			{
				4,
				296
			}
		}
	},
	[298] = {
		story_type = 1,
		name = "EP2-4 Prepping for the Treasure Hunt",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "theme-tempest-up",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 298,
		story = "JUFENGYUZIYOUQUNDAO8",
		pre_event = {
			297
		},
		lock = {
			{
				4,
				297
			}
		}
	},
	[299] = {
		story_type = 1,
		name = "EP3-1 The Hunters in Mar del Demonios",
		unlock_conditions = "Clear EP2-4.",
		change_bgm = "theme-tempest-light",
		change_prefab = "",
		change_background = "star_level_bg_194",
		id = 299,
		story = "JUFENGYUZIYOUQUNDAO9",
		pre_event = {
			298
		},
		lock = {
			{
				4,
				298
			}
		}
	},
	[300] = {
		story_type = 1,
		name = "EP3-2 Snatch Everything Up!",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "theme-tempest-light",
		change_prefab = "",
		change_background = "star_level_bg_162",
		id = 300,
		story = "JUFENGYUZIYOUQUNDAO10",
		pre_event = {
			298
		},
		lock = {
			{
				4,
				299
			}
		}
	},
	[301] = {
		story_type = 1,
		name = "EP3-3 Visit From Old Friends",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "theme-tempest-light",
		change_prefab = "",
		change_background = "bg_jufengv3_1",
		id = 301,
		story = "JUFENGYUZIYOUQUNDAO11",
		pre_event = {
			299,
			300
		},
		lock = {
			{
				4,
				300
			}
		}
	},
	[302] = {
		story_type = 1,
		name = "EP4-1 Searching the Lighthouse",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "story-temepest-1",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 302,
		story = "JUFENGYUZIYOUQUNDAO12",
		pre_event = {
			301
		},
		lock = {
			{
				4,
				301
			}
		}
	},
	[303] = {
		story_type = 1,
		name = "EP4-2 Uninvited Guests",
		unlock_conditions = "Clear EP4-1",
		change_bgm = "theme-tempest",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 303,
		story = "JUFENGYUZIYOUQUNDAO13",
		pre_event = {
			302
		},
		lock = {
			{
				4,
				302
			}
		}
	},
	[304] = {
		story_type = 1,
		name = "EP4-3 São Martinho's Concern",
		unlock_conditions = "Clear EP4-2",
		change_bgm = "theme-ganjisawai",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 304,
		story = "JUFENGYUZIYOUQUNDAO14",
		pre_event = {
			303
		},
		lock = {
			{
				4,
				303
			}
		}
	},
	[305] = {
		story_type = 1,
		name = "EP5-1 Uninvited Guests II",
		unlock_conditions = "Clear EP4-3",
		change_bgm = "story-tempest-marching",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 305,
		story = "JUFENGYUZIYOUQUNDAO15",
		pre_event = {
			304
		},
		lock = {
			{
				4,
				304
			}
		}
	},
	[306] = {
		story_type = 1,
		name = "EP5-2 Early Morning Wreckages",
		unlock_conditions = "Clear EP5-1",
		change_bgm = "battle-nightmare-theme",
		change_prefab = "",
		change_background = "bg_jufengv3_cg2",
		id = 306,
		story = "JUFENGYUZIYOUQUNDAO16",
		pre_event = {
			305
		},
		lock = {
			{
				4,
				305
			}
		}
	},
	[307] = {
		story_type = 2,
		name = "EP5-3 Impromptu Response",
		unlock_conditions = "Clear EP5-2",
		change_bgm = "theme-ganjisawai",
		change_prefab = "",
		change_background = "star_level_bg_524",
		id = 307,
		story = "1978001",
		pre_event = {
			306
		},
		lock = {
			{
				4,
				306
			}
		}
	},
	[308] = {
		story_type = 1,
		name = "EP6-1 Doubts",
		unlock_conditions = "Clear EP5-3",
		change_bgm = "theme-tempest-light",
		change_prefab = "",
		change_background = "bg_jufengv3_1",
		id = 308,
		story = "JUFENGYUZIYOUQUNDAO18",
		pre_event = {
			307
		},
		lock = {
			{
				4,
				307
			}
		}
	},
	[309] = {
		story_type = 1,
		name = "EP6-2 Searching the Ancient Temple",
		unlock_conditions = "Clear EP6-1",
		change_bgm = "story-tempest-marching",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 309,
		story = "JUFENGYUZIYOUQUNDAO19",
		pre_event = {
			308
		},
		lock = {
			{
				4,
				308
			}
		}
	},
	[310] = {
		story_type = 1,
		name = "EPS-2 Tempestuous Dreams II",
		unlock_conditions = "Clear EP6-2",
		change_bgm = "theme-SeaAndSun-soft",
		change_prefab = "",
		change_background = "star_level_bg_106",
		id = 310,
		story = "JUFENGYUZIYOUQUNDAO20",
		pre_event = {
			309
		},
		lock = {
			{
				4,
				309
			}
		}
	},
	[311] = {
		story_type = 1,
		name = "EPS-3 Reunion",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "theme-tempest-light",
		change_prefab = "",
		change_background = "bg_jufengv3_1",
		id = 311,
		story = "JUFENGYUZIYOUQUNDAO21",
		pre_event = {
			310
		},
		lock = {
			{
				4,
				310
			}
		}
	},
	[312] = {
		story_type = 1,
		name = "EP7-1 Exploring the Metallic Cave",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "story-tempest-marching",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 312,
		story = "JUFENGYUZIYOUQUNDAO22",
		pre_event = {
			311
		},
		lock = {
			{
				4,
				311
			}
		}
	},
	[313] = {
		story_type = 1,
		name = "EP7-2 Tempestuous Dreams III",
		unlock_conditions = "Clear EP7-1.",
		change_bgm = "theme-ganjisawai",
		change_prefab = "",
		change_background = "bg_jufengv3_cg3",
		id = 313,
		story = "JUFENGYUZIYOUQUNDAO23",
		pre_event = {
			312
		},
		lock = {
			{
				4,
				312
			}
		}
	},
	[314] = {
		story_type = 1,
		name = "EP7-3 Searching the Lighthouse II",
		unlock_conditions = "Clear EP7-2.",
		change_bgm = "story-temepest-2",
		change_prefab = "",
		change_background = "bg_jufengv3_2",
		id = 314,
		story = "JUFENGYUZIYOUQUNDAO24",
		pre_event = {
			313
		},
		lock = {
			{
				4,
				313
			}
		}
	},
	[315] = {
		story_type = 2,
		name = "EP7-4 One Strike to Seize Victory",
		unlock_conditions = "Clear EP7-3.",
		change_bgm = "story-tempest-freedom",
		change_prefab = "",
		change_background = "star_level_bg_539",
		id = 315,
		story = "1978002",
		pre_event = {
			314
		},
		lock = {
			{
				4,
				314
			}
		}
	},
	[316] = {
		story_type = 1,
		name = "EP7-5 Libertypolis",
		unlock_conditions = "Clear EP7-4.",
		change_bgm = "theme-ganjisawai",
		change_prefab = "",
		change_background = "star_level_bg_524",
		id = 316,
		story = "JUFENGYUZIYOUQUNDAO26",
		pre_event = {
			315
		},
		lock = {
			{
				4,
				315
			}
		}
	},
	[317] = {
		story_type = 1,
		name = "EX-1 A Priest and The Servant II",
		unlock_conditions = "Clear EP7-5.",
		change_bgm = "theme-tempest-up",
		change_prefab = "",
		change_background = "star_level_bg_163",
		id = 317,
		story = "JUFENGYUZIYOUQUNDAO27",
		pre_event = {
			316
		},
		lock = {
			{
				4,
				316
			}
		}
	},
	[318] = {
		story_type = 1,
		name = "EX-2 Unresolved Questions",
		unlock_conditions = "Clear EX-1",
		change_bgm = "battle-eagleunion",
		change_prefab = "",
		change_background = "bg_story_task_3",
		id = 318,
		story = "JUFENGYUZIYOUQUNDAO28",
		pre_event = {
			317
		},
		lock = {
			{
				4,
				317
			}
		}
	},
	[319] = {
		story_type = 1,
		name = "EX-3 Boundary of Our World",
		unlock_conditions = "Clear EX-2",
		change_bgm = "theme-tempest-light",
		change_prefab = "Map_1970001",
		change_background = "bg_jufengv3_1",
		id = 319,
		story = "JUFENGYUZIYOUQUNDAO29",
		pre_event = {
			318
		},
		lock = {
			{
				4,
				318
			}
		}
	},
	[321] = {
		story_type = 1,
		pre_event = "",
		name = "EPS-1 VOICE#1",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_493",
		story = "YIHAILIUSHENG1",
		change_bgm = "bgm-waterwave",
		id = 321,
		lock = ""
	},
	[322] = {
		story_type = 1,
		name = "EP1-1 VOICE#2",
		unlock_conditions = "Clear EPS-1.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 322,
		story = "YIHAILIUSHENG2",
		pre_event = {
			321
		},
		lock = {
			{
				4,
				321
			},
			{
				3,
				{
					1,
					595,
					0
				}
			}
		}
	},
	[323] = {
		story_type = 1,
		name = "EP1-2 VOICE#3",
		unlock_conditions = "Clear EP1-1.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 323,
		story = "YIHAILIUSHENG3",
		pre_event = {
			322
		},
		lock = {
			{
				4,
				322
			},
			{
				3,
				{
					1,
					595,
					0
				}
			}
		}
	},
	[324] = {
		story_type = 1,
		name = "EP1-3 VOICE#4",
		unlock_conditions = "Clear EP1-2.",
		change_bgm = "bgm-waterwave",
		change_prefab = "juqing_heisewuqi",
		change_background = "star_level_bg_493",
		id = 324,
		story = "YIHAILIUSHENG4",
		pre_event = {
			323
		},
		lock = {
			{
				4,
				323
			},
			{
				3,
				{
					1,
					595,
					200
				}
			}
		}
	},
	[325] = {
		story_type = 1,
		name = "EP1-4 VOICE#5",
		unlock_conditions = "Clear EP1-3.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 325,
		story = "YIHAILIUSHENG5",
		pre_event = {
			324
		},
		lock = {
			{
				4,
				324
			},
			{
				3,
				{
					1,
					595,
					200
				}
			}
		}
	},
	[326] = {
		story_type = 1,
		name = "EPS-2 VOICE#6",
		unlock_conditions = "Clear EP1-4.",
		change_bgm = "bgm-waterwave",
		change_prefab = "juqing_heisewuqi",
		change_background = "star_level_bg_493",
		id = 326,
		story = "YIHAILIUSHENG6",
		pre_event = {
			325
		},
		lock = {
			{
				4,
				325
			},
			{
				3,
				{
					1,
					595,
					350
				}
			}
		}
	},
	[327] = {
		story_type = 1,
		name = "EP2-1 VOICE#7",
		unlock_conditions = "Clear EPS-2.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 327,
		story = "YIHAILIUSHENG7",
		pre_event = {
			326
		},
		lock = {
			{
				4,
				326
			},
			{
				3,
				{
					1,
					595,
					350
				}
			}
		}
	},
	[328] = {
		story_type = 1,
		name = "EP3-1 VOICE#8",
		unlock_conditions = "Clear EP2-1.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 328,
		story = "YIHAILIUSHENG8",
		pre_event = {
			326
		},
		lock = {
			{
				4,
				327
			},
			{
				3,
				{
					1,
					595,
					350
				}
			}
		}
	},
	[329] = {
		story_type = 1,
		name = "EP2-2 VOICE#9",
		unlock_conditions = "Clear EP3-1.",
		change_bgm = "bgm-waterwave",
		change_prefab = "juqing_heisewuqi",
		change_background = "star_level_bg_493",
		id = 329,
		story = "YIHAILIUSHENG9",
		pre_event = {
			327
		},
		lock = {
			{
				4,
				328
			},
			{
				3,
				{
					1,
					595,
					500
				}
			}
		}
	},
	[330] = {
		story_type = 1,
		name = "EP3-2 VOICE#10",
		unlock_conditions = "Clear EP2-2.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 330,
		story = "YIHAILIUSHENG10",
		pre_event = {
			328
		},
		lock = {
			{
				4,
				329
			},
			{
				3,
				{
					1,
					595,
					500
				}
			}
		}
	},
	[331] = {
		story_type = 1,
		name = "EP2-3 VOICE#11",
		unlock_conditions = "Clear EP3-2.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 331,
		story = "YIHAILIUSHENG11",
		pre_event = {
			329
		},
		lock = {
			{
				4,
				330
			},
			{
				3,
				{
					1,
					595,
					500
				}
			}
		}
	},
	[332] = {
		story_type = 1,
		name = "EP3-3 VOICE#12",
		unlock_conditions = "Clear EP2-3.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 332,
		story = "YIHAILIUSHENG12",
		pre_event = {
			330
		},
		lock = {
			{
				4,
				331
			},
			{
				3,
				{
					1,
					595,
					500
				}
			}
		}
	},
	[333] = {
		story_type = 1,
		name = "EP2-4 VOICE#13",
		unlock_conditions = "Clear EP3-3.",
		change_bgm = "bgm-waterwave",
		change_prefab = "juqing_heisewuqi",
		change_background = "star_level_bg_493",
		id = 333,
		story = "YIHAILIUSHENG13",
		pre_event = {
			331
		},
		lock = {
			{
				4,
				332
			},
			{
				3,
				{
					1,
					595,
					650
				}
			}
		}
	},
	[334] = {
		story_type = 1,
		name = "EP3-4 VOICE#14",
		unlock_conditions = "Clear EP2-4.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 334,
		story = "YIHAILIUSHENG14",
		pre_event = {
			332
		},
		lock = {
			{
				4,
				333
			},
			{
				3,
				{
					1,
					595,
					650
				}
			}
		}
	},
	[335] = {
		story_type = 1,
		name = "EP2-5 VOICE#15",
		unlock_conditions = "Clear EP3-4.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 335,
		story = "YIHAILIUSHENG15",
		pre_event = {
			333
		},
		lock = {
			{
				4,
				334
			},
			{
				3,
				{
					1,
					595,
					650
				}
			}
		}
	},
	[336] = {
		story_type = 1,
		name = "EP3-5 VOICE#16",
		unlock_conditions = "Clear EP2-5.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 336,
		story = "YIHAILIUSHENG16",
		pre_event = {
			334
		},
		lock = {
			{
				4,
				335
			},
			{
				3,
				{
					1,
					595,
					650
				}
			}
		}
	},
	[337] = {
		story_type = 1,
		name = "EPS-3 VOICE#17",
		unlock_conditions = "Clear EP3-5.",
		change_bgm = "bgm-waterwave",
		change_prefab = "juqing_heisewuqi",
		change_background = "star_level_bg_493",
		id = 337,
		story = "YIHAILIUSHENG17",
		pre_event = {
			335,
			336
		},
		lock = {
			{
				4,
				336
			},
			{
				3,
				{
					1,
					595,
					1000
				}
			}
		}
	},
	[338] = {
		story_type = 1,
		name = "EPS-4 VOICE#18",
		unlock_conditions = "Clear EPS-3.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 338,
		story = "YIHAILIUSHENG18",
		pre_event = {
			337
		},
		lock = {
			{
				4,
				337
			},
			{
				3,
				{
					1,
					595,
					1000
				}
			}
		}
	},
	[339] = {
		story_type = 1,
		name = "EPS-5 VOICE#19",
		unlock_conditions = "Clear EPS-4.",
		change_bgm = "bgm-waterwave",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 339,
		story = "YIHAILIUSHENG19",
		pre_event = {
			338
		},
		lock = {
			{
				4,
				338
			},
			{
				3,
				{
					1,
					595,
					1000
				}
			}
		}
	},
	[341] = {
		story_type = 1,
		pre_event = "",
		name = "EP1-1 As the Brightness Fades",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "bg_tianqiong_cg0",
		story = "XIANGCHEYUTIANQIONGZHIYIN1",
		change_bgm = "story-memory-grief",
		id = 341,
		lock = ""
	},
	[342] = {
		story_type = 1,
		name = "EP1-2 A Sudden Turn",
		unlock_conditions = "Clear EP1-1",
		change_bgm = "story-dailyfuture-soft",
		change_prefab = "",
		change_background = "bg_port_NY_future",
		id = 342,
		story = "XIANGCHEYUTIANQIONGZHIYIN2",
		pre_event = {
			341
		},
		lock = {
			{
				4,
				341
			}
		}
	},
	[343] = {
		story_type = 1,
		name = "EP2-1 An Old City, an Old Dream",
		unlock_conditions = "Clear EP1-2",
		change_bgm = "theme-weimu",
		change_prefab = "",
		change_background = "star_level_bg_538",
		id = 343,
		story = "XIANGCHEYUTIANQIONGZHIYIN3",
		pre_event = {
			342
		},
		lock = {
			{
				4,
				342
			}
		}
	},
	[344] = {
		story_type = 1,
		name = "EP3-1 Calculated",
		unlock_conditions = "Clear EP2-1",
		change_bgm = "story-dailyfuture-soft",
		change_prefab = "",
		change_background = "bg_port_NY_future",
		id = 344,
		story = "XIANGCHEYUTIANQIONGZHIYIN4",
		pre_event = {
			342
		},
		lock = {
			{
				4,
				343
			}
		}
	},
	[345] = {
		story_type = 1,
		name = "EP2-2 Mass Syncope",
		unlock_conditions = "Clear EP3-1",
		change_bgm = "theme-weimu",
		change_prefab = "",
		change_background = "star_level_bg_598",
		id = 345,
		story = "XIANGCHEYUTIANQIONGZHIYIN5",
		pre_event = {
			343
		},
		lock = {
			{
				4,
				344
			}
		}
	},
	[346] = {
		story_type = 1,
		name = "EP3-2 The 7th Task Force",
		unlock_conditions = "Clear EP2-2",
		change_bgm = "story-dailyfuture-soft",
		change_prefab = "",
		change_background = "star_level_bg_157",
		id = 346,
		story = "XIANGCHEYUTIANQIONGZHIYIN6",
		pre_event = {
			344
		},
		lock = {
			{
				4,
				345
			}
		}
	},
	[347] = {
		story_type = 1,
		name = "EP2-3 Familiar Flavors",
		unlock_conditions = "Clear EP3-2",
		change_bgm = "theme-weimu",
		change_prefab = "",
		change_background = "bg_tianqiong_1",
		id = 347,
		story = "XIANGCHEYUTIANQIONGZHIYIN7",
		pre_event = {
			345
		},
		lock = {
			{
				4,
				346
			}
		}
	},
	[348] = {
		story_type = 1,
		name = "EP3-3 The Leader of the Ashes",
		unlock_conditions = "Clear EP2-3",
		change_bgm = "story-date-light",
		change_prefab = "",
		change_background = "star_level_bg_146",
		id = 348,
		story = "XIANGCHEYUTIANQIONGZHIYIN8",
		pre_event = {
			346
		},
		lock = {
			{
				4,
				347
			}
		}
	},
	[349] = {
		story_type = 1,
		name = "EP2-4 One Step at a Time",
		unlock_conditions = "Clear EP3-3",
		change_bgm = "story-weimu-link",
		change_prefab = "",
		change_background = "bg_tianqiong_2",
		id = 349,
		story = "XIANGCHEYUTIANQIONGZHIYIN9",
		pre_event = {
			347
		},
		lock = {
			{
				4,
				348
			}
		}
	},
	[350] = {
		story_type = 1,
		name = "EP3-4 The Test Site of the Arbiters",
		unlock_conditions = "Clear EP2-4",
		change_bgm = "story-dailyfuture-soft",
		change_prefab = "",
		change_background = "bg_zhedie_2",
		id = 350,
		story = "XIANGCHEYUTIANQIONGZHIYIN10",
		pre_event = {
			348
		},
		lock = {
			{
				4,
				349
			}
		}
	},
	[351] = {
		story_type = 1,
		name = "EP2-5 TORCH",
		unlock_conditions = "Clear EP3-4",
		change_bgm = "battle-boss-ucnf",
		change_prefab = "",
		change_background = "star_level_bg_596",
		id = 351,
		story = "XIANGCHEYUTIANQIONGZHIYIN11",
		pre_event = {
			349
		},
		lock = {
			{
				4,
				350
			}
		}
	},
	[352] = {
		story_type = 2,
		name = "EP3-5 Anomalous Area Investigation",
		unlock_conditions = "Clear EP2-5",
		change_bgm = "main-arbitrationsystem-theme",
		change_prefab = "",
		change_background = "bg_tianqiong_3",
		id = 352,
		story = "1996001",
		pre_event = {
			350
		},
		lock = {
			{
				4,
				351
			}
		}
	},
	[353] = {
		story_type = 1,
		name = "EPS-1 Transboundary Experiment #3",
		unlock_conditions = "Clear EP3-5",
		change_bgm = "story-date-light",
		change_prefab = "",
		change_background = "bg_tianqiong_4",
		id = 353,
		story = "XIANGCHEYUTIANQIONGZHIYIN13",
		pre_event = {
			351,
			352
		},
		lock = {
			{
				4,
				352
			}
		}
	},
	[354] = {
		story_type = 1,
		name = "EP4-1 Journey",
		unlock_conditions = "Clear EPS-1",
		change_bgm = "story-dailyfuture-upspeed",
		change_prefab = "",
		change_background = "bg_logo_oxs",
		id = 354,
		story = "XIANGCHEYUTIANQIONGZHIYIN14",
		pre_event = {
			353
		},
		lock = {
			{
				4,
				353
			}
		}
	},
	[355] = {
		story_type = 1,
		name = "EP4-2 Colette",
		unlock_conditions = "Clear EP4-1",
		change_bgm = "story-dailyfuture-upspeed",
		change_prefab = "",
		change_background = "bg_aostelab_2",
		id = 355,
		story = "XIANGCHEYUTIANQIONGZHIYIN15",
		pre_event = {
			354
		},
		lock = {
			{
				4,
				354
			}
		}
	},
	[356] = {
		story_type = 1,
		name = "EP4-3 Aoste and Eutopia",
		unlock_conditions = "Clear EP4-2",
		change_bgm = "story-dailyfuture-upspeed",
		change_prefab = "",
		change_background = "star_level_bg_490",
		id = 356,
		story = "XIANGCHEYUTIANQIONGZHIYIN16",
		pre_event = {
			355
		},
		lock = {
			{
				4,
				355
			}
		}
	},
	[357] = {
		story_type = 1,
		name = "EP4-4 Ryouko Amahara",
		unlock_conditions = "Clear EP4-3",
		change_bgm = "story-date-light",
		change_prefab = "",
		change_background = "star_level_bg_570",
		id = 357,
		story = "XIANGCHEYUTIANQIONGZHIYIN17",
		pre_event = {
			356
		},
		lock = {
			{
				4,
				356
			}
		}
	},
	[358] = {
		story_type = 1,
		name = "EP4-5 Anzeel",
		unlock_conditions = "Clear EP4-4",
		change_bgm = "story-weimu-link",
		change_prefab = "",
		change_background = "star_level_bg_544",
		id = 358,
		story = "XIANGCHEYUTIANQIONGZHIYIN18",
		pre_event = {
			357
		},
		lock = {
			{
				4,
				357
			}
		}
	},
	[359] = {
		story_type = 1,
		name = "EP4-6 Sophia",
		unlock_conditions = "Clear EP4-5",
		change_bgm = "story-weimu-link",
		change_prefab = "",
		change_background = "star_level_bg_580",
		id = 359,
		story = "XIANGCHEYUTIANQIONGZHIYIN19",
		pre_event = {
			358
		},
		lock = {
			{
				4,
				358
			}
		}
	},
	[360] = {
		story_type = 1,
		name = "EP4-7 Resolve",
		unlock_conditions = "Clear EP4-6",
		change_bgm = "theme-uc",
		change_prefab = "",
		change_background = "bg_cccpv2_7",
		id = 360,
		story = "XIANGCHEYUTIANQIONGZHIYIN20",
		pre_event = {
			359
		},
		lock = {
			{
				4,
				359
			}
		}
	},
	[361] = {
		story_type = 1,
		name = "EP4-8 The Council's Meeting",
		unlock_conditions = "Clear EP4-7",
		change_bgm = "story-memory-grief",
		change_prefab = "",
		change_background = "bg_tianqiong_4",
		id = 361,
		story = "XIANGCHEYUTIANQIONGZHIYIN21",
		pre_event = {
			360
		},
		lock = {
			{
				4,
				360
			}
		}
	},
	[362] = {
		story_type = 1,
		name = "EP4-9 Frequency",
		unlock_conditions = "Clear EP4-8",
		change_bgm = "theme-helena",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 362,
		story = "XIANGCHEYUTIANQIONGZHIYIN22",
		pre_event = {
			361
		},
		lock = {
			{
				4,
				361
			}
		}
	},
	[363] = {
		story_type = 1,
		name = "EPS-2 A Decision Made",
		unlock_conditions = "Clear EP4-9",
		change_bgm = "theme-helena",
		change_prefab = "",
		change_background = "bg_port_NY_future",
		id = 363,
		story = "XIANGCHEYUTIANQIONGZHIYIN23",
		pre_event = {
			362
		},
		lock = {
			{
				4,
				362
			}
		}
	},
	[364] = {
		story_type = 3,
		name = "EPS-2-A Choice - Perfect Future",
		unlock_conditions = "？",
		change_bgm = "story-weimu-link",
		change_prefab = "",
		change_background = "star_level_bg_493",
		id = 364,
		story = "XIANGCHEYUTIANQIONGZHIYIN23-1",
		pre_event = {
			363
		},
		lock = {
			{
				5,
				363,
				100
			}
		}
	},
	[365] = {
		story_type = 3,
		name = "EPS-2-B Choice - Wake Up",
		unlock_conditions = "？",
		change_bgm = "theme-weimu",
		change_prefab = "",
		change_background = "bg_starsea_core_3",
		id = 365,
		story = "XIANGCHEYUTIANQIONGZHIYIN23-2",
		pre_event = {
			363
		},
		lock = {
			{
				5,
				363,
				200
			}
		}
	},
	[366] = {
		story_type = 1,
		name = "EP5-1 Back to Normal?",
		unlock_conditions = "Clear EPS-2",
		change_bgm = "theme-weimu",
		change_prefab = "map_1990001",
		change_background = "bg_tianqiong_1",
		id = 366,
		story = "XIANGCHEYUTIANQIONGZHIYIN24",
		pre_event = {
			365
		},
		lock = {
			{
				4,
				365
			}
		}
	},
	[371] = {
		story_type = 1,
		pre_event = "",
		name = "EP5-2 Test Site Theta",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_596",
		story = "XIANGCHEYUTIANQIONGZHIYIN25",
		change_bgm = "story-commander-up",
		id = 371,
		lock = ""
	},
	[372] = {
		story_type = 1,
		name = "EP6-1 Gathering of Allies",
		unlock_conditions = "Clear EP5-2",
		change_bgm = "battle-ucnf",
		change_prefab = "",
		change_background = "star_level_bg_306",
		id = 372,
		story = "XIANGCHEYUTIANQIONGZHIYIN26",
		pre_event = {
			371
		},
		lock = {
			{
				4,
				371
			},
			{
				3,
				{
					1,
					610,
					0
				}
			}
		}
	},
	[373] = {
		story_type = 1,
		name = "EP6-2 Rescue from the Flames",
		unlock_conditions = "Clear EP6-1",
		change_bgm = "theme-uc",
		change_prefab = "",
		change_background = "star_level_bg_306",
		id = 373,
		story = "XIANGCHEYUTIANQIONGZHIYIN27",
		pre_event = {
			372
		},
		lock = {
			{
				4,
				372
			},
			{
				3,
				{
					1,
					610,
					0
				}
			}
		}
	},
	[374] = {
		story_type = 1,
		name = "EP6-3 Together We Stand",
		unlock_conditions = "Clear EP6-2",
		change_bgm = "theme-marcopolo",
		change_prefab = "juqing_heisewuqi",
		change_background = "bg_tianqiong_cg5",
		id = 374,
		story = "XIANGCHEYUTIANQIONGZHIYIN28",
		pre_event = {
			373
		},
		lock = {
			{
				4,
				373
			},
			{
				3,
				{
					1,
					610,
					200
				}
			}
		}
	},
	[375] = {
		story_type = 1,
		name = "EP6-4 Mysterious Support",
		unlock_conditions = "Clear EP6-3",
		change_bgm = "story-antix-past",
		change_prefab = "",
		change_background = "bg_tianqiong_5",
		id = 375,
		story = "XIANGCHEYUTIANQIONGZHIYIN29",
		pre_event = {
			374
		},
		lock = {
			{
				4,
				374
			},
			{
				3,
				{
					1,
					610,
					200
				}
			}
		}
	},
	[376] = {
		story_type = 1,
		name = "EP6-5 The Reset Protocol",
		unlock_conditions = "Clear EP6-4",
		change_bgm = "story-commander-up",
		change_prefab = "",
		change_background = "bg_tianqiong_cg7",
		id = 376,
		story = "XIANGCHEYUTIANQIONGZHIYIN30",
		pre_event = {
			374
		},
		lock = {
			{
				4,
				375
			},
			{
				3,
				{
					1,
					610,
					200
				}
			}
		}
	},
	[377] = {
		story_type = 1,
		name = "EP7-1 Commence Operation",
		unlock_conditions = "Clear EP6-5",
		change_bgm = "theme-starbeast",
		change_prefab = "juqing_heisewuqi",
		change_background = "bg_tianqiong_cg8",
		id = 377,
		story = "XIANGCHEYUTIANQIONGZHIYIN31",
		pre_event = {
			375,
			376
		},
		lock = {
			{
				4,
				376
			},
			{
				3,
				{
					1,
					610,
					350
				}
			}
		}
	},
	[378] = {
		story_type = 2,
		name = "EP7-2 The Framework's Battle",
		unlock_conditions = "Clear EP7-1",
		change_bgm = "theme-weimu",
		change_prefab = "",
		change_background = "star_level_bg_596",
		id = 378,
		story = "1996002",
		pre_event = {
			377
		},
		lock = {
			{
				4,
				377
			},
			{
				3,
				{
					1,
					610,
					350
				}
			}
		}
	},
	[379] = {
		story_type = 2,
		name = "EP7-3 The Ashes of the Present",
		unlock_conditions = "Clear EP7-2",
		change_bgm = "theme-frederick",
		change_prefab = "",
		change_background = "star_level_bg_596",
		id = 379,
		story = "1996003",
		pre_event = {
			377
		},
		lock = {
			{
				4,
				378
			},
			{
				3,
				{
					1,
					610,
					350
				}
			}
		}
	},
	[380] = {
		story_type = 2,
		name = "EP7-4 Blueprint Shipgirls",
		unlock_conditions = "Clear EP7-3",
		change_bgm = "theme-brokenworld-sad",
		change_prefab = "",
		change_background = "star_level_bg_596",
		id = 380,
		story = "1996004",
		pre_event = {
			377
		},
		lock = {
			{
				4,
				379
			},
			{
				3,
				{
					1,
					610,
					350
				}
			}
		}
	},
	[381] = {
		story_type = 2,
		name = "EP7-5 Crossing Thoughts",
		unlock_conditions = "Clear EP7-4",
		change_bgm = "story-dailyfuture-soft",
		change_prefab = "juqing_heisewuqi",
		change_background = "star_level_bg_596",
		id = 381,
		story = "1996005",
		pre_event = {
			378,
			379,
			380
		},
		lock = {
			{
				4,
				380
			},
			{
				3,
				{
					1,
					610,
					500
				}
			}
		}
	},
	[382] = {
		story_type = 2,
		name = "EP7-6 Something Not So Important",
		unlock_conditions = "Clear EP7-5",
		change_bgm = "battle-thechariotVII",
		change_prefab = "",
		change_background = "bg_tianqiong_5",
		id = 382,
		story = "1996006",
		pre_event = {
			381
		},
		lock = {
			{
				4,
				381
			},
			{
				3,
				{
					1,
					610,
					500
				}
			}
		}
	},
	[383] = {
		story_type = 2,
		name = "EP7-7 The Battle Within the Veil",
		unlock_conditions = "Clear EP7-6",
		change_bgm = "story-weimu-link",
		change_prefab = "",
		change_background = "bg_tianqiong_cg11",
		id = 383,
		story = "1996007",
		pre_event = {
			381
		},
		lock = {
			{
				4,
				382
			},
			{
				3,
				{
					1,
					610,
					500
				}
			}
		}
	},
	[384] = {
		story_type = 1,
		name = "EP8-1 A Note Through the Firmament",
		unlock_conditions = "Clear EP7-7",
		change_bgm = "theme-helena",
		change_prefab = "juqing_heisewuqi",
		change_background = "star_level_bg_594",
		id = 384,
		story = "XIANGCHEYUTIANQIONGZHIYIN38",
		pre_event = {
			382,
			383
		},
		lock = {
			{
				4,
				383
			},
			{
				3,
				{
					1,
					610,
					650
				}
			}
		}
	},
	[385] = {
		story_type = 1,
		name = "EP8-2 The Second Parting",
		unlock_conditions = "Clear EP8-1",
		change_bgm = "story-weimu-link",
		change_prefab = "",
		change_background = "bg_tianqiong_1",
		id = 385,
		story = "XIANGCHEYUTIANQIONGZHIYIN39",
		pre_event = {
			384
		},
		lock = {
			{
				4,
				384
			},
			{
				3,
				{
					1,
					610,
					650
				}
			}
		}
	},
	[386] = {
		story_type = 1,
		name = "EP8-3 Past, Present, and Future",
		unlock_conditions = "Clear EP8-2",
		change_bgm = "story-weimu-link",
		change_prefab = "",
		change_background = "bg_tianqiong_cg13",
		id = 386,
		story = "XIANGCHEYUTIANQIONGZHIYIN40",
		pre_event = {
			385
		},
		lock = {
			{
				4,
				385
			},
			{
				3,
				{
					1,
					610,
					650
				}
			}
		}
	},
	[387] = {
		story_type = 1,
		name = "EX-1 The Tower, Reversed",
		unlock_conditions = "Clear EP8-3",
		change_bgm = "Battle-newwind",
		change_prefab = "juqing_heisewuqi",
		change_background = "bg_tianqiong_cg17",
		id = 387,
		story = "XIANGCHEYUTIANQIONGZHIYIN41",
		pre_event = {
			386
		},
		lock = {
			{
				4,
				386
			},
			{
				3,
				{
					1,
					610,
					1000
				}
			}
		}
	},
	[388] = {
		story_type = 1,
		name = "EX-2 A New Era",
		unlock_conditions = "Clear EX-1",
		change_bgm = "battle-deepecho",
		change_prefab = "",
		change_background = "star_level_bg_544",
		id = 388,
		story = "XIANGCHEYUTIANQIONGZHIYIN42",
		pre_event = {
			387
		},
		lock = {
			{
				4,
				387
			},
			{
				3,
				{
					1,
					610,
					1000
				}
			}
		}
	},
	[389] = {
		story_type = 1,
		name = "EX-3 Ripples",
		unlock_conditions = "Clear EX-2",
		change_bgm = "theme-weimu",
		change_prefab = "",
		change_background = "bg_tianqiong_1",
		id = 389,
		story = "XIANGCHEYUTIANQIONGZHIYIN43",
		pre_event = {
			388
		},
		lock = {
			{
				4,
				388
			},
			{
				3,
				{
					1,
					610,
					1000
				}
			}
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		23,
		31,
		32,
		33,
		34,
		35,
		36,
		37,
		38,
		39,
		40,
		41,
		42,
		43,
		44,
		45,
		46,
		47,
		48,
		49,
		50,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		58,
		59,
		60,
		61,
		62,
		63,
		64,
		65,
		66,
		67,
		68,
		69,
		70,
		71,
		72,
		73,
		74,
		75,
		76,
		77,
		78,
		79,
		80,
		81,
		82,
		83,
		84,
		85,
		86,
		87,
		88,
		89,
		90,
		91,
		92,
		93,
		94,
		95,
		96,
		97,
		98,
		99,
		100,
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		110,
		111,
		112,
		113,
		114,
		115,
		116,
		117,
		118,
		119,
		120,
		121,
		122,
		123,
		124,
		125,
		126,
		127,
		128,
		129,
		130,
		131,
		132,
		133,
		134,
		135,
		136,
		137,
		138,
		139,
		141,
		142,
		143,
		144,
		145,
		146,
		147,
		148,
		149,
		150,
		151,
		152,
		153,
		154,
		155,
		156,
		157,
		158,
		159,
		160,
		161,
		162,
		163,
		164,
		165,
		166,
		167,
		168,
		169,
		170,
		171,
		172,
		173,
		174,
		175,
		176,
		181,
		182,
		183,
		184,
		185,
		186,
		187,
		188,
		191,
		192,
		193,
		194,
		195,
		196,
		197,
		198,
		199,
		200,
		201,
		202,
		203,
		204,
		205,
		206,
		207,
		208,
		209,
		210,
		211,
		212,
		213,
		214,
		215,
		216,
		217,
		218,
		219,
		220,
		221,
		222,
		223,
		224,
		225,
		226,
		231,
		232,
		233,
		234,
		235,
		236,
		237,
		238,
		239,
		240,
		241,
		242,
		243,
		244,
		245,
		246,
		247,
		248,
		249,
		250,
		251,
		252,
		253,
		254,
		255,
		256,
		257,
		258,
		259,
		260,
		261,
		262,
		263,
		264,
		265,
		266,
		267,
		268,
		269,
		271,
		272,
		273,
		274,
		275,
		276,
		277,
		278,
		279,
		280,
		281,
		282,
		283,
		284,
		285,
		291,
		292,
		293,
		294,
		295,
		296,
		297,
		298,
		299,
		300,
		301,
		302,
		303,
		304,
		305,
		306,
		307,
		308,
		309,
		310,
		311,
		312,
		313,
		314,
		315,
		316,
		317,
		318,
		319,
		321,
		322,
		323,
		324,
		325,
		326,
		327,
		328,
		329,
		330,
		331,
		332,
		333,
		334,
		335,
		336,
		337,
		338,
		339,
		341,
		342,
		343,
		344,
		345,
		346,
		347,
		348,
		349,
		350,
		351,
		352,
		353,
		354,
		355,
		356,
		357,
		358,
		359,
		360,
		361,
		362,
		363,
		364,
		365,
		366,
		371,
		372,
		373,
		374,
		375,
		376,
		377,
		378,
		379,
		380,
		381,
		382,
		383,
		384,
		385,
		386,
		387,
		388,
		389
	}
}
