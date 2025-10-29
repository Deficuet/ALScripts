return {
	id = "ISLANDSIDE01014",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			characterId = 101200,
			subName = "カフェ店員",
			say = "今回のレシピはうまくいった？",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "happy",
			characterId = 101200,
			subName = "カフェ店員",
			say = "それはよかった〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――それと、彼女から改良の提案もあった……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "生産量的には実現できそうかな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "カフェ店員",
			say = "要するに、今回のエナジースペシャルをベースにして、もっと味のバリエーションを豊富にしたフルーツエナジースペシャルが欲しいってことでしょ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "そのアイデアはもらうよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "カフェ店員",
			say = "指揮官、時間があるときに新しいエナジードリンクを一緒に開発しようね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
