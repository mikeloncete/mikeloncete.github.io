# Guía de Navegación del Código

Este documento ayuda a navegar por el código fuente de GeoHistory (index.html ~2200 líneas).

## 📋 Estructura del Código

El código está organizado en **12 secciones principales** con separadores visuales para facilitar la navegación:

```
═══════════════════════════════════════════════════════════════
🔧 SECCIÓN 1: CONFIGURACIÓN Y VARIABLES GLOBALES (~línea 520)
═══════════════════════════════════════════════════════════════
```

### Sección 1: Configuración y Variables Globales
**Línea aproximada:** 520  
**Contenido:**
- Imports de Firebase
- Variables de estado (db, mapas, tracking)
- Configuración de Firebase
- Constantes globales (DB_NAME, COLORS, etc.)

**Variables clave:**
- `db`: IndexedDB instance
- `userMap`, `adminMap`, `globalMap`: Instancias de Leaflet
- `currentUser`: Usuario actual en sesión
- `isCloudActive`: Estado de conexión Firebase

---

### Sección 2: Inicialización de Bases de Datos
**Línea aproximada:** 630  
**Contenido:**
- Setup de IndexedDB (schema, stores, índices)
- Conexión a Firebase con timeout de 5s
- Manejo de errores de conexión
- Listeners de autenticación

**Funciones principales:**
- `handleFirebaseError(error)`: Muestra errores Firebase con soluciones
- `dbRequest.onupgradeneeded`: Crea stores (users, locations, crossings)
- `onAuthStateChanged`: Listener de autenticación

---

### Sección 3: Navegación y Vistas
**Línea aproximada:** 730  
**Contenido:**
- Router SPA (Single Page Application)
- Gestión de vistas: auth, tracker, admin
- Navegación entre vistas

**Funciones principales:**
- `navigateTo(viewName)`: Cambia entre vistas
- `checkSession()`: Verifica sesión y redirige
- Precarga de mapas y rutas para admin

---

### Sección 4: Autenticación
**Línea aproximada:** 780  
**Contenido:**
- Sistema de login/logout
- Registro de usuarios
- Gestión de sesiones con localStorage
- Acceso rápido admin

**Funciones principales:**
- `setupAuthEvents()`: Maneja formularios de login
- `registerOrLoginUser(username)`: Crea/inicia sesión de usuario
- Listeners de logout con limpieza de estado

---

### Sección 5: Mapas Leaflet
**Línea aproximada:** 900  
**Contenido:**
- Inicialización de mapas con dark theme
- Configuración de polylines
- Marcadores y popups

**Funciones principales:**
- `initUserMap()`: Mapa del usuario actual
- `initAdminMap()`: Mapa del admin para ver usuarios
- Configuración de tiles CARTO dark

---

### Sección 6: Tracking GPS
**Línea aproximada:** 950  
**Contenido:**
- Control de geolocalización HTML5
- Wake Lock API para seguimiento con pantalla apagada
- Filtros de precisión GPS
- Guardado de ubicaciones

**Funciones principales:**
- `startTracking()`: Inicia watchPosition + Wake Lock
- `stopTracking()`: Detiene tracking y libera Wake Lock
- `handleGeoSuccess(position)`: Procesa coordenadas GPS
- `requestWakeLock()`: Mantiene pantalla activa
- `saveLocationToDb(entry)`: Guarda en IndexedDB + Firebase

**Filtros:**
- Descarta posiciones con accuracy > 5000m
- Rechaza coordenadas con lat/lon = 0

---

### Sección 7: Panel de Usuario
**Línea aproximada:** 1210  
**Contenido:**
- Visualización de historial de ubicaciones
- Exportar/importar datos JSON
- Renderizado de logs en tabla
- Actualización de mapa de usuario

**Funciones principales:**
- `renderUserLogs()`: Muestra tabla de ubicaciones
- `softClearUserHistory()`: Marca logs como borrados
- `updateUserMapRender(list)`: Dibuja polyline en mapa
- Exportar: Genera JSON con version + username + locations
- Importar: Valida JSON y carga datos

---

### Sección 8: Panel de Administrador
**Línea aproximada:** 1400  
**Contenido:**
- Dashboard de usuarios registrados
- Visualización de rutas por usuario
- Sincronización Firebase en tiempo real
- Listeners de Firestore

**Funciones principales:**
- `loadAdminUserDashboard()`: Carga lista de usuarios
- `selectAdminUser(username)`: Muestra ruta de usuario
- `startCloudRealtimeListeners()`: onSnapshot de users/locations
- `renderAdminUsersList(usersList)`: Renderiza grid de usuarios

---

### Sección 9: Mapa Global
**Línea aproximada:** 1780  
**Contenido:**
- Mapa con todas las rutas de usuarios simultáneamente
- Sistema de colores automático (8 colores)
- Leyenda dinámica con nombres de usuarios
- Auto-refresh con Firebase listeners

**Funciones principales:**
- `initGlobalMap()`: Inicializa mapa global
- `refreshGlobalMap()`: Carga todas las rutas
- `loadUserRoute(username, isLast)`: Dibuja polyline de un usuario
- `renderLegend(users)`: Muestra colores asignados

**Colores disponibles:**
```javascript
['#10b981', '#3b82f6', '#f59e0b', '#ef4444', 
 '#8b5cf6', '#ec4899', '#14b8a6', '#f97316']
```

---

