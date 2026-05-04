#!/bin/bash

# Compile script for Portfolio Website (Linux/Mac)
# Make sure to update paths according to your system

# Set paths
JAVA_SRC="src"
OUTPUT_DIR="WebContent/WEB-INF/classes"
TOMCAT_LIB="/path/to/apache-tomcat-9.0.x/lib"
MYSQL_JAR="/path/to/apache-tomcat-9.0.x/lib/mysql-connector-java-8.0.33.jar"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Compile Java files
echo "Compiling Java files..."
javac -d "$OUTPUT_DIR" -cp "$MYSQL_JAR:$TOMCAT_LIB/*" "$JAVA_SRC"/com/portfolio/**/*.java

if [ $? -eq 0 ]; then
    echo ""
    echo "Compilation successful!"
    echo "Files compiled to: $OUTPUT_DIR"
else
    echo ""
    echo "Compilation failed! Check errors above."
    echo "Make sure:"
    echo "- JAVA_HOME is set in your shell profile"
    echo "- Paths to Tomcat and MySQL JAR are correct"
fi
