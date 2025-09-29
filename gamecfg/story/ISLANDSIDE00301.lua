return {
	id = "ISLANDSIDE00301",
	mode = 10,
	map = {},
	scripts = {
		{
			animation = "talk",
			characterId = 0,
			say = "嗯？机器怎么卡住了？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			withoutIcon = true,
			withoutName = true,
			say = "一旁的服务器中传来一声爆鸣，随后是滋滋的异响，像是正在被烧烤的土豆。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			withoutIcon = true,
			withoutName = true,
			say = "无论怎么操作，机器都再没有任何反应。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "看起来……服务器不是卡住，是彻底宕机了。",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "{namecode:98:明石}也不在……只能先去问问布莱梅了，希望会有什么应急预案。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
