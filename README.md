# 📱 MOBILE-AUTOMATE

Automated mobile testing project built using **Robot Framework** and **Appium**.  
It automates testing for the `Minimal_To_Do.apk` Android application.

---

## 🗂 Project Structure

```
MOBILE-AUTOMATE/
│
├── app/
│   └── Minimal_To_Do.apk          # Android app used for testing
│
├── keyword/                       # Reusable keywords
│   ├── common_keyword.robot
│   └── create_to_do_keyword.robot
│
├── resource/
│   ├── config/
│   │   └── setting.robot           # Configuration settings
│   ├── import/
│   │   └── library_import.robot    # Library imports
│   ├── locators/                   # UI element locators
│   │   ├── create_to_do_page.robot
│   │   ├── main_page.robot
│   │   └── test_data.robot
│   └── resource.robot              # Shared resources
│
├── testcase/
│   └── testcase.robot              # Main test cases
│
├── log.html                        # Execution log
├── output.xml                      # Execution output
└── report.html                     # Test report
```

---

## ⚙️ Installation

### 1. Install Python  
Ensure **Python 3.8+** is installed:  
```bash
python3 --version
```

### 2. Install Robot Framework  
```bash
pip install robotframework
```

### 3. Install Appium Library  
```bash
pip install robotframework-appiumlibrary
```

### 4. Install Android Studio  
- Download from [https://developer.android.com/studio](https://developer.android.com/studio)  
- Install **Android SDK** and **emulator tools**  
- Set up your device or emulator and **enable USB debugging**

---

## 🚀 Running the Test

Run the following command in the project root directory:

```bash
python3 -m robot -v system:Android testcase/testcase.robot
```

- `-v system:Android` sets the platform variable  
- Results will be saved as:
  ```
  ├── log.html
  ├── report.html
  └── output.xml
  ```

---

## 🧩 Notes

- Built using **Robot Framework** — a keyword-driven test automation framework.  
- Uses **Appium** for mobile automation.  
- Requires **Android Studio** for managing emulators or physical devices.
