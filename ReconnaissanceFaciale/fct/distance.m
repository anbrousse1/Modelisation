##FONCTION utilisée pour calculer la distance(leur différences) entre deux images qui sont converties en vecteur
function V=distance(I,J)
  I=double(I);
  [H,L,n]=size(I); 
  J=double(J);
  [H,L,n]=size(J);
  A=zeros(H*H,1);
  B=zeros(H*H,1);
  A=I2Vector(I); 
  B=I2Vector(J);
  V=sqrt(sum((A-B).^2));
  
endfunction


