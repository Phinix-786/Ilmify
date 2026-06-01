## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

## Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**

## Firebase Messaging (NEW - For notifications)
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.firebase.iid.** { *; }
-keep class com.google.firebase.installations.** { *; }

## Flutter Local Notifications (NEW - Critical for notifications)
-keep class com.dexterous.** { *; }
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-keep class androidx.core.app.NotificationCompat** { *; }
-keep class androidx.core.app.NotificationManagerCompat { *; }
-keep class android.app.NotificationChannel { *; }
-keep class android.app.NotificationManager { *; }

## Notification channels and services (NEW)
-keep class * extends android.app.Service
-keep class * extends android.content.BroadcastReceiver
-keep class * extends androidx.work.Worker

## Play Core - Ignore missing classes for deferred components
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**

## Prevent obfuscation of model classes
-keep class com.fluxspark.parhve.** { *; }
-keep class com.fluxspark.ilmify.** { *; }

## Keep native methods
-keepclassmembers class * {
    native <methods>;
}

## Keep source file names and line numbers for better stack traces
-keepattributes SourceFile,LineNumberTable
-keepattributes Signature
-keepattributes *Annotation*

## Gson (NEW - For JSON serialization in Firebase)
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

## For enumeration classes (NEW)
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

## Parcelable (NEW)
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

## Serializable (NEW)
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

## AndroidX (NEW - Important for notifications)
-keep class androidx.** { *; }
-keep interface androidx.** { *; }
-dontwarn androidx.**

## Google Sign-In (Existing dependency)
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }

## Image Picker (Existing dependency)
-keep class androidx.exifinterface.** { *; }

## Prevent obfuscation of methods called from Flutter (NEW)
-keep class * extends io.flutter.embedding.engine.plugins.FlutterPlugin { *; }
-keep class * extends io.flutter.plugin.common.** { *; }

## Keep R classes (NEW - For notification icons and resources)
-keepclassmembers class **.R$* {
    public static <fields>;
}
-keep class **.R$*