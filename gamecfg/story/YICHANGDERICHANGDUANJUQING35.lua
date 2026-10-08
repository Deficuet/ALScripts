return {
	id = "YICHANGDERICHANGDUANJUQING35",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			actor = 317031,
			NextIcon = 1,
			side = 2,
			hidePaintObj = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "{namecode:314:伊14}正盯着手中正在描摹的面具发呆。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			actor = 317031,
			say = "嘟……你又来了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317031,
			nameColor = "#A9F548FF",
			side = 2,
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			say = "这次又想问什么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "有什么感兴趣的事情吗，我陪你。",
					flag = 1
				},
				{
					content = "这些面具是什么情况？",
					flag = 2
				}
			}
		},
		{
			actor = 317031,
			nameColor = "#A9F548FF",
			side = 2,
			hidePaintObj = true,
			dir = 1,
			optionFlag = 1,
			NextIcon = 1,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			NextIcon = 1,
			dir = 1,
			optionFlag = 1,
			actor = 317031,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "我想和你一起玩吹泡泡，可以吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317031,
			nameColor = "#A9F548FF",
			side = 2,
			hidePaintObj = true,
			dir = 1,
			optionFlag = 2,
			NextIcon = 1,
			say = "伪装用的道具罢了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			NextIcon = 1,
			dir = 1,
			optionFlag = 2,
			actor = 317031,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "戴上它，也只会变得空虚。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
