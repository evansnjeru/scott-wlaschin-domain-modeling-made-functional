import Control.Exception (SomeException)

type Undefined = SomeException

type CustomerInfo = Undefined
type ShippingAddress = Undefined
type BillingAddress = Undefined
type Orderline = Undefined
type BillingAmount = Undefined
type WidgetCode = Undefined
type GizmoCode = Undefined
type UnitQuantity = Undefined
type KilogramQuantity = Undefined

data Order = Order {
  customerInfo :: CustomerInfo,
  shippingAddress :: ShippingAddress,
  billingAddress :: BillingAddress,
  orderlines :: [Orderline],
  amountToBill :: BillingAmount
}

data ProductCode
  = Widget WidgetCode
  | Gizmo  GizmoCode

data OrderQuantity
  = Unit UnitQuantity
  | Kilogram KilogramQuantity
