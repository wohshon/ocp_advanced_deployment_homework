#!/bin/bash
echo '*******************SET GUID********************'
export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc
echo 'GUID ==> '$GUID
echo '*******************RUN PLAYBOOK****************'
sudo ansible-playbook -v -f 20 homework.yaml --extra-vars GUID=$GUID
