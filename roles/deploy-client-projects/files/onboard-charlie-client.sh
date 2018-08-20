#!/bin/bash
oc login -u system:admin
oc project default
oc process group-request-template -p GROUP_NAME=charlie-users | oc create -f -
oc process user-request-template -p CLIENT_LABEL_KEY="client" -p CLIENT_LABEL_VALUE="charlie" -p USER_NAME=candy | oc create -f -
oc process user-request-template -p CLIENT_LABEL_KEY="client" -p CLIENT_LABEL_VALUE="charlie" -p USER_NAME=cain | oc create -f -
oc adm groups add-users charlie-users cain
oc process multitenant-project-request -p PROJECT_DESCRIPTION='' -p PROJECT_DISPLAYNAME='' -p PROJECT_NAME='charlie' -p PROJECT_ADMIN_USER='candy' -p GROUP_NAME=charlie-users -p CLIENT_NODE_SELECTOR='' | oc create -f -
oc adm policy add-role-to-group edit charlie-users -n charlie
