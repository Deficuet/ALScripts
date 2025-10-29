return {
	id = "ISLANDDAILYTASK11",
	mode = 10,
	map = {
		{
			100100,
			10010041
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
			characterId = 100100,
			subName = "製粉所管理人",
			say = "Zzz……ん？指揮官……これは水車小屋に必要な物か……",
			face2Face = {
				{
					0,
					100100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100100,
			subName = "製粉所管理人",
			say = "……ああ、そっちに置いてくれればいいよ……ありがとう……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "製粉所管理人",
			characterId = 100100,
			say = "これで……もう少し寝れる……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "製粉所管理人",
			characterId = 100100,
			say = "Zzzzzz……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
