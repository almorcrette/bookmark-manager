require 'pg'
require_relative '../lib/database_connection'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end

# def persisted_data(table:, id:)
#   DatabaseConnection.query(
#     "SELECT * FROM $1 WHERE id = $2;",
#     [table, id]
#   )
# end