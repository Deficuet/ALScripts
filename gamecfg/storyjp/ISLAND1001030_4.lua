return {
	id = "ISLAND1001030_4",
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
			characterId = 0,
			say = "――ブレーメン、オムレツをステファンに届けたら彼女から提案があったから聞いてほしい",
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
			say = "提案？",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――さっきのオムレツのように、島の食材を使った料理を販売したら？って",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "いいね。ただ……今のところ島の食材供給はまだ安定してないのがネックだけど…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――それは確かに…じゃあ食材の件はこっちが何とかしよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――今販売できる料理の数は限られるにしろ、ここが発展すれば、種類も量も着実に増えていくだろう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "カフェ店員",
			say = "じゃあ、今ある食材で作れる料理を先に販売して、様子を見てからにしない？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――そうしよう。さっき作ってくれたオムレツは販売ラインナップに追加で",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
