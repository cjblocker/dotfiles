UPDATE="source .bash_profile && cd $dotfileDir && git pull"

for host in 'loj' 'apollo'; do 
    ssh $host $UPDATE
done

