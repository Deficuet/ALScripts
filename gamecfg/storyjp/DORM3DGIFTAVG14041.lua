return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DGIFTAVG14041",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 49905,
			side = 2,
			wait = 1,
			hidePaintObj = true,
			nameColor = "#FFFFFF",
			say = "指揮官、ちょっと付き合ってくれる？",
			voice = "event:/dorm/drom3d_aegir_gift_timeline01_voice1/drom3d_aegir_gift_timeline01_voice1",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "anger_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_think_start",
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
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 49905,
			wait = 1,
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFFFFF",
			say = "新しいグラスに相応しい、とっておきの一本を用意したわ",
			voice = "event:/dorm/drom3d_aegir_gift_timeline01_voice2/drom3d_aegir_gift_timeline01_voice2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 49905,
			wait = 1,
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFFFFF",
			say = "今日はこの極上の味を味わわせてやるわ",
			voice = "event:/dorm/drom3d_aegir_gift_timeline01_voice3/drom3d_aegir_gift_timeline01_voice3",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "極上の味？",
					flag = 1
				}
			}
		},
		{
			side = 2,
			actorName = 49905,
			wait = 1,
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFFFFF",
			say = "ふふふ、そうよ。ありがたく享受なさい",
			voice = "event:/dorm/drom3d_aegir_gift_timeline01_voice4/drom3d_aegir_gift_timeline01_voice4",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
