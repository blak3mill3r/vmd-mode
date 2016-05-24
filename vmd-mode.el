;;; vmd-mode.el --- Really Realtime Markdown previews for Emacs using a vmd subprocess.
;; That is, the rendered Markdown constantly stays consistent with the markdown source in the buffer.

;; Copyright (C) 2016 Blake Miller

;; Author: Blake Miller <blak3mill3r@gmail.com>
;; Version: 0.1.0
;; Keywords: markdown, preview, live, vmd
;; URL: https://github.com/blak3mill3r/vmd-mode.el

;;; Commentary:

;; Realtime Markdown previews for Emacs, updates as the contents of the buffer change

(defun vmd-mode/run-subprocess ()
  (start-process "vmd" "vmd" "./vmd-mode-preview.md"))

(defun vmd-mode/start ()
  (interactive)
  (vmd-mode/refresh)
  (vmd-mode/go)
  (run-at-time "1 sec" nil 'vmd-mode/refresh )
  (run-at-time "2 sec" nil 'vmd-mode/run-subprocess ))

(defun vmd-mode/refresh (&rest args)
  (write-region (point-min) (point-max) "vmd-mode-preview.md"))

(defun vmd-mode/go ()
  (add-hook 'after-change-functions 'vmd-mode/refresh nil t)) 

(provide 'vmd-mode)
