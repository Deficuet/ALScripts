return {
	id = "ISLANDDAILYTASK8",
	mode = 10,
	map = {
		{
			101300,
			10030003
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
			animation = "amaze",
			characterId = 101300,
			subName = "集会島ガイド",
			say = "わっ！指揮官！あたしが欲しかったものを見つけてきてくれたんだ！",
			face2Face = {
				{
					0,
					101300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島ガイド",
			characterId = 101300,
			say = "どんなものか早く見せて〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島ガイド",
			characterId = 101300,
			say = "すごい！見た目でももう美味しそう！ありがとう、指揮官！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101300,
			subName = "集会島ガイド",
			say = "えへへ、エネルギー補給もバッチリ！また元気いっぱいでみんなに島の案内ができるよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
