# IDONTIME bot

This script facilitates the filling in of time sheets.

It requires two environment variables to be set:

`IDONTIME_USER` and `IDONTIME_PASSWORD` that should contain the username and password used to log in to the time keeping system.

By default, the script will generate IN and OUT entries for the current day, with entry at 9am, enx exit at 6pm.

The script can be overriden, by entering a date, a time in, and a time out in the following format:

`ruby idontime.rb [dd-mm-yyyy] [hh:mm] [hh:mm]`

