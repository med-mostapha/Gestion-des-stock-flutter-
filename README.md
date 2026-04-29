# 📦 Gestion de Stock Flutter

A modern, clean stock management mobile application built with Flutter.  
Designed with a scalable architecture to support local and cloud storage.

---

## 📸 Screenshots

<table>
  <tr>
    <td align="center"><b>Onboarding</b></td>
    <td align="center"><b>Login</b></td>
    <td align="center"><b>Register</b></td>
  </tr>
  <tr>
    <td><img src="assets/screenshots/main_screen.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/login_screen.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/register_screen.jpeg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Dashboard</b></td>
    <td align="center"><b>Dashboard Charts</b></td>
    <td align="center"><b>Products</b></td>
  </tr>
  <tr>
    <td><img src="assets/screenshots/dashboard_index_screen.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/dashboard_index_screen2.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/products_screen.jpeg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Product Details</b></td>
    <td align="center"><b>Categories</b></td>
    <td align="center"><b>Category Details</b></td>
  </tr>
  <tr>
    <td><img src="assets/screenshots/products_detalis_screen.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/categories_screen.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/category_detalis_screen.jpeg" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Settings</b></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td><img src="assets/screenshots/settings_screen.jpeg" width="200"/></td>
    <td></td>
    <td></td>
  </tr>
</table>

---

## 🏗️ Architecture

This project follows a clean **layered architecture**:

.
├── core
│ ├── theme
│ │ ├── app_colors.dart
│ │ └── app_theme.dart
│ └── utils
│ └── random_colors.dart
├── data
│ ├── dummy
│ │ └── dummy_data.dart
│ ├── models
│ │ ├── category_model.dart
│ │ └── product_model.dart
│ ├── repositories
│ │ ├── category_repository.dart
│ │ ├── dummy_category_repository.dart
│ │ ├── dummy_product_repository.dart
│ │ └── product_repository.dart
│ └── services
│ └── analytics_service.dart
├── main.dart
├── providers
│ ├── category_provider.dart
│ └── product_provider.dart
├── routes
│ ├── app_router.dart
│ └── app_routes.dart
├── screens
│ ├── auth
│ │ ├── login_page.dart
│ │ └── signup_page.dart
│ ├── dashboard
│ │ ├── dashboard_layout.dart
│ │ ├── details
│ │ │ ├── category_detail_page.dart
│ │ │ └── product_detail_page.dart
│ │ └── tabs
│ │ ├── add_category_page.dart
│ │ ├── add_product_page.dart
│ │ ├── categories_page.dart
│ │ ├── index_page.dart
│ │ ├── products_page.dart
│ │ └── settings_page.dart
│ └── onboarding
│ └── main_page.dart
└── widgets
├── categories
│ └── category_card.dart
├── charts
│ ├── category_percentage_pie_chart.dart
│ └── category_stock_bar_chart.dart
├── dashboard
│ └── stats_card.dart
├── products
│ └── product_card.dart
└── ui
├── app_search_bar.dart
└── detail
├── detail_field.dart
├── detail_info_card.dart
└── detail_stock_badge.dart

### Repository Pattern

Each data source implements the same abstract contract:

```dart
abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(String id, Product product);
  Future<void> deleteProduct(String id);
}
```

Switching from Dummy to Hive to Firebase requires changing **one line** in the Provider.

---

---

## ✅ Features

### Authentication

- Onboarding welcome screen
- Login with email and password validation
- Sign up with confirm password validation
- Stack-free navigation (no back to auth from dashboard)

### Dashboard Overview

- Total products count
- Total categories count
- Total stock value in MRU
- Low stock alerts count
- Granular skeleton loading per section

### Products

- Grid view with search
- Stock status indicator (In Stock / Low / Out)
- Add new product with form validation
- Delete with confirmation dialog
- Detail page with read/edit mode toggle
- Live stock badge refresh after update

### Categories

- List view with description
- Add new category
- Delete with confirmation dialog
- Detail page with products list and analytics
- Total stock value per category

### Analytics

- Bar chart: stock value by category
- Pie chart: stock distribution percentage
- Computed via `AnalyticsService` (stateless, testable)

### Architecture

- Abstract Repository Pattern (swap data source in one line)
- Provider state management with `isLoading` and `error` state
- `Future.delayed` simulator for loading states (ready for real async)
- Reusable detail widgets shared between Product and Category pages
- Named routes with `pushReplacementNamed` (no navigation stack issues)

---

## 🔮 Roadmap

### 🔜 Next Steps

- [ ] **Hive** — local database persistence (replace DummyData)
- [ ] **Firebase Auth** — real authentication (email/password)
- [ ] **Cloud Firestore** — cloud sync for products and categories
- [ ] **Dark Mode** — theme switching via Provider
- [ ] **Product Images** — camera/gallery upload
- [ ] **Export** — PDF or Excel stock report
- [ ] **Notifications** — local alerts for low stock products
- [ ] **Filters** — filter products by category, price, stock status
- [ ] **Pagination** — lazy loading for large product lists
- [ ] **Multi-language** — Arabic / French / English support

---

## 🛠️ Tech Stack

| Technology           | Usage                      |
| -------------------- | -------------------------- |
| Flutter              | UI framework               |
| Provider             | State management           |
| fl_chart             | Charts and analytics       |
| flutter_svg          | SVG assets                 |
| intl                 | Number and date formatting |
| Hive _(planned)_     | Local database             |
| Firebase _(planned)_ | Auth + Firestore           |

---

## 🚀 Getting Started

```bash
# Clone the repo
git clone https://github.com/your-username/gestion_de_stock_flutter.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 👨‍💻 Author

**Mohamed El Moustapha**
Building real projects to master full-stack development.
