#!/bin/sh


# Chemin vers le dossier de données PostgreSQL
PG_DATA="/var/lib/postgresql/data"

# Vérifie si le dossier de données PostgreSQL est initialisé
if [ -z "$(ls -A $PG_DATA)" ]; then
echo "Initialisation de la base de données PostgreSQL..."
mkdir -p $PG_DATA
chown postgres:postgres $PG_DATA
initdb -D /var/lib/postgresql/data --username=postgres --pwfile=<(echo "password")

# Ajout de configurations supplémentaires si nécessaire
echo "host all all 0.0.0.0/0 md5" >> $PG_DATA/pg_hba.conf
echo "listen_addresses='*'" >> $PG_DATA/postgresql.conf


# Démarrage du serveur PostgreSQL
postgres -D $PG_DATA
# psql --command "ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres';"

else

# Ajout de configurations supplémentaires si nécessaire
echo "host all all 0.0.0.0/0 md5" >> $PG_DATA/pg_hba.conf
echo "listen_addresses='*'" >> $PG_DATA/postgresql.conf

# Démarrage du serveur PostgreSQL
postgres -D $PG_DATA
fi


# Votre code personnalisé ici (par exemple, création de bases de données ou d'utilisateurs)

# Boucle infinie pour garder le conteneur en fonctionnement
tail -f /dev/null