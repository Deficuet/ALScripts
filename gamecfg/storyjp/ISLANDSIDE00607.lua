return {
	id = "ISLANDSIDE00607",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			say = "――ホメリック、ちょっといいか",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100400,
			subName = "畑管理人",
			say = "あっ、指揮官。どうしました？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――アメリゴの羊たちがほとんどいなくなっちゃったんだ。この辺りで羊の群れを見かけたり、何か音を聞いたりしなかったか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100400,
			subName = "畑管理人",
			say = "えっ？いなくなった羊ですか？それはあの子たちの……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ホメリック、些細なことでもいいから教えてほしい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "畑管理人",
			say = "あっ、ごめんなさい……でも、確かに少し心当たりが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "たしか……2時間ちょっと前だったかも？東側の畑の土壌湿度を記録してた時……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "遠くからメェ～って鳴き声が聞こえた気がするんです。かなりにぎやかでした……声の方向は……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 100400,
			subName = "畑管理人",
			say = "うーん……正確な場所はわかりませんが……農場の裏手にある林の方だと思います",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――そっちへ行ったのか……大体の場所さえわかれば何とかなる。今すぐ行ってみるよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ありがとう、ホメリック",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100400,
			subName = "畑管理人",
			say = "はい、お気をつけて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
