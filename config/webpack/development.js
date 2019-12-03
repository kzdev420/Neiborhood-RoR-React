process.env.NODE_ENV = process.env.NODE_ENV || 'development'
process.env.REACT_APP_GOOGLE_MAPS_API_KEY = "AIzaSyBmGjYklnL-pnGO_H5zZvG93uL89DLnEQU"
const environment = require('./environment')

module.exports = environment.toWebpackConfig()
