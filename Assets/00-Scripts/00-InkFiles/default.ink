INCLUDE bulletScript.ink
VAR HP = 0
->Debug

===Debug===
main_salut  
prota_prout 
enemy_salut
->END


===UneHistoireDEgo===
//reset Mana
main_salut
enemy_yo yyyyo YO
->UneHistoireDEgo.idle

=shootMatrix
{bulletPWR:
-1:
{
-bulletCLR=="red":
enemy_grrrrr
->SansFoiNiLoi

-bulletCLR=="blue":
enemy_grrrrr
->SansFoiNiLoi
}

-2:
{
- bulletCLR=="red":
enemy_ lets gooooo
->DeuxCoeursQuiSAiment

- bulletCLR=="blue":
enemy_grrrrr
->SansFoiNiLoi

- bulletCLR=="violet":
enemy_ lets gooooo
->DeuxCoeursQuiSAiment
}
}

=idle 
main_la tension monte...
->UneHistoireDEgo.PlayerTurn

=PlayerTurn
+[ATQ]->UneHistoireDEgo.ATQ
+[DEF]->UneHistoireDEgo.DEF
+[TLK]->UneHistoireDEgo.TLK
+{bulletCLR!="empty"}[SHT]->UneHistoireDEgo.shootMatrix

=ATQ
main_player attaque
main_boss riposte
enemy_YYYAH
main_les deux esprits s'emportent
main_personne ne parvient à prendre l'avantage.
{SetMana("red")}
->UneHistoireDEgo.idle

=DEF
main_player se prépare à bloquer...
main_Mais boss surgit à toute allure !
enemy_ YYoOooO
~HP-= 1
->UneHistoireDEgo.idle

=TLK
main_no talk
main_no shitchat
{SetMana("blue")}
->UneHistoireDEgo.idle

===DeuxCoeursQuiSAiment===
main_heyyyyyyyy
->DeuxCoeursQuiSAiment.ATQ

=ATQ
->END
->UneHistoireDEgo

===SansFoiNiLoi===
enemy_OoooooohhhH
->UneHistoireDEgo

===Cowboy===
i am cowboy
->END