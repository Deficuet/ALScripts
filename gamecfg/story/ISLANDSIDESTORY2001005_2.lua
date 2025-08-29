return {
	id = "ISLANDSIDESTORY2001005_2",
	mode = 10,
	map = {
		{
			100700,
			10040002
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
			subName = "林场管理员",
			characterId = 100700,
			say = "嗯，我很快就加工好，指挥官稍等片刻……",
			animation = "talk",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 100700,
			subName = "林场管理员",
			say = "好了！片刻间完成！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "林场管理员",
			characterId = 100700,
			say = "乔安应该等急了，指挥官，我们快把临时轨道送去，让她先开工吧！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
