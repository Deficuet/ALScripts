return {
	id = "ISLANDSIDE01302",
	mode = 10,
	map = {
		{
			100300,
			10020004
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
			animation = "hi",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "こんにちは、指揮官。今日はどうしてここに？",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――ラベンダーに使う肥料が全然届かないと、ラコニアが言ってたんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――何かトラブルでもあったのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "ちょうど彼女のところに行こうと思ってて…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "実は……貨物の運送で農場を通った時に、多くの牛が突進してきちゃって！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "それで貨物が落ちてめちゃくちゃになって……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "ラコニアの肥料も、恐らくあの中に……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――そうだったのか……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
