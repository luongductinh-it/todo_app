# ✅ Firebase Todo App - Ứng Dụng Quản Lý Công Việc Cá Nhân

Ứng dụng quản lý công việc được xây dựng bằng **Flutter** và **Firebase**, hỗ trợ xác thực người dùng, quản lý task theo thời gian thực và phân loại công việc theo trạng thái hoàn thành.

## ✨ Tính Năng

- **🔐 Xác Thực Người Dùng** - Đăng ký, đăng nhập và đăng xuất bằng Firebase Authentication
- **📝 Quản Lý Task** - Tạo mới, cập nhật và xoá task cá nhân
- **⚡ Đồng Bộ Thời Gian Thực** - Danh sách task cập nhật realtime với Cloud Firestore
- **✅ Theo Dõi Trạng Thái** - Đánh dấu task đã hoàn thành hoặc chưa hoàn thành
- **📂 Phân Loại Task** - Xem tất cả task, task hoàn thành và task chưa hoàn thành
- **🧭 Điều Hướng Theo Trạng Thái Đăng Nhập** - Tự động chuyển hướng bằng GoRouter
- **👤 Hồ Sơ Tài Khoản** - Xem thông tin email và UID của tài khoản hiện tại

## 🛠️ Công Nghệ Sử Dụng

### Frontend
- **Flutter**
- **Dart**
- **Material Design**

### Backend / Services
- **Firebase Core** - Khởi tạo Firebase trong ứng dụng
- **Firebase Authentication** - Xác thực người dùng bằng email/password
- **Cloud Firestore** - Lưu trữ và đồng bộ dữ liệu task theo thời gian thực

### State Management & Navigation
- **Riverpod** - Quản lý state và dependency injection
- **Riverpod Generator** - Sinh provider tự động
- **GoRouter** - Điều hướng và bảo vệ route theo auth state

### Dependencies Chính
- `firebase_core` - Thư viện Firebase cốt lõi
- `firebase_auth` - Xác thực người dùng
- `cloud_firestore` - Cơ sở dữ liệu thời gian thực
- `flutter_riverpod` - State management
- `riverpod_annotation` - Annotation cho Riverpod
- `riverpod_generator` - Code generation cho provider
- `go_router` - Điều hướng màn hình
- `intl` - Định dạng ngày tháng
- `font_awesome_flutter` - Icon social UI
- `google_fonts` - Hỗ trợ font chữ

## 📁 Cấu Trúc Dự Án

```text
lib/
├── main.dart                                               # App entry point
├── firebase_options.dart                                   # Firebase configuration
├── common_widgets/                                         # Common widgets
│   ├── async_value_ui.dart                                 # AsyncValue UI helpers
│   └── async_value_widget.dart                             # AsyncValue widget
├── features/
│   ├── authentication/
│   │   ├── data/
│   │   │   └── auth_repository.dart                        # Auth repository
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   └── auth_controller.dart                    # Auth controller
│   │       ├── screens/
│   │       │   ├── sign_in_screen.dart                     # Sign in screen
│   │       │   ├── register_screen.dart                    # Register screen
│   │       │   └── account_screen.dart                     # Account screen
│   │       └── widgets/
│   │           └── common_text_field.dart                  # Common text field
│   └── task_management/
│       ├── data/
│       │   └── firestore_repository.dart                   # Firestore repository
│       ├── domain/
│       │   └── task.dart                                   # Task model
│       └── presentation/
│           ├── controllers/
│           │   └── firestore_controller.dart               # Firestore controller
│           ├── screens/
│           │   ├── main_screen.dart                        # Main screen with bottom navigation
│           │   ├── all_task_screen.dart                    # All tasks screen
│           │   ├── in_complete_task_screen.dart            # Incomplete tasks screen
│           │   ├── completed_task_screen.dart              # Completed tasks screen
│           │   └── add_task_screen.dart                    # Add task screen
│           └── widgets/
│               ├── task_item.dart                          # Task item widget
│               └── title_description.dart                  # Title/description input widget
├── routes/
│   ├── routes.dart                                         # App routes
│   └── go_route_refresh_stream.dart                        # Router refresh stream
└── utils/
    ├── appstyles.dart                                      # App styles
    └── size_config.dart                                    # Size config

android/                                                    # Android configuration
ios/                                                        # iOS configuration
web/                                                        # Web configuration
windows/                                                    # Windows configuration
linux/                                                      # Linux configuration
macos/                                                      # macOS configuration
test/                                                       # Flutter tests
```

