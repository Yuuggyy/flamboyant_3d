-- PARAMÈTRES RESTAURANT Flamboyant
CREATE TABLE IF NOT EXISTS public.parametres (
  id             INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  nom_restaurant TEXT DEFAULT 'Flamboyant',
  logo_url       TEXT,
  adresse        TEXT DEFAULT '14, Avenue de la Mongala, Gombe, Kinshasa',
  telephone      TEXT DEFAULT '+243 839 555 339',
  whatsapp       TEXT DEFAULT '243839555339',
  horaires       TEXT DEFAULT 'Tous les jours 06h30 - 23h45',
  updated_at     TIMESTAMPTZ DEFAULT NOW()
);
INSERT INTO public.parametres (id, nom_restaurant, adresse, telephone, whatsapp, horaires)
VALUES (1, 'Flamboyant', '14, Avenue de la Mongala, Gombe, Kinshasa', '+243 839 555 339', '243839555339', 'Tous les jours 06h30 - 23h45')
ON CONFLICT (id) DO NOTHING;
CREATE TRIGGER trg_parametres_updated_at BEFORE UPDATE ON public.parametres FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
ALTER TABLE public.parametres ENABLE ROW LEVEL SECURITY;
CREATE POLICY "param_select" ON public.parametres FOR SELECT USING (true);
CREATE POLICY "param_update" ON public.parametres FOR UPDATE USING (auth.uid() IN (SELECT id FROM public.admin_profiles));
SELECT 'Flamboyant — paramètres OK' AS status;
