(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(setenv "EDITOR" "emacsclient -c")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(global-set-key (kbd "C-M-t") 'dumb-jump-back)
(global-set-key (kbd "C-M-p") 'backward-list)
(global-set-key (kbd "C-M-u") '(lambda () (interactive) (progn (push-mark nil t) (backward-up-list))))
(add-to-list 'load-path "~/.emacs.d/plugins")
(put 'narrow-to-region 'disabled nil)
;;(load-file "~/.emacs.d/rtags/src/rtags.el")
;;(set-variable 'rtags-path "~/.emacs.d/rtags/bin")
;; (require 'no-easy-keys)
;; (no-easy-keys 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term ((t (:background "#300A24" :foreground "white")))))

package-archives

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("018048f5167697931c1633ecc93ed9050f5e65b3f3383fd65c698d02f0520460" default))
 '(package-selected-packages
   '(csv-mode rc-mode popup-complete auto-complete-clang ## magit dumb-jump multiple-cursors load-theme-buffer-local)))

;(require 'rtags)
;(cmake-ide-setup)


(require 'multiple-cursors)
(require 'load-theme-buffer-local)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(defun my/magit-diff-visit-file-other-window ()
  "Visit the file at point in another window."
  (interactive)
  (magit-diff-visit-file-other-window)
  (other-window 1))

;;(define-key magit-mode-map (kbd "RET") 'my/magit-diff-visit-file-other-window)

(setq mu4e-maildir (expand-file-name "~/dimail"))

(setq browse-url-browser-function 'w3m-browse-url)

(defun update-local-theme ()
  (interactive)
  (cond
   ((eq major-mode 'term-mode)
    (load-theme-buffer-local 'purple-terminal (current-buffer)))
    (t (ignore-errors (disable-theme 'purple-terminal)))
    )
)

(update-local-theme)

(add-hook 'post-command-hook 'update-local-theme)

(add-hook 'change-major-mode-hook 'update-local-theme)

(add-hook 'window-configuration-change-hook 'update-local-theme)


(defun www ()
  (interactive)
  (message "Use *w3m* to access the web")
  )
