function ChargerFichier()

  global imageTest;
  
  steps = 10;
  #Chargement du fichier
  
  [name,path] = uigetfile("Choisir le fichier"); 
  #Gestion de la vue d'erreur si l'utilisateur clique sur le boutton "annuler"
  if(name==0)
     errordlg("Aucune image sélectionnée");
  else 
  h = waitbar(0,strcat('Chargement de ',name),...
  'Name','Chargement de l image test');
  #chargement de la barre et concaténation du chemin et ud nom du fichier
  waitbar(2 / steps)
  img = strcat(path,name);
  #transformation de l'image en double
  imageTest=double(imread(img));
  [H,L,n]=size(imageTest);
  
  if(H!=128 || L!=128)
    errordlg("Taille de l'image incorrecte");
    close(h);
  else
  
    #chargement de la barre et déclaration de l'endroit pour afficher l'image
    waitbar(6 / steps)
    subplot(2,6,[1,2]);
    
    #affichage de l'image  
    imshow(uint8(imageTest));
    
    #fermeture de la barre de chargement
    waitbar(10 / steps)
    close(h);
    endif
  endif
 
 endfunction