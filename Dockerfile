FROM quay.io/keycloak/keycloak:26.4.4

# Desactivar features que consumen memoria
ENV KC_HEALTH_ENABLED=false
ENV KC_METRICS_ENABLED=false


ENV KC_DB=dev-mem

# Limitar fuertemente la JVM
ENV JAVA_OPTS="-XX:MaxRAM=700m -Xmx700m -Xms256m -Djava.awt.headless=true"



# Ejecutar en modo producción, que usa menos RAM que start-dev
CMD ["/opt/keycloak/bin/kc.sh", "start", "--http-port=8080"]
