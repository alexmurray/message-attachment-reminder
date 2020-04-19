# Message attachment reminder for Emacs

[![License GPL 3](https://img.shields.io/badge/license-GPL_3-green.svg)](http://www.gnu.org/licenses/gpl-3.0.txt)
[![MELPA](http://melpa.org/packages/message-attachment-reminder-badge.svg)](http://melpa.org/#/message-attachment-reminder)
[![Build Status](https://travis-ci.org/alexmurray/message-attachment-reminder.svg?branch=master)](https://travis-ci.org/alexmurray/message-attachment-reminder)

Warns the user if they try and send an email without an attachment when
they body text contains language that suggests an attachment should be
present. Uses `message-send-hook` and so is compatible with `mu4e` and
`gnus` and other email interfaces for Emacs.

This is based off the
[past](https://www.reddit.com/r/emacs/comments/g11mp9/weekly_tipstricketc_thread/fnd2p6p/)
[work](https://www.topbug.net/blog/2016/12/09/attachment-reminder-in-emacs-message-mode/)
of [others](http://mbork.pl/2016-02-06_An_attachment_reminder_in_mu4e) but
has been cleaned up and made into a dedicated package.

## Installation

### MELPA (coming soon...)

The preferred way to install `message-attachment-reminder` is via
[MELPA](http://melpa.org) - then you can just <kbd>M-x package-install RET
message-attachment-reminder RET</kbd>

To enable then simply add the following to your init file:

```emacs-lisp
(require 'message-attachment-reminder)
```

### Manual

If you would like to install the package manually, download or clone it and
place within Emacs' `load-path`, then you can require it in your init file like
this:

```emacs-lisp
(require 'message-attachment-reminder)
```

## Configuration

The phrases to look for can be customized via
`message-attachment-reminder-regexp`.

The warning message shown to the user to alert them to a missing attachment
is specified via `message-attachment-reminder-warning`.

Finally, by default quoted lines are not checked however this can be
changed by setting `message-attachment-reminder-exclude-quoted` to `nil`.


## License

Copyright © 2020 Alex Murray

Distributed under GNU GPL, version 3.
