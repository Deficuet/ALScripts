return {
	id = "ISLANDSIDE00504",
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
			say = "――ホメリック、ちょっと聞いてほしいことが",
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
			animation = "doubt",
			characterId = 100400,
			subName = "畑管理人",
			say = "指揮官……何かわかったんですか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――ああ、原因が分かった。金属のぶつかるような音はおそらくモーモーウシの首についてるカウベルの音だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "畑管理人",
			say = "えっ……じゃあ……私が夜に見た「赤い目」って……まさか、モーモーウシだったんですか……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――そう。首のカウベルが緩んでたせいで変な音を立てていたんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――それに赤く光ってた目も、たまたま光が反射してそう見えただけだろうな",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――突然現れた人影に牛も驚いて、固まったまま見つめてきただけだと思う",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 100400,
			subName = "畑管理人",
			say = "ずっと勝手に怖がってただけだったんですね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "原因がわかったので、これでまた心おきなく畑仕事に戻れますね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "畑管理人",
			say = "あ……でも指揮官、実は私だけじゃなく、アメリゴも変な音を聞いたって話してました……どうやら、私の聞いた音とはちょっと違うみたいで……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "指揮官、よかったらアメリゴにも話を聞いてみてください。他の何かがまだあるかもしれません",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――他にも変な音が……？わかった、話を聞いてみるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
