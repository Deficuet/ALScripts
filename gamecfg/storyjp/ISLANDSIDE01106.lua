return {
	id = "ISLANDSIDE01106",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			say = "――食材を持ってきたよ",
			animation = "talk",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100800,
			subName = "商店街管理人",
			say = "いいですね……どの食材もすごく良いものです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商店街管理人",
			characterId = 100800,
			say = "見てください、お店の建設も全部終わりました",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――内装は明るく、清潔な印象でなかなかいい感じだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "商店街管理人",
			say = "お店が一つしかなかった商店街にミルクティー専門店、軽食店、焼肉店が増え、きっと賑やかになりますね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――これも全部アムマーマーのおかげだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 100800,
			subName = "商店街管理人",
			say = "そんなことはありません。皆さんの協力があったからこそです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商店街管理人",
			characterId = 100800,
			say = "ありがとうございました",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
