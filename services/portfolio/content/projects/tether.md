---
title: "tether"
date: 2026-07-07
draft: false
group: tools
weight: 10
role: "Author"
status: "v0.1.0"
summary: "Container isolation for AI coding agents on macOS. Your agent gets a shell; you keep the keys."
tags: ["Go", "Docker", "macOS", "Security"]
links:
  - name: "GitHub"
    url: "https://github.com/alexs60/tether"
  - name: "Docs"
    url: "https://alexs60.github.io/tether/"
---
An AI agent with a shell can run `curl`, `git push`, and read every `.env` file on your disk. tether is a single-binary CLI that starts a network-isolated workspace for a project instead, with the agent inside and the credentials outside.

- Outbound traffic only reaches the domains you allow, enforced at DNS and with iptables. Cloud metadata endpoints are always blocked.
- Git tokens, AWS credentials and Anthropic API keys stay in the macOS Keychain. A broker on the host hands them out per operation, so they never land on the container's filesystem.
- Reading is allowed by default. Pushing needs a time-boxed grant from your own terminal.

Install it with Homebrew: `brew install alexs60/tether/tether`.
