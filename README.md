# 📱 MOBILE-AUTOMATE

Automated mobile testing project built using **Robot Framework** and **Appium**.  
It automates testing for the `Minimal_To_Do.apk` Android application.

---

## 🗂 Project Structure

```
MOBILE-AUTOMATE/
│
├── app/
│   └── Minimal_To_Do.apk              # Android app used for testing
│
├── keyword/                           # Reusable keywords
│   ├── common_keyword.robot
│   └── create_to_do_keyword.robot
│
├── resource/
│   ├── config/
│   │   └── setting.robot              # Configuration settings
│   ├── import/
│   │   └── library_import.robot       # Library imports
│   ├── locators/                      # UI element locators
│   │   ├── create_to_do_page.robot
│   │   ├── main_page.robot
│   │   └── test_data.robot
│   └── resource.robot                 # Shared resources
│
├── testcase/
│   └── testcase.robot                 # Main test cases
│
├── MobileJenkinsfile                  # Jenkins pipeline definition
├── log.html                           # Execution log
├── output.xml                         # Execution output
└── report.html                        # Test report
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

- Download from https://developer.android.com/studio
- Install **Android SDK** and **emulator tools**
- Set up your device or emulator and **enable USB debugging**

---

## 🚀 Running the Test

### Run locally

```bash
python3 -m robot -v system:Android testcase/testcase.robot
```

### Run via Jenkins Pipeline

This project uses `MobileJenkinsfile` to run tests via Jenkins CI/CD.  
The shared Jenkins Docker image is maintained in a separate repository:  
👉 [jenkins-shared](https://github.com/sipahtsanan/jenkins-shared)

Results will be saved as:
```
├── log.html
├── report.html
└── output.xml
```

---

## 🔧 Configuration: `resource/config/setting.robot`

```robotframework
*** Variables ***
${DeviceName}           ${DeviceName_${system}}
${PlatformVersion}      ${PlatformVersion_${system}}
${AppName}              ${AppName_${system}}

${APPIUM_SERVER}        http://host.docker.internal:4723/wd/hub

# ANDROID
${DeviceName_Android}       emulator-5554
${PlatformVersion_Android}  13
${AppName_Android}          ${APK_PATH}
```

### About `${APK_PATH}`

`${APK_PATH}` is a dynamic variable injected at runtime by the Jenkins pipeline — **it is not hardcoded in this file**.

This approach is used because:
- Jenkins runs inside a **Docker container**, but Appium runs on the **Mac host**
- The APK path inside Docker (`/var/jenkins_home/...`) is **not accessible** by Appium on Mac
- So the APK must be placed on the Mac host, and its path is passed in at build time

The variable is passed via `MobileJenkinsfile` using:
```
-v APK_PATH:<your-mac-apk-path>
```

---

## 🏗️ Jenkins Pipeline: `MobileJenkinsfile`

The pipeline is defined in `MobileJenkinsfile` and consists of 3 stages:

| Stage | Description |
|-------|-------------|
| **Install Dependencies** | Installs `robotframework` and `robotframework-appiumlibrary` via `pip3` |
| **Run Mobile Tests** | Runs Robot Framework tests and passes `APK_PATH` as a variable |
| **Archive Report** | Archives `report.html`, `log.html`, and `output.xml` as build artifacts |

### `APK_PATH` Parameter

When triggering the pipeline in Jenkins, you will be prompted to fill in `APK_PATH`:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `APK_PATH` | Absolute path to the APK file on your Mac host | `/Users/<your-username>/appium-apps/Minimal_To_Do.apk` |

> This parameter is intentionally left blank in the Jenkinsfile to avoid exposing local machine paths in a public repository.

---

## 🧩 Notes

> **Running with Jenkins (CI/CD)?**  
> This project is designed to work with the shared Jenkins Docker image.  
> See full setup instructions at 👉 [jenkins-shared](https://github.com/sipahtsanan/jenkins-shared)
>
> Key things to do before running the pipeline:
> - Start **Appium Server** on Mac: `appium --address 0.0.0.0 --port 4723`
> - Start **Android Emulator** on Mac
> - Place the APK file on Mac and provide its path as `APK_PATH` when triggering the build
> - The `${APPIUM_SERVER}` in `setting.robot` uses `host.docker.internal` so Jenkins (Docker) can reach Appium running on the Mac host

- Built using **Robot Framework** — a keyword-driven test automation framework.
- Uses **Appium** for mobile automation.
- Requires **Android Studio** for managing emulators or physical devices.
