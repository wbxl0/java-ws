FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

RUN apk add --no-cache curl

COPY target/server.jar app.jar

ENV UUID=ede41797-1b67-4147-b648-84e69d693c36 \
    NEZHA_SERVER="nz.wbxl.dpdns.org:443" \
    NEZHA_PORT="" \
    NEZHA_KEY="eQznXSiec5C101xYWVMZQiTrpVUnEAFc" \
    DOMAIN="" \
    SUB_PATH="sub" \
    NAME="" \
    WSPATH="" \
    SERVER_PORT=3000 \
    AUTO_ACCESS="true" \
    DEBUG="false"

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:${SERVER_PORT}/ || exit 1


CMD ["java", "-jar", "app.jar"]

