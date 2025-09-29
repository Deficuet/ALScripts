return {
	id = "ISLANDSIDE01308",
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
			say = "所有的薰衣草都在这里了",
			animation = "talk",
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
			animation = "clap",
			characterId = 101400,
			subName = "苗圃管理员",
			say = "辛苦了，指挥官……我马上把订单需要的作物打包好！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "苗圃管理员",
			characterId = 101400,
			say = "已经没有多少时间了……！好紧张……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "放轻松，我们能赶上的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "苗圃管理员",
			characterId = 101400,
			say = "嗯……我要冷静……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101400,
			subName = "苗圃管理员",
			say = "订单的包裹……准备好了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "我这就把包裹送去港口。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 101400,
			subName = "苗圃管理员",
			say = "指挥官……路上小心……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "苗圃管理员",
			characterId = 101400,
			say = "安全第一……不要太着急哦……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
