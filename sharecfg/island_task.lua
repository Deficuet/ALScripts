pg = pg or {}
pg.island_task = {
	{
		trigger_tips = 1,
		name = "主线任务1",
		complete_tips = "找明石",
		type = 1,
		reward_icon = "icon1",
		map_trigger_tips = 1001,
		complete_type = 2,
		trigger_type = 1,
		trigger_data = 0,
		navigation = 10040012,
		task_desc = "这是主人的任务",
		series = "第一章",
		complete_data = 10040012,
		map_complete_tips = 0,
		rec_perform = "island_1",
		com_perform = "",
		series_name = "新岛开放",
		id = 1,
		unlock_condition = {
			{
				3,
				12001
			}
		},
		target_id = {
			101
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	{
		trigger_tips = 0,
		name = "主线任务2",
		complete_tips = "",
		type = 1,
		reward_icon = "icon2",
		map_trigger_tips = 0,
		complete_type = 2,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 10040006,
		task_desc = "这是主人的任务",
		series = "第一章",
		complete_data = 0,
		map_complete_tips = 0,
		rec_perform = "",
		com_perform = "island_1",
		series_name = "新岛开放",
		id = 2,
		unlock_condition = {
			{
				2,
				1
			}
		},
		target_id = {
			201
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	{
		trigger_tips = 0,
		name = "主线任务3",
		complete_tips = "找明石",
		type = 1,
		reward_icon = "icon3",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 10040019,
		task_desc = "这是主人的任务",
		series = "第一章",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "island_1",
		series_name = "新岛开放",
		id = 3,
		unlock_condition = {
			{
				2,
				2
			},
			{
				3,
				5001
			}
		},
		target_id = {
			501
		},
		reward = {
			{
				43,
				9001,
				1
			}
		}
	},
	{
		trigger_tips = 1,
		name = "主线任务4",
		complete_tips = "",
		type = 1,
		reward_icon = "icon4",
		map_trigger_tips = 0,
		complete_type = 2,
		trigger_type = 3,
		trigger_data = 0,
		navigation = 10040003,
		task_desc = "这是主人的任务",
		series = "第二章",
		complete_data = 0,
		map_complete_tips = 0,
		rec_perform = "",
		com_perform = "island_1",
		series_name = "继续探索",
		id = 4,
		unlock_condition = {
			{
				2,
				3
			},
			{
				3,
				13001
			}
		},
		target_id = {
			301
		},
		reward = {
			{
				41,
				2001,
				20
			}
		}
	},
	[1001] = {
		trigger_tips = 1,
		name = "绿头猫有办法",
		complete_tips = "找明石",
		type = 2,
		reward_icon = "icon5",
		map_trigger_tips = 1001,
		complete_type = 1,
		trigger_type = 1,
		trigger_data = 10030006,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "island_1",
		com_perform = "",
		series_name = "修理飞行器",
		id = 1001,
		unlock_condition = {
			{
				3,
				5002
			}
		},
		target_id = {
			502
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[1002] = {
		trigger_tips = 1,
		name = "稳一点",
		complete_tips = "找明石",
		type = 2,
		reward_icon = "icon6",
		map_trigger_tips = 1001,
		complete_type = 1,
		trigger_type = 1,
		trigger_data = 10030005,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "修理飞行器",
		id = 1002,
		unlock_condition = {
			{
				2,
				1001
			},
			{
				4,
				1003
			}
		},
		target_id = {
			601,
			701
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[1003] = {
		trigger_tips = 1,
		name = "风险一点",
		complete_tips = "找明石",
		type = 2,
		reward_icon = "icon7",
		map_trigger_tips = 1001,
		complete_type = 1,
		trigger_type = 1,
		trigger_data = 10030004,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "修理飞行器",
		id = 1003,
		unlock_condition = {
			{
				2,
				1001
			},
			{
				4,
				1002
			}
		},
		target_id = {
			602,
			702
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[1004] = {
		trigger_tips = 1,
		name = "总之修好了",
		complete_tips = "找明石",
		type = 2,
		reward_icon = "icon8",
		map_trigger_tips = 1001,
		complete_type = 1,
		trigger_type = 1,
		trigger_data = 10030005,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "修理飞行器",
		id = 1004,
		unlock_condition = {
			{
				2,
				1002
			}
		},
		target_id = {
			401,
			201
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[1005] = {
		trigger_tips = 1,
		name = "总之修好了",
		complete_tips = "找明石",
		type = 2,
		reward_icon = "icon8",
		map_trigger_tips = 1001,
		complete_type = 1,
		trigger_type = 1,
		trigger_data = 10030005,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "修理飞行器",
		id = 1005,
		unlock_condition = {
			{
				2,
				1003
			}
		},
		target_id = {
			101,
			401
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[2001] = {
		trigger_tips = 0,
		name = "每日任务1",
		complete_tips = "找明石",
		type = 3,
		reward_icon = "icon9",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "",
		id = 2001,
		unlock_condition = {},
		target_id = {
			801
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[2002] = {
		trigger_tips = 0,
		name = "每日任务2",
		complete_tips = "找明石",
		type = 3,
		reward_icon = "icon10",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "",
		id = 2002,
		unlock_condition = {
			{
				2,
				2001
			}
		},
		target_id = {
			802
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[2003] = {
		trigger_tips = 0,
		name = "每日任务3",
		complete_tips = "找明石",
		type = 3,
		reward_icon = "icon11",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "",
		id = 2003,
		unlock_condition = {},
		target_id = {
			801,
			802
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[2004] = {
		trigger_tips = 0,
		name = "每日任务4",
		complete_tips = "找明石",
		type = 3,
		reward_icon = "icon12",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "",
		id = 2004,
		unlock_condition = {
			{
				2,
				2003
			},
			{
				3,
				13001
			}
		},
		target_id = {
			301,
			302
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[2501] = {
		trigger_tips = 0,
		name = "每周任务1",
		complete_tips = "找明石",
		type = 4,
		reward_icon = "icon11",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "",
		id = 2501,
		unlock_condition = {},
		target_id = {
			601,
			602
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[2502] = {
		trigger_tips = 0,
		name = "每周任务2",
		complete_tips = "找明石",
		type = 4,
		reward_icon = "icon12",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "",
		id = 2502,
		unlock_condition = {},
		target_id = {
			701,
			702
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[3001] = {
		trigger_tips = 1,
		name = "活动常驻1",
		complete_tips = "找明石",
		type = 5,
		reward_icon = "icon13",
		map_trigger_tips = 0,
		complete_type = 2,
		trigger_type = 1,
		trigger_data = 10030006,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10040012,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "活动1",
		id = 3001,
		unlock_condition = {
			{
				5,
				{
					{
						{
							2024,
							3,
							14
						},
						{
							0,
							0,
							0
						}
					},
					{
						{
							2026,
							4,
							2
						},
						{
							23,
							59,
							59
						}
					}
				}
			}
		},
		target_id = {
			901
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[4001] = {
		trigger_tips = 0,
		name = "活动每日1",
		complete_tips = "找明石",
		type = 6,
		reward_icon = "icon14",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "活动2",
		id = 4001,
		unlock_condition = {
			{
				5,
				{
					{
						{
							2024,
							3,
							14
						},
						{
							0,
							0,
							0
						}
					},
					{
						{
							2026,
							4,
							2
						},
						{
							23,
							59,
							59
						}
					}
				}
			}
		},
		target_id = {
			501,
			502
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	[4002] = {
		trigger_tips = 0,
		name = "活动每周1",
		complete_tips = "找明石",
		type = 7,
		reward_icon = "icon14",
		map_trigger_tips = 0,
		complete_type = 1,
		trigger_type = 2,
		trigger_data = 0,
		navigation = 0,
		task_desc = "这是主人的任务",
		series = "",
		complete_data = 10030006,
		map_complete_tips = 1002,
		rec_perform = "",
		com_perform = "",
		series_name = "活动3",
		id = 4002,
		unlock_condition = {
			{
				5,
				{
					{
						{
							2024,
							3,
							14
						},
						{
							0,
							0,
							0
						}
					},
					{
						{
							2026,
							4,
							2
						},
						{
							23,
							59,
							59
						}
					}
				}
			}
		},
		target_id = {
			201,
			101
		},
		reward = {
			{
				41,
				1001,
				20
			},
			{
				41,
				1002,
				10
			}
		}
	},
	get_id_list_by_type = {
		{
			1,
			2,
			3,
			4
		},
		{
			1001,
			1002,
			1003,
			1004,
			1005
		},
		{
			2001,
			2002,
			2003,
			2004
		},
		{
			2501,
			2502
		},
		{
			3001
		},
		{
			4001
		},
		{
			4002
		}
	},
	all = {
		1,
		2,
		3,
		4,
		1001,
		1002,
		1003,
		1004,
		1005,
		2001,
		2002,
		2003,
		2004,
		2501,
		2502,
		3001,
		4001,
		4002
	}
}
