return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DDAILYCONVERSATION79",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "说起来，入住宿舍以后……有些事情朝着更好的方向发展了呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "toukan",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 2.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "感谢您让天狼星入住这里，我骄傲的{dorm3d}。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "朝着更好的方向发展？",
					flag = 1
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "比如能够像与{dorm3d}像这样长时间的近距离接触……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "dianshouzhi",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 1,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "而且无论{dorm3d}要做什么，天狼星都能够在第一时间给予回应。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "这些对于天狼星来说，就是朝着更好的方向发展了哦。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "天狼星希望，这种幸福的时光能够长长久久的持续下去。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
