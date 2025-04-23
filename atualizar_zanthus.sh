#!/bin/bash

echo "Iniciando o processo de atualização Zanthus..."

# Finalizando aplicações
echo "Encerrando aplicações existentes..."
pkill -9 pdvJava
pkill -9 pdvJava2
pkill -9 java

# Diretório temporário para o repositório
TMP_DIR="/tmp/zanthus-update"

# Remove o diretório temporário anterior, se existir
rm -rf "$TMP_DIR"

# Clona o repositório
echo "Clonando repositório do GitHub..."
git clone https://github.com/CLAUDIO-FERNANDO/zanthus-update.git "$TMP_DIR"

# Verifica se o clone foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao clonar o repositório. Verifique a conexão ou URL."
    exit 1
fi

# Caminho base do sistema Zanthus
BASE_DIR="/Zanthus/Zeus"

# 1. Copiar e extrair ZMAN
echo "Atualizando ZMAN..."
cp "$TMP_DIR/ZMAN_1_X_X_752_CZ.EXL" "$BASE_DIR/pdvJava/"
cd "$BASE_DIR/pdvJava" || exit
tar -zxvf ZMAN_1_X_X_752_CZ.EXL

# 2. Atualizar módulo PHP PDV
echo "Atualizando módulo PHP PDV..."
cp "$TMP_DIR/moduloPHPPDV_2_14_171_149a_25058_php_5_6.zip" "$BASE_DIR/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV/"
cd "$BASE_DIR/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV" || exit
unzip -o moduloPHPPDV_2_14_171_149a_25058_php_5_6.zip

# 3. Atualizar bibliotecas
echo "Atualizando bibliotecas do sistema operacional..."
cd "$TMP_DIR" || exit
unzip -o so_u64.zip
cp -rfv so_u64/* "$BASE_DIR/lib_u64/"
ldconfig

echo -e "\n✅ Atualização concluída com sucesso!"
echo "🔁 É recomendado reiniciar a máquina para aplicar todas as mudanças."
