return {
	id = "ISLANDSIDE00710",
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
			say = "――レシピを持ってきたよ",
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
			animation = "nod",
			characterId = 101200,
			subName = "カフェ店員",
			say = "あっ、これこれ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "レシピを見ただけで、あの時の味を思い出すよ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "カフェ店員",
			say = "指揮官にも今すぐ味わってほしいくらい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "でも……フレッシュレモン、ハチミツ、それにローズマリー……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "カフェ店員",
			say = "ちょうどお店に材料がなくて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――この材料なら島で揃えられそうだな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "カフェ店員",
			say = "商店街のアムマーマーさんに聞いてみてもいいと思う。きっと教えてくれるから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
