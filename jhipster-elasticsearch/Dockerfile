FROM elasticsearch:5.0.0

VOLUME ["/usr/share/elasticsearch/data"]

# Install Python and Curator
RUN \
  apt-get update && \
  apt-get install -y cron python python-dev python-pip python-setuptools supervisor && \
  apt-get clean && \ 
  pip install elasticsearch-curator==4.2.3.post1

# Add Supervisor's configuration
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add Curator's configuration
ADD curator/curator.yml /curator/curator.yml
# Add Curator's actions
ADD curator/close_indices.yml /curator/close_indices.yml

# Add crontab file to the cron directory
ADD curator/crontab /etc/cron.d/curator-cron
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/curator-cron
# Load curator's cron job definition
RUN crontab /etc/cron.d/curator-cron

# Create the log file to be able to run tail
RUN touch /var/log/curator.log

# Run supervisord on container startup
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
