pg = pg or {}
pg.story_template = rawget(pg, "story_template") or setmetatable({
	__name = "story_template"
}, confNEO)
pg.story_template.all = {
	4342,
	4343,
	4344,
	4350,
	4351,
	4352,
	4353,
	4354,
	4355,
	4356,
	4368,
	4369,
	4370,
	4371,
	4372,
	4373,
	4374,
	6180,
	6181,
	6182,
	6183,
	6184,
	6959,
	6969,
	6976,
	6979,
	7922
}
pg.base = pg.base or {}
pg.base.story_template = {}

;(function()
	pg.base.story_template[4342] = {
		icon = "story-doujichang",
		name = "E0-1",
		id = 4342,
		drop_client = "",
		story = "YUZHEDETIANPING2",
		pos = {
			0.5,
			0.3
		}
	}
	pg.base.story_template[4343] = {
		icon = "story-doujichang",
		name = "E0-2",
		id = 4343,
		drop_client = "",
		story = "YUZHEDETIANPING3",
		pos = {
			0.5,
			0.3
		}
	}
	pg.base.story_template[4344] = {
		icon = "story-doujichang",
		name = "E0-3",
		id = 4344,
		drop_client = "",
		story = "YUZHEDETIANPING4",
		pos = {
			0.5,
			0.3
		}
	}
	pg.base.story_template[4350] = {
		icon = "story-diluoyi",
		name = "E1-1",
		id = 4350,
		drop_client = "",
		story = "YUZHEDETIANPING10",
		pos = {
			0.105,
			0.14
		}
	}
	pg.base.story_template[4351] = {
		icon = "story-diluoyi",
		name = "E1-2",
		id = 4351,
		drop_client = "",
		story = "YUZHEDETIANPING11",
		pos = {
			0.5,
			0.136
		}
	}
	pg.base.story_template[4352] = {
		icon = "story-diluoyi",
		name = "E1-3",
		id = 4352,
		drop_client = "",
		story = "YUZHEDETIANPING12",
		pos = {
			0.411,
			0.355
		}
	}
	pg.base.story_template[4353] = {
		icon = "story-diluoyi",
		name = "E1-4",
		id = 4353,
		drop_client = "",
		story = "YUZHEDETIANPING13",
		pos = {
			0.578,
			0.296
		}
	}
	pg.base.story_template[4354] = {
		icon = "story-diluoyi",
		name = "E1-5",
		id = 4354,
		drop_client = "",
		story = "YUZHEDETIANPING14",
		pos = {
			0.41,
			0.276
		}
	}
	pg.base.story_template[4355] = {
		icon = "story-diluoyi",
		name = "E1-6",
		id = 4355,
		drop_client = "",
		story = "YUZHEDETIANPING15",
		pos = {
			0.517,
			0.412
		}
	}
	pg.base.story_template[4356] = {
		icon = "story-diluoyi",
		name = "E1-7",
		id = 4356,
		drop_client = "",
		story = "YUZHEDETIANPING16",
		pos = {
			0.28,
			0.391
		}
	}
	pg.base.story_template[4368] = {
		icon = "story-xinhaota",
		name = "E2-1",
		id = 4368,
		drop_client = "",
		story = "YUZHEDETIANPING28",
		pos = {
			0.91,
			0.114
		}
	}
	pg.base.story_template[4369] = {
		icon = "story-xinhaota",
		name = "E2-2",
		id = 4369,
		drop_client = "",
		story = "YUZHEDETIANPING29",
		pos = {
			0.71,
			0.33
		}
	}
	pg.base.story_template[4370] = {
		icon = "story-xinhaota",
		name = "E2-3",
		id = 4370,
		drop_client = "",
		story = "YUZHEDETIANPING30",
		pos = {
			0.9,
			0.341
		}
	}
	pg.base.story_template[4371] = {
		icon = "story-xinhaota",
		name = "E2-4",
		id = 4371,
		drop_client = "",
		story = "YUZHEDETIANPING31",
		pos = {
			0.443,
			0.152
		}
	}
	pg.base.story_template[4372] = {
		icon = "story-xinhaota",
		name = "E2-5",
		id = 4372,
		drop_client = "",
		story = "YUZHEDETIANPING32",
		pos = {
			0.188,
			0.176
		}
	}
	pg.base.story_template[4373] = {
		icon = "story-xinhaota",
		name = "E2-6",
		id = 4373,
		drop_client = "",
		story = "YUZHEDETIANPING33",
		pos = {
			0.33,
			0.358
		}
	}
	pg.base.story_template[4374] = {
		icon = "story-xinhaota",
		name = "E2-7",
		id = 4374,
		drop_client = "",
		story = "YUZHEDETIANPING34",
		pos = {
			0.192,
			0.447
		}
	}
	pg.base.story_template[6180] = {
		icon = "story-wurenji",
		name = "E1-1",
		id = 6180,
		drop_client = "",
		story = "TIEYIQINGFENG10",
		pos = {
			0.65,
			0.49
		}
	}
	pg.base.story_template[6181] = {
		icon = "story-wurenji",
		name = "E1-2",
		id = 6181,
		drop_client = "",
		story = "TIEYIQINGFENG11",
		pos = {
			0.56,
			0.1
		}
	}
	pg.base.story_template[6182] = {
		icon = "story-wurenji",
		name = "E1-3",
		id = 6182,
		drop_client = "",
		story = "TIEYIQINGFENG12",
		pos = {
			0.73,
			0.25
		}
	}
	pg.base.story_template[6183] = {
		icon = "story-xinghaizhuangzhi",
		name = "E1-4",
		id = 6183,
		drop_client = "",
		story = "TIEYIQINGFENG13",
		pos = {
			0.85,
			0.4
		}
	}
	pg.base.story_template[6184] = {
		icon = "story-zhihuimao",
		name = "E1-5",
		id = 6184,
		drop_client = "",
		story = "TIEYIQINGFENG14",
		pos = {
			0.2,
			0.4
		}
	}
	pg.base.story_template[6959] = {
		icon = "story-doujichang",
		name = "SP",
		id = 6959,
		drop_client = "",
		story = "YOUMIYAGUANQIAPIAN9",
		pos = {
			0.5,
			0.3
		}
	}
	pg.base.story_template[6969] = {
		icon = "story-doujichang",
		name = "SP",
		id = 6969,
		drop_client = "",
		story = "YOUMIYAGUANQIAPIAN18",
		pos = {
			0.5,
			0.3
		}
	}
	pg.base.story_template[6976] = {
		icon = "story-doujichang",
		name = "SP",
		id = 6976,
		drop_client = "",
		story = "YOUMIYAGUANQIAPIAN24",
		pos = {
			0.5,
			0.3
		}
	}
	pg.base.story_template[6979] = {
		icon = "story-doujichang",
		name = "SP",
		id = 6979,
		drop_client = "",
		story = "YOUMIYAGUANQIAPIAN27",
		pos = {
			0.5,
			0.3
		}
	}
	pg.base.story_template[7922] = {
		id = 7922,
		name = "SP",
		icon = "story-doujichasng",
		story = "BINHAIJISU22",
		pos = {
			0.5,
			0.3
		},
		drop_client = {
			{
				2,
				20001,
				5
			}
		}
	}
end)()
