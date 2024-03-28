INCLUDE bulletScript.ink
->introduction.idle

===prologue===
->END

===introduction===
=intro
Dans une réalité distordue par votre opposant, lui-même tiraillé entre différents visages.
Chacune de vos actions chargeront vos munitions.
Leur couleur ont le pouvoir d'atteindre les 3 facettes de l'ennemi !
Tirez ! Et faites face..
Quand un coeur ne trouve plus de réponse, il transforme l'inconscient collectif...
Lorsque cela arrive, il ne reste plus qu'une solution.
Ce qu'on nomme la rupture de l'illusion : le Delusion Shift.
Lorsque cela arrive, je fais appel à mon Héros...
->introduction.idle

=delusionShift
{bulletPWR:
    -1:{bulletCLR:
        -"red":
        p_MONTRE-MOI CE QUE TU AS DANS LE VENTRE !
        ~DelusionShift("default")
        ->HistoireDEgo.intro
        
        -"blue":
        Emile s'apprête à tirer à bout-portant !
        e_?!
        e_C'EST PAS DU JEU !
        e_Ton arme... Tu triches, comme eux !
        e_Toi non plus... Tu ne reconnais pas le travail acharné !
        e_ Tu ne reconnais pas la volonté des individus !
        p_De la triche ?!
        p_ Oh ! Tu réalises le pouvoir que tu as sur cet endroit ?!
        p_ Encore heureux que je puisse t'avoir à ton propre jeu.
        ~DelusionShift("default")
        ->CeluiQuiTire.intro
        }
    -2:{bulletCLR:
        -"red":
        p_MONTRE-MOI CE QUE TU AS DANS LE VENTRE !
        ~DelusionShift("default")
        ->HistoireDEgo.intro
        
        -"blue":
        Emile s'apprête à tirer à bout-portant !
        e_?!
        e_C'EST PAS DU JEU !
        e_Ton arme... Tu triches, comme eux !
        e_Toi non plus... Tu ne reconnais pas le travail acharné !
        e_ Tu ne reconnais pas la volonté des individus !
        p_De la triche ?!
        p_ Oh ! Tu réalises le pouvoir que tu as sur cet endroit ?!
        p_ Encore heureux que je puisse t'avoir à ton propre jeu.
        ~DelusionShift("default")
        ->CeluiQuiTire.intro
        
        -"violet":
        p_MONTRE-MOI CE QUE TU AS DANS LE VENTRE !
        ~DelusionShift("default")
        ->HistoireDEgo.intro
        }
}

=redTunnel
~SetMana("red")
boom+ça pique
->->

=blueTunnel
~SetMana("blue")
Miss+perfect evasion
->->

=tdTunnel
~TakeDamage()
Aie aie Aie+ça fait mal
->->

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
->introduction.playerTurn

