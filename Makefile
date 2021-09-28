.PHONY: build flatpak clean install uninstall

build:
	flatpak-builder build-dir \
		--force-clean \
		org.freedesktop.Sdk.Extension.kotlinc1-5-31.yaml

repo:
	flatpak-builder build-dir \
		--repo=repo \
		--force-clean \
		org.freedesktop.Sdk.Extension.kotlinc1-5-31.yaml

flatpak:
	flatpak build-bundle \
		repo \
		org.freedesktop.Sdk.Extension.kotlinc1-5-31.flatpak \
		org.freedesktop.Sdk.Extension.kotlinc1-5-31

clean:
	rm -rf build-dir .flatpak-builder repo
	rm -rf *.flatpak

install:
	flatpak --user install org.freedesktop.Sdk.Extension.kotlinc1-5-31.flatpak

uninstall:
	flatpak uninstall org.freedesktop.Sdk.Extension.kotlinc1-5-31

run:
	flatpak run --command=/bin/bash org.freedesktop.Sdk.Extension.kotlinc1-5-31
