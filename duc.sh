#! /bin/bash
starttime=$(date +%Y-%m-%d\ %H:%M:%S)

echo $starttime >> /home/admin/log/extendDucnet.log
echo "start time: " $starttime

for i in 95155 95156 95302 95303 95328 92586
do
        echo "####################################################################"
        echo "client: " $i
        echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/$i/extend" >> /home/admin/log/extendDucnet.log
        curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/$i/extend >> /home/admin/log/extendDucnet.log
        curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/$i/extend
        echo "####################################################################"
        echo ""
done


#echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95155/extend" >> /home/admin/log/extendDucnet.log
#curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95155/extend >> /home/admin/log/extendDucnet.log
#echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95156/extend" >> /home/admin/log/extendDucnet.log
#curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95156/extend >> /home/admin/log/extendDucnet.log
#echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95302/extend" >> /home/admin/log/extendDucnet.log
#curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95302/extend >> /home/admin/log/extendDucnet.log
#echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95303/extend" >> /home/admin/log/extendDucnet.log
#curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95303/extend >> /home/admin/log/extendDucnet.log
#echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95328/extend" >> /home/admin/log/extendDucnet.log
#curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/95328/extend >> /home/admin/log/extendDucnet.log
#echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/92586/extend" >> /home/admin/log/extendDucnet.log
#curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/92586/extend >> /home/admin/log/extendDucnet.log

