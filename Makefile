TAG=v1

.PHONY: build
build:
	$(call build-only,$(TAG))

.PHONY: push
push:
	$(call build-push,$(TAG))

### build image
### 1 : tag
define build-only
	@echo ">> build-only exec: "
	@echo ">> docker build -t isfk/gogb:$(strip $(1)) ."
	docker build -t isfk/gogb:$(strip $(1)) .
endef

### build and push images
### 1 : tag
define build-push
	@echo ">> build-push exec: "
	@echo ">> docker buildx build --push --platform=linux/amd64,linux/arm64 -t isfk/gogb:$(strip $(1)) ."
	docker buildx build --push --platform=linux/amd64,linux/arm64 -t isfk/gogb:$(strip $(1)) .
endef