pg = pg or {}
pg.activity_series_enemy = rawget(pg, "activity_series_enemy") or setmetatable({
	__name = "activity_series_enemy"
}, confNEO)
pg.activity_series_enemy.all = {
	1001,
	1002,
	1003,
	1004,
	1005,
	2001,
	2002,
	2003,
	2004,
	2005,
	3001,
	3002,
	3003,
	3004,
	3005,
	4001,
	4002,
	4011,
	4012,
	4021,
	4022,
	4031,
	4032,
	4041,
	4042,
	4051,
	4052,
	5001,
	5002,
	5003,
	5004,
	5005,
	6001,
	6002,
	6003,
	6004,
	6005,
	1001001,
	1001002,
	1001003,
	1002001,
	1002002,
	1002003
}
pg.base = pg.base or {}
pg.base.activity_series_enemy = {}

;(function()
	pg.base.activity_series_enemy[1001] = {
		pre_chapter = 0,
		name = "压制：格陵兰 ",
		chapter_name = "TC1",
		type = 1,
		pos_x = "0.10703125",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.157291667",
		whether_singlefight = 0,
		collection_group_id = 104,
		ex_count = "",
		oil = 0,
		profiles = "任务目标：压制塞壬格陵兰要塞，解除清除者对极地海域的电磁压制，为全局战场提供支援。 ",
		id = 1001,
		limitation = {},
		expedition_id = {
			1719101
		},
		boss_icon = {
			{
				"qinraozhe",
				2
			}
		},
		pass_awards_display = {
			{
				1,
				487,
				2
			},
			{
				1,
				488,
				40
			},
			{
				2,
				58839
			},
			{
				2,
				59001
			},
			{
				2,
				54012
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[1002] = {
		pre_chapter = 1001,
		name = "夺回：北地群岛",
		chapter_name = "TC2",
		type = 1,
		pos_x = "0.34609375",
		count = 0,
		collection_group_id = 105,
		pos_y = "0.347916667",
		whether_singlefight = 1,
		id = 1002,
		ex_count = "",
		oil = 0,
		profiles = "任务目标：夺回曾经的前进基地，如今的塞壬北地群岛要塞，削弱清除者对于极地的控制力。 ",
		limitation = {},
		expedition_id = {
			1719201,
			1719202
		},
		boss_icon = {
			{
				"qinraozhe",
				2
			},
			{
				"qingchuzhe",
				5
			}
		},
		pass_awards_display = {
			{
				1,
				487,
				5
			},
			{
				1,
				488,
				140
			},
			{
				2,
				58838
			},
			{
				2,
				59001
			},
			{
				2,
				54017
			}
		},
		additional_awards_display = {
			{
				1,
				488,
				25
			},
			{
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[1003] = {
		pre_chapter = 1002,
		name = "侦察：北极点",
		chapter_name = "TC3",
		type = 1,
		pos_x = "0.50546875",
		count = 0,
		collection_group_id = 106,
		pos_y = "0.080208333",
		whether_singlefight = 1,
		id = 1003,
		ex_count = "",
		oil = 0,
		profiles = "任务目标：对塞壬北极点要塞进行抵近侦察，尽可能收集数据以协助对于清除者战略意图的研究。 ",
		limitation = {},
		expedition_id = {
			1719301,
			1719302,
			1719303
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"kuersike",
				3
			},
			{
				"qingchuzhe",
				5
			}
		},
		pass_awards_display = {
			{
				1,
				487,
				8
			},
			{
				1,
				488,
				360
			},
			{
				2,
				58837
			},
			{
				2,
				59001
			},
			{
				2,
				54017
			}
		},
		additional_awards_display = {
			{
				1,
				488,
				60
			},
			{
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
	pg.base.activity_series_enemy[1004] = {
		pre_chapter = 1003,
		name = "突破：楚科奇海 ",
		chapter_name = "SP",
		type = 2,
		pos_x = "0.60546875",
		count = 1,
		additional_awards_display = "",
		pos_y = "0.446875",
		whether_singlefight = 0,
		collection_group_id = 107,
		ex_count = "",
		oil = 0,
		profiles = "任务目标：突破塞壬尚未完工的楚科奇海要塞防线，并摧毁清除者位于该处的气象武器基地。 ",
		id = 1004,
		limitation = {},
		expedition_id = {
			1719401,
			1719402,
			1719403,
			1719404
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"fuluoxiluofu",
				2
			},
			{
				"saiwasituoboer",
				5
			},
			{
				"qingchuzhe",
				5
			}
		},
		pass_awards_display = {
			{
				1,
				487,
				12
			},
			{
				1,
				488,
				800
			},
			{
				2,
				58836
			},
			{
				2,
				59001
			},
			{
				2,
				54016
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			40,
			16
		}
	}
	pg.base.activity_series_enemy[1005] = {
		pre_chapter = 1004,
		name = "牵制：王冠",
		chapter_name = "EX",
		type = 3,
		pos_x = "0.6265625",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.15625",
		whether_singlefight = 0,
		collection_group_id = 0,
		pass_awards_display = "",
		oil = 0,
		profiles = "任务目标：牵制位于“王冠”的塞壬舰队，吸引清除者的舰队主力，减轻其他战线的作战压力。 ",
		id = 1005,
		limitation = {},
		expedition_id = {
			1719501,
			1719502,
			1719503,
			1719504,
			1719505
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"kuersike",
				3
			},
			{
				"fuluoxiluofu",
				2
			},
			{
				"saiwasituoboer",
				5
			},
			{
				"qingchuzhe",
				5
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		},
		ex_count = {
			8000,
			20,
			0.2,
			1000,
			0.8
		}
	}
	pg.base.activity_series_enemy[2001] = {
		pre_chapter = 0,
		name = "理性办公楼",
		chapter_name = "简单",
		type = 1,
		pos_x = "0.10703125",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.157291667",
		whether_singlefight = 0,
		collection_group_id = 104,
		ex_count = "",
		oil = 0,
		profiles = "「欢迎来到理性办公楼。」\n「愿你在这里度过便捷高效的一天。」\n「愿你不为光阴所扰。」\n「愿童心永驻。」",
		id = 2001,
		limitation = {},
		expedition_id = {
			1819101
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			}
		},
		pass_awards_display = {
			{
				1,
				421,
				1
			},
			{
				2,
				200174,
				1
			},
			{
				2,
				59001,
				1
			},
			{
				2,
				54012,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[2002] = {
		pre_chapter = 2001,
		name = "童心教学楼",
		chapter_name = "普通",
		type = 1,
		pos_x = "0.34609375",
		count = 0,
		collection_group_id = 105,
		pos_y = "0.347916667",
		whether_singlefight = 1,
		id = 2002,
		ex_count = "",
		oil = 0,
		profiles = "「欢迎来到童心教学楼。」\n「愿你在这里度过无忧无虑的一天。」\n「愿你畅游知识海洋。」\n「愿童心永驻。」",
		limitation = {},
		expedition_id = {
			1819201,
			1819202
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			},
			{
				"youeryuan_boss03",
				7
			}
		},
		pass_awards_display = {
			{
				1,
				421,
				1
			},
			{
				2,
				200175,
				1
			},
			{
				2,
				59001,
				1
			},
			{
				2,
				54017,
				1
			}
		},
		additional_awards_display = {
			{
				1,
				421,
				1
			},
			{
				1,
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[2003] = {
		pre_chapter = 2002,
		name = "童趣艺术楼",
		chapter_name = "困难",
		type = 1,
		pos_x = "0.50546875",
		count = 0,
		collection_group_id = 106,
		pos_y = "0.080208333",
		whether_singlefight = 1,
		id = 2003,
		ex_count = "",
		oil = 0,
		profiles = "「欢迎来到童趣艺体楼。」\n「愿你在这里度过丰富多彩的一天。」\n「愿你坚持心中所向。」\n「愿童心永驻。」",
		limitation = {},
		expedition_id = {
			1819301,
			1819302,
			1819303
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			},
			{
				"youeryuan_boss03",
				7
			},
			{
				"youeryuan_boss04",
				3
			}
		},
		pass_awards_display = {
			{
				1,
				421,
				1
			},
			{
				2,
				200176,
				1
			},
			{
				2,
				59001,
				1
			},
			{
				2,
				54017,
				1
			}
		},
		additional_awards_display = {
			{
				1,
				421,
				1
			},
			{
				1,
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
	pg.base.activity_series_enemy[2004] = {
		pre_chapter = 2003,
		name = "健康活力操场",
		chapter_name = "SP",
		type = 2,
		pos_x = "0.60546875",
		count = 1,
		collection_group_id = 107,
		pos_y = "0.446875",
		whether_singlefight = 0,
		id = 2004,
		ex_count = "",
		oil = 0,
		profiles = "「欢迎来到健康活力操场。」\n「愿你在这里度过朝气蓬勃的一天。」\n「愿你活力满满」\n「愿童心永驻。」",
		limitation = {},
		expedition_id = {
			1819401,
			1819402,
			1819403,
			1819404
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			},
			{
				"youeryuan_boss03",
				7
			},
			{
				"youeryuan_boss04",
				3
			},
			{
				"youeryuan_boss01",
				1
			}
		},
		pass_awards_display = {
			{
				1,
				421,
				1
			},
			{
				2,
				200177,
				1
			},
			{
				2,
				59001,
				1
			},
			{
				2,
				54016,
				1
			}
		},
		additional_awards_display = {
			{
				1,
				421,
				1
			},
			{
				1,
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			40,
			16
		}
	}
	pg.base.activity_series_enemy[2005] = {
		pre_chapter = 2004,
		name = "童真森林",
		chapter_name = "EX",
		type = 3,
		pos_x = "0.6265625",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.15625",
		whether_singlefight = 0,
		collection_group_id = 0,
		pass_awards_display = "",
		oil = 0,
		profiles = "「欢迎来到童真森林。」\n「愿你在这里度过自由美好的一天。」\n「愿你亲近自然。」\n「愿童心永驻。」",
		id = 2005,
		limitation = {},
		expedition_id = {
			1819501,
			1819502,
			1819503,
			1819504,
			1819505
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			},
			{
				"youeryuan_boss03",
				7
			},
			{
				"youeryuan_boss04",
				3
			},
			{
				"youeryuan_boss01",
				1
			},
			{
				"youeryuan_boss02",
				2
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		},
		ex_count = {
			8000,
			20,
			0.2,
			1000,
			0.8
		}
	}
	pg.base.activity_series_enemy[3001] = {
		pre_chapter = 0,
		name = "拍摄地：主干道",
		chapter_name = "简单",
		type = 1,
		pos_x = "0.10703125",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.157291667",
		whether_singlefight = 0,
		collection_group_id = 104,
		ex_count = "",
		oil = 0,
		profiles = "【拍摄地：主干道】主要用于拍摄飙车的片段，偶尔也会上演激烈的枪战——只要握紧油门，道路就会不断延伸。",
		id = 3001,
		limitation = {},
		expedition_id = {
			1930101
		},
		boss_icon = {
			{
				"u37_3",
				8
			}
		},
		pass_awards_display = {
			{
				1,
				516,
				40
			},
			{
				2,
				200480,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54012,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[3002] = {
		pre_chapter = 3001,
		name = "拍摄地：商业街",
		chapter_name = "普通",
		type = 1,
		pos_x = "0.34609375",
		count = 0,
		collection_group_id = 105,
		pos_y = "0.347916667",
		whether_singlefight = 1,
		id = 3002,
		ex_count = "",
		oil = 0,
		profiles = "【拍摄地：商业街】主要用于拍摄美食与逛街的片段，偶尔也会布置成惊险的凶杀现场——美食戏是好文明，请多来一些。",
		limitation = {},
		expedition_id = {
			1930201,
			1930202
		},
		boss_icon = {
			{
				"u37_3",
				8
			},
			{
				"wuqi_3",
				18
			}
		},
		pass_awards_display = {
			{
				1,
				516,
				140
			},
			{
				2,
				200481,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54017,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				516,
				25
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[3003] = {
		pre_chapter = 3002,
		name = "拍摄地：轨道车",
		chapter_name = "困难",
		type = 1,
		pos_x = "0.50546875",
		count = 0,
		collection_group_id = 106,
		pos_y = "0.080208333",
		whether_singlefight = 1,
		id = 3003,
		ex_count = "",
		oil = 0,
		profiles = "【拍摄地：轨道车】主要用于拍摄旅行与风光的片段，偶尔也会有刺激的拆弹环节——红色和蓝色，选你喜欢的剪吧。",
		limitation = {},
		expedition_id = {
			1930301,
			1930302,
			1930303
		},
		boss_icon = {
			{
				"u37_3",
				8
			},
			{
				"u552_2",
				8
			},
			{
				"zengkehaijunshangjiang_2",
				4
			}
		},
		pass_awards_display = {
			{
				1,
				516,
				360
			},
			{
				2,
				200482,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54017,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				516,
				60
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
	pg.base.activity_series_enemy[3004] = {
		pre_chapter = 3003,
		name = "拍摄地：闹市区",
		chapter_name = "S.P",
		type = 2,
		pos_x = "0.60546875",
		count = 1,
		additional_awards_display = "",
		pos_y = "0.446875",
		whether_singlefight = 0,
		collection_group_id = 107,
		ex_count = "",
		oil = 0,
		profiles = "【拍摄地：闹市区】主要用于拍摄日常的片段，偶尔也会来段紧张的追踪戏——收手吧，外面都是警察。",
		id = 3004,
		limitation = {},
		expedition_id = {
			1930401,
			1930402,
			1930403,
			1930404
		},
		boss_icon = {
			{
				"haiwangxing_4",
				2
			},
			{
				"z13_2",
				1
			},
			{
				"zengkehaijunshangjiang_2",
				4
			},
			{
				"wuqi_3",
				18
			}
		},
		pass_awards_display = {
			{
				1,
				516,
				800
			},
			{
				2,
				200483,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54016,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			40,
			16
		}
	}
	pg.base.activity_series_enemy[3005] = {
		pre_chapter = 3004,
		name = "拍摄地：警视厅",
		chapter_name = "E.X",
		type = 3,
		pos_x = "0.6265625",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.15625",
		whether_singlefight = 0,
		collection_group_id = 0,
		pass_awards_display = "",
		oil = 0,
		profiles = "【拍摄地：警视厅】主要用于拍摄刑侦与审讯的片段，偶尔也会上演诡谲的谍战——你是卧底吗？",
		id = 3005,
		limitation = {},
		expedition_id = {
			1930501,
			1930502,
			1930503,
			1930504,
			1930505
		},
		boss_icon = {
			{
				"z13_2",
				1
			},
			{
				"u552_2",
				8
			},
			{
				"zengkehaijunshangjiang_2",
				4
			},
			{
				"haiwangxing_4",
				2
			},
			{
				"diguo_3",
				7
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		},
		ex_count = {
			8000,
			20,
			0.2,
			1000,
			0.8
		}
	}
	pg.base.activity_series_enemy[4001] = {
		pre_chapter = 0,
		name = "普通难度（LV 20）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4001,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-1】虚像塔周边突现时空异常海域，带领白鹰舰队展开武装侦察。",
		limitation = {},
		expedition_id = {
			1980001,
			1980002
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				30
			},
			{
				1,
				587,
				11
			},
			{
				2,
				200619,
				0
			},
			{
				2,
				54012,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				5
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4002] = {
		pre_chapter = 0,
		name = "困难难度（LV 35）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4002,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-1】虚像塔周边突现时空异常海域，带领白鹰舰队展开武装侦察。",
		limitation = {},
		expedition_id = {
			1980101,
			1980102
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				40
			},
			{
				1,
				587,
				11
			},
			{
				2,
				200625,
				0
			},
			{
				2,
				54012,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				10
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4011] = {
		pre_chapter = 0,
		name = "普通难度（LV 50）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4011,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-2】战役已经开始，与鸢尾舰队和东煌舰队一同清理这片区域。 ",
		limitation = {},
		expedition_id = {
			1981007,
			1981011,
			1981003
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_3",
				2
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				60
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200620,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				15
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4012] = {
		pre_chapter = 0,
		name = "困难难度（LV 65）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4012,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-2】战役已经开始，与鸢尾舰队和东煌舰队一同清理这片区域。 ",
		limitation = {},
		expedition_id = {
			1982007,
			1982011,
			1982003
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_3",
				2
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				80
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200626,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				20
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4021] = {
		pre_chapter = 0,
		name = "普通难度（LV 50）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4021,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-3】战役已经开始，与铁血舰队和撒丁舰队一同清理这片区域。 ",
		limitation = {},
		expedition_id = {
			1981008,
			1981012,
			1981004
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_4",
				12
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				60
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200621,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				15
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4022] = {
		pre_chapter = 0,
		name = "困难难度（LV 65）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4022,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-3】战役已经开始，与铁血舰队和撒丁舰队一同清理这片区域。 ",
		limitation = {},
		expedition_id = {
			1982008,
			1982012,
			1982004
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_4",
				12
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				80
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200627,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				20
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4031] = {
		pre_chapter = 0,
		name = "普通难度（LV 50）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4031,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-4】战役已经开始，与皇家舰队和北联舰队一同清理这片区域。",
		limitation = {},
		expedition_id = {
			1981009,
			1981013,
			1981005
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_5",
				3
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				60
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200622,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				15
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4032] = {
		pre_chapter = 0,
		name = "困难难度（LV 65）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4032,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-4】战役已经开始，与皇家舰队和北联舰队一同清理这片区域。",
		limitation = {},
		expedition_id = {
			1982009,
			1982013,
			1982005
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_5",
				3
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				80
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200628,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				20
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4041] = {
		pre_chapter = 0,
		name = "普通难度（LV 50）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4041,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-5】战役已经开始，与重樱舰队和郁金舰队一同清理这片区域。",
		limitation = {},
		expedition_id = {
			1981010,
			1981014,
			1981006
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_6",
				13
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				60
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200623,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				15
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4042] = {
		pre_chapter = 0,
		name = "困难难度（LV 65）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4042,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-5】战役已经开始，与重樱舰队和郁金舰队一同清理这片区域。",
		limitation = {},
		expedition_id = {
			1982010,
			1982014,
			1982006
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"weixu_baojian_2",
				2
			},
			{
				"weixu_baojian_6",
				13
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				80
			},
			{
				1,
				587,
				14
			},
			{
				2,
				200629,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				59001,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				20
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[4051] = {
		pre_chapter = 0,
		name = "普通难度（LV 80）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4051,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-6】决战之时已到，带领港区联合舰队击破梦魇迷宫。",
		limitation = {},
		expedition_id = {
			1983001,
			1983002,
			1983003,
			1983004
		},
		boss_icon = {
			{
				"weixu_baojian_3",
				2
			},
			{
				"weixu_baojian_5",
				3
			},
			{
				"weixu_baojian_6",
				13
			},
			{
				"weixu_baojian_7",
				6
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				120
			},
			{
				1,
				587,
				16
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				200624,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200631,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				25
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			22,
			15
		}
	}
	pg.base.activity_series_enemy[4052] = {
		pre_chapter = 0,
		name = "困难难度（LV 100）",
		chapter_name = "无用",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 0,
		pos_y = "0",
		whether_singlefight = 1,
		id = 4052,
		ex_count = "",
		oil = 0,
		profiles = "【AREA-6】决战之时已到，带领港区联合舰队击破梦魇迷宫。",
		limitation = {},
		expedition_id = {
			1984001,
			1984002,
			1984003,
			1984004
		},
		boss_icon = {
			{
				"weixu_baojian_3",
				2
			},
			{
				"weixu_baojian_5",
				3
			},
			{
				"weixu_baojian_6",
				13
			},
			{
				"weixu_baojian_7",
				6
			}
		},
		pass_awards_display = {
			{
				1,
				588,
				160
			},
			{
				1,
				587,
				16
			},
			{
				2,
				200633,
				0
			},
			{
				2,
				200630,
				0
			},
			{
				2,
				54017,
				0
			},
			{
				2,
				200632,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				588,
				30
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
	pg.base.activity_series_enemy[5001] = {
		pre_chapter = 0,
		name = "蝶舞之约",
		chapter_name = "简单",
		type = 1,
		pos_x = "0",
		count = 0,
		additional_awards_display = "",
		pos_y = "0",
		whether_singlefight = 0,
		collection_group_id = 104,
		ex_count = "",
		oil = 0,
		profiles = "薄纱的轻盈浪漫，\n勾勒甜蜜的邀约。\n缎带上的蝴蝶，\n在束缚与自由间翩跹。",
		id = 5001,
		limitation = {},
		expedition_id = {
			1999101
		},
		boss_icon = {
			{
				"aerbeituo_2",
				2
			}
		},
		pass_awards_display = {
			{
				1,
				616,
				40
			},
			{
				2,
				200676,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54012,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[5002] = {
		pre_chapter = 5001,
		name = "暖绒奇境",
		chapter_name = "普通",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 105,
		pos_y = "0",
		whether_singlefight = 1,
		id = 5002,
		ex_count = "",
		oil = 0,
		profiles = "丝绒垂落，\n与拼接的棱角相拥。\n温暖的奇境中，\n一段柔美自成天地。",
		limitation = {},
		expedition_id = {
			1999201,
			1999202
		},
		boss_icon = {
			{
				"alabama_3",
				5
			},
			{
				"wugelini_2",
				1
			}
		},
		pass_awards_display = {
			{
				1,
				616,
				140
			},
			{
				2,
				200675,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54017,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				616,
				25
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[5003] = {
		pre_chapter = 5002,
		name = "心之窗",
		chapter_name = "困难",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 106,
		pos_y = "0",
		whether_singlefight = 1,
		id = 5003,
		ex_count = "",
		oil = 0,
		profiles = "针织的誓言，\n在每一次呼吸间沉浮。\n黑色的流线剪开白幕，\n成为透见光的窗。",
		limitation = {},
		expedition_id = {
			1999301,
			1999302,
			1999303
		},
		boss_icon = {
			{
				"aerbeituo_2",
				2
			},
			{
				"gaoxiong_7",
				3
			},
			{
				"fulangxisike_2",
				5
			}
		},
		pass_awards_display = {
			{
				1,
				616,
				360
			},
			{
				2,
				200674,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54017,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				616,
				60
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
	pg.base.activity_series_enemy[5004] = {
		pre_chapter = 5003,
		name = "纯白之心",
		chapter_name = "S.P",
		type = 2,
		pos_x = "0",
		count = 1,
		additional_awards_display = "",
		pos_y = "0",
		whether_singlefight = 0,
		collection_group_id = 107,
		ex_count = "",
		oil = 0,
		profiles = "荡开月白的丝绸，\n浮着珍珠的碎光。\n遮与露的间隙里，\n有纯洁与魅惑的弦歌。",
		id = 5004,
		limitation = {},
		expedition_id = {
			1999401,
			1999402,
			1999403,
			1999404
		},
		boss_icon = {
			{
				"aerbeituo_2",
				2
			},
			{
				"wugelini_2",
				1
			},
			{
				"fulangxisike_2",
				5
			},
			{
				"alabama_3",
				5
			}
		},
		pass_awards_display = {
			{
				1,
				616,
				800
			},
			{
				2,
				200673,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54016,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			40,
			16
		}
	}
	pg.base.activity_series_enemy[5005] = {
		pre_chapter = 5004,
		name = "夜阑私语",
		chapter_name = "E.X",
		type = 3,
		pos_x = "0",
		count = 0,
		additional_awards_display = "",
		pos_y = "0",
		whether_singlefight = 0,
		collection_group_id = 0,
		pass_awards_display = "",
		oil = 0,
		profiles = "缎面沉入黑暗，\n灼热的纹理相互纠缠。\n静夜的私语，\n在克制与放纵间摇曳。",
		id = 5005,
		limitation = {},
		expedition_id = {
			1999501,
			1999502,
			1999503,
			1999504,
			1999505
		},
		boss_icon = {
			{
				"aerbeituo_2",
				2
			},
			{
				"wugelini_2",
				1
			},
			{
				"fulangxisike_2",
				5
			},
			{
				"alabama_3",
				5
			},
			{
				"gaoxiong_7",
				3
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		},
		ex_count = {
			8000,
			20,
			0.2,
			1000,
			0.8
		}
	}
	pg.base.activity_series_enemy[6001] = {
		pre_chapter = 0,
		name = "单人病房",
		chapter_name = "简单",
		type = 1,
		pos_x = "0",
		count = 0,
		additional_awards_display = "",
		pos_y = "0",
		whether_singlefight = 0,
		collection_group_id = 104,
		ex_count = "",
		oil = 0,
		profiles = "最普通不过的单人病房，配有柔和的灯光与整洁的床铺，但门锁始终紧闭。",
		id = 6001,
		limitation = {},
		expedition_id = {
			2049101
		},
		boss_icon = {
			{
				"sali_2",
				3
			}
		},
		pass_awards_display = {
			{
				1,
				736,
				40
			},
			{
				2,
				200821,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54012,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[6002] = {
		pre_chapter = 6001,
		name = "ICU病房",
		chapter_name = "普通",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 105,
		pos_y = "0",
		whether_singlefight = 1,
		id = 6002,
		ex_count = "",
		oil = 0,
		profiles = "重症患者专用的ICU病房，闲人止步。",
		limitation = {},
		expedition_id = {
			2049201,
			2049202
		},
		boss_icon = {
			{
				"sali_2",
				3
			},
			{
				"gelifen_2",
				1
			}
		},
		pass_awards_display = {
			{
				1,
				736,
				140
			},
			{
				2,
				200822,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54017,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				736,
				25
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[6003] = {
		pre_chapter = 6002,
		name = "护士办公室",
		chapter_name = "困难",
		type = 1,
		pos_x = "0",
		count = 0,
		collection_group_id = 106,
		pos_y = "0",
		whether_singlefight = 1,
		id = 6003,
		ex_count = "",
		oil = 0,
		profiles = "护士们日常起居的地方，高度危险。",
		limitation = {},
		expedition_id = {
			2049301,
			2049302,
			2049303
		},
		boss_icon = {
			{
				"gelifen_2",
				1
			},
			{
				"z11_3",
				1
			},
			{
				"pulimaosi_3",
				2
			}
		},
		pass_awards_display = {
			{
				1,
				736,
				360
			},
			{
				2,
				200823,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54017,
				0
			}
		},
		additional_awards_display = {
			{
				1,
				736,
				60
			},
			{
				1,
				1,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
	pg.base.activity_series_enemy[6004] = {
		pre_chapter = 6003,
		name = "地下室",
		chapter_name = "S.P",
		type = 2,
		pos_x = "0",
		count = 1,
		additional_awards_display = "",
		pos_y = "0",
		whether_singlefight = 0,
		collection_group_id = 107,
		ex_count = "",
		oil = 0,
		profiles = "白夜山庄的地下区域，隐没在主建筑之下，埋藏着许多无人知晓的秘密。",
		id = 6004,
		limitation = {},
		expedition_id = {
			2049401,
			2049402,
			2049403,
			2049404
		},
		boss_icon = {
			{
				"z11_3",
				1
			},
			{
				"pulimaosi_3",
				2
			},
			{
				"gelifen_2",
				1
			},
			{
				"gangyishawa_3",
				24
			}
		},
		pass_awards_display = {
			{
				1,
				736,
				800
			},
			{
				2,
				200824,
				0
			},
			{
				2,
				59001,
				0
			},
			{
				2,
				54016,
				0
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			40,
			16
		}
	}
	pg.base.activity_series_enemy[6005] = {
		pre_chapter = 6004,
		name = "停机坪",
		chapter_name = "E.X",
		type = 3,
		pos_x = "0",
		count = 0,
		additional_awards_display = "",
		pos_y = "0",
		whether_singlefight = 0,
		collection_group_id = 0,
		pass_awards_display = "",
		oil = 0,
		profiles = "白夜山庄地处偏僻，交通闭塞，直升机成了少数能快速出入此地的方式。",
		id = 6005,
		limitation = {},
		expedition_id = {
			2049501,
			2049502,
			2049503,
			2049504,
			2049505
		},
		boss_icon = {
			{
				"z11_3",
				1
			},
			{
				"pulimaosi_3",
				2
			},
			{
				"sali_2",
				3
			},
			{
				"gangyishawa_3",
				24
			},
			{
				"huali_2",
				2
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		},
		ex_count = {
			8000,
			20,
			0.2,
			1000,
			0.8
		}
	}
	pg.base.activity_series_enemy[1001001] = {
		pre_chapter = 0,
		name = "压制：格陵兰 ",
		chapter_name = "TC1",
		type = 1,
		pos_x = "0.10703125",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.157291667",
		whether_singlefight = 0,
		collection_group_id = 104,
		ex_count = "",
		oil = 0,
		profiles = "任务目标：压制塞壬格陵兰要塞，解除清除者对极地海域的电磁压制，为全局战场提供支援。 ",
		id = 1001001,
		limitation = {},
		expedition_id = {
			1719101
		},
		boss_icon = {
			{
				"qinraozhe",
				2
			}
		},
		pass_awards_display = {
			{
				2,
				58839
			},
			{
				2,
				59001
			},
			{
				2,
				54012
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[1001002] = {
		pre_chapter = 1001001,
		name = "夺回：北地群岛",
		chapter_name = "TC2",
		type = 1,
		pos_x = "0.34609375",
		count = 0,
		collection_group_id = 105,
		pos_y = "0.347916667",
		whether_singlefight = 1,
		id = 1001002,
		ex_count = "",
		oil = 0,
		profiles = "任务目标：夺回曾经的前进基地，如今的塞壬北地群岛要塞，削弱清除者对于极地的控制力。 ",
		limitation = {},
		expedition_id = {
			1719201,
			1719202
		},
		boss_icon = {
			{
				"qinraozhe",
				2
			},
			{
				"qingchuzhe",
				5
			}
		},
		pass_awards_display = {
			{
				2,
				58838
			},
			{
				2,
				59001
			},
			{
				2,
				54017
			}
		},
		additional_awards_display = {
			{
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[1001003] = {
		pre_chapter = 1001002,
		name = "侦察：北极点",
		chapter_name = "TC3",
		type = 1,
		pos_x = "0.50546875",
		count = 0,
		collection_group_id = 106,
		pos_y = "0.080208333",
		whether_singlefight = 1,
		id = 1001003,
		ex_count = "",
		oil = 0,
		profiles = "任务目标：对塞壬北极点要塞进行抵近侦察，尽可能收集数据以协助对于清除者战略意图的研究。 ",
		limitation = {},
		expedition_id = {
			1719301,
			1719302,
			1719303
		},
		boss_icon = {
			{
				"qinraozhe_IV",
				2
			},
			{
				"kuersike",
				3
			},
			{
				"qingchuzhe",
				5
			}
		},
		pass_awards_display = {
			{
				2,
				58837
			},
			{
				2,
				59001
			},
			{
				2,
				54017
			}
		},
		additional_awards_display = {
			{
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
	pg.base.activity_series_enemy[1002001] = {
		pre_chapter = 0,
		name = "理性办公楼",
		chapter_name = "简单",
		type = 1,
		pos_x = "0.10703125",
		count = 0,
		additional_awards_display = "",
		pos_y = "0.157291667",
		whether_singlefight = 0,
		collection_group_id = 104,
		ex_count = "",
		oil = 0,
		profiles = "「欢迎来到理性办公楼。」\n「愿你在这里度过便捷高效的一天。」\n「愿你不为光阴所扰。」\n「愿童心永驻。」",
		id = 1002001,
		limitation = {},
		expedition_id = {
			1819101
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			}
		},
		pass_awards_display = {
			{
				2,
				200174
			},
			{
				2,
				59001
			},
			{
				2,
				54012
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[1002002] = {
		pre_chapter = 1002001,
		name = "童心教学楼",
		chapter_name = "普通",
		type = 1,
		pos_x = "0.34609375",
		count = 0,
		collection_group_id = 105,
		pos_y = "0.347916667",
		whether_singlefight = 1,
		id = 1002002,
		ex_count = "",
		oil = 0,
		profiles = "「欢迎来到童心教学楼。」\n「愿你在这里度过无忧无虑的一天。」\n「愿你畅游知识海洋。」\n「愿童心永驻。」",
		limitation = {},
		expedition_id = {
			1819201,
			1819202
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			},
			{
				"youeryuan_boss03",
				7
			}
		},
		pass_awards_display = {
			{
				2,
				200175
			},
			{
				2,
				59001
			},
			{
				2,
				54017
			}
		},
		additional_awards_display = {
			{
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			0,
			0
		}
	}
	pg.base.activity_series_enemy[1002003] = {
		pre_chapter = 1002002,
		name = "童趣艺术楼",
		chapter_name = "困难",
		type = 1,
		pos_x = "0.50546875",
		count = 0,
		collection_group_id = 106,
		pos_y = "0.080208333",
		whether_singlefight = 1,
		id = 1002003,
		ex_count = "",
		oil = 0,
		profiles = "「欢迎来到童趣艺体楼。」\n「愿你在这里度过丰富多彩的一天。」\n「愿你坚持心中所向。」\n「愿童心永驻。」",
		limitation = {},
		expedition_id = {
			1819301,
			1819302,
			1819303
		},
		boss_icon = {
			{
				"youeryuan_boss05",
				5
			},
			{
				"youeryuan_boss03",
				7
			},
			{
				"youeryuan_boss04",
				3
			}
		},
		pass_awards_display = {
			{
				2,
				200176
			},
			{
				2,
				59001
			},
			{
				2,
				54017
			}
		},
		additional_awards_display = {
			{
				1,
				1
			}
		},
		defeat_story = {},
		defeat_story_count = {},
		use_oil_limit = {
			25,
			16
		}
	}
end)()
