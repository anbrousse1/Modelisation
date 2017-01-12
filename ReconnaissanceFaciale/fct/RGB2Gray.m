
% transforme une image en couleur en une image en noir et blanc
function J=RGB2Gray(I)

  [H,L,n]=size(I);
  if(n!=3) J=I;
  else
    r=0.3;
    g=0,59;
    b=0.11;
    J=zeros(H,L);
    J(:,:)=round(r*I(:,:,1)+g*I(:,:,2)+b*I(:,:,3));
  end
endfunction
