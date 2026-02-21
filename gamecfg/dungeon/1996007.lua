return {
	id = 1996007,
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
						id = "XIANGCHEYUTIANQIONGZHIYIN37-1"
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
							monsterTemplateID = 16807202,
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
							monsterTemplateID = 16807203,
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
							monsterTemplateID = 16807202,
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
					conditionType = 1,
					preWaves = {
						101,
						202
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807201,
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
							monsterTemplateID = 16807204,
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
							monsterTemplateID = 16807201,
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
						102,
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807202,
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
							monsterTemplateID = 16807203,
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
							monsterTemplateID = 16807205,
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
							monsterTemplateID = 16807203,
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
							monsterTemplateID = 16807202,
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
					triggerType = 1,
					waveIndex = 402,
					preWaves = {
						103
					},
					triggerParams = {
						timeout = 0.1
					}
				},
				{
					triggerType = 3,
					waveIndex = 502,
					preWaves = {
						402
					},
					triggerParams = {
						id = "XIANGCHEYUTIANQIONGZHIYIN37-2"
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
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16807403,
							delay = 0,
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
								200825,
								201685
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
									switchParam = 10,
									addWeapon = {
										3342101,
										3342102,
										3342103
									}
								},
								{
									index = 2,
									switchParam = 3,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3342104,
										3342105
									},
									removeWeapon = {
										3342101,
										3342102,
										3342103
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 13,
									addWeapon = {
										3342106
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 1,
									switchParam = 1,
									removeWeapon = {
										3342104,
										3342105,
										3342106
									}
								}
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
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807203,
							delay = 2,
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
							monsterTemplateID = 16807203,
							delay = 2,
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
							monsterTemplateID = 16807203,
							delay = 2,
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
							monsterTemplateID = 16807204,
							reinforceDelay = 6,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							delay = 2,
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
							monsterTemplateID = 16807204,
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
					},
					reinforcement = {
						{
							monsterTemplateID = 16807201,
							delay = 2,
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
							monsterTemplateID = 16807201,
							delay = 2,
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
							monsterTemplateID = 16807201,
							delay = 2,
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
					triggerType = 1,
					waveIndex = 403,
					preWaves = {
						105
					},
					triggerParams = {
						timeout = 0.1
					}
				},
				{
					triggerType = 3,
					waveIndex = 503,
					preWaves = {
						403
					},
					triggerParams = {
						id = "XIANGCHEYUTIANQIONGZHIYIN37-3"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 106,
					conditionType = 0,
					preWaves = {
						105
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16807404,
							delay = 0,
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
								200825,
								201685
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
										3344001,
										3344002
									}
								},
								{
									index = 2,
									switchParam = 11,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3344003,
										3344004
									},
									removeWeapon = {
										3344001,
										3344002
									}
								},
								{
									index = 3,
									switchParam = 2,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3344005
									},
									removeWeapon = {
										3344003,
										3344004
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 14,
									addWeapon = {
										3344006
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 1,
									switchParam = 1,
									removeWeapon = {
										3344005,
										3344006
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 107,
					conditionType = 0,
					preWaves = {
						106
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16807203,
							delay = 2,
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
							monsterTemplateID = 16807203,
							delay = 2,
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
							monsterTemplateID = 16807203,
							delay = 2,
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
							monsterTemplateID = 16807204,
							reinforceDelay = 6,
							deadFX = "bomb_unknownV",
							sickness = 0.1,
							delay = 2,
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
							monsterTemplateID = 16807204,
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
					},
					reinforcement = {
						{
							monsterTemplateID = 16807201,
							delay = 2,
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
							monsterTemplateID = 16807201,
							delay = 2,
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
							monsterTemplateID = 16807201,
							delay = 2,
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
					triggerType = 1,
					waveIndex = 404,
					preWaves = {
						107
					},
					triggerParams = {
						timeout = 0.1
					}
				},
				{
					triggerType = 3,
					waveIndex = 504,
					preWaves = {
						404
					},
					triggerParams = {
						id = "XIANGCHEYUTIANQIONGZHIYIN37-4"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 108,
					conditionType = 0,
					preWaves = {
						107
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16807405,
							delay = 0,
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
								200825,
								201685
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
					triggerType = 3,
					waveIndex = 505,
					preWaves = {
						108
					},
					triggerParams = {
						id = "XIANGCHEYUTIANQIONGZHIYIN37-5"
					}
				},
				{
					triggerType = 8,
					key = true,
					waveIndex = 900,
					preWaves = {
						505
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 900538,
				configId = 900538,
				skinId = 900538,
				id = 1,
				level = 200,
				equipment = {},
				properties = {
					cannon = 8000,
					air = 0,
					antiaircraft = 800,
					torpedo = 8000,
					durability = 1000000,
					reload = 600,
					armor = 0,
					dodge = 100,
					speed = 30,
					luck = 99,
					hit = 500
				},
				skills = {
					{
						id = 201684,
						level = 1
					}
				}
			}
		}
	}
}
