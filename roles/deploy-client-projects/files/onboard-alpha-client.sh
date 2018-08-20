#!/bin/bash
oc login -u system:admin
oc project default
oc process group-request-template -p GROUP_NAME=alpha-users | oc create -f -
oc process user-request-template -p CLIENT_LABEL_KEY="client" -p CLIENT_LABEL_VALUE="alpha" -p USER_NAME=amy | oc create -f -
oc process user-request-template -p CLIENT_LABEL_KEY="client" -p CLIENT_LABEL_VALUE="alpha" -p USER_NAME=andrew | oc create -f -
oc adm groups add-users alpha-users andrew
oc process multitenant-project-request -p PROJECT_DESCRIPTION='' -p PROJECT_DISPLAYNAME='' -p PROJECT_NAME='alpha' -p PROJECT_ADMIN_USER='amy' -p GROUP_NAME=alpha-users -p CLIENT_NODE_SELECTOR='client=alpha' | oc create -f -
oc adm policy add-role-to-group edit alpha-users -n alpha
