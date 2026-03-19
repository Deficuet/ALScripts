pg = pg or {}
pg.child2_ending = {
	{
		pic = "bg_project_oceana_cg23",
		name = "继续升学",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA32",
		id = 1,
		pic_preview = "oceana_ending1",
		condition_desc = {
			{
				{
					300041
				},
				"完成养成计划"
			}
		},
		condition = {
			"&&",
			{
				300041
			}
		}
	},
	{
		pic = "bg_project_oceana_cg24",
		name = "甜品能手",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA33",
		id = 2,
		pic_preview = "oceana_ending2",
		condition_desc = {
			{
				{
					300001
				},
				"总属性>2000"
			},
			{
				{
					300002
				},
				"性格-乖巧"
			}
		},
		condition = {
			"&&",
			{
				300001,
				300002
			}
		}
	},
	{
		pic = "bg_project_oceana_cg25",
		name = "调酒师",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA34",
		id = 3,
		pic_preview = "oceana_ending3",
		condition_desc = {
			{
				{
					300001
				},
				"总属性>2000"
			},
			{
				{
					300003
				},
				"性格-叛逆"
			}
		},
		condition = {
			"&&",
			{
				300001,
				300003
			}
		}
	},
	{
		pic = "bg_project_oceana_cg26",
		name = "自然摄影",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA35",
		id = 4,
		pic_preview = "oceana_ending4",
		condition_desc = {
			{
				{
					300004
				},
				"性格-乖巧>80"
			}
		},
		condition = {
			"&&",
			{
				300004
			}
		}
	},
	{
		pic = "bg_project_oceana_cg27",
		name = "爆破大师",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA36",
		id = 5,
		pic_preview = "oceana_ending5",
		condition_desc = {
			{
				{
					300005
				},
				"性格-叛逆>80"
			}
		},
		condition = {
			"&&",
			{
				300005
			}
		}
	},
	{
		pic = "bg_project_oceana_cg28",
		name = "心理咨询师",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA37",
		id = 6,
		pic_preview = "oceana_ending6",
		condition_desc = {
			{
				{
					300027
				},
				"知识>6000"
			},
			{
				{
					300023
				},
				"完成特殊结局事件"
			}
		},
		condition = {
			"&&",
			{
				300027,
				300023
			}
		}
	},
	{
		pic = "bg_project_oceana_cg29",
		name = "安全专家",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA38",
		id = 7,
		pic_preview = "oceana_ending7",
		condition_desc = {
			{
				{
					300028
				},
				"实践>7200"
			}
		},
		condition = {
			"&&",
			{
				300028
			}
		}
	},
	{
		pic = "bg_project_oceana_cg30",
		name = "露营指导",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA39",
		id = 8,
		pic_preview = "oceana_ending8",
		condition_desc = {
			{
				{
					300029
				},
				"感知>6000"
			},
			{
				{
					300024
				},
				"外出旅游次数>=20"
			}
		},
		condition = {
			"&&",
			{
				300029,
				300024
			}
		}
	},
	{
		pic = "bg_project_oceana_cg31",
		name = "摩托骑士",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA40",
		id = 9,
		pic_preview = "oceana_ending9",
		condition_desc = {
			{
				{
					300030
				},
				"体能>6000"
			},
			{
				{
					300022
				},
				"完成特殊结局事件"
			}
		},
		condition = {
			"&&",
			{
				300030,
				300022
			}
		}
	},
	{
		pic = "bg_project_oceana_cg32",
		name = "宠物医生",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA41",
		id = 10,
		pic_preview = "oceana_ending10",
		condition_desc = {
			{
				{
					300033
				},
				"知识>4000"
			},
			{
				{
					300031
				},
				"总属性>10000"
			}
		},
		condition = {
			"&&",
			{
				300033,
				300031
			}
		}
	},
	{
		pic = "bg_project_oceana_cg33",
		name = "摇滚歌手",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA42",
		id = 11,
		pic_preview = "oceana_ending11",
		condition_desc = {
			{
				{
					300034
				},
				"体能>4000"
			},
			{
				{
					300031
				},
				"总属性>10000"
			}
		},
		condition = {
			"&&",
			{
				300034,
				300031
			}
		}
	},
	{
		pic = "bg_project_oceana_cg34",
		name = "闪耀明星",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA43",
		id = 12,
		pic_preview = "oceana_ending12",
		condition_desc = {
			{
				{
					300035
				},
				"感知>4000"
			},
			{
				{
					300031
				},
				"总属性>10000"
			}
		},
		condition = {
			"&&",
			{
				300035,
				300031
			}
		}
	},
	{
		pic = "bg_project_oceana_cg35",
		name = "见习护士",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA44",
		id = 13,
		pic_preview = "oceana_ending13",
		condition_desc = {
			{
				{
					300036
				},
				"实践>1600"
			},
			{
				{
					300032
				},
				"总属性>4000"
			},
			{
				{
					300003
				},
				"性格-叛逆"
			}
		},
		condition = {
			"&&",
			{
				300036,
				300032,
				300003
			}
		}
	},
	{
		pic = "bg_project_oceana_cg36",
		name = "动物园园长",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA45",
		id = 14,
		pic_preview = "oceana_ending14",
		condition_desc = {
			{
				{
					300037
				},
				"感知>1600"
			},
			{
				{
					300032
				},
				"总属性>4000"
			}
		},
		condition = {
			"&&",
			{
				300037,
				300032
			}
		}
	},
	{
		pic = "bg_project_oceana_cg37",
		name = "修理达人",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA46",
		id = 15,
		pic_preview = "oceana_ending15",
		condition_desc = {
			{
				{
					300038
				},
				"体能>1600"
			},
			{
				{
					300032
				},
				"总属性>4000"
			}
		},
		condition = {
			"&&",
			{
				300038,
				300032
			}
		}
	},
	[101] = {
		pic = "bg_project_explorer_cg32",
		name = "毕业升学之时",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA31",
		id = 101,
		pic_preview = "explorer_ending1",
		condition_desc = {
			{
				{
					99801
				},
				"完成养成计划"
			}
		},
		condition = {
			"&&",
			{
				3800101
			}
		}
	},
	[102] = {
		pic = "bg_project_explorer_cg15",
		name = "专属生活顾问",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA32",
		id = 102,
		pic_preview = "explorer_ending2",
		condition_desc = {
			{
				{
					99801
				},
				"总属性>3000"
			}
		},
		condition = {
			"&&",
			{
				3800201
			}
		}
	},
	[103] = {
		pic = "bg_project_explorer_cg14",
		name = "高定裁缝",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA33",
		id = 103,
		pic_preview = "explorer_ending3",
		condition_desc = {
			{
				{
					99801
				},
				"总属性>6000"
			}
		},
		condition = {
			"&&",
			{
				3800301
			}
		}
	},
	[104] = {
		pic = "bg_project_explorer_cg20",
		name = "美食主播",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA34",
		id = 104,
		pic_preview = "explorer_ending4",
		condition_desc = {
			{
				{
					99801
				},
				"性格-外向"
			},
			{
				{
					99801
				},
				"总属性>4000"
			}
		},
		condition = {
			"&&",
			{
				3800401,
				3800402
			}
		}
	},
	[105] = {
		pic = "bg_project_explorer_cg23",
		name = "轻小说写手",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA35",
		id = 105,
		pic_preview = "explorer_ending5",
		condition_desc = {
			{
				{
					99801
				},
				"性格-内向"
			},
			{
				{
					99801
				},
				"总属性>4000"
			}
		},
		condition = {
			"&&",
			{
				3800501,
				3800502
			}
		}
	},
	[106] = {
		pic = "bg_project_explorer_cg18",
		name = "新闻记者",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA36",
		id = 106,
		pic_preview = "explorer_ending14",
		condition_desc = {
			{
				{
					99801
				},
				"性格-外向>80"
			}
		},
		condition = {
			"&&",
			{
				3800601
			}
		}
	},
	[107] = {
		pic = "bg_project_explorer_cg11",
		name = "玩偶扮演",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA37",
		id = 107,
		pic_preview = "explorer_ending15",
		condition_desc = {
			{
				{
					99801
				},
				"性格-内向>80"
			}
		},
		condition = {
			"&&",
			{
				3800701
			}
		}
	},
	[108] = {
		pic = "bg_project_explorer_cg16",
		name = "花店店长",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA38",
		id = 108,
		pic_preview = "explorer_ending6",
		condition_desc = {
			{
				{
					99801
				},
				"知识>4000"
			},
			{
				{
					99801
				},
				"总属性>12000"
			}
		},
		condition = {
			"&&",
			{
				3800801,
				3800802
			}
		}
	},
	[109] = {
		pic = "bg_project_explorer_cg19",
		name = "旅游达人",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA39",
		id = 109,
		pic_preview = "explorer_ending11",
		condition_desc = {
			{
				{
					99801
				},
				"外出旅游次数>=20"
			}
		},
		condition = {
			"&&",
			{
				3800901
			}
		}
	},
	[110] = {
		pic = "bg_project_explorer_cg17",
		name = "钓鱼能手",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA40",
		id = 110,
		pic_preview = "explorer_ending8",
		condition_desc = {
			{
				{
					99801
				},
				"体能>4000"
			},
			{
				{
					99801
				},
				"总属性>12000"
			}
		},
		condition = {
			"&&",
			{
				3801001,
				3801002
			}
		}
	},
	[111] = {
		pic = "bg_project_explorer_cg22",
		name = "咖啡师",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA41",
		id = 111,
		pic_preview = "explorer_ending7",
		condition_desc = {
			{
				{
					99801
				},
				"实践>4000"
			},
			{
				{
					99801
				},
				"总属性>12000"
			}
		},
		condition = {
			"&&",
			{
				3801101,
				3801102
			}
		}
	},
	[112] = {
		pic = "bg_project_explorer_cg21",
		name = "街头占卜师",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA42",
		id = 112,
		pic_preview = "explorer_ending9",
		condition_desc = {
			{
				{
					99801
				},
				"感知>4000"
			},
			{
				{
					99801
				},
				"总属性>12000"
			}
		},
		condition = {
			"&&",
			{
				3801201,
				3801202
			}
		}
	},
	[113] = {
		pic = "bg_project_explorer_cg12",
		name = "书店店员",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA43",
		id = 113,
		pic_preview = "explorer_ending10",
		condition_desc = {
			{
				{
					99801
				},
				"生活体验次数>=20"
			}
		},
		condition = {
			"&&",
			{
				3801301
			}
		}
	},
	[114] = {
		pic = "bg_project_explorer_cg13",
		name = "钢琴演奏家",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA44",
		id = 114,
		pic_preview = "explorer_ending12",
		condition_desc = {
			{
				{
					99801
				},
				"完成三个对应特殊结局事件"
			}
		},
		condition = {
			"||",
			{
				3801401,
				3801402,
				3801403,
				3801404,
				3801405,
				3801406
			}
		}
	},
	[115] = {
		pic = "bg_project_explorer_cg10",
		name = "标本师",
		character = 2,
		performance = "TANSUOZHEYANGCHENGJIHUA45",
		id = 115,
		pic_preview = "explorer_ending13",
		condition_desc = {
			{
				{
					99801
				},
				"完成三个对应特殊结局事件"
			}
		},
		condition = {
			"||",
			{
				3801501,
				3801502,
				3801503,
				3801504,
				3801505,
				3801506
			}
		}
	},
	get_id_list_by_character = {
		{
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
			15
		},
		{
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
			115
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
		115
	}
}
