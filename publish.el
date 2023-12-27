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
(setq org-static-blog-use-preview t)
(setq org-static-blog-preview-start "<preview>")
(setq org-static-blog-preview-end "</preview>")
(setq org-static-blog-preview-link-p t)
(setq org-static-blog-page-header
      (concat "<meta charset=\"utf-8\">"
              "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">"
              "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
              "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.css\">"
              "<link rel=\"stylesheet\" href=\"./assets/css/style.css\">"))
(setq org-static-blog-page-preamble
      (concat "<header><nav>"
              "<a href=\"https://www.p-snow.org/blog\">Home</a>"
              "<a href=\"https://www.p-snow.org/config\">My Config</a>"
              "<a href=\"https://www.p-snow.org/blog/tag-english.html\">Posts</a>"
              "<a href=\"https://www.p-snow.org/blog/tag-japanese.html\">日本語記事</a>"
              "</nav><h1>.dot Life</h1><p>by p-snow</p></header>"))
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
