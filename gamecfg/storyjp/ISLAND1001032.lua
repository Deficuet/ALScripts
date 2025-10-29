return {
	id = "ISLAND1001032",
	mode = 10,
	map = {
		{
			101300,
			10030003
		}
	},
	look_weight = {
		{
			0.8,
			0
		},
		{
			0.2,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			say = "――メリー？どうしてここに……",
			face2Face = {
				{
					0,
					101300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "いらっしゃーい！",
			characterId = 101300,
			animation = "hi",
			subName = "集会島ガイド",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "親愛なる指揮官、集会島へようこそ！あなたの専属案内人、メリーだよ！",
			characterId = 101300,
			subName = "集会島ガイド",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――……は？な、なんだって？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "島、浜辺、埠頭……",
					flag = 1
				},
				{
					content = "キラキラ輝く宝の島はどこ？",
					flag = 2
				}
			}
		},
		{
			characterId = 0,
			optionFlag = 1,
			say = "――どう見ても宝の島じゃないだろ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			optionFlag = 2,
			say = "――どっちかというと、リゾート島にしか見えないけど……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "宝の島？ああ、開発エリアに来たばかりの頃みんながでっち上げた名前ね",
			characterId = 101300,
			animation = "doubt",
			subName = "集会島ガイド",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島ガイド",
			characterId = 101300,
			say = "今はもう開発エリアの一部で、「集会島」って名前だよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "本来ならみんなが思いっきり楽しめる最高のリゾート地にする予定だったけど",
			characterId = 101300,
			subName = "集会島ガイド",
			animation = "elation",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ここも結局は資金難で開発が止まったってことか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "そうなの！指揮官、そこに広がる空き地が見える？",
			characterId = 101300,
			animation = "clap",
			subName = "集会島ガイド",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島ガイド",
			characterId = 101300,
			say = "城や遊園地、海辺の別荘……計画はいろいろあるけど、完成はまだまだ先になりそうなんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島ガイド",
			characterId = 101300,
			say = "でも現状のままでも十分にくつろげると思う",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――……なるほど。明石がやけに乗り気だった理由がようやくわかった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――わざわざ飛行装置まで直して……やっぱり裏があったんだな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――じゃあ聞くけど、「宝の島」が嘘なら、その「お宝」とやらも、明石が建材を売るための作り話だろうな？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "ううん！集会島は毎日色んなものが手に入る場所なの",
			characterId = 101300,
			animation = "shakehead",
			subName = "集会島ガイド",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――色んなもの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会島ガイド",
			characterId = 101300,
			say = "うん、明石が残した装置で座標の特定が可能だよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――それがお宝なの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "実際に見ればわかるよ。指揮官、ついて来て！",
			characterId = 101300,
			subName = "集会島ガイド",
			animation = "elation",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――……わかった。案内を頼む",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
