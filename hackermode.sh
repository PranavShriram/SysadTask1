
#!/bin/bash


grep -i "Hertz -> Heisenberg" logs.txt >>/home/Hertz/failure.txt
grep -i "Hertz -> Holland" logs.txt >>/home/Hertz/failure.txt
grep -i "Heisenberg -> Holland" logs.txt >>/home/Heisenberg/failure.txt
grep -i "Heisenberg ->Hertz" logs.txt >>/home/Heisenberg/failure.txt
grep -i "Holland -> Heisenberg" logs.txt >>/home/Holland/failure.txt
grep -i "Holland -> Hertz" logs.txt >>/home/Holland/failure.txt
grep -i "MasterH ->" logs.txt >>/home/MasterH/success.txt
grep -i "Heiseberg-> MasterH" logs.txt >>/home/Heisenberg/failure.txt 
grep -i "Hertz-> MasterH" /home/Hertz/failure.txt 
grep -i "Holland-> MasterH" /home/Holland/failure.txt

for i in {1..20}
do
 grep -i "Holland-Intern$i ->" logs.txt >>/home/Holland-Intern$i/failure.txt
 grep -i "Heisenberg-Intern$i ->" logs.txt >>/home/Heisenberg-Intern$i/failure.txt
 grep -i "Hertz-Intern$i ->" logs.txt >>/home/Hertz-Intern$i/failure.txt
 grep -i "Heisenberg -> Heisenberg-Intern$i" logs.txt >>/home/Heisenberg/success.txt
 grep -i "Holland -> Holland-Intern$i " logs.txt >>/home/Holland/success.txt
 grep -i "Hertz -> Hertz-Intern$i" logs.txt >>/home/Hertz/success.txt
 grep -i "Heisenberg -> Hertz-Intern$i" logs.txt >>/home/Heisenberg/failure.txt
 grep -i "Heisenberg -> Holland-Intern$i" logs.txt >>/home/Heisenberg/failure.txt
 grep -i "Hertz -> Heisenberg-Intern$i" logs.txt >>/home/Hertz/failure.txt
 grep -i "Hertz -> Holland-Intern$i" logs.txt >>/home/Hertz/failure.txt
 grep -i "Holland -> Heisenberg-Intern$i" logs.txt >>/home/Holland/failure.txt
 grep -i "Holland -> Hertz-Inertn$i" logs.txt >>/home/Holland/failure.txt
done

count1=0
count2=0
count3=0


awk '/-> Holland-Intern/{++count} END {print count}' logs.txt 
awk '/-> Holland-Intern/{print $1,$2}' logs.txt 
awk '/-> Heisenberg-Intern/{++count} END {print count}' logs.txt 
awk '/-> Heisenberg-Intern/{count2++}' logs.txt
awk '/-> Heisenberg-Intern/{print $1,$2 }' logs.txt
awk '/-> Hertz-Intern/{++count} END {print count}' logs.txt 
awk '/-> Hertz-Intern/{count2++}' logs.txt
awk '/-> Hertz-Intern/{print $1,$2 }' logs.txt

