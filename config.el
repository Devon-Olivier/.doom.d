;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Devon Olivier"
      user-mail-address "medevon@gmail.com"
      doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org/birthdays.org"
                         "~/org/holidays.org"
                         "~/org/primitive-tasks.org"
                         "~/org/projects.org"
                         "~/org/tickler.org"))
(after! org
  (setq org-capture-templates
        '(("i" "Inbox" entry (file "inbox.org")
           "* TODO %? /Entered on/ %U")

          ("@" "Inbox [mu4e]" entry (file "inbox.org")
           "* TODO Process \"%a\" %? /Entered on/ %U")))

  (setq org-todo-keywords `((sequence "TODO(t)" "NEXT(n)" "PROJ(p)" "STRT(s)" "WAIT(w)" "HOLD(h)" "|" "DONE(d)" "KILL(k)")
                            (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-ellipsis " ▼"))

(after! ox-latex (add-to-list 'org-latex-classes '("exam" "\\documentclass[addpoints, 12pt]{exam}"
                                  ("\\section{%s}"."\\section*{%s}"))))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-to-list 'exec-path "/archive/backup/applications/elixir-ls/")

(setq projectile-project-search-path '("/archive/backup/projects/" "/archive/backup/learning/"))
(+global-word-wrap-mode +1)
