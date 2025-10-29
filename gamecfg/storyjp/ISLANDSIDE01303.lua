return {
	id = "ISLANDSIDE01303",
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
			say = "――ラコニア、注文した肥料は運送中にちょっとしたトラブルがあって…ダメになったみたいなんだ",
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
			animation = "sad",
			characterId = 101400,
			subName = "農園管理人",
			say = "そうなのね………ありがとう、指揮官",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "でも肥料がないと……受けた注文が……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "もう、ダメなのかな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "――諦めないで。きっと方法はある",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――例えば……もう一度肥料を注文してみるとか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "指揮官……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101400,
			subName = "農園管理人",
			say = "そうだよね……まだ諦めるときじゃない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "肥料の注文のことで、ちょっとパトリックにも聞いてもらえる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――分かった、任せて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
