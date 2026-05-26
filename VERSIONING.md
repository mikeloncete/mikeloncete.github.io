# Guía de Versionado

## Cuándo incrementar la versión

### MAJOR (X.0.0)
- Cambios incompatibles en la estructura de datos
- Rediseño completo de la interfaz
- Cambios que rompen compatibilidad con versiones anteriores

### MINOR (x.X.0)
- Nueva funcionalidad (ej: nueva pestaña, nuevo sistema)
- Mejoras significativas en características existentes
- Cambios en la base de datos que mantienen compatibilidad

### PATCH (x.x.X)
- Correcciones de bugs
- Pequeñas mejoras de rendimiento
- Ajustes visuales menores
- Correcciones de typos

## Proceso de actualización

1. **Hacer cambios en el código**

2. **Actualizar VERSION**
   ```bash
   echo "3.3.0" > VERSION
   ```

3. **Actualizar CHANGELOG.md**
   - Añadir nueva sección con fecha
   - Clasificar cambios en: Añadido, Modificado, Corregido, Eliminado
   - Ser conciso (1 línea por cambio)

4. **Actualizar versiones en código**
   - `index.html` (header "v3.X")
   - `index.html` (exportData version)
   - `sw.js` (CACHE_NAME)

5. **Commit**
   ```bash
   git add .
   git commit -m "chore: bump version to 3.3.0"
   git tag v3.3.0
   git push && git push --tags
   ```

## Estructura del CHANGELOG

```markdown
## [3.3.0] - 2026-05-27

### Añadido
- Nueva característica X

### Modificado
- Mejora en Y

### Corregido
- Bug en Z
```

## Ejemplo de cambio MINOR

Si añades "modo de ahorro de batería":

```markdown
## [3.3.0] - 2026-05-27

### Añadido
- Modo de ahorro de batería para rastreo prolongado
- Toggle en panel de control para activar/desactivar
```

## Ejemplo de cambio PATCH

Si corriges un error de botón:

```markdown
## [3.2.1] - 2026-05-26

### Corregido
- Botón de exportar no respondía en iOS Safari
```

## Navegación del Código

El código de `index.html` está organizado en **12 secciones** con separadores visuales.

Para encontrar dónde hacer cambios:
- **GPS/Tracking:** Sección 6 (línea ~950)
- **Mapas:** Sección 5 (línea ~900) o Sección 9 (línea ~1780)
- **Firebase:** Sección 2 (línea ~630) o Sección 8 (línea ~1400)
- **Cruces:** Sección 10 (línea ~1886)
- **UI Usuario:** Sección 7 (línea ~1210)
- **Admin:** Sección 8 (línea ~1400)

Ver [README_CODE.md](README_CODE.md) para guía completa de navegación.

