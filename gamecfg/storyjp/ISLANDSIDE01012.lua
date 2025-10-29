return {
	id = "ISLANDSIDE01012",
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
			say = "――新鮮な卵を持ってきた",
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
			say = "いいね〜",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "今回はたくさんの卵白を泡立てないといけないから、二人でやりたいかな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "指揮官、一緒に泡立ててもらってもいい？",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――もちろんだ",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "硬く角が立つまで泡立てて。雲みたいに真っ白でふわふわになるまでね〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "じゃ、一緒にやってみよう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "うんうん……その感じ！指揮官は泡立てるのが上手ね！",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "スタンダードエナジースペシャル――完成！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "カフェ店員",
			say = "これならきっと大丈夫！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
