#######################################################################################
# GIT TUTORIAL
#######################################################################################

# CLONAR REPO #
- FAZER FORK DO REPO BP
- FAZER CLONE DO FORK
- CONFIGURAR REMOTE UPSTREAM PARA O REPO DA BP com git remote add
	Para UTM
	 - git remote add upstream git@github.com:Bluepex/utm.git
	 
	Para FreeBSD-ports
	 - git remote add upstream git@github.com:Bluepex/FreeBSD-ports.git

#######################################################################################
# PARA ATUALIZAR #
- DAR UM GIT CHECKOUT PARA A BRANCH bp-RELENG_5_0_2 (Não rodar se for a primeira vez e o fork estiver desatualizado)
- RODAR UM git fetch upstream
- RODAR UM git rebase upstream/bp-RELENG_5_0_2
- RODAR UM git origin bp-RELENG_5_0_2

- Atualizado Dez/2020
- RODAR UM git fetch upstream
- RODAR git reset --hard upstream/bp-master
- RODAR git push

#######################################################################################
# SE ERRAR #
- git stash
- git branch -D nome_da_branch

########################################################################################
# PARA CRIAR BRANCH NOVA E ABRIR PR #
- DAR UM GIT CHECKOUT PARA A BRANCH bp-RELENG_5_0_2
- RODAR UM git fetch upstream
- RODAR UM git rebase upstream/bp-RELENG_5_0_2
- RODAR UM git push
- RODAR UM git checkout --no-track -b NOME_DO_BRANCH upstream/bp-RELENG_5_0_2
- MUDAR ARQUIVOS QUE VÃO ENTRAR NO PR
- RODAR UM git diff PARA CORRIGIR IDENTAÇÕES E VER ALTERAÇÕES
- RODAR UM git status
- RODAR UM git add .
- RODAR UM git commit (Mensagens em ingles, usar google tradutor) - Primeira linha descrição breve, pula uma linha descrição completa
- AO FINALIZAR DESCRIÇÃO DO COMMIT SALVAR COMMIT COM :x no vi
- RODAR um git push origin nome_da_branch_nova
- IR NO GITHUB, SELECIONAR A BRANCH bp-RELENG_5_0_2 E CLICAR PARA ABRIR PR
- NA PROXIMA TELA SELECIONAR A BRANCH bp-RELENG_5_0_2 E CRICAR EM CRIAR


############################################################################################
# PACKS #
- PARA PUXAR A BRANCH
git pull origin update_5.0.2_p2.2

############################################################################################
