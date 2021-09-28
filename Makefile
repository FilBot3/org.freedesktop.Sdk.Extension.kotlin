.PHONY: build flatpak clean install uninstall

build:
	flatpak-builder build-dir \
		--force-clean \
		org.freedesktop.Sdk.Extension.kotlinc.yaml
	flatpak-builder build-dir \
		--repo=repo \
		--force-clean \
		org.freedesktop.Sdk.Extension.kotlinc.yaml

flatpak:
	flatpak build-bundle \
		repo \
		org.freedesktop.Sdk.Extension.kotlinc.flatpak \
		org.freedesktop.Sdk.Extension.kotlinc

clean:
	rm -rf build-dir .flatpak-builder repo
	rm -rf *.flatpak

install:
	flatpak --user install org.freedesktop.Sdk.Extension.kotlinc.flatpak

uninstall:
	flatpak uninstall org.freedesktop.Sdk.Extension.kotlinc

run:
	flatpak run --command=/bin/bash org.freedesktop.Sdk.Extension.kotlinc
