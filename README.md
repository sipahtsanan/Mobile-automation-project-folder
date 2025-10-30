MOBILE-AUTOMATE/
│
├── app/
│   └── Minimal_To_Do.apk                 # The Android app used for testing
│
├── keyword/                             # Contains reusable keywords
│   ├── common_keyword.robot
│   └── create_to_do_keyword.robot
│
├── resource/
│   ├── config/
│   │   └── setting.robot                # Configuration settings
│   ├── import/
│   │   └── library_import.robot         # Library imports for the test
│   ├── locators/                        # UI element locators
│   │   ├── create_to_do_page.robot
│   │   ├── main_page.robot
│   │   └── test_data.robot
│   └── resource.robot                   # Shared resources
│
├── testcase/
│   └── testcase.robot                   # Main test cases
│
├── log.html                             # Execution log
├── output.xml                           # Execution output
└── report.html                          # Test report


⚙️ Installation
└── Install Python Make sure you have Python 3.8+ installed:
    ├── python3 --version

└── Install Robot Framework
    ├── pip install robotframework

└── Install Appium Library (for mobile automation)
    ├── pip install robotframework-appiumlibrary

└── Install Android Studio
    ├── Download from https://developer.android.com/studio
    ├── Install Android SDK and emulator tools
    └── Set up your device/emulator and enable USB debugging

🚀 Running the Test
Run the following command in your project root:
│    ├──python3 -m robot -v system:Android testcase/testcase.robot
│
├── -v system:Android sets the platform variable
└── Results will be saved as:
    └── Results will be saved as:
        ├── log.html
        ├── report.html
        └── output.xml

🧩 Notes
    └── Built using Robot Framework — a keyword-driven test automation framework
    └── Uses Appium for mobile automation and Android Studio for emulator/device management    