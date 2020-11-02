# xcursors

## Description

X cursor themes

## Requirements

* [xcursorgen]

## Installation

1. Clone the repository

```sh
git clone https://www.github.com/martinmake/xcursors
```

2. Install xcursors (replace `[XCURSOR]...`)

```sh
make clean
make [XCURSOR]...
make install
```

3. Change xcursor theme (replace `<XCURSOR>`)

* Edit `~/.icons/default`

```
[Icon Theme]
Name=Default
Comment=Default Cursor Theme
Inherits=<XCURSOR>
```

* Edit `${XDG_HOME_CONFIG}/gtk-3.0/settings.ini` (replace `<XCURSOR>`)

```
[Settings]
gtk-theme-name=Arc-Gruvbox
gtk-icon-theme-name=Adwaita
gtk-font-name=Sans 10
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_TEXT
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xft-rgba=rgb
gtk-cursor-theme-name=<XCURSOR>
```

[xcursorgen]: https://linux.die.net/man/1/xcursorgen
