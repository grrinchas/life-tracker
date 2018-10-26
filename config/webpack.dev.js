/**
 * Webpack configuration for development.
 */
import Webpack from 'webpack';
import merge from 'webpack-merge';
import common from './webpack.common';
import AppConfig from '../app.confg';
import BrowserSyncPlugin  from 'browser-sync-webpack-plugin'

export default merge.smart(common, {
    devtool: 'inline-source-map',
    mode: 'development',
    module: {
        rules: [
            {
                test: /\.elm$/,
                use: [
                    {loader: 'elm-hot-webpack-loader'},
                    {
                        loader: 'elm-webpack-loader',
                        options: {
                            cwd: AppConfig.paths.root,
                            debug: true,
                            forceWatch: true,
                        }
                    }

                ]
            },
        ],
    },
    entry: {
        main:
            [
                // This entry is used by hot reloading
                'webpack-hot-middleware/client',
                // This is the main entry
                AppConfig.entries.main
            ],
    },
    output: {
        publicPath: '/',
        // Output files in the build directory in the memory
        path: AppConfig.paths.build,
    },
    plugins: [
        // OccurrenceOrderPlugin is needed for webpack 1.x only
        new Webpack.optimize.OccurrenceOrderPlugin(),
        new Webpack.HotModuleReplacementPlugin(),
        // Use NoErrorsPlugin for webpack 1.x
        new Webpack.NoEmitOnErrorsPlugin(),
        new BrowserSyncPlugin({
            // browse to http://localhost:3000/ during development,
            // ./public directory is being served
            host: 'localhost',
            port: 3000,
        })
    ],
});
