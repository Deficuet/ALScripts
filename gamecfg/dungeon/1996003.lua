return {
	id = 1996003,
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
						id = "XIANGCHEYUTIANQIONGZHIYIN33-1"
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
							monsterTemplateID = 16807302,
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
							monsterTemplateID = 16807305,
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
							monsterTemplateID = 16807304,
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
						103,
						102,
						101
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
							monsterTemplateID = 16807305,
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
							monsterTemplateID = 16807305,
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
					waveIndex = 105,
					conditionType = 0,
					preWaves = {
						104
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16807307,
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
									switchParam = 2,
									addWeapon = {
										3342201,
										3342202
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 6,
									addWeapon = {
										3342203,
										3342204
									}
								},
								{
									index = 3,
									switchParam = 7.5,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3342205,
										3342206,
										3342207,
										3342208
									},
									removeWeapon = {
										3342203,
										3342204
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 0.5,
									removeWeapon = {
										3342208
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 6,
									addWeapon = {
										3342208
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 1,
									removeWeapon = {
										3342205,
										3342206,
										3342207,
										3342208
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 5,
									addWeapon = {
										3342209
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 2,
									switchParam = 1.5,
									removeWeapon = {
										3342209
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
				tmpID = 9701044,
				configId = 9701044,
				skinId = 9701040,
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
						id = 801060,
						level = 10
					},
					{
						id = 801070,
						level = 10
					},
					{
						id = 801082,
						level = 10
					}
				}
			},
			{
				tmpID = 9701094,
				configId = 9701094,
				skinId = 9701090,
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
						id = 801870,
						level = 10
					},
					{
						id = 801880,
						level = 10
					},
					{
						id = 801890,
						level = 10
					},
					{
						id = 801902,
						level = 10
					}
				}
			},
			{
				tmpID = 9703044,
				configId = 9703044,
				skinId = 9703040,
				id = 3,
				level = 125,
				equipment = {
					33133,
					90173,
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
						id = 801270,
						level = 10
					},
					{
						id = 801280,
						level = 10
					},
					{
						id = 801290,
						level = 10
					},
					{
						id = 801302,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 9705094,
				configId = 9705094,
				skinId = 9705090,
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
						id = 801680,
						level = 10
					},
					{
						id = 801690,
						level = 10
					},
					{
						id = 801702,
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
				tmpID = 9704034,
				configId = 9704034,
				skinId = 9704030,
				id = 2,
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
						id = 800460,
						level = 10
					},
					{
						id = 800470,
						level = 10
					},
					{
						id = 800480,
						level = 10
					},
					{
						id = 800492,
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
				tmpID = 9704044,
				configId = 9704044,
				skinId = 9704040,
				id = 3,
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
						id = 800540,
						level = 10
					},
					{
						id = 800550,
						level = 10
					},
					{
						id = 800560,
						level = 10
					},
					{
						id = 800572,
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
			}
		}
	}
}
