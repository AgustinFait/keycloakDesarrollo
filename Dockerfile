FROM quay.io/keycloak/keycloak:26.4.4

# Usar el runtime para evitar build de Quarkus
RUN /opt/keycloak/bin/kc.sh build

# Reducir al mínimo servicios que consumen RAM
ENV KC_METRICS_ENABLED=false
ENV KC_HEALTH_ENABLED=false
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_ENABLED=true

# Usar base embebida (más liviana)
ENV KC_DB=dev-mem

# JVM al límite
ENV JAVA_OPTS="\
-XX:+UseSerialGC \
-XX:MaxRAMPercentage=70 \
-Xms128m \
-Xmx350m \
-Djava.awt.headless=true \
"

# Exponer puerto
EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
