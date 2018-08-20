#!/bin/bash
oc login -u system:admin
oc project default
oc process group-request-template -p GROUP_NAME=beta-users | oc create -f -
oc process user-request-template -p CLIENT_LABEL_KEY="client" -p CLIENT_LABEL_VALUE="beta" -p USER_NAME=brian | oc create -f -
oc process user-request-template -p CLIENT_LABEL_KEY="client" -p CLIENT_LABEL_VALUE="beta" -p USER_NAME=betty | oc create -f -
oc adm groups add-users beta-users betty
oc process multitenant-project-request -p PROJECT_DESCRIPTION='' -p PROJECT_DISPLAYNAME='' -p PROJECT_NAME='beta' -p PROJECT_ADMIN_USER='brian' -p GROUP_NAME=beta-users -p CLIENT_NODE_SELECTOR='client=beta' | oc create -f -
oc adm policy add-role-to-group edit beta-users -n beta
