
# ⚙️ zanthus-update

Este repositório contém os arquivos necessários para atualização do sistema **Zanthus**.

---

## 📥 Passos para executar a atualização

Após clonar o repositório contendo os arquivos:


git clone https://github.com/CLAUDIO-FERNANDO/zanthus-update.git

cd zanthus-update


### ✅ Dê permissão de execução ao script:


chmod +x atualizar_zanthus.sh


### 🚀 Execute o script com permissões de root (caso necessário):


sudo ./atualizar_zanthus.sh




## 📌 Resumo das operações realizadas:

1️⃣ **Copiar o arquivo `ZMAN_1_X_X_752_CZ.EXL` para `/Zanthus/Zeus/pdvJava/` e extrair:**


tar -zxvf ZMAN_1_X_X_752_CZ.EXL


2️⃣ **Copiar o arquivo `moduloPHPPDV_2_14_171_149a_25058_php_5_6.zip` para `/Zanthus/Zeus/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV` e extrair:**


unzip -o moduloPHPPDV_2_14_171_149a_25058_php_5_6.zip


3️⃣ **Extrair o arquivo `so_u64.zip` e copiar seu conteúdo para `/Zanthus/Zeus/lib_u64`:**


unzip -o so_u64.zip
cp -rfv so_u64/* /Zanthus/Zeus/lib_u64
ldconfig


4️⃣ **Recomendado:** Reiniciar a máquina após a atualização:

reboot



