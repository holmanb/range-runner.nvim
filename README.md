Range Runner
============

run a highlighted text in an interpreter


### Examples

Run highlighted text as javascript:
```
:'<,'>Node
```

Send text to a pastebin service:
```
:'<,'>Wgetpaste
```

### Install

```
Plug 'holmanb/range-runner.nvim'
```

### How To Select A Range of Text

Highlight the text in Visual mode, then type colon followed by the runner
name. The runner prints the output and exit code.

### FAQ

Q: Can this be used for anything else?

A: The wrapper functions make it easier to "do something" with a highlighted
   chunk of text.

   This can be extended to:

- format embedded json
- validate a yaml config with jsonschema
- lint a subset of a file (embedded code)
- render a subset of markdown locally (using a tool like [grip](https://github.com/joeyespo/grip))


Q: What does this offer over `:'<,'>w !command`?

A: Not much:

 - easier to remember
 - tab completion
 - a few less characters typed
 - you won't accidentally replace file with command output by miss-typing the 'w'


Q: What languages are supported?

A: Node.js, python, bash, posix shell, perl, lua, php. Open a bug or PR if you want something more.
