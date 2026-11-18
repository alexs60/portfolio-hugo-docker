---
title: "Portfolio Infrastructure"
date: 2025-11-21
draft: false
group: tools
weight: 14
role: "Author"
summary: "How this site and gancio.xyz are hosted: one small VPS, Caddy and Docker."
tags: ["Docker", "Hugo", "Caddy"]
links:
  - name: "GitHub"
    url: "https://github.com/alexs60/portfolio-hugo-docker"
---
Caddy sits in front and handles HTTPS for both domains. Each site is a Hugo build served by nginx in its own container, and the whole stack is one Docker Compose file. Adding another site means one more service and one more route in the Caddyfile.
