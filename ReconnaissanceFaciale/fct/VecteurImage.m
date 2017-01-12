##FONCTION qui compare dans un tableau des images par rapport à une image envoyée séparément
function VecteurImage()
  global NbSolution; 
  global M;
  global imageTest;
  
  #transforme l'image en vecteur
  VS=I2Vector(imageTest);
  tab = zeros(53,2);
  #range dans un tableau toute les différences entre les deux vecteurs comparé
  for i = 1:53 
    D = M(:,i)-VS;
    tab(i,1)=norm(D);
    tab(i,2)=i;
  endfor

  #tri le tableau dans un odre croissant
  tab = sortrows(tab);
  
  #affiche les N solutions les plus proche voulu
  for i = 1:NbSolution
    msg = uint16(tab(i,2));  
    img = Vector2I(M(:,msg));
    img=double(img);
    subplot(2,6,6+i);
    imshow(uint8(img))
  endfor


endfunction