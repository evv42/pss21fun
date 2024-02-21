#!/bin/sh
set -e
set -x
vasm6502_oldstyle -Fbin -dotdir rom.0
mv a.out rom0.bin
cat rom0.bin rom1.bin rom2.bin romfill.bin > rom256.bin
