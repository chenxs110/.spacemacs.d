;;; packages.el --- chenxuesong Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq chenxuesong-packages
      '(
        ;; package names go here
        ;; quack
        ;; geiser
        elfeed
        ycmd
        ;; ncompany-irony
        ;; irony-mode
        magit
        magit-popup
        org-octopress
        ivy-mode
        swiper
        keyfreq
        web-mode
        docker-tramp
        docker
        dockerfile-mode
        emacs-lisp
        org
        wttrin
        visual-fill-column
        (ox-confluence-export :location local)
        (ox-opml :location local)
        ;; vue-mode
        ;; lsp-mode
        ;; lsp-vue
        ;; company-lsp
        ;; company-quick-help
        ))

;; List of packages to exclude.
(setq chenxuesong-excluded-packages '())

;; (defun chenxuesong/init-quack ()
;;   "Initialize quack"
;;   (use-package quack)
;;   )

;; (defun chenxuesong/init-geiser ()
;;   "Initialize geiser"
;;   (use-package geiser
;;     :init
;;     (progn
;;       (add-hook 'scheme-mode-hook 'geiser-mode)
;;       (setq geiser-active-implementations '(racket))
;;       )))

;; for vue
;; (defun chenxuesong/init-lsp-vue()
;;   (use-package lsp-vue)
;;   )

;; (defun chenxuesong/init-lsp-mode()
;;   (use-package lsp-mode :ensure)
;;   )

;; (defun chenxuesong/init-company-quick-help()
;;   (use-package company-quick-help :ensure)
;;   )


;; (defun chenxuesong/init-company-lsp()
;;   (use-package company-lsp
;;     :ensure
;;     :config
;;     ;; 开启yasnippet支持
;;     (setq company-lsp-enable-snippet t))
;;   )

;; (defun chenxuesong/post-init-company()
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-dabbrev-downcase nil)
;;   (setq company-idle-delay 0.5)
;;   (setq company-idle-delay 0.5)
;;   (add-hook 'company-mode-hook 'company-quickhelp-mode)
;;   (add-to-list 'company-backends 'company-lsp)
;;   )


(defun chenxuesong/post-init-ycmd()
  ;;(set-variable 'ycmd-server-command '("python"))
  ;;(add-to-list 'ycmd-server-command (expand-file-name "/Users/chenxuesong/emacs/ycmd/") t)
  (set-variable 'ycmd-global-config "/Users/chenxuesong/emacs/ycmd/cpp/ycm/.ycm_extra_conf.py")
  (set-variable 'ycmd-extra-conf-whitelist '("~/Work/project/artisan-cocoslib/*"
                                             "/Users/chenxuesong/Work/project/gamesdk/cocos2d-x-3.8/artisan/Artisan/cocos2d/external/artisan-cocoslib/*"
                                             "/Volumes/android/Finchos-2016-0322/android-5.0.2/device/friendly-arm/tiny4412/fingerprint"))
  (setq company-backends-c-mode-common '((company-c-headers
                                          company-dabbrev-code
                                          company-keywords
                                          company-gtags :with company-yasnippet)
                                         company-files company-dabbrev ))
  (evil-leader/set-key-for-mode 'c-mode
    "mtb" 'company-ycmd)
  (evil-leader/set-key-for-mode 'c++-mode
    "mtb" 'company-ycmd)
  )

(defun chenxuesong/post-init-magit()
  (with-eval-after-load 'magit-popup
    (magit-define-popup-action 'magit-commit-popup
      ?r "Rbt post -g" 'chenxuesong-review-code-post-g)
    (magit-define-popup-action 'magit-commit-popup
      ?R "Rbt post -r" 'chenxuesong-review-code-post-r)
    (magit-define-popup-action 'magit-commit-popup
      ?o "Rbt open" 'chenxuesong-review-code-open)
    (magit-define-popup-action 'magit-commit-popup
      ?d "Rbt diff" 'chenxuesong-review-code-diff)
    (magit-define-popup-action 'magit-commit-popup
      ?D "Delete .Ds_Store" 'chenxuesong-delete-ds-store)
    )
  )


(defun spacemacs//elisp-nav-ms-documentation ()
  "[e] for kill & [s] for select. [hjkl] for motion")


(defun chenxuesong/post-init-emacs-lisp ()
  (with-eval-after-load 'lisp-mode
    (spacemacs|define-micro-state elisp-nav
      :doc (spacemacs//elisp-nav-ms-documentation)
      :use-minibuffer t
      :evil-leader "je"
      :bindings
      ("h" backward-up-list)
      ("j" backward-sexp)
      ("k" forward-sexp)
      ("l" forward-list)
      ("e" kill-sexp)
      ("s" mark-sexpbackward-up-list)
      ("q" nil :exit t)
      )))


(defun chenxuesong/init-swiper ()
  "Initialize my package"
  (use-package swiper
    :init
    (progn
      (setq ivy-use-virtual-buffers t)
      (setq ivy-display-style 'fancy)
      (with-eval-after-load 'recentf
        (setq recentf-exclude
              '("COMMIT_MSG" "COMMIT_EDITMSG" "github.*txt$"
                ".*png$"))
        (setq recentf-max-saved-items 60))
      (evilified-state-evilify ivy-occur-mode ivy-occur-mode-map)
      (use-package ivy
        :defer t
        :config
        (progn
          (spacemacs|hide-lighter ivy-mode)
          (define-key ivy-minibuffer-map (kbd "C-c o") 'ivy-occur)
          (define-key ivy-minibuffer-map (kbd "s-o") 'ivy-dispatching-done)
          (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
          (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)))

      (define-key global-map (kbd "C-s") 'swiper)
      (ivy-mode t)
      (evil-leader/set-key (kbd "bb") 'ivy-switch-buffer)
      (global-set-key (kbd "C-c C-r") 'ivy-resume)
      (global-set-key (kbd "C-c j") 'counsel-git-grep))))

(defun chenxuesong/init-keyfreq ()
  (use-package keyfreq
    :init
    (progn
      (keyfreq-mode t)
      (keyfreq-autosave-mode 1))))

(defun chenxuesong/init-wttrin ()
  (use-package wttrin
    :ensure t
    :commands (wttrin)
    :init
    (setq wttrin-default-cities '("Chengdu"
                                  "Chongqing"))))

(defun chenxuesong/init-org-octopress ()
  (use-package org-octopress
    :commands (org-octopress org-octopress-setup-publish-project)
    :init
    (progn
      (evilified-state-evilify org-octopress-summary-mode org-octopress-summary-mode-map)
      (add-hook 'org-octopress-summary-mode-hook
                #'(lambda () (local-set-key (kbd "q") 'bury-buffer)))
      (setq org-blog-dir "~/Work/blog/")
      (setq org-octopress-directory-top org-blog-dir)
      (setq org-octopress-directory-posts (concat org-blog-dir "source/_posts"))
      (setq org-octopress-directory-org-top org-blog-dir)
      (setq org-octopress-directory-org-posts (concat org-blog-dir "blog"))
      (setq org-octopress-setup-file (concat org-blog-dir "setupfile.org"))

      (defun chenxuesong/org-save-and-export ()
        (interactive)
        (org-octopress-setup-publish-project)
        (org-publish-project "octopress" t))

      (defun chenxuesong/org-create-org-blog-file (title category tags)
        (interactive "sOrg blog file name? \nsBlog category? \nsBlog tags <space split>? ")
        (find-file (concat org-octopress-directory-org-posts "/" (format-time-string "%Y-%m-%d") "-" title ".org"))
        (insert "#+LATEX_HEADER: \\usepackage{fontspec}\n")
        (insert "#+LATEX_HEADER: \\setmainfont{Songti SC}\n")
        (insert "#+STARTUP: indent\n")
        (insert "#+STARTUP: hidestars\n")
        (insert "#+OPTIONS: ^:nil toc:nil\n")
        (insert (concat "#+JEKYLL_CATEGORIES: " category "\n"))
        (insert (concat "#+JEKYLL_TAGS: " tags "\n"))
        (insert "#+JEKYLL_COMMENTS: true\n")
        (insert "#+TITLE: ")
        )
      (evil-leader/set-key "oc" 'chenxuesong/org-create-org-blog-file)
      (evil-leader/set-key "op" 'chenxuesong/org-save-and-export)
      (evil-leader/set-key "od" 'chenxuesong-hexo-deploy)
      (evil-leader/set-key "ol" 'chenxuesong-insert-qiniu-link)
      )))

(defun chenxuesong/post-init-elfeed()
  (with-eval-after-load 'elfeed
    ;;(elfeed :variables url-queue-timeout 30)
    ;;(elfeed :variables elfeed-enable-web-interface t)
    (setq elfeed-enable-web-interface t)
    (setf url-queue-timout 30)
    (setq elfeed-feeds
          '(
            ("http://sachachua.com/blog/category/emacs/feed/" emacs)
            ("http://nullprogram.com/feed/" emacs blog)
            ;; ("http://z.caudate.me/rss/" unknown)
            ("http://tonybai.com/feed/" dev)
            ("http://planet.emacsen.org/atom.xml" emacs)
            ("http://feeds.feedburner.com/emacsblog" emacs)
            ;; ("http://blog.binchen.org/rss.xml" emacs blog)
            ("http://oremacs.com/atom.xml" emacs)
            ;; ("http://t-machine.org/index.php/feed/" dev)
            ;; ("http://feeds.feedburner.com/ruanyifeng" dev blog)
            ("http://blog.devtang.com/atom.xml" dev blog)
            ("http://emacsist.com/rss" emacs)
            ("http://pragmaticemacs.com/feed/" emacs)
            ;; ("http://puntoblogspot.blogspot.com/feeds/2507074905876002529/comments/default" dev)
            ("http://xahlee.info/comp/blog.xml" emacs blog)
            ("http://www.matrix67.com/blog/feed" dev blog)
            ;; ("http://www.udpwork.com/feed" dev blog)
            ("http://ergoemacs.org/emacs/blog.xml" emacs)
            ("https://www.reddit.com/r/Android/.rss" android)
            ("http://feeds.feedburner.com/androidcentral" android)
            ("https://www.reddit.com/r/geek/.rss" news)
            ("https://www.reddit.com/r/reactnative/.rss" dev)
            ("http://www.androidweekly.cn/rss/" dev)
            ("http://www.36kr.com/feed" news)
            ("http://feeds.feedburner.com/nczonline/" blog)

            ("http://code.tutsplus.com/posts.atom" dev)
            ;; ("http://www.infoworld.com/blog/open-sources/index.rss" news)
            ("http://www.infoworld.com/category/application-development/index.rss" news)
            ;; ("http://www.itworld.com/news/index.rss" news)

            ;; ("http://feeds2.feedburner.com/programthink" dev)
            ("http://feeds.feedburner.com/hacker-news-feed-200" news)
            ("https://news.ycombinator.com/rss" news)
            ("http://github-trends.ryotarai.info/rss/github_trends_all_daily.rss" dev)
            ;; ("http://github-trends.ryotarai.info/rss/github_trends_all_weekly.rss" dev)
            ("http://github-trends.ryotarai.info/rss/github_trends_all_monthly.rss" dev)
            ("https://www.sec-wiki.com/news/rss" sec)
            ("http://paper.seebug.org/rss/" sec)
            ("http://www.freebuf.com/feed" sec)
            ("https://www.cvedetails.com/vulnerability-feed.php?vendor_id=0&product_id=0&version_id=0&orderby=3&cvssscoremin=4" sec)
            ;; ("http://www.reactnative.com/rss/" dev)
            )
          )

    ;; (evilify elfeed-search-mode elfeed-search-mode-map)

    (defface elfeed-sec
      '((t :foreground "#90EE90"))
      "Marks Sec in Elfeed."
      :group 'elfeed)

    (push '(sec elfeed-sec)
          elfeed-search-face-alist)

    (defface elfeed-emacs
      '((t :foreground "#8470FF"))
      "Marks Emacs in Elfeed."
      :group 'elfeed)

    (push '(emacs elfeed-emacs)
          elfeed-search-face-alist)

    (defface elfeed-dev
      '((t :foreground "#1E90FF"))
      "Marks Dev in Elfeed."
      :group 'elfeed)

    (push '(dev elfeed-dev)
          elfeed-search-face-alist)

    (defface elfeed-news
      '((t :foreground "#EE6363"))
      "Marks News in Elfeed."
      :group 'elfeed)

    (push '(news elfeed-news)
          elfeed-search-face-alist)

    (defface elfeed-android
      '((t :foreground "#008080"))
      "Marks News in Elfeed."
      :group 'elfeed)

    (push '(android elfeed-android)
          elfeed-search-face-alist)

    (defface elfeed-unread
      '((t :bold t))
      "Face used in search mode for unread entry titles."
      :group 'elfeed)

    (push '(unread elfeed-unread)
          elfeed-search-face-alist)

    (setq-default elfeed-search-filter "@1-week-ago +unread ")

    (defun elfeed-export-link ()
      (interactive)
      (generate-new-buffer-name "elfeed-export")
      (save-excursion
        (mark-whole-buffer)
        (let ((entries (elfeed-search-selected)))
          (switch-to-buffer "elfeed-export")
          (cl-loop for entry in entries
                   when (elfeed-entry-link entry)
                   do (
                       (lambda ()
                         (print (elfeed-entry-title entry)
                                (get-buffer "elfeed-export"))
                         (insert (elfeed-entry-link entry))
                         (insert "\n"))))
          )
        )
      )

    (defun elfeed-mark-all-as-read ()
      (interactive)
      (mark-whole-buffer)
      (elfeed-search-untag-all-unread))

    (define-key elfeed-search-mode-map (kbd "R") 'elfeed-mark-all-as-read)
    (define-key elfeed-search-mode-map (kbd "o") 'elfeed-export-link)

    (defadvice elfeed-show-yank (after elfeed-show-yank-to-kill-ring activate compile)
      "Insert the yanked text from x-selection to kill ring"
      (kill-new (x-get-selection)))

    (ad-activate 'elfeed-show-yank)
    )
  )

(defun chenxuesong/post-init-web-mode ()
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  ;; (add-hook 'web-mode-hook 'company-mode)
  ;; (add-hook 'web-mode-hook 'lsp-vue-enable)
  (add-to-list 'auto-mode-alist '("\\.ios.js\\'" . react-mode))
  (add-to-list 'auto-mode-alist '("\\.android.js\\'" . react-mode))
  (with-eval-after-load 'web-mode
    (setcar company-backends-web-mode '(company-web-html :with company-yasnippet)))
  )

(defun chenxuesong/init-docker ()
  (use-package docker
    :defer
    :config
    (progn
      (message "set docker-mode config.")
      (docker-global-mode)
      )
    )
  )

(defun chenxuesong/post-init-docker ()
  (add-to-list 'evil-emacs-state-modes 'docker-images-mode)
  (add-to-list 'evil-emacs-state-modes 'docker-containers-mode)
  (add-to-list 'evil-emacs-state-modes 'docker-volumes-mode)
  (add-to-list 'evil-emacs-state-modes 'docker-networks-mode)
  (add-to-list 'evil-emacs-state-modes 'docker-machines-mode)
  )

(defun chenxuesong/init-docker-tramp ()
  (use-package docker-tramp
    :defer
    :config
    (progn
      )
    )
  )

(defun chenxuesong/post-init-org ()
  ;; (defun eh-org-clean-space (text backend info)
  ;;   (when (org-export-derived-backend-p backend 'html)
  ;;     (let ((regexp "[[:multibyte:]]")
  ;;           (string text))
  ;;       (setq string (replace-regexp-in-string (format "\\(%s\\) *\n *\\(%s\\)" regexp regexp)
  ;;                                              "\\1\\2"
  ;;                                              string))
  ;;       (setq string (replace-regexp-in-string (format "\\(%s\\) +\\(<\\)" regexp)
  ;;                                              "\\1\\2"
  ;;                                              string))
  ;;       (setq string (replace-regexp-in-string (format "\\(>\\) +\\(%s\\)" regexp)
  ;;                                              "\\1\\2"
  ;;                                              string))
  ;;       string)))
  ;; (add-to-list 'org-export-filter-paragraph-functions
  ;;              'eh-org-clean-space)

  ;;(run-at-time 1 10 'chenxuesong-indent-org-block-automatically)

  (defun clear-single-linebreak-in-cjk-string (string)
    "clear single line-break between cjk characters that is usually soft line-breaks"
    (let* ((regexp "\\([\u4E00-\u9FA5]\\)\n\\([\u4E00-\u9FA5]\\)")
           (start (string-match regexp string)))
      (while start
        (setq string (replace-match "\\1\\2" nil nil string)
              start (string-match regexp string start))))
    string)

  (defun ox-html-clear-single-linebreak-for-cjk (string backend info)
    (when (org-export-derived-backend-p backend 'html)
      (clear-single-linebreak-in-cjk-string string)))

  ;; (add-to-list 'org-export-filter-final-output-functions
  ;;              'ox-html-clear-single-linebreak-for-cjk)
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notify-osx "Pomodoro completed." "Time for a break.")))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Short Break Finished." "Ready for Another?")))
  (add-hook 'org-pomodoro-long-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Long Break Finished." "Ready for Another?")))
  (add-hook 'org-pomodoro-killed-hook
            (lambda ()
              (notify-osx "Pomodoro Killed." "One does not simply kill a pomodoro.")))
  )

(defun chenxuesong/post-init-dockerfile-mode ()
  (with-eval-after-load 'dockerfile-mode (evil-leader/set-key-for-mode
                                           'dockerfile-mode "cn" 'chenxuesong-set-image-name)))

;; (defun chenxuesong/init-ox-confluence-export ()
;;   (use-package ox-confluence-export
;;     :load-path "/Users/chenxuesong/.spacemacs.d/private/chenxuesong/local/"))

(defun chenxuesong/init-ox-confluence-export ()
  (use-package ox-confluence-export))

(defun chenxuesong/init-ox-opml ()
  (use-package ox-opml))

(defun chenxuesong/init-visual-fill-column ()
  (use-package visual-fill-column
    :defer
    :config
    (progn
      (setq visual-fill-column-width 100)
      (setq visual-fill-column-center-text t)
      )
    )
  )

(defun chenxuesong/post-visual-fill-column ()
  (with-eval-after-load 'visual-fill-column
    (setq visual-fill-column-width 100)
    (setq visual-fill-column-center-text t)))

(defun vue-mode/init-vue-mode ()
  "Initialize my package"
  (use-package vue-mode)
  )

;; For each package, define a function chenxuesong/init-<package-name>
;;
;; (defun chenxuesong/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
