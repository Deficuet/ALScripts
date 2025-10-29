return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION12038",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 30707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "最近、大鳳はばんそうこうの新しい使い方を発見しましたわ！怪私を治すのを促進するだけじゃなく、なんと服の代わりにもなるそうで！",
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
							name = "happy_01-start",
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
			}
		},
		{
			side = 2,
			actorName = 30707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "ほら、たった3枚あれば、ここに1枚、ここにも1枚、そして……ここにもう1枚貼れば……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 30707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "どういう見栄えになるのかは気になりますけどぉ…指揮官様、モデルになってくださいます？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
