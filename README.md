# GroceryMart – Flutter Grocery Shopping App

A clean, simple grocery shopping  Flutter project. The project demonstrates good app structure, state management using Provider, and local cart persistence using SharedPreferences.

## Features

###  Home Screen
- Featured products and categories
- Add products to cart

###  Cart Screen
- View cart items
- Quantity adjustment (+/-)
- Remove items
- Total price calculation
- Checkout button (opens bottom sheet)
- Persistent cart using SharedPreferences

###  Checkout Bottom Sheet
- Delivery method, Payment, Promo Code
- Total cost summary
- “Place Order” button

###  Order Accepted Screen
-  Success message
- "Track Order" and "Back to Home" buttons

##  Tech Stack

- **Framework**: Flutter (Latest stable)
- **State Management**: Provider
- **Persistence**: SharedPreferences
- **Architecture**: Feature-first with clean UI/business logic separation
- **Navigation**: Flutter's Navigator

##  Folder Structure

```
lib/
├── features/
│   ├── home/
│   │   └── home_screen.dart
│   ├── cart/
│   │   ├── cart_screen.dart
│   │   └── checkout_bottomsheet.dart
│   ├── order/
│   │   └── order_accepted_screen.dart
├── models/
│   └── product_model.dart
├── providers/
│   └── cart_provider.dart
├── main.dart
```

##  State Management

- Managed using `Provider`
- `CartProvider` handles cart operations
- Quantity updates and removal work seamlessly
- Cart is restored on app restart using SharedPreferences

##  Sample Product Data

- 10 products across 3–4 categories
- Each includes: `id`, `name`, `price`, `image`, `category`

##  Getting Started

```bash
git clone https://github.com/rumanalikhan/grocery_mart_must_flutter_project.git
cd grocery_mart_must_flutter_project
flutter pub get
flutter run
```

## Tested On

- Android Emulator  
- Android Physical Device

## 🙋‍♀️  
Made with Flutter by [Ruman Ali](https://github.com/rumanalikhan)