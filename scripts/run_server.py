"""Runs the webserver."""

from absl import app
from absl import flags
import tornado
from icubam import config
from icubam.www import server as www_server
from icubam.messaging import server as msg_server


flags.DEFINE_integer('port', 8888, 'Port of the application.')
flags.DEFINE_string('db_path', None, 'File for the db.')
flags.DEFINE_string('server', 'www', 'File for the db.')
FLAGS = flags.FLAGS


def main(argv):
  servers = {'www': www_server.WWWServer, 'message': msg_server.MessageServer}
  service = servers.get(FLAGS.server, None)
  db_path = FLAGS.db_path or config.SQLITE_DB
  if service is not None:
    service(db_path, FLAGS.port).run()


if __name__ == '__main__':
  app.run(main)
