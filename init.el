;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/') dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     windows-scripts
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     ;; (git :variables
     ;;      git-gutter-use-fringe t)
     ;; markdown
     ;; org
     ;; syntax-checking
     org
     markdown
     javascript
     syntax-checking
     ;; perspectives
     ;; (colors :variables
     ;;         colors-enable-nyan-cat-progress-bar t)
     semantic
     (c-c++ :variables c-c++-default-mode-for-headers'c++-mode
            :variables c-c++-enable-clang-support
            t)
     scheme
     emacs-lisp
     common-lisp
     html
     deft
     gtags
     elfeed
     ycmd
     yaml
     osx
     ranger
     xkcd
     react
     fasd
     finance
     shell-scripts
     (spell-checking :variables
                     ispell-program-name "aspell"
                     ispell-dictionary "american"
                     spell-checking-enable-by-default nil)
     search-engine
     chenxuesong
     (mu4e :variables
           mu4e-installation-path "/usr/local/Cellar/mu/mu4e"
           mu4e-enable-mode-line t
           mu4e-enable-notifications t
           mu4e-mu-binary (executable-find "/usr/local/bin/mu"))
     ;; (ipython-notebook :variables
     ;;                   ein:jupyter-default-server-command "/usr/local/bin/jupyter"
     ;;                   ein:jupyter-server-args (list "--no-browser"))
     (auto-completion :variables auto-completion-enable-snippets-in-popup
                      t)
     (python :variables python-enable-yapf-format-on-save
             t python-test-runner 'pytest)
     (git :variables git-magit-status-fullscreen
          t)
     (shell :variables shell-default-shell'ansi-term
            shell-default-term-shell "/bin/zsh")
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-additional-packages
   ;; '(osx-dictionary chinese-fonts-setup vue-mode lsp-mode lsp-vue company-lsp company-quick-help)
   '(osx-dictionary chinese-fonts-setup vue-mode)
   dotspacemacs-excluded-packages
   '(evil-unimpaired)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages
   t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup. dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-elpa-https nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner
   'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog
   t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists
   '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes
   '(spacemacs-dark solarized-light solarized-dark
                    leuven monokai zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state
   t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; "Noto Sans Mono CJK SC"
   ;; "DejaVu Sans Mono-12"
   dotspacemacs-default-font
   '("Noto Sans Mono CJK SC" :size 12
     :weight normal
     :width normal
     :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key
   "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key
   "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key
   ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key
   "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key
   ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state
   t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay
   0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar
   t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup
   nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native
   nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup
   nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency
   90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency
   90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols
   t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling
   t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode
   nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server
   nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools
   '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository
   nil
   )
  ;; User initialization goes here
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "http://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))
  (set-variable 'ycmd-server-command '("python" "/Users/chenxuesong/emacs/ycmd/ycmd/" "--options_file=config.json"))
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq warning-minimum-level :emergency)
  (set-default-coding-systems 'utf-8)
  (setq paradox-github-token "6058a83cdf6dd9ee0db5ba4a16c6cd1201048bd7")
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (global-company-mode)
  (global-linum-mode)
  ;;(global-flycheck-mode)
  (setq exec-path-from-shell-arguments '("-l"))
  ;; Emacs Web Wowser
  (evil-leader/set-key-for-mode 'eww-mode "oq"
    'eww-quit "og" 'eww-reload "ow" 'eww-copy-page-url
    "od" 'eww-download "ol" 'eww-back-url "or"
    'eww-forward-url "oH" 'eww-list-histories
    "ob" 'eww-add-bookmark "oB" 'eww-list-bookmarks)

  (setq ledger-post-amount-alignment-column 68)

  (spacemacs|define-custom-layout "dockerbuild"
    :binding "d"
    :body (message "open dockerbuild dir.")(dired "/Users/chenxuesong/Work/project/dockerbuild/"))
  (spacemacs|define-custom-layout "agenda"
    :binding "a"
    :body (find-file "~/org/work.org"))
  (spacemacs|define-custom-layout "ewwxahlee"
    :binding "x"
    :body (eww-open-file "~/Work/Emacs/Document/xahemacs20150606/xah_emacs_tutorial/index.html"))
  (setq dotspacemacs-line-numbers t)
  (with-eval-after-load 'web-mode
    ;;(setq-default
    ;; js2-mode js2-basic-offset 2
    ;; web-mode css-indent-offset 2 web-mode-markup-indent-offset
    ;;2 web-mode-css-indent-offset 2 web-mode-code-indent-offset
    ;;2 web-mode-attr-indent-offset 2)

    (add-to-list 'web-mode-indentation-params
                 '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params
                 '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params
                 '("lineup-calls" . nil)))

  (setq browse-url-browser-function 'browse-url-default-macosx-browser)
  (push '(baidu :name "Baidu"
                :url "https://www.baidu.com/s?wd=%s")
        search-engine-alist)

  (setq ranger-parent-depth 2)
  ;; set osx dictionary key binding
  (global-set-key (kbd "C-c d")
                  'osx-dictionary-search-pointer)
  (global-set-key (kbd "C-c i")
                  'osx-dictionary-search-input)
  (evil-leader/set-key "dd" 'osx-dictionary-search-pointer)
  (evil-leader/set-key "di" 'osx-dictionary-search-pointer)
  (setq powerline-default-separator 'arrow)
  ;; add ledger babel
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((ledger . t)))
  ;; activite ditta
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((ditaa . t)))
  ;; disable truncate lines off
  (add-hook 'org-mode-hook 'spacemacs/toggle-truncate-lines-off)
  ;; active Org-babel languages
  (org-babel-do-load-languages 'org-babel-load-languages
                               '( ;; other Babel languages
                                 (plantuml . t)
                                 (emacs-lisp . t)
                                 (shell . t)
                                 ))
  (setq org-plantuml-jar-path (expand-file-name "~/org/contrib/scripts/plantuml.jar"))
  (setq org-ditaa-jar-path (expand-file-name "~/org/contrib/scripts/ditaa.jar"))
  (setq org-agenda-files (list "~/org" "~/Work/360/AppProject"))
  (setq org-agenda-text-search-extra-files (append
                                            (directory-files (expand-file-name "~/org/archive/") "full-name" "\\.org_archive$")
                                            (directory-files (expand-file-name "~/Work/360/AppProject/archive/") "full-name" "\\.org_archive$")
                                            ))

  (setq org-archive-location (concat "archive/archive-"
                                     (format-time-string "%Y%m" (current-time))
                                     ".org_archive::"))
  (setq org-agenda-archives-mode t)
  ;; 折叠时不再显示「...」
  ;; (setq org-ellipsis "▼")
  (setq org-tags-match-list-sublevels nil)
  ;; (setq org-agenda-files (list "~/org/work.org" "~/org/study.org" "~/org/home.org" "~/org/notes.org"))
  ;;open agenda in current window
  (setq org-agenda-window-setup (quote current-window))
  ;;warn me of any deadlines in next 7 days
  (setq org-deadline-warning-days 7)
  ;;show me tasks scheduled or due in next fortnight
  (setq org-agenda-span (quote fortnight))
  ;;don't show tasks as scheduled if they are already shown as a deadline
  (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  (setq org-agenda-skip-deadline-if-done t)
  ;;don't give awarning colour to tasks with impending deadlines
  ;;if they are scheduled to be done
  (setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
  ;;don't show tasks that are scheduled or have deadlines in the
  ;;normal todo list
  (setq org-agenda-todo-ignore-deadlines (quote all))
  (setq org-agenda-todo-ignore-scheduled (quote all))
  ;;sort tasks in order of when they are due and then by priority
  ;; (setq org-agenda-sorting-strategy
  ;;       (quote
  ;;        ((agenda deadline-up priority-down)
  ;;         (todo priority-down category-keep)
  ;;         (tags priority-down category-keep)
  ;;         (search category-keep))))
  ;; (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  (setq org-bullets-bullet-list '("☰" "☷" "☯" "✦" "☭" "✤" "➢" "✏"))
  (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f"))
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "g" 'org-mac-grab-link)
  ;; org clock in mode-line
  (setq spaceline-org-clock-p t)
  ;; (require 'chinese-fonts-setup)
  ;; (setq cfs-profiles
  ;;       '("program" "org-mode" "read-book"))
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Noto Sans Mono CJK SC"
                                 :size 12)))
  (add-hook 'org-capture-after-finalize-hook
            (lambda ()
              (org-align-all-tags)))

  (setq org-agenda-custom-commands
        '(
          ("C" "Clock View" agenda ""
           ((org-columns-default-format "%SCHEDULED %8EFFORT %8CLOCKSUM_T %PRIORITY %50ITEM")
            (org-agenda-view-columns-initially t)))
          ("W" "Weekly Review"
           ((agenda "" ((org-agenda-ndays 7)))
            )) ;; review waiting items
          ))

  (setq org-refile-targets (quote ((nil :maxlevel . 2)
                                   (org-agenda-files :maxlevel . 2))))
  (setq org-tag-alist (quote ((:startgroup)
                              ("@errand" . ?E)
                              ("@office" . ?O)
                              ("@home" . ?H)
                              ("@farm" . ?F)
                              (:endgroup)
                              ("PERSONAL" . ?p)
                              ("ORG" . ?o)
                              ("ANALYSIS" . ?A)
                              ("ANDROID" . ?a)
                              ("TRACKING" . ?t)
                              ("NINJA" . ?n)
                              ("EMACS". ?e)
                              ("GEEK" .?g)
                              ("DEVOPS" . ?d)
                              ("REACT" . ?r)
                              ("FINCHOS" .?f)
                              ("ALGORITHM" .?s)
                              ("SECURITY" .?S)
                              ("360" .?q)
                              )))

  (setq company-idle-delay 0.4)
  (let ((map company-active-map))
    (define-key map (kbd "C-/") 'company-search-candidates)
    (define-key map (kbd "C-M-/") 'company-filter-candidates)
    (define-key map (kbd "C-d") 'company-show-doc-buffer)
    (define-key map (kbd "C-n") 'company-select-next)
    (define-key map (kbd "C-p") 'company-select-previous)
    (define-key map (kbd "C-l") 'company-complete-selection))
  ;; (require 'magit)
  ;; (magit-define-popup-action 'magit-log-popup
  ;; ?e "Edit options" 'magit-log-refresh-popup)
  (define-key evil-normal-state-map "\C-y" 'yank)
  (define-key evil-insert-state-map "\C-y" 'yank)
  (define-key evil-visual-state-map "\C-y" 'yank)
  (define-key evil-insert-state-map "\C-e" 'end-of-line)
  (define-key evil-insert-state-map "\C-a" 'move-beginning-of-line)
  (define-key evil-insert-state-map "\C-n" 'next-line)
  (define-key evil-insert-state-map "\C-p" 'previous-line)
  (define-key evil-insert-state-map "\C-k" 'kill-line)
  (define-key evil-normal-state-map "\C-w" 'evil-delete)
  (define-key evil-insert-state-map "\C-w" 'evil-delete)
  (define-key evil-insert-state-map "\C-r" 'search-backward)
  (define-key evil-visual-state-map "\C-w" 'evil-delete)
  (spacemacs/toggle-menu-bar)
  (spacemacs/toggle-maximize-frame)
  ;; (add-hook 'fundamental-mode-hook (lambda ()
  ;;                                    (setq buffer-face-mode-face '(:family "DejaVu Sans Mono" :height 100 :width semi-condensed))
  ;;                                    (buffer-face-mode)
  ;;                                    ))
  (add-hook 'spacemacs-buffer-mode-hook (lambda ()
                                          (setq buffer-face-mode-face '(:family "DejaVu Sans Mono" :height 120 :width semi-condensed))
                                          (buffer-face-mode)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (add-to-list 'company-c-headers-path-system
                           "/Users/chenxuesong/Work/Android/ndk/android-ndk-r10e/platforms/android-21/arch-arm/usr/include/")
              (add-to-list 'company-c-headers-path-user
                           "/Users/chenxuesong/Work/project/gamesdk/cocos2d-x-3.8/cocos/")
              (setq flycheck-clang-include-path (list (expand-file-name "~/Work/project/gamesdk/cocos2d-x-3.8/cocos/")
                                                      (expand-file-name "~/Work/Android/ndk/android-ndk-r10e/platforms/android-21/arch-arm/usr/include/")))))
  ;;; Set up some common mu4e variables
  (setq mu4e-maildir (expand-file-name "~/mail")
        mu4e-sent-folder   "/Sent Items"
        mu4e-refile-folder "/Archive"
        mu4e-drafts-folder "/drafts"
        mu4e-trash-folder "/Trash"
        mu4e-get-mail-command "offlineimap"
        mu4e-update-interval 300
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-html2text-command 'mu4e-shr2text
        shr-color-visible-luminance-min 80
        mu4e-view-show-addresses t)

  ;; (setq mu4e-account-alist
  ;;       '(
  ;;         ;; ("Gmail"
  ;;         ;;  ;; Under each account, set the account-specific variables you want.
  ;;         ;;  (mu4e-sent-messages-behavior delete)
  ;;         ;;  (mu4e-sent-folder "/Gmail/[Gmail].Sent Mail")
  ;;         ;;  (mu4e-drafts-folder "/Gmail/[Gmail].Drafts")
  ;;         ;;  (user-mail-address "xxxxx@gmail.com")
  ;;         ;;  (user-full-name "xxxxx"))
  ;;         ;; ("Foxmail"
  ;;         ;;  (mu4e-sent-messages-behavior sent)
  ;;         ;;  (mu4e-sent-folder "/Foxmail/Sent Messages")
  ;;         ;;  (mu4e-drafts-folder "/Foxmail/Drafts")
  ;;         ;;  (user-mail-address "xxxxx@foxmail.com")
  ;;         ;;  (user-full-name "xxxxx"))
  ;;         ("163"
  ;;          (mu4e-sent-messages-behavior sent)
  ;;          (mu4e-sent-folder "/163/Sent Items")
  ;;          (mu4e-drafts-folder "/163/drafts")
  ;;          (user-mail-address "cqupt_chen@163.com")
  ;;          (user-full-name "Chen XueSong"))
  ;;         )
  ;;       )

  ;; save attachment to my desktop (this can also be a function)
  (setq mu4e-attachment-dir "~/Downloads")

  ;;; Mail directory shortcuts
  (setq mu4e-maildir-shortcuts
        '(("/INBOX" . ?i)
          ("/Sent Items" . ?s)))
  (setq mu4e-maildirs-extension-custom-list '("/INBOX" "/Advertisement" "/Junk E-mail"))
  ;; Bookmarks
  (setq mu4e-bookmarks
        `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)
          ("mime:image/*" "Messages with images" ?p)
          (,(mapconcat 'identity
                       (mapcar
                        (lambda (maildir)
                          (concat "maildir:" (car maildir)))
                        mu4e-maildir-shortcuts) " OR ")
           "All inboxes" ?i)))
  ;; configuration for sending mail
  (setq user-full-name "chenxuesong")
  (setq user-mail-address "cqupt_chen@163.com")
  (setq mu4e-compose-signature
        (concat
         "Chen XueSong\n"
         "QQ: 704179713\n"
         "\n")
        mu4e-compose-signature-auto-include t)
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-starttls-credentials
        '(("smtp.163.com" 25 nil nil))
        smtpmail-default-smtp-server "smtp.163.com"
        smtpmail-smtp-server "smtp.163.com"
        smtpmail-smtp-service 25
        smtpmail-debug-info t)
  (with-eval-after-load 'mu4e-alert
    ;; Enable Desktop notifications
    ;; (mu4e-alert-set-default-style 'notifications)) ; For linux
    ;; (mu4e-alert-set-default-style 'libnotify))  ; Alternative for linux
    (mu4e-alert-set-default-style 'notifier))   ; For Mac OSX (through the
                                        ; terminal notifier app)
  ;; (mu4e-alert-set-default-style 'growl))      ; Alternative for Mac OSX
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(cfs--current-profile-name "program" t)
 '(geiser-active-implementations (quote (chicken)))
 '(org-export-backends (quote (ascii html icalendar latex md confluence freemind)))
 '(package-selected-packages
   (quote
    (lsp-vue company-lsp lsp-mode yapfify yaml-mode xkcd wttrin ws-butler winum which-key web-mode web-beautify vue-mode volatile-highlights visual-fill-column vi-tilde-fringe uuidgen use-package toc-org tagedit swiper stickyfunc-enhance srefactor spaceline solarized-theme smeargle slime-company slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs ranger rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-octopress org-download org-bullets open-junk-file neotree multi-term mu4e-maildirs-extension mu4e-alert move-text markdown-toc magit-gitflow lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode ledger-mode launchctl keyfreq js2-refactor js-doc insert-shebang info+ indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags geiser fuzzy flyspell-correct-helm flycheck-ycmd flycheck-pos-tip flycheck-ledger flx-ido fish-mode fill-column-indicator fasd fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies ein dumb-jump docker disaster deft cython-mode company-ycmd company-web company-tern company-statistics company-shell company-c-headers company-anaconda common-lisp-snippets column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format chinese-fonts-setup bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-automatically-star t)
 '(request-backend (quote url-retrieve))
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values (quote ((docker-image-name . "chenxuesong"))))
 '(send-mail-function (quote mailclient-send-it))
 '(smtpmail-smtp-server "smtp.163.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
