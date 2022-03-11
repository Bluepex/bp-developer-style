#Gerar uma nova chave SSH

    Abra Terminal.

    Cole o texto abaixo, substituindo o endereço de e-mail pelo seu GitHub.

    $ ssh-keygen -t ed25519 -C "your_email@example.com"

    Observação: Se você estiver usando um sistema legado que não é compatível com o algoritmo Ed25519, use:

    $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

Isto cria uma nova chave SSH, usando o nome de e-mail fornecido como uma etiqueta.

> Generating public/private algorithm key pair.

    Quando aparecer a solicitação "Enter a file in which to save the key" (Insira um arquivo no qual salvar a chave), presssione Enter. O local padrão do arquivo será aceito.

    > Enter a file in which to save the key (/home/you/.ssh/algorithm): [Press enter]

    Digite uma frase secreta segura no prompt. Para obter mais informações, consulte "Trabalhar com frases secretas da chave SSH".

    > Enter passphrase (empty for no passphrase): [Type a passphrase]
    > Enter same passphrase again: [Type passphrase again]

Depois Acesse o github e inclua nova chave privada em: https://github.com/settings/keys
