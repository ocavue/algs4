# https://algs4.cs.princeton.edu/linux/

FROM openjdk:8

WORKDIR /usr/local/algs4/

RUN curl -O "https://algs4.cs.princeton.edu/code/algs4.jar"     && \
    curl -O "https://algs4.cs.princeton.edu/linux/javac-algs4"  && \
    curl -O "https://algs4.cs.princeton.edu/linux/java-algs4"   && \
    chmod 755 javac-algs4 java-algs4                            && \
    mv javac-algs4 /usr/local/bin                               && \
    mv java-algs4 /usr/local/bin

RUN curl -O "https://algs4.cs.princeton.edu/linux/checkstyle.zip"                         && \
    curl -O "https://algs4.cs.princeton.edu/linux/checkstyle-suppressions.xml"            && \
    curl -O "https://algs4.cs.princeton.edu/linux/checkstyle-{algs4,cos226,coursera}.xml" && \
    curl -O "https://algs4.cs.princeton.edu/linux/checkstyle-{algs4,cos226,coursera}"     && \
    unzip checkstyle.zip                                                                  && \
    chmod 755 checkstyle-{algs4,cos226,coursera}                                          && \
    mv checkstyle-{algs4,cos226,coursera} /usr/local/bin

# RUN unzip findbugs.zip \
#     && chmod 755 findbugs-algs4 \
#     && mv findbugs-algs4 /usr/local/bin

# RUN unzip pmd.zip \
#     && chmod 755 pmd-algs4 \
#     && mv pmd-algs4 /usr/local/bin

# RUN unzip checkstyle.zip \
#     && chmod 755 checkstyle-algs4 \
#     && mv checkstyle-algs4 /usr/local/bin

WORKDIR /usr/src/algs4
COPY entrypoint.sh entrypoint.sh
COPY HelloWorld.java HelloWorld.java
ENTRYPOINT ["bash", "entrypoint.sh"]
CMD ["HelloWorld.java"]
