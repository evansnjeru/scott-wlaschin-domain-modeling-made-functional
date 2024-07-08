module CardGame where

data Suit = Club | Diamond | Spade | Heart

data Rank = Ace | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King

data Card = Card Suit Rank

data Hand = Hand [Card]

data Deck = Deck [Card]

data Player = Player { name :: String, hand :: Hand }

data Game = Game { deck :: Deck, players :: [Player] }
