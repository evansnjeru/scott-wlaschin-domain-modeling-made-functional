module Types where

-- wrapper
newtype ProductCode = ProductCode String

-- record type
data Person = Person { firstName :: String, lastName :: String }

-- create a Person value
aPerson = Person { firstName = "Alex", lastName = "Adams" }

-- extract a person value
extractPerson (Person firstName lastName) = (firstName, lastName)
-- extract 2
fName = firstName aPerson
lName = lastName aPerson

-- extraction of discriminated unions
data OrderQuantity
  = UnitQuantity Int
  | KilogramQuantity Double

printQuantity (UnitQuantity uQty) = show uQty 
printQuantity (KilogramQuantity kgQty) = show kgQty 

-- composing types
newtype CheckNumber = CheckNumber Int
newtype CardNumber = CardNumber String

data CardType = Visa | Mastercard

data CreditCardInfo = CreditCardInfo {
  cardType :: CardType, 
  cardNumber :: CardNumber
}

data PaymentMethod 
  = Cash
  | Check CheckNumber
  | Card CreditCardInfo

newtype PaymentAmount = PaymentAmount Double
data Currency = EUR | USD

data Payment = Payment {
  amount :: PaymentAmount,
  currency :: Currency,
  method :: PaymentMethod
}

--type PayInvoice = UnpaidInvoice -> Payment -> PaidInvoice
type ConvertPaymentCurrency = Payment -> Currency -> Payment

-- optional values
data PersonalName = PersonalName {
  fstName :: String,
  middleInitial :: Maybe String,
  lstName :: String
} deriving(Show)

-- modeling errors
data Result a b
  = Ok a
  | Error b

data PaymentError
  = CardTypeNotRecognized
  | PaymentRejected
  | PaymentProviderOffline

--type PayInvoice = UnpaidInvoice -> Payment -> Result PaidInvoice PaymentError

-- modeling no value
-- type SaveCustomer = Customer -> ()

type NextRandom = () -> Int

-- modeling lists and collections
--data Order = Order {
--  orderId :: OrderId,
--  lines :: [OrderLine]
--}

-- create list
aList = [1, 2, 3]

-- append to list
aNewList = 0 : aList

-- pattern matching deconstruction
printList1 xs =
  case xs of
    [] -> putStrLn "list is empty"
    [x] -> putStrLn "list has one element"
    [x, y] -> putStrLn "list has two elements"
    _ -> putStrLn "list has more than two elements"

-- pattern matching deconstruction with cons constructor
printList2 xs =
  case xs of
   [] -> putStrLn "list is empty"
   (first:rest) -> putStrLn $ "list is non-empty with first element being: " ++ show first
     --putStrLn $ "list is non-empty with" ++ (show first) ++ " as first element."

-- demo
main :: IO ()
main = do
  let (firstName, lastName) = extractPerson aPerson
  putStrLn $ "First name: " ++ firstName
  putStrLn $ "Last name: " ++ lastName
  putStrLn $ "First name: " ++ fName
  putStrLn $ "Last name: " ++ lName

  let anOrderQtyInUnits = UnitQuantity 10
  let anOrderQtyInKg = KilogramQuantity 2.5
  putStrLn $ "Units: " ++ printQuantity anOrderQtyInUnits
  putStrLn $ "Kilograms: " ++ printQuantity anOrderQtyInKg

  printList1 []
  printList1 [1]
  printList1 [1, 2]
  printList1 aList 

  printList2 ([] :: [Int])
  printList2 aNewList 
