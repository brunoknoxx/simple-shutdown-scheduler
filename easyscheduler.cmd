echo off 
cls
color 0e
:mainmenu
echo.
echo.
echo.
echo.
echo.
echo.
echo                           ***********************************************
echo                           ***                                         ***
echo                           ***  SIMPLE SHUTDOWN SCHEDULER FOR WINDOWS  ***
echo                           ***                                         ***
echo                           ***********************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                              [[What would you like to do?]]
echo.
echo                         [1] Program my computer to Shut Down
echo                         [2] Program my computer to Restart
echo                         [3] Program my computer to Hibernate
echo.
echo                         [C] Cancel a scheduled action
echo.
echo.
echo                         [4] Read instructions
echo                         [5] Read info
echo.
echo.


rem #STARTING#
set /p $mainmenu="Choose an option: "
if %$mainmenu% == C goto :cancel
if %$mainmenu% == c goto :cancel
if %$mainmenu% == 4 goto :instructions
if %$mainmenu% == 5 goto :info
goto :setnumber


:setnumber
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo                           ***********************************************
echo                           ***                                         ***
echo                           ***  SIMPLE SHUTDOWN SCHEDULER FOR WINDOWS  ***
echo                           ***                                         ***
echo                           ***********************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                             [[Set the amount of time for the action]]
echo.
echo.
rem ################################## set time section ###################################
set /p $days="Set the number of days: "
set /p $hours="Set the number of hours: "
set /p $minutes="Set the number of minutes: "
set /p $seconds="Set the number of seconds: "
echo.
set /p $answer="Are you sure you want the action to be executed in %$days% day(s), %$hours% hour(s), %$minutes% minute(s) and %$seconds% second(s)?[y/n] "
if %$answer% == y goto :action
echo.
set getback=Would you like to go back to the main menu then?[y/n]
if %$answer% == n echo %getback% 
set /p $restart_script=""
if %$restart_script% == y cls && goto :mainmenu
if %$restart_script% == n echo. && echo Ok, exiting program... && echo.
pause
if %$restart_script% == n exit
rem ############################## end of set time section ###############################

rem ############################## want to cancel something? #############################
:cancel
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo                           ***********************************************
echo                           ***                                         ***
echo                           ***  SIMPLE SHUTDOWN SCHEDULER FOR WINDOWS  ***
echo                           ***                                         ***
echo                           ***********************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                      [[Cancellation section]]
echo.
set /p $cancel="Are you sure you want to cancel an action that you scheduled through this program?[y/n] "
if %$cancel% == y goto :canceled
if %$cancel% == n echo %getback%
set /p $restart_script=""
if %$restart_script% == y cls && goto :mainmenu
if %$restart_script% == n echo. && echo Ok, exiting program... && echo.
pause
exit
rem ######################################################################################

:canceled
cls
shutdown -a
echo.
echo.
echo.
echo.
echo.
echo.
echo                           ***********************************************
echo                           ***                                         ***
echo                           ***  SIMPLE SHUTDOWN SCHEDULER FOR WINDOWS  ***
echo                           ***                                         ***
echo                           ***********************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo You successfully canceled any scheduled action. Would you like to go back to the main menu?[y/n]
set /p $restart_script=""
if %$restart_script% == y cls && goto :mainmenu
if %$restart_script% == n echo. && echo Ok, exiting program... && echo.
pause
exit

rem ############################## convertions section #############################
:action
set /a $converted_mins=%$minutes%*60
set /a $converted_hours=%$hours%*3600
set /a $converted_days=%$days%*86400
set /a $final_result=%$converted_mins%+%$converted_hours%+%$converted_days%+%$seconds%
if %$mainmenu% == 1 (shutdown  /s /t %$final_result%)
if %$mainmenu% == 2 (shutdown  /r /t %$final_result%)
if %$mainmenu% == 3 (shutdown  /h /t %$final_result%)
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo                           ***********************************************
echo                           ***                                         ***
echo                           ***  SIMPLE SHUTDOWN SCHEDULER FOR WINDOWS  ***
echo                           ***                                         ***
echo                           ***********************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo You successfully scheduled the action. The program will now exit.
echo.
pause
exit
rem ############################ end of convertions section ############################
rem All the important code ends here. Below you'll see only the program infos and the instructions for the users.


:instructions
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo                           ***********************************************
echo                           ***                                         ***
echo                           ***  SIMPLE SHUTDOWN SCHEDULER FOR WINDOWS  ***
echo                           ***                                         ***
echo                           ***********************************************
echo.
echo.
echo.
echo.
echo.
echo                                        [[Instructions]]
echo.
echo.
echo. 
echo                       This is the simple shutdown scheduler by Bruno Knoxx 
echo.
echo                  [1] Choose what you want to do in the main menu.
echo                  [2] Type numbers in the questions that the script asks you.
echo.
echo                      If you want to skip an unity, just type 0 as the value.
echo                      For example: 0 days, 1 hour, 20 minutes and 30 seconds
echo                      will schedule the action to be executed in 1h20m:30s
echo.
echo                  [3] The program will ask you to confirm the action
echo                  [4] The action will be scheduled and then the program will exit.
echo.
echo.
echo                    By selecting the cancel option [C] on the first menu, you do the
echo                         same as typing "shutdown -a" on your command prompt.
echo.
echo.
pause
goto :mainmenu

:info
cls
echo.
echo.
echo                                                  [[Informations]]
echo.
echo.
echo                                This is the simple shutdown scheduler by Bruno Knoxx 
echo                                        [https://github.com/brunoknoxx]
echo.
echo                             This script uses the "shutdown" program as its base.
echo                            The shutdown program does not allow you to set the amount
echo                             of time in days, hours, or minutes, only in seconds.  
echo                             If you downloaded this script, you must be familiar with
echo                                              the shutdown command. 
echo                             This script converts and makes it easy to use days, hours 
echo                             and minutes as units in the shutdown command. This way
echo                             you don't need to use calc or google to convert the
echo                             value you want to use, and then manually type it in a 
echo                                                     command.
echo                             Using this script, you don't need to type anything but
echo                              numbers on the UI. After confirm your action, you will
echo                             see a message with the information you typed, and then
echo                                   the program will start the action and exit.
echo.
echo                                  You can also put this file inside C:\Windows\
echo                              to call it directly, without having to "cd" before call
echo                                    "easyscheduler" in the command prompt.
echo.
echo                              Otherwise, just double-click the file if you don't want
echo                                                  to use CMD.
echo.
pause
goto :mainmenu







