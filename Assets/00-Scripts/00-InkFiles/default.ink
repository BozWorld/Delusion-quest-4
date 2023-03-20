INCLUDE bulletScript.ink
VAR HP = 0
->Intro

===Debug===
main_salut  
prota_prout 
enemy_salut
->END

===Intro===
Narrateur quand un cœur ne trouve plus de réponse, il transforme l'inconscient collectif
Narrateur quand ça arrive, la seule solution pour endiguer le mal est de lui provoquer
Narrateur ce qu'on appelle "une rupture de l'illusion" ou "delusion shift
Narrateur Quand ça arrive j'appelle "mon héro" pour s'en occuper...
-> idle

=idle
Enemy_idle il est temps de confronter nos idées sur le marchées des idée 
Player_idle ...D'une manière je vois ou tu veux en venir par la
->PlayerTurn

=PlayerTurn
+[ATQ]->Intro.ATQ
+[DEF]->Intro.DEF
+[TLK]->Intro.TLK
+{bulletCLR!="empty"}[SHT]->Intro.shootMatrix

=ATQ

{SetMana("red")}
Player_attack emile attaque directement avec son katana
Ennemy_Smiling oh j'apprécie ta témérité mais ça ne sera pas suffisant
-> Intro.idle
=DEF
{SetMana("blue")}
player_def vous vous preparez a recevoir un coup de katana...
Enemy_idle j'ai toujours des options caché 
( perd une vie il tire une balle ) 
-> Intro.idle
=TLK

Player_idle mais avant que on s'étripe dis moi au moins qui est-tu?
Enemy_Idle vaste question ou commencer mon récit...
Player_idle après fin je demandais juste le strict minimum pour s'étriper,
Player_idle pas la full histoire non plus
Enemy_idle tout commence-
Player_idle non en vrai le minimum
Enemy_idle je suis le jeune patron d'une entreprise qui vends des des cours de
Enemy_idle développement personnelles
Player_idle ah
--> Intro.idle

=shootMatrix
{bulletPWR:
-1:
{
-bulletCLR=="red":
enemy_grrr ce n’est pas avec ça que tu te débarassera de moi !
→ Intro.idle
-bulletCLR=="blue":
enemy_grrr ce n’est pas avec ça que tu te débarassera de moi !
→ Intro.idle
}
-2:
{ 
-bulletCLR=="red":
narrateur quelque chose venait de changer…

enemy_grrr tes satannée balle n’aurons pas raison du feu en moi
Player_smirk alors continouns, trouvons comment eteindre ce feu ensemble !
→Une histoire d’ego

-bulletCLR=="blue":
narrateur un point de bascule venait d’etre atteint….

enemy_grrr jolie coups…*************************nice shot my dear friends************************* désolé 
enemy_grr les belles actions font ressortir mon anglais

Player_idle no hay problema
→Celui qui tire est celui qui gagne
}
}
-> END
// ===UneHistoireDEgo===
// //reset Mana
// main_salut
// enemy_yo yyyyo YO
// ->idle.idle

// =shootMatrix
// {bulletPWR:
// -1:
// {
// -bulletCLR=="red":
// enemy_grrrrr
// ->SansFoiNiLoi

// -bulletCLR=="blue":
// enemy_grrrrr
// ->SansFoiNiLoi
// }

// -2:
// {
// - bulletCLR=="red":
// enemy_ lets gooooo
// ->DeuxCoeursQuiSAiment

// - bulletCLR=="blue":
// enemy_grrrrr
// ->SansFoiNiLoi

// - bulletCLR=="violet":
// enemy_ lets gooooo
// ->DeuxCoeursQuiSAiment
// }
// }

// =idle 
// main_la tension monte...
// ->idle.PlayerTurn

// =PlayerTurn
// +[ATQ]->UneHistoireDEgo.ATQ
// +[DEF]->UneHistoireDEgo.DEF
// +[TLK]->UneHistoireDEgo.TLK
// +{bulletCLR!="empty"}[SHT]->UneHistoireDEgo.shootMatrix

// =ATQ
// main_player attaque
// main_boss riposte
// enemy_YYYAH
// main_les deux esprits s'emportent
// main_personne ne parvient à prendre l'avantage.
// {SetMana("red")}
// ->UneHistoireDEgo.idle

// =DEF
// main_player se prépare à bloquer...
// main_Mais boss surgit à toute allure !
// enemy_ YYoOooO
// ~HP-= 1
// ->UneHistoireDEgo.idle

// =TLK
// main_no talk
// main_no shitchat
// {SetMana("blue")}
// ->UneHistoireDEgo.idle

// ===DeuxCoeursQuiSAiment===
// main_heyyyyyyyy
// ->DeuxCoeursQuiSAiment.ATQ

// =ATQ
// ->END
// ->UneHistoireDEgo

// ===SansFoiNiLoi===
// enemy_OoooooohhhH
// ->UneHistoireDEgo

// ===Cowboy===
// i am cowboy
// ->END