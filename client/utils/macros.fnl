(fn create-mode [...]
  (collect [_ [name args & body] (ipairs [...])]
    (values (tostring name) `(fn ,name ,args ,(unpack body)))))

{:create-mode create-mode}