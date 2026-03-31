# Clipboards:

1. Middle click clipboard (primary selection): select via mouse and paste
   via middle click in Linux/X windows.
2. System clipboard: Copy via Ctrl+C/Cmd+C and paste via Ctrl+V/Cmd+V

There are three paste buffers in vim:

1. default paste buffer used by yy and p etc.
2. * register: "*y/"*p yank/paste to/from middle-click clipboard.
3. + register: "+y/"+p yank/paste to/from system clipboard.

# Commands:

1. Normal mode yank: 
   yanking from cursor:
   y$, Y (cursor to EOL)
   y0 (cursor to SOL)
   yw (cursor to start of next word)
   yG (cursor to end of file)
   ygg (cursor to beginning of file)
   y/<text><Enter> (cursor to first occurrence of text)

  yanking objects the cursor is on:
  yy (current line),
  yiw (current word)
  yi( (everything inside current parens)
  ya( (everything inside current parens including parens)
  yi" (everything inside current quotes)
  yi{ (everything inside current braces)
  yat (everything inisde current HTML tag including tags)

  Prefixes:
  2yy yank n lines
  "*y yank to middle-click clipboard
  "+y yank to system clipboard
  "ay yank to register a

2. Normal mode paste:
   p paste a line below the cursor, non-line after cursor
   P paste a line above cursor, non-line before cursor

   Prefixes:
   0p/0P paste from last yank ignoring the deletes
   5p/5P paste five times
   "*p/"*P paste from primary clipboard
   "+p/"+P paste from system clipboard
   gp/gP leave the cursor at the end of paste
   ]p/[p match the indentation

3. Visual mode selection:
   v character-wise selection
   Shift+V line-wise selection
   Ctrl+V block-wise selection 
   gv reselects the last yank selection

4. visual mode yanking
   y yank to default register
   "*y yank to middle-click clipboard
   "+y yank to system clipboard
   "ay yank to register a

5. pasting visual mode yank in normal mode
   p - block yank is pasted column wise after the cursor
   P - block yank is pasted column wise before the cursor

   pasting in visual mode
   paste overwrites the current selection
