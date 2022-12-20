---
date: 2022-12-15
type: landing

sections:
    # Pick my profile from the authors profile
  - block: about.avatar
    id: about
    content:
      username: mforster

  - block: collection
    id: publications
    content:
      title: Featured Publications
      subtitle: From a long time ago when I was in academia...
      filters:
        folders:
          - publications
        featured_only: true
      sort_by: 'Date'
      sort_ascending: true
      archive:
        enable: true
        text: All publications
        link: publications
    design:
      columns: "2"
      view: compact
---
