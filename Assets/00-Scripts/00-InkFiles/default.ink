INCLUDE bulletScript.ink
INCLUDE Testing.ink

VAR HP = 5
// create variable for mana
->Intro

/*

_________________________________
///// READ ME /////

_________________________________
/// VARIABLES ///
/// HP
la santé du prota, c une ObserverVariable y'a un callback dans Unity chaque fois que sa valeur est set

/// BulletPWR
c la puissance actuelle de la bullet, c aussi une ObserverVariable par contre celle là tu y touches pas, elle est set automatiquement avec la fonction SetMana()

/// BulletCLR
donne la couleur actuelle de la bullet, c'est pareil que bulletPWR, t'as pas besoin d'y toucher, elle se set avec SetMana()

_________________________________
/// FONCTIONS ///
/// SetMana(clr)
c la fonction que tu mets dans les options de combat. Elle augmente bulletPWR de 1 et actualise bulletCLR en fonction de la couleur renseignée en argument

_________________________________
/// SPEAKERS ///
Tu peux choisir dans quelle boite de dialogue le texte va s'afficher,
pour ça faut absolument que tu précises qui parle.

Pour le narrateur, t'as rien à mettre. Juste t'écris ton texte en prose et il se joue par défaut dans la box du narrateur

p -> pour le player 
e -> pour l'enemy
b -> pour both*

*both c un cas particulier. D'abord tu précises b_ pour indiquer que les deux personnages vont s'exprimer en même temps.
Par contre il faut que tu split ton texte pour bien que Unity reconnaisse qui dit quoi, tu fais ça avec le symbole "$"
En pratique ça donne :
b_ je pense A $ je pense B 
le player va dire "je pense A" et en MEME TEMPS l'enemy va dire "je pense B"

*/


===Intro===
Quand un cœur ne trouve plus de réponse, il transforme l'inconscient collectif.
Quand ça arrive, la seule solution pour endiguer le mal est de provoquer...
Ce qu'on appelle "une rupture de l'illusion" ou "Delusion Shift".
Quand ça arrive j'appelle "mon héro" pour s'en occuper...
-> idle

=idle
e_ il est temps de confronter nos idées sur le marchées des idée 
p_ ...D'une manière je vois ou tu veux en venir par la
->PlayerTurn

=PlayerTurn
+[ATQ]->Intro.ATQ
+[DEF]->Intro.DEF
+[TLK]->Intro.TLK
+{bulletCLR!="empty"}[SHT]->Intro.shootMatrix

=ATQ

{SetMana("red")}
p_ emile attaque directement avec son katana
e_ oh j'apprécie ta témérité mais ça ne sera pas suffisant
-> Intro.idle

=DEF
{SetMana("blue")}
p_ vous vous preparez a recevoir un coup de katana...
e_ j'ai toujours des options caché 
//( perd une vie il tire une balle ) 
-> Intro.idle

=TLK
p_ mais avant que on s'étripe dis moi au moins qui est-tu?
e_ vaste question ou commencer mon récit...
p_ après fin je demandais juste le strict minimum pour s'étriper,
p_ pas la full histoire non plus
e_ tout commence-
p_ non en vrai le minimum
e_ je suis le jeune patron d'une entreprise qui vends des des cours de développement personnel
p_ ah
-> Intro.idle

=shootMatrix
{bulletPWR:
-1:
    {
    -bulletCLR=="red":
    e_ ce n’est pas avec ça que tu te débarassera de moi !
    ->Intro.idle
    -bulletCLR=="blue":
    e_ ce n’est pas avec ça que tu te débarassera de moi !
    ->Intro.idle
    }
-2:
    { 
    -bulletCLR=="red":
    quelque chose venait de changer…
    
    e_ tes satannée balle n’aurons pas raison du feu en moi
    p_ alors continouns, trouvons comment eteindre ce feu ensemble !
    ->UneHistoireDEgo
    
    -bulletCLR=="blue":
    un point de bascule venait d’etre atteint….
    
    e_ jolie coups…*************************nice shot my dear friends************************* désolé 
    e_ les belles actions font ressortir mon anglais
    
    p_ no hay problema
    ->CeluiQuiTireGagne
    
    -bulletCLR=="violet":
    un point de bascule venait d’etre atteint….
    
    e_ jolie coups…*************************nice shot my dear friends************************* désolé 
    e_ les belles actions font ressortir mon anglais
    
    p_ no hay problema
    ->CeluiQuiTireGagne
    
    
    }
}
-> END

===UneHistoireDEgo===
->END

===CeluiQuiTireGagne
->END

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