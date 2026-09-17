# Plants vs Zombies Portable (PortMaster-Only Package)

This repository is intended only for **PortMaster** on Linux-based retro gaming devices and firmware (for example AmberELEC and ROCKNIX), plus related handheld distributions compatible with [PortMaster](https://portmaster.games/).

> This repository does **NOT** contain any copyrighted game assets (such as images, music, or fonts) owned by PopCap Games or Electronic Arts. Users must provide their own `main.pak` and `properties/` folder from a **legally purchased copy** of Plants vs. Zombies: GOTY Edition.

## Supported Environment

| Environment | Status | Notes |
| --- | --- | --- |
| PortMaster on Linux-based retro devices | Supported | Primary target |
| AmberELEC (with PortMaster) | Supported | Works as PortMaster package |
| ROCKNIX (with PortMaster) | Supported | Works as PortMaster package |

![](xu10.jpg)

## Repository Layout

```text
.
├── Plants vs Zombies Porable.sh
└── PvZ-Portable/
    ├── pvz_portable.aarch64
    ├── main.pak
    ├── libs.aarch64/
    ├── properties/
    ├── gptokeyb.ini
    ├── gameinfo.xml
    └── port.json
```

## Controls

Default gamepad-to-mouse mapping is in `PvZ-Portable/gptokeyb.ini`:
- `A` -> Left click
- `B` -> Right click
- D-pad / Left stick / Righ stick -> Mouse movement

You can tune pointer speed with `mouse_scale`.

## Troubleshooting

### Black screen or immediate exit
- Check `PvZ-Portable/log.txt` for loader/runtime errors.
- Verify required shared libs exist in `PvZ-Portable/libs.aarch64/`.

### Input does not work
- Verify `gptokeyb` is available in your PortMaster setup.
- Adjust bindings in `PvZ-Portable/gptokeyb.ini`.

## Legal

This repository is a portable packaging/runtime project and does not distribute proprietary Plants vs. Zombies game content. Make sure you have the legal right to use any game data you deploy with it.
