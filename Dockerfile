FROM ghcr.io/kube-logging/custom-runner:v0.6.0 as custom-runner

FROM quay.io/prometheus/node-exporter:v1.5.0

COPY --from=custom-runner /runner /

USER root

RUN mkdir -p /prometheus/node_exporter/textfile_collector

COPY buffer-size.sh /prometheus/buffer-size.sh
RUN chmod 0744 /prometheus/buffer-size.sh

WORKDIR /

ENTRYPOINT ["/runner"]
