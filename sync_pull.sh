UPDATE='source .bash_profile && cd $dotfileDir && git pull > /dev/null 2>&1'

for host in 'loj' 'apollo'; do 
    ssh $host $UPDATE
done

