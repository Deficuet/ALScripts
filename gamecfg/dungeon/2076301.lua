return {
	id = 2076301,
	stages = {
		{
			stageIndex = 1,
			backGroundStageID = 1,
			timeCount = 180,
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
							monsterTemplateID = 16906201,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {},
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
									switchParam = 4,
									addWeapon = {
										3440621
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 6,
									addWeapon = {
										3440622
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 1,
									removeWeapon = {
										3440621,
										3440622
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 8,
									addWeapon = {
										3440623
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 1,
									switchParam = 3,
									removeWeapon = {
										3440623
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16906002,
							delay = 1,
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
							monsterTemplateID = 16906002,
							delay = 1,
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
					triggerType = 8,
					waveIndex = 900,
					preWaves = {
						101
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
