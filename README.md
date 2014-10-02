pomodoro-timer
==============

**A simple, standalone, non-disturbing pomodoro timer**

###Description

The script aims to help you on your pomodoro sprints by giving you a non-disturbing timer.

Starting the script activates the timer. There are no bells or whistles or running counters. 
Just a brief popup windows informs you that pomodoro time has begun. The popup will auto-close too.
After that the script stays out of your way until your pomodoro time is finished.
Then a new popup window is displayed and options are given to finish or snooze the pomodoro.

###Usage  

wscript.exe pomodoro.vbs [y]
(or just double click the icon if the default app for .vbs is MS Script Host)
Optional parameter y or yes enables sound alarm when popup appears.

###Issues

It is technically possible to start multiple overlapping pomodoro timers.
That would be against the idea and would lead to confusing results.

###Requrements

Written in vbscript, thus Windows platform required

###References

For details on the Pomodoro technique, please refer http://en.wikipedia.org/wiki/Pomodoro_Technique
