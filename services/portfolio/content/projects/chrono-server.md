---
title: "chrono-server"
date: 2025-10-18
draft: false
group: tools
weight: 13
role: "Author"
summary: "A small in-memory key-value store in Go where every key expires."
tags: ["Go"]
links:
  - name: "GitHub"
    url: "https://github.com/alexs60/chrono-server"
---
Every key is set with a time-to-live and deleted when it runs out. Clients talk to the server over a plain-text protocol. It's meant for temporary state such as sessions and short-lived tokens.
