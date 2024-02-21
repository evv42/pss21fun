# Fun for Yamaha PSS-21 keyboards

This repository is an unsucessful (for now) attempt in reverse-engeneering the Yamaha PSS-21 keyboard.  
The work here may be useful to the following keyboards:  
```
Same ROM (XL437):
- PSS-11
- PSS-31
- PSR-75

Different ROM:
- PSR-150
- PSR-110
- PSR-180
- PSR-185
- PSR-76
- PSR-73/77
- PSR-74
- PSR-125
- PSS-12
- PSS-6
- DD-9
- DD-20
- PSR-190
- PSR-78
- PSR-130
```

## Contents
```
xl437a00.dis dissassembly of original rom (program only)
rom.0 minimal template program
romX.bin samples and filler data
build.sh vasm build script
```

## Todo
```
- Original ROM reverse engeneering
- New firmware design
```

## Information on GEW7 chip (YMW270-F)

It's a 65C02 based ASIC with some RAM, 4 I/O Ports, a Timer, a Clock Generator and a PCM/DAC thignie.  
The chip can address up to 512KB of memory via a integrated mapper, which uses two 16K banks, and a fixed one.  
Port C is multiplexed with the some of the CPU pins, most notably R/W.  

## Memory Map (incomplete, see mame source for more info)

```
All adresses in hex.

0000-005F PCM Device (96B)

0060-00FF RAM (160B)
0100-019F Mirror of 0060-00FF

0200-022F PCM Device (48B)

0230-023F RAM (8B)

0400 Timer IRQ Trigger
0401 Timer Enable (Write Only)
0402-0405 Timer Value (4B)

0408 Bank 0 Select (Write Only)
0409 Bank 1 Select (Write Only)

040A-040F Ports R/W
0410-0415 Ports Data Direction

4000-7FFF Bank 0 (16KB)
8000-BFFF Bank 1 (16KB)
C000-FFFF First 16KB of ROM
```

## Mods idea

```
- I2C devices (screens, eeproms)
- PS2 keyboard
- SRAM
- VDP
```

## External resources

MAME Emulator:  
[src/mame/yamaha/ympsr150.cpp](https://github.com/mamedev/mame/blob/master/src/mame/yamaha/ympsr150.cpp)  
[src/devices/cpu/m6502/gew7.cpp](https://github.com/mamedev/mame/blob/master/src/devices/cpu/m6502/gew7.cpp)  
[src/devices/sound/gew7.cpp](https://github.com/mamedev/mame/blob/master/src/devices/sound/gew7.cpp)  
[src/mame/layout/pss12.lay](https://github.com/mamedev/mame/blob/master/src/mame/layout/pss12.lay)  

[PSR-150 Service Manual and Schematics](https://archive.org/details/psr-150-service-manual)

[Yamaha Chips (dtech.lv)](https://www.dtech.lv/techarticles_yamaha_chips.html)
