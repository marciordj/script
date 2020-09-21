set -e

echo "***Teste de script SSH***";

echo "***SSH privado***";
chmod 600 ~/.ssh/id_rsa

echo "***SSH publico***";
chmod 644 ~/.ssh/id_rsa.pub



echo "**Fim do script***"