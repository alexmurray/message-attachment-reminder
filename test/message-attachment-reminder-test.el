(require 'ert)
(require 'message-attachment-reminder)

(ert-deftest message-attachment-reminder-test-missing-attachment ()
  "Test that subject text does not generate a warning."
  (with-temp-buffer
    (message-mode)
    (insert "To: test@bar.com\n"
            "From: test@foo.com\n"
            "Subject: Standard test\n"
            "--text follows this line--\n"
            "See attached")
    (should (equal (message-attachment-reminder-attachment-present-p) nil))
    (should (string= (message-attachment-reminder-attachment-expected-p) "See attached"))))

(ert-deftest message-attachment-reminder-test-present-attachment ()
  "Test that subject text does not generate a warning."
  (with-temp-buffer
    (message-mode)
    (insert "To: test@bar.com\n"
            "From: test@foo.com\n"
            "Subject: Standard test\n"
            "--text follows this line--\n"
            "See attached\n"
            "<#part type=\"text/plain\" filename=\"test.txt\" disposition=attachment>\n"
            "<#/part>\n ")
    (should (equal (message-attachment-reminder-attachment-present-p) t))
    (should (string= (message-attachment-reminder-attachment-expected-p) "See attached"))))

(ert-deftest message-attachment-reminder-exclude-quoted-test ()
  "Test that quoted text does not generate a warning."
  (with-temp-buffer
    (message-mode)
    (insert "To: test@bar.com\n"
            "From: test@foo.com\n"
            "Subject: See attached\n"
            "--text follows this line--\n"
            "Some text\n"
            "> see attached")
    (let ((message-attachment-reminder-exclude-quoted t))
      (should (equal (message-attachment-reminder-attachment-present-p) nil))
      (should (equal (message-attachment-reminder-attachment-expected-p) nil)))
    (let ((message-attachment-reminder-exclude-quoted nil))
      (should (equal (message-attachment-reminder-attachment-present-p) nil))
      (should (string= (message-attachment-reminder-attachment-expected-p) "see attached")))))

(ert-deftest message-attachment-reminder-subject-test ()
  "Test that subject text does not generate a warning."
  (with-temp-buffer
    (message-mode)
    (insert "To: test@bar.com\n"
            "From: test@foo.com\n"
            "Subject: See attached\n"
            "--text follows this line--\n"
            "there is no attachment")
    (should (equal (message-attachment-reminder-attachment-present-p) nil))
    (should (equal (message-attachment-reminder-attachment-expected-p) nil))))
