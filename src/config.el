;;; config.el ---
;;; Makes local packages available
;;; src export requires emacs-htmlize (https://melpa.org/#/htmlize)
;;; rss export requieres ox-rss.el from org-contrib
;;; LICENSE: GPLv3
(package-initialize)

(setq org-use-property-inheritance t)

(setq org-src-lang-modes '(("inline-js" . javascript))) ;; js2 if you're fancy
(defvar org-babel-default-header-args:inline-js
  '((:results . "html")
    (:exports . "results")))
(defun org-babel-execute:inline-js (body _params)
  (format "<script type=\"text/javascript\">\n%s\n</script>" body))

(defvar org-babel-default-header-args:inline-js-with-code
  '((:results . "html")
    (:exports . "both")))
(defun org-babel-execute:inline-js-with-code (body _params)
  (format "<script type=\"text/javascript\">\n%s\n</script>" body))

(setq org-confirm-babel-evaluate (lambda (a b) 'nil))

(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))

(defun remove-commons (backend)
  (if (eq backend 'rss)
      (setq org-export-exclude-tags '("common" "published" "removedFromRSS"))))

(add-hook 'org-export-before-processing-hook 'remove-commons)
;;; config.el ends here
