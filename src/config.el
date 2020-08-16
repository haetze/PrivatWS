;;; config.el ---
;;; Makes local packages available
;;; src export requires emacs-htmlize (https://melpa.org/#/htmlize)
(package-initialize)

(setq org-src-lang-modes '(("inline-js" . javascript))) ;; js2 if you're fancy
(defvar org-babel-default-header-args:inline-js
  '((:results . "html")
    (:exports . "results")))
(defun org-babel-execute:inline-js (body _params)
  (format "<script type=\"text/javascript\">\n%s\n</script>" body))


(setq org-confirm-babel-evaluate (lambda (a b) 'nil))
;;; init.el ends here
