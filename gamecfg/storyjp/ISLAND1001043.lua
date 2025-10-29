return {
	id = "ISLAND1001043",
	mode = 10,
	map = {
		{
			101400,
			10050003
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
			say = "――ラコニア、色々わかったよ",
			face2Face = {
				{
					0,
					101400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "……うん？",
			characterId = 101400,
			subName = "農園管理人",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――これに基礎的な栽培の仕方が載ってるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――苗木に適する温度や湿度、播種の深さに加えて、代表的な病害虫の見分け方や対策についてもまとめてある",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "わかった……ちゃんと読んでみる……",
			characterId = 101400,
			subName = "農園管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ああ、苗場の未来はラコニアにかかってるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "……うん……ちゃんと葉っぱ一枚ずつ、大事に育てる……",
			characterId = 101400,
			subName = "農園管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
