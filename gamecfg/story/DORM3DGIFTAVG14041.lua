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
			say = "Join me for a while, {dorm3d}.",
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
			say = "I have the perfect drink to grace this lovely new glass.",
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
			say = "Today, I'll share this sublime flavor with you.",
			voice = "event:/dorm/drom3d_aegir_gift_timeline01_voice3/drom3d_aegir_gift_timeline01_voice3",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Sublime, you say?",
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
			say = "That's right. Heehee, you'd better savor it.",
			voice = "event:/dorm/drom3d_aegir_gift_timeline01_voice4/drom3d_aegir_gift_timeline01_voice4",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
