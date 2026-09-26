#!/bin/sh
# index.html is the artifact source (no <html>/<head>; the artifact host adds them).
# This wraps it into a standalone page for GitHub Pages at docs/index.html.
cd "$(dirname "$0")"
mkdir -p docs
split='<div id="stage">'
{
  echo '<!doctype html>'
  echo '<html lang="en">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">'
  echo '<meta property="og:title" content="Classroom Cricket">'
  echo '<meta property="og:description" content="Book for a bat, eraser for a ball. Survive till the bell without getting caught or breaking the fan.">'
  echo '<meta property="og:type" content="website">'
  sed "/$split/,\$d" index.html | grep -v '^<meta charset'
  echo '</head>'
  echo '<body>'
  sed -n "/$split/,\$p" index.html
  echo '</body>'
  echo '</html>'
} > docs/index.html
