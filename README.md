<p align="center">
  <img src="se_logo.png"/>
</p>

----

# Yocto Layer for System Electronics SoM 'Astrial' (i.MX8M Plus)

This Yocto Project / OpenEmbedded layer **meta-sysele-astrial-imx8** provides
the configuration and recipes used to build Linux images for the
**System Electronics Astrial** system on module based on the NXP i.MX8M Plus.

For an overview of the available Astrial BSP releases, documentation and
prebuilt image downloads, see the
[Astrial getting started guide](https://github.com/System-Electronics/astrial-howto).

# Branches and releases

One branch per Yocto Project release, one repository for all of them:

| Branch | Yocto Project | NXP BSP | Manifest |
|---|---|---|---|
| `kirkstone` | 4.0 | `imx-5.15.71-2.2.0` | `manifest/astrial-5.15.71.xml` |
| `scarthgap` | 5.0 | `imx-6.6.52-2.2.0` | `manifest/astrial-6.6.52.xml` |

This branch is **`scarthgap`**. Releases are git tags `vMAJOR.MINOR.PATCH`
(major 1 for kirkstone, 2 for scarthgap). The RAM variants of the module (2, 4
and 8 GB) are machines of this layer (`conf/machine/`), not separate branches.

# Dependencies

The setup is aligned with **NXP Linux BSP `imx-6.6.52-2.2.0`**.

Use the manifest of this branch and the setup instructions to select the
required repositories and revisions.

# Source trees

| Component | Source |
|---|---|
| Linux kernel | [`linux-sysele-imx`](https://github.com/System-Electronics/linux-sysele-imx), branch `lf-6.6.52-2.2.0-sysele`, a fork of NXP `linux-imx` |
| U-Boot | [`uboot-sysele-imx`](https://github.com/System-Electronics/uboot-sysele-imx), branch `lf-6.6.52-2.2.0-sysele`, a fork of NXP `uboot-imx` |
| Arm Trusted Firmware | NXP source unchanged, plus one patch of this layer (UART1, the Astrial debug serial, in the RDC permission tables) |

The recipes pin the exact revisions with `SRCREV`.

# Building

See [ASTRIAL-YOCTO-INSTALL.md](ASTRIAL-YOCTO-INSTALL.md) for environment setup,
image build instructions and board programming.

The guide covers the Astrial **2 GB, 4 GB and 8 GB RAM** configurations.

# Patches

This layer is maintained by System Electronics.

When creating a patch of the last commit, use:

```sh
git format-patch -s --subject-prefix='meta-sysele][<branch>][PATCH' -1
```

To send patches, use:

```sh
git send-email --to github@systemelectronics.com <generated-patch>
```

# License

All metadata is MIT licensed unless otherwise stated. Source code and
binaries included in the tree for individual recipes are covered by the
license stated in each recipe (`.bb` file), unless otherwise stated.
