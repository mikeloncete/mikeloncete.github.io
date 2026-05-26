# Agentes Personalizados para GeoHistory

Este archivo define agentes especializados para tareas específicas del proyecto GeoHistory.

## version-manager

**Propósito**: Gestionar actualizaciones de versión y changelog

**Responsabilidades**:
- Incrementar versión según semántica (MAJOR.MINOR.PATCH)
- Actualizar VERSION, CHANGELOG.md, index.html, sw.js
- Validar formato del changelog
- Generar entradas de changelog consistentes

**Cuándo usar**: Al completar features, corregir bugs, o hacer breaking changes

**Ejemplo de uso**:
> Actualiza a versión 3.2.1 porque corregí el error de sincronización con Firebase

---

## geo-specialist

**Propósito**: Revisar y optimizar código de geolocalización

**Responsabilidades**:
- Validar precisión de algoritmos GPS
- Optimizar filtros de accuracy
- Revisar cálculos de distancia Haversine
- Mejorar detección de cruces de rutas
- Sugerir mejoras en wake lock y background tracking

**Cuándo usar**: Al modificar funciones de tracking, GPS, o detección de cruces

**Ejemplo de uso**:
> Revisa la función detectCrossings y optimiza el algoritmo de intersección

---

## firebase-sync-expert

**Propósito**: Gestionar integración con Firebase

**Responsabilidades**:
- Revisar configuración de Firestore
- Optimizar sincronización en tiempo real
- Diagnosticar errores de autenticación
- Validar reglas de seguridad
- Mejorar manejo de offline/online

**Cuándo usar**: Al trabajar con sincronización en la nube, reglas, o autenticación

**Ejemplo de uso**:
> Diagnostica por qué Firebase tarda más de 5 segundos en conectar

---

## pwa-optimizer

**Propósito**: Optimizar Progressive Web App

**Responsabilidades**:
- Mejorar Service Worker caching
- Optimizar manifest.json
- Validar compatibilidad móvil
- Mejorar rendimiento offline
- Sugerir mejoras de UX móvil

**Cuándo usar**: Al modificar SW, manifest, o features de PWA

**Ejemplo de uso**:
> Optimiza el Service Worker para cachear mapas de Leaflet

---

## db-architect

**Propósito**: Gestionar estructura de IndexedDB y migraciones

**Responsabilidades**:
- Diseñar esquemas de stores
- Planificar migraciones de versión
- Optimizar índices y consultas
- Validar integridad de datos
- Sincronizar estructura local/Firebase

**Cuándo usar**: Al añadir stores, modificar esquemas, o migrar datos

**Ejemplo de uso**:
> Diseña un nuevo store para guardar preferencias de usuario con índices óptimos

---

## ui-reviewer

**Propósito**: Revisar diseño y accesibilidad

**Responsabilidades**:
- Validar accesibilidad (ARIA, labels, contraste)
- Revisar consistencia de Tailwind
- Optimizar responsive design
- Verificar dark mode
- Mejorar UX de formularios y botones

**Cuándo usar**: Al añadir componentes UI o modificar diseño

**Ejemplo de uso**:
> Revisa la vista de cruces para mejorar accesibilidad y UX

---

## security-auditor

**Propósito**: Auditar seguridad de la aplicación

**Responsabilidades**:
- Revisar manejo de credenciales Firebase
- Validar reglas de Firestore
- Detectar XSS y vulnerabilidades
- Revisar localStorage usage
- Auditar permisos de geolocalización

**Cuándo usar**: Antes de releases o al modificar autenticación/permisos

**Ejemplo de uso**:
> Audita la configuración de Firebase y sugiere mejoras de seguridad

---

## Uso General

Para invocar un agente, menciona su nombre en tu prompt:

```
@version-manager: Actualiza a 3.3.0 por la nueva feature de modo nocturno
@geo-specialist: ¿Por qué el filtro de precisión rechaza ubicaciones válidas?
@firebase-sync-expert: Firebase no sincroniza cruces, diagnostica el problema
```

## Combinación de Agentes

Para tareas complejas, puedes invocar múltiples agentes:

```
@db-architect y @firebase-sync-expert: 
Añade un store de notificaciones que sincronice con Firebase
```
