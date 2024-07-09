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

-- demo
main :: IO ()
main = do
  let (firstName, lastName) = extractPerson aPerson
  putStrLn $ "First name: " ++ firstName
  putStrLn $ "Last name: " ++ lastName
  putStrLn $ "First name: " ++ fName
  putStrLn $ "Last name: " ++ lName

