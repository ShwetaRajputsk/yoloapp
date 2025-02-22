# **Yolo Pay - Digital Payment App**  
### **Seamless & Secure Payments at Your Fingertips**  

<p align="center">
  <img src="https://github.com/user-attachments/assets/06fda5dc-acc6-4cfc-be8a-79b90017a94d" width="300" />
  <img src="https://github.com/user-attachments/assets/dec0fe2a-2d0c-4858-b2c6-34dfe32345ef" width="300" />
</p>

---

## **📌 Overview**  
**Yolo Pay** is a modern and stylish digital payment app with an intuitive **neumorphic UI**. It allows users to **pay with cards, scan QR codes, and manage transactions seamlessly**. The app is built using **Flutter**, ensuring smooth performance across platforms.  

---

## **🚀 Features**  
- ✅ **Digital Card Interface** – View and manage virtual cards with secure features like freezing/unfreezing.  
- ✅ **Neumorphic UI** – Stylish and visually appealing design inspired by soft shadows and light reflections.  
- ✅ **Bottom Navigation Bar** – Easy navigation between Home, QR Scanner (Yolo Pay), and Ginie (Offers).  
- ✅ **Payment Mode Selector** – Choose between `Pay` and `Card` using beautifully crafted neumorphic buttons.  

---

## **📂 Project Structure**  

```bash
yolo_app/
│── lib/
│   ├── main.dart                 # Entry point of the app
│   ├── HomeScreen.dart           # Main home screen UI
│   ├── DigitalCard.dart          # Virtual card UI & features
│   ├── FrozenCard.dart           # Alternative screen for frozen card state
│   ├── CardModel.dart            # Card data model & provider
│   ├── BottomNavigator.dart      # Neumorphic bottom navigation bar
│   ├── PaymentModeSelector.dart  # Pay & Card selector with neumorphic buttons
│── assets/                       # Images & icons
│── android/                      # Android-specific files
│── ios/                          # iOS-specific files
│── pubspec.yaml                  # Dependencies & assets configuration
│── README.md                     # Project documentation
