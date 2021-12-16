(in-package :conduit)

(defvar *http-server* nil
  "The application's HTTP server.")

(defun stop-http-server ()
  (when *http-server*
    (clack:stop *http-server*)
    (setf *http-server* nil)))

(defun start-http-server (handler &optional port)
  (stop-http-server)
  (setf *http-server*
        (clack:clackup handler :port (or port 8080))))

(start-http-server app-routes)