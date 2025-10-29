return {
	id = "ISLANDSIDE01005",
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
			say = "――ブレーメン、ちょっと頼みたいことがあるんだ",
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
			subName = "カフェ店員",
			characterId = 101200,
			say = "アイスコーヒー？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ああ、いつものやつで頼む",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "――……おっと、自分もコーヒーが欲しいが、今回は別の話だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――パトリックのことだ。彼女は全力で仕事に打ち込みたくても、時々どうしても眠くなることがあるらしくて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ブレーメンのところに、元気を出せて頭も冴える飲み物って何かない？やっぱりコーヒーかな？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "うーん……パトリックは前にもコーヒーを試してたけど、効果はあまりなかったみたいなんだよね",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "眠いときは結局眠くなっちゃうみたいで……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "でも、元気いっぱいといえば、牧場のアメリゴはいつもエネルギッシュだよ",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "彼女からなら何かアドバイスがもらえるかも？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――わかった、当たってみるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
