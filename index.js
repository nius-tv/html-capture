const config = require('./config');
const timesnap = require('timesnap');

module.exports = function() {
  // --no-sandbox: allows Chrome to run as root
  // viewport: Chrome's "viewable" space
  timesnap({
    ...config,
    launchArguments: [
      '--disable-accelerated-2d-canvas',
      '--disable-dev-shm-usage',
      '--disable-gpu',
      '--disable-setuid-sandbox',
      '--no-first-run',
      '--no-sandbox',
      '--no-zygote',
      '--single-process'
    ],
    transparentBackground: true,
    viewport: {
      height: config['height'],
      width: config['width']
    }
  });
}();
