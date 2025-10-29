return {
	id = "ISLANDSIDE00108",
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
			characterId = 0,
			say = "――オブライン、頼まれた木材だ",
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
			animation = "clap",
			characterId = 100700,
			subName = "森の管理人",
			say = "はい！どれもとても良い木材ですね！こっちも臨時レールを用意できました",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "森の管理人",
			characterId = 100700,
			say = "ほら、表面は滑らかで寸法もぴったりの木のレールです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――触った感じもかなり硬いな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100700,
			subName = "森の管理人",
			say = "ええ……ジョンもきっと待ちくたびれてるはずです。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "森の管理人",
			characterId = 100700,
			say = "指揮官さん、早くこの臨時レールを届けてあげてください！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
