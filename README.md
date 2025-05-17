# 📦 DỰ ÁN ỨNG DỤNG BÁN GIÀY ONLINE

## 🚀 Mô tả dự án

Ứng dụng bán giày cung cấp nền tảng để người dùng dễ dàng tìm kiếm, xem, mua sắm giày và quản lý đơn hàng. Dành cho cả khách hàng và admin, hệ thống hỗ trợ trải nghiệm mua giày một cách tiện lợi và quản lý dữ liệu hiệu quả.

---

## 📱 Giao diện ứng dụng

![image](https://github.com/user-attachments/assets/4d086f07-4236-45e7-9151-c0b156e1658f)
![image](https://github.com/user-attachments/assets/2a068288-831d-4bfa-92da-828a35306497)
![image](https://github.com/user-attachments/assets/5dc815c3-fabd-4b84-a586-e1ae28e34c4c)

---

## 👤 Chức năng Người Dùng

- **Trang chủ:** Xem sản phẩm mới, sản phẩm bán chạy.
- **Tìm kiếm sản phẩm:** Theo tên, từ khóa.
- **Xem chi tiết sản phẩm**
- **Xem sản phẩm cùng loại (theo danh mục)**
- **Đăng ký / Đăng nhập / Cập nhật thông tin cá nhân / Đổi mật khẩu**
- **Quên mật khẩu:** Gửi mật khẩu mới qua Gmail.
- **Quản lý giỏ hàng:** Thêm, sửa, xoá sản phẩm (hỗ trợ vuốt để xoá).
- **Đặt hàng:** Cho phép sửa địa chỉ nhận hàng.
- **Thanh toán:**
  - Khi nhận hàng (COD)
  - Qua ví điện tử ZaloPay
- **Thông tin cá nhân:** Cho phép upload hình ảnh lên [Cloudinary](https://cloudinary.com/) và lưu link ảnh vào database.
- **Lịch sử mua hàng:** Xem tất cả đơn hàng theo hình thức thanh toán.

---

## 🛠️ Chức năng Admin

- **Quản lý cơ sở dữ liệu:** Tổng quan hàng hóa, loại sản phẩm, đơn hàng, khách hàng.
- **Quản lý đơn hàng**
- **Quản lý sản phẩm:** Thêm, sửa, xóa sản phẩm.
- **Thống kê doanh thu bán hàng:**
  - Theo hình thức thanh toán
  - Theo số lượng sản phẩm và khách hàng
  - Cho phép gửi email cho khách khi đặt hàng
- **Quản lý hóa đơn**

---

## ⚙️ Hướng dẫn cài đặt

### 🔧 Công cụ cần thiết:

| Công cụ                        | Tải về                                                                                                                                                        |
|--------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Java JDK 11+                   | [https://www.oracle.com/java/technologies/javase-jdk11-downloads.html](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)                  |
| MySQL                          | [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/)                                                                                          |
| Eclipse IDE hoặc IntelliJ IDEA | [https://www.eclipse.org/downloads/](https://www.eclipse.org/downloads/) / [https://www.jetbrains.com/idea/download](https://www.jetbrains.com/idea/download) |
| Android Studio                 | [https://developer.android.com/studio](https://developer.android.com/studio)                                                                                  |

---

### 📥 Các bước cài đặt:

1. **API (Spring Boot):**
   - Tải source code backend và mở bằng Eclipse hoặc IntelliJ IDEA.
   - Đảm bảo đã cài đặt `Spring Boot`, `Lombok`.
   - Cấu hình lại file `application.properties` để kết nối đúng tài khoản & mật khẩu MySQL.
   - Chạy project Spring Boot.

2. **Database:**
   - Mở MySQL.
   - Chạy file `script.sql` được đính kèm trong bộ source để tạo database.

3. **Mobile App (Android):**
   - Mở source code mobile bằng Android Studio.
   - Cập nhật lại **địa chỉ IP** backend và đường dẫn tích hợp **ZaloPay** như hướng dẫn trong file `README` của ứng dụng mobile.

---

## 📦 Tài nguyên đính kèm

- File `script.sql` tạo cấu trúc database.

---

## 📧 Liên hệ

Nếu có bất kỳ câu hỏi nào, vui lòng liên hệ nhóm phát triển hoặc gửi email đến: **phanduykiet29@gmail.com**.

---

