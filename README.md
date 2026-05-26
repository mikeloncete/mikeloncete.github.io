# GeoHistory

**Versión actual: 3.2.0** | [Ver Changelog](CHANGELOG.md) | [📖 Guía del Código](README_CODE.md)

Aplicación web progresiva (PWA) para rastreo GPS con sincronización en tiempo real.

## Características principales

- 📍 Rastreo GPS continuo con geolocalización
- 🗺️ Mapas interactivos con Leaflet
- 👥 Panel de administración multi-usuario
- 🔄 Sincronización en tiempo real con Firebase
- 💾 Funciona offline con IndexedDB
- 📱 Instalable como app en móvil
- 🎨 Interfaz dark mode responsive

## Versionado

Este proyecto sigue [Semantic Versioning](https://semver.org/):
- **MAJOR**: Cambios incompatibles en la API
- **MINOR**: Nueva funcionalidad compatible hacia atrás
- **PATCH**: Correcciones de bugs

Ver todos los cambios en [CHANGELOG.md](CHANGELOG.md)

## Estructura del Código

El código está organizado en **12 secciones claramente delimitadas** dentro de `index.html`:

1. 🔧 **Configuración** - Variables globales y Firebase setup
2. 💾 **Bases de Datos** - IndexedDB y Firebase initialization
3. 🗺️ **Navegación** - Router SPA entre vistas
4. 🔐 **Autenticación** - Login/logout y sesiones
5. 🗺️ **Mapas Leaflet** - User y Admin maps
6. 📍 **Tracking GPS** - Geolocalización y Wake Lock
7. 👤 **Panel Usuario** - Logs, exportar/importar
8. 👑 **Panel Admin** - Dashboard y Firebase sync
9. 🌍 **Mapa Global** - Todas las rutas simultáneas
10. ⚡ **Cruces** - Detección de intersecciones
11. ☁️ **Config Nube** - Modal Firebase
12. 🛠️ **Utilidades** - Helpers y Service Worker

**Para desarrolladores:** Ver [README_CODE.md](README_CODE.md) con guía completa de navegación del código.

## Tecnologías

- HTML5 Geolocation API
- IndexedDB
- Firebase (Auth + Firestore)
- Leaflet.js
- Tailwind CSS
- Service Workers (PWA)
- Wake Lock API
