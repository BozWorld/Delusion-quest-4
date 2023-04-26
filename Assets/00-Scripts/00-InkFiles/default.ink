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
l -> elise
c -> contextual interface
n -> narrateur
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

c_ Bienvenu,dans cette démo de DQ4. Dans ce jeu vous etes dans un combat en tour par tour
c_ Contre un unique ennemis bien plus fort que vous, mais aupris au doute. 
c_ il vous faudra user de ses emotions pour gagner
c_ Vois choix le feront évoluer tout au long du combat, mais aussi provoqueront une conclusion unique.

// -> expliquez comment fonctionne le système d'action, et le faite que les gain doivent etre supposez par le joueur en fonction de la situation

c_ Dans ce contexte particulier, vous possédé un étrange pouvoir.
c_ faisons que exploiter les émotions de votre adversaire Charge des balles.
c_ tirez ses balles jusqu'à provoquez une conclusion ( TIR ) .
c_ Vous avez 4 type d'action avec le tir : l'attaque ( ATK ) , la défense ( DEF ), la conversation ( PRL )
c_ Chaque action auront une conséquence différentes dépends du contexte.
c_ soyez attentive a ce que dit votre adversaire et ses réaction pour anticiper ses prochains coup.

// Expliquez le principe de facette, et le faite de faire un mix de couleur
c_ Dans une réalité distordu par votre adversaire, tiraillé entre 3 facette de lui meme.
c_ dépendant du contexte, les actions peuvent charger des balles, leurs couleurs représente ses facette.
c_ la couleur rouge représente la facette samurai ( S )  // sa fierté ?
c_ la couleur bleu représente la facette cowboy ( C ) // Sa motivation ?
c_ la couleur violet représente les deux facette en meme temps, son entreprenariat ( e )
c_ les balles que vous tirez, le feront évolué en fonction de ses facette, 
c_ changeant aussi ses coups et ses comportements.

//Elise prend la parole, elle dicte le ton pour le reste du combat
l_ Quand un cœur ne trouve plus de réponse, il transforme l'inconscient collectif.
l_ Quand ça arrive, la seule solution pour endiguer le mal est de provoquer...
l_ Ce qu'on appelle "une rupture de l'illusion" ou "Delusion Shift".
l_ Quand ça arrive j'appelle "mon héro" pour s'en occuper...
-> idle

