return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION11022",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "想去什么地方玩？",
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
							name = "doubt_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "face_yihuo_start",
							type = "action"
						},
						{
							skip = false,
							time = 1.5,
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
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "有很多！但，在哪里都比不上在这里。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "闹闹哄哄的港区，和喜欢的人。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "这就是Black Dragon最大的财富啦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
