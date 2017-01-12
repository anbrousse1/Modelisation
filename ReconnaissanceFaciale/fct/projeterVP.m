##FONCTION utilisée lorsque la Méthode Vecteur Propre est utilisée. Elle sert à projeter 
#l'image(convertie en vecteur) sur chaque colonne de M
function P= projeterVP(M,img,N,u)
  P = zeros(16384,1);
  for i=1:N 
    VP= u(:,i);
    P=P+ (M(:,img)'*VP)*VP;
  endfor
    
endfunction



