echo "Criando Imagens...."

docker build -t gusskotty/projeto-backweb:1.0 backend/.
docker build -t gusskotty/projeto-database:1.0 database/.

echo "Efetuando push das imagens..."

docker push gusskotty/projeto-backweb:1.0
docker push gusskotty/projeto-database:1.0

echo "Criando Serviços Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando Deployments...."

kubectl apply -f ./deployment.yml