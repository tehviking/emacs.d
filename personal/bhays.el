(add-hook 'coffee-mode-hook
          (lambda () (local-set-key (kbd "H-r") 'coffee-compile-buffer)))

;; enable colors in compilation buffer
(require 'ansi-color)
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "<s-return>") 'maximize-frame)
(define-key projectile-mode-map [?\s-b] 'projectile-switch-to-buffer)
(define-key projectile-mode-map [?\s-g] 'projectile-ag)

(defun colorize-compilation-buffer ()
  (read-only-mode)
  (ansi-color-apply-on-region (point-min) (point-max))
  (read-only-mode))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(add-hook 'prog-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)) t)

(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))

;; smart parens configuration
(require 'smartparens-config)

;; Coffeescript tab of 2 spaces
(custom-set-variables '(coffee-tab-width 2))

(drag-stuff-global-mode)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(setq ag-highlight-search t)

;; Disable smartparens-mode when using multiple-cursors, they don't play nicely
(add-to-list 'mc/unsupported-minor-modes 'smartparens-mode)

;; Only use one buffer for dired stuff. Cause that's crazy.
(put 'dired-find-alternate-file 'disabled nil)

;; Use RVM
(require 'rvm)
(rvm-use-default)

;; YAS snippets everywhere bro.
(yas-global-mode)

;; Karma running
(defun karma-run ()
  "Run Javascript tests against current Karma Server"
  (interactive)
  (compile "karma run"))
(key-chord-define-global "kk" 'karma-run)
