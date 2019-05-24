# spring-boot-minishift

This is a sample spring boot application deployed on OKD (Minishift).

Start Minishift by running the below command

minishift start

Create docker secret.

oc create secret docker-registry external-registry --docker-username={username} --docker-password={password} --docker-email={email} --docker-server=registry.hub.docker.com

oc secrets add serviceaccount/builder secrets/external-registry

Create the minishift template with build config steps using the below command.

oc process -f minishift-build.json | oc create -f -

Trigger the build using the below command.

oc start-build spring-boot-helloworld
