#! /bin/bash
starttime=$(date +%Y-%m-%d\ %H:%M:%S)

echo $starttime >> /home/admin/log/extendDucnet.log
echo "start time: " $starttime

for i in 530560 530561 530562 531001 544084 95302 95328 96116 96133 96318 96502 502231 526710 528632 528687 528688 528968 530611 534862 543686  543687
do
        echo "####################################################################"
        echo "client: " $i
        echo "curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/$i/extend" >> /home/admin/log/extendDucnet.log
        curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/$i/extend >> /home/admin/log/extendDucnet.log
        curl https://ducttape-api11.prod.rdu1.west.isilon.com/api/v1.0/clusters/$i/extend
        curl https://ducttape.west.isilon.com/api/v2.0/clusters/$i/extend
        curl https://ducttape.west.isilon.com/api/v2.0/clients/$i/extend
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

