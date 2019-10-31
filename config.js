const config = {
  duration: process.env.DURATION || 30, // in seconds
  fps: process.env.FPS || 30,
  height: process.env.HEIGHT || 1024,
  outputPattern: process.env.OUTPUT_PATTERN || '/tmp/frames/%010d.png',
  url: process.env.URL || 'https://storage.googleapis.com/nius-artefacts/news-title/512x1024.html',
  width: process.env.WIDTH || 512
};

module.exports = config;
