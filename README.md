# select-filter.yazi

A [Yazi](https://yazi-rs.github.io) plugin that selects files by a live filter.

It opens a smart-filter style prompt. As you type, the file list is filtered in real time. Press `Enter` to replace the current selection with the matching files and return to the full list. Press `Esc` to cancel without changing anything.

## Installation

```sh
ya pkg add blackdaemon/select-filter
```

## Usage

Add a keybinding to your `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on   = "<A-F>"
run  = "plugin select-filter"
desc = "Select files by filter"
```

Then:

1. Press the key alt+shift+f to open the **Select by filter:** prompt.
2. Type a pattern. The list is filtered live (smart case matching).
3. `Enter` clears the previous selection, selects all matches, and removes the filter.
4. `Esc` cancels and removes the filter.

## Requirements

A recent Yazi version that supports `ya.input` with `realtime`, and the `filter_do`, `escape` and `toggle_all` commands.

## License

MIT
