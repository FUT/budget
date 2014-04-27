window.App.service 'dump', ($rootScope, GoogleFile)->
  tables: {}
  loaded: 0
  loadDump: ->
    GoogleFile.getCurrentFile (file) =>
      file.download (data) =>
        @tables = JSON.parse data
        db = new PouchDB 'transactions'
        for item in @tables['transactions']
          db.post item, (err, response) =>
            @loaded += 1
            $rootScope.$apply()

  saveDump: ->
    GoogleFile.getCurrentFile (file) =>
      file.update JSON.stringify(@tables), =>
        console.log 'Changes were saved!'
