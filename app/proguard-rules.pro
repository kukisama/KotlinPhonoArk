# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.kts.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# ── Gson：保留所有 data model 字段名（JSON 反序列化依赖字段名） ──
-keep class com.phonoark.data.model.** { *; }

# ── Room：保留 Entity / Dao / Database ──
-keep class com.phonoark.data.local.** { *; }

# ── Hilt：由 Hilt Gradle 插件自动处理，但保险起见保留 Application ──
-keep class com.phonoark.PhonoArkApplication { *; }

# ── Gson 通用规则 ──
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# ── Kotlin 元数据（反射需要） ──
-keep class kotlin.Metadata { *; }
-keepattributes RuntimeVisibleAnnotations

# ── Compose：保留 Composable 相关 ──
-dontwarn androidx.compose.**

# ── 通用：保留枚举 ──
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
