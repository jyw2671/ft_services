#cluster
#export MINIKUBE_HOME=~/goinfre

#minikube setting
echo "Minikube start..."
minikube start --driver=virtualbox
#eval $(minikube docker-env)

minikube dashboard & > /dev/null

#nginx
cd ./srcs/nginx
echo "Nginx set..."
docker build . -t nginx > /dev/null
#kubectl apply -f ./nginx.yaml > /dev/null

#wordpress
cd ../wordpress
echo "Wordpress set..."
docker build . -t wordpress > /dev/null
#kubectl apply -f wordpress.yaml > /dev/null
