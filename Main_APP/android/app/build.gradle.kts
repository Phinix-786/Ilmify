import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

val flutterVersionCode: Int by lazy {
    val props = Properties()
    file("../local.properties").inputStream().use { props.load(it) }
    props.getProperty("flutter.versionCode")?.toInt() ?: 1
}

val flutterVersionName: String by lazy {
    val props = Properties()
    file("../local.properties").inputStream().use { props.load(it) }
    props.getProperty("flutter.versionName") ?: "1.0.0"
}

val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties()
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.fluxspark.ilmify"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.fluxspark.ilmify"
        minSdk = flutter.minSdkVersion  // OneSignal requires minSdk 23
        targetSdk = 35

        versionCode = flutterVersionCode
        versionName = flutterVersionName

        multiDexEnabled = true

        ndk {
            abiFilters.addAll(listOf("armeabi-v7a", "arm64-v8a", "x86_64"))
        }

        manifestPlaceholders["android.permission.READ_MEDIA_IMAGES"] = "false"
        manifestPlaceholders["android.permission.READ_MEDIA_VIDEO"] = "false"
        manifestPlaceholders["android.permission.READ_MEDIA_VISUAL_USER_SELECTED"] = "false"
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    bundle {
        language { enableSplit = false }
        density { enableSplit = true }
        abi { enableSplit = true }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}
