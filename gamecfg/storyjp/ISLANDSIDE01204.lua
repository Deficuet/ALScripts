return {
	id = "ISLANDSIDE01204",
	mode = 10,
	map = {
		{
			100700,
			10040002
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			animation = "doubt",
			characterId = 100700,
			subName = "森の管理人",
			say = "ルシタニアの剪定バサミが壊れたんですね？",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――なんだか、驚きがなさそうな口ぶりだね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100700,
			subName = "森の管理人",
			say = "そうですね。前回の注文から随分と経ってますし",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "森の管理人",
			characterId = 100700,
			say = "むしろ、今まで壊れなかったことに驚いてますよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "少し待ってください。新しいものを作ってきますので",
			characterId = 100700,
			animation = "talk",
			subName = "森の管理人",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "森の管理人",
			characterId = 100700,
			say = "あ、お金はご心配なく、ルシタニアにつけておきますから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