=idle
e_ { Ainsi quelqu'un est venu me défié dans mon open-space...Moi Algor, CEO d'une petite startup. |  C'est une entreprise dangereuse dans laquelle tu te lance, est tu prêt ? | IL EST TEMPS DE CONFRONTER NOS IDÉES SUR LE MARCHÉ DES IDÉES | Cette réunion commence a se faire longue }
p_ {  Je suppose que tu sais pourquoi je suis la. Je me nomme Emile...Attend  quoi? | Si je ne suis pas prêt en plein milieu d'un combat, je ne le serais jamais. | ...hmm après réfléxion je pense que je comprend rien a ce que tu racontes. | Attend ? On se connait ?! }
->PlayerTurn

=PlayerTurn
+[ATQ]->Intro.ATQ
+[DEF]->Intro.DEF
+[TLK]->Intro.TLK
+{bulletCLR!="empty"}[SHT]->Intro.shootMatrix

=ATQ
{
  - n_ emile attaque frontalement, avec son katana
    p_ pas de temps a perdre !
    p_ si ce que tu veux c'est un vrai combat je peux te l'offrir ! #_fx_slash
    e_ Tu manques encore d'expérience ! je le sens dans tes coups et ta posture
    e_ Il faut que tu commence a visualiser ça comme...Hmmm..."une expérience challengeante non rémunéré"
    n_ l'ennemis repousse violament emile, et lui inflige des dégats
    ~SetMana(red)
    ~TakeDamage(1)
    -> Intro.idle`
  
  //ajouter un dialogue donnant au moins une information sur le passé de l'ennemis, ou ses problématique actuelle
  
  - e_ Il faut que tu commence a visualiser ça comme...Hmmm..."une expérience challengeante non rémunéré"
    n_ Mais si c'est pas rémunéré, pourquoi je ferai ça? j'ai pas une tete a faire du bénévolat moi !
    -> Intro.idle
}


=DEF
{SetMana("blue")}
{
  - p_ Emile se prepare a recevoir un coup de katana...
    e_ j'ai toujours des options caché
    -> Intro.idle

  //ajouter un dialogue donnant au moins une information sur le passé de l'ennemis, ou ses problématique actuelle

  - n_ Emile arrive a se mettre en dehors de la ligne de mire...
    e_ Une cible encore plus simple qu'un pigeon urbain ! #_fx_gunshot
    p_ tu fais beaucoup le malin pour quelqu'un qui a loupé son coups deux fois quand meme...
    -> Intro.idle

  - n_ retente de vous frapper a l'aide de son katana
    p_ Lache moi t'es trop fan de moi ! je réfléchis a un truc ! #_fx_clash
    -> Intro.idle
}


=TLK
{

  - p_ écoute. Je suis venu avec la ferme intention de te botter le cul ( s'il le faut ).
    p_ Je m'appelle Emile je ne sais pas qui je suis, mais je dois te déloger de la pour le bien de tous.
    P_ Avant que se castagne plus que ça je préférai que l'on se connaisse. 
    e_ ...J'apprécie ta confiance, c'est un caractère que l'on recherche en entreprise.
    e_ je vois que tu es venu me déloger, donc tu te doutes que je me batterai pour défendre mon projet.
    e_ Je ne sais pas qui vous etes toi et ta camarade...
    e_ mais je suis ici CEO vous ne me renvoyerez pas une fois de plus!
    p_ Une fois de plus...tiens...  
    -> Intro.idle

  - p_ ...Il y a un truc dans ta manière de parler qui est étrange...
    p_ Fin je pipe pas un mot a l'anglais moi, mais c'est bizarre tu parles comme un chef d'entreprises
    e_ CEO veut dire chef d'entreprise...Tu as aussi oublié l'anglais en venant ici...?
    p_ ouai bah fait pas le mariole non plus.
    -> Intro.idle

  - p_ ...Comment tu t'es retrouvé...la? 
    e_ vaste question ou commencer mon récit...
    p_ après je demandais juste le strict minimum pour s'étriper.
    p_ pas la full histoire non plus
    e_ tout commence-
    p_ non en vrai le minimum
    e_ je suis le jeune patron d'une entreprise qui vends des des cours de développement personnelle...
    e_ J'ai récemment fondé cet entreprises, je n'ai pas toujours fait ça...
    p_ ...NON MAIS ÇA TU ME LA DÉJÀ DIT
  -> UniqueSequence1.idle

  - p_ ...Si tu es la c'est que il y a plus.
    p_ Ici, seule ceux en proie au doute peuvent venir ici...
    p_ comment t'es tu retrouvé la? Je sens que t'essaye d'etre...autre chose, je serais pas dire quoi.
    p_ Mais t'es pas le premier que j'affronte, je sais que tu cache un malaitre, vide ton sac
    e_ ...Gamine, Je reconnais tes exploits mais ne pousse pas ta chance trop loin.
    -> Intro.idle

  - p_ ...Bon désolé pour tout a l'heure c'étais pas cool. 
    p_ ...mais ça se voit que tu utilises un langages que tu ne maitrises pas!
    p_ je le sens, je l'entend, tu es différent de ce que tu aspires etre.
    p_ Emile ma donné le pouvoir de résoudre tout ses conflit a l'aide de cet armes.
    p_ mais tant qu'il est encore temps on peut arriver a une conclusion sans conflit.
    e_ ...
    -> Intro.idle

}
-> Intro.idle

=shootMatrix
{bulletPWR:
-1:
    {
    -bulletCLR=="red":
    e_ MONTRE MOI TOUT CE QUE TU AS DANS LE VENTRE
    ->Intro.idle
    -bulletCLR=="blue":
    E_ emile tire un coups portant a l'ennemis, C'EST PAS DU JEU !
    e_ Cet étrange balle...Tu triches comme eue...
    e_ Comme eue.. tu ne reconnais pas le travail et la volonté des individus...
    e_ J'ai pas tricher ! Tu es capable de façonner un monde a ton image!
    e_ encore heureux que j'ai le droit de te battre a ton propre jeu !
    ->Intro.idle
    }
}
-> END

===UneHistoireDEgo===
l_ chaque humain, trouve son ego dans les récit de l'imaginaire collectif
l_ Chacun, y voit ce qu'il aspire a etre, une référence a envier.
l_ Quand deux ego se rencontre, ils se confrontent.
l_ Dans ce combat, se joue plus que la victoire ou la défaite.
l_ il se joue l'héritage de l'humanité.
-> idle

=idle 
{
  - e_ Oh chère camarade de bataille, le ressens-tu ? Cette excitation du combat, cette chaleur ?
    e_ {celle que on ne ressent qu'au début du sprint... | e_ celle qu'on apperçois que proche de la release}
    p_ {j'ai désagréablement l'impression d'arrivé a comprendre ce que tu racontes. | J'ai compris c'est bon !}

  - e_ celle qu'on apperçois que proche de la release
    J'ai compris c'est bon !

  - p_ Arrete avec ce langage en vrai.
    p_ Moi cet bagarre je veux la faire j'y crois 
    p_ Mais on met tout les deux nos coeur en jeux. Parle moi franchement laisse cet posture.
    {SetMana("purple")}

  - e_ j'utilises pas tout ses mots pour rien.
    e_ Moi en toute ses choses la j'y crois.
    e_ L'agilité, le monde de demain, la fléxiblité, le remote tout ses choses la.
    p_ ça se voit que tu viens pas de ce monde. montre moi ce qu'il y a réellement dans ton coeur.
    {SetMana("purple")}



}
->PlayerTurn
->DONE



=PlayerTurn
+[ATQ]->UneHistoireDEgo.ATQ
+[DEF]->UneHistoireDEgo.DEF
+[TLK]->UneHistoireDEgo.TLK
+{bulletCLR!="empty"}[SHT]->UneHistoireDEgo.shootMatrix


=ATQ
{SetMana("red")}
e_ X attaque Emil avec son katana, lui infligeant des dégâts.
p_ surpris par le coups, Emil en profite malgré tout pour infliger un coups avec le flan de son armees
e_ TU N'EST PAS ASSEZ PROACTIF POUR GAGNER CETTE BATAILLE, 
e_ DANS CE COMBAT NOUS SOMMES LES UNIQUES PRODUCT OWNER DE NOTRE PROJET
p_ attend, je suis conf-
b_ mais enfaite t'inventes des mots$COMBIEN A TU MIT DE STORY POINT DANS CE COMBAT
b_ si tu veux la jouer comme ça, moi aussi je peux rendre les coups"$Montre moi ta vrai détermination!
~TakeDamage(1)
-> DeuxCoeursQuiSAiment.idle

=DEF
{
  - e_ Tu peux repousser la deadline mais elle reviens toujours !
    p_ je repousse aucun mot en anglais moi ! euh... je réfléchis juste un peu

  - e_ Il est temps de la réunion !
    p_ Laisse moi réfléchir un peu plus longtemps !
}
-> Intro.idle

=TLK
e_ ...plus le temps de parler on approche de la release!
-> Intro.idle
->DONE

=shootMatrix
{bulletPWR:
-2:
    {
    -bulletCLR=="red":
    p_ Si Un vrai défis loyal que tu veux je vais te le donner.
    e_ J'apprécie ta ténacité, c'est une qualité importante pour les noueaux métié
    p_ Arrete avec ton charabiat et montre moi ce que tu sais réellement faire.
    
    ->Intro.idle
    -bulletCLR=="blue":
    E_ emile tire un coups portant a l'ennemis, C'EST PAS DU JEU !
    e_ Cet étrange balle...Tu triches comme eue...
    e_ Comme eue.. tu ne reconnais pas le travail et la volonté des individus...
    e_ J'ai pas tricher ! Tu es capable de façonner un monde a ton image!
    e_ encore heureux que j'ai le droit de te battre a ton propre jeu !
    ->Intro.idle
    }
}
->DONE

===DeuxCoeurQuiSAiment===
l_ Dans le conflit, dans la tumulte, née l'amour.
l_ différents des romances, ou différents des amitiés. 
l_ Comprendre l'autre deviens vitale pour survivre.
l_ Un combat, est une forme d'amour impossible
l_ ce battre c'est donnée son coeur
-> idle

=idle 
{
  - e_ ...
    p_ Qu'est ce qu'il t'arrives? t'es bien plus silencieu cet fois.
    e_ Désolé je suis un peu ému.

  - e_ ...J'apprécie que tu prenne toute cet histoire au sérieux gamine. 
    p_ Ton charabiat en anglais abominable, n'enleve rien a ta volonté.
    p_ Je n'avais pas d'autre choix que t'offrir un vrai challenge.

  - p_ Combat moi avec toute la rage que tu possède.
    p_ Montre moi toute la férocité de ton entreprise.
    e_ CONCLUONS SE SPRINT!
}
->PlayerTurn
->DONE



=PlayerTurn
+[ATQ]->UneHistoireDEgo.ATQ
+[DEF]->UneHistoireDEgo.DEF
+[TLK]->UneHistoireDEgo.TLK
+{bulletCLR!="empty"}[SHT]->UneHistoireDEgo.shootMatrix


=ATQ
{SetMana("red")}
{
  - e_ ON SE RAPPROCHE ENFIN DE LA RELEASE !
    p_ JE COMMENCE A PIGER CE QUE TU DIS !
    ~TakeDamage(1)
    {SetMana("red")}

  - e_ Donne ton coeur une dernière fois au combat !
    p_ Je comptais donnée mon coeur au combat, avant que tu me dises ton truc la ! 
    ~TakeDamage(1)
    {SetMana("red")}
}

-> DeuxCoeursQuiSAiment.idle

=DEF
{
  - p_ Bah alors grand père on a du mal a suivre la cadence!
    {SetMana("blue")}

  - e_ C'est a cause des gens comme toi que j'ai tout perdu !
    p_ Je suis pas responsable de tes échecs!
    {SetMana("blue")}

    
}
-> Intro.idle

=TLK
e_ je vois que t'es épuisé...prend ça.
e_ Je ne veux pas que tu blame ton échec sur des injustices.
p_ ...J'aurais effectivement fait ça, mais crois pas que ...
p_ ... T'es une chance de me vaincre ! 
{SetMana("blue")}

-> Intro.idle
->DONE

=shootMatrix
{bulletPWR:
-2:
    {
    -bulletCLR=="red":
    b_ FINISSONS CE COMBAT$ PREPARE TOI A UNE RUPTURE DE L'ILLUSION
    ->CommentMeurtUnHommeDroit.idle
    -bulletCLR=="violet":
    e_ Brouillers les pistes t'amenera a rien.
    e_ Je vois que tu essayes de me titiler de me faire perdre la raison.
    e_ Mais ça n'arrivera pas, je crois en mes motivations.
    e_ prèpare toi a tirer tes dernières balles 
    ->LaRecompenseDesPerdants.idle
    }
-1:
    {
    -bulletCLR=="blue":
    e_ Tu vois pas plus que les autres ! Avec vos combines
    e_ Je suis un honnete travailleurs moi, j'ai fait ça toute ma vie.
    e_ Mais pourrez jamais comprendre ! JE PEUX JOUER AU MEME JEU QUE VOUS !
    ->LeGoutDeLaVictoire.idle
    }
}
->DONE

===CeluiQuiTireGagne===
l_Tout un futur depandant d'un simple instant
l_Une action capable d'en annuler une infinité
l_Une action des plus simple qu'elle peut être fait par erreur
l_mais un duel de volonté des plus érintant pour pouvoir l'accomplir

-> CeluiQuiTireGagne.idle

===idle===
~CheckCondition(condition)
e_je pense qu'il est temps pour un meeting en distenciel | il manque plus qu'un buisson sec traversant le lieu de notre duel et se sera parfait !
p_c'est obligé? je suis pas tres doué avec la technologie | Ca va être complexe vu où on est, mais un journal ou une canette vide t'irait ?
// c'est obligé? je suis plus doué avec la castagne que la technologie
->Titre.PlayerActions

=PlayerActions
+[ATQ]->Titre.Atq
+[DEF]->Titre.Def
+[TALK]->Titre.Tlk
+[SHOT]->Titre.ShotMatrix

=ATQ
{
  - e_Tu ne croie pas qu'il y a mieux a faire que d'agiter ton vulgaire sabre ici
    p_Au moins, je suis sûr de pas me tromper dans son utilisation! enfin j'espere

  - e_Un duel de cowboy est une epreuve d'ingeniosité et de volonté, alors arrete de foncer comme un simple animal sauvage!
    p_Qui sait, on est peut être entrain de créer une nouvelle variante?
    e_J'en doute !
}
~TakeDamage(-2 pv)
->Titre.Idle

=DEF 
{                        
	-e_est ce tu sens la tension dans l'air mon ami, les questions qui t'aisaille pour savoir quoi faire ?
	 p_Est ce que tu pourrais arreter de parler, j'essaye de me concentrer!
   e_Tu laisse passer trop d'information par ta simple voix!
	
	-e_Alors mon ami, arrive tu a t'adapter a cette manière de vivre? C'est tuer ou être tuer par ici!
	 p_J'ai l'habitude de devoir m'adapter sur le vif, je te dirais de faire plus attention a toi.
   e_ Bien. Ta voix respire la confiance, mais ce n'est pas encore le cas pour ton visage!
}
~SetMana(+1 blue)
~TakeDamage(-1 pv)
->Titre.Idle

=TALK
{
	-p_Tu est sur que tu veux pas revenir au combat au sabre? Perso, je me sentirais plus alaisse!
	 e_Pour juste s'entretuer en étant debout chacun devant l'autre, ca serait stupide.
   p_Le cliché d'un duel de cowboy, c'est pas ça mais avec plus de distance entre les deux adversaires?
   e_Je.. Je l'avais pas vu sous êtes angle, Ils ont peut être moins de difference que je le croyais?
}
~SetMana(+1 red)
->Titre.Idle

=ShotMatrix
{ bulletPWR :
	-1: {bulletCLR:
		-BLUE: ->cowboy 3
	}
		
	-2:{bulletCLR:
    e_Si les duels de samurai et cowboy peuvent être aussi similaire, est ce que d'autres aspect le sont aussi?
    e_ AAHHH, tu me fait douté a cause de ce que tu as dit !
    p_C'est juste un détail, tu sais ?
    e_Les détails sont importants, que ce soit lors des paiements de taxe ou dans l'art des duels!
    ->Intro.idle
		-VIOLET: ->LaRécompenseDesPerdants
	}
}


===LaRécompenseDesPerdants===
l_On dit que le vainqueur gagne tous
l_Mais ca ne veut pas dire que le perdant ne recoit rien
l_Il obtient un questionnement
l_Un questionnement sur ces raisons, sur ces actions, sur ces résultats
l_Et de pars cette récompense, il en sortira plus grandit que beaucoup de vainqueur

-> LaRécompenseDesPerdants.idle
===idle===
~CheckCondition(condition)
e_Si le samurai et le cowboy sont si similaire, ca ne sert a rien d'avoir deux poste pour le même travail
p_Du coup, tu conte en choisir un et virer l'autre ou faire une merger and aquisitions (M&A) ?
e_...
->LaRécompenseDesPerdants.PlayerActions

=PlayerActions
+[ATQ]->LaRécompenseDesPerdants.Atq
+[DEF]->LaRécompenseDesPerdants.Def
+[TALK]->LaRécompenseDesPerdants.Tlk
+[SHOT]->LaRécompenseDesPerdants.ShotMatrix

=ATQ
{
e_La voie du samurai m'est venu car je croyais a être quelqu'un d'honnête et qui tient ces objectifs
p_Pourquoi "croyais"? tu n'y crois plus maintenant ?
e_Pas apres un certain licensiment

p_Une raison particulière pour ce licensiment ?
e_Aucune, j'étais un employé modele respecté dans l'entreprise et on m'a juste jeté pour raison financière
p_Mais alors, pourquoi tu continue à croire encore en cette voie ?
e_Probablement car ca me rapelle un temps meilleur
}
~SetMana(Red)
~TakeDamage(1)
->LaRécompenseDesPerdants.Idle

=DEF 
{                        
	-e_La voie du Cowboy m'est venu car je croyais que le charisme et force de caractère me manquait
	 p_Est tu ne croie plus que ce n'est le cas ?
   e_Maintenant, je pense juste que c'est une methode differente qui n'est pas ma preferée
	
	-p_Pourquoi ne pas être revenue a la voie du samurai, alors ?
	 e_Parce que celle du cowboy change et ce changement me rassure que mon licensiment n'était pour rien
}
~SetMana(Blue)
~TakeDamage(1)
->LaRécompenseDesPerdants.Idle

=TALK
{
	-e_
	 p_
   p_
   e_
}
~TakeDamage(1)
->LaRécompenseDesPerdants.Idle

=ShotMatrix
{ bulletPWR :
	-1: {bulletCLR:
    e_Pourquoi me pousser sur la voie du Cowboy ?
    p_Parce que tous change, la question est: est ce que tu va resté sur le coté ou foncé vers le soleil ?
    e_T'as raison, je ne peu pas resté immobilisé par mon doute !
    e_Il est temps d'allumer notre feu et de devenir les pionniers du numérique ! YAOUH
    ->LaRécompenseDesPerdants.idle
		-BLUE: ->cowboy Ending
	}
		
	-2:{bulletCLR:
    e_Pourquoi je retournerai sur la voie du Samurai ?
    p_parce que ce lisenciment n'est pas ta défaite mais la défaite de ton ancienne entreprise !
    p_un samurai n'est pas honorable pour les autres, mais pour lui-même et ces objectifs
    e_Et un véritable samurai n'abandonne pas son objectif même devant la mort !
    e_Et je compte te le demontré maintenant, mon ami
		-RED: ->samurai Ending

  -3:{bulletCLR:
    e_Pourquoi m'envoyé des signes contradictoires, tu veux m'aider ou me l'aissé perdue ?
    p_Tu as bien vu les similarité entre les deux, pourquoi ne pas les essayé de les fusionner pour innover ?
    e_Comme quand Goku et Vegeta ont fusionner pour devenir Vegetto et vaincre la plus puissante version de BUU !
    p_Je vois pas trop de quoi tu parle mais tant que tu capte l'idée
    e_Et merci mon ami de m'avoir rappelé que l'innovation, c'est l'essence même de l'entreprenariat !
    e_Mais maintenant, est tu prêt pour ce qui va arriver !
    p_ j'espere
		-VIOLET: ->neutre Ending
	}
}
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