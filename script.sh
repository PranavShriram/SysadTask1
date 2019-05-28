#!/bin/bash


#First adding master
 useradd -m MasterH

#Adding three scientists
 useradd -m Heisenberg
 useradd -m Hertz
 useradd -m Holland

#Making files of Scientists accessible to Master
 usermod -a -G Heisenberg MasterH
 chmod -R g+wx  /home/Heisenberg
 usermod -a -G Hertz MasterH
 chmod -R g+wx  /home/Hertz
 usermod -a -G Holland MasterH
 chmod -R g+wx  /home/Holland

prefix=Heisenberg

for i in {1..20}
do
  s="$prefix-Intern$i"
   useradd -m $s
   usermod -a -G $s MasterH
   usermod -a -G $s Heisenberg
  p="/home/$s"
   chmod -R g+wx $p
done

prefix=Hertz

for i in {1..20}
do
   s="$prefix-Intern$i"
    useradd -m $s
    usermod -a -G $s MasterH
    usermod -a -G $s Hertz
   p="/home/$s"
    chmod -R g+wx $p
  
done

 prefix=Holland

for i in {1..20}
do
  s="$prefix-Intern$i"
   useradd -m $s
   usermod -a -G $s MasterH
   usermod -a -G $s Holland
   p="/home/$s"
   chmod -R g+wx $p
done

#Adding directories
for i in {1..5}
do
 s=Heisenberg
 t=task
 r="/home/$s/$t$i"
  mkdir $r
  chown Heisenberg:Heisenberg $r
 for j in {1..20}
 do
  p="$s-Intern$j" 
  a="/home/$p/$t$i"
   mkdir $a
   chown $p:$p $a
 done
done 

for i in {1..5}
do
 s=Hertz
 t=task
 r="/home/$s/$t$i"
  mkdir $r
  chown Hertz:Hertz $r
 for j in {1..20}
 do
  p="$s-Intern$j" 
  a="/home/$p/$t$i"
   mkdir $a
   chown $p:$p $a
 done
done 

for i in {1..5}
do
 s=Holland
 t=task
 r="/home/$s/$t$i"
  mkdir $r
  chown Holland:Holland $r
 for j in {1..20}
 do
  p="$s-Intern$j" 
  a="/home/$p/$t$i"
   mkdir $a
   chown $p:$p $a
 done
done 

#Adding files
for i in {1..5}
do 
  for j in {1..50}
  do
   random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 128 | head -n 1) 
   s=Heisenberg
   t=task
   n="$t$i"
   p="$t$j"
   r="/home/$s/$n/Heisenberg_$p.txt"
    touch $r
    echo $random_string >> $r

  done
done   

for i in {1..5}
do 
  for j in {1..50}
  do
   random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 128 | head -n 1)
   s=Hertz
   t=task
    n="$t$i"
   p="$t$j"
   r="/home/$s/$n/Hertz_$p.txt"
    touch $r
    echo $random_string > $r

  done
done 

for i in {1..5}
do 
  for j in {1..50}
  do
   random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 128 | head -n 1)
   s=Holland
   t=task
   n="$t$i"
   p="$t$j"
   r="/home/$s/$n/Holland_$p.txt"
    touch $r
    echo $random_string >> $r

  done
done 

touch crontab.txt
chmod +x cron_tes.sh
crontab crontab.txt




#!/bin/bash

touch /home/Heisenberg/success.txt 
touch /home/Heisenberg/failure.txt
touch /home/Hertz/success.txt 
touch /home/Hertz/failure.txt
touch /home/Holland/success.txt 
touch /home/Holland/failure.txt


for i in {1..20}
do 
  touch /home/Heisenberg-Intern$i/success.txt 
  touch /home/Heisenberg-Intern$i/failure.txt
done
for i in {1..20}
do  
   touch /home/Holland-Intern$i/success.txt 
   touch /home/Holland-Intern$i/failure.txt
done
for i in {1..20}
do 
     touch /home/Hertz-Intern$i/success.txt 
     touch /home/Hertz-Intern$i/failure.txt
done