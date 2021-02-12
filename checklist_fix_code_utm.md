- Se for corrigir uma função, procurar com grep -r "nome_funcao()" /etc e grep -r "nome_funcao()" /usr

- Sempre antes de mandar qualquer arquivo teste para VM, fazer um backup local do arquivo e criar um snapshot  

- Caso seja adicionado novos parametros deverá ser rastreado no /etc e /usr com grep -r e adicionar o parametro em todas as chamadas da função no utm
  - Para arquivos scp /pasta-local/arquivo-local.txt usuario@IP:/pasta-remota/arquivo-remoto.txt
  - Para Diretorios scp -r /pasta-local/ usuario@IP:/pasta-remota/
  
- Sempre que for fazer correções, fazer no repositorio e usar scp para testar no utm fisico/vm e somente depois dos testes abrir PR ou fazer commit de correção

- Antes de iniciar o processo de commit e PR realizar o teste do arquivo em maquina virtual e utm físico

- Depois que o PR for aprovado deverá apagar a branch local e a branch do seu fork
