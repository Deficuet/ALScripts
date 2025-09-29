return {
	id = "ISLANDDAILYTASK17",
	mode = 10,
	map = {
		{
			100500,
			10010003
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
			say = "梅莉……你的动物朋友们都安静下来了。",
			face2Face = {
				{
					0,
					100500
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100500,
			subName = "牧场管理员",
			say = "真、真的欸？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "只要找到它们舒服的地方，耐心地安抚它们就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧场管理员",
			characterId = 100500,
			say = "唔……梅莉也是这么做的啊？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100500,
			subName = "牧场管理员",
			say = "难道是我还不够耐心？不——不会吧？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没关系，以后多试试就好了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
