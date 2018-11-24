#!/bin/bash
echo 'set log_plays to true'
export ANSIBLE_LOG_PATH=/var/log/ansible.log
echo '*******************SET GUID********************'
export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc
echo 'GUID ==> '$GUID
echo '*******************RUN PLAYBOOK****************'
ansible-playbook -v -f 20 homework.yaml --extra-vars GUID=$GUID --extra-vars oreg_user=$OREG_USER --extra-vars oreg_password=$OREG_PASSWORD
