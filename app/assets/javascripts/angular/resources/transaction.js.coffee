window.App.factory 'Transaction', ->
  db = new PouchDB 'transactions'

  class Transaction
    constructor: (attrs) ->
      @[key] = value for key, value of attrs

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

  # Transaction.create {a:2}, (err, doc) ->
  #   q = doc
  #   console.log q


  #   Transaction.get q._id, (err, doc) ->
  #     q = doc
  #     console.log q

  #     q.update a: 49, (err,doc) ->
  #       q = doc
  #       console.log q
  #       debugger

  #       q.delete (err, doc) ->
  #         q = doc
  #         console.log q
  #         debugger

