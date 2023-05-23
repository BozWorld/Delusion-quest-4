===UneHistoireDEgo===
Chaque humain est guidé par son propre ego
et dans cela il y a quelque chose de magnifique
qund deux ego se rencontrent, ils se confrontent
dans cet étrange fatalité, née les coeur qui résonnent

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
=ShotMatrix
{ bulletPWR :
	-2: 
    {bulletCLR:
		  - bulletCLR=="blue":
        b_ X ALLONS AU CLIMAX DE CE COMBAT$EMILE MONTRE MOI TOUTE TON INGENIOTÉ, MONTRE MOI TON ESPRIT D'ENTREPRENEUSE
       -> LaSolitudeCommeModeDeVie.idle

      - bulletCLR=="violet":
        e_ Qu'est ce que tu crois faire a venir ici, me forcer a un choix et se plaindre du resultat!
        e_ Tu me met dans une situation dont je ne produirait pas quelque chose de satisfaisant...
        e_ Et tu utilisa pour diminuer mon travail et ma valeur ! Vous etes tous les mêmes !
        e_ Mais cette fois, j'ai de quoi riposter! Je vais te monter ma valeur et te faire regretter tes actions !
        ->LaRécompenseDesPerdants.idle
	}
}