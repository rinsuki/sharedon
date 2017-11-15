const webpack = require("webpack")

module.exports = {
    entry: "./src/index.js",
    output: {
        path: __dirname+"/public/assets",
        filename: "bundle.js"
    },
    devServer: {
        contentBase: "public",
        publicPath: "/assets/"
    },
    plugins: [
        new webpack.ProvidePlugin({
            riot: "riot"
        })
    ],
    module: {
        loaders: [
            {test: /\.tag$/, exclude: /node_modules/, loader: 'riot-tag-loader', query: {
                type: "none",
                template: "pug"
            }},
            {test: /\.css$/, loader: 'style-loader!css-loader'},
        ]
    }
}