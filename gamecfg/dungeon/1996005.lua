return {
	id = 1996005,
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
				50,
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
						id = "XIANGCHEYUTIANQIONGZHIYIN35-1"
					}
				},
				{
					triggerType = 1,
					waveIndex = 202,
					preWaves = {},
					triggerParams = {
						timeout = 18
					}
				},
				{
					triggerType = 1,
					waveIndex = 203,
					preWaves = {},
					triggerParams = {
						timeout = 33
					}
				},
				{
					triggerType = 1,
					waveIndex = 204,
					preWaves = {},
					triggerParams = {
						timeout = 44
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807302,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
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
							monsterTemplateID = 16807303,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
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
							monsterTemplateID = 16807302,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								0,
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
					waveIndex = 102,
					conditionType = 0,
					preWaves = {
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807301,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								68
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16807304,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
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
							monsterTemplateID = 16807301,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								32
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
					conditionType = 0,
					preWaves = {
						102
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807302,
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
							monsterTemplateID = 16807303,
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
							monsterTemplateID = 16807305,
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
							monsterTemplateID = 16807303,
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
							monsterTemplateID = 16807302,
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
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 104,
					conditionType = 0,
					preWaves = {
						103
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807303,
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
							monsterTemplateID = 16807303,
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
							monsterTemplateID = 16807303,
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
							monsterTemplateID = 16807304,
							delay = 0,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
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
							monsterTemplateID = 16807304,
							reinforceDelay = 6,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
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
						}
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 105,
					conditionType = 0,
					preWaves = {
						104
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16807309,
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
						105
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 9701014,
				configId = 9701014,
				skinId = 9701010,
				id = 1,
				level = 125,
				equipment = {
					90173,
					45173,
					16493
				},
				properties = {
					cannon = 1500,
					air = 0,
					antiaircraft = 200,
					torpedo = 2000,
					durability = 500000,
					reload = 600,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 800580,
						level = 10
					},
					{
						id = 800590,
						level = 10
					},
					{
						id = 800602,
						level = 10
					}
				}
			},
			{
				tmpID = 9702034,
				configId = 9702034,
				skinId = 9702030,
				id = 2,
				level = 125,
				equipment = {
					90173,
					45173,
					16493
				},
				properties = {
					cannon = 1500,
					air = 0,
					antiaircraft = 200,
					torpedo = 2000,
					durability = 500000,
					reload = 600,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 800680,
						level = 10
					},
					{
						id = 800690,
						level = 10
					},
					{
						id = 800702,
						level = 10
					}
				}
			},
			{
				tmpID = 9701074,
				configId = 9701074,
				skinId = 9701070,
				id = 3,
				level = 125,
				equipment = {
					90173,
					45173,
					16493
				},
				properties = {
					cannon = 2000,
					air = 0,
					antiaircraft = 200,
					torpedo = 1500,
					durability = 500000,
					reload = 600,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 801710,
						level = 10
					},
					{
						id = 801720,
						level = 10
					},
					{
						id = 801742,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 9705044,
				configId = 9705044,
				skinId = 9705040,
				id = 1,
				level = 125,
				equipment = {
					14513,
					90173,
					16493
				},
				properties = {
					cannon = 3000,
					air = 0,
					antiaircraft = 800,
					torpedo = 0,
					durability = 500000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 800710,
						level = 10
					},
					{
						id = 800720,
						level = 10
					},
					{
						id = 800730,
						level = 10
					},
					{
						id = 800742,
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
				tmpID = 9707074,
				configId = 9707074,
				skinId = 9707070,
				id = 2,
				level = 125,
				equipment = {
					27333,
					28433,
					28433
				},
				properties = {
					cannon = 1000,
					air = 2000,
					antiaircraft = 800,
					torpedo = 0,
					durability = 500000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 801750,
						level = 10
					},
					{
						id = 801760,
						level = 10
					},
					{
						id = 801770,
						level = 10
					},
					{
						id = 801782,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 900537,
				configId = 900537,
				skinId = 9702060,
				id = 3,
				level = 125,
				equipment = {
					90173,
					96033,
					90633
				},
				properties = {
					cannon = 3000,
					air = 0,
					antiaircraft = 800,
					torpedo = 3000,
					durability = 500000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 801020,
						level = 10
					},
					{
						id = 801030,
						level = 10
					},
					{
						id = 801040,
						level = 10
					},
					{
						id = 801052,
						level = 10
					},
					{
						id = 340,
						level = 10
					},
					{
						id = 390,
						level = 10
					}
				}
			}
		}
	}
}
