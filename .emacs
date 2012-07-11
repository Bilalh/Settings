(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
  (autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)

(global-auto-revert-mode t)

(autoload 'longlines-mode "longlines.el" "Minor mode for editing long lines." t)
(add-hook 'text-mode-hook 'longlines-mode) 
