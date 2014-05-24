window.App.factory 'GoogleFile', ->
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

  class GoogleFile
    constructor: (attrs) ->
      @[key] = value for key, value of attrs

    @all: (callback) ->
      loadClient ->
        gapi.client.drive.files.list().execute (response) ->
          files = _.map response.items, (item) -> new GoogleFile(item)
          callback? files

    @create: (data, callback) ->
      loadClient ->
        requestOptions = prepareRequest data
        request = gapi.client.request requestOptions

        request.execute (file) ->
          callback?(new GoogleFile(file))

    @getCurrentFile: (callback) ->
      if @currentFile
        cajllback? @currentFile
      GoogleFile.all (files) =>
        @currentFile = files[0]
        if @currentFile
          callback? @currentFile
        else
          GoogleFile.create '', (file) =>
            @currentFile = file
            callback? @currentFile

    download: (callback) ->
      if @downloadUrl
        accessToken = gapi.auth.getToken().access_token
        xhr = new XMLHttpRequest()
        xhr.open 'GET', @downloadUrl
        xhr.setRequestHeader 'Authorization', 'Bearer ' + accessToken
        xhr.onload = -> callback xhr.responseText
        xhr.onerror = -> callback null
        xhr.send()
      else
        callback null

    makeCurrent: ->
      GoogleFile.currentFile = @

    update: (data, callback) ->
      loadClient =>
        requestOptions = prepareRequest data, @id
        request = gapi.client.request requestOptions

        request.execute callback
