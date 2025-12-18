return {
	id = 9806,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 600,
			passCondition = 1,
			backGroundStageID = 1,
			totalArea = {
				-70,
				20,
				90,
				70
			},
			playerArea = {
				-70,
				20,
				37,
				68
			},
			enemyArea = {},
			mainUnitPosition = {
				{
					Vector3(-105, 0, 58),
					Vector3(-105, 0, 78),
					Vector3(-105, 0, 38)
				},
				[-1] = {
					Vector3(15, 0, 58),
					Vector3(15, 0, 78),
					Vector3(15, 0, 38)
				}
			},
			fleetCorrdinate = {
				-90,
				0,
				55
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
					triggerType = 1,
					waveIndex = 202,
					preWaves = {},
					triggerParams = {
						timeout = 8
					}
				},
				{
					triggerType = 1,
					waveIndex = 203,
					preWaves = {},
					triggerParams = {
						timeout = 15
					}
				},
				{
					triggerType = 0,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16800002,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
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
							monsterTemplateID = 16800003,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								-12,
								0,
								62
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16800004,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16800003,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								-12,
								0,
								38
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16800002,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
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
					},
					airFighter = {
						{
							interval = 5,
							onceNumber = 5,
							formation = 10006,
							delay = 0,
							templateID = 1010075,
							totalNumber = 20,
							weaponID = {
								1010080,
								1010085
							},
							attr = {
								airPower = 40,
								maxHP = 15,
								attackRating = 23
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 102,
					conditionType = 1,
					preWaves = {
						202
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16800003,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								-12,
								0,
								25
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16800003,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								-12,
								0,
								50
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16800003,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								-12,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16800005,
							reinforceDelay = 6,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							delay = 1,
							corrdinate = {
								0,
								0,
								38
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16800005,
							reinforceDelay = 6,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							delay = 2,
							corrdinate = {
								0,
								0,
								62
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
						203
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16734001,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								10,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16734003,
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
							monsterTemplateID = 16734003,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								-5,
								0,
								45
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16734001,
							moveCast = true,
							delay = 0,
							score = 0,
							corrdinate = {
								10,
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
					waveIndex = 104,
					conditionType = 0,
					preWaves = {
						500,
						102,
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16803302,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							buffList = {
								200825
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 13,
									addWeapon = {
										3343101,
										3343102,
										3343103
									}
								},
								{
									index = 2,
									switchParam = 17,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3343104,
										3343105,
										3343106
									},
									removeWeapon = {
										3343101,
										3343102,
										3343103
									}
								},
								{
									index = 3,
									switchParam = 15,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3343107,
										3343108
									},
									removeWeapon = {
										3343104,
										3343105,
										3343106
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5,
									removeWeapon = {
										3343107,
										3343108
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
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 900813,
				configId = 900813,
				skinId = 101100,
				id = 1,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 800,
					torpedo = 600,
					durability = 10000,
					reload = 240,
					armor = 0,
					dodge = 250,
					speed = 51.6,
					luck = 0,
					hit = 120
				},
				skills = {
					{
						id = 151920,
						level = 10
					},
					{
						id = 151930,
						level = 10
					},
					{
						id = 151940,
						level = 10
					},
					{
						id = 30562,
						level = 1
					}
				}
			},
			{
				tmpID = 100011,
				configId = 100011,
				skinId = 100010,
				id = 1,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 10,
					air = 0,
					antiaircraft = 350,
					torpedo = 10,
					durability = 105567,
					reload = 100,
					armor = 0,
					dodge = 0,
					speed = 33,
					luck = 0,
					hit = 0
				}
			}
		},
		main_unitList = {
			{
				tmpID = 900908,
				configId = 900908,
				skinId = 199020,
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
					antiaircraft = 400,
					torpedo = 0,
					durability = 8000,
					reload = 1200,
					armor = 0,
					dodge = 28,
					speed = 33,
					luck = 0,
					hit = 80
				},
				skills = {
					{
						id = 19150,
						level = 10
					},
					{
						id = 19160,
						level = 10
					},
					{
						id = 19002,
						level = 1
					},
					{
						id = 1,
						level = 1
					},
					{
						id = 8530,
						level = 1
					}
				}
			}
		}
	}
}
