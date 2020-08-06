FROM node:14.7.0

ENV TERRAFORM_CDK_VERSION=0.0.13
ENV CONSUL_TEMPLATE_VERSION=0.25.1

RUN cd /usr/local/bin && \
    curl -o consul-template.zip https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    unzip consul-template.zip && \
    npm install -g cdktf-cli@${TERRAFORM_CDK_VERSION}

COPY ./plan.sh /usr/local/bin

WORKDIR /code