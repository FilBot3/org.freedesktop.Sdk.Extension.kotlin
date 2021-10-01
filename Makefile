.PHONY: build flatpak clean install uninstall

build:
	flatpak-builder build-dir \
		--force-clean \
		org.freedesktop.Sdk.Extension.kotlin.yaml
	flatpak-builder build-dir \
		--repo=repo \
		--force-clean \
		org.freedesktop.Sdk.Extension.kotlin.yaml

flatpak:
	flatpak build-bundle \
		--runtime \
		repo \
		org.freedesktop.Sdk.Extension.kotlin.flatpak \
		org.freedesktop.Sdk.Extension.kotlin 20.08

clean:
	rm -rf build-dir .flatpak-builder repo
	rm -rf *.flatpak

test-install:
	flatpak-builder \
		--user \
		--install \
		--force-clean \
		build-dir \
		org.freedesktop.Sdk.Extension.kotlin.yaml

install:
	flatpak \
		--user \
		install \
		org.freedesktop.Sdk.Extension.kotlin.flatpak

uninstall:
	flatpak uninstall \
		--assumeyes \
		--runtime \
		--delete-data \
		org.freedesktop.Sdk.Extension.kotlin

run:
	flatpak run \
		--command=/bin/bash \
		org.freedesktop.Sdk.Extension.kotlin
