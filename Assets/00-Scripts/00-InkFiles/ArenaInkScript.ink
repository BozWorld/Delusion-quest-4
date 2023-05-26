INCLUDE bulletScript.ink
->prologue

===prologue===
Dans une réalité distordue par votre opposant, lui-même tiraillé entre différents visages.
Chacune de vos actions chargeront vos munitions.
Leur couleur ont le pouvoir d'atteindre les 3 facettes de l'ennemi !
Tirez ! Et faites face..
Quand un coeur ne trouve plus de réponse, il transforme l'inconscient collectif...
Lorsque cela arrive, il ne reste plus qu'une solution.
Ce qu'on nomme la rupture de l'illusion : le Delusion Shift.
Lorsque cela arrive, je fais appel à mon Héros...
->intro.idle

===intro===
=matrix 
~DelusionShift("dramatic")
{bulletCLR:
-"red": ->HistoireDEgo.shift
-"blue":->DeuxCoeurs.idle
-"violet":->HistoireDEgo.shift
}
Quelque chose venait de changer...
->intro.idle

=idle
{stopping:
-e_ C'était donc vrai...

e_ Ainsi quelqu'un a osé venir me défier dans mon open-space...
e_ Moi, ALGOR !
p_ Je suppose que tu sais pourquoi je suis là. 
b_ Je suis Emile et je suis venu p- Attends, quoi ?! $ Tu viens pour prendre ma place de CEO !!!

-e_ Tu t'es lancé dans une entreprise dangereuse... es-tu prêt ?!
p_ Si je ne suis pas prêt au beau milieu d'un combat, je ne le serai jamais.

-e_IL EST TEMPS DE CONFRONTER NOS IDÉES SUR LE MARCHÉ DES IDÉES
p_ Tout bien réfléchi, je crois que je comprends rien à ce que tu racontes.

-e_ Cette réunion commence à se faire longue...
p_ Sans blague.
}
->intro.playerTurn

=playerTurn
p_{&(Qu'est-ce que c'est que ce type ?)|(Bon, il est temps d'y aller sérieusement.)|(Il tourne en boucle...)}
+[ATQ]->intro.atq
+[DEF]->intro.def
+[TALK]->intro.talk
+[SHOT]->intro.matrix
->END

=atq
{stopping:
-Emile saisit son katana...
p_Plus de temps à perdre !
p_Si ce que tu veux c'est un vrai combat, alors je suis le bon client ! //shake enemy 
e_Tu manques d'expérience ! Je le vois à tes coups et à ta posture.
~SetMana("red")
e_Désormais, j'aimerai que tu considères ce combat comme...Hmmm...
~TakeDamage()
e_Une Expérience Challengeante Non-Rémunérée™ //shake player

-Emile saisit son katana...
Mais l'ennemi le repousse violemment à nouveau. // shake player
~TakeDamage()
~SetMana("red")
}
->intro.idle

=def
{stopping:
-Emile se prépare à bloquer la prochaine attaque.
e_ Hmph... Je n'ai pas encore tout donné. //block player

-Emile évite le tir avec aisance. // sfx gunshot
e_ Du véritable tir au pigeon ! 
p_ Tu parles beaucoup pour quelqu'un qui vient de rater son tir...

-Emile ne laisse passer aucune attaque.
p_Mais lâche-moi !
p_(Il faut que je trouve un truc à faire...)
}
~SetMana("blue")
->intro.idle

=talk
->END

===HistoireDEgo===
=shift
~bulletPWR=0
~bulletCLR="empty"
Quelque chose était en train de changer...
Il venait de revêtir une tout autre facette.
->intro.idle
->END

===DeuxCoeurs===
=idle
->END

