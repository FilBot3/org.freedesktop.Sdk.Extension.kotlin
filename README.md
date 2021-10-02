# org.freedesktop.Sdk.Extension.kotlin

## Overview

This Flatpak Sdk Extension is made so that will provide Kotlin Compiler to the
user. This Flatpak does not define the version of Java it runs on however. This
leaves the user open to using OpenJDK 11, 14, 17, or whatever is next.

## Requirements

* Flatpak
* Flatpak-Builder

## Building this Flatpak

To build it locally, use the following command:

```bash
flatpak-builder build-dir \
  --repo=repo \
  --force-clean \
  org.freedesktop.Sdk.Extension.kotlin.yaml
```

## Installing the Flatpak locally

To install the Flatpak locally, issue the following command:

```bash
flatpak-builder \
  --user \
  --install \
  --force-clean \
  build-dir \
  org.freedesktop.Sdk.Extension.kotlin.yaml
```

To have this succeed, you'll need to build the Flatpak first.

## To use this Flatpak

Start your Flatpak text editor, in my case, `io.neovim.nvim`

```bash
export FLATPAK_ENABLE_SDK_EXT=openjdk17,kotlin
flatpak run io.neovim.nvim
```

Depending on if the `ide-flatpak-wrapper` gets merged, Kotlin will already be
enabled. If it is not enabled, then open a terminal in Neovim.

```vimscript
:terminal bash
```

Now you can source the enable.sh file.

```bash
source /usr/lib/sdk/kotlin/enable.sh
```

if there is an error that no java is available, you'll need to source that as
well.

```bash
source /usr/lib/sdk/openjdk17/enable.sh
```

The gotchya here is that when and if you close this terminal, the PATH
modification are lost. Another option is to launch io.neovim.nvim with the
following command:

```bash
flatpak run --command=/bin/bash io.neovim.nvim
source /usr/lib/sdk/openjdk17/enable.sh
souce /usr/lib/sdk/kotlin/enable.sh
nvim file.yaml
```
