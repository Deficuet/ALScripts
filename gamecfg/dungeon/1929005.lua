return {
	map_id = 10001,
	id = 1929005,
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
						id = "HUANYINGMITUZHEGUANQIAPIAN5-1"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 0,
					preWaves = {
						501
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16739105,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-5,
								0,
								55
							},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 4.5,
									setAI = 10001,
									addWeapon = {
										783203,
										783204
									},
									removeWeapon = {}
								},
								{
									index = 1,
									switchParam = 5,
									switchTo = 2,
									switchType = 1,
									addWeapon = {
										783201
									},
									removeWeapon = {
										783203,
										783204
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 2.5,
									setAI = 70093,
									addWeapon = {
										783203,
										783204,
										783211
									},
									removeWeapon = {
										783201
									}
								},
								{
									index = 3,
									switchParam = 2,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										783202
									},
									removeWeapon = {
										783203,
										783204
									}
								},
								{
									switchType = 1,
									switchTo = 5,
									index = 4,
									switchParam = 7,
									setAI = 10001,
									addWeapon = {},
									removeWeapon = {
										783202
									}
								},
								{
									index = 5,
									switchParam = 2,
									switchTo = 0,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										783211
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16739104,
							delay = 0,
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
							monsterTemplateID = 16739104,
							delay = 0,
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
							monsterTemplateID = 16739102,
							delay = 0,
							corrdinate = {
								5,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16739102,
							delay = 0,
							corrdinate = {
								5,
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
					triggerType = 3,
					key = true,
					waveIndex = 502,
					preWaves = {
						101
					},
					triggerParams = {
						id = "HUANYINGMITUZHEGUANQIAPIAN5-2"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 102,
					conditionType = 0,
					preWaves = {
						502
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16739106,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-5,
								0,
								70
							},
							buffList = {},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 5,
									setAI = 70149,
									addWeapon = {
										783203,
										783204
									},
									removeWeapon = {}
								},
								{
									index = 1,
									switchParam = 4,
									switchTo = 2,
									switchType = 1,
									addWeapon = {
										783205,
										783212
									},
									removeWeapon = {
										783203,
										783204
									}
								},
								{
									index = 2,
									switchParam = 2.5,
									switchTo = 3,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										783205
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 2.5,
									setAI = 20006,
									addWeapon = {
										783209
									},
									removeWeapon = {
										783212
									}
								},
								{
									index = 4,
									switchParam = 4.5,
									switchTo = 5,
									switchType = 1,
									addWeapon = {
										783210
									},
									removeWeapon = {
										783209
									}
								},
								{
									index = 5,
									switchParam = 0.5,
									switchTo = 0,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										783210
									}
								}
							}
						},
						{
							monsterTemplateID = 16739107,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-5,
								0,
								40
							},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 6.5,
									setAI = 70150,
									addWeapon = {
										783203,
										783204
									},
									removeWeapon = {}
								},
								{
									index = 1,
									switchParam = 4,
									switchTo = 2,
									switchType = 1,
									addWeapon = {
										783206,
										783212
									},
									removeWeapon = {
										783203,
										783204
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 4.5,
									setAI = 20006,
									addWeapon = {
										783208
									},
									removeWeapon = {
										783206
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 3.5,
									setAI = 20006,
									addWeapon = {
										783207
									},
									removeWeapon = {
										783208,
										783212
									}
								},
								{
									index = 4,
									switchParam = 0.5,
									switchTo = 0,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										783207
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16739103,
							delay = 0,
							corrdinate = {
								5,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16739103,
							delay = 0,
							corrdinate = {
								5,
								0,
								55
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16739103,
							delay = 0,
							corrdinate = {
								5,
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
					triggerType = 3,
					key = true,
					waveIndex = 503,
					preWaves = {
						102
					},
					triggerParams = {
						id = "HUANYINGMITUZHEGUANQIAPIAN5-3"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 103,
					conditionType = 0,
					preWaves = {
						503
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16739108,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 80,
								icon = ""
							},
							buffList = {},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 1.5,
									setAI = 20006,
									addWeapon = {},
									removeWeapon = {}
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 5,
									setAI = 10001,
									addWeapon = {
										784001
									},
									removeWeapon = {}
								},
								{
									index = 2,
									switchParam = 3,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										784003
									},
									removeWeapon = {
										784001
									}
								},
								{
									index = 3,
									switchParam = 4.5,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										784004
									},
									removeWeapon = {
										784003
									}
								},
								{
									switchType = 1,
									switchTo = 5,
									index = 4,
									switchParam = 5,
									setAI = 70058,
									addWeapon = {
										784002,
										784010,
										784011,
										784012,
										784013
									},
									removeWeapon = {
										784004
									}
								},
								{
									index = 5,
									switchParam = 2,
									switchTo = 6,
									switchType = 1,
									addWeapon = {
										784005
									},
									removeWeapon = {
										784002
									}
								},
								{
									index = 6,
									switchParam = 1,
									switchTo = 7,
									switchType = 1,
									addWeapon = {
										784006
									},
									removeWeapon = {
										784010,
										784011,
										784012,
										784013
									}
								},
								{
									index = 7,
									switchParam = 2,
									switchTo = 8,
									switchType = 1,
									addWeapon = {
										784007
									},
									removeWeapon = {}
								},
								{
									index = 8,
									switchParam = 1.5,
									switchTo = 9,
									switchType = 1,
									addWeapon = {
										784008
									},
									removeWeapon = {}
								},
								{
									index = 9,
									switchParam = 4,
									switchTo = 10,
									switchType = 1,
									addWeapon = {
										784009
									},
									removeWeapon = {}
								},
								{
									index = 10,
									switchParam = 0.5,
									switchTo = 11,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										784008,
										784009
									}
								},
								{
									index = 11,
									switchParam = 1.5,
									switchTo = 12,
									switchType = 1,
									addWeapon = {
										784008
									},
									removeWeapon = {}
								},
								{
									index = 12,
									switchParam = 4,
									switchTo = 13,
									switchType = 1,
									addWeapon = {
										784009
									},
									removeWeapon = {}
								},
								{
									switchType = 1,
									switchTo = 0,
									index = 13,
									switchParam = 0.2,
									setAI = 10001,
									addWeapon = {},
									removeWeapon = {
										784005,
										784006,
										784007,
										784008,
										784009
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
						103
					},
					triggerParams = {}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 504,
					preWaves = {
						900
					},
					triggerParams = {
						id = "HUANYINGMITUZHEGUANQIAPIAN5-4"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 900510,
				configId = 900510,
				skinId = 11200010,
				id = 2,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 300,
					durability = 50000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 201452,
						level = 10
					},
					{
						id = 112030,
						level = 10
					}
				}
			},
			{
				tmpID = 900507,
				configId = 900507,
				skinId = 299010,
				id = 2,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 200,
					torpedo = 300,
					durability = 50000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 19010,
						level = 10
					},
					{
						id = 19020,
						level = 10
					},
					{
						id = 19002,
						level = 10
					},
					{
						id = 29232,
						level = 10
					}
				}
			},
			{
				tmpID = 900498,
				configId = 900498,
				skinId = 702080,
				id = 3,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 200,
					torpedo = 300,
					durability = 50000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 151100,
						level = 10
					},
					{
						id = 151110,
						level = 10
					},
					{
						id = 26112,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 900511,
				configId = 900511,
				skinId = 11200020,
				id = 1,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 300,
					air = 500,
					antiaircraft = 250,
					torpedo = 0,
					durability = 50000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 112050,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 900508,
				configId = 900508,
				skinId = 199040,
				id = 2,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 400,
					air = 200,
					antiaircraft = 250,
					torpedo = 0,
					durability = 50000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 19660,
						level = 10
					},
					{
						id = 19670,
						level = 10
					},
					{
						id = 19680,
						level = 10
					},
					{
						id = 19002,
						level = 10
					},
					{
						id = 2,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 900388,
				configId = 900388,
				skinId = 607020,
				id = 3,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 200,
					air = 400,
					antiaircraft = 250,
					torpedo = 0,
					durability = 50000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 15370,
						level = 10
					},
					{
						id = 15380,
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
