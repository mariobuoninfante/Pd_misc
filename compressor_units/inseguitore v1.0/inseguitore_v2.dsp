declare name 					"inseguitore";
declare version				"1.0";
declare license				"LGPLv2";
declare author 				"Mario Buoninfante";
declare copyright				"(c)2013 Mario Buoninfante";
declare description			"inseguitore d'inviluppo-envelope follower, basato su U.Zolzer-Digital Audio Signal Processing-2nd edition, Wiley 2008";


//-----------------------------------------------------LICENZA-------------------------------------------------------------//
//-------------------------------------------------------------------------------------------------------------------------//
//----questo programma e' reso disponibile nei termini della licenza GNU Lesser General Public License v2------------------//
//----e' possibile consultare una copia della licenza LGPL in http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html ------//
//-------------------------------------------------------------------------------------------------------------------------//
//-------------------------------------------------------------------------------------------------------------------------//


import ("math.lib");
import ("filter.lib");

// parametri paccessibili all'utilizzatore: Ta= tempo d'attacco in ms; Tr= tempo di rilascio in ms
Ta= hslider("Ta", 1.0, 0.1, 500, 0.1);
Tr= hslider("Tr", 20.0, 0.1, 1000, 0.1);

// coefficienti per i misuratori di livello
AT= (1-a) with {a=exp(-2.2/((Ta*0.001)*SR));}; 
RT= (1-a) with {a=exp(-2.2/((Tr*0.001)*SR));};

// comparatori utilizzati per passare dalla modalita' "attacco" a quella "rilascio"
comp1(x)=  x>=0; 
comp2(x)=  x==0;

FILTRO_2(w,z,x)= (((x)-_~(_*(RT*comp2(z) ) ) ) );
FILTRO_3(b)= ((b+_<:FILTRO_2(_,b) )~_);
FILTRO_4(x)=  (_:abs(x)-_<:(_*(AT*comp1(_)):FILTRO_3))~_ ;



process = FILTRO_4;