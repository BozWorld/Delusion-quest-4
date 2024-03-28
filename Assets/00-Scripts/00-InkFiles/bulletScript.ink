EXTERNAL DelusionShift(mood)

VAR playerHP = 4
VAR bulletPWR = 0
VAR bulletCLR = "empty"

VAR divA=->prologue
VAR divB=->prologue
VAR divC=->prologue
VAR divD=->prologue
VAR divE=->prologue

===function TakeDamage
~playerHP--

===function SetMana(CLR)
{SetPWR()}
{SetCLR(CLR)}
~return

===function SetPWR
~bulletPWR++

{bulletPWR>=2:
~bulletPWR = 2
}


===function SetCLR(CLR)
{bulletCLR:
-"empty":
    {
        -CLR=="red":
        ~bulletCLR="red"
        
        -CLR =="blue":
        ~bulletCLR="blue"
    }
-"red":
    {
        -CLR=="red":
        ~bulletCLR="red"
        
        -CLR =="blue":
        ~bulletCLR="violet"
    }
-"blue":
    {
        -CLR=="red":
        ~bulletCLR="violet"
        
        -CLR =="blue":
        ~bulletCLR="blue"
    }
-"violet":
    {
        -CLR=="red":
        ~bulletCLR="red"
        
        -CLR =="blue":
        ~bulletCLR="blue"
    }
}
