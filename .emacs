(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (deeper-blue)))
; '(default-frame-alist (quote ((fullscreen . maximized)))) ; Maximize window.
 '(electric-indent-mode nil)
 '(f90-continuation-indent 7)
 '(f90-do-indent 4)
 '(f90-if-indent 4)
 '(f90-program-indent 4)
 '(f90-type-indent 4)
 '(fortran-line-number-indent 1)
 '(global-linum-mode t)
 '(ido-enable-flex-matching nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(require (quote auto-complete))
 '(send-mail-function (quote mailclient-send-it))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(TeX-electric-sub-and-superscript 1) ; In AUCTeX, insert braces after typing ^ or _ in math mode.
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(setq-default indent-tabs-mode nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#181a26" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo")))))
;; start auto-complete section:
;;(add-to-list 'load-path "~/.emacs.d/ac/")
(package-initialize) ;; instead of adding load path (see previous line)
(require 'ac-math) ;; this package has to be installed beforehand
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac//ac-dict")
(ac-config-default)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`
(defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
(setq ac-math-unicode-in-math-p t)
;; end auto-complete section.
;; add path to the gfortran compiler to run from emacs' shell:
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))
;; allow dired to be able to delete or copy a whole dir.
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes 'always)
(require 'auto-complete-auctex) ; Package has to be installed.
;; auctex recommended preferences (auctex package has to be already installed):
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
; Automatically insert ‘$...$’ in plain TeX files, and ‘\(...\)’ in LaTeX files by pressing $ (AUCTeX is needed):
(add-hook 'plain-TeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "\\(" "\\)"))))
; In AUCTeX, get a full featured 'LaTeX-section' command:
(setq LaTeX-section-hook
      '(LaTeX-section-heading
	LaTeX-section-title
	LaTeX-section-toc
	LaTeX-section-section
	LaTeX-section-label))
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin/")) ;; add path, so Emacs can find 'latex' and 'pdflatex'.
(setq preview-gs-command "/usr/local/bin/gs") ; populate variable to enable preview of pdftex within Emacs.
; Activate RefTeX and make it interact with AUCTeX:
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'column-enforce-mode 1) ; Enable 80 character check for LaTeX.
;Open .py and .pyw in python-mode
(setq auto-mode-alist
      (cons '("\\.\\(py\\|pyw\\)$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))
;; Open *.m files with Matlab mode (matlab-mode package has to be already installed):
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
 (add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
 (setq matlab-indent-function t)
 (setq matlab-shell-command "matlab")
(add-hook 'matlab-mode-hook 'auto-complete-mode) ; Toggle auto-complete mode when entering matlab mode.
(add-hook 'matlab-mode-hook 'column-enforce-mode 1) ; Enable 80 column rule in Matlab.
; Enable 'column-enforce-mode' globally ('column-enforce-mode' has to be already installed):
(add-to-list 'load-path "~/.emacs.d/elpa/column-enforce-mode-20140902.949/")
(require 'column-enforce-mode)
(global-column-enforce-mode 1) ; Enable globally. By default enforces 80 column rule.
; (setq column-enforce-comments nil) ; Allow long comments.
(setq column-number-mode t) ; Enable column number mode.
<<<<<<< HEAD
(setq ispell-program-name "/usr/local/bin/ispell") ; Give path to Ispell (it has to be already installed).
(add-hook 'LaTeX-mode-hook 'flyspell-mode) ; Enable flyspell-mode for LaTeX files.
=======
(add-to-list 'load-path "~/.emacs.d/my_lisp/") ; Add a directory to Emacs load
; path. Put *.el downloaded from the web there.
; Declare flyspell-mode function as auto-load:
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t) (autoload 'tex-mode-flyspell-verify "flyspell" "" t)
(add-hook 'LaTeX-mode-hook 'flyspell-mode) ; Start flyspell when editing LaTeX files.
(setq ispell-program-name "aspell")
>>>>>>> 6eb8b723f514a52b7af8184d620e4f1975a32c03
(toggle-frame-fullscreen) ; Start fullscreen mode.
