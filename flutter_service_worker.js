'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "f393d3c16b631f36852323de8e583132",
"main.dart.js": "a6d630d2c946da6a4b176f6706ada63b",
"assets/FontManifest.json": "99d5a906ffe11cfc7086fc0d932f58f1",
"assets/AssetManifest.bin": "75f2d67c44171723fce6e20bf5846553",
"assets/fonts/MaterialIcons-Regular.otf": "cd9e89e29a71ed62c013267fc5822ab0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/assets/fonts/TTF/MaruBuri-Regular.ttf": "3330a8e15ed443f2a5598f66a19fd3b2",
"assets/assets/fonts/TTF/MaruBuri-Bold.ttf": "e5139bb28a204e9c131d795ddfa22ce4",
"assets/assets/images/naverMap.png": "98a81f1bad051da3d1e7b95fa2fb00ca",
"assets/assets/images/19.jpg": "214c8deb12798240ea37f9bca3588fab",
"assets/assets/images/1.jpg": "348e9f4a2e31c6acfc629fe80cc363e2",
"assets/assets/images/12.jpg": "48e6849c0358838aeca0ac18243fac99",
"assets/assets/images/16.jpg": "9b92ab6da6edfb2a215315693ef17993",
"assets/assets/images/4.jpg": "c7c29db5d3b38f1d4533c02af2ccc9ee",
"assets/assets/images/10.jpg": "7036cd735d5952506934e5841fcfc333",
"assets/assets/images/tMap.png": "b962428e892b4fac0d6534226c435092",
"assets/assets/images/5.jpg": "065339eb99bad06301de53442ef5c17f",
"assets/assets/images/9.jpg": "e9b15eab36dad1c258cfd8e9b7a81af9",
"assets/assets/images/14.jpg": "18eee34546072d93c424b478eff50c4f",
"assets/assets/images/6.jpg": "bb0ff57daaab92648703c62cdb113959",
"assets/assets/images/8.jpg": "6b6a32f75fe83e530f10b83f7101d18b",
"assets/assets/images/17.jpg": "b6d2439403a49bf654a563e525927e54",
"assets/assets/images/calendar.png": "d0720462dd44665ab2c0c13e214b24cf",
"assets/assets/images/18.jpg": "d89f83dc5a39ed6d6b30b8091cd9b9bb",
"assets/assets/images/3.jpg": "ec11698ca2cc68e218f330a095e34dda",
"assets/assets/images/15.jpg": "b16635e8837337e54bfbd943943851a8",
"assets/assets/images/kakaoMap.png": "fce4aebdf2121930e541d15024b5c6fc",
"assets/assets/images/11.jpg": "00d6c19e4c4b74e11c686093d8007cb4",
"assets/assets/images/13.jpg": "e5ea401844d6d41d2aeb6aafa4681826",
"assets/assets/images/7.jpg": "666cc7e0db7569eb67bf21cf9e0eb628",
"assets/assets/images/2.jpg": "6fd4df50a0cb34bbf996c3286d2a14d6",
"assets/assets/map.html": "ed8fe0a928c6f70b679890b237f49d56",
"assets/NOTICES": "a2d5d63c72fa5da0c734fd90d5ec9d3c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "80f2cf83135353a440cefb8aeb91d815",
"assets/AssetManifest.bin.json": "630a6651809ab794c9857a58ae28c32f",
"index.html": "1bcc50e30017a8624650055bd8d66543",
"/": "1bcc50e30017a8624650055bd8d66543",
"manifest.json": "a02788f63d6c7a7a7c2783bc1bd3d5bf",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "57eb38053c7751de28fbbf24990f64f7",
"flutter_bootstrap.js": "19dd3a2c12cd9d0144351bff8679d71e"};
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
