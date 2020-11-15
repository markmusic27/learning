# ⚙️ Troubleshooting

## Android SDK Licenses

### **Error Message**
```
* What went wrong: Could not determine the dependencies of task ':app:compileDebugJavaWithJavac'. > Failed to install the following Android SDK packages as some licences have not been accepted. build-tools;28.0.3 Android SDK Build-Tools 28.0.3 platforms;android-29 Android SDK Platform 29 To build this project, accept the SDK license agreements and install the missing components using the Android Studio SDK Manager. Alternatively, to transfer the license agreements from one workstation to another, see http://d.android.com/r/studio-ui/export-licenses.html
```

### **Fix**

Run `flutter doctor --android-licenses`