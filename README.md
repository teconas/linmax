# My Custom Linux Basics

I often work with small Linux instances, so these are my setup basics, managed
with [chezmoi](https://chezmoi.io).

## Bootstrap

Auf einer frischen Maschine (benötigt `curl` und `git`):

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <github-user>/linmax
```

Später aktualisieren:

```sh
chezmoi update
```

## Was passiert

Alles unter `home/` ist das chezmoi-Source-Verzeichnis (siehe `.chezmoiroot`),
alles im Repo-Root ist Projekt-Meta und wird nie ausgerollt.

| Was | Wo |
| --- | --- |
| Pakete installieren | `home/.chezmoidata/packages.yaml` + `home/.chezmoiscripts/` |
| Aliases & Funktionen | `~/.bashrc.d/*.sh`, eingebunden per Hook in `~/.bashrc` |
| micro-Config | `clipboard: terminal` wird in `~/.config/micro/settings.json` gesetzt |

Eigene, maschinenspezifische Ergänzungen gehören in `~/.bashrc.d/99-local.sh`.
Die Datei wird einmalig angelegt und von chezmoi danach nie wieder angefasst.

## Packages

- micro Editor (better nano)
- jq (JSON handling)
- glow (cat for md files)

Unterstützte Paketmanager: `apt-get`, `dnf`, `pacman`. Unter `apt` wird für
`glow` zusätzlich das Charm-Repo eingebunden, da das Paket in Debian/Ubuntu
stable fehlt.
