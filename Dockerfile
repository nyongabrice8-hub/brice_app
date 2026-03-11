# Dockerfile pour Brice App (CodeIgniter)
FROM php:8.2-cli

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Installer Composer depuis l'image officielle
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le répertoire de travail
WORKDIR /app

# Copier tout le projet
COPY . /app

# Installer les dépendances PHP
RUN composer install --no-dev --optimize-autoloader

# Exposer le port pour Render
EXPOSE 10000

# Démarrer le serveur PHP intégré
CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]
