MODID=mitmproxy-cert-next
AUTOMOUNT=true
PROPFILE=false
POSTFSDATA=true
LATESTARTSERVICE=false

print_modname() {
  ui_print "****************************"
  ui_print "  MITMProxy cert installer  "
  ui_print "****************************"
}

REPLACE="
/system/etc/security/cacerts
/system/etc/security/cacerts_google
"

set_permissions() {
  set_perm_recursive  $MODPATH  0  0  0755  0644
}
