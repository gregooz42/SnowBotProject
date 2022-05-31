local objectRessources = {}

function objectRessources.getRessources()
	printF.debug("objectRessources.lua", "getRessources()")

local ressources = {

-- 500 000 Kamas
{ id = 2500, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Kolérat Mort x 100
{ id = 650, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Duvet de Bourdard x 100


-- 300 000 Kamas

{ id = 2505, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Croquette x 100
{ id = 6478, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Makroute Déchiqueté x 100
{ id = 2515, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Groin de Sanglier des Plaines x 100


-- 200 000 Kamas
{ id = 2277, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Linceul x 100
{ id = 546, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Pierre de Saphir x 100
{ id = 6842, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Pétale de Rose Obscure x 100
{ id = 2554, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Côtes de Porkass x 100
{ id = 13491, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Relique Familiale x 100
{ id = 2275, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Cuir de Porkass x 100

-- 100 000 Kamas
{id = 844, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Oeuf de Dragoeuf Ardoise x 100
{id = 757, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Gelée Bleutée x 100
{id = 365, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Pattes d'arakne x 100
{id = 307, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Ailes de moskito x 100
{id = 2266, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Lait de Cochon de Lait x 100
{id = 2646, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Slip en cuir de Cochon de Lait x 100

-- 75 000 Kamas
{id = 368, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Gelée à la Fraise x 100
{id = 2662, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Bave de Rose Démoniaque x 100
{id = 1889, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Plume de Crowneille x 100
{ id = 545, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Pierre de Cristal x 100

-- 50 000 Kamas
{ id = 2506, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Grelot x 100

{ id = 845, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Oeuf de Dragoeuf Argile x 100
{ id = 308, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Coquille de Dragoeuf Calcaire x 100
{ id = 842, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Coquille de Dragoeuf Argile x 100
{ id = 843, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Coquille de Dragoeuf Charbon x 100
{ id = 1129, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Coquille de Dragoeuf Ardoise x 100

{ id = 1777, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Bout de Blop Indigo x 100
{ id = 1778, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Fleur de Blop Indigo x 100
{ id = 1776, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Fleur de Blop Griotte x 100
{ id = 1774, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Fleur de Blop Reinette x 100
{ id = 1772, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Fleur de Blop Coco x 100
{ id = 1775, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Bout de Blop Griotte x 100
{ id = 479, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Ivoire x 100
{ id = 378, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Sporme du champchamp x 100
{ id = 1891, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Peau de serpentin x 100
{ id = 2508, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Venin de Serpentin x 100
{ id = 14945, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Vielle partition x 100
{ id = 1526, lot = 10, min = 1, price = 0, sale = 0, del = false },  -- Métaria rouge x 10
{ id = 2500, lot = 10, min = 1, price = 0, sale = 0, del = false },  -- Kolérat Mort x 10


-- 25 000 Kamas
{ id = 2502, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Papatte de Croc Gland x 100
{ id = 2150, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Graine de Scorbute x 100
{ id = 2515, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Groin de Sanglier des Plaines x 100
{ id = 387, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Défense du Sanglier x100
{ id = 648, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Aile de Bourdard x 100
{ id = 1770, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Bout de Blop Coco x 100
{ id = 1773, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Bout de Blop Reinette x 100
{ id = 1673, lot = 100, min = 1, price = 0, sale = 0, del = false },  -- Patte d'Arakne Magique x 100
{ id = 546, lot = 10, min = 1, price = 0, sale = 0, del = false }, -- Pierre de Saphir x 10
{ id = 2505, lot = 10, min = 1, price = 0, sale = 0, del = false },  -- Croquette x 10
{ id = 650, lot = 10, min = 1, price = 0, sale = 0, del = false },  -- Duvet de Bourdard x 10
{ id = 2275, lot = 10, min = 1, price = 0, sale = 0, del = false }, -- Cuir de Porkass x 10
{ id = 2554, lot = 10, min = 1, price = 0, sale = 0, del = false }, -- Côtes de Porkass x 10
{ id = 2318, lot = 10, min = 1, price = 0, sale = 0, del = false },  -- Feuille de Rose Obscure x 10
{ id = 6842, lot = 10, min = 1, price = 0, sale = 0, del = false }, -- Pétale de Rose Obscure x 10

-- 20 000 Kamas
{ id = 14944, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Sueur Froide de Fantôme x 100

-- 15 0000 Kamas
{ id = 309, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Pétale de Rose Démoniaque x100
{ id = 16522, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Peau de Gloot x100

-- 10 000 KAMAS
{ id = 1984, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Cendres Éternelles x100
{ id = 394, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Noisette x100
{ id = 643, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Fil de Soie x100
{ id = 901, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- - Cuir du Cochon de Lait x100
{ id = 407, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Pic du Prespic x100
{ id = 386, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Groin de Sanglier x100
{ id = 2553, lot = 1, min = 1, price = 0, sale = 0, del = false }, -- Gros Boulet x 1
-- Divers
{ id = 460, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Chêne x 100
{ id = 311, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Eau x 100

-- Pious
{id = 6897, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Plume de piou Bleu x 100
{id = 6898, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Plume de piou Violet x 100
{id = 6899, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Plume de piou Vert x 100
{id = 6900, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Plume de piou Rouge x 100
{id = 6902, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Plume de piou Jaune x 100
{id = 6903, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Plume de piou Rose x 100

-- peau de larve
{id = 2563, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- peau de larve jaune x 100
{id = 362, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- peau de larve bleue x 100
{id = 364, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- peau de larve verte x 100
{id = 363, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- peau de larve orange x 100

-- Campagne d'amakna
{id = 377, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Epine de champchamp x 100
{id = 378, lot = 10, min = 1, price = 0, sale = 0, del = false}, -- Sporme du champchamp x 10
{id = 300, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Graine de pavot x 100
{id = 16487, lot = 10, min = 1, price = 0, sale = 0, del = false}, -- Bois vermoulu x 10

-- 5000 KAMAS
{id = 2484, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Trident Cassé x 100

-- Calanques astrub
{id = 13726, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Conque Marine x 100
{id = 8680, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Écaille poisseuse x 100
{id = 13727, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Crème à bronzer x 100
{id = 13494, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Nageoire de Compétition x 100
{id = 13487, lot = 100, min = 1, price = 0, sale = 0, del = false}, -- Serviette de Plage x 100


{ id = 428, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Sauge x 100

{id = 1794, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Carpe d'Iem x100
{ id = 1750, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Poisson Pané x 100
{ id = 603, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Poisson Chaton x 100
{ id = 1844, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Truite x 100

{id = 287, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Graine de sésame x100

-- Alchi
{ id = 421, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Ortie x 100
{ id = 380, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Menthe x 100

-- Bucheron
{ id = 303, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Frêne x 100
{ id = 476, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Noyer x 100

-- 1000 KAMAS

-- Pecheur
{ id = 1757, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Crabe x 100
{ id = 1782, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Goujon x 100
{ id = 598, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Greuvette x 100

{ id = 395, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Trèfle x 100

{ id = 473, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Chataigner x 100
-- Paysan
{ id = 289, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Blé x 100
{ id = 400, lot = 100, min = 1, price = 0, sale = 0, del = false }, -- Orge x 100

}

	return ressources
end

return objectRessources
