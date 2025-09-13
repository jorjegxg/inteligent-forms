# Intelligent Forms

## 📖 Overview
**Intelligent Forms** is a Flutter mobile application that simplifies and automates the process of filling out forms.  
It uses **Firebase** for authentication, storage, and data management, combined with **Azure Form Recognizer** to automatically extract information from scanned documents (like ID cards, passports, or vehicle certificates).  

The app reduces bureaucracy, human errors, and waiting times by allowing users to scan, auto-fill, and submit forms directly from their smartphones.

---

## 🚀 Features
- 🔑 **Authentication** – Secure login and registration with **Firebase Auth**.  
- 📝 **Form Creation & Management** – Create, edit, and delete custom digital forms.  
- 📷 **Smart Autofill** – Scan ID cards or documents; data is extracted via **Azure Form Recognizer** and mapped to form fields.  
- 📂 **Cloud Integration** – Store forms and submissions in **Firebase Firestore**.  
- ☁️ **File Storage** – Upload and retrieve files using **Firebase Storage**.  
- 📄 **PDF Export** – Generate and save completed forms as PDF files with **syncfusion_flutter_pdf**.  
- 📱 **QR Code & Scanner** – Share forms with QR codes and allow quick scanning to access them.  
- 🔍 **Search & Filter** – Browse submissions and manage them efficiently.  

---

## 🛠 Technology Stack
- **Framework:** Flutter (Dart)  
- **State Management:** BLoC (flutter_bloc, equatable, dartz)  
- **Backend & Services:**  
  - Firebase Authentication  
  - Firebase Firestore  
  - Firebase Storage  
- **AI Integration:** Azure Form Recognizer (OCR & document data extraction)  
- **Utilities & UI:**  
  - flutter_form_builder (form handling)  
  - qr_flutter & flutter_barcode_scanner (QR codes)  
  - mobile_scanner (document scanning)  
  - syncfusion_flutter_pdf (PDF generation)  
  - screenshot, image_picker, image_gallery_saver (media utilities)  

---

## 📲 Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/intelligent_forms.git
   cd intelligent_forms
