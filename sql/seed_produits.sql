-- ── SEED PRODUITS : Flamboyant ──────────────────────────────
INSERT INTO public.restaurants (nom, slug)
VALUES ('Flamboyant', 'flamboyant')
ON CONFLICT (slug) DO NOTHING;

DO $$
DECLARE rid UUID;
BEGIN
  SELECT id INTO rid FROM public.restaurants WHERE slug = 'flamboyant';
  INSERT INTO public.produits (restaurant_id, nom, description, prix, categorie, disponible) VALUES
    (rid, 'Veloute de Legumes', 'Potage du jour, creme fraiche, croutons', 8.00, 'Entrees Gourmandes', true),
    (rid, 'Carpaccio de Boeuf', 'Roquette, parmesan, capres, huile d olive', 14.00, 'Entrees Gourmandes', true),
    (rid, 'Foie Gras Poele', 'Pain d epices, compotee d oignons', 22.00, 'Entrees Gourmandes', true),
    (rid, 'Cocktail de Crevettes', 'Crevettes froides, sauce cocktail maison', 16.00, 'Entrees Gourmandes', true),
    (rid, 'Salade Chevre Chaud', 'Chevre, miel, noix, roquette', 14.00, 'Entrees Gourmandes', true),
    (rid, 'Buffet Complet Diner', 'Entrees + plat + dessert - formule soir', 40.00, 'Plats Principaux', true),
    (rid, 'Entrecote Sauce Poivre', '300g, sauce poivre vert, gratin dauphinois', 32.00, 'Plats Principaux', true),
    (rid, 'Poulet Roti aux Herbes', 'Demi-poulet, legumes rotis de saison', 22.00, 'Plats Principaux', true),
    (rid, 'Poisson du Jour', 'Selon arrivage, sauce au choix', 24.00, 'Plats Principaux', true),
    (rid, 'Magret de Canard', 'Sauce aux fruits rouges, pommes sarladaises', 35.00, 'Plats Principaux', true),
    (rid, 'Risotto aux Champignons', 'Champignons sauvages, parmesan, beurre noisette', 20.00, 'Plats Principaux', true),
    (rid, 'Pizza Margherita', 'Tomate, mozzarella, basilic frais', 18.00, 'Pizzas et Pates', true),
    (rid, 'Pizza 4 Fromages', NULL, 22.00, 'Pizzas et Pates', true),
    (rid, 'Spaghetti Carbonara', 'Lardons, creme, parmesan, oeuf', 18.00, 'Pizzas et Pates', true),
    (rid, 'Tagliatelles Fruits de Mer', 'Crevettes, calamars, sauce cremeuse', 24.00, 'Pizzas et Pates', true),
    (rid, 'Tiramisu Maison', 'Mascarpone, cafe, amaretto', 12.00, 'Desserts', true),
    (rid, 'Fondant au Chocolat', 'Coulant, boule de glace vanille', 12.00, 'Desserts', true),
    (rid, 'Panna Cotta', 'Coulis de fruits rouges', 10.00, 'Desserts', true),
    (rid, 'Creme Brulee', 'Vanille de Madagascar', 11.00, 'Desserts', true),
    (rid, 'Profiteroles', 'Glace vanille, sauce chocolat chaude', 12.00, 'Desserts', true),
    (rid, 'Cocktail Signature Flamboyant', 'Recette exclusive Flamboyant', 12.00, 'Bar et Cocktails', true),
    (rid, 'Vin Rouge (verre)', 'Selection du sommelier', 9.00, 'Bar et Cocktails', true),
    (rid, 'Champagne (flute)', 'Moet et Chandon ou equivalent', 20.00, 'Bar et Cocktails', true),
    (rid, 'Biere Importee 33cl', NULL, 6.00, 'Bar et Cocktails', true),
    (rid, 'Jus de Fruit Frais', NULL, 6.00, 'Bar et Cocktails', true)
  ON CONFLICT DO NOTHING;
END $$;
