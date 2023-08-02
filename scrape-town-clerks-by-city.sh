#!/bin/bash

# Perform the Google search and retrieve the HTML content
search_query="site:.us inurl:clerk intitle:\"town\" OR \"city\""
search_url="https://www.google.com/search?q=$(echo "$search_query" | sed 's/ /+/g')"
html_content=$(curl -s "$search_url")

# Extract the URLs using grep
urls=$(echo "$html_content" | grep -oE 'https?://[^"]+')

# Generate the HTML file
html_file="town_clerk_websites.html"

echo "<html>
<head>
  <title>Town Clerk Websites</title>
</head>
<body>
  <h1>Town Clerk Websites</h1>
  <ul>" > "$html_file"

while read -r url; do
  echo "    <li><a href=\"$url\">$url</a></li>" >> "$html_file"
done <<< "$urls"

echo "  </ul>
</body>
</html>" >> "$html_file"

echo "HTML file generated: $html_file"
