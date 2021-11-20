FROM docker.elastic.co/beats/packetbeat:7.15.2
#COPY packetbeat.yml /usr/share/packetbeat/packetbeat.yml
USER root
RUN chown root:packetbeat /usr/share/packetbeat/packetbeat.yml
WORKDIR /usr/share/packetbeat
RUN setcap cap_net_raw=ep /usr/share/packetbeat/packetbeat

USER packetbeat
CMD ["./packetbeat", "-e", "-c=packetbeat.yml"]
