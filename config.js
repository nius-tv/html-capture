const config = {
  duration: process.env.DURATION, // in seconds
  fps: process.env.FPS,
  height: process.env.HEIGHT,
  outputPattern: process.env.OUTPUT_PATTERN,
  url: process.env.URL,
  width: process.env.WIDTH
};

module.exports = config;
