-- exception types
import Control.Exception (SomeException)

type Undefined = SomeException

type CustomerInfo = Undefined

-- no type safety no overhead
-- type CustomerId = Int

-- type safety with overhead
-- data CustomerId = CustomerId Int

-- wrapper type with less overhead
newtype CustomerId = CustomerId Int
newtype OrderId = OrderId Int
newtype WidgetCode = WidgetCode Int
newtype UnitQuantity = UnitQuantity Int
newtype KilogramQuantity = KilogramQuantity Int

-- colection of primitives
newtype UnitQuantities = UnitQuantities [Int]

-- single case union
customerId = CustomerId 42
orderId = OrderId 42

-- fails
-- customerId == orderId

-- type safe function
processCustomerId (CustomerId id) = "Processing customer with ID: " ++ show id

-- demo
main = do
  putStrLn $ processCustomerId customerId

  -- fails
  -- putStrLnproces $ sCustomerId orderId

  -- deconstruct/unwrap single case union
  let CustomerId innerValue = customerId
  putStrLn $ "Customer ID: " ++ show innerValue

  -- direct deconstruction
  let processCstmrId (CustomerId innerValue) = putStrLn $ "inner value is: " ++ show innerValue

  processCstmrId customerId
