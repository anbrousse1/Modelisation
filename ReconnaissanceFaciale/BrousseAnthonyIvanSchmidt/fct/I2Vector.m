%transforme l'image en un vecteur colonne
function V=I2Vector(I)
  [H,L]=size(I);
  I=double(I);
  V=reshape(I,[H*L],1);
endfunction