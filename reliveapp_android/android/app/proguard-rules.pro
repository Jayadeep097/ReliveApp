# General Rules
-keep class com.example.reliveapp_android.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
-keepclassmembers class * {
    public static void main(java.lang.String[]);
}

# Flutter Rules
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# AndroidX Rules
-keep class androidx.** { *; }
-dontwarn androidx.**

# Firebase Rules
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Firebase Analytics
-keep class com.google.firebase.analytics.** { *; }
-dontwarn com.google.firebase.analytics.**

# Firebase Firestore
-keep class com.google.firebase.firestore.** { *; }
-dontwarn com.google.firebase.firestore.**

# Firebase Authentication
-keep class com.google.firebase.auth.** { *; }
-dontwarn com.google.firebase.auth.**

# Firebase Realtime Database
-keep class com.google.firebase.database.** { *; }
-dontwarn com.google.firebase.database.**

# Firebase Messaging
-keep class com.google.firebase.messaging.** { *; }
-dontwarn com.google.firebase.messaging.**

# Firebase Storage
-keep class com.google.firebase.storage.** { *; }
-dontwarn com.google.firebase.storage.**

# Firebase Dynamic Links
-keep class com.google.firebase.dynamiclinks.** { *; }
-dontwarn com.google.firebase.dynamiclinks.**

# Firebase Performance Monitoring
-keep class com.google.firebase.perf.** { *; }
-dontwarn com.google.firebase.perf.**

# Third-Party Libraries

# Gson
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# Retrofit
-keep class retrofit2.** { *; }
-dontwarn retrofit2.**

# OkHttp
-keep class okhttp3.** { *; }
-dontwarn okhttp3.**

# Glide (for image loading)
-keep class com.bumptech.glide.** { *; }
-dontwarn com.bumptech.glide.**

# Room Database
-keep class androidx.room.** { *; }
-dontwarn androidx.room.**

# Kotlin Metadata
-keepclassmembers class kotlin.Metadata { *; }
-dontwarn kotlin.reflect.jvm.internal.**

# Java 8 Features and Lambdas
-dontwarn java.lang.invoke.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-keepclassmembers class * {
    ** MODULE$;
}
-keepclasseswithmembers class * {
    ** MODULE$;
}

# Prevent Stripping Annotations
-keepattributes *Annotation*

# Keep ProGuard Rules for Flutter Plugins
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.plugins.**

# Coroutines (if used)
-keepclassmembers class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

# Prevent Shrinking of Resources (if resource shrinking enabled)
-keepresources class com.example.reliveapp_android.R$* { *; }

# Custom Views and Animations
-keep class android.view.animation.Animation { *; }
-keep class android.view.View { *; }
-keep class android.widget.** { *; }
-dontwarn android.view.animation.Animation
-dontwarn android.view.View

# Prevent issues with custom Parcelable implementation
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

# R8 Shrinking Rules
# Ensure app-specific classes are preserved
-keep class com.example.reliveapp_android.** { *; }
