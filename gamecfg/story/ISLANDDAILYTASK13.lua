return {
	id = "ISLANDDAILYTASK13",
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
			animation = "talk",
			characterId = 101400,
			subName = "苗圃管理员",
			say = "谢谢指挥官……蜜蜂们都很开心呢。",
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
			subName = "苗圃管理员",
			characterId = 101400,
			say = "嗯……还有……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101400,
			subName = "苗圃管理员",
			say = "拉科尼亚也很开心的……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
