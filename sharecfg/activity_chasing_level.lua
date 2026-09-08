pg = pg or {}
pg.activity_chasing_level = rawget(pg, "activity_chasing_level") or setmetatable({
	__name = "activity_chasing_level"
}, confNEO)
pg.activity_chasing_level.all = {
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
	34
}
pg.base = pg.base or {}
pg.base.activity_chasing_level = {}

;(function()
	pg.base.activity_chasing_level[1] = {
		map_json = "map_001",
		name = "STAGE-1",
		deploy_positions = "[{6,2}]",
		deploy_slot_count = 1,
		rating_threshold_c = 0,
		monster_ids = "[201]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 1,
		monster_speed_rating = "C",
		id = 1,
		preview_image = "level_01_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{7,9}]",
		time_limit = 45,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[1]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[2] = {
		map_json = "map_002",
		name = "STAGE-2",
		deploy_positions = "[{4,3},{12,3}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[301,305]",
		rating_threshold_s = 88,
		rating_threshold_b = 10,
		monster_count = 2,
		monster_speed_rating = "B",
		id = 2,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{2,14},{14,14}]",
		time_limit = 60,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[10],[9]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[3] = {
		map_json = "map_003",
		name = "STAGE-3",
		deploy_positions = "[{3,3},{19,3}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[405,406,404,401]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "B",
		id = 3,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{4,10},{18,10},{4,18},{18,18}]",
		time_limit = 75,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[13],[10]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					9
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[4] = {
		map_json = "map_004",
		name = "STAGE-4",
		deploy_positions = "[{5,18},{17,18}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[505,511,502,501]",
		rating_threshold_s = 86,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "C",
		id = 4,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{3,3},{9,3},{13,3},{19,3}]",
		time_limit = 120,
		player_skill_slots = 1,
		rating_threshold_a = 25,
		recommend_ship_list = "[[9],[10]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					9
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[5] = {
		map_json = "map_005",
		name = "STAGE-5",
		deploy_positions = "[{6,16},{16,16}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[611,605]",
		rating_threshold_s = 73,
		rating_threshold_b = 10,
		monster_count = 2,
		monster_speed_rating = "C",
		id = 5,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{6,9},{16,9}]",
		time_limit = 40,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[9],[6]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[6] = {
		map_json = "map_006",
		name = "STAGE-6",
		deploy_positions = "[{18,9},{11,18},{16,18}]",
		deploy_slot_count = 3,
		rating_threshold_c = 0,
		monster_ids = "[708,705,703,704]",
		rating_threshold_s = 84,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "B",
		id = 6,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{19,2},{9,3},{4,7},{3,16}]",
		time_limit = 75,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[5],[11],[8]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[7] = {
		map_json = "map_007",
		name = "STAGE-7",
		deploy_positions = "[{4,16},{15,16},{10,18}]",
		deploy_slot_count = 3,
		rating_threshold_c = 0,
		monster_ids = "[808,803,806,804]",
		rating_threshold_s = 86,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "S",
		id = 7,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{17,3},{4,4},{6,9},{19,12}]",
		time_limit = 80,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[4],[5],[9]]",
		terrain_tags = "多转角",
		unlock_date = {
			{
				{
					2026,
					9,
					11
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[8] = {
		map_json = "map_008",
		name = "STAGE-8",
		deploy_positions = "[{9,8},{14,8},{14,15}]",
		deploy_slot_count = 3,
		rating_threshold_c = 0,
		monster_ids = "[907,912,902,906]",
		rating_threshold_s = 87,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "B",
		id = 8,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{2,2},{20,2},{2,19},{20,19}]",
		time_limit = 90,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[12],[7],[9]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					11
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[9] = {
		map_json = "map_009",
		name = "STAGE-9",
		deploy_positions = "[{4,3},{12,3},{20,3}]",
		deploy_slot_count = 3,
		rating_threshold_c = 0,
		monster_ids = "[1005,1007,1011,1002,1004,1001]",
		rating_threshold_s = 90,
		rating_threshold_b = 10,
		monster_count = 6,
		monster_speed_rating = "B",
		id = 9,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{13,11},{3,12},{23,12},{6,16},{20,16},{13,17}]",
		time_limit = 70,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[3],[12],[8]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[10] = {
		map_json = "map_010",
		name = "STAGE-10",
		deploy_positions = "[{4,4},{18,4}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[1103,1108,1106,1104,1105]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 5,
		monster_speed_rating = "C",
		id = 10,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{2,13},{20,13},{6,16},{16,16},{11,17}]",
		time_limit = 40,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[8],[5]]",
		terrain_tags = "多转角",
		unlock_date = {
			{
				{
					2026,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[11] = {
		map_json = "map_011",
		name = "STAGE-11",
		deploy_positions = "[{4,5},{16,5},{28,5}]",
		deploy_slot_count = 3,
		rating_threshold_c = 0,
		monster_ids = "[1211,1205,1210]",
		rating_threshold_s = 83,
		rating_threshold_b = 10,
		monster_count = 3,
		monster_speed_rating = "B",
		id = 11,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{4,16},{16,16},{25,17}]",
		time_limit = 80,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[10],[6],[9]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					13
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[12] = {
		map_json = "map_012",
		name = "STAGE-12",
		deploy_positions = "[{4,9},{6,16},{11,19}]",
		deploy_slot_count = 3,
		rating_threshold_c = 0,
		monster_ids = "[1302,1307,1312,1309]",
		rating_threshold_s = 90,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "S",
		id = 12,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{18,5},{19,5},{18,6},{19,6}]",
		time_limit = 95,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[7],[12],[8]]",
		terrain_tags = "多转角",
		unlock_date = {
			{
				{
					2026,
					9,
					13
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[13] = {
		map_json = "map_013",
		name = "STAGE-13",
		deploy_positions = "[{3,6},{13,18},{4,29},{26,29}]",
		deploy_slot_count = 4,
		rating_threshold_c = 0,
		monster_ids = "[1414,1411,1410,1405,1404]",
		rating_threshold_s = 71,
		rating_threshold_b = 10,
		monster_count = 5,
		monster_speed_rating = "A",
		id = 13,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{30,2},{28,3},{29,3},{28,4},{29,4}]",
		time_limit = 50,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[6],[10],[12],[2]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[14] = {
		map_json = "map_014",
		name = "STAGE-14",
		deploy_positions = "[{9,19},{21,19}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[1511,1505,1503,1510]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "C",
		id = 14,
		preview_image = "level_02_preview.png",
		difficulty = 1,
		monster_deploy_positions = "[{7,3},{24,3},{4,7},{27,11}]",
		time_limit = 90,
		player_skill_slots = 1,
		rating_threshold_a = 40,
		recommend_ship_list = "[[9],[10]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				250
			},
			{
				8,
				68695,
				5
			}
		}
	}
	pg.base.activity_chasing_level[21] = {
		map_json = "map_101",
		name = "STAGE-H1",
		deploy_positions = "[{8,3},{8,6}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[2207,2205]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 2,
		monster_speed_rating = "B",
		id = 21,
		preview_image = "level_03_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{3,13},{13,13}]",
		time_limit = 45,
		player_skill_slots = 2,
		rating_threshold_a = 40,
		recommend_ship_list = "[[5],[11]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[22] = {
		map_json = "map_102",
		name = "STAGE-H2",
		deploy_positions = "[{8,7}]",
		deploy_slot_count = 1,
		rating_threshold_c = 0,
		monster_ids = "[2307,2312]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 2,
		monster_speed_rating = "A",
		id = 22,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{3,14},{13,14}]",
		time_limit = 40,
		player_skill_slots = 2,
		rating_threshold_a = 49,
		recommend_ship_list = "[[4]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[23] = {
		map_json = "map_103",
		name = "STAGE-H3",
		deploy_positions = "[{8,8}]",
		deploy_slot_count = 1,
		rating_threshold_c = 0,
		monster_ids = "[2414]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 1,
		monster_speed_rating = "S",
		id = 23,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{8,14}]",
		time_limit = 55,
		player_skill_slots = 2,
		rating_threshold_a = 40,
		recommend_ship_list = "[[13]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					9
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[24] = {
		map_json = "map_104",
		name = "STAGE-H4",
		deploy_positions = "[{8,3},{8,13}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[2508,2513,2503,2506]",
		rating_threshold_s = 65,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "B",
		id = 24,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{14,2},{3,8},{13,8},{2,14}]",
		time_limit = 45,
		player_skill_slots = 2,
		rating_threshold_a = 40,
		recommend_ship_list = "[[11],[10]]",
		terrain_tags = "多转角",
		unlock_date = {
			{
				{
					2026,
					9,
					9
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[25] = {
		map_json = "map_105",
		name = "STAGE-H5",
		deploy_positions = "[{9,6},{10,8}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[2607,2602,2609,2610,2612,2606,2607,2609]",
		rating_threshold_s = 77,
		rating_threshold_b = 10,
		monster_count = 8,
		monster_speed_rating = "A",
		id = 25,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{2,2},{3,2},{2,3},{2,4},{2,12},{2,13},{2,14},{3,14}]",
		time_limit = 50,
		player_skill_slots = 2,
		rating_threshold_a = 49,
		recommend_ship_list = "[[5],[12]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[26] = {
		map_json = "map_106",
		name = "STAGE-H6",
		deploy_positions = "[{4,4},{16,4}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[2707,2712,2714,2705]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "B",
		id = 26,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{4,14},{18,14},{6,16},{16,16}]",
		time_limit = 40,
		player_skill_slots = 2,
		rating_threshold_a = 45,
		recommend_ship_list = "[[12],[13]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[27] = {
		map_json = "map_107",
		name = "STAGE-H7",
		deploy_positions = "[{6,17},{16,17}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[2802,2807,2809,2810,2812,2801,2804,2802,2807,2809,2810,2812,2801,2804]",
		rating_threshold_s = 74,
		rating_threshold_b = 10,
		monster_count = 14,
		monster_speed_rating = "B",
		id = 27,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{5,2},{6,2},{7,2},{8,2},{9,2},{10,2},{11,2},{12,2},{13,2},{14,2},{15,2},{16,2},{17,2},{18,2}]",
		time_limit = 85,
		player_skill_slots = 2,
		rating_threshold_a = 56,
		recommend_ship_list = "[[12],[13]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					11
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[28] = {
		map_json = "map_108",
		name = "STAGE-H8",
		deploy_positions = "[{2,19}]",
		deploy_slot_count = 1,
		rating_threshold_c = 0,
		monster_ids = "[2911,2914,2910,2911,2914,2910]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 6,
		monster_speed_rating = "A",
		id = 28,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{6,2},{11,2},{16,2},{20,4},{20,7},{20,10}]",
		time_limit = 60,
		player_skill_slots = 2,
		rating_threshold_a = 50,
		recommend_ship_list = "[[13]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					11
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[29] = {
		map_json = "map_109",
		name = "STAGE-H9",
		deploy_positions = "[{6,4},{12,4}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[3008,3003,3013]",
		rating_threshold_s = 73,
		rating_threshold_b = 10,
		monster_count = 3,
		monster_speed_rating = "C",
		id = 29,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{29,10},{24,16},{16,19}]",
		time_limit = 60,
		player_skill_slots = 2,
		rating_threshold_a = 65,
		recommend_ship_list = "[[8],[7]]",
		terrain_tags = "多转角",
		unlock_date = {
			{
				{
					2026,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[30] = {
		map_json = "map_110",
		name = "STAGE-H10",
		deploy_positions = "[{5,3},{26,4}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[3107,3112]",
		rating_threshold_s = 81,
		rating_threshold_b = 10,
		monster_count = 2,
		monster_speed_rating = "S",
		id = 30,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{8,17},{26,17}]",
		time_limit = 35,
		player_skill_slots = 2,
		rating_threshold_a = 58,
		recommend_ship_list = "[[13],[7]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[31] = {
		map_json = "map_111",
		name = "STAGE-H11",
		deploy_positions = "[{14,6}]",
		deploy_slot_count = 1,
		rating_threshold_c = 0,
		monster_ids = "[3213]",
		rating_threshold_s = 55,
		rating_threshold_b = 10,
		monster_count = 1,
		monster_speed_rating = "A",
		id = 31,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{22,21}]",
		time_limit = 60,
		player_skill_slots = 2,
		rating_threshold_a = 44,
		recommend_ship_list = "[[11]]",
		terrain_tags = "多转角",
		unlock_date = {
			{
				{
					2026,
					9,
					13
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[32] = {
		map_json = "map_112",
		name = "STAGE-H12",
		deploy_positions = "[{14,2}]",
		deploy_slot_count = 1,
		rating_threshold_c = 0,
		monster_ids = "[3307,3312,3309,3314]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "B",
		id = 32,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{3,2},{28,2},{12,18},{19,18}]",
		time_limit = 70,
		player_skill_slots = 2,
		rating_threshold_a = 52,
		recommend_ship_list = "[[13]]",
		terrain_tags = "多直路",
		unlock_date = {
			{
				{
					2026,
					9,
					13
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[33] = {
		map_json = "map_113",
		name = "STAGE-H13",
		deploy_positions = "[{4,4},{21,16}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[3411,3414]",
		rating_threshold_s = 70,
		rating_threshold_b = 10,
		monster_count = 2,
		monster_speed_rating = "A",
		id = 33,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{7,12},{25,12}]",
		time_limit = 35,
		player_skill_slots = 2,
		rating_threshold_a = 60,
		recommend_ship_list = "[[1],[2]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
	pg.base.activity_chasing_level[34] = {
		map_json = "map_114",
		name = "STAGE-H14",
		deploy_positions = "[{4,12},{4,16}]",
		deploy_slot_count = 2,
		rating_threshold_c = 0,
		monster_ids = "[3514,3511,3510,3505]",
		rating_threshold_s = 65,
		rating_threshold_b = 10,
		monster_count = 4,
		monster_speed_rating = "B",
		id = 34,
		preview_image = "level_04_preview.png",
		difficulty = 2,
		monster_deploy_positions = "[{26,11},{28,12},{28,13},{26,14}]",
		time_limit = 45,
		player_skill_slots = 2,
		rating_threshold_a = 52,
		recommend_ship_list = "[[13],[11]]",
		terrain_tags = "多路口",
		unlock_date = {
			{
				{
					2026,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			}
		},
		first_clear_reward = {
			{
				1,
				750,
				200
			},
			{
				8,
				68695,
				1
			}
		}
	}
end)()
