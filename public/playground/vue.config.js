module.exports = {
  configureWebpack: {
    output: {
      filename: 'js/playground.js',
    }
  },
  chainWebpack: config => {
    config.optimization.delete('splitChunks')
  },
  css: {
    extract: {
      filename: 'css/playground.css',
    },
  },
  baseUrl: './'
}