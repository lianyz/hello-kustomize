.PHONY: build-base
build-base:
	kustomize build base
	kustomize build overlays/staging >> staging.yaml
	kustomize build overlays/prod >> prod.yaml

.PHONY: deploy-staging
deploy-staging:
	kustomize build ./overlays/staging | kubectl apply -f -

.PHONY: deploy-prod
deploy-prod:
	kustomize build ./overlays/prod | kubectl apply -f -

.PHONY: undeploy
undeploy:
	kustomize build ./overlays/staging | kubectl delete --ignore-not-found=true -f -