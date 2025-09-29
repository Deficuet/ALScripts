return {
	id = "ISLANDDAILYTASK10",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			animation = "talk",
			characterId = 100800,
			subName = "商区管理员",
			say = "指挥官的效率还是一如既往地高呢……",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商区管理员",
			characterId = 100800,
			say = "嗯……正是商区里缺少的东西，数量也刚刚好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "商区管理员",
			say = "真的帮大忙了，商区如今的繁荣离不开你的支持。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
