const chokidar = require('chokidar');
const Tail = require('tail').Tail;

function tailFile(path) {
    tail = new Tail(path);
    tail.on("line", function(data) {
      console.log(data);
    });
}

function watchDirectory(path) {
    var watcher = chokidar.watch(path, {ignored: /^\./, persistent: true, usePolling: true});
    watcher.on('add', tailFile)
}

watchDirectory(process.argv[2])