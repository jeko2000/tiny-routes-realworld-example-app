(in-package :conduit)

(defun format-timestamp (timestamp)
  "Return an ISO-8601 formatted string representing TIMESTAMP."
  (local-time:format-timestring nil timestamp :format local-time:+iso-8601-format+))

(defun parse-timestamp (timestamp-designator)
  (typecase timestamp-designator
    (null nil)
    (fixnum (local-time:universal-to-timestamp timestamp-designator))
    (string (local-time:parse-timestring timestamp-designator))
    (otherwise timestamp-designator)))

(defun unix-now ()
  (local-time:timestamp-to-unix (local-time:now)))

(defun parse-boolean (boolean-designator)
  (typecase boolean-designator
    (boolean boolean-designator)
    (fixnum (not (zerop boolean-designator)))
    (string (alexandria:starts-with #\t boolean-designator :test #'char= :key #'char-downcase))
    (otherwise boolean-designator)))
