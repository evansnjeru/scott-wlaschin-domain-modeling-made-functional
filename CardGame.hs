module CardGame where

data Suit = Clubs | Diamonds | Spades | Hearts

data Rank = Ace | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King

type Card = (Suit, Rank)

type Hand = [Card]

type Deck = [Card]

data Player = Player { name :: String, hand :: Hand }

data Game = Game { deck :: Deck, players :: [Player] }

type Deal = Deck -> (Deck, Card)

type PickupCard = (Hand, Card) -> Hand
