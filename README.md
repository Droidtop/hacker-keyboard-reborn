# Hacker Keyboard Reborn

A rebirth of [Hacker's Keyboard](https://github.com/klausw/hackerskeyboard): the full PC keyboard on Android
(Ctrl, Alt, Esc, Tab, arrows and function keys, long-press symbols, dead keys), kept as flexible as it always was,
with modern additions on top (clipboard history, emoji with search, inline autofill, one-handed and split layouts,
a pad to type with, a theme that follows light or dark).

## Where it comes from

This is the keyboard [droidtop](https://github.com/Droidtop/droidtop) embeds. The owner, 2026-10-14
(Droidtop/tracker#344): "It's embedded, but some people will want to just use a rebirth of HK". So there is one
keyboard and two ways to get it:

- **droidtop** builds it into its own app, as its `input-keyboard` module.
- **This repository** is the standalone app: `app/` (its name, icon and launcher entry) around `keyboard/`, a copy
  of droidtop's module at the droidtop commit named in `keyboard/UPSTREAM`.

`keyboard/` is never edited here. A change to the keyboard goes to droidtop first, then
`scripts/sync-keyboard.sh /path/to/droidtop` brings it here (by default from droidtop's `origin/main`).

## Build

JDK 17 or later, the Android SDK with platform 36, build-tools 36.0.0, NDK 27.0.12077973 and CMake 3.22.1:

    ./gradlew :app:assembleDebug

The app's id is `dev.droidtop.hackerkeyboard`, so it installs beside the original Hacker's Keyboard
(`org.pocketworkstation.pckeyboard`) rather than over it. 64-bit only: arm64-v8a and x86_64.

## Licence

GPL-3.0 (`LICENSE`). The keyboard is a fork of Hacker's Keyboard, which is Apache-2.0 and itself derives from the
Android Open Source Project's LatinIME; their notices are kept in `keyboard/LICENSE` and in the source files.
