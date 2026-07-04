# CallForge

Cockpit de cold call — file d'appels intelligente, classification en 1 tap, enregistrements, dashboard.

Front statique (GitHub Pages) + [Supabase](https://supabase.com) (base de données, auth, stockage audio).

## Installation (une seule fois)

1. Crée un projet sur [supabase.com](https://supabase.com) (gratuit).
2. Dans le projet : **SQL Editor** → colle le contenu de `supabase_schema.sql` → **Run**.
3. **Authentication → Users → Add user** : crée ton email + mot de passe.
4. Ouvre l'app → colle l'**URL du projet** et la **clé anon** (Settings → API).
5. Connecte-toi, puis importe ton CSV de contacts au premier lancement.

Aucune donnée ni clé n'est stockée dans ce dépôt : la configuration vit dans ton navigateur, les données dans ton projet Supabase (protégées par login + RLS).
