return {
	id = "ISLANDDAILYTASK9",
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
			animation = "doubt",
			characterId = 101000,
			subName = "集会島受付",
			say = "あっ、指揮官、私が必要としてるものを見つけてくれたのですね？",
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
			subName = "集会島受付",
			characterId = 101000,
			say = "はい。リストにあるものはすべて揃っています",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101000,
			subName = "集会島受付",
			say = "ちょうどいいタイミングです。これで島の施設の保守作業を始められます",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島受付",
			characterId = 101000,
			say = "これらを使って、皆さんの活動エリアをもっと快適で素敵な場所にしてみせます",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
