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
					"▇▇：▇▇（UTC-▇）",
					0.2
				},
				{
					"▇ ▇ ▇島海域",
					0.3
				}
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			say = "\t我が潜水支援艦隊は高価値目標を発見。攻撃を開始せり",
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
