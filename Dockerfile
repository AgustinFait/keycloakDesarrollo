FROM quay.io/keycloak/keycloak:26.4.4

# Configuraciones de build primero
ENV KC_DB=dev-mem
ENV KC_METRICS_ENABLED=false
ENV KC_HEALTH_ENABLED=false
ENV KC_HOSTNAME_STRICT=false

# Build de Quarkus tras setear variables
RUN /opt/keycloak/bin/kc.sh build

# ENV de runtime
ENV JAVA_OPTS="\
-XX:+UseSerialGC \
-Xms128m \
-Xmx350m \
-Djava.awt.headless=true \
"

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
