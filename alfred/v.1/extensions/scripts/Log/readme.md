Log
===

Log is an [Alfred] (alfredapp.com) extension that basically prepends text to a file.


Quick Guide
-----------

- invoke Alfred
- log filename:your text

Requirements
-----------

- [Alfred Power Pack] (http://www.alfredapp.com/powerpack/)
- [Dropbox] (http://www.dropbox.com)

How it works
------------

Using shell scripting, Log will prepend “your text” in the specified file that is found at  
~/Dropbox/Log/Logs. Note that by you can use this extension without Dropbox by adjusting the script to use a location of your preference. Besides the location you can adjust the file extension and the prepended and appended text to the text you’re adding.

The script looks like this:


  		# INFO #

		#Desc:	prepend text to a specified file
		#Use:	log {query}
		#Ex:	log "punchcard:pushed stable release of Log to github"


		# CONFIGURATION #

		# set the path where logs are stored
		# always include a trailing slash!
		LOGDIR="~/Dropbox/Log/Logs"

		# set the file extension used for logs
		LOGEXT="html"


		# TWEAKING THE ENTRY #

		# add some html formatting
		LOGPREFIX="<li>"
		LOGPOSTFIX="<br>"


		# PARSING #

		# grabbing the query from Alfred
		STRING="{query}"
		# grabbing the filename to write to
		LOGFILENAME=${STRING%%:*}
		# grabbing the entry to add to the file
		LOGENTRY=`echo $LOGPREFIX ${STRING##*:} $LOGPOSTFIX|sed -E 's/^ *//'`


		# WRITING #

		# creating the entry
		# the file will be created if it does not exist
		# hint: try using short filenames to avoid confusion
		cd $LOGDIR
		cat "$LOGFILENAME.$LOGEXT" | pbcopy && echo "$LOGENTRY" > "$LOGFILENAME.$LOGEXT" && 		pbpaste >> "$LOGFILENAME.$LOGEXT"


		# RESULT #

		# growling the log entry from the {query} sans pre- and postfix
		echo "- ${STRING##*:} - was added to the $LOGFILENAME log"




Disclaimer
----------

Note that you should use this extension at your own risk.

Ideas
-----

More arguments, more functionality. Having a bunch of files to keep track of things is one thing, leveraging extra arguments without ending up with multiple clones of the script to add more functionality for more specific use cases is a next step.

- add date/time or timestamp prefix
- support multiple formats (.md, .html, .php, .css)
- creating archives by appending date to the filename

Further integration with Alfred to edit and view logs:

- Add a custom file browser to view logs
- Cleaning and sorting of text through Alfred

