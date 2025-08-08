'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3a8031a5f9060ed1aab25e51bc3b3940",
"assets/assets/animasi.json": "0fa774c887fde087dc28cdecf9266dcb",
"assets/assets/stack/flutter.png": "91b78f5fc2fb5bba938430d631f7fa07",
"assets/assets/stack/vscode.png": "6cf57e018deda6ec5d878fa0aecc6de7",
"assets/assets/stack/java.png": "63cc03184cc393176a7f720269c9349b",
"assets/assets/stack/figma.png": "9410557dcba81139bbb140184d2c8ad9",
"assets/assets/stack/android.png": "5e7d1b22308f7f497c3a2accb87abaaa",
"assets/assets/stack/dart.png": "ea1f788534e1b53f7baa61610e85e1c6",
"assets/assets/stack/firebase.png": "e6883961fd12a8f425d6b592fab4d032",
"assets/assets/stack.json": "6f28ad3107d3d69cd36bc9eb3dcdee0b",
"assets/assets/trus/trus4.png": "c59fee999e6ec95432b73c283600e5bf",
"assets/assets/trus/trus9.png": "52ef6f09b930d8e49ba9e4017887febe",
"assets/assets/trus/trus6.png": "089e53b2676fc004e59c8f293b44db72",
"assets/assets/trus/trus2.png": "be21f142608ed65b6adef2d1d05a2117",
"assets/assets/trus/trus8.png": "d6aa20f1863de7d0f1a737b715d9193e",
"assets/assets/trus/trus11.png": "302755d68d999492fa7b0e9a08597e84",
"assets/assets/trus/trus10.png": "94fe8f0f4091d0bc1f524a07aec64808",
"assets/assets/trus/trus7.png": "e1f9f401ca5ee9924657fa162127bc79",
"assets/assets/trus/trus5.png": "40e893be9fd4282fa76d8b5b70f63355",
"assets/assets/trus/trus3.png": "4c5e3fa082f62e769ebdd2739ae8fdf2",
"assets/assets/trus/trus1.png": "6325fc8d8d5df3fce781ed1f0ea1c3cc",
"assets/assets/link.png": "d1d1edb1e5f60affa8487ba7607f46ba",
"assets/assets/experience/aksii.png": "3b3ee0ff15bc88f5b451df2045fdde9a",
"assets/assets/experience/diskominfo.png": "cb2181639158777bc0b4772195dba4d5",
"assets/assets/experience/visual.png": "62f1c0810ecca34e4a20961685af215d",
"assets/assets/experience/ng.png": "b3f37891c0c70ca985acef18150bb9ef",
"assets/assets/trustCompany.json": "6a4db765cb4c08b7fed2576d48b017a1",
"assets/assets/playstore.png": "91711d3ba88c04145141a732588d77ad",
"assets/assets/git.png": "a9be7379735ca1e230a377621df8844c",
"assets/assets/experience.json": "9ef2cb0e4df6cabb5e31755c4642ca21",
"assets/assets/portofolio.json": "51ae8a9ecf7b9b0f9f22022108925f74",
"assets/assets/project/sijawara.png": "cfea7765cd41a799ee10844d7c689255",
"assets/assets/project/wqmcs.png": "e6e067c49f89bac5bd54fb44937dcb8a",
"assets/assets/project/porto.png": "803f940ad0ec9c87926d56d3e7c3413e",
"assets/assets/project/tehibu.png": "b6bb4824ef2c92f03d285f4cf3c3cdea",
"assets/assets/project/rt.png": "224a4a94ee353d6381dce34d2bb1572d",
"assets/assets/project/clipboard.png": "352c91e66131642a81348f01e17048d1",
"assets/assets/project/singabret.png": "a0ee7752a0d55e5ccb0213513dd84da7",
"assets/assets/project/swiverp.png": "958ae1332f74d379b23ca9e6b7e99d88",
"assets/assets/project/ccm.png": "5d50f8723aa7fd963c44b7ddec89dd39",
"assets/assets/project/emub.png": "e2e036ba577eb5e92efc39651c2f438d",
"assets/assets/project/makerindo.png": "27a345fde9fb2474e2e231be7b71b180",
"assets/assets/project/asics.png": "190cc47c796aed22a66f66d2698ba03d",
"assets/assets/project/persib.png": "37f1ee5ffcfa317a5a94d32761915bdd",
"assets/assets/project/warga.png": "eab021f0a6003cea4bef3c41e5228eb0",
"assets/assets/project/dewan.png": "956674fb6d303dde3a9d7c8a1308d707",
"assets/assets/project/ferad.png": "31fba1f71ac89d0ccd399a47b17fec95",
"assets/assets/appstore.png": "35dca8c6345ad060ba66cb2124d6973e",
"assets/assets/ig.png": "8502c3a7075d64f1c7d605bc62c50ddb",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "2a798de1e6474ff89b70fd581db0b662",
"assets/fonts/MaterialIcons-Regular.otf": "ea3fb0f1c6653d69d8a16de948673601",
"assets/AssetManifest.bin.json": "35fd9fc8ed1ed82f3e801ac35b09c762",
"assets/NOTICES": "a08a147556f828a9f016de0c339aa6d2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"version.json": "12a92ef79835b40a6093bcc932b54998",
"manifest.json": "fe3efdabbab826762c914b1b0811f44f",
"CNAME": "76f64b2f59309b017fbc4b16230c621e",
"flutter_bootstrap.js": "ac54f3fe919c2f318c348f37cc9b829e",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"index.html": "7fa7148204f0dc0b91b1c306053f3379",
"/": "7fa7148204f0dc0b91b1c306053f3379",
"googlee86ca16a60d06fdf.html": "dc4b73d9e65b1f14497239d2bfdb5666",
"favicon.png": "4b74784132236c0e995b6b873d7be326",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"main.dart.js": "e69c152bca883b3f4b71a72ebb3a1603"};
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
