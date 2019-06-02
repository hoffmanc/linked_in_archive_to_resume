LinkedIn Archive to Resume
============

Basic Resume from LinkedIn Archive

Description
-----------

I dislike maintaining my resume, after going through the trouble of maintaining my LinkedIn profile.  
So, why not kill two birds with one stone?  I wrote this bit of code as an attempt to accomplish
this goal.

Installation
------------

`gem install linked_in_archive_to_resume`

Usage
-----

Download a copy of your LinkedIn archive: https://www.linkedin.com/psettings/member-data

You only need to download the *Profile* data, but you may as well grab the whole shebang, as the
profile part gets sent before the rest.

In order to get your phone number and LinkedIn profile link displayed, you'll need to add `Phone` 
and `LinkedIn` columns to the `Profile.csv` file.

Unzip the archive and `cd` into it

Execute `linked_in_archive_to_resume` in that directory

Open the resulting `resume.html` in your browser

Options
-------

`linked_in_archive_to_resume -h` shows you the couple of options available.  For further customization,
you will need to fork this repo and tweak the code.
