---
date: 2022-12-15
type: landing

sections:
    # Pick my profile from the authors profile
  - block: about.avatar
    id: about
    content:
      username: mforster

  - block: experience
    id: experience
    design:
      columns: '2'
    content:
      title: Experience
      date_format: Jan 2006
      items:
        - title: Principal Software Engineer
          company: Google
          company_url: http://www.google.com
          company_logo: google
          location: Munich, Germany
          date_start: 2024-11-01
        
        - title: Engineering Director
          company: Celonis
          company_url: https://www.celonis.com/
          company_logo: celonis
          location: Munich, Germany
          date_start: 2023-12-21
          date_end: 2024-10-31

        - title: Principal Software Engineer
          company: Celonis
          company_url: https://www.celonis.com/
          company_logo: celonis
          location: Munich, Germany
          date_end: 2023-12-21
          date_start: 2022-07-01

        - title: Senior Staff Software Engineer
          company: Google
          company_url: http://www.google.com
          company_logo: google
          location: Munich, Germany
          date_start: 2007-09-01
          date_end: 2022-06-30

        - title: Consultant
          company: Siemens
          company_url: https://siemens.com
          company_logo: siemens
          location: Munich, Germany
          date_start: 2006-05-01
          date_end: 2007-08-31

        - title: Research Assistant / Teaching Assistant
          company: University of Passau
          company_url: https://www.fim.uni-passau.de/
          company_logo: uni-passau
          location: Passau, Germany
          date_start: 2005-12-01
          date_end: 2006-04-30

        - title: Researcher
          company: NICTA
          company_url: https://en.wikipedia.org/wiki/NICTA
          company_logo: nicta
          location: Sydney, Australia
          date_start: 2005-03-01
          date_end: 2005-11-30

        - title: Research Assistant / Teaching Assistant
          company: University of Passau
          company_url: https://www.fim.uni-passau.de/
          company_logo: uni-passau
          location: Passau, Germany
          date_start: 1999-11-01
          date_end: 2005-03-31

  - block: experience
    id: education
    design:
      columns: '2'
    content:
      title: Education
      date_format: Jan 2006
      items:
        - title: PhD in Computer Science
          company: University of Passau
          company_url: https://www.fim.uni-passau.de/
          company_logo: uni-passau
          location: Passau, Germany
          date_start: 1999-11-01
          date_end: 2005-02-28
          description: |
            Thesis: [Crossings in Clustered Level Graphs](
              {{< ref "publications/crossings-clustered-level-graphs/" >}})

        - title: Master in Computer Science / Mathematics
          company: University of Passau
          company_url: https://www.fim.uni-passau.de/
          company_logo: uni-passau
          location: Passau, Germany
          date_start: 1999-10-31
          date_end: 1995-11-01
          description: |
            Thesis: [Zeichnen ungerichteter Graphen mit gegebenen Knotengrößen
            durch ein Springembedder-Verfahren](
              {{< ref "publications/springembedder-knotengroessen" >}})

  - block: collection
    id: posts
    content:
      title: Recent Posts
      subtitle: My random ramblings...
      count: 2 # TODO: Update this once I have more posts
      filters:
        folders:
          - posts
      sort_by: Date
      sort_ascending: false
      archive:
        enable: true
        text: All posts
        link: posts
    design:
      columns: '2'
      view: compact

  - block: collection
    id: publications
    content:
      title: Featured Publications
      subtitle: From a long time ago when I was in academia...
      filters:
        folders:
          - publications
        featured_only: true
      sort_by: Date
      sort_ascending: true
      archive:
        enable: true
        text: All publications
        link: publications
    design:
      columns: '2'
      view: compact

  - block: tag_cloud
    content:
      taxonomy: tags
      count: 15
    design:
      font_size_min: 0.7
      font_size_max: 1.5
---
