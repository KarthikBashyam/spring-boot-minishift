# spring-boot-minishift

This is a sample spring boot application deployed on OKD (Openshift).

oc process -f minishift-build.json | oc create -f -

oc start-build spring-boot-helloworld
