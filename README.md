# drfarang/homebrew-tap

Homebrew tap for [gfy](https://github.com/drfarang/gfy), a terminal UI client for gfy.com.

```sh
brew install drfarang/tap/gfy
gfy
```

This installs [Bun](https://bun.sh) as a dependency and runs the app from source;
native deps (e.g. `sharp`, OpenTUI's `libopentui.dylib`) resolve per-platform at
install time.

### Note on the install output

During `brew install` you may see:

```
Error: Failed to fix install linkage ... libopentui.dylib ... needs to be relinked
The formula built, but you may encounter issues ...
```

This is **harmless**. OpenTUI's prebuilt `libopentui.dylib` is loaded at runtime
via Bun FFI by absolute path, so Homebrew's (unrelated) attempt to rewrite its
install name is unnecessary. The install still completes (`🍺`) and `gfy` runs
normally.
