pg = pg or {}
pg.activity_clue_group = rawget(pg, "activity_clue_group") or setmetatable({
	__name = "activity_clue_group"
}, confNEO)
pg.activity_clue_group.__namecode__ = true
pg.activity_clue_group.all = {
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
	24,
	25,
	26,
	27,
	28,
	29,
	30,
	31,
	32,
	33,
	34,
	35
}
pg.base = pg.base or {}
pg.base.activity_clue_group = {}

;(function()
	pg.base.activity_clue_group[1] = {
		title = "深谷病院·上",
		type = 1,
		id = 1,
		task_id = "21613",
		pic = "1",
		unlock_jump = {
			{
				2009
			},
			{}
		}
	}
	pg.base.activity_clue_group[2] = {
		title = "深谷病院·下",
		type = 1,
		id = 2,
		task_id = "21613",
		pic = "2",
		unlock_jump = {
			{
				2009
			},
			{}
		}
	}
	pg.base.activity_clue_group[3] = {
		title = "诊疗中心",
		type = 1,
		id = 3,
		task_id = "21613",
		pic = "3",
		unlock_jump = {
			{
				2013
			},
			{}
		}
	}
	pg.base.activity_clue_group[4] = {
		title = "医生办公室",
		type = 1,
		id = 4,
		task_id = "21612",
		pic = "4",
		unlock_jump = {
			{
				2013
			},
			{
				201301,
				201302,
				201303,
				201319
			}
		}
	}
	pg.base.activity_clue_group[5] = {
		title = "诊疗中心(地下)",
		type = 1,
		id = 5,
		task_id = "21612",
		pic = "5",
		unlock_jump = {
			{
				2013
			},
			{
				201301,
				201302,
				201303,
				201309
			}
		}
	}
	pg.base.activity_clue_group[6] = {
		title = "住院大楼",
		type = 1,
		id = 6,
		task_id = "21606",
		pic = "6",
		unlock_jump = {
			{
				2009
			},
			{
				201301,
				201304
			}
		}
	}
	pg.base.activity_clue_group[7] = {
		title = "护士站",
		type = 1,
		id = 7,
		task_id = "21606",
		pic = "7",
		unlock_jump = {
			{
				2009
			},
			{
				201301,
				201303,
				201310
			}
		}
	}
	pg.base.activity_clue_group[8] = {
		title = "病房",
		type = 1,
		id = 8,
		task_id = "21606",
		pic = "8",
		unlock_jump = {
			{
				2009
			},
			{
				201301,
				201302,
				201311
			}
		}
	}
	pg.base.activity_clue_group[9] = {
		title = "住院大楼(地下)",
		type = 1,
		id = 9,
		task_id = "21607",
		pic = "9",
		unlock_jump = {
			{
				2009
			},
			{
				201301,
				201303,
				201309
			}
		}
	}
	pg.base.activity_clue_group[10] = {
		title = "研究中心",
		type = 1,
		id = 10,
		task_id = "21609",
		pic = "10",
		unlock_jump = {
			{
				2012
			},
			{
				201301,
				201307
			}
		}
	}
	pg.base.activity_clue_group[11] = {
		title = "研究中心(地下)",
		type = 1,
		id = 11,
		task_id = "21610",
		pic = "11",
		unlock_jump = {
			{
				2012
			},
			{
				201301,
				201302,
				201303,
				201314
			}
		}
	}
	pg.base.activity_clue_group[12] = {
		title = "疗养中心",
		type = 1,
		id = 12,
		task_id = "21607",
		pic = "12",
		unlock_jump = {
			{
				2010
			},
			{
				201301,
				201305
			}
		}
	}
	pg.base.activity_clue_group[13] = {
		title = "疗养中心(地下)",
		type = 1,
		id = 13,
		task_id = "21607",
		pic = "13",
		unlock_jump = {
			{
				2010
			},
			{
				201301,
				201302,
				201303,
				201309
			}
		}
	}
	pg.base.activity_clue_group[14] = {
		title = "后勤中心",
		type = 1,
		id = 14,
		task_id = "21608",
		pic = "14",
		unlock_jump = {
			{
				2011
			},
			{
				201301,
				201303
			}
		}
	}
	pg.base.activity_clue_group[15] = {
		title = "后勤中心(地下)",
		type = 1,
		id = 15,
		task_id = "21608",
		pic = "15",
		unlock_jump = {
			{
				2011
			},
			{
				201301,
				201309
			}
		}
	}
	pg.base.activity_clue_group[16] = {
		title = "停车场",
		type = 1,
		id = 16,
		task_id = "21610",
		pic = "16",
		unlock_jump = {
			{
				2012
			},
			{
				201301,
				201307,
				201316
			}
		}
	}
	pg.base.activity_clue_group[17] = {
		title = "停车场(地下)",
		type = 1,
		id = 17,
		task_id = "21610",
		pic = "17",
		unlock_jump = {
			{
				2012
			},
			{
				201301,
				201302,
				201307,
				201317
			}
		}
	}
	pg.base.activity_clue_group[18] = {
		title = "门卫亭",
		type = 1,
		id = 18,
		task_id = "21611",
		pic = "18",
		unlock_jump = {
			{
				2012
			},
			{
				201301,
				201307,
				201318
			}
		}
	}
	pg.base.activity_clue_group[19] = {
		title = "古典长廊",
		type = 1,
		id = 19,
		task_id = "21612",
		pic = "19",
		unlock_jump = {
			{
				2013
			},
			{
				201301,
				201302,
				201303,
				201308
			}
		}
	}
	pg.base.activity_clue_group[20] = {
		title = "庭院",
		type = 1,
		id = 20,
		task_id = "21609",
		pic = "20",
		unlock_jump = {
			{
				2011
			},
			{
				201301,
				201302,
				201303,
				201313
			}
		}
	}
	pg.base.activity_clue_group[21] = {
		title = "樱花树",
		type = 1,
		id = 21,
		task_id = "21609",
		pic = "21",
		unlock_jump = {
			{
				2011
			},
			{
				201301,
				201302,
				201303,
				201306
			}
		}
	}
	pg.base.activity_clue_group[22] = {
		title = "小树林",
		type = 1,
		id = 22,
		task_id = "21608",
		pic = "22",
		unlock_jump = {
			{
				2010
			},
			{
				201301,
				201302,
				201303,
				201312
			}
		}
	}
	pg.base.activity_clue_group[23] = {
		title = "正门",
		type = 1,
		id = 23,
		task_id = "21611",
		pic = "23",
		unlock_jump = {
			{
				2012
			},
			{
				201301,
				201315
			}
		}
	}
	pg.base.activity_clue_group[24] = {
		title = "后门",
		type = 1,
		id = 24,
		task_id = "21611",
		pic = "24",
		unlock_jump = {
			{
				2013
			},
			{
				201301,
				201302,
				201303,
				201320
			}
		}
	}
	pg.base.activity_clue_group[25] = {
		title = "莫加多尔",
		type = 2,
		id = 25,
		task_id = "21614",
		pic = "25",
		unlock_jump = {
			{
				2005
			},
			{}
		}
	}
	pg.base.activity_clue_group[26] = {
		title = "富兰克林",
		type = 2,
		id = 26,
		task_id = "21615",
		pic = "26",
		unlock_jump = {
			{
				2009
			},
			{
				201301
			}
		}
	}
	pg.base.activity_clue_group[27] = {
		title = "华盛顿",
		type = 2,
		id = 27,
		task_id = "21616",
		pic = "27",
		unlock_jump = {
			{
				2009
			},
			{
				201301,
				201302,
				201303,
				201304
			}
		}
	}
	pg.base.activity_clue_group[28] = {
		title = "{namecode:59}",
		type = 2,
		id = 28,
		task_id = "21617",
		pic = "28",
		unlock_jump = {
			{
				2010
			},
			{
				201301
			}
		}
	}
	pg.base.activity_clue_group[29] = {
		title = "伏罗希洛夫",
		type = 2,
		id = 29,
		task_id = "21618",
		pic = "29",
		unlock_jump = {
			{
				2010
			},
			{
				201301,
				201302,
				201303,
				201305
			}
		}
	}
	pg.base.activity_clue_group[30] = {
		title = "鹰",
		type = 2,
		id = 30,
		task_id = "21619",
		pic = "30",
		unlock_jump = {
			{
				2011
			},
			{
				201302,
				201303
			}
		}
	}
	pg.base.activity_clue_group[31] = {
		title = "神速",
		type = 2,
		id = 31,
		task_id = "21620",
		pic = "31",
		unlock_jump = {
			{
				2011
			},
			{
				201301
			}
		}
	}
	pg.base.activity_clue_group[32] = {
		title = "圣塔菲",
		type = 2,
		id = 32,
		task_id = "21621",
		pic = "32",
		unlock_jump = {
			{
				2012
			},
			{
				201307
			}
		}
	}
	pg.base.activity_clue_group[33] = {
		title = "米勒",
		type = 2,
		id = 33,
		task_id = "21622",
		pic = "33",
		unlock_jump = {
			{
				2012
			},
			{
				201301,
				201307,
				201302,
				201303
			}
		}
	}
	pg.base.activity_clue_group[34] = {
		title = "哈尔福德",
		type = 2,
		id = 34,
		task_id = "21623",
		pic = "34",
		unlock_jump = {
			{
				2001
			},
			{}
		}
	}
	pg.base.activity_clue_group[35] = {
		title = "{namecode:91}",
		type = 2,
		id = 35,
		task_id = "21624",
		pic = "35",
		unlock_jump = {
			{
				2009
			},
			{}
		}
	}
end)()
