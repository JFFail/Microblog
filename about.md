#Static HTML "Sorta" Microblog

I wanted a quick way to generate a static HTML microblog that I could use on my Hugo-powered SDF site. So I created this. It just mainly uses `sed` to parse a blurb of text and timestamp into a .html file. That file is then copied both to the resultant Apache folder *and* the static folder for Hugo. This ensures that the site is updated right away without the risk of wiping what I've done the next time Hugo is compiled and rsync'd to the Apache directory.
