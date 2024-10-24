# Script de Autenticação e Download

Este script em shell automatiza o processo de autenticação em um site e faz o download de seu conteúdo, respeitando as regras de acesso definidas no arquivo `robots.txt`. Ele utiliza `curl` para autenticação e `wget` para baixar as páginas.

## Funcionalidades

- Verifica se a pasta `clone` existe; caso contrário, cria a pasta e muda para ela.
- Solicita ao usuário o nome de usuário e a senha.
- Lê user agents de um arquivo `userAgents.txt` e seleciona um aleatoriamente.
- Realiza a autenticação no site usando `curl`.
- Baixa o conteúdo do site usando `wget`, ignorando regras específicas do `robots.txt`.

## Pré-requisitos

Antes de executar o script, certifique-se de que você possui os seguintes programas instalados:

- `curl`
- `wget`

Além disso, você deve ter um arquivo chamado `userAgents.txt` no mesmo diretório que o script. Este arquivo deve conter uma lista de user agents, cada um em uma nova linha.

## Estrutura do Arquivo userAgents.txt

O arquivo `userAgents.txt` deve ter a seguinte estrutura:

User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15
User-Agent: ...


Adicione quantos user agents desejar.

## Como Usar

1. **Clone este repositório** ou faça o download do script.

2. **Dê permissão de execução ao script**:
   ```bash
   chmod +x fetch_with_auth.sh
   ```
3. **Execute o script:**
   ```bash
   ./fetch_with_auth.sh
   ```
4. **Insira seu nome de usuário e senha quando solicitado.**
Observações

    O script ignora URLs que começam com /startpage/, contêm PHPSESSID, ou TIWARSID.
    Certifique-se de estar em conformidade com as políticas do site em relação ao scraping e ao uso de bots.

Licença
Este projeto está licenciado sob a MIT License.

