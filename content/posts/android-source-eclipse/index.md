---
title: View Android Source Code in Eclipse
date: 2008-12-20

tags: [Android, Eclipse]
---

{{% callout warning %}} This blog post has been imported from my old Blogger
blog. It is more than 10 years old and likely horribly out of date. I have not
updated the content nor fixed any broken links. {{% /callout %}}

Recently, I have been hacking around with [Android](http://www.android.com/) a
lot, and I think it's awesome.

Unfortunately, the [Android SDK](http://code.google.com/android/) does not come
with source code, and sometimes the
[docs](http://code.google.com/android/documentation.html) are not so great, yet.
Being an open source project, the [Android sources](http://source.android.com/)
are available online, but they are not very easy to access from Eclipse. For
one, the source files are sometimes difficult to find as they are distributed
over many individual Git [repositories](http://android.git.kernel.org/), and
then I am not always online.

Integrating source files into Eclipse is usually quite easy, but the Android
Eclipse plugin
([ADT](http://code.google.com/android/intro/installing.html#installingplugin))
does not allow to modify the Java Source Attachment of android.jar in the
Android Library. Fortunately, you only have to find out what the default
location for source code is. Eric Burke nicely describes [how to find that
out.](http://stuffthathappens.com/blog/2008/11/01/browsing-android-source-in-eclipse/)

Long story short: Android source code needs to be placed in a `sources`
subdirectory of the Android SDK. Here is what you need to do:

1. [Get the Android source code](http://source.android.com/download/) ([install
   repo](http://source.android.com/download/using-repo#TOC-Task-reference), repo
   init, repo sync)
2. Move all Java sources into a `sources` subdirectory of the Android SDK

Step 2 sounds easier than it is. There are a lot of Java files in the Android
sources, and they are sprinkled all over the place. Eclipse, however, needs the
source files in a standard Java source directory structure: The path of a source
file needs to match its package name. To simplify this task, I have written a
short Python script that recursively searches for Java files and packs them into
a ZIP file. Unpack that source file into a `sources` subdirectory of the Android
SDK. Enjoy:

```python
from \_\_future\_\_ import with\_statement  # for Python < 2.6

import os
import re
import zipfile

# open a zip file

DST\_FILE = 'sources.zip'
if os.path.exists(DST\_FILE):
  print DST\_FILE, "already exists"
  exit(1)
zip = zipfile.ZipFile(DST\_FILE, 'w', zipfile.ZIP\_DEFLATED)

# some files are duplicated, copy them only once

written = {}

# iterate over all Java files

for dir, subdirs, files in os.walk('.'):
  for file in files:
    if file.endswith('.java'):
      # search package name
      path = os.path.join(dir, file)
      with open(path) as f:
        for line in f:
          match = re.match(r'\\s\*package\\s+(\[a-zA-Z0-9\\.\_\]+);', line)
          if match:
            # copy source into the zip file using the package as path
            zippath = match.group(1).replace('.', '/') + '/' + file
            if zippath not in written:
              written\[zippath\] = 1
              zip.write(path, zippath)
            break;

zip.close()
```
