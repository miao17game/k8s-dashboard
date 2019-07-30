dashboard-init:
	kubectl create -f dashboard-configmap.yaml
	kubectl create -f dashboard-secret.yaml
	kubectl create -f dashboard-controller.yaml
	kubectl create -f dashboard-service.yaml
	kubectl create -f dashboard-rbac.yaml

dashboard-delete:
	kubectl delete -f dashboard-configmap.yaml
	kubectl delete -f dashboard-secret.yaml
	kubectl delete -f dashboard-controller.yaml
	kubectl delete -f dashboard-service.yaml
	kubectl delete -f dashboard-rbac.yaml

admin-init:
	kubectl create -f admin-user.yaml

admin-delete:
	kubectl delete -f admin-user.yaml

init: dashboard-init admin-init

delete: dashboard-delete admin-delete

token:
	kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')