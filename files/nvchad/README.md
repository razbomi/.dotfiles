# Neovim Keybindings Cheatsheet

Leader key: `Space`

## Vim Fundamentals

### Modes

| Key | Action |
|---|---|
| `i` | Insert mode (before cursor) |
| `a` | Insert mode (after cursor) |
| `I` | Insert at beginning of line |
| `A` | Insert at end of line |
| `o` | New line below, enter insert |
| `O` | New line above, enter insert |
| `v` | Visual mode (character) |
| `V` | Visual mode (line) |
| `C-v` | Visual block mode |
| `R` | Replace mode |
| `Esc` | Normal mode + clear highlights |
| `jj` | Exit insert mode (custom) |

### Movement

| Key | Action |
|---|---|
| `h/j/k/l` | Left / Down / Up / Right |
| `w` | Next word start |
| `W` | Next WORD start (whitespace-delimited) |
| `b` | Previous word start |
| `B` | Previous WORD start |
| `e` | Next word end |
| `E` | Next WORD end |
| `0` | Beginning of line |
| `^` | First non-blank character |
| `$` | End of line |
| `gg` | First line |
| `G` | Last line |
| `{` | Previous blank line / paragraph |
| `}` | Next blank line / paragraph |
| `%` | Matching bracket |
| `H` | Top of screen |
| `M` | Middle of screen |
| `L` | Bottom of screen |
| `C-u` | Half page up |
| `C-d` | Half page down |
| `C-f` | Full page down |
| `C-b` | Full page up |
| `C-o` | Jump back (older position) |
| `C-i` | Jump forward (newer position) |
| `zz` | Center cursor on screen |
| `zt` | Cursor to top of screen |
| `zb` | Cursor to bottom of screen |
| `f{char}` | Jump to next {char} on line |
| `F{char}` | Jump to prev {char} on line |
| `t{char}` | Jump to before next {char} on line |
| `T{char}` | Jump to after prev {char} on line |
| `;` | Repeat last f/F/t/T |
| `,` | Repeat last f/F/t/T (reverse) |
| `/{pattern}` | Search forward |
| `?{pattern}` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |

### Operators

Operators combine with motions: `{operator}{motion}` (e.g. `dw` = delete word, `ci"` = change inside quotes)

| Key | Action |
|---|---|
| `d` | Delete |
| `c` | Change (delete + insert) |
| `y` | Yank (copy) |
| `>` | Indent right |
| `<` | Indent left |
| `=` | Auto-indent |
| `gu` | Lowercase |
| `gU` | Uppercase |
| `~` | Toggle case (single char) |

### Text Objects

Used with operators: `{operator}{a/i}{object}` — `a` = around (includes delimiters), `i` = inside

| Object | Description |
|---|---|
| `w` | Word |
| `W` | WORD |
| `s` | Sentence |
| `p` | Paragraph |
| `"` `'` `` ` `` | Quotes |
| `(` `)` `b` | Parentheses |
| `[` `]` | Square brackets |
| `{` `}` `B` | Curly braces |
| `<` `>` | Angle brackets |
| `t` | HTML/XML tag |

### Editing

| Key | Action |
|---|---|
| `dd` | Delete line |
| `yy` | Yank line |
| `cc` | Change line |
| `p` | Paste after |
| `P` | Paste before |
| `x` | Delete character |
| `r{char}` | Replace character |
| `J` | Join line below |
| `u` | Undo |
| `C-r` | Redo |
| `.` | Repeat last change |
| `>>` | Indent line |
| `<<` | Dedent line |
| `==` | Auto-indent line |

### Search and Replace (in-place)

| Keys | Action |
|---|---|
| `*` then `cgn` | Change current word occurrence, type replacement |
| `.` | Repeat change on next match |
| `n` | Skip to next match without changing |

Workflow: `*` searches for word under cursor, `cgn` = **c**hange **g**o **n**ext match. Then `.` to apply same change again, `n` to skip.

### Registers

| Key | Action |
|---|---|
| `"{reg}y` | Yank into register |
| `"{reg}p` | Paste from register |
| `"+y` | Yank to system clipboard |
| `"+p` | Paste from system clipboard |
| `"0p` | Paste last yank (not delete) |
| `:reg` | View registers |

### Marks

| Key | Action |
|---|---|
| `m{a-z}` | Set local mark |
| `m{A-Z}` | Set global mark |
| `` `{mark} `` | Jump to mark (exact position) |
| `'{mark}` | Jump to mark (line) |

### Macros

| Key | Action |
|---|---|
| `q{reg}` | Start recording macro |
| `q` | Stop recording |
| `@{reg}` | Play macro |
| `@@` | Repeat last macro |

### Folds

| Key | Action |
|---|---|
| `za` | Toggle fold |
| `zo` | Open fold |
| `zc` | Close fold |
| `zR` | Open all folds |
| `zM` | Close all folds |

---

## General (Custom)

| Key | Mode | Action |
|---|---|---|
| `C-s` | n/i/v | Save and exit insert mode |
| `C-q` | n/i/v | Save all and quit |
| `C-c` | n | Copy whole file to clipboard |
| `leader /` | n | Toggle comment (line) |
| `leader /` | v | Toggle comment (selection) |
| `leader n` | n | Toggle line numbers |
| `leader rn` | n | Toggle relative numbers |
| `leader ch` | n | NvChad cheatsheet |
| `leader fm` | n/v | Format file (conform) |

---

## Navigation (Window / Pane)

Seamless nvim-tmux navigation — same keys work across nvim splits and tmux panes.

| Key | Mode | Action |
|---|---|---|
| `C-h` | n | Navigate left (nvim/tmux) |
| `C-j` | n | Navigate down (nvim/tmux) |
| `C-k` | n | Navigate up (nvim/tmux) |
| `C-l` | n | Navigate right (nvim/tmux) |
| `C-h/j/k/l` | i | Move cursor in insert mode |

---

## Buffers

| Key | Action |
|---|---|
| `Tab` | Next buffer |
| `S-Tab` | Previous buffer |
| `leader bd` | Delete buffer |
| `leader bo` | Delete all other buffers |
| `leader b` | New buffer |

---

## File Explorer (NvimTree)

| Key | Action |
|---|---|
| `C-n` | Toggle NvimTree |
| `leader e` | Focus NvimTree |

Inside NvimTree:
| Key | Action |
|---|---|
| `a` | Create file/directory |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `Enter` | Open |
| `o` | Open |
| `v` | Open in vertical split |
| `s` | Open in horizontal split |
| `R` | Refresh |
| `H` | Toggle hidden files |
| `I` | Toggle gitignored files |

---

## Telescope (Fuzzy Finder)

| Key | Action |
|---|---|
| `leader ff` | Find files |
| `leader fa` | Find all files (hidden + ignored) |
| `leader fw` | Live grep (search in files) |
| `leader fb` | Find buffers |
| `leader fh` | Help tags |
| `leader fo` | Old (recent) files |
| `leader fz` | Fuzzy find in current buffer |
| `leader ma` | Find marks |
| `leader cm` | Git commits |
| `leader gt` | Git status |
| `leader pt` | Pick hidden terminal |
| `leader th` | NvChad theme picker |

Inside Telescope:
| Key | Action |
|---|---|
| `C-n / C-p` | Next / previous result |
| `C-j / C-k` | Next / previous result (alt) |
| `Enter` | Open selection |
| `C-x` | Open in horizontal split |
| `C-v` | Open in vertical split |
| `C-t` | Open in new tab |
| `C-u / C-d` | Scroll preview up / down |
| `Esc` | Close (in normal mode) |

---

## LSP

| Key | Action |
|---|---|
| `gd` | Go to definition (Trouble) |
| `gD` | Go to declaration |
| `grr` | References (Trouble) |
| `gra` | Code action (nvim 0.11 built-in) |
| `grn` | Rename (nvim 0.11 built-in) |
| `K` | Hover documentation |
| `leader D` | Go to type definition |
| `leader ra` | NvChad renamer |
| `leader ds` | Diagnostic loclist |
| `leader wa` | Add workspace folder |
| `leader wr` | Remove workspace folder |
| `leader wl` | List workspace folders |

---

## Trouble (Diagnostics / Lists)

| Key | Action |
|---|---|
| `leader xx` | Toggle project diagnostics |
| `leader xX` | Toggle current buffer diagnostics |
| `leader xl` | Toggle LSP references (unfocused) |
| `leader xt` | Toggle todos |
| `leader xq` | Toggle quickfix list |
| `leader xL` | Toggle location list |
| `leader cs` | Toggle symbols outline |
| `[q` | Previous trouble/quickfix item |
| `]q` | Next trouble/quickfix item |