## 📋 Yêu Cầu Hệ Thống

- **Flutter SDK** tương thích với **Dart ^3.12.2**
- **Dự án Firebase** đã bật:
  - Firebase Authentication
  - Cloud Firestore
- **Android Studio**, **VS Code** hoặc **IntelliJ IDEA**
- Thiết bị thật hoặc emulator / simulator để chạy ứng dụng

## 🚀 Hướng Dẫn Cài Đặt

### 1. Tải Dự Án

```bash
git clone https://github.com/luongductinh-it/todo_app.git
cd todo_app
```

### 2. Cài Đặt Dependencies

```bash
flutter pub get
```

### 3. Cấu Hình Firebase

Project hiện đã có `firebase_options.dart` và `android/app/google-services.json`, nhưng nếu bạn dùng Firebase project riêng thì nên cấu hình lại.

#### Cho Android / iOS:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

Sau đó kiểm tra trong Firebase Console:

- Đã bật **Email/Password** trong Authentication
- Đã tạo **Cloud Firestore Database**

### 4. Sinh File Riverpod Generator

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Chạy Ứng Dụng

```bash
flutter run
```

Hoặc chạy trên thiết bị cụ thể:

```bash
flutter run -d <device_id>
```

## 📦 Dependencies

| Package | Phiên bản | Mục đích |
|---------|-----------|---------|
| `cupertino_icons` | ^1.0.8 | Icon kiểu iOS |
| `go_router` | ^17.4.0 | Điều hướng ứng dụng |
| `flutter_riverpod` | ^3.3.2 | Quản lý state |
| `google_fonts` | ^8.2.1 | Hỗ trợ font chữ |
| `riverpod_annotation` | ^4.0.3 | Annotation cho Riverpod |
| `intl` | ^0.20.3 | Format ngày tháng |
| `firebase_auth` | ^6.5.7 | Xác thực người dùng |
| `firebase_core` | ^4.13.0 | Khởi tạo Firebase |
| `cloud_firestore` | ^6.8.0 | Lưu trữ dữ liệu task |
| `font_awesome_flutter` | ^11.0.0 | Icon social cho UI |

## 🏗️ Kiến Trúc Và Luồng Xử Lý

Project được tổ chức theo hướng **feature-based architecture** và tách thành các tầng:

- **data** - Làm việc trực tiếp với Firebase
- **domain** - Định nghĩa model nghiệp vụ
- **presentation** - UI, controller, widget

Luồng xử lý cơ bản:

1. **UI** gọi action từ controller
2. **Controller** gọi repository
3. **Repository** làm việc với Firebase Auth hoặc Firestore
4. **Riverpod** quản lý trạng thái và cập nhật lại UI

Ví dụ:

- `AddTaskScreen` gọi `FirestoreController.addTask()`
- `FirestoreController` gọi `FirestoreRepository.addTask()`
- Task được lưu vào Firestore tại `users/{userId}/tasks`
- Các màn hình đang nghe `snapshots()` sẽ tự động cập nhật dữ liệu

## 📱 Các Màn Hình Chính

### Authentication
- **SignInScreen** - Đăng nhập tài khoản
- **RegisterScreen** - Tạo tài khoản mới
- **AccountScreen** - Hiển thị thông tin tài khoản và đăng xuất

### Task Management
- **MainScreen** - Điều hướng tab chính của ứng dụng
- **AllTaskScreen** - Hiển thị toàn bộ task
- **InCompleteTaskScreen** - Hiển thị task chưa hoàn thành
- **CompletedTaskScreen** - Hiển thị task đã hoàn thành
- **AddTaskScreen** - Tạo task mới

