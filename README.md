# CPUUSAGE with QT and QML

### CPU USAGE [[1]](https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&solutionid=sk65143) ###
```
$ cat /proc/stat
cpu  2015833 6264 681833 4634200 324419 120882 66439 0 0 0
cpu0 497633 810 172954 2171812 237803 46819 27184 0 0 0
cpu1 508256 1816 168542 818566 28844 24688 12898 0 0 0
cpu2 507418 1788 173007 820105 28439 25393 13435 0 0 0
cpu3 502526 1849 167328 823715 29331 23980 12920 0 0 0
intr 112830242 24 54841 0 0 0 0 0 0 1 35189 0 0 1024213 0 0 0 1541644 0 0 0 0 3 0 71885 1830525 11 0 4691117 22 1208 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
ctxt 212286923
btime 1669621872
processes 174440
procs_running 1
procs_blocked 0
softirq 62049679 464518 6306058 5718 228634 1846665 6 1237894 27555721 5686 24398779

 ```
- The very first line "cpu" aggregates the numbers in all of the other "cpuN" lines.<br/>
    These numbers identify the amount of time the CPU has spent performing different kinds of work. Time units are in USER_HZ or Jiffies (typically hundredths of a second).
    <br/>
    The meanings of the columns are as follows, from left to right:
    - 1st column : user = normal processes executing in user mode
    - 2nd column : nice = niced processes executing in user mode
    - 3rd column : system = processes executing in kernel mode
    - 4th column : idle = twiddling thumbs
    - 5th column : iowait = waiting for I/O to complete
    - 6th column : irq = servicing interrupts
    - 7th column : softirq = servicing softirqs


- The "intr" line gives counts of interrupts serviced since boot time, for each of the possible system interrupts. The first column is the total of all interrupts serviced; each subsequent column is the total for that particular interrupt.
- The "ctxt" line gives the total number of context switches across all CPUs.
- The "btime" line gives the time at which the system booted, in seconds since the Unix epoch .
- The "processes" line gives the number of processes and threads created, which includes (but is not limited to) those created by calls to the fork() and clone() system calls.
- The "procs_running" line gives the number of processes currently running on CPUs .
- The "procs_blocked" line gives the number of processes currently blocked, waiting for I/O to complete .

Calculation:<br/>
>sum up all the columns in the 1st line "cpu" :<br/>
    ( user + nice + system + idle + iowait + irq + softirq )<br/>
    this will yield 100% of CPU time<br/>
    calculate the average percentage of total 'idle' out of 100% of CPU time :<br/>
    ( user + nice + system + idle + iowait + irq + softirq ) = 100%( idle ) = X % hence<br/>
    average idle percentage <br/>
    X % = ( idle * 100 ) / ( user + nice + system + idle + iowait + irq + softirq )<br/>

>[[2]](https://www.idnt.net/en-US/kb/941772) The CPU usage can be measured over an interval of time only. This means we have to read the values from /proc/stat on a fixed interval and calculate the delta from these readings.
We can simply sum of all difference between two consecutive reads to get the time elapsed between these reads. The result is equal to multiplying USER_HZ with the number of CPUs on your system and the seconds between the reads. The difference of column 4 (idle) gives us the time spent idle. The sum minus the idle time gives us the total CPU utilization. Divided by the sum we get the percentage of CPU utilization.

# ScreenShot of project

![Alt text](./images/demo.png "Demo app")
![Alt text](./images/demo-small.png "Demo small app")

New Topic Qt and Qt Quick :
The Qt Quick module is the standard library for writing QML applications
Qt Quick module provides all the basic types necessary for creating user interfaces with QML.
The Qt Quick module provides QML API, which supplies QML types for creating user interfaces with the QML language.
C++ API for extending QML applications with C++ code.


A quick example to display some data  .. like 
CPU usage (en %) 
The AVG (en %) of the CPU usage while the application is running .
Battery status and charge percentage .
An animation when my PC is charging .
All this data comes from basic linux commands and uses signal/slots to display data in ui via c++ api .

what's next.. Qt for MCU ...