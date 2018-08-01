# Global variables
$input = 'Rapport.md'
$headers = 'templates\headers.tex'
$template = 'templates\template.tex'
$titlepage = 'templates\titlepage.tex'
$output = 'Rapport.pdf'
$latexVersion = 'lualatex'
$latex = @(
  "--pdf-engine=xelatex",
  "--include-in-header=$headers",
  "--include-before-body=$titlepage",
  "--template=$template",
  "--table-of-contents",
  "--variable=lang=fr",
  "--variable=papersize=a4",
  "--variable=fontsize=12pt",
  "--variable=documentclass=article",
  "--variable=colorlinks", # Color internal and external links
  "--variable=links-as-notes" # Transforms external links into footnotes
)

# Clean
Remove-Item "tex2pdf.*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $output -Force -ErrorAction SilentlyContinue

# Build
& pandoc $input $latex -o $output