Inside Trouble window:
| Key | Action |
|---|---|
| `Enter` | Jump to item |
| `o` | Jump to item |
| `q` | Close trouble |
| `r` | Refresh |
| `j/k` | Navigate items |
| `C-x` | Open in horizontal split |
| `C-v` | Open in vertical split |

---

## Git

### Gitsigns

| Key | Action |
|---|---|
| `leader gp` | Preview hunk |
| `leader gb` | Full blame |
| `]c` | Next hunk (or diff change in diff mode) |
| `[c` | Previous hunk (or diff change in diff mode) |

Inline blame is always visible (current_line_blame = true).

### Diffview

| Key | Action |
|---|---|
| `leader gd` | Open diff view (working tree vs index) |
| `leader gh` | File history (current file) |
| `leader gq` | Close diff view |

### Telescope Git

| Key | Action |
|---|---|
| `leader cm` | Browse git commits |
| `leader gt` | Browse git status |

---

## Flash (Jump / Search)

Flash adds jump labels to search results and motions.

| Key | Mode | Action |
|---|---|---|
| `s` | n/x/o | Flash jump — type chars, pick label |
| `S` | n/x/o | Flash treesitter — select treesitter node |
| `C-s` | c (cmdline) | Toggle flash in search mode |
| `f/F/t/T` | n | Enhanced with jump labels |

Flash is integrated into `/` search — matches get labels you can press to jump directly.

---

## mini.surround

Surround text with brackets, quotes, tags, etc.

| Key | Action | Example |
|---|---|---|
| `sa{motion}{char}` | Add surrounding | `saiw"` wraps word in `"` |
| `sd{char}` | Delete surrounding | `sd"` removes surrounding `"` |
| `sr{old}{new}` | Replace surrounding | `sr"'` changes `"` to `'` |
| `sf` | Find surrounding (next) | |
| `sF` | Find surrounding (prev) | |
| `sh` | Highlight surrounding | |
| `sn` | Update `n_lines` for search | |

Common patterns:
- `saiw)` — wrap word in parens: `word` -> `(word)`
- `saiw}` — wrap word in braces: `word` -> `{word}`
- `sa2aw"` — wrap 2 words in quotes
- `sd'` — delete surrounding single quotes
- `sr([` — change `(...)` to `[...]`
- Works in visual mode too: select text, then `sa"` to wrap

Note: `sa` uses closing bracket `)/]/}` for no-space, opening `(/[/{` for with-space.

---

## mini.ai (Enhanced Text Objects)

Extended text objects for `a` (around) and `i` (inside). Use with any operator (`d`, `c`, `y`, `v`, etc).

| Object | Description | Example |
|---|---|---|
| `f` | Function | `vaf` select whole function, `cif` change body |
| `a` | Argument | `cia` change argument, `daa` delete with comma |
| `o` | Block/scope | `vio` select inside if/for/while |
| `t` | Tag | `cit` change inside HTML tag |
| `q` | Quote (any) | `diq` delete inside any quote type |
| `b` | Bracket (any) | `dab` delete around any bracket type |
| `(` `)` `[` `]` `{` `}` `<` `>` | Specific brackets | Standard vim, enhanced multi-line |
| `"` `'` `` ` `` | Specific quotes | Standard vim, enhanced multi-line |

The argument text object (`a`) is the standout feature — handles comma-separated items in function calls, arrays, etc.

Supports `n` (next) and `l` (last) prefix:
- `cin)` — change inside next parentheses
- `cil)` — change inside last (previous) parentheses

---

## Todo Comments

Highlights and indexes TODO/FIXME/HACK/NOTE/WARN/PERF in comments.

| Key | Action |
|---|---|
| `leader xt` | Browse all todos (Trouble) |

Supported keywords in comments: `TODO:`, `FIXME:`, `HACK:`, `NOTE:`, `WARN:`, `PERF:`

---

## Terminal

| Key | Mode | Action |
|---|---|---|
| `leader h` | n | New horizontal terminal |
| `leader v` | n | New vertical terminal |
| `A-i` | n/t | Toggle floating terminal |
| `A-h` | n/t | Toggle horizontal terminal |
| `A-v` | n/t | Toggle vertical terminal |
| `C-x` | t | Exit terminal mode |

---

## WhichKey

| Key | Action |
|---|---|
| `leader wK` | Show all keymaps |
| `leader wk` | Query a specific keymap prefix |

Press `leader` and wait to see available continuations.
