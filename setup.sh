#cluster
#export MINIKUBE_HOME=~/goinfre

#minikube set
echo "Minikube start..."
minikube start --driver=virtualbox
#eval $(minikube docker-env)

echo "Minikube ip set..."
MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/metallb/metallb.yaml
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/nginx/nginx.yaml
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/wordpress/wordpress.yaml
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/phpmyadmin/phpmyadmin.yaml

echo "Minikube dashboard set..."
minikube dashboard & > /dev/null

#metallb
echo "Metallb set..."
minikube addons enable metallb > /dev/null
kubectl apply -f ./srcs/metallb/metallb.yaml > /dev/null

#nginx
cd ./srcs/nginx
echo "Nginx set..."
docker build . -t nginx > /dev/null
kubectl apply -f ./nginx.yaml > /dev/null

#phpmyadmin
cd ../phpmyadmin
echo "Phpmyadmin set..."
#docker build . -t phpmyadmin > /dev/null
kubectl apply -f ./phpmyadmin.yaml > /dev/null

#wordpress
cd ../wordpress
echo "Wordpress set..."
docker build . -t wordpress > /dev/null
kubectl apply -f ./wordpress.yaml > /dev/null
