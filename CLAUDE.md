# linmax

chezmoi-Source-Repo. Source-Verzeichnis ist `home/` (per `.chezmoiroot`), das
Repo-Root enthält nur Projekt-Meta. Neue Dotfiles gehören deshalb nach `home/`.

## Vorgaben

- **So wenig Shell-Code wie möglich.** Was chezmoi über Dateinamen-Präfixe oder
  Templating lösen kann, wird nicht als Script geschrieben.
- **Pakete nur über den Paketmanager.** Keine Binary-Downloads, kein
  `go install`. Ein zusätzliches Distro-Repo (Keyring + sources.list.d) ist ok.
- **Alpine wird bewusst nicht unterstützt** (kein bash by default).
- Vorgehen: erst kurzer Plan, nach OK die Umsetzung.

## Notizen

- `glow` fehlt in Debian/Ubuntu stable, deshalb das Charm-Repo im Installer.
  In dnf/pacman kommt es direkt aus dem Distro-Repo.
- Privat und Arbeit nutzen bewusst dasselbe Setup — kein `.chezmoi.toml.tmpl`
  mit Prompts, solange sich das nicht unterscheidet.
