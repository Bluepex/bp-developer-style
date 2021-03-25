#!/bin/sh
ssh root@192.168.0.102 \
        "cd /home/notebook/Projetos/utm/src; \
        tar cf - \$(git status -s | cut -c4-)" \
        | tar xvzfC - /
