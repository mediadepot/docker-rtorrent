const CONFIG = {
  baseURI:  '/',
  dbCleanInterval: 1000 * 60 * 60,
  dbPath: '/srv/rtorrent/data/flood/db/',
  floodServerHost: '0.0.0.0',
  floodServerPort: 8081,
  maxHistoryStates: 30,
  pollInterval: 1000 * 5,
  secret: 'flood',
  scgi: {
    host: 'localhost',
    port: 5000,
    socket: false,
    socketPath: '/run/rtorrent/rtorrent.sock'
  },
  ssl: false,
  sslKey: '/srv/rtorrent/data/flood/flood_ssl.key',
  sslCert: '/srv/rtorrent/data/flood/flood_ssl.cert',
  torrentClientPollInterval: 1000 * 2
};

module.exports = CONFIG;