### Sección 10: Detección de Cruces
**Línea aproximada:** 1886  
**Contenido:**
- Algoritmo de intersección de rutas
- Cálculo de distancia Haversine
- Detección punto-a-segmento
- Guardado de cruces en DB

**Funciones principales:**
- `detectAllCrossings()`: Compara todas las rutas
- `detectCrossings(route1, route2, user1, user2)`: Encuentra intersecciones
- `distancePointToSegment(point, segStart, segEnd)`: Distancia mínima
- `haversineDistance(lat1, lon1, lat2, lon2)`: Distancia geográfica
- `saveCrossings(crossings)`: Guarda en IndexedDB + Firebase
- `renderCrossings()`: Muestra lista de cruces

**Parámetros:**
- Threshold: 20 metros para considerar cruce
- Radio terrestre: 6371000 metros

---

### Sección 11: Configuración de Nube
**Línea aproximada:** 1702  
**Contenido:**
- Modal de configuración Firebase
- Guardado de credenciales en localStorage
- Soporte para múltiples proyectos Firebase

**Funciones principales:**
- `openCloudModal()`: Abre modal de configuración
- `saveCloudConfig()`: Guarda config Firebase custom
- `clearCloudConfig()`: Elimina config y recarga

**Storage key:** `geotracker_cloud_config`

---

### Sección 12: Utilidades y Service Worker
**Línea aproximada:** 2114  
**Contenido:**
- Funciones helper de UI
- Registro de Service Worker para PWA
- Exports al scope global

**Funciones principales:**
- `updateDbStatus(text, badgeClass)`: Actualiza badge de estado DB
- Service Worker registration con navigator.serviceWorker.register()

**Exports globales:**
- `window.selectAdminUser`
- `window.startTracking`
- `window.stopTracking`
- `window.openCloudModal`
- `window.closeCloudModal`
- `window.saveCloudConfig`
- `window.clearCloudConfig`
- `window.switchAdminTab`
- `window.refreshGlobalMap`
- `window.detectAllCrossings`

---

## 🔍 Cómo encontrar código específico

### Por funcionalidad:
1. **GPS no funciona** → Sección 6 (línea ~950)
2. **Firebase no conecta** → Sección 2 (línea ~630)
3. **Mapa no se ve** → Sección 5 o 9 (línea ~900 o ~1780)
4. **Cruces no detectan** → Sección 10 (línea ~1886)
5. **Exportar/importar falla** → Sección 7 (línea ~1210)
6. **Admin no ve usuarios** → Sección 8 (línea ~1400)

### Por error:
1. **"Cannot read property of null"** → Revisar sección que accede a DOM
2. **"Permission denied" (Firebase)** → Sección 2, función handleFirebaseError
3. **"Geolocation not supported"** → Sección 6, startTracking()
4. **Wake Lock falla** → Sección 6, requestWakeLock()

---

## 🎨 Convenciones de Código

### Nomenclatura:
- **Variables globales:** camelCase (userMap, isCloudActive)
- **Constantes:** UPPER_SNAKE_CASE (DB_NAME, STORE_LOCATIONS)
- **Funciones:** camelCase (startTracking, renderUserLogs)
- **Stores IndexedDB:** snake_case (locations, crossings)

### Emojis en console.log:
- ✅ Éxito
- ❌ Error crítico
- ⚠️ Warning/Advertencia
- 🔄 Proceso en curso
- 📍 Geolocalización
- 💾 Guardado en DB
- ☁️ Operación Firebase

### Comentarios:
```javascript
// --- TÍTULO DE SECCIÓN ---
// Explicación de función
/* Bloque de comentario para algoritmos complejos */
```

---

## 🚀 Tips de Performance

1. **IndexedDB transactions:** Siempre especificar "readonly" o "readwrite"
2. **Firebase listeners:** Limpiar con `unsubscribe()` al hacer logout
3. **Leaflet maps:** Llamar `map.invalidateSize()` después de cambios CSS
4. **Wake Lock:** Reconectar en evento `visibilitychange`

---

## 🐛 Debugging

### Abrir DevTools y buscar:
```javascript
// En Console, filtrar por emoji:
✅  // Ver éxitos
❌  // Ver errores
📍  // Ver tracking GPS
```

### Inspeccionar estado:
```javascript
// En Console:
db                    // Ver IndexedDB
currentUser          // Usuario actual
isCloudActive        // Estado Firebase
watchId              // ID de tracking GPS
wakeLock             // Estado de Wake Lock
```

---

## 📦 Dependencias Externas

Todas cargadas desde CDN:
- **Firebase 11.6.1:** App, Auth, Firestore
- **Leaflet 1.9.4:** Mapas interactivos
- **Tailwind CSS v4:** Estilos (browser CDN)
- **Lucide Icons:** Iconografía

---

## 🔄 Flujo de Datos

```
User Input → Auth → IndexedDB → Firebase (opcional)
                              ↓
                           Sync Admin
                              ↓
                         Global Map
                              ↓
                    Crossings Detection
```

---

## 📝 Próximos Pasos (si se modulariza)

Si el proyecto crece más de 3000 líneas, considerar:
1. Separar en `js/firebase.js`, `js/maps.js`, etc.
2. Usar módulos ES6 con `export/import`
3. Añadir tests unitarios con Vitest
4. Implementar bundler (Vite) para optimización

Por ahora, la arquitectura monolítica es óptima para:
- Deployment simple
- Debugging rápido
- Caching eficiente del Service Worker
