# DICA

- Sempre abrir sessão remota para atualizar FreeBSD com tmux, pois caso trave a conexão ssh, o comando continue a rodar no servidor FreeBSD em questão

# ATENÇÃO

- _**NUNCA COMEÇAR O PROCESSO DE ATUALIZAÇÃO SEM CRIAR UM**_\*\* BE (BOOT ENVIRONMENT) DO ZFS.\*\*

# REPOSITÓRIO FREEBSD

- Repo oficial do FreeBSD - [https://cgit.freebsd.org/src/](https://cgit.freebsd.org/src/ "smartCard-inline")
- Repo espelho do FreeBSD - [https://github.com/freebsd/freebsd-src](https://github.com/freebsd/freebsd-src "smartCard-inline")

# ANTES DE ATUALIZAR

- Instalar o git
- Limpar o diretorio /usr/src com `rm -rf /usr/src/*` e um `rm -rf /usr/src/.*` caso senha colocado na instalação do freebsd para instalar o `src` .
- Rodar um git clone -b main --single-branch --depth 1 [https://git.FreeBSD.org/src.git](https://git.FreeBSD.org/src.git "‌") /usr/src

# DÚVIDAS SOBRE bectl

- [https://klarasystems.com/articles/managing-boot-environments/](https://klarasystems.com/articles/managing-boot-environments/ "smartCard-inline")
- [https://wiki.freebsd.org/BootEnvironments](https://wiki.freebsd.org/BootEnvironments "smartCard-inline")

bectl -- Utility to manage	boot environments on ZFS

Utilizar o bectl para criar um novo boot environment (Isso preserva o boot do SO, caso ocorra qualquer problema na atualização por compilação do source do SO, vc consegue dar roolback)

# DÚVIDAS SOBRE etcupdate

- [https://www.freebsd.org/cgi/man.cgi?query=etcupdate&arch=default&format=html](https://www.freebsd.org/cgi/man.cgi?query=etcupdate&arch=default&format=html "smartCard-inline")

# RESOLVENDO CONFLITOS DO etcupdate

Se ao rodar o etcupdate retornar

```
root@teste:/usr/src # etcupdate
Conflicts remain from previous update, aborting.
```

Você deve rodar um `etcupdate status` onde ele mostrará algo como:

```
root@teste:/usr/src # etcupdate status
  C /etc/master.passwd
```

Se a linha estiver com `C` significa que é o arquivo que está gerando o conflito, rode um `etcupdate resolve` aparecerá algo como:

```
root@teste:/usr/src # etcupdate resolve
Resolving conflict in '/etc/master.passwd':
Select: (p) postpone, (df) diff-full, (e) edit,
        (h) help for more options:
```

Escolha a opção `(e) edit` e abrirá algo como:

```
# $FreeBSD$
#
<<<<<<< yours
root:$6$zyzEkzHVULxzQ.CZ$xe7ck2cK8Hh6IKSBw6vKb75Os0imFndPzi./92BzrnlMl0F1ALJ9gvrS5Cb8i1J3lqySbKtxk4k6l6nXP7T26.:0:0::0:0:Charlie &:/root:/bin/csh
||||||| original
root::0:0::0:0:Charlie &:/root:/bin/csh
=======
root::0:0::0:0:Charlie &:/root:/bin/sh
> \>>>>>> new
toor:*:0:0::0:0:Bourne-again Superuser:/root:
daemon:*:1:1::0:0:Owner of many system processes:/root:/usr/sbin/nologin
operator:*:2:5::0:0:System &:/:/usr/sbin/nologin
bin:*:3:7::0:0:Binaries Commands and Source:/:/usr/sbin/nologin
tty:*:4:65533::0:0:Tty Sandbox:/:/usr/sbin/nologin
kmem:*:5:65533::0:0:KMem Sandbox:/:/usr/sbin/nologin
games:*:7:13::0:0:Games pseudo-user:/:/usr/sbin/nologin
news:*:8:8::0:0:News Subsystem:/:/usr/sbin/nologin
man:*:9:9::0:0:Mister Man Pages:/usr/share/man:/usr/sbin/nologin
sshd:*:22:22::0:0:Secure Shell Daemon:/var/empty:/usr/sbin/nologin
smmsp:*:25:25::0:0:Sendmail Submission User:/var/spool/clientmqueue:/usr/sbin/nologin
mailnull:*:26:26::0:0:Sendmail Default User:/var/spool/mqueue:/usr/sbin/nologin
bind:*:53:53::0:0:Bind Sandbox:/:/usr/sbin/nologin
unbound:*:59:59::0:0:Unbound DNS Resolver:/var/unbound:/usr/sbin/nologin
proxy:*:62:62::0:0:Packet Filter pseudo-user:/nonexistent:/usr/sbin/nologin
_pflogd:*:64:64::0:0:pflogd privsep user:/var/empty:/usr/sbin/nologin
_dhcp:*:65:65::0:0:dhcp programs:/var/empty:/usr/sbin/nologin
uucp:*:66:66::0:0:UUCP pseudo-user:/var/spool/uucppublic:/usr/local/libexec/uucp/uucico
pop:*:68:6::0:0:Post Office Owner:/nonexistent:/usr/sbin/nologin
auditdistd:*:78:77::0:0:Auditdistd unprivileged user:/var/empty:/usr/sbin/nologin
www:*:80:80::0:0:World Wide Web Owner:/nonexistent:/usr/sbin/nologin
ntpd:*:123:123::0:0:NTP Daemon:/var/db/ntp:/usr/sbin/nologin
_ypldap:*:160:160::0:0:YP LDAP unprivileged user:/var/empty:/usr/sbin/nologin
hast:*:845:845::0:0:HAST unprivileged user:/var/empty:/usr/sbin/nologin
tests:*:977:977::0:0:Unprivileged user for tests:/nonexistent:/usr/sbin/nologin
nobody:*:65534:65534::0:0:Unprivileged user:/nonexistent:/usr/sbin/nologin
teste:$6$XFS2RoOwq0HwYTHs$HAa6MjYp9LTFuSzffJDxQnorNLP7X0khr.VgiOtQR5c7ZwlI4NEelRxd0vcgyc0lgy80CxpLn8uW8cOeOUhVK0:1001:1001::0:0:teste:/home/teste:/bin/sh
git_daemon:*:964:964::0:0:git daemon:/nonexistent:/usr/sbin/nologin
~
~
/var/db/etcupdate/conflicts/etc/master.passwd: unmodified: line 1
```

Resolva o conflito apagando as linhas que você não quer e deixando as linhas que quer deixar, apague as linhas:

```
<<<<<<< yours
||||||| original
 =======
> \>>>>>> new
```

conforme a sua necessidade para a resolução do conflito do merge e salve o arquivo com `Esc :x` salvando o arquivo no `vi`.

Aparecerá essa saída no terminal:

```
/var/db/etcupdate/conflicts/etc/master.passwd: 31 lines, 2124 characters.
Select: (p) postpone, (df) diff-full, (e) edit, (r) resolved,
        (h) help for more options:
```

Escolha a opção \`(r) resolved\`.

# DÚVIDAS DE COMO RESOLVER CONFLITOS DE MERGE

- [https://www.atlassian.com/br/git/tutorials/using-branches/merge-conflicts](https://www.atlassian.com/br/git/tutorials/using-branches/merge-conflicts "smartCard-inline")

# RECEITA DO BOLO

```
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
exit
umount PONTO_DE_MONTAGEM/dev
umount PONTO_DE_MONTAGEM/usr/src
bectl umount NOME
bectl activate -t NOME
shutdown -r now
Se tudo ocorrer normalmente
bectl activate NOME
```

# DÚVIDAS:

- Seguir o tutorial [https://docs.freebsd.org/en/books/handbook/cutting-edge/#makeworld](https://docs.freebsd.org/en/books/handbook/cutting-edge/#makeworld "smartCard-inline")
