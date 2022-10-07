#!/bin/sh

bectl list
bectl create NOME
bectl mount NOME (copia o ponto de montagem da saída)
mount -t devfs devfs PONTO_DE_MONTAGEM/dev
mount -t nullfs /usr/src PONTO_DE_MONTAGEM/usr/src
chroot PONTO_DE_MONTAGEM
cd /usr/src
git pull
make -s -jN buildworld buildkernel
make -s -jN installkernel
etcupdate -p
make -s -jN installworld
etcupdate
yes | make delete-old delete-old-libs
pkg upgrade
umount PONTO_DE_MONTAGEM/dev
umount PONTO_DE_MONTAGEM/usr/src
bectl umount NOME
bectl activate -t NOME
shutdown -r now
Se tudo ocorrer normalmente
bectl activate NOME
