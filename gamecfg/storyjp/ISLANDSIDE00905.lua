return {
	id = "ISLANDSIDE00905",
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
			characterId = 0,
			say = "――あの謎の依頼が終わったよ",
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
			animation = "clap",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "おお！さすが指揮官、あんな怪しい依頼だったのに！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "curious",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "ねぇねぇ、それでどんな依頼だったの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――依頼書に書いてあった通りだったよ、ただの貨物輸送だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――詳しいことは、後で明石が来たら本人に聞けばいい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "おお、運び先が明石だったのか。どうりで秘密にしてたわけだ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "じゃあ、指揮官の任務完了って記録しておくね〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
