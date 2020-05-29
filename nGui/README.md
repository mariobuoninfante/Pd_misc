# nGui - Pure Data
Simple GUI library

## About
Simple GUI library written in Pure Data Vanilla that allows to save and recall presets.

## Compatibility
Pd >= 0.50.0

## Tips and tricks
[nPreset] links to all the GUI objects that use its same unique identifier and this means that a [nPreset] can talk to GUI objects created in a different patch. 
One way to reduce the scope of [nPreset] and all the GUI objets (ie make them local) is to use $0 as unique identifier.


## Copyright
2020 - Mario Buoninfante
mario.buoninfante@gmail.com


## License
See LICENSE
