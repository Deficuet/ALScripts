return {
	id = "ISLANDSIDE00601",
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
			say = "梅莉，发生什么事了？",
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
			animation = "weep",
			characterId = 100500,
			subName = "牧场管理员",
			say = "指挥官，不好啦！我的羊！我的咩咩羊们不见啦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "不见了……什么时候的事？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧场管理员",
			characterId = 100500,
			say = "就、就不久前！我像往常一样去给它们准备饲料……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "然后等我回来时……所有的羊一只都没有了！全都不见了！",
			characterId = 100500,
			subName = "牧场管理员",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧场管理员",
			characterId = 100500,
			say = "只有坏掉的围栏……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "别急，梅莉，也许只是走远了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "你平时喜欢带他们去哪个地方？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100500,
			subName = "牧场管理员",
			say = "嗯……是牧场旁边的缓坡！平时它们最爱去那里了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "好，我知道了，我们一起过去看看，能不能发现些线索。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
