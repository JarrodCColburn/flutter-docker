FROM jarrodcolburn/android:28.0.3
ARG FLUTTER_VERSION=1.7.8+hotfix.3-stable

RUN apt-get update \
    && apt-get install -y xz-utils unzip libglu1-mesa lib32stdc++6
RUN curl -o  /tmp/flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v${FLUTTER_VERSION}.tar.xz \
    && tar -xvf /tmp/flutter.tar.xz -C /usr/local \
    && /usr/local/flutter/bin/fluuter doctor \ 
    && rm /tmp/*

ENV FLUTTER_ROOT=/usr/local/flutter
ENV PATH=${PATH}:${FLUTTER_ROOT}/bin
ENV PUB_CACHE=~/.pub-cache
# add dart executables 
ENV PATH=${PATH}:${FLUTTER_ROOT}/bin/cache/dart-sdk/bin