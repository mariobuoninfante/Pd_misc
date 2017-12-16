// "Compressor - Static Curve" - it accepts signal in dB and returns linear signal

declare name		 		"Static Curve";
declare version				"0.1";
declare author				"Mario Buoninfante";
declare license				"LGPL v2";

import ("filter.lib");

T = vslider ("h:Param/Threshold", 0.0, -72.0, 0.0, 0.1); // THRESHOLD
R = vslider ("h:Param/Ratio", 1.0, 1.0, 30.0, 0.1); // RATIO
S = float((1.0 - (1.0/R))*(-1.0)); // -SLOPE (negative)

static_curve =  (_-T) <: (_>= 0)*_ : _*(S) : db2linear;

process = static_curve;
