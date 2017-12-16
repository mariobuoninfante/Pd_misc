// "Compressor - Level Measurement Unit" - it accepts audio signals as input and returns the level measurement value in dB

declare name "level measurement";
declare author "Mario Buoninfante";
declare version "0.01";
declare license "LGPLv2";

import ("math.lib");
import ("filter.lib");

Ta= vslider("h:Param/Ta", 1.0, 0.1, 500, 0.1);
Tr= vslider("h:Param/Tr", 30.0, 0.1, 1000, 0.1);
Tav= vslider("h:Param/Tav", 200.0, 0.1, 1000, 0.1);
switch = checkbox ("Peak Rms");

AT= (1-a) with {a=exp(-2.2/((Ta*0.001)*SR));}; 
RT= (1-a) with {a=exp(-2.2/((Tr*0.001)*SR));};
TAV = (1-a) with {a=exp(-2.2/((Tav*0.001)*SR));}; 

// SELETTORE MISRATORE DI LIVELLO (peak/RMS)----------------------------------------------------------------------------------------------
level_meas =select2 (switch);

//--------------------------------------------------------
//--------------------------------------------------------
comparator(x) = x<:_ * (_>0);
comparator2(x) = x<:_ * (_<=0);

peak(x) = ( ( ( ( ( ( _+AT*( (_ - abs(x) ) : comparator ) )  -  _*(RT*comparator2(abs(x)-_) ) )~_ )~_)~_)~_) : linear2db ;
RMS(x) = (( ( ( ( (x <: (_*_)) - _ ) * TAV) + _)~_)~_) : linear2db(_) : _*0.5 ;

//--------------------------------------------------------
//--------------------------------------------------------
process = _<: ( ( (_*(1-switch)) : peak), ( (_*switch) : RMS)) : +;
