#!/system/bin/sh

mount -o overlay /system/etc/security/cacerts /apex/com.android.conscrypt/cacerts

mount -o overlay /system/etc/security/cacerts /apex/com.android.conscrypt@340090000/cacerts

