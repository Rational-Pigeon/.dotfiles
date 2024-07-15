#!/bin/bash

JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
JDTLS_HOME="$HOME/.local/share/nvim/mason/packages/jdtls"
WORKSPACE="$HOME/.workspace"

$JAVA_HOME/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $JDTLS_HOME/plugins/org.eclipse.equinox.launcher_*.jar \
  -configuration $JDTLS_HOME/config_linux \
  -data $WORKSPACE
