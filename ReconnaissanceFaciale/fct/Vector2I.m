% Transforme un vecteur colonne en image
function V=Vector2I(I)
  [H,L]=size(I);
  I=double(I);
  V=reshape(I,sqrt(H),sqrt(H));
endfunction
