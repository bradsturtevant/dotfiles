(server-start)

(setq tramp-default-method "ssh")
(setenv "ESHELL" "bash")
(setq explicit-shell-file-name "/usr/bin/bash")

;; Disable loading of “default.el” at startup
;(setq inhibit-default-init t)

;; Enter the debugger each time an error is found
(setq debug-on-error t)

;; Setup Melpa
(require 'package)
(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(package-initialize)

(require 'better-defaults)

;; Set color theme
(load-theme 'material t)
;; Set frame size
(setq default-frame-alist
      '((top . 50) (left . 250)
        (width . 140) (height . 45)))

;; Python IDE
(require 'elpy)
(elpy-enable)

;; Uniquify package adds to buffer names with unique bit of path
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;; cut frame size
;; cut font customize

;; Use C-z for undo (as is the standard in many non-Emacs environments)
;; This overrides the default of C-z triggering suspend-frame, which is 
;; not a great loss for most people.
(global-set-key (kbd "\C-z") 'undo)

;; Increase undo-limit
(setq undo-limit 3600)

;; Create undo-all command 
(defun undo-all ()
  "Undo all edits."
  (interactive)
  (when (listp pending-undo-list)
    (undo))
  (while (listp pending-undo-list)
    (undo-more 1))
  (message "Buffer was completely undone"))
;; undo-all keyboard binding
(global-set-key "\C-x\C-z" 'undo-all)

;; Select All keyboard binding
(global-set-key "\C-x\C-a" 'mark-whole-buffer)

;; Simplify the goto line key bindings
(global-set-key "\M-g" 'goto-line)

;; Correct the way emacs clutters up directories with backup files 
;; (filenames ending in ~) and autosave files (filenames starting with #)
;; by storing these temp files in a system wide auto-saves directory.
;; Should make the directory by hand with root, wheel, Admin privileges.
;; On Linux maybe /home/auto-saves on Windows ~/.emacs.d/auto-saves
(defvar temporary-file-directory "~/.emacs.d/auto-saves")
(make-directory temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist `(("." . ,temporary-file-directory)))
(setq auto-save-list-file-prefix (concat temporary-file-directory "auto-"))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Turn on paren matching
(show-paren-mode t)

;; Highlight the region between the point and the mark
(transient-mark-mode t)

;; Default to unified diffs
(setq diff-switches "-u")

;; See http://en.wikipedia.org/wiki/Indent_style
(setq c-default-style "k&r")

;; Convert tabs to spaces
(setq-default indent-tabs-mode nil)

;; Set default tab to 4 for most modes
(setq-default tab-width 4)

;; Set default tab to 4 for C based modes (like PHP)
(setq c-basic-offset 4)

;; Set default tab to 2 for Javascript
(setq js-indent-level 2)

;; Set default tab to 2 for HTML
(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 2)
            (setq indent-tabs-mode nil)))

;; Set default width of fill mode for M-q auto adjustments
(setq-default fill-column 80)

;; Show column number at bottom of screen
(column-number-mode t)

;; Will make the last line end in a carriage return.
(setq require-final-newline t) 

;; Allow editing of zip, gzip, etc. files
(auto-compression-mode t)

;; Puts the file name and computer title on the top of the screen.
;; make file name and computer title
(set-default 'frame-title-format 
			 (list "" (getenv "USER") "@" (getenv "HOSTNAME") " : %f" ))

;; I'm too lazy to hit y-e-s-RET, I prefer just y or n.
;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; This gets rid of the horribly annoying "bell" 
;; and instead flashes the screen.
;; turn on visual bell
(setq visible-bell t) 

;; I hate the tool bar at the top of the screen, so get rid of it.
;; get rid of the toolbar on top of the window
(tool-bar-mode 0)

;; I've always hated that start screen
;; Dont show the GNU splash screen
(setq inhibit-startup-message t)

;; Display the time in the mode line
(display-time)

;; Usage: emacs -diff file1 file2
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
		(file2 (pop command-line-args-left)))
	(ediff file1 file2)))
(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

;; This just adds the date into the code when you type "alt-x insert-date". 
;; It looks like this Sun 2005-08-14 - 8:18 PM.
;; insert date into buffer at point
;; optained from http://www.chrislott.org/geek/emacs/dotemacs.html
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %Y-%m-%d - %l:%M %p")))
