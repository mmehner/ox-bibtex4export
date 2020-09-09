(provide 'ox-bibtex4export)

(org-link-set-parameters
 "cite"
 :export (lambda (path desc backend)
	   (cond
	    ((eq 'latex backend)
	     (format "\\cite{%s}" path))
	    ((eq 'html backend)
	     (format "<span style=\"font-variant: small-caps\">%s</span>" desc))
	    ((eq 'ascii backend)
	     (format "%s" (upcase desc)))
	    ((eq 'odt backend)
	     (format "<text:span text:style-name=\"sc\">%s</text:span>" desc))
	    )
	   )
 :face '(:weight semi-bold :overline t)
 )

(defun bibtex4export-style (backend)
  (if (eq 'odt backend)
      (eval-expression
       (with-temp-file "/tmp/odtstyle.xml"
	 (insert-file-contents (concat org-odt-styles-dir "OrgOdtStyles.xml" ))
	 (re-search-forward "<style:style .+$")
	 (insert "\n  <style:style style:name=\"sc\" style:family=\"text\"><style:text-properties fo:font-variant=\"small-caps\"/></style:style>")
	 )))
  (eval-expression (setq org-odt-styles-file "/tmp/odtstyle.xml"))
  )

(add-hook 'org-mode-hook '(lambda () (eval-expression (setq-local reftex-cite-format "[[cite:%l][%a %y]]"))))

(add-hook 'org-export-before-processing-hook 'bibtex4export-style)
