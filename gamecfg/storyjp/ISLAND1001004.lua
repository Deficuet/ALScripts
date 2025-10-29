return {
	id = "ISLAND1001004",
	mode = 10,
	map = {
		{
			100600,
			10040022
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
			animation = "sad",
			characterId = 100600,
			subName = "鉱山管理人",
			say = "やばい！まだ全然足りない！どうしよう！",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "ジョン、何か困りごとでも？",
					flag = 1
				}
			}
		},
		{
			say = "わあ！指揮官！？よかった！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "scare",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "ええと、あそこのバス停が完全に壊れちゃって、修理に物凄い量の石炭が必要なんだけど、うち一人で掘ってたらとてもじゃないけど間に合わなくて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――ん？ここは鉱山なのに余ってないのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "全部使い切っちゃったんだ！前にあった分も港へ運ぼうとしたら爆発に巻き込まれちゃって……",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "鉱山管理人",
			say = "はあ、今回は間に合いそうにないね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "手伝おう",
					flag = 1
				}
			}
		},
		{
			say = "え？本当に？！やったぁ！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――もちろん。交通網が麻痺したのは自分のせいでもあるしな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "助かるよ！人手不足だったからよかったぁ！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "さっそく頑張ろう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
