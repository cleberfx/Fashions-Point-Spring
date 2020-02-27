FROM gitpod/workspace-mysql



USER root
# Install custom tools, runtime, etc.


RUN apt-get update && apt-get install -y \
        git-flow \
	graphviz \
	&& apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
	
RUN wget -qO - https://packages.confluent.io/deb/4.0/archive.key | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/4.0 stable main"
RUN sudo apt-get update && sudo apt-get install confluent-platform-oss-2.11
	

USER gitpod
# Apply user-specific settings
	RUN bash -c "npm install -g generator-jhipster \
	&& npm install -g @angular/cli" 
	
 	

# Give back control
USER root
