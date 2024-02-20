#!/bin/sh
set -e
set -x
vasm6502_oldstyle -Fbin -dotdir rom.0
mv a.out rom
