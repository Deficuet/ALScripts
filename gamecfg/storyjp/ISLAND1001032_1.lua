return {
	id = "ISLAND1001032_1",
	mode = 10,
	map = {
		{
			101300,
			10030006
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
			characterId = 0,
			say = "――これがその装置？",
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
			say = "そうだよ。指揮官、私の言う通りに試してみて",
			characterId = 101300,
			animation = "elation",
			subName = "集会島ガイド",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島ガイド",
			characterId = 101300,
			say = "ボタンを押すとすぐに色々な物資が落ちてくるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――ほぅ……面白そうだな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――やってみるか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
