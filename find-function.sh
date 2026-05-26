#!/bin/bash
# find-function.sh - Busca una función y muestra en qué sección está

if [ -z "$1" ]; then
    echo "Uso: ./find-function.sh <nombre_funcion>"
    echo "Ejemplo: ./find-function.sh startTracking"
    exit 1
fi

FUNCTION_NAME="$1"
FILE="index.html"

echo "🔍 Buscando función: $FUNCTION_NAME en $FILE"
echo ""

# Buscar la línea donde está la función
LINE=$(grep -n "function $FUNCTION_NAME\|window\.$FUNCTION_NAME\|const $FUNCTION_NAME" "$FILE" | head -1 | cut -d: -f1)

if [ -z "$LINE" ]; then
    echo "❌ Función '$FUNCTION_NAME' no encontrada"
    exit 1
fi

echo "✅ Encontrada en línea: $LINE"
echo ""

# Determinar la sección basándose en el número de línea
if [ "$LINE" -lt 630 ]; then
    echo "📍 Sección 1: CONFIGURACIÓN Y VARIABLES GLOBALES"
elif [ "$LINE" -lt 730 ]; then
    echo "📍 Sección 2: INICIALIZACIÓN DE BASES DE DATOS"
elif [ "$LINE" -lt 780 ]; then
    echo "📍 Sección 3: NAVEGACIÓN Y VISTAS"
elif [ "$LINE" -lt 900 ]; then
    echo "📍 Sección 4: AUTENTICACIÓN"
elif [ "$LINE" -lt 950 ]; then
    echo "📍 Sección 5: MAPAS LEAFLET"
elif [ "$LINE" -lt 1210 ]; then
    echo "📍 Sección 6: TRACKING GPS Y WAKE LOCK"
elif [ "$LINE" -lt 1400 ]; then
    echo "📍 Sección 7: PANEL DE USUARIO"
elif [ "$LINE" -lt 1780 ]; then
    echo "📍 Sección 8: PANEL DE ADMINISTRADOR"
elif [ "$LINE" -lt 1886 ]; then
    echo "📍 Sección 9: MAPA GLOBAL"
elif [ "$LINE" -lt 2114 ]; then
    echo "📍 Sección 10: DETECCIÓN DE CRUCES"
else
    echo "📍 Sección 11/12: CONFIGURACIÓN DE NUBE O UTILIDADES"
fi

echo ""
echo "📄 Contexto:"
sed -n "$((LINE-2)),$((LINE+5))p" "$FILE" | head -8
