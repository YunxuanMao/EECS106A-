;; Auto-generated. Do not edit!


(when (boundp 'my_chatter::TimestampString)
  (if (not (find-package "MY_CHATTER"))
    (make-package "MY_CHATTER"))
  (shadow 'TimestampString (find-package "MY_CHATTER")))
(unless (find-package "MY_CHATTER::TIMESTAMPSTRING")
  (make-package "MY_CHATTER::TIMESTAMPSTRING"))

(in-package "ROS")
;;//! \htmlinclude TimestampString.msg.html


(defclass my_chatter::TimestampString
  :super ros::object
  :slots (_message _sent_time ))

(defmethod my_chatter::TimestampString
  (:init
   (&key
    ((:message __message) "")
    ((:sent_time __sent_time) 0.0)
    )
   (send-super :init)
   (setq _message (string __message))
   (setq _sent_time (float __sent_time))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:sent_time
   (&optional __sent_time)
   (if __sent_time (setq _sent_time __sent_time)) _sent_time)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ;; float32 _sent_time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; float32 _sent_time
       (sys::poke _sent_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _sent_time
     (setq _sent_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_chatter::TimestampString :md5sum-) "d0b86caf0c56832953f14ea24cc5f9e4")
(setf (get my_chatter::TimestampString :datatype-) "my_chatter/TimestampString")
(setf (get my_chatter::TimestampString :definition-)
      "string message
float32 sent_time

")



(provide :my_chatter/TimestampString "d0b86caf0c56832953f14ea24cc5f9e4")