## 🗂️ Firestore Data Model

Task được lưu theo từng user với cấu trúc:

```text
users/{userId}/tasks/{taskId}
```

Ví dụ dữ liệu một task:

```json
{
  "id": "task_document_id",
  "title": "Finish README",
  "description": "Write README in professional style",
  "priority": "High",
  "date": "2026-08-21 10:30:00.000",
  "isComplete": false
}
```

## 💡 Hướng Dẫn Sử Dụng

1. **Tạo Tài Khoản**
   - Mở ứng dụng
   - Chọn màn hình đăng ký
   - Nhập email và mật khẩu

2. **Đăng Nhập**
   - Nhập email và mật khẩu đã đăng ký
   - Nhấn nút đăng nhập

3. **Tạo Task**
   - Vào tab `Add`
   - Nhập tiêu đề, mô tả và chọn mức ưu tiên
   - Nhấn `Add Task`

4. **Quản Lý Task**
   - Xem toàn bộ task ở tab `Home`
   - Tích checkbox để cập nhật trạng thái hoàn thành
   - Nhấn icon sửa để cập nhật task
   - Nhấn icon xoá để xoá task

5. **Xem Thông Tin Tài Khoản**
   - Vào tab `Account`
   - Xem email, UID và đăng xuất

## 🏗️ Build & Chạy Ứng Dụng

### Android

**Chạy debug**
```bash
flutter run -d android
```

**Build APK**
```bash
flutter build apk --release
```

**Build App Bundle**
```bash
flutter build appbundle --release
```

### iOS

**Chạy simulator**
```bash
flutter run -d ios
```

**Build iOS**
```bash
flutter build ios --release
```

### Web / Desktop

Project có sẵn thư mục nền tảng `web`, `windows`, `linux`, `macos`, nhưng **Firebase hiện chưa được cấu hình cho các nền tảng này** trong `firebase_options.dart`.

Nếu muốn chạy trên Web hoặc Desktop, hãy cấu hình lại bằng:

```bash
flutterfire configure
```

Sau đó chọn thêm các platform cần hỗ trợ.

## 🐛 Gỡ Lỗi

### Vấn đề: Lỗi sau khi kéo code về
```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Vấn đề: Kiểm tra log chi tiết
```bash
flutter run -v
```

### Vấn đề: Dependency bị lỗi phiên bản
```bash
flutter pub upgrade
flutter pub get
```

### Vấn đề: Firebase chưa hoạt động đúng
Kiểm tra lại:

- `android/app/google-services.json`
- Firebase Authentication đã bật Email/Password
- Firestore Database đã được tạo
- `flutterfire configure` đã chạy đúng cho project Firebase của bạn

## 📚 Tài Liệu Tham Khảo

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

## ✅ Kiểm Tra Trước Khi Demo Hoặc Deploy

Trước khi demo hoặc bàn giao project, nên kiểm tra:

- [ ] Đăng ký tài khoản hoạt động bình thường
- [ ] Đăng nhập / đăng xuất hoạt động chính xác
- [ ] Tạo task thành công
- [ ] Sửa task thành công
- [ ] Xoá task thành công
- [ ] Checkbox cập nhật trạng thái hoàn thành đúng
- [ ] Danh sách `All`, `Incomplete`, `Completed` hiển thị đúng dữ liệu
- [ ] Không có lỗi Firebase trong console

## ⚠️ Lưu Ý

- Các icon **Google / Apple / Facebook** hiện mới là phần giao diện, chưa có logic social login thực tế
- Firebase hiện được cấu hình sẵn cho **Android** và **iOS**
- Muốn chạy ổn định trên **Web / Windows / Linux / macOS** cần cấu hình thêm bằng FlutterFire CLI

## 📞 Hỗ Trợ & Liên Hệ

- **GitHub Repository** - https://github.com/luongductinh-it/todo_app
- **GitHub Issues** - Dùng để báo lỗi hoặc đề xuất tính năng mới

## 👤 Tác Giả

**luongductinh-it**

---

**Phiên bản**: 1.0.0  
**Project**: Firebase Todo App
