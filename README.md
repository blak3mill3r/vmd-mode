# vmd-mode.el

### `vmd` GH-flavor'd Markdown previewer, synchronized with an emacs buffer

-------

Hack to integrate an emacs buffer with `vmd` so I can view both the rendered markdown (gh flavor'd)
and the markdown source at the same time (as I edit the buffer).

-----------

# Install

You need first to install `vmd`:

```bash
$ ? FIXME
```

This is brand new and it's not on ELPA yet. I use Cask. You're on your own until I write more here. You'll probably want to `(require 'vmd-mode)` or something...


# Usage

With a markdown file open in a buffer, just call the interactive function `vmd-mode/start`. That will start the `vmd` process and start synchronizing the buffer.

#### License

MIT

#### Author

Blake Miller

*I'm fairly clueless about emacs lisp, but wrote this package to serve a need*

*criticism & PRs are welcome*