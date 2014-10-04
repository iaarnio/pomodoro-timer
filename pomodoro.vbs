'Author: Ilari Aarnio
'Date: 2014-Oct-02
'
'A simple pomodoro timer
'
'Description:
'  The script aims to help you on your pomodoro sprints by giving you a non-disturbing timer.
'
'  Starting the script activates the timer. There are no bells or whistles or running counters. 
'  Just a brief popup windows informs you that pomodoro time has begun. The popup will auto-close too.
'  After that the script stays out of your way until your pomodoro time is finished.
'  Then a new popup window is displayed and options are given to finish or snooze the pomodoro.
'
'Usage:  wscript.exe pomodoro.vbs [y]
'  (or just double click the icon if the default app for .vbs is MS Script Host)
'  Optional parameter y or yes enables sound alarm when popup appears.
'
'Issues:
'  It is technically possible to start multiple overlapping pomodoro timers.
'  That would be against the idea and would lead to confusing results.
'
'For details on the Pomodoro technique, please refer http://en.wikipedia.org/wiki/Pomodoro_Technique


'Configure these for your likings
Dim alarm, minute, pomodoroTime, snoozeTime, soundFile, alarmPlayer
alarm        = False
minute       = 60 * 1000
pomodoroTime = 25 * minute
snoozeTime   =  5 * minute

Set objShell = CreateObject("WScript.Shell")
Set alarmPlayer = CreateObject("WMPlayer.OCX")
Call Main
alarmPlayer.close
Set objShell = Nothing

Sub Main
    Call CheckArgs
    If alarm Then
        Set WshSysEnv = objShell.Environment("PROCESS")
        soundFile = WshSysEnv("WINDIR") & "\Media\notify.wav"  'Alarm ringtone
        Set WshSysEnv = Nothing
    End If
    dummy = objShell.Popup("Pomodoro started", 1, "", 0 + 64)    
    WScript.Sleep pomodoroTime
    Call Finished
End Sub

'Check if 'y' or 'yes' is provided to enable alarm
Sub CheckArgs
    Set args = WScript.Arguments
    For Each arg In args
        If Lcase(arg) = "y" Or Lcase(arg) = "yes" Then
            alarm = True
        End If
    Next
End Sub

'Pomodoro time done - give options to finish or snooze
Sub Finished
    Dim btnCode, title, postponed
    Do Until btnCode = 6
        If alarm Then
            Call PlayAlarm
        End If
        title = "Time's up"
        If postponed > 0 Then
            title = title + "! Postponed " + Cstr(postponed) + " time"
            If postponed > 1 Then
                title = title + "s"'
            End If
        End If
        btnCode = objShell.Popup("Pomodoro finished?", 0, title, 4 + 32)
        If btnCode = 7 Then
            postponed = postponed + 1
            WScript.Sleep snoozeTime
        End If
    Loop
End Sub

'Play alarm sound
Sub PlayAlarm
    alarmPlayer.URL = soundFile
End Sub
