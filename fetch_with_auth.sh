#!/bin/sh

# Define o nome da pasta a ser verificada
DIR="clone"

# Captura o diretório atual de trabalho
CURRENT_DIR=`pwd`

# Verifica se o diretório atual é a pasta 'clone'
case "$CURRENT_DIR" in
 *"$DIR"*)
  echo "Já está na pasta '$DIR'."
 ;;
 *)
  # Se não estiver na pasta 'clone', cria a pasta
  mkdir -p "$DIR"
  echo "Pasta '$DIR' criada."
  # Muda para a nova pasta criada
  cd "$DIR" || exit
  echo "Entrou na pasta '$DIR'."
 ;;
esac

# Solicita ao usuário que insira o nome de usuário
echo "Enter username:"
read USER
# Solicita ao usuário que insira a senha
echo "Enter password:"
read PASS
URL="furiadetitas.net"

# Define o nome do arquivo que contém os user agents
USER_AGENTS_FILE="userAgents.txt"

# Verifica se o arquivo de user agents existe no diretório atual
if [ ! -f "$USER_AGENTS_FILE" ]; then
 echo "Arquivo $USER_AGENTS_FILE não encontrado!"
 exit 1
fi

# Conta quantos user agents estão disponíveis no arquivo
NUM_USER_AGENTS=$(wc -l < "$USER_AGENTS_FILE")

# Gera um índice aleatório para selecionar um user agent
RANDOM_INDEX=$((RANDOM % NUM_USER_AGENTS + 1))

# Extrai o user agent correspondente ao índice aleatório selecionado
SELECTED_USER_AGENT=$(sed -n "${RANDOM_INDEX}p" "$USER_AGENTS_FILE")

# Realiza a autenticação no site usando o cURL com o user agent selecionado e salva os cookies
curl -A "$SELECTED_USER_AGENT" -c cookies.txt -d "login=$USER&pass=$PASS" "https://$URL/?sign_in=1"

# Realiza novamente a autenticação no site usando o cURL com o user agent selecionado e os cookies salvos
curl -A "$SELECTED_USER_AGENT" -b cookies.txt -d "login=$USER&pass=$PASS" "https://$URL/?sign_in=1"

# Executa o comando wget para baixar o conteúdo do site, respeitando as regras de robots.txt e usando o user agent selecionado
wget -c -e robots=off -r -np --mirror --convert-links --adjust-extension --page-requisites --no-parent \
 --load-cookies cookies.txt \
  --user-agent="$SELECTED_USER_AGENT" \
   --reject "/startpage/*,/*PHPSESSID*,/*TIWARSID*" \
    --wait=5 --random-wait --limit-rate=100k --no-clobber "https://${URL}/?sign_in=1"
