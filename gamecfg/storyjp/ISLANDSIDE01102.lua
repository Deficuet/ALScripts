return {
	id = "ISLANDSIDE01102",
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
			say = "――商店街に新しい店を増やすために、みんなの意見を聞きに来たんだ",
			animation = "talk",
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
			characterId = 0,
			say = "――どんな店がいいと思う？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 101200,
			subName = "カフェ店員",
			say = "え？商店街で新しい店をオープンさせるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "個人的な意見だと、うーん、そうだね……客同士の話なども鑑みて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "ミルクティー専門店とかはどうかな？",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ミルクティー専門店？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "カフェ店員",
			say = "そうだよ。饅頭カフェにミルクティーはないの？って、よく聞かれるの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "正直に言って、ちょっと面倒くさいというか……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――なるほど…確かに母港でもミルクティーを好きな子はたくさんいるね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "なかなか良いアイデアだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――美味しくて、そしてゆっくりとひと時を過ごせるミルクティー専門店なら、きっと人気が出るだろう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 101200,
			subName = "カフェ店員",
			say = "そして……カフェに来てミルクティーがないか聞いてくる客も減るっと…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――そうだね。ミルクティー専門店があれば、みんなそこで買うはずだから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――じゃあ、港のほうで聞き込みをしてくるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 101200,
			subName = "カフェ店員",
			say = "うん、じゃあね、指揮官",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
