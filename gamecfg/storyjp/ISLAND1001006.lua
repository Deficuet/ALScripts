return {
	id = "ISLAND1001006",
	mode = 10,
	map = {
		{
			100700,
			10040060
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
			animation = "talk",
			say = "――オブライン……どう？これで木材は足りた？",
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
			say = "はい！指揮官さん、ありがとうございます……木材はこれで十分です",
			characterId = 100700,
			subName = "森の管理人",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――じゃあ急いでジョンのところへ戻ろう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "はい……ジョンは港方面のバス停で待っていると思います",
			characterId = 100700,
			subName = "森の管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "森の管理人",
			characterId = 100700,
			say = "一緒に向かいましょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
