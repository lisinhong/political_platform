module.exports = {
  configureWebpack: {
    output: {
      filename: 'js/playground.js',
    }
  },
  chainWebpack: config => {
    config.optimization.delete('splitChunks');
    config.module
      .rule('images')
      .use('url-loader')
      .loader('url-loader')
      .tap(options => {
        options.limit = 0
        return options
      })
  },
  css: {
    extract: {
      filename: 'css/playground.css',
    },
  },
  baseUrl: './'
}