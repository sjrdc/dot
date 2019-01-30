

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))

(defvar my-oob-directory-name "build"
  "The standard name of out-of-source build directory to look for")

(defun my-get-build-directory (file-name)
  "find build directory for specified file-name"
  (let* ((dir (file-name-directory (expand-file-name file-name)))
	 (build (concat dir my-oob-directory-name))
	 (found nil)
	 (bit nil)
	 (bits '()))

    ;;
    ;; Walk up the directory path looking for something called 'build'.
    ;; Remember the directories we left before finding it.
    ;;
    (while (and (not (file-exists-p build))
		(not (string-equal dir "/")))
      (setq dir (directory-file-name dir)
	    bit (file-name-nondirectory dir)
	    bits (cons bit bits)
	    dir (file-name-directory dir)
	    build (concat dir my-oob-directory-name)))

    ;;
    ;; Try and go down the same directory path but starting in the 'build'
    ;; directory (only if it exists of course). This will handle the case when
    ;; the 'build' directory is inside the top-level source directory.
    ;;
    (while (and (not (null bits))
		(file-exists-p build))
      (setq found build
	    build (concat (file-name-as-directory build) (car bits))
	    bits (cdr bits)))

    ;;
    ;; If we have some remaining directory bits and the last checked directory
    ;; did not exist, try again. This will catch instances where the build
    ;; directory and the source directory are in the same parent directory.
    ;;
    (when (and bits (not (file-exists-p build)))
      (setq build found)
      (while (and (not (null bits))
		  (file-exists-p build))
	(setq found build
	      build (concat (file-name-as-directory build) (car bits))
	      bits (cdr bits))))

    ;;
    ;; Final check to see if the last build directory is valid.
    ;;
    (when (file-exists-p build)
      (setq found build)) found)
  )

(defun set-build-path-hook ()
  (unless (or (file-exists-p "Makefile")
	      (file-exists-p "makefile")
	      (file-exists-p "GNUMakefile"))
    (let ((build-directory (my-get-build-directory buffer-file-name)))
      (if build-directory
	  (set (make-local-variable 'compile-command)
	       (concat "make -C " build-directory)))))
  )

(add-hook 'c-mode-common-hook 'set-build-path-hook)

;; set dictionary
(setq ispell-dictionary "british")
(ispell-change-dictionary "british")

;; a quick way of finding corresponding file
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(put 'upcase-region 'disabled nil)

;; add my emacs elisp directory with some custom (?) el files
(add-to-list 'load-path "~/emacs.d")

;; add a column marker that indicates long lines in c-mode
(require 'column-marker)
(add-hook 'c-mode-common-hook (lambda () (interactive) (column-marker-1 80)))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