=playerTurn
p_{&(Qu'est-ce que c'est que ce type ?)|(Bon, il est temps d'y aller sérieusement.)|(Il tourne en boucle...)}
+[ATQ]->introduction.atq
+[DEF]->introduction.def
+[TALK]->introduction.talk
+[SHOT]->introduction.delusionShift
->END

=atq
{stopping:
-Emile saisit son katana...
p_Plus de temps à perdre !
p_Si ce que tu veux c'est un vrai combat, alors je suis le bon client ! //shake enemy 
e_Tu manques d'expérience ! Je le vois à tes coups et à ta posture.
->redTunnel->
e_Désormais, j'aimerai que tu considères ce combat comme...Hmmm...
e_Une Expérience Challengeante Non-Rémunérée™ //shake player
->tdTunnel->

-Emile saisit son katana...
Mais l'ennemi le repousse violemment à nouveau. // shake player
->tdTunnel->
->redTunnel->
}
->introduction.idle

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
->blueTunnel->
->introduction.idle

=talk
{stopping:
    - p_Écoutes-moi. 
    p_Je suis venu avec la ferme intention de te botter le cul.
    p_Je m'appelle Emile.
    p_Je sais pas qui je suis mais je dois te déloger de là.
    p_Et c'est apparemment pour le bien de tous.
    p_Alors plutôt que de se castagne on pourrait apprendre à se connaître.
    e_J'apprécie ta transparence.
    e_C'est une qualité qu'on apprécie beaucoup en entreprise.
    proactif+"succès déverouillé"
    e_Tu dis être venu pour me déloger ?
    e_Tu te doutes que je me battrai pour défendre mon projet !
    e_Je ne sais pas qui vous êtes ta camarade et toi...
    e_Mais ici, le CEO c'est moi ! Personne ne peut plus me renvoyer !
    p_Plus personne, tiens...
    ->introduction.idle
    
    -p_Il y a un truc bizarre dans ta manière de parler...
    p_ Déjà je pipe pas un mot d'anglais, mais là encore plus...
    e_ C'est comme ça que parlent tous les CEO.
    p_ Tu parles comme un chef d'entreprise, en fait !
    e_ CEO ça veut dire chef d'entreprise...
    e_ Tu as oublié ça aussi ?
    p_ Ouais bah fais pas le mariole non plus...
    stupid+you said stupid...
    ->introduction.idle
    
    -p_Et donc, comment t'es arrivé... ici ?
    e_ Vaste question! Par où devrai-je commencer mon récit...
    p_ Après je demandais juste le strict minimum.
    p_ Pas la full histoire non plus.
    b_ Non vraiment, le minimum.$Tout commence, il y a de cela...
    e_...
    e_Je suis le jeune patron d'une petite start-up.
    e_ Nous proposons des formations de développement personnel.
    e_ J'ai fondé cette entreprise récemment, mais...
    b_ON AVAIT DIT NON !!!$TOUT COMMENCE, IL Y A DE CEL-
    ->introduction.idle
    
    -p_ Il y a forcément une raison à ta présence dans ce monde. 
    p_ Seuls ceux en proie au doute peuvent se matérialiser ici.
    p_ Pour quelle raison, tu y penses ?
    e_...
    p_ C'est comme si tu voulais être... autre chose.
    p_ T'es pas le premier que j'affronte, tu sais.
    b_ Tu caches quelque chose au fond de toi...$Gamine...
    p_ Il est temps de vider ton sac !
    e_ Écoutes, je reconnais tes exploits...
    e_Mais ne pousse pas ta chance trop loin !
    ->introduction.idle 
    
    -p_Bon ok, désolé pour juste avant...
    p_ Mais on dirait vraiment que tu utilises des mots que tu comprends pas !
    e_ Je t'ai déjà expliqu-...
    p_Je le sens ! Je l'entends !
    p_Ce n'est pas l'identité à laquelle tu aspires...
    p_Elise m'a donné un pouvoir...
    p_Celui de réparer les coeurs affaiblis comme le tien actuellement !
    p_Et il est encore possible d'y arriver sans avoir à nous battre.
    e_...
    ->RecompenseDesPerdants.idle    
}

===HistoireDEgo===
=delusionShift
->END

=intro
Chaque égo puise dans les récits de l'imaginaire collectif.
Chacun y trouve une aspiration, quelque chose à envier.
Lorsque deux égos se rencontrent, ils s'affrontent.
Plus qu'un conflit entre des valeurs différentes...
C'est l'héritage de l'humanité qui se joue à cet instant.
~bulletPWR=0
~bulletCLR="empty"
->HistoireDEgo.idle

=idle
{stopping:
    -e_Ô chère camarade, la ressens-tu ?
    e_L'excitation du combat ! Cette chaleur, oui c'est ça...
    e_C'est celle du départ d'un nouveau Sprint !
    SprintStart+new task on Jira
    p_J'ai la désagréable impression d'être parvenu à comprendre ce que tu dis...
    
    -e_Ne sens-tu pas l'issue du combat qui s'avance...
    b_J-je...$Le jour de la release qui s'approche !
    p_ J'ai compris, c'est bon !
    
    -b_ TU ME RENDS FOLLE, ARRÊTE$Ô chère camarade j-
    p_ Arrête de parler comme ça, bon sang !
    Rebelle+conteste l'autorité.
    p_ J'ai mis mon Ego en jeu pour ce combat, alors bats-toi !
    
}
->HistoireDEgo.playerTurn

=playerTurn
p_{&(Je dois pas me laisser déconcentrer)|(Qu'il se TAISE, bon sang.)|(Il est fort... Je dois agir vite.)}
+[ATQ]->HistoireDEgo.atq
+[DEF]->HistoireDEgo.def
+[TALK]->HistoireDEgo.talk
+[SHOT]->HistoireDEgo.delusionShift
->END

=atq
{stopping:
    -Les deux opposants s'élancèrent en un instant.
    Blessé, Emile parvient malgré tout à placer un coup avec le revers de sa lame.
    e_TU N'ES PAS ASSEZ PROACTIF
    e_TU NE PEUX PAS GAGNER CETTE BATAILLE 
    b_Tu v-$JE SUIS SEUL PROJECT OWNER SUR CE PROJET
    b_Mais laisse m-$A COMBIEN S'ELEVENT TES STORY POINTS
    b_ YES YES I LOVE AMERICA $IL SUFFIT D- Qu-?!
    p_ DO YOU KNOW ABOUT TAXES A FRAUD 
    b_YEAH YEAH YOU KNOW YEAH$Je v-
    e_...
    p_Ouais, moi aussi je peux inventer des mots.
    e_Non c'était juste mesquin.

    -Malgré ses assauts, Emile ne parvient pas à percer la défense de son adversaire.
    b_SOIT NORMAL POUR UNE FOIS$ENCORE UNE USER STORY QUI SE TERMINE EN MA FAVEUR
    p_ TU PEUX PAS DIRE DES TRUCS DE MECS QUI SE BAT, SERIEUX ?!
    
}
->HistoireDEgo.idle

=def
{stopping:
    -e_Tu peux repousser la deadline, elle ne disparaîtra pas !
    p_Je repousse rien du tout ! J- euh...
    p_Attends mais "deadline", c'est bien quand on a plus de réseau ?
    b_(Non, attends... Mais ça veut rien dire !)$...
    p_Enfin bref, je repousse rien du tout !
    A1+niveau d'anglais catastrophique
    
    -e_Que fais-tu? C'est l'heure de la réunion !
    p_Attends, laisse-moi réfléchir encore un peu.
}
->HistoireDEgo.idle

=talk
e_Pas le temps de parler !
e_ La release est proche, nous aurons tout le temps de faire une review ensuite.
->HistoireDEgo.idle

===CeluiQuiTire===
=delusionShift
->END

=intro
Une infinité de futurs sont contenus dans un simple instant.
Une simple volonté suffirait pour en écarter la plupart.
Cette simplicité se confond parfois avec nos peurs.
Seul un affrontement peut déterminer la valeur de la volonté.
~bulletPWR=0
~bulletCLR="empty"
->CeluiQuiTire.idle 

=idle
{stopping:
    -e_Hmm...
    p_Tout va bien ?
    e_Je pense qu'à présent nous devrions passer en distanciel, kiddo.
    Kiddo+nouveau surnom
    p_ Oh non, pas de surnom bizarre. Tout, mais pas ça...
    
    -e_Ferme les yeux, même à distance nous pouvons le voir.
    e_Une falaise... Le soleil couchant... 
    e_Deux combattants se faisant face...prêts à tirer.
    p_...
    e_ Es-tu prête gamine ?
    p_Jamais été aussi prête. Je l'étais déjà avant...
    p_Mais après ton discours, je le suis encore plus !
    Motivation+the seeds of succeed
}
->CeluiQuiTire.playerTurn

=playerTurn
p_(Go! Go Emile, Go!)
+[ATQ]->CeluiQuiTire.atq
+[DEF]->CeluiQuiTire.def
+[TALK]->CeluiQuiTire.talk
+[SHOT]->CeluiQuiTire.delusionShift
->END

=atq
{stopping:
    -e_ Tu ne crois pas avoir mieux à faire qu'agiter ton arme ridicule devant moi.
    p_ ridicu-... Euh ridicule toi-même !
    p_ Attends de me voir trancher tes balles en deux avant de parler !
    p_ Qu- ?!
    Une balle venait de toucher Emile à la jambe à l'instant où il finissait sa phrase.
    p_Ok, c'était pas ma meilleure provocation celle là.
    Ratio+apprendre à se taire...

    -La posture d'Algor ne laissait aucune ouverture...
    e_ Un duel de cow-boy demande de faire preuve d'initiative et de volonté.
    e_ Alors, cesse de foncer like a beast.
    p_Qui sait ? On est peut-être en train d'inventer une variante.
    b_ET ARRÊTE AVEC L'ANGLAIS$Well...
    e_ Je reconnais ta détermination my dear friend...
    e_Seulement, le monde est bien plus rude as you seen it !
    //take damage
}
->CeluiQuiTire.idle

=def
->END

=talk
->END
===RecompenseDesPerdants===
=idle
->END
