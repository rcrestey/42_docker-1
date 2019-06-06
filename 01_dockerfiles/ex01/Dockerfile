# Run with: docker run -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -it --name teamspeak-server debian:teamspeak
FROM debian
EXPOSE 9987/udp
EXPOSE 10011 
EXPOSE 30033
COPY teamspeak_insall.sh /opt
ENTRYPOINT /opt/teamspeak_insall.sh
