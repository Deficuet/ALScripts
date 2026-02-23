return {
	id = "SHILIUZHANG1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			blackBg = true,
			typewriterTime = 0.02,
			bgm = "musashi-2",
			sequence = {
				{
					"▇▇-▇▇-▇▇▇▇",
					0.1
				},
				{
					"▇▇:▇▇ (UTC-▇)",
					0.2
				},
				{
					"▇▇▇▇ Island Area",
					0.3
				}
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			say = "Your supporting Submarine Fleet has found a high-value target. Commence attack.",
			hidePaintObj = true,
			effects = {
				{
					active = true,
					name = "wangyuanjinglvjing"
				}
			}
		}
	}
}
