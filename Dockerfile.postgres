FROM alpine

RUN addgroup -g 70 -S postgres; \
    adduser -u 70 -S -D -G postgres -H -h /var/lib/postgresql -s /bin/sh postgres; \
    mkdir -p /var/lib/postgresql; \
    chown -R postgres:postgres /var/lib/postgresql

# Installer PostgreSQL
RUN apk update && apk upgrade
RUN apk add postgresql openrc

# Créer un répertoire et changer le propriétaire
RUN mkdir /run/postgresql
RUN chown postgres:postgres /run/postgresql/

# Utiliser l'utilisateur postgres
USER postgres

# Créer un répertoire pour les données
# RUN mkdir /var/lib/postgresql/data
# RUN chmod 0700 /var/lib/postgresql/data

# Initialiser la base de données
# RUN initdb -D /var/lib/postgresql/data

# # Démarrer le serveur
# RUN pg_ctl start -D /var/lib/postgresql/data

# # Autoriser les connexions à distance
# RUN echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf
# RUN echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf

# RUN touch /etc/local.d/postgres-custom.start
# RUN chmod +x /etc/local.d/postgres-custom.start
# RUN echo "#!/bin/sh" >> /etc/local.d/postgres-custom.start
# RUN echo "su postgres -c 'pg_ctl start -D /var/lib/postgresql/data'" >> /etc/local.d/postgres-custom.start

# RUN rc-update add local default

# RUN openrc

# RUN touch /scripts.sh

# RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf
# RUN su - postgres -c "pg_ctl start -D /var/lib/postgresql/data -l /var/lib/postgresql/log.log && psql --command \"ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres';\" && psql --command \"CREATE DATABASE builddb;\""

# RUN echo "#!/bin/sh" >> /scripts.sh
# RUN echo "su postgres -c 'pg_ctl start -D /var/lib/postgresql/data'" >> /scripts.sh
# RUN echo "psql -U postgres" >> /scripts.sh

# RUN chown postgres /var/lib/postgresql/data

EXPOSE 5432


# Copie du script entrypoint.sh dans l'image
COPY entrypoint.sh /entrypoint.sh

# Rendre le script exécutable
USER root
RUN chmod +x /entrypoint.sh

USER postgres
WORKDIR /
# Définir le script entrypoint.sh comme point d'entrée
ENTRYPOINT ./entrypoint.sh
