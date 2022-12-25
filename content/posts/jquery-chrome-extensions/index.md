---
title: jQuery Chrome Extensions
date: 2009-08-15

tags: [jQuery, Chrome Extensions]
---

{{% callout warning %}} This blog post has been imported from my old Blogger
blog. It is more than 10 years old and likely horribly out of date. I have not
updated the content nor fixed any broken links. {{% /callout %}}

Today I wanted to learn how to write an [extension for Google
Chrome](http://dev.chromium.org/developers/design-documents/extensions/). The
Chrome extension system is not yet released, but there is alpha support for
developing extensions. A
[HOWTO](http://dev.chromium.org/developers/design-documents/extensions/howto)
describes what you need to do. This is actually quite easy: Chrome extensions
are very much like regular web pages. They consist of HTML, CSS, JavaScript and
images. Some JSON metadata describes the extension that is then
[packaged](http://dev.chromium.org/developers/design-documents/extensions/packaging)
into a `*.crx` file.

As I don't like raw JavaScript very much, I wondered whether it is possible to
use my favorite JavaScript library [jQuery](http://jquery.com/) in Chrome
extensions. It turned out that this is actually very straight-forward. It
basically works out-of-the box as you would expect it.

I tried to use jQuery in a [background
page](http://dev.chromium.org/developers/design-documents/extensions/background-pages)
as well as in a [content
script](http://dev.chromium.org/developers/design-documents/extensions/content-scripts).
Here is the `manifest.json` file that describes my demo extension:

```json
{
  "name": "A jQuery Chrome extension",
  "version": "0.1",
  "description": "Use jQuery to build Chrome extensions",
  "content_scripts": [
    {
      "matches": ["<http://jquery.com/>*"],
      "js": ["jquery-1.3.2.js", "content.js"]
    }
  ],
  "background_page": "background.html"
}
```

To use jQuery in my content script `content.js`, it was enough to list the stock
jQuery JavaScript file as the first content script. `content.js` then has jQuery
available:

```javascript
$('a').css({'background-color': 'yellow'});
```

Using jQuery in the background page is even more straight-forward. Simply embed
it into `background.html` the same way as you would for every other HTML page:

```html
<html>
  <head>
    <script src='jquery-1.3.2.js'></script>
    <script src='background.js'></script>
  </head>
</html>
```

This was extremely easy. I think the Chrome team made the right decision to
build their extension model on the web page model. Now any web developer can
start writing Chrome extensions without having to leave their comfort zone.

Let me end this post with two disclaimers: While I do work for Google as a
software engineer, my work is not related to Chrome at all. My interest for
writing Chrome extensions is purely private. Also, I have not written any large
Chrome extensions. So, it's easily possible that you will encounter problems
when using jQuery in a complex use case. YMMV.
