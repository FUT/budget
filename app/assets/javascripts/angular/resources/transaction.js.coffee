window.App.factory 'Transaction', ($timeout, dump) ->
  db = new PouchDB 'transactions'

  # clear database
  db.allDocs (err, response) =>
    for item in response.rows
      db.get item.id, (err, doc) ->
        db.remove doc, (err, item) ->

  db.changes
    live: true
    onChange: (change) ->
      Transaction.all (err, items) ->
        dump.tables['transactions'] = items
        dump.saveDump()

  class Transaction
    constructor: (attrs) ->
      @[key] = value for key, value of attrs

    @db: db

    @all: (callback) ->
      db.allDocs { include_docs: true }, (err, response) ->
        transactions = _.map response.rows, (row) -> new Transaction(row.doc)
        callback err, transactions

    @create: (attributes, callback) ->
      db.post attributes, (err, doc) ->
        Transaction.get doc.id, callback

    @get: (id, callback) ->
      db.get id, (err, doc) ->
        callback err, new Transaction(doc)

    update: (attributes, callback) ->
      angular.extend attributes, {@_id, @_rev}
      db.put attributes, (err, doc) ->
        Transaction.get doc.id, callback

    delete: (callback) ->
      db.remove @, (err, doc) ->
        callback err, new Transaction(doc)
