#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCOIN3D=${BITCOIN3D:-$BINDIR/bitcoin3d}
BITCOIN3CLI=${BITCOIN3CLI:-$BINDIR/bitcoin3-cli}
BITCOIN3TX=${BITCOIN3TX:-$BINDIR/bitcoin3-tx}
BITCOIN3QT=${BITCOIN3QT:-$BINDIR/qt/bitcoin3-qt}

[ ! -x $BITCOIN3D ] && echo "$BITCOIN3D not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTC3VER=($($BITCOIN3CLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoin3d if --version-string is not set,
# but has different outcomes for bitcoin3-qt and bitcoin3-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCOIN3D --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCOIN3D $BITCOIN3CLI $BITCOIN3TX $BITCOIN3QT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTC3VER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTC3VER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
