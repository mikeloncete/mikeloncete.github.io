// Service Worker para GeoHistory PWA
const CACHE_NAME = 'geohistory-v3.1';
const urlsToCache = [
    '/',
    '/index.html',
    '/manifest.json'
];

// Instalación - cachear recursos estáticos
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then((cache) => {
                console.log('✅ Service Worker: Cache abierto');
                return cache.addAll(urlsToCache);
            })
            .catch((err) => {
                console.warn('⚠️ Service Worker: Error al cachear:', err);
            })
    );
    self.skipWaiting();
});

// Activación - limpiar cachés antiguos
self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((cacheNames) => {
            return Promise.all(
                cacheNames.map((cacheName) => {
                    if (cacheName !== CACHE_NAME) {
                        console.log('🗑️ Service Worker: Eliminando caché antigua:', cacheName);
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
    return self.clients.claim();
});

// Fetch - estrategia Network First (red primero, caché como respaldo)
self.addEventListener('fetch', (event) => {
    // Solo cachear peticiones GET (POST, PUT, DELETE no se pueden cachear)
    if (event.request.method !== 'GET') {
        event.respondWith(fetch(event.request));
        return;
    }

    event.respondWith(
        fetch(event.request)
            .then((response) => {
                // Si la red funciona, actualizar caché y devolver respuesta
                // Solo cachear respuestas exitosas
                if (response && response.status === 200 && response.type === 'basic') {
                    const responseToCache = response.clone();
                    caches.open(CACHE_NAME).then((cache) => {
                        cache.put(event.request, responseToCache);
                    });
                }
            .catch (() => {
                    // Si la red falla, intentar servir desde caché
                    return caches.match(event.request).then((cachedResponse) => {
                        if (cachedResponse) {
                            return cachedResponse;
                        }
                        // Si no hay caché, mostrar página offline básica
                        return new Response('Offline - No hay conexión', {
                            status: 503,
                            statusText: 'Service Unavailable',
                            headers: new Headers({ 'Content-Type': 'text/plain' })
                        });
                    });
                })
    );
});
