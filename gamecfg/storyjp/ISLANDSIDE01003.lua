return {
	id = "ISLANDSIDE01003",
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
			characterId = 100300,
			subName = "物流スタッフ",
			say = "何か私にしてほしいことがあるの？",
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
			say = "ステファンにこれまでの経緯を説明した……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "curious",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "……なるほど、そういうこと！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "パトリックを応援したいなら……もっと依頼を出してあげればいいじゃない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "そうすれば、指揮官が彼女の能力を信頼してるって伝わるはず",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――…本気にしていいの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "scare",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "冗談だってば！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "でも、こういうことは私に聞いても意味ないよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "やっぱりパトリック本人が、自分に何が必要か一番わかってるだろうし",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――なるほど、一理あるな。ありがとう、ステファン",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "私は何もしてないよ。いいお知らせを楽しみにしてるからね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
