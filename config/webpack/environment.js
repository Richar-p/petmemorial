const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
const TerserPlugin = require("terser-webpack-plugin");

environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}));

environment.config.merge({
    output: {
        // Choose whatever you want for `library`, [name] is a placeholder
        library: ['Packs', 'application'],

        // Attach the library to the global scope in the browser
        libraryTarget: 'window'
    },
})

const config = environment.toWebpackConfig();

config.resolve.alias = {
    jquery: 'jquery/src/jquery'
};

config.optimization = {
    minimizer: [
        new TerserPlugin({
            parallel: true,
            terserOptions: {
                ecma: 6,
            },
        }),
    ],
};

module.exports = environment;