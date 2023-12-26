(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'htmlize)
(package-install 'org-static-blog)

t(require 'ox-publish)

(setq make-backup-files nil)


(require 'org-static-blog)
(setq org-static-blog-publish-title ".dot life")
(setq org-static-blog-publish-url "https://www.p-snow.org/blog")
(setq org-static-blog-publish-directory "./public/")
(setq org-static-blog-posts-directory "./content/posts/")
(setq org-static-blog-drafts-directory "./content/drafts/")
(setq org-static-blog-enable-tags t)
(setq org-static-blog-index-file "top.html")
(setq org-static-blog-archive-file "index.html")
(setq org-static-blog-page-header
      "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.css\">")
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)


(setq org-export-with-broken-links 'mark
      org-export-use-babel nil)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; (setq org-publish-project-alist
;;       (list
;;        (list "org-site:main"
;;              :recursive nil
;;              ;; :base-directory "."
;;              :base-directory "./content"
;;              :publishing-function 'org-html-publish-to-html
;;              :publishing-directory "./public"
;;              :exclude "README.org"
;;              :auto-sitemap t
;;              :with-author nil
;;              :with-creator t
;;              :with-toc t
;;              :section-numbers nil
;;              :time-stamp-file nil)))

;; (org-publish-all t)
(org-static-blog-publish)

(message "Build complete!")
