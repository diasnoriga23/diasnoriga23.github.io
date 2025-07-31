'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "45f02557d6e2f9102fca143ace195c86",
"version.json": "12a92ef79835b40a6093bcc932b54998",
"index.html": "6457e90aa21e5abf46029d1e9bffb76d",
"/": "6457e90aa21e5abf46029d1e9bffb76d",
"main.dart.js": "db0b960a46c5e3d34e8167a91e1fde4c",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "fe3efdabbab826762c914b1b0811f44f",
"assets/AssetManifest.json": "7f651965b123e88bf0ac12bc2665361d",
"assets/NOTICES": "7cddbc17e3e6a796910d27c3e17b66c7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "d48d8305178d76cfdfe338da292d0672",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4ad83ef0fdbc76b276255d9243d00f08",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/tehibu.png": "55ec88b897cdfbb91df2d08327d75709",
"assets/assets/git.png": "a9be7379735ca1e230a377621df8844c",
"assets/assets/link.png": "d1d1edb1e5f60affa8487ba7607f46ba",
"assets/assets/singabret.png": "d839e61fcbe60a93c2f327f92040af1b",
"assets/assets/dummy.png": "564cceaf4c07a2c584bc36e84f65a351",
"assets/assets/animasi.json": "0fa774c887fde087dc28cdecf9266dcb",
"assets/assets/makerindo.png": "ebb8e0d490f1a4423d54289722fb5955",
"assets/assets/trus/trus8.png": "d6aa20f1863de7d0f1a737b715d9193e",
"assets/assets/trus/trus9.png": "52ef6f09b930d8e49ba9e4017887febe",
"assets/assets/trus/trus11.png": "302755d68d999492fa7b0e9a08597e84",
"assets/assets/trus/trus10.png": "94fe8f0f4091d0bc1f524a07aec64808",
"assets/assets/trus/trus1.png": "6325fc8d8d5df3fce781ed1f0ea1c3cc",
"assets/assets/trus/trus2.png": "be21f142608ed65b6adef2d1d05a2117",
"assets/assets/trus/trus3.png": "4c5e3fa082f62e769ebdd2739ae8fdf2",
"assets/assets/trus/trus7.png": "e1f9f401ca5ee9924657fa162127bc79",
"assets/assets/trus/trus6.png": "089e53b2676fc004e59c8f293b44db72",
"assets/assets/trus/trus4.png": "c59fee999e6ec95432b73c283600e5bf",
"assets/assets/trus/trus5.png": "40e893be9fd4282fa76d8b5b70f63355",
"assets/assets/dewan.png": "de5844c75ff5d82a4448b45958ebb616",
"assets/assets/rt.png": "5f229feaa5836f659c4c15470c1613e5",
"assets/assets/appstore.png": "35dca8c6345ad060ba66cb2124d6973e",
"assets/assets/grid.png": "22b18bc4613a3defb971af59cf9e93e6",
"assets/assets/warga.png": "48ee6e3079877a31defdefb3fb3fb2b4",
"assets/assets/ig.png": "8502c3a7075d64f1c7d605bc62c50ddb",
"assets/assets/project/tehibu.png": "b050b801a10fcb8d49a59e1c51ade4c0",
"assets/assets/project/singabret.png": "167a8a3845e140b299efa233a4eee7aa",
"assets/assets/project/makerindo.png": "27a345fde9fb2474e2e231be7b71b180",
"assets/assets/project/dewan.png": "faed9ac1fff46ee609759ac8ecc69601",
"assets/assets/project/rt.png": "224a4a94ee353d6381dce34d2bb1572d",
"assets/assets/project/warga.png": "eab021f0a6003cea4bef3c41e5228eb0",
"assets/assets/project/wqmcs.png": "f3c0462658a21adebb773b04cafc8e3b",
"assets/assets/project/sijawara.png": "c2c561971b39b2137e47140ae7d8d542",
"assets/assets/project/ferad.png": "dcff3c863db974223f17a9aad194b8d7",
"assets/assets/project/persib.png": "c3279cc0855080d02ea5f42ef3489602",
"assets/assets/project/emub.png": "e2e036ba577eb5e92efc39651c2f438d",
"assets/assets/wqmcs.png": "3b84a4f41ee817000910634f1267d246",
"assets/assets/trustCompany.json": "6a4db765cb4c08b7fed2576d48b017a1",
"assets/assets/sijawara.png": "9c8885ccdf9411fea1b3caa3afdd046c",
"assets/assets/portofolio.json": "b92cceb32d862921a21c303ca8afb3f5",
"assets/assets/ferad.png": "d15c05dc8a3a910836c9756308dcf569",
"assets/assets/persib.png": "a6195727ca59752f3895860c6cc4afe5",
"assets/assets/playstore.png": "91711d3ba88c04145141a732588d77ad",
"assets/assets/emub.png": "2781bf06014862a72e07eae1bb80a25d",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
