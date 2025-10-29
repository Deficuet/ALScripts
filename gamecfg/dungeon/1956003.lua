return {
	id = 1956003,
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
						timeout = 0.1
					}
				},
				{
					triggerType = 3,
					waveIndex = 501,
					preWaves = {
						100
					},
					triggerParams = {
						id = "QIYUANXIADEMIMI18-1"
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
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16766002,
							delay = 0,
							corrdinate = {
								0,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16766003,
							delay = 0,
							corrdinate = {
								-5,
								0,
								50
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16766002,
							delay = 0,
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
					waveIndex = 102,
					conditionType = 1,
					preWaves = {
						101,
						202
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16766005,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								0,
								0,
								62
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16766004,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								0,
								0,
								38
							},
							buffList = {
								8001,
								8007
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16766002,
							delay = 0,
							corrdinate = {
								-5,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16766001,
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
							monsterTemplateID = 16766001,
							delay = 0,
							corrdinate = {
								-10,
								0,
								35
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16766002,
							delay = 0,
							corrdinate = {
								-5,
								0,
								25
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
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16766203,
							delay = 0,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 60,
								icon = ""
							},
							buffList = {},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5,
									addWeapon = {}
								},
								{
									index = 1,
									switchParam = 8,
									switchTo = 2,
									switchType = 1,
									addWeapon = {
										3303107
									},
									removeWeapon = {}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 10,
									setAI = 70098,
									addWeapon = {
										3303108,
										3303109
									},
									removeWeapon = {
										3303107
									}
								},
								{
									index = 3,
									switchParam = 2,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3303112
									},
									removeWeapon = {
										3303108,
										3303109
									}
								},
								{
									index = 4,
									switchParam = 12,
									switchTo = 5,
									switchType = 1,
									addWeapon = {
										3303110,
										3303111
									},
									removeWeapon = {}
								},
								{
									switchType = 1,
									switchTo = 1,
									index = 5,
									switchParam = 2,
									setAI = 70093,
									addWeapon = {},
									removeWeapon = {
										3303110,
										3303111,
										3303112
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
					waveIndex = 502,
					preWaves = {
						900
					},
					triggerParams = {
						id = "QIYUANXIADEMIMI18-2"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 801054,
				configId = 801054,
				skinId = 801050,
				id = 1,
				level = 120,
				equipment = {
					21613,
					25053,
					26673
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
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
						id = 151490,
						level = 10
					},
					{
						id = 151500,
						level = 10
					},
					{
						id = 30512,
						level = 10
					}
				}
			},
			{
				tmpID = 802044,
				configId = 802044,
				skinId = 802040,
				id = 2,
				level = 120,
				equipment = {
					11273,
					15253,
					16453
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
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
						id = 151430,
						level = 10
					},
					{
						id = 151440,
						level = 10
					},
					{
						id = 28282,
						level = 10
					}
				}
			},
			{
				tmpID = 403044,
				configId = 403044,
				skinId = 403041,
				id = 3,
				level = 120,
				equipment = {
					7313,
					5653,
					90633
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
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
						id = 10650,
						level = 10
					},
					{
						id = 23222,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 804014,
				configId = 804014,
				skinId = 804010,
				id = 1,
				level = 120,
				equipment = {
					14473,
					21633,
					26673
				},
				properties = {
					cannon = 600,
					air = 0,
					antiaircraft = 250,
					torpedo = 600,
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
						id = 151390,
						level = 10
					},
					{
						id = 151400,
						level = 10
					},
					{
						id = 2,
						level = 10
					},
					{
						id = 340,
						level = 10
					},
					{
						id = 201496,
						level = 1
					}
				}
			},
			{
				tmpID = 206084,
				configId = 206084,
				skinId = 206080,
				id = 2,
				level = 120,
				equipment = {
					27333,
					28413,
					29233
				},
				properties = {
					cannon = 600,
					air = 600,
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
						id = 16400,
						level = 10
					},
					{
						id = 16410,
						level = 10
					},
					{
						id = 16420,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 807024,
				configId = 807024,
				skinId = 807020,
				id = 3,
				level = 120,
				equipment = {
					91231,
					91353,
					91253
				},
				properties = {
					cannon = 600,
					air = 600,
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
						id = 16990,
						level = 10
					},
					{
						id = 17000,
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
