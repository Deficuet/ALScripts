return {
	id = "ISLANDSIDE01009",
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
			animation = "hi",
			say = "――ブレーメン、頼まれたニンジンを持ってきた",
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
			say = "ありがとう、指揮官〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "カフェ店員",
			say = "やっぱりホメリックが育てたニンジンは格別だね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "よ～し……材料もそろったし、奇跡でも起こそうじゃないの〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "新鮮なニンジンジュースに、ハチミツを少し、そして……",
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
			say = "うーん、配分はもう少し調整したほうがいいかな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "グルグルっとまぜまぜして……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "カフェ店員",
			say = "できあがり〜！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――うん、美味しそうだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――パトリックに渡す前に……同じく元気が必要な人に飲んでもらおう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
