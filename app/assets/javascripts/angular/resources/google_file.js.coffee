window.App.factory 'GoogleFile', ->
  class GoogleFile
    constructor: (attrs) ->
      @[key] = value for key, value of attrs

    @getCurrent: (callback) ->
      if @currentFile
        callback? @currentFile
      GoogleFile.all (files) ->
        @currentFile = files[0]
        callback? @currentFile

    @create: (data, callback) ->
      loadClient ->

        requestOptions = prepareRequest data
        request = gapi.client.request requestOptions

        request.execute (file) ->
          callback?(new GoogleFile(file))

    @all: (callback) ->
      loadClient ->
        gapi.client.drive.files.list().execute (response) ->
          files = _.map response.items, (item) -> new GoogleFile(item)
          callback? files

    makeCurrent: ->
      GoogleFile.currentFile = @

    update: (data, callback) ->
      loadClient ->

        requestOptions = prepareRequest data, @id
        request = gapi.client.request requestOptions

        request.execute callback

  # utilities
  loadClient = (callback) -> if gapi.client.drive then callback?() else gapi.client.load 'drive', 'v2', callback

  prepareRequest = (data, fileId) ->
    boundary = '-------314159265358979323846'
    delimiter = "\r\n--" + boundary + "\r\n"
    closeDelim = "\r\n--" + boundary + "--"

    contentType = 'application/octet-stream'
    metadata = title: 'Open Balance.ob', mimeType: contentType

    base64Data = btoa data
    multipartRequestBody =
      delimiter +
      'Content-Type: application/json\r\n\r\n' +
      JSON.stringify(metadata) +
      delimiter +
      'Content-Type: ' + contentType + '\r\n' +
      'Content-Transfer-Encoding: base64\r\n' +
      '\r\n' +
      base64Data +
      closeDelim

    requestOptions =
      path: "/upload/drive/v2/files/#{fileId || ''}"
      method: if fileId then 'PUT' else 'POST'
      params: { 'uploadType': 'multipart' }
      headers: { 'Content-Type': 'multipart/mixed; boundary="' + boundary + '"' }
      body: multipartRequestBody
