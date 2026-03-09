# FoodFeed - Flutter Application

**FoodFeed** is a social food-review and marketplace application built with Flutter. It allows users to discover food, share reviews through posts, chat with other users, and manage their food orders. The app features a rich UI with a custom brand color palette and a smooth navigation experience.

---

## 🚀 Features

* **User Authentication**: Dedicated Login and Registration pages with form validation.
* **Dynamic Feed**: A shop/feed area where users can view food posts, including images, titles, and descriptions.
* **Post Creation**: Users can create new posts by picking images from their gallery and adding content.
* **Interactivity**: Like and comment functionality on individual post detail pages.
* **Real-time Chat UI**: A messaging interface featuring active user status bubbles and a modern chat bubble layout.
* **Profile & Settings**: Comprehensive account management including profile editing, notification settings, and app appearance configuration.
* **Drawer & Bottom Navigation**: Multi-layered navigation for a seamless user experience.

---

## 🛠️ Tech Stack

* **Framework**: [Flutter](https://flutter.dev/)
* **Language**: [Dart](https://dart.dev/)
* **State Management**: `StatefulWidget` / `setState`
* **Image Handling**: `image_picker` for camera and gallery access.
* **Icons**: Material Design Icons.

---

## 📁 Project Structure

| File | Description |
| --- | --- |
| `intro_page.dart` | The landing screen welcoming users to the app. |
| `login_page.dart` / `register_page.dart` | Authentication flow for user access. |
| `home_page.dart` | The main container managing the bottom navigation and side drawer. |
| `shop_page.dart` | The primary feed displaying food items and posts. |
| `chat_page.dart` | Real-time messaging interface with active user list. |
| `create_post.dart` | Form for creating and uploading new food reviews/posts. |
| `post_detail_page.dart` | Detailed view for specific posts with like and comment features. |
| `account_settings_page.dart` | User profile editing (Name, Email, Phone, Profile Picture). |

---

## 📸 Screen Previews

*The app uses a consistent color scheme of deep maroon (`#8B0649`) and clean whites/greys.*

---

## ⚙️ Installation

1. **Clone the repository:**
```bash
git clone https://github.com/yourusername/foodfeed.git

```


2. **Navigate to the project directory:**
```bash
cd foodfeed

```


3. **Install dependencies:**
```bash
flutter pub get

```


4. **Run the app:**
```bash
flutter run

```



---

## 🤝 Contributing

Contributions are welcome! If you'd like to improve the logic for backend integration or enhance the UI:

1. Fork the Project.
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`).
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the Branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

---

**Would you like me to help you write a `pubspec.yaml` file to match these imports?**
