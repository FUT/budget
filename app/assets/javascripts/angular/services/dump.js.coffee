window.App.service 'dump', ($rootScope, $timeout, GoogleFile)->
  tables: {}
  loaded: 0
  savePending: false
  saved: true
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
    return if @savePending

    $rootScope.$apply =>
      @savePending = true
      @saved = false
      window.onbeforeunload = (e) => 'Changed are not saved. Wait a second please.'

    $timeout =>
      @savePending = false
      GoogleFile.getCurrentFile (file) =>
        file.update JSON.stringify(@tables), =>
          @saved = true
          window.onbeforeunload = null
          console.log 'Changes were saved!'
    , 500
