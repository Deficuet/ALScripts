return {
	id = 1946002,
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
			stageBuff = {
				{
					id = 201250,
					level = 1
				},
				{
					id = 295015,
					level = 1
				},
				{
					id = 295023,
					level = 1
				}
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
					triggerType = 0,
					waveIndex = 101,
					conditionType = 0,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "none",
							delay = 0,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201465
							}
						},
						{
							deadFX = "none",
							delay = 2,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201466
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 4,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								65
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 5,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								72
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 6,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								58
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "none",
							delay = 5,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201469
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 111,
					conditionType = 0,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "huoqiubaozha2",
							delay = 9,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								35
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 10,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								28
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 11,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								42
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "none",
							delay = 10,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201470
							}
						}
					}
				},
				{
					triggerType = 1,
					waveIndex = 201,
					preWaves = {
						100
					},
					triggerParams = {
						timeout = 14
					}
				},
				{
					triggerType = 0,
					waveIndex = 102,
					conditionType = 0,
					preWaves = {
						201
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16756104,
							delay = 0,
							sickness = 0.1,
							corrdinate = {
								20,
								0,
								62
							},
							buffList = {
								201350,
								295013,
								295014
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 3,
									addWeapon = {
										3296106,
										3296107
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 0,
									switchParam = 300,
									addWeapon = {
										3296108,
										3296109
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 103,
					conditionType = 0,
					preWaves = {
						201
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "none",
							delay = 4,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201467
							}
						}
					}
				},
				{
					triggerType = 1,
					waveIndex = 202,
					preWaves = {
						201
					},
					triggerParams = {
						timeout = 8
					}
				},
				{
					triggerType = 0,
					waveIndex = 104,
					conditionType = 1,
					preWaves = {
						102,
						202
					},
					triggerParam = {
						208
					},
					spawn = {
						{
							deadFX = "huoqiubaozha2",
							delay = 0,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								30
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 1,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								40
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 2,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								50
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 3,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								60
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 4,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								70
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "none",
							delay = 2,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201471
							}
						}
					}
				},
				{
					triggerType = 1,
					waveIndex = 203,
					conditionType = 1,
					preWaves = {
						102,
						202
					},
					triggerParams = {
						timeout = 8
					}
				},
				{
					triggerType = 0,
					waveIndex = 105,
					conditionType = 1,
					preWaves = {
						203
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16756104,
							delay = 0,
							sickness = 0.1,
							corrdinate = {
								20,
								0,
								38
							},
							buffList = {
								201350,
								295013,
								295014
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 3,
									addWeapon = {
										3296106,
										3296107
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 0,
									switchParam = 300,
									addWeapon = {
										3296108,
										3296109
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 106,
					conditionType = 1,
					preWaves = {
						203
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "none",
							delay = 4,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201468
							}
						}
					}
				},
				{
					triggerType = 1,
					waveIndex = 204,
					preWaves = {
						203
					},
					triggerParams = {
						timeout = 8
					}
				},
				{
					triggerType = 0,
					waveIndex = 107,
					conditionType = 1,
					preWaves = {
						105,
						204
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "huoqiubaozha2",
							delay = 0,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								70
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 1,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								60
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 2,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								50
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 3,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								40
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "huoqiubaozha2",
							delay = 4,
							monsterTemplateID = 16756103,
							sickness = 0.1,
							corrdinate = {
								25,
								0,
								30
							},
							buffList = {
								201350,
								295013,
								295014
							}
						},
						{
							deadFX = "none",
							delay = 2,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201471
							}
						}
					}
				},
				{
					triggerType = 1,
					waveIndex = 205,
					conditionType = 1,
					preWaves = {
						105,
						204
					},
					triggerParams = {
						timeout = 8
					}
				},
				{
					triggerType = 0,
					waveIndex = 108,
					conditionType = 1,
					preWaves = {
						205
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16756105,
							reinforceDelay = 6,
							delay = 0,
							sickness = 0.1,
							corrdinate = {
								20,
								0,
								50
							},
							buffList = {
								201350,
								295013,
								295014
							}
						}
					},
					reinforcement = {
						{
							deadFX = "none",
							delay = 0,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201465
							}
						},
						{
							deadFX = "none",
							delay = 0,
							monsterTemplateID = 16756201,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								201466
							}
						}
					}
				},
				{
					triggerType = 1,
					waveIndex = 206,
					conditionType = 1,
					preWaves = {
						205
					},
					triggerParams = {
						timeout = 14
					}
				},
				{
					triggerType = 1,
					waveIndex = 207,
					conditionType = 1,
					preWaves = {
						108,
						206
					},
					triggerParams = {
						timeout = 3
					}
				},
				{
					triggerType = 8,
					waveIndex = 208,
					conditionType = 1,
					preWaves = {
						207
					},
					triggerParams = {}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 1001,
					conditionType = 0,
					preWaves = {
						208
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16756111,
							delay = 0.5,
							sickness = 0.5,
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
								8831,
								200974
							},
							phase = {
								{
									switchParam = 0.5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 5,
									addWeapon = {
										3296121
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 7,
									setAI = 70235,
									addWeapon = {
										3296122,
										3296123
									},
									removeWeapon = {
										3296121
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 3,
									setAI = 75016,
									removeWeapon = {
										3296122,
										3296123
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 12,
									addWeapon = {
										3296124,
										3296125,
										3296126
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 1,
									switchParam = 4.5,
									removeWeapon = {
										3296124,
										3296125,
										3296126
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					waveIndex = 900,
					conditionType = 1,
					preWaves = {
						1001
					},
					triggerParams = {}
				},
				{
					triggerType = 11,
					waveIndex = 4001,
					conditionType = 1,
					preWaves = {},
					triggerParams = {
						op = 0,
						key = "warning"
					}
				}
			}
		}
	},
	fleet_prefab = {}
}
