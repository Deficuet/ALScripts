return {
	id = "ISLAND1001020_1",
	mode = 10,
	map = {
		{
			3120100,
			10070005
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
			say = "嗯？这机器怎么就停了？我还打算多叫点帮手来的。",
			face2Face = {
				{
					0,
					3120100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 3120100,
			say = "没办法……奇异点的规则十分复杂，权限认证函也是有制作周期的喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "不过不用担心，权限一次认证永久有效，之后会有越来越多的同伴来到岛屿上帮助建设的喵！~",
			characterId = 3120100,
			animation = "",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "不过现在，还是先去码头迎接新来的伙伴吧喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
