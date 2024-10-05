'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "4c03db8f1aef806e98d4b1cf83856729",
"assets/assets/images/7.jpg": "97a9ea87ab9e4a0e81ff61125c81302e",
"assets/assets/images/11.jpg": "0c3e689763447b6c7b7e59abe1707481",
"assets/assets/images/18.jpg": "e2d3e108b2397f3a350ef890bd3e57e4",
"assets/assets/images/10.jpg": "53aee9f4a2555e334cdecad862a75cbe",
"assets/assets/images/4.jpg": "75daffaf9507cf5cd94c8ab7215cbee1",
"assets/assets/images/3.jpg": "d5234c093f2b93922e93a90c0ef09926",
"assets/assets/images/pic1.jpg": "a7339f5f99f65c85df54ca2809367017",
"assets/assets/images/19.jpg": "30ffe22565dbbfb1a59c8b21125708a8",
"assets/assets/images/5.jpg": "e5a59e6755d2e728afb7a604e15dbfca",
"assets/assets/images/naverMap.png": "98a81f1bad051da3d1e7b95fa2fb00ca",
"assets/assets/images/15.jpg": "4c8824a82c74d56b6eec1ee47896d63f",
"assets/assets/images/6.jpg": "ca6c0051068d5827195dffbff4bac473",
"assets/assets/images/9.jpg": "037949817a51d257ea4ee7e1f924b5fb",
"assets/assets/images/13.jpg": "55adf66383820111e87afb03cacab673",
"assets/assets/images/calendar.png": "d0720462dd44665ab2c0c13e214b24cf",
"assets/assets/images/16.jpg": "a923c92ff05a703b4dd8a94bbd9fbcd7",
"assets/assets/images/12.jpg": "5c0bedbe6169bdca3571ffe7a17f63b6",
"assets/assets/images/1.png": "8b714639bf194441e9c17f67fdbbe384",
"assets/assets/images/8.jpg": "7ee176f578a624953e4f57a216848cec",
"assets/assets/images/tMap.png": "b962428e892b4fac0d6534226c435092",
"assets/assets/images/14.jpg": "56aa90066b94ba3b6bcd680cdc53ab80",
"assets/assets/images/2.jpg": "65c4992107e51d90d25aada4ea477fba",
"assets/assets/images/17.jpg": "b044a79763f7a72c57bac0bcc2b8731f",
"assets/assets/images/kakaoMap.png": "fce4aebdf2121930e541d15024b5c6fc",
"assets/assets/map.html": "ed8fe0a928c6f70b679890b237f49d56",
"assets/assets/fonts/TTF/MaruBuri-Bold.ttf": "e5139bb28a204e9c131d795ddfa22ce4",
"assets/assets/fonts/TTF/MaruBuri-Regular.ttf": "3330a8e15ed443f2a5598f66a19fd3b2",
"assets/AssetManifest.bin.json": "7dd8746811eb294a1c304b254b8a36d6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "66029fdc68cdbff2caddb963d2a222e9",
"assets/FontManifest.json": "99d5a906ffe11cfc7086fc0d932f58f1",
"assets/NOTICES": "68a8b6687be5e57e22e43a0d22b1d473",
"assets/fonts/MaterialIcons-Regular.otf": "1c26451afb9df8aac0239f60efee3d2b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"main.dart.js": "cf35f04a585c970d46b6c5e3604b33f3",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"flutter_bootstrap.js": "dfbc755adb2a187ebef614d2a7f49bde",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"index.html": "b4209029b9bc871ab01961a9db61ce88",
"/": "b4209029b9bc871ab01961a9db61ce88",
"version.json": "57eb38053c7751de28fbbf24990f64f7",
"manifest.json": "a02788f63d6c7a7a7c2783bc1bd3d5bf"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}