return {
	id = "ISLANDSIDE01008",
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
			say = "（需要新鲜胡萝卜的话，农场里应该有很多。）",
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
			say = "指挥官？我刚刚从田里回来呢，您需要什么食材？",
			characterId = 100400,
			subName = "农田管理员",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "有新鲜采摘的胡萝卜么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "胡萝卜？好巧，今天刚刚收获了一批呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100400,
			subName = "农田管理员",
			say = "请收下，这些都是刚拔的……汁水很饱满的红心胡萝卜。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "需要多少，都请尽管拿吧~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
