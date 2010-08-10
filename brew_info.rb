l = <<EOL
antiword	    icu4c		monit		    sqlite
bazaar		    ioke		multitail	    strigi
cmake		    ipmitool		mysql		    subversion
coffee-script	    john		neon		    task
couchdb		    kdelibs		node		    tcpflow
doxygen		    kdepimlibs		nspr		    tig
ec2-api-tools	    kiwi		opentracker	    tmux
emacs		    leiningen		oxygen-icons	    uncrustify
erlang		    libnet		pango		    uwsgi
ffmpeg		    libpcap		pig		    v8
fftw		    libsndfile		pixman		    wdiff
fop		    libtasn1		postgresql	    weechat
git		    lzip		pwnat		    wget
gloox		    maven		qt		    wine
google-app-engine   mawk		raptor		    xpdf
gpgme		    md5deep		rasqal		    yasm
grails		    memcached		shell.fm	    zsh
groovy		    midnight-commander	skipfish	    
growlnotify	    mod_python		soprano
hdf5		    mod_wsgi		sphinx
icecast		    mongodb		spim
EOL

l.split(/\s+/).sort.each do |package|
  puts "\n*****\n#{package}\n*****"
  puts `brew info #{package}`
  puts "\n\n"
end