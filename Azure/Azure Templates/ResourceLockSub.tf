data "azurerm_subscription" "current" {
}

resource "azurerm_management_lock" "subscription-level" {
  name       = "subscription-level"
  scope      = data.azurerm_subscription.current.id
  lock_level = "CanNotDelete"
  notes      = "Items can't be deleted in this subscription!"
}