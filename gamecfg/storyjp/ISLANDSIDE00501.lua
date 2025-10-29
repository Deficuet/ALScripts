return {
	id = "ISLANDSIDE00501",
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
			say = "――ブレーメン、自分を探してたって聞いたけど、どうかした？",
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
			animation = "curious",
			characterId = 101200,
			subName = "カフェ店員",
			say = "指揮官……来てくれてありがとう。あの、最近牧場のほうで変なことが起きてるって知ってる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――変なこと？牧場で？まさかアメリゴの動物がまた逃げ出したとか……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "そういうんじゃなくて、もっと……ぞくっとくるような話だよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "カフェ店員",
			say = "最近あそこはいろんな変な音が聞こえるとかで……皆「お化けが出る」って言ってるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――……お化けか。確かにただ事じゃないな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――事情はわかった。牧場はホメリックとアメリゴが管理してるよね？ふたりに詳しく聞いてみるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 101200,
			subName = "カフェ店員",
			say = "気をつけてね。指揮官",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
