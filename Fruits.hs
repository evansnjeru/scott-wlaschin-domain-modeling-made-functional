module Fruits where


data AppleVariety 
  = GoldenDelicious
  | GrannySmith
  | Fuji

data BananaVariety 
  = Cavendish
  | GrosMichel
  | Manzano

data CherryVariety 
  = Montmorency
  | Bing

data FruitSalad = FruitSalad {
  apple :: AppleVariety,
  banana :: BananaVariety,
  cherries :: CherryVariety
}

data FruitSnack 
  = Apple AppleVariety 
  | Banana BananaVariety 
  | Cherries CherryVariety
