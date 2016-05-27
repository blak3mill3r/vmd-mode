# `vmd-mode.el`

##### Fast Github-flavored Markdown previews synchronized with changes to an emacs buffer (no need to save).

-----------

#### Dependencies

* [ Node.js ](https://nodejs.org/en/)
* [ vmd ](https://github.com/yoshuawuyts/vmd)

Clone this repo, and `(require 'vmd-mode)` or `(use-package vmd-mode)`

#### Why write a new Markdown preview package?

I wanted a better one for my own needs.

* ##### It's *fast*
> In my experience, it's no problem to have pretty gigantic Markdown files (thousands of lines) and the thing stays responsive.
> `vmd` is using node's `fsnotify` to watch that temp file, and emacs is writing
> that temp file in the buffer's `after-change-functions`. This is always going to be faster than any websocket-based
> implementation, and I find this makes editing documentation more fun, which increases the likelyhood that I will document
> things, and generally leads to Good Times.

* ##### and mimics Github's markdown rendering :suspect: :+1: :heart:
> *so far, so good...*

#### Video of the functionality

A brief video that shows what this minor mode does

https://www.youtube.com/watch?v=-mb9_501Ipo&feature=youtu.be


#### Usage

With a markdown file open in a buffer, just call `(vmd-mode)`.

> ```lisp
>                                          ;; You could also
> (global-set-key (kbd "M-m p") 'vmd-mode) ;; make a global binding for that,
> (add-hook 'markdown-mode-hook 'vmd-mode) ;; or add a hook...
> ```

Multiple Markdown buffers can be previewed simultaneously; each will have its own preview window.

#### Completion

If you use `company-mode` completion, you can configure it to complete Github's emoji mnemonics like this:

> 
> ```lisp
> (require 'cl-lib)
> (require 'company)
> 
> (defun vmd-company-backend (command &optional arg &rest ignored)
>   (interactive (list 'interactive))
> 
>   (cl-case command
>     (interactive (company-begin-backend 'company-sample-backend))
>     (prefix (and (eq major-mode 'fundamental-mode)
>                  (company-grab-symbol)))
>     (candidates
>      (cl-remove-if-not
>       (lambda (c) (string-prefix-p arg c))
>       vmd-mode/github-emojis-list))))
> 
> (add-to-list 'company-backends 'vmd-company-backend)
> ```

#### Limitations:

* The limitations of `vmd`
* It's probably terrible elisp *(please help make it better! :smile:)*.

#### License: MIT
#### Author: Blake Miller

:smile: *criticism & PRs are welcome* :smile:

