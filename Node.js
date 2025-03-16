const http = require('http');

const target = 'http://example.com';
const packets = 1000;

for (let i = 0; i < packets; i++) {
    http.get(target, (res) => {
        console.log(`Request ${i + 1} sent`);
    }).on('error', (err) => {
        console.error(`Request ${i + 1} failed: ${err.message}`);
    });
}