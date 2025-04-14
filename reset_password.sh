#!/bin/bash

# Demander le nom d'utilisateur
echo "Entrez le nom de l'utilisateur pour réinitialiser le mot de passe :"
read username

# Vérifier si l'utilisateur existe
if id "$username" &>/dev/null; then
    echo "L'utilisateur $username existe. Réinitialisation du mot de passe..."
else
    echo "L'utilisateur $username n'existe pas."
    exit 1
fi

# Demander le nouveau mot de passe
echo "Entrez le nouveau mot de passe pour l'utilisateur $username :"
read -s new_password

# Appliquer le nouveau mot de passe
echo "$username:$new_password" | sudo chpasswd

# Vérifier si le mot de passe a été réinitialisé avec succès
if [ $? -eq 0 ]; then
    echo "Le mot de passe de $username a été réinitialisé avec succès."
else
    echo "Échec de la réinitialisation du mot de passe."
    exit 1
fi