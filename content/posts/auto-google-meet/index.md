---
title: Automatically add Google Meet to Google Calendar events
date: 2022-12-26

tags: [Google, Google Calendar, Google Meet, Google Chrome, Tampermonkey, User Script]

mastodon:
  username: michael
  host: forster.pro
  id: 109579263782979830
---

I usually have my virtual meetings over [Google Meet](https://meet.google.com/).
Unfortunately, I keep forgetting to click the "Add Google Meet" button in
[Google Calendar](https://calendar.google.com/) when scheduling meetings. Then
it's often a scramble to agree on a meet link before the meeting starts.

The public instance of Google Calendar has a setting to automatically add Google
Meet to events you create (under Settings > General > Event Settings):

![Google Calendar setting "Automatically add Google Meet video conferences to
events I create"](calendar-setting.png)

Unfortunately, if you're on a Google Workspace account, your administrator can
remove this setting.

So, I wrote a user script to click the "Add Google Meet" button for me
automatically. It's a bit hacky, but it works.

{{< gist MForster b0314eab4b2dd20869c96ee0d8c45f09 >}}

## Installation

* The easiest way to install this script in your browser is using a user script
manager. If you have [Tampermonkey](https://www.tampermonkey.net/) installed,
just click on the "view raw" link at the bottom right of the embedded Gist
above.

* Chrome can also install user scripts directly from GitHub. Download the file and
drag it onto the Chrome extensions page (`chrome://extensions`).

I've only tested this on Google Chrome. Let me know if it works on other
browsers or with user script managers other than Tampermonkey.

Also, note that this won't work if you're using Google Calendar in a different
language than English.
