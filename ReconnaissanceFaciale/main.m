clear all;
close all;
addpath("./fct");

s = get(0, 'ScreenSize');

####==============####
####   GLOBALE    ####
####==============####

global ALGO = 1;
global NbSolution = 1;
global NbDetail=5;
global M;
global h;
global cb;
global label;
global imageTest=0;

#Chargement de la base de donnée
load("SaveM");

# DECLARATION DE LA FENETRE 

h=figure('Position', [s(3)/2-375 s(4)/2-250 725  450],...
"color",[0.5 0.5 0.5],...
"name","Reconnaissance faciale",
"menubar","none",...
'numbertitle','off');


####=============####
####   Button    ####
####=============####



##bouton pour quitter
buttonQuit=uicontrol('Parent',h,'style','pushbutton',...
'units','normalized',
'string','QUITTER',
'position',[0.78 0.02 0.21 0.05],...
'CallBack','@CloseApp()',
'BackgroundColor', get(gcf,'Color'));

##Bouton recherche
buttonRecherche=uicontrol('Parent',h,'style','pushbutton',...
'units','normalized',
'string','Lancer Analyse',
'position',[0.78 0.10 0.21 0.05],
'CallBack','@Analyse()',
'BackgroundColor', get(gcf,'Color'));


##Bouton recherche
buttonCharger=uicontrol('Parent',h,'style','pushbutton',...
'units','normalized',
'string','Charger une image',
'position',[0.78 0.30 0.21 0.05],
'CallBack','@ChargerFichier()',
'BackgroundColor', get(gcf,'Color'));


##COMBOBOX ou l'utilisateur doit choisir entre deux méthodes différentes
comboboxAlgo=uicontrol('Parent',h,
'style','popupmenu',
'units','normalized',
'string',{'Vecteur Image','Vecteur Propre'},
'position',[0.78 0.88 0.21 0.05],
'CallBack','@setAlgo(comboboxAlgo)');

##COMBOBOX ou l'utilisateur doit choisir le nombre de 
comboboxNbSol=uicontrol('Parent',h,
'style','popupmenu',
'units','normalized',
'string',{'1','2','3','4','5'},
'position',[0.78 0.73 0.21 0.05],
'CallBack','@setSolution(comboboxNbSol)');



####===========####
####   LABEL   ####
####===========####

## LABEL Image a tester:
uicontrol('Parent',h,'Style','text','String','Image a tester :',
'units','normalized',
'position',[0.14 0.93 0.2 0.05],
'foregroundcolor','w',
'fontsize',14,
'BackgroundColor', get(gcf,'Color'));

## LABEL Nombre de solution:
uicontrol('Parent',h,'style','text',
'units','normalized',
'position',[0.78 0.80 0.21 0.05],
'string','Nombre de solution',
'foregroundcolor','w',
'fontsize',8,
'BackgroundColor', get(gcf,'Color')');

## LABEL Choix Algo:
uicontrol('Parent',h,'style','text',
'units','normalized',
'position',[0.78 0.94 0.21 0.05],
'string','Choix Algo',
'foregroundcolor','w',
'fontsize',8,
'BackgroundColor', get(gcf,'Color')');

    
####===============####
####   FONCTION    ####
####===============####   

##Fonction qui gère l'instanciation de la méthode séléctionnée et elle affiche seulement si la méthode VisagePropre est présente, une 
##fenetre suppélmentaire pour le niveau de détail.
function setAlgo(item,callbackdata)
  global ALGO;
  global h;
  global cb;
  global label;
  #récupération de la valeur d'aglo 
  ALGO=get(item,'value');
  if(ALGO==2) 
    #création du label
    label=uicontrol('Parent',h,'style','text',
    'units','normalized',
    'position',[0.78 0.55 0.21 0.05],
    'string','Nombre de détails',
    'foregroundcolor','w',
    'fontsize',8,
    'BackgroundColor', get(gcf,'Color')');
    #Création du control pour le détail
    cb=uicontrol('Parent',h,
    'Tag','detail',
    'visible','on',
    'style','edit',
    'units','normalized',
    'position',[0.78 0.50 0.21 0.05],
    'CallBack','@setDetail(cb)');
  else   
    delete(cb);
    delete(label);
  endif
endfunction

##Fonction qui récupère le nombre de solutions voulu
function setSolution(item,callbackdata)
  global NbSolution;
  NbSolution=get(item,'value');
endfunction

##Fonction qui récupère le nombre de solutions voulu
function setDetail(item,callbackdata)
  global NbDetail;
  NbDetail=str2num(get(item,'String'));
endfunction

