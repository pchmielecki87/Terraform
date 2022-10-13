#initial
gcloud auth list
gcloud config set project qwiklabs-gcp-00-4647af8bf6e9

#1
gcloud config set compute/region us-east1
gcloud config set compute/zone us-east1-b
gcloud compute instances create nucleus-jumphost-582 --machine-type f1-micro --zone us-east1-b

#2
gcloud container clusters create --machine-type=f1-micro gke-cluster --num-nodes 1 --image-family debian-9 
gcloud container clusters get-credentials gke-cluster 
kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:2.0
kubectl expose deployment hello-app --type=LoadBalancer --port 8080
kubectl get service

#3
cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF

gcloud compute instance-templates create web-server-template \
--metadata-from-file startup-script=startup.sh \
--network nucleus-vpc \
--machine-type g1-small \
--region us-east1

gcloud compute instance-groups managed create web-server-group \
--base-instance-name web-server \
--size 2 \
--template web-server-template \
--region us-east1 

gcloud compute firewall-rules create XXXXXXXXXXXXXXXXXX --allow tcp:80 --network nucleus-vpc

gcloud compute http-health-checks create http-basic-check

gcloud compute instance-groups managed \
set-named-ports web-server-group \
--named-ports http:80 \
--region us-east1

gcloud compute backend-services create web-server-backend --protocol HTTP --http-health-checks http-basic-check --global

gcloud compute backend-services add-backend web-server-backend \
--instance-group web-server-group \
--instance-group-region us-east1 \
--global


gcloud compute url-maps create web-server-map \
--default-service web-server-backend 
gcloud compute target-http-proxies create http-lb-proxy \
--url-map web-server-map

gcloud compute forwarding-rules create http-content-rule --global --target-http-proxy http-lb-proxy --ports 80

gcloud compute forwarding-rules list