return {
	id = "ISLANDSIDE00708",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			say = "――ブレーメン、実は……",
			animation = "talk",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 101200,
			subName = "カフェ店員",
			say = "えっ、はちみつ水のレシピ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "昔、すごく美味しいはちみつ水を飲んだことがあるの……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "一生忘れられないくらいのね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "カフェ店員",
			say = "あの時のレシピ……確かメモしておいたんだけど、どこに置いたかな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "ちょっと待っててね、指揮官。キッチンで探してみるから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			style = 2,
			sequence = {
				{
					"<size=45>しばらくして……</size>",
					2
				}
			}
		},
		{
			characterId = 0,
			say = "――どうだった？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "カフェ店員",
			say = "ずっと探してるんだけどね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "もしかしたら、そのレシピを商店街にしまってたかも…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――……家じゃなくて、商店街に？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101200,
			subName = "カフェ店員",
			say = "うん、大事なレシピだから、家に置いたら逆に失くしちゃいそうで……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――……で、忘れてたと……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "カフェ店員",
			say = "取りに行くにしても今はお店を離れられなくて……うぅ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――じゃあ、場所を教えてくれたら代わりに探してくるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
