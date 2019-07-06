FROM openjdk:8

WORKDIR /tmp/algs4

RUN curl -O "https://algs4.cs.princeton.edu/code/algs4.jar" \
    && curl -O "https://algs4.cs.princeton.edu/linux/javac-algs4" \
    && curl -O "https://algs4.cs.princeton.edu/linux/java-algs4" \
    && chmod 755 javac-algs4 java-algs4 \
    && mv javac-algs4 /usr/local/bin \
    && mv java-algs4 /usr/local/bin

RUN curl -O "https://algs4.cs.princeton.edu/linux/findbugs.zip" \
    && curl -O "https://algs4.cs.princeton.edu/linux/findbugs.xml" \
    && curl -O "https://algs4.cs.princeton.edu/linux/findbugs-algs4" \
    && unzip findbugs.zip \
    && chmod 755 findbugs-algs4 \
    && mv findbugs-algs4 /usr/local/bin

RUN curl -O "https://algs4.cs.princeton.edu/linux/pmd.zip" \
    && curl -O "https://algs4.cs.princeton.edu/linux/pmd.xml" \
    && curl -O "https://algs4.cs.princeton.edu/linux/pmd-algs4" \
    && unzip pmd.zip \
    && chmod 755 pmd-algs4 \
    && mv pmd-algs4 /usr/local/bin

RUN curl -O "https://algs4.cs.princeton.edu/linux/checkstyle.zip" \
    && curl -O "https://algs4.cs.princeton.edu/linux/checkstyle-suppressions.xml" \
    && curl -O "https://algs4.cs.princeton.edu/linux/checkstyle-algs4.xml" \
    && curl -O "https://algs4.cs.princeton.edu/linux/checkstyle-algs4" \
    && unzip checkstyle.zip \
    && chmod 755 checkstyle-algs4 \
    && mv checkstyle-algs4 /usr/local/bin

WORKDIR /usr/src/algs4
COPY entrypoint.sh entrypoint.sh
COPY HelloWorld.java HelloWorld.java
ENTRYPOINT ["bash", "entrypoint.sh"]
CMD ["HelloWorld.java"]
