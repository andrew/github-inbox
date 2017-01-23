# Octobox &#128238;

Take back control of your GitHub Notifications with [Octobox]( https://octobox.io).

![Screenshot of Github Inbox](https://cloud.githubusercontent.com/assets/1060/21510049/16ad341c-cc87-11e6-9a83-86c6be94535f.png)

[![Build Status](https://travis-ci.org/octobox/octobox.svg?branch=master)](https://travis-ci.org/octobox/octobox)
[![Code Climate](https://img.shields.io/codeclimate/github/octobox/octobox.svg?style=flat)](https://codeclimate.com/github/octobox/octobox)
[![Test Coverage](https://img.shields.io/codeclimate/coverage/github/octobox/octobox.svg?style=flat)](https://codeclimate.com/github/octobox/octobox)
[![Code Climate](https://img.shields.io/codeclimate/issues/github/octobox/octobox.svg)](https://codeclimate.com/github/octobox/octobox/issues)
[![license](https://img.shields.io/github/license/octobox/octobox.svg)](https://github.com/octobox/octobox/blob/master/LICENSE.txt)
[![Docker Automated build](https://img.shields.io/docker/automated/octoboxio/octobox.svg)](https://hub.docker.com/r/octoboxio/octobox/)

## Why is this a thing?

If you manage more than one active project on GitHub, you probably find [GitHub Notifications](https://github.com/notifications) pretty lacking.

Notifications are marked as read and disappear from the list as soon as you load the page or view the email of the notification. This makes it very hard to keep on top of which notifications you still need to follow up on. Most open source maintainers and GitHub staff end up using a complex combination of filters and labels in Gmail to manage their notifications from their inbox. If, like me, you try to avoid email, then you might want something else.

Octobox adds an extra "archived" state to each notification so you can mark it as "done". If new activity happens on the thread/issue/pr, the next time you sync the app the relevant item will be unarchived and moved back into your inbox.

## Getting Started

### Octobox.io

You can use Octobox right now at [octobox.io](https://octobox.io), a shared instance hosted by the Octobox team.

**Note:** octobox.io has a few features intentionally disabled:

* Auto refreshing of notifications page ([#200](https://github.com/octobox/octobox/pull/200))
* Personal Access Tokens ([#185](https://github.com/octobox/octobox/pull/185))

Features are disabled for various reasons, such as not wanting to store users' tokens at this time.

### Installation

You can also host Octobox yourself! See [INSTALLATION](https://github.com/octobox/octobox/blob/master/INSTALLATION.md)
for installation instructions and details regarding deployment to Heroku, Docker, and more.

## Requirements

Web notifications must be enabled in your GitHub settings for Octobox to work: https://github.com/settings/notifications

<img width="757" alt="Notifications settings screen" src="https://cloud.githubusercontent.com/assets/1060/21509954/3a01794c-cc86-11e6-9bbc-9b33b55f85d1.png">

## Keyboard shortcuts

You can use keyboard shortcuts to navigate and perform certain actions:

 - `a` - Select/deselect all
 - `r` or `.` - refresh list
 - `j` - move down the list
 - `k` - move up the list
 - `s` - star current notification
 - `x` - mark/unmark current notification
 - `y` or `e` - archive current/marked notification(s)
 - `m` - mute current/marked notification(s)
 - `d` - mark current/marked notification(s) as read here and on GitHub
 - `o` or `Enter` - open current notification in a new window

Press `?` for the help menu.

## Alternatives

- [LaraGit](https://github.com/m1guelpf/laragit) - PHP rewrite
- [octobox.js](https://github.com/doowb/octobox.js) - JavaScript rewrite

## Development

The source code is hosted at [GitHub](https://github.com/octobox/octobox).
You can report issues/feature requests on [GitHub Issues](https://github.com/octobox/octobox/issues).
For other updates, follow me on Twitter: [@teabass](https://twitter.com/teabass).

### Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Add tests for it. This is important so we don't break it in a future version unintentionally.
 * Send a pull request. Bonus points for topic branches.

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## Copyright

Copyright (c) 2017 Andrew Nesbitt. See [LICENSE](https://github.com/octobox/octobox/blob/master/LICENSE.txt) for details.
