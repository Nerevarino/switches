(progn
  

(defun sw:connect-to(switch)
  ""
  (send-string support (concat "telnet sw" switch ".dev\n" ))
)

(defun sw:28-status()
  ""
  (send-string support "show interface ethernet status\n")
)

(defun sw:29-status()
  ""
  (send-string support "show interface brief\n")
)

(defun sw:dl-status()
  ""
  (send-string support "show ports description\n")
)

(defun sw:status()
  ""
  (funcall sw:status)
)

(defun sw:28-show-mac(port)
  ""
  (send-string support (concat "show mac-address-table interface ethernet " port "\n"))
)

(defun sw:29-show-mac(port)
  ""
  (send-string support (concat "show mac-address-table interface ethernet " port "\n"))
)

(defun sw:dl-show-mac(port)
  ""
  (send-string support (concat "show fdb port " port "\n"))
)

(defun sw:show-mac(port)
  ""
  (funcall sw:show-mac port)
)

(defun sw:28-show-vlan(vlan)
  ""
  (send-string support (concat "show mac-address-table vlan " vlan "\n"))
)

(defun sw:29-show-vlan(vlan)
  ""
  (send-string support (concat "show mac-address-table vlan " vlan "\n"))
)

(defun sw:dl-show-vlan(vlan)
  ""
  (send-string support (concat "show vlan " vlan "\n"))
)

(defun sw:show-vlan(vlan)
  ""
  (funcall sw:show-vlan vlan)
)

(defun sw:28-describe-port(port)
  ""
  (send-string support (concat "show interface ethernet " port "\n"))
)

(defun sw:29-describe-port(port)
  ""
  (send-string support (concat "show statistics interface ethernet " port "\n"))
)

(defun sw:dl-describe-port(port)
  ""
  (send-string support (concat "show error ports " port "\n"))
)

(defun sw:describe-port(port)
  ""
  (funcall sw:describe-port port)
)

(defun sw:28-show-warnings(port)
  ""
  (send-string support (concat "show logging buffered level warnings | i " port "\n"))
)

(defun sw:29-show-warnings(port)
  ""
  (send-string support (concat "show logging buffered\n"))
)

(defun sw:dl-show-warnings(port)
  ""
  (send-string support (concat "show log\n"))
)

(defun sw:show-warnings(port)
  ""
  (funcall sw:show-warnings port)
)

(defun sw:28-disconnect()
  ""
  (send-string support "exit\n")
)

(defun sw:29-disconnect()
  ""
  (send-string support "exit\n")
)

(defun sw:dl-disconnect()
  ""
  (send-string support "logout\n")
)

(defun sw:disconnect()
  ""
  (funcall sw:disconnect)
)

(defun sw:set-type(type)
  ""
  (cond
    ((equal type "28")
      (setq sw:status 'sw:28-status)
      (setq sw:show-mac 'sw:28-show-mac)
      (setq sw:show-vlan 'sw:28-show-vlan)
      (setq sw:describe-port 'sw:28-describe-port)
      (setq sw:show-warnings 'sw:28-show-warnings)
      (setq sw:disconnect 'sw:28-disconnect)
    )
    ((equal type "29")
      (setq sw:status 'sw:29-status)
      (setq sw:show-mac 'sw:29-show-mac)
      (setq sw:show-vlan 'sw:29-show-vlan)
      (setq sw:describe-port 'sw:29-describe-port)
      (setq sw:show-warnings 'sw:29-show-warnings)
      (setq sw:disconnect 'sw:29-disconnect)
    )
    ((equal type "dl")
      (setq sw:status 'sw:dl-status)
      (setq sw:show-mac 'sw:dl-show-mac)
      (setq sw:show-vlan 'sw:dl-show-vlan)
      (setq sw:describe-port 'sw:dl-describe-port)
      (setq sw:show-warnings 'sw:dl-show-warnings)
      (setq sw:disconnect 'sw:dl-disconnect)
    )    
  )
)


)



;; (interactive "sSwitch Number: ")
;; (send-string support "e.dronov\n")
;; (send-string support "3r3TqewUkspL\n")
;; (switch-to-buffer support)



