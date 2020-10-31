const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  "window.jQuery": "jquery",
  "window.$": "jquery",
  Popper: ['popper.js', 'default'],
  Plotly: "plotly.js"
}))

environment.config.merge({
  module: {
    rules: [
      {
        test: require.resolve('jquery'),
        loader: 'expose-loader',
        options: {
          exposes: ['$', 'jQuery'],
        },
      },
      {
        test: require.resolve('@rails/ujs'),
        loader: 'expose-loader',
        options: {
          exposes: ['Rails'],
        },
      }
    ]
  }
})

module.exports = environment