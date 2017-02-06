##FONCTION lancée lorsque l'utilisateur clique sur le bouton "Quitter"
function CloseApp()
#Boutton pour confirmer que l'on veut quiiter l'application
button = questdlg('Voulez vous quitter?','Exit Dialog','Oui','No','No');
#Gestion des deux cas(Oui ou Non)
switch button
    case 'Oui',
        disp('Fermeture du programme')
        close();
    case 'No',
        quit cancel;
end
endfunction