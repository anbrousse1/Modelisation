##FONCTION lancée lorsque l'utilisateur clique sur le bouton "lancer l'analyse"
function Analyse()
    global ALGO;
    global imageTest;
    
    #Si aucune image n'est présente alors on ouvre la fonction chargeFichier qui va nous proposer d'en récupérer une.
    if(imageTest==0)
        ChargerFichier();
    else
    #sinon on regarde quel type de méthode à été choisi et on exécute le code approprié.
      if(ALGO==1)
        VecteurImage();
      else VecteurPropre();
      endif
    
    endif
  
  
  
  
  
endfunction