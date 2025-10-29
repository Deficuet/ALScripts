return {
	id = "ISLANDSIDE00804",
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
			characterId = 0,
			say = "――ステファン、石炭も持ってきた。これで足りるか見てくれ",
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
			animation = "nod",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "おお！さすが指揮官、仕事が早い！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "どれどれ……うんうん！問題なし、これだけあれば十分！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "これでオーダーに対応できる…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "本当に指揮官のおかげだよ！ありがと～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――他に問題がないならもう行っていいか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "あっ、あとはパトリックに依頼完了って伝えておいてね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
