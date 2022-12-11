.PHONY: build-base
build-base:
	kustomize build base

.PHONY: deploy-staging
deploy-staging:
	kustomize build ./overlays/staging | kubectl apply -f -

.PHONY: deploy-prod
deploy-prod:
	kustomize build ./overlays/prod | kubectl apply -f -
