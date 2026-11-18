---
title: "Italian charts dataset"
date: 2026-04-27
draft: false
group: research
weight: 20
role: "Author"
summary: "A research dataset of Italy's Spotify charts, with audio features for every track."
tags: ["Python", "PostgreSQL", "Docker", "Audio analysis"]
links:
  - name: "tracks-dataset"
    url: "https://github.com/alexs60/tracks-dataset"
  - name: "essentia-server"
    url: "https://github.com/alexs60/essentia-server"
---
It comes in two parts. **tracks-dataset** collects the weekly Italian charts and runs a staged pipeline that adds preview clips, audio features and Essentia descriptors to each track, then exports the result to Parquet and CSV.

**essentia-server** is the analysis backend: a self-hosted HTTP API, packaged in Docker, that runs the [MTG Essentia](https://essentia.upf.edu/) library with its 18 pre-trained classifiers for genre, mood, danceability, voice and more.
