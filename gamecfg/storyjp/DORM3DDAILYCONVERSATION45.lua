return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION45",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "いつからシリアスが{dorm3d}を想うようになったのかを知りたい…ですか？",
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
							name = "sikao2",
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
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "実は、{dorm3d}にお会いした瞬間から、シリアスは…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "{dorm3d}は？{dorm3d}はいつからシリアスのことを…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "――シリアスと同じだよ",
					flag = 1
				},
				{
					content = "――気がついたら…",
					flag = 2
				}
			}
		},
		{
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "まさか{dorm3d}からこの質問の答えを聞けるなんて…シリアスはとても嬉しいです。誇らしき{dorm3d}…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
