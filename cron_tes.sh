for i in {1..20};
do

   for j in {1..5};
   do 
     
     
       var=$(((RANDOM%50)+1));
       s=Heisenburg;
       t=task  ;
       p="$t$var";
       r="/home/$s/task$j/Heisenberg_$p.txt";
       echo $r;
       e="/home/Heisenberg-Intern$i/task$j";
       echo $e;
       cp $r $e;
       
   
    done  
done

for i in {1..20};
do

   for j in {1..5};
   do 
     
   
       var=$(((RANDOM%50)+1));
       s=Hertz;
       t=task;
       p="$t$var";
       r="/home/Hertz/task$j/Hertz_$p.txt";
       echo $r;
      
       e="/home/Hertz-Intern$i/task$j";
       echo $e;
       cp $r $e;
       
     
    done  
done

for i in {1..20};
do

   for j in {1..5};
   do 
     
    
       var=$(((RANDOM%50)+1));
       s=Holland;
       t=task;
       echo $i
       p="$t$var";
       r="/home/Holland/task$j/Holland_$p.txt";
       echo $r;
       e="/home/Holland-Intern$i/task$j";
       echo $e;
       cp $r $e;
       
  
    done  
done
