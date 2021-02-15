#######################################################################################
# GIT TUTORIAL
#######################################################################################

# CLONAR REPO #
- SE FOR CLONAR USE git clone -o usuario_git -b bp-master url_fork_git utm
- SE JA TIVER CLONADO USE git remote rename origin usuario_git e git remote rename upstream bluepex
- FAZER FORK DO REPO BP
- FAZER CLONE DO FORK
- CONFIGURAR REMOTE UPSTREAM PARA O REPO DA BP com git remote add
	
	Para UTM
	 - git remote add bluepex git@github.com:Bluepex/utm.git
	 
	Para FreeBSD-ports
	 - git remote add bluepex git@github.com:Bluepex/FreeBSD-ports.git

#######################################################################################
# PARA ATUALIZAR #
- DAR UM GIT CHECKOUT PARA A BRANCH bp-master (Não rodar se for a primeira vez e o fork estiver desatualizado)
- RODAR UM git fetch bluepex
- RODAR UM git rebase bluepex/bp-master
- RODAR UM git push usuario_git bp-master

- Atualizado Dez/2020
- RODAR UM git fetch bluepex
- RODAR git reset --hard bluepex/bp-master
- RODAR git push

#######################################################################################
# SE ERRAR #
- git stash
- git branch -D nome_da_branch
- git stash pop

########################################################################################
# PARA CRIAR BRANCH NOVA E ABRIR PR #
- DAR UM GIT CHECKOUT PARA A BRANCH bp-master
- RODAR UM git fetch bluepex
- RODAR UM git rebase bluepex/bp-master
- RODAR UM git push
- RODAR UM git checkout --no-track -b NOME_DO_BRANCH bluepex/bp-master
- MUDAR ARQUIVOS QUE VÃO ENTRAR NO PR
- RODAR UM git diff PARA CORRIGIR IDENTAÇÕES E VER ALTERAÇÕES
- RODAR UM git status
- RODAR UM git add .
- RODAR UM git commit (Mensagens em ingles, usar google tradutor) - Primeira linha descrição breve, pula uma linha descrição completa
- AO FINALIZAR DESCRIÇÃO DO COMMIT SALVAR COMMIT COM :x no vi
- RODAR um git push usuario_git nome_branch_nova_local:nome_branch_nova_remota
- IR NO GITHUB, SELECIONAR A BRANCH bp-master E CLICAR PARA ABRIR PR
- NA PROXIMA TELA SELECIONAR A BRANCH bp-master E CRICAR EM CRIAR


############################################################################################
# PACKS #
- PARA PUXAR A BRANCH
git pull usuario_git update_5.0.2_p2.2

############################################################################################
