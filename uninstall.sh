#!/bin/bash
echo 'set log_plays to true'
export ANSIBLE_LOG_PATH=/var/log/ansible_uninstall.log
echo '*******************SET GUID********************'
export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc
echo 'GUID ==> '$GUID
echo '*******************RUN PLAYBOOK****************'
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/adhoc/uninstall.yml

