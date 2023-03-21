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
    p_ MONTRE MOI TOUT CE QUE TU AS DANS LE VENTRE ! #fx_shot
    ->UneHistoireDEgo.idle
    -bulletCLR=="blue":
    n_ emile tire un coups portant a l'ennemis, 
    e_ C'EST PAS DU JEU !
    e_ Cet étrange balle...Tu triches comme eue...
    e_ Comme eue.. tu ne reconnais pas le travail et la volonté des individus...
    p_ J'ai pas tricher ! Tu ne réalises meme pas l'étendu de ton impact ici!
    p_ encore heureux que j'ai le droit de te battre a ton propre jeu !
    ->CeluiQuiTireGagne.idle
    }
}
-> END

===UneHistoireDEgo===
//https://www.youtube.com/watch?v=96YaOyAAXAg
l_ chaque humain, trouve son ego dans les récit de l'imaginaire collectif
l_ Chacun, y voit ce qu'il aspire a etre, une référence a envier.
l_ Quand deux ego se rencontre, ils se confrontent.
l_ Dans ce combat, se joue plus que la victoire ou la défaite.
l_ il se joue l'héritage de l'humanité.
-> idle

=idle 
{
  - e_ Oh chère camarade de bataille, le ressens-tu ? Cette excitation du combat, cette chaleur ?
    e_ celle que on ne ressent qu'au début du sprint... 
    p_ ...j'ai désagréablement l'impression d'arrivé a comprendre ce que tu racontes.

  - e_ celle qu'on apperçois que proche de la release
    p_ J'ai compris c'est bon !

  - e_ celle qu'on apperçois que proche de la release
    p_ TU COMMENCES A ME RENDRE FOLLE !

  - p_ Arrete avec ce langage.
    p_ Moi cet bagarre je veux la faire j'y crois
    p_ la castagne c'est mon truc. Moi je met mon ego en jeu, et j'attend que toi aussi.
    {SetMana("purple")}

  - e_ j'utilises pas tout ses mots pour rien.
    e_ Moi en toute ses choses la j'y crois. J'ai pas le choix.
    e_ L'agilité, le monde de demain, la fléxiblité, le remote tout ses choses la.
    p_ tu te ments a toi meme. Qui as heurté ? MONTRE MOI!
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

  - n_ X attaque Emil avec son katana, lui infligeant des dégâts.
    n_ surpris par le coups, Emil en profite malgré tout pour infliger un coups avec le flan de son armees #fx_shot
    e_ TU N'EST PAS ASSEZ PROACTIF POUR GAGNER CETTE BATAILLE, 
    e_ DANS CE COMBAT NOUS SOMMES LES UNIQUES PRODUCT OWNER DE NOTRE PROJET
    p_ attend, je suis conf-
    b_ mais enfaite t'inventes des mots$COMBIEN A TU MIT DE STORY POINT DANS CE COMBAT!
    b_ "yes i love america, do you about taxes, and fraude fiscale", tu vois moi aussi je peux inventer des mot"$MONTRE MOI TA VRAI DÉTERMINAT-Oh la t'es mesquin.
    ~TakeDamage(1)
    {SetMana("red")}

  - n_ X attaque Emil avec son katana, lui infligeant des dégâts.
    n_ surpris par le coups, Emil en profite malgré tout pour infliger un coups avec le flan de son armees #fx_shot
    b_ SOIT NORMAL POUR UNE FOIS ET DIT DES TRUCS DE MEC QUI SE BATS$ CONCLUONS UNE DERNIERE FOIS CET USER STORY #fx_clash
    ~TakeDamage(1)
    {SetMana("red")}
-> UneHistoireDEgo.idle

=DEF
{
  - e_ Tu peux repousser la deadline mais elle reviens toujours !
    p_ je repousse aucun mot en anglais moi ! euh... je réfléchis juste un peu.
    P_ ...Attend deadline tu parles de genre quand il y a plus de réseau?
    p_ Ah non ça a pas  de sens, fin bref euh je repousse rien du tout moi!

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
    n_ emile tire un coups portant a l'ennemis,
    p_ Si Un vrai défis loyal que tu veux je vais te le donner.
    e_ hahaha gamine tu manqeus pas d'air, j'aime bien ça...
    e_ te combattre...Est différent, j'ai jamais eue un adversaire comme toi
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
l_Tout un futur vie dans un simple instant
l_Une action capable d'en annuler une infinité
l_Une action des plus simple qu'elle peut être fait par erreur
l_mais un duel de volonté des plus érintant pour pouvoir l'accomplir

-> CeluiQuiTireGagne.idle

===idle===
{
  - e_ Je pense qu'il est temps pour toi d'apprendre a géré les choses a distance, kiddo...
    p_ Oh non pas des surnoms bizarre, tout sauf ça...
    ->CeluiQuiTireGagne.PlayerActions

  - e_ Une falaise...un couchez de soleil...deux personne pret a tiret...est tu pret gamine...?
    p_ J'ai jamais été aussi pret de ma vie, et meme genre avant j'étais pret mais pas aussi pret
    ->CeluiQuiTireGagne.PlayerActions
  - else:
    ->DONE
}
// c'est obligé? je suis plus doué avec la castagne que la technologie
//je pense qu'il est temps pour un meeting en distenciel 
->CeluiQuiTireGagne.PlayerActions

=PlayerActions
+[ATQ]->Titre.Atq
+[DEF]->Titre.Def
+[TALK]->Titre.Tlk
+[SHOT]->Titre.ShotMatrix

=ATQ
{
  - e_ Tu ne croie pas qu'il y a mieux a faire que d'agiter ton vulgaire sabre ici
    p_ Euh vulgaire toi meme ! tu sais meme pas que les Katana ça peut trancher des balles en deux!
    n_ Emile se prend un coups juste après avoir dégainé, venant se loger directement dans une de ses jambes
    ~TakeDamage(2)
    //p_ Au moins, je suis sûr de pas me tromper dans son utili-....ok c'est pas ma meilleurs celle la

  - e_ Un duel de cowboy est une epreuve d'ingeniosité et de volonté, alors arrete de foncer like a beast!
    p_ Qui sait, on est peut être entrain de créer une nouvelle variante? ET ARRETE AVEC L'ANGLAIS
    e_ J'apprécie ta détermination, dear friend, mais le monde est bien plus rude que tu le visualise.
    ~TakeDamage(2)
}
->Titre.Idle

=DEF 
{                        
	-e_est ce tu sens la tension dans l'air mon ami, les questions qui t'aisaille pour savoir quoi faire ?
	 p_Est ce que tu pourrais arreter de parler, j'essaye de me concentrer!
   e_Tu laisse passer trop d'information par ta simple voix!
   n_ X tire 2 coups sans prévenir, préparé emile esquive a grande vitesse les deux coups
	 ~SetMana(1)
   
	-e_Alors mon ami, arrive tu a t'adapter a cette manière de vivre? it's killed or be leaved!
	 p_ J'ai l'habitude de devoir m'adapter sur le vif moi ...mais c'est meme pas la bonne expression !
   e_ Bien. Ta voix respire la confiance, mais ce n'est pas encore le cas of your face!
   n_ X tire 2 coups sans prévenir, préparé emile esquive le premier coups mais reçois le second
   ~SetMana(1)
}
~SetMana(1)
->Titre.Idle

=TALK
{
	- p_ Tu est sur que tu veux pas revenir au combat au sabre ?
    p_ non car moi mon flingue je peux tirer quand je veux !
    p_ et puis c'est pas un épisode de tex avery ! je tente de frapper tu tire, je frappe tu tire, c'est bon la
    e_ Pour rappel gamine tu es la première a avoir tiré 
    p_ Ouai mais moi je suis pas capable de matérialiser un foutu monde autour de moi!
    p_ non et puis tu sais quoi ? espèce de lache !
    e_ ...ta stratégie est d'essayer de m'enerver?

  - P_ bouuuu! espèce de pleutre ! et meme que je suis sur que tu te chie encore dessus !
    e_ Bon la ça devien puéril.
    P_ cot, cot, cot la poule mouillé!
    e_ C'est bon j'ai compris arrete! 
    p_ Bouuuuh le looser! Tu vas faire quoi? appellez elise pour lui dire que je me moque de toi?
    p_ GAMINE FAIT GAFFE A CE QUE TU DIS JE SUIS UN ENTREPENEUR SÉRIEUX!
    {SetMana("red")}
  //   e_ C'est bon j'ai ce qu'il me fallait, désolé pour ça des fois faut etre créative, hé hé hé.

  //   e_ et puis non mais tu prenais grave la tete avec ton 
  //   p_ Moi je suis pour une bagarre a l'ancienne, pan, pan, boom et ptet on tire pour conclure!

	//  e_Pour juste s'entretuer en étant debout chacun devant l'autre, ca serait stupide.
  //  p_Le cliché d'un duel de cowboy, c'est pas ça mais avec plus de distance entre les deux adversaires?
  //  e_Je.. Je l'avais pas vu sous êtes angle, Ils ont peut être moins de difference que je le croyais?
}
~SetMana(+1 red)
->Titre.Idle

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
//   =shootMatrix
// {bulletPWR:
// -2:
//     {
    
//     -bulletCLR=="red":
//     b_ FINISSONS CE COMBAT$ PREPARE TOI A UNE RUPTURE DE L'ILLUSION
//     ->CommentMeurtUnHommeDroit.idle

//     - bulletCLR=="violet":
//     e_ Brouillers les pistes t'amenera a rien.
//     e_ Je vois que tu essayes de me titiler de me faire perdre la raison.
//     e_ Mais ça n'arrivera pas, je crois en mes motivations.
//     e_ prèpare toi a tirer tes dernières balles 
//     ->LaRecompenseDesPerdants.idle
//     }
// -1:
//     {
//     -bulletCLR=="blue":
//     e_ Tu vois pas plus que les autres ! Avec vos combines
//     e_ Je suis un honnete travailleurs moi, j'ai fait ça toute ma vie.
//     e_ Mais pourrez jamais comprendre ! JE PEUX JOUER AU MEME JEU QUE VOUS !
//     ->LeGoutDeLaVictoire.idle
//     }
// }
// }


===LaRécompenseDesPerdants===
l_On dit que le vainqueur gagne tous
l_Mais ca ne veut pas dire que le perdant ne recoit rien
l_Il obtient un questionnement
l_Un questionnement sur ces raisons, sur ces actions, sur ces résultats
l_Et de pars cette récompense, il en sortira plus grandit que beaucoup de vainqueur

-> LaRécompenseDesPerdants.idle
===idle===
{ 
  - e_ Finalement je commence a comprendre pourquoi ils m'ont viré.
    e_ Je suis facilement émotif, et peut etre que je tenais trop a ce petit job misérable
    e_ Tu as su bien manipuler mes émotions gamine. Mais il est temps de trouver une résolution a tout ça.
    e_ ...Peut etre que la réalité est plus complexe qu'un lexique agile. 
    p_ ....

  - e_ Tu sais...C'est pas parce que tu te bats pour Elise que tu n'es pas comme moi.
    e_ Agitez cet armes, avec la légitimité de l'hote de ses lieux, te rend pas plus sain que moi.
    e_ A la fin de tout ce jeu, quand il ne restera plus que l'un de nous,
    e_ qui sera réellement le gagnant de tout ça?
}

//~CheckCondition(condition)
//e_Si le samurai et le cowboy sont si similaire, ca ne sert a rien d'avoir deux poste pour le même travail
//p_Du coup, tu conte en choisir un et virer l'autre ou faire une merger and aquisitions (M&A) ?
e_...
->LaRécompenseDesPerdants.PlayerActions

=PlayerActions
+[ATQ]->LaRécompenseDesPerdants.Atq
+[DEF]->LaRécompenseDesPerdants.Def
+[TALK]->LaRécompenseDesPerdants.Tlk
+[SHOT]->LaRécompenseDesPerdants.ShotMatrix

=ATQ
{
  - e_ Je croyais que si j'étais honnête avec mes faiblesses et mes erreurs, je puourrais allé loin
    p_ Mais ça n'as servit a rien 
    e_ Mais maintenant je compte bien tout avoir, je suis un entrepreneur 
    p_ me bassiner avec ta moral , pour finir par me dire ce genre de banalité. 

    p_ Tu sais ton truc la il est bancal, et comment compte tu aboutir a ton délire? 
    p_ en exploitant comme tu t'es fait exploiter?
    e_ Tu peux pas comprendre ! je suis de l'autre coté de la barrière maintenant
    e_ ce monde est cruel et je compte pas etre encore une fois la victime !
}
~SetMana(Red)
~TakeDamage(1)
->LaRécompenseDesPerdants.Idle

=DEF 
{                 
  e_Tu sait c'est un honneur de pouvoir travailler pour faire fonctionner une entreprise.
  p_Je sais pas j'ai jamais travailler, mais je ne vois pas l'honneur dans l'exploitation qu'on fait de toi
  e_Quelqu'un qui n'a jamais travailler ne pourra le comprendre.
  e_Même si c'est dur, c'est le travail qui fait l'orgeil d'un véritable homme.

  p_Mais tu n'as pas de resentiment envers ceux qui t'exploite ?
  e_Comment je pourrais, il fait ce qu'il faut pour maintenir le bateau en place.
  e_Il nous exploite pas, il nous diriguent pour qu'on le plus utilie possible a l'entreprise.
  e_Il se tient tous derrière nous et abat ceux qui ne peuvent pas suivre pour le meilleur!
  p_Non mais tu te rend compte de ce que tu me raconte là !

  - e_ ... j'etais vraiment fière de mon travail et mon role, tu comprend ça ?
    p_ J'ai fait que des job minable, j'ai un peu du mal a voir l'honneur dans ce genre d'exploitation.
    e_ J'aurais du me douter que tu serais pas apte a comprendre.
    e_ Tu visualise la chose de manière manichéenne, je chérie  avec amourr l'orgeuil tiré de mon travail,

  - p_ Enfaite... je te comprend pas, mais tu gardes pas de ressentiment pour ceux qui t'on viré?
    e_ Gamine... c'est toujours plus compliqué que ça. Des fois des choix sont fait pour le bien de tous.  
    e_ je n'étais pas dans les meilleurs, et j'en tiens toute la responsabilité.
    p_ ... Ce que tu racontes est lamentable, et j'en crois pas un seule mot.
    p_ ça se voit que tu leurs en veux plus que tu veuilles le reconnaitre. Soit honnête avec toi même.
}
~SetMana(Blue)
~TakeDamage(1)
->LaRécompenseDesPerdants.Idle

=TALK
{
	- p_ Je- 
	  p_ Gamine n'essaye pas, je commence a comprendre comment tu fonctionne
    n_ X tire sans prévenir un coup te touchant au niveau de l'épaule
    p_ au moins  c'est clair, ça fait mal ton machin !
    ~TakeDamage(1)
}
~TakeDamage(1)
->LaRécompenseDesPerdants.Idle

=ShotMatrix
{ bulletPWR :
	-2: 
    {bulletCLR:
    - bulletCLR=="blue":
      P_ ...maintenant que on est la.... la question est la suivante : que veut tu vraiment faire ?
      e_ Tu ferais une bonne stagiaire.... tu as raison, je dois me ressaisir, mettons fin au doute.
      e_ Je veux jouer selon leurs règle, je veux vraiment réussir, etre a jamais indépendant.
      p_ Tu poursuit une chimère mais si c'est ce que tu veux allons-y une dernière fois.
      n_ Emile tire solannellement une balle retentissante.
      ->unAmourPourCeluiTire.idle
    - bulletCLR=="red":
      p_ Tu dis tout ses trucs sans la moindre conviction. tu utilises le meme langague que eue
      p_ parce que ce lisenciment n'est pas ta défaite, prendre leurs code, te rendra pas meilleurs !
      p_ Si tu veux profiter de cet occasion, pour etre meilleurs fait le a fond, sans les singuer !
      e_ Merci beaucoup gamine...Mais t'es encore trop jeune pour comprendre.
      e_ Je vais t'offrir une leçon qui te servira pour ta future carrière pro...soit pret.
  	  ->CommentMeurtUnHommeDroit.idle
    - bulletCLR=="violet"
      e_ Tu es...proprement inssuportable, tu ne cesse d'envoyer des signe contradictoires.!
      p_ Euh... c'est toi qui est contradictoire ! On comprend rien a ce que tu racontes ! 
      p_ ça se voit que tu sais pas ce que tu fais ni raconte, on pipe rien a ce que tu dis.
      e_ tu penses genre...je devrais trouver un milieux..une espèce de fusion comme sangoku et vegetta?
      p_ ...Je lis pas vraiment de manga, désolé je suis un peu malaisé la je sais pas trop quoi te répondre
      e_ Merci... je sais comment faire... je sais vers ou mener ma nouvelle carrière, mon entreprenariat.
      p_ Franchement retournons a la bagarre, ce que tu racontes me donne proprement mal au crane.
	}
		
	-2:{bulletCLR:
    p_ Tu dis tout ses trucs sans la moindre conviction. tu utilises le meme langague que eue
    p_ parce que ce lisenciment n'est pas ta défaite, prendre leurs code, te rendra pas meilleurs !
    p_ Si tu veux profiter de cet occasion, pour etre meilleurs fait le a fond, sans les singuer !
    e_ Merci beaucoup gamine...Mais t'es encore trop jeune pour comprendre.
    e_ Je vais t'offrir une leçon qui te servira pour ta future carrière pro...soit pret.
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