return {
	id = "ISLAND1001034_3",
	mode = 10,
	map = {
		{
			101000,
			10030008
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
			say = "――エリザベス、戻ったよ",
			face2Face = {
				{
					0,
					101000
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "指揮官、お疲れさまです。材料は揃いましたか？",
			characterId = 101000,
			subName = "集会島受付",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――ああ、エリザベスのリスト通りに全部用意してきた",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "どれどれ……はい。問題ありません",
			characterId = 101000,
			animation = "talk",
			subName = "集会島受付",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島受付",
			characterId = 101000,
			say = "それでは、あとは専門家の腕の見せ所ですね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――まだ来てないのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "もう集会島の港で待っているので、会いに行ってあげてくださいね",
			characterId = 101000,
			animation = "talk",
			subName = "集会島受付",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
