const config = require('./config');
const timesnap = require('timesnap');

module.exports = function() {
  // --no-sandbox: allows Chrome to run as root
  // viewport: Chrome's "viewable" space
  timesnap({
    ...config,
    launchArguments: [
      '--no-sandbox'
    ],
    transparentBackground: true,
    viewport: {
      height: config['height'],
      width: config['width']
    }
  });
}();
