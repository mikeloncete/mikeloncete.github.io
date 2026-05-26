# Changelog

Todos los cambios notables del proyecto GeoHistory se documentarán en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [3.2.0] - 2026-05-26
### Añadido
- Índice completo al inicio del código con navegación por secciones
- Separadores visuales entre las 12 secciones principales del código
- Comentarios descriptivos con emojis para fácil identificación
- Estructura organizada: Config, DB, Navegación, Auth, Mapas, Tracking, Usuario, Admin, Mapa Global, Cruces, Nube, Utilidades

### Modificado
- Organización interna mejorada para mantenibilidad
- Arquitectura de código documentada con líneas de referencia

## [3.2.0] - 2026-05-26
### Añadido
- Sistema de pestañas en panel de administración (Usuarios, Mapa Global, Cruces)
- Mapa global que muestra rutas de todos los usuarios con colores únicos
- Detección automática de cruces entre rutas de usuarios (algoritmo con distancia Haversine)
- Vista de cruces con detalles de ubicación, fecha/hora y usuarios involucrados
- Base de datos de cruces (IndexedDB + Firebase sync)
- Wake Lock API para mantener rastreo activo con pantalla apagada
- Reconexión automática de GPS al volver a primer plano
- Notificación visual al iniciar rastreo
- Indicador de estado de rastreo continuo
- PWA con soporte de instalación en móvil (pantalla completa)
- Service Worker para funcionamiento offline
- Manifest.json para instalación como app nativa
- Safe-area support para notch de iPhone
- Carga automática de rutas al iniciar sesión como admin
- Actualización en tiempo real del mapa global con Firebase
- Logs de diagnóstico detallados para debugging

### Modificado
- Renombrado de "GeoTracker Pro" a "GeoHistory"
- Base de datos actualizada a versión 3 (añadido store de cruces)
- Filtro de precisión GPS más permisivo para PC/Mac (5000m vs 50m)
- Timeout de conexión Firebase (5s) para evitar bloqueos
- Configuración de nube solo visible para administrador
- Botón de configuración de nube oculto por defecto
- Service Worker corregido (solo cachea peticiones GET)
- Validaciones en funciones de tracking para evitar errores null

### Corregido
- Error de sintaxis en Service Worker (línea 60)
- Error de caché con peticiones POST de Firebase
- Error al cerrar sesión desde admin (elementos null)
- Conexión Firebase bloqueada indefinidamente
- Geolocalización no guardaba en PC/Mac por filtro muy estricto
- Labels sin atributo "for" (accesibilidad)
- Viewport permite zoom en desktop (quitado user-scalable=no)

## [3.1.0] - 2026-05-25

### Añadido
- Sistema de rastreo GPS con geolocalización continua
- Autenticación con usuarios y administrador
- Panel de control de usuario con mapa individual
- Panel de administración para visualizar usuarios
- Exportación de datos en formato JSON
- Importación de datos desde móvil
- Sincronización con Firebase (opcional)
- Modo local con IndexedDB
- Borrado lógico de historial (soft delete)
- Mapa interactivo con Leaflet
- Dark mode design con Tailwind CSS

[3.2.0]: https://github.com/user/geohistory/compare/v3.1.0...v3.2.0
[3.1.0]: https://github.com/user/geohistory/releases/tag/v3.1.0
