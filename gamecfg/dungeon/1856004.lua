return {
	map_id = 10001,
	id = 1856004,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 300,
			passCondition = 1,
			backGroundStageID = 1,
			totalArea = {
				-80,
				20,
				90,
				70
			},
			playerArea = {
				-80,
				20,
				45,
				68
			},
			enemyArea = {},
			fleetCorrdinate = {
				-80,
				0,
				75
			},
			waves = {
				{
					triggerType = 1,
					waveIndex = 100,
					preWaves = {},
					triggerParams = {
						timeout = 0.5
					}
				},
				{
					triggerType = 3,
					waveIndex = 501,
					preWaves = {
						100
					},
					triggerParams = {
						id = "HUANXINGCANGHONGZHIYAN26-1"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						501
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16666011,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								0,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666013,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-10,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666015,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-5,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666013,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-10,
								0,
								45
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666011,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								0,
								0,
								35
							},
							buffList = {
								8001,
								8007
							}
						}
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 102,
					conditionType = 1,
					preWaves = {
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16666011,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								5,
								0,
								80
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666013,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-2,
								0,
								70
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666014,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-10,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666013,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-2,
								0,
								40
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16666011,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								5,
								0,
								30
							},
							buffList = {
								8001,
								8007
							}
						}
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 103,
					conditionType = 1,
					preWaves = {
						102
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16666306,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-10,
								0,
								70
							},
							bossData = {
								hpBarNum = 50,
								icon = ""
							}
						},
						{
							monsterTemplateID = 16666307,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-10,
								0,
								30
							},
							bossData = {
								hpBarNum = 50,
								icon = ""
							}
						}
					}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 502,
					preWaves = {
						103
					},
					triggerParams = {
						id = "HUANXINGCANGHONGZHIYAN26-2"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 104,
					conditionType = 1,
					preWaves = {
						502
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16666308,
							delay = 0.1,
							corrdinate = {
								-5,
								0,
								50
							},
							buffList = {},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							phase = {
								{
									switchParam = 1,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 7,
									addWeapon = {
										3203201
									}
								},
								{
									index = 2,
									switchParam = 300,
									switchTo = 3,
									switchType = 1,
									addBuff = {
										201137
									},
									removeWeapon = {
										3203201
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 2.5
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 18,
									addWeapon = {
										3203212,
										3203213,
										3203214,
										3203215,
										3203216,
										3203217,
										3203219
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 1,
									switchParam = 2,
									removeWeapon = {
										3203212,
										3203213,
										3203214,
										3203215,
										3203216,
										3203217,
										3203219
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					waveIndex = 900,
					preWaves = {
						104
					},
					triggerParams = {}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 503,
					preWaves = {
						900
					},
					triggerParams = {
						id = "HUANXINGCANGHONGZHIYAN26-3"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 900451,
				configId = 900451,
				skinId = 102160,
				id = 1,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 200,
					air = 0,
					antiaircraft = 200,
					torpedo = 200,
					durability = 30000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 2001,
						level = 10
					},
					{
						id = 20112,
						level = 10
					}
				}
			},
			{
				tmpID = 900452,
				configId = 900452,
				skinId = 102050,
				id = 2,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 200,
					air = 0,
					antiaircraft = 200,
					torpedo = 200,
					durability = 30000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 10070,
						level = 10
					},
					{
						id = 20122,
						level = 10
					}
				}
			},
			{
				tmpID = 900453,
				configId = 900453,
				skinId = 305070,
				id = 3,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 200,
					air = 0,
					antiaircraft = 200,
					torpedo = 200,
					durability = 30000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 11810,
						level = 10
					},
					{
						id = 11820,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 900460,
				configId = 900460,
				skinId = 307150,
				id = 1,
				level = 125,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 300,
					air = 300,
					antiaircraft = 250,
					torpedo = 0,
					durability = 20000,
					reload = 800,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 150460,
						level = 10
					},
					{
						id = 150470,
						level = 10
					},
					{
						id = 150480,
						level = 10
					},
					{
						id = 340,
						level = 10
					},
					{
						id = 201136,
						level = 10
					}
				}
			},
			{
				tmpID = 900455,
				configId = 900455,
				skinId = 306070,
				id = 2,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 200,
					air = 200,
					antiaircraft = 250,
					torpedo = 0,
					durability = 20000,
					reload = 800,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 12860,
						level = 10
					},
					{
						id = 12870,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 900456,
				configId = 900456,
				skinId = 307060,
				id = 3,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 200,
					air = 200,
					antiaircraft = 250,
					torpedo = 0,
					durability = 20000,
					reload = 800,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 10800,
						level = 10
					},
					{
						id = 10820,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			}
		}
	}
}
