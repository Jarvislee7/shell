#!/bin/bash

pbmt_dir=$1 
index_fil=$2 
sd_file=$3 
sd_extra=$4 
m_file=$5 
folder=$6

echo ""
echo ">>> step 0 of 5 : download files <<<"
cd /var/opt/ams/shared/common/ne/software/
cp L6GPAA57.280 ${index_fil}
sed -i "s/57.280/${index_fil}/g" ${index_fil}
wget -c http://aww.dsl.alcatel.be/ftp/pub/outgoing/ESAM/$folder/$sd_file 
# tail -f wget-log
wget -c http://aww.dsl.alcatel.be/ftp/pub/outgoing/ESAM/$folder/$sd_extra 
wget -c http://aww.dsl.alcatel.be/ftp/pub/outgoing/ISAMV/CDE_Profiles/$m_file
#sleep 30m

build=${index_fil:6:6}
echo " build is : " $build
run=${index_fil:6:2}
echo " run : R" $run

cd /var/opt/ams/shared/common/ne/software/
rm -rf $pbmt_dir
mkdir $pbmt_dir
cd $pbmt_dir

mkdir CDE_profiles
mkdir ISAM_migration
mkdir SHub_migration
mkdir ISAM
mkdir Migration_tool
mkdir docs
mkdir xVPS_migration
touch readme.txt

echo ""
echo ">>> step 1 of 5 <<<"
cd /var/opt/ams/shared/common/ne/software
cp $sd_file ./$pbmt_dir/ISAM/L6GQAA$build.tar
cp $index_fil ./$pbmt_dir/ISAM/
cp $m_file ./$pbmt_dir/CDE_profiles/$m_file
cp $sd_extra ./$pbmt_dir/$sd_extra

echo ""
echo ">>> step 2 of 5 <<<"
cd /var/opt/ams/shared/common/ne/software/$pbmt_dir
tar vxf $sd_extra
mv MJSHAA$run.exe MJSH.exe    
cp -i MJSH.exe ./MJSH
mv MJSHAA"$run"_i386.exe MJSH_i386
mv MJSHAA"$run"_l.exe MJSH_l
tar vcf MLXAAA$build.tar MJSH.exe MJSH MJSH_i386 MJSH_l dbtool.cfg
gzip MLXAAA$build.tar
mv MLXAAA$build.tar.gz MLXAAA$build.tgz
mv MLXAAA$build.tgz ./ISAM_migration/

echo ""
echo ">>> step 3 of 5 <<<"
mv NBTWAA$run.exe NBTW
mv NBTWAA"$run"_i386.exe NBTW_i386
mv NBTWAA"$run"_l.exe NBTW_l
tar vcf NBTTAA$build.tar NBTW NBTW_i386 NBTW_l ivpsa_dbtool.cfg
gzip NBTTAA$build.tar
mv NBTTAA$build.tar.gz NBTTAA$build.tgz
mv NBTTAA$build.tgz ./xVPS_migration/

echo ""
echo ">>> step 4 of 5 <<<"
#find V3.2.94in ./lib/version
cd /var/opt/ams/shared/common/ne/software/$pbmt_dir
tar xf $sd_extra
tar xf PBMigrationTool.tar.gz
cd ./lib
version=`awk -F\' '/^%version/{print $4}' version.pm`
vsn=${version:1:6}  #"3.3.13"
echo $vsn
cd ..
mv PBMigrationTool.tar.gz migrateIsam.V"$vsn".tgz
mv migrateIsam.V"$vsn".tgz ./Migration_tool/

#find 1.80 in ./readme
cd /var/opt/ams/shared/common/ne/software/$pbmt_dir
tar xvf Lanx_Migration_Tool.tgz
vsn2=`awk '/^ Read/{print $6}' mig_release/README.txt`
echo $vsn2
mv Lanx_Migration_Tool.tgz LanxMigTool."$vsn2".tgz 
mv LanxMigTool."$vsn2".tgz ./SHub_migration/

echo ""
echo ">>> step 5 of 5 <<<"
tar vcf ISAM$build.tar CDE_profiles/ ISAM_migration/ SHub_migration/ readme.txt ISAM Migration_tool/ docs xVPS_migration/
mv ISAM$build.tar /var/opt/ams/shared/common/ne/software/
rm /var/opt/ams/shared/common/ne/software/${sd_file}
rm /var/opt/ams/shared/common/ne/software/${sd_extra}
rm /var/opt/ams/shared/common/ne/software/${pbmt_dir}/${sd_extra}
#rm /var/opt/ams/shared/common/ne/software/wget-log*

echo ""
echo ">>> finished successfully ! <<<"

