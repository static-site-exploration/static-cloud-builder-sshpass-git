FROM gcr.io/cloud-builders/git

RUN set -e \

  # Install libraries
  && apt-get update \
  && apt-get -y install sshpass \

  # Cleanup
  && apt-get clean \
  && rm -rf \
          /var/lib/apt/lists/* \
          /var/tmp/* \
          /tmp/*
          
COPY ./sshpass-wrapped-git.bash /

ENTRYPOINT ["-c", "/sshpass-wrapped-git.bash"]
