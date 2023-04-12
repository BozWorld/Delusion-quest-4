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
/* ici il faudrait une bulle de texte tutoriel , qui me permette d'imaginer un narrateur de tutoriel */
// -> expliquez les conditions de victoire et de défaites du jeu

t_ Bienvenu,dans cette démo de DQ4. Dans ce jeu vous etes dans un combat en tour par tour
t_ Contre un unique ennemis bien plus fort que vous, mais aupris au doute. 
t_ il vous faudra user de ses emotions pour gagner
t_ Vois choix le feront évoluer tout au long du combat, mais aussi provoqueront une conclusion unique.

// -> expliquez comment fonctionne le système d'action, et le faite que les gain doivent etre supposez par le joueur en fonction de la situation

t_ Dans ce contexte particulier, vous possédé un étrange pouvoir.
t_ faisons que exploiter les émotions de votre adversaire Charge des balles.
t_ tirez ses balles jusqu'à provoquez une conclusion.
t_ Vous avez 4 type d'action : l'attaque ( ATK ) , la défense ( DEF ), la conversation ( PRL )
t_ Chaque action auront une conséquence différentes dépends du contexte.
t_ soyez attentive a ce que dit votre adversaire et ses réaction pour anticiper ses prochains coup.

// Expliquez le principe de facette, et le faite de faire un mix de couleur
t_ Dans une réalité distordu par votre adversaire, il est tiraillé entre 3 facette de lui meme.
t_ dépends du contexte, les actions peuvent charger des balles, leurs couleurs représente ses facette.
t_ la couleur rouge représente la facette samurai ( S ) 
t_ la couleur bleu représente la facette cowboy ( C ) 
t_ la couleur violet représente les deux facette en meme temps, son entreprenariat ( e )
t_ les balles que vous tirez, le feront évolué en fonction de ses facette, 
t_ changeant aussi ses coups et ses comportements.
t_ Quand un cœur ne trouve plus de réponse, il transforme l'inconscient collectif.
t_ Quand ça arrive, la seule solution pour endiguer le mal est de provoquer...
t_ Ce qu'on appelle "une rupture de l'illusion" ou "Delusion Shift".
T_ Quand ça arrive j'appelle "mon héro" pour s'en occuper...
-> idle

=idle
e_ IL EST TEMPS DE CONFRONTER NOS IDÉES SUR LE MARCHÉ DES IDÉES
p_ ...hmm après réfléxion je pense voir ou tu vas avec ça
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
e_ tu manques de motivation pour gagner cet bataille'
e_ il faut que tu visualise ce combats comme "une expériences challengeante non rémunéré"
p_ ...c'est possible de se faire rémunéré?
-> Intro.idle

=DEF
{SetMana("blue")}
p_ vous vous preparez a recevoir un coup de katana...
e_ j'ai toujours des options caché 
//( perd une vie il tire une balle ) 
-> Intro.idle

=TLK
p_ Avant que on s'étripe dis moi au moins qui est-tu?
e_ vaste question ou commencer mon récit...
p_ après je demandais juste le strict minimum pour s'étriper.
p_ pas la full histoire non plus
e_ tout commence-
p_ non en vrai le minimum
e_ je suis le jeune patron d'une entreprise qui vends des des cours de développement personnelle
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
Chaque humain est guidé par son propre ego
et dans cela il y a quelque chose de magnifique
qund deux ego se rencontrent, ils se confrontent
dans cet étrange fatalité, née les coeur qui résonnent
->DONE

=shootMatrix
->DONE

=idle
e_ Oh chère camarade de bataille, le ressens-tu ?
e_ Cette excitation du combat, cette chaleur ?
e_ celle que on ne ressent qu'au début du sprint...
e_ celle qu'on apperçois que proche de la release
p_ Désolé, je ne parle pas anglais. Ça veut dire quoi "heat"...?
b_ "Heat", c'est la passion, l'excitation, l'adrénaline.
p_ Ah, ouais, je crois que je le ressens... ou un truc du genre ouai.
->END

=PlayerTurn
+[ATQ]->UneHistoireDEgo.ATQ
+[DEF]->UneHistoireDEgo.DEF
+[TLK]->UneHistoireDEgo.TLK
+{bulletCLR!="empty"}[SHT]->UneHistoireDEgo.shootMatrix


=ATQ
{SetMana("red")}
e_ X attaque Emil avec son katana, lui infligeant des dégâts.
p_ surpris par le coups, Emil en profite malgré tout pour infliger un coups avec le flan de son arme
~HP-= 1
e_ TU N'EST PAS ASSEZ PROACTIF POUR GAGNER CETTE BATAILLE, 
e_ ÇA FAIT DES MOIS QUE JE FAIS DES MELEE QUOTIDIENNE SUR MON PROJET
p_ hein c'est qu-
e_ DANS CE COMBAT NOUS SOMMES LES UNIQUES PRODUCT OWNER DE NOTRE PROJET
p_ attend, je suis conf-
b_ mais enfaite t'inventes des mots$COMBIEN A TU MIT DE STORY POINT DANS CE COMBAT
e_ X réattaque juste derrrière le coups précédent infligeant une seconde salve de dégats
~HP-= 1
p_ va falloir que je sois plus vigilant contre lui..
-> Intro.idle

=DEF
e_ X attaque Emil avec son katana, sans succès, emil c'étais mit en posture de défense
e_ c'est bas de ta part... j'en attendais plus...
e_ je vais surement devoir revoir ta vélocité au seins du projet
p_ oui velocité, sprint, tout ça tout ça, j'ai compris.
-> Intro.idle

=TLK
p_ ...Il y a quelque chose qui as changé tu t'exprimes plus de la meme manière
e_ 
-> Intro.idle
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