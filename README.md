# SnowBotProject
bot Controller qui connecte des bots Hdv qui manages leurs team. Multi-Serveur.

Le système après clean devrais géré en autonomie du niveau 1 à 120, l'xp, le stuff des TEAM optimisé, découverte des zaps, l'hdv, la banque, changement de zone, ia avancée plus ou moins opti selon les personnages, et bien d'autres ... tout ceci dans le temps en lançant le bot Controller une unique fois. 

Les zones 120-200 sont à compléter.

INSTALLATION:

Dans "C:\Program Files (x86)\Snowbot\SnowbotPC\SnowbotPC" créez un fichier dossier "script" et cloner ce répo.

Vous pouvez modifier les paramètres dans le dossier "\\Config"
- Logs
- idHDV
- IdLEAD
- idBANK (Pas encore présent)
- etc...

Ensuite lancez un Bot Controller avec le script CONTROLLER.lua, qui devrais connecter les Bots HDV qui connecterons les Bots TEAM.

DEV: Vous pouvez également activer les modes débug pour le développement et comprendre le programe dans "Functions/printF.lua"


Erreurs à corriger:
Si un membre du groupe est abonné, ils doivent tous êtres abonnés afin de ne pas perturber le script Team.
D'autres...
