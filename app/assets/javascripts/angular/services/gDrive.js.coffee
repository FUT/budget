window.App.service 'gDrive', ->
  gDrive =
    loadClient: (callback) -> if gapi.client.drive then callback?() else gapi.client.load 'drive', 'v2', callback
    uploadFile: (data, callback) ->
      gDrive.loadClient ->
        boundary = '-------314159265358979323846'
        delimiter = "\r\n--" + boundary + "\r\n"
        closeDelim = "\r\n--" + boundary + "--"

        contentType = 'application/octet-stream'
        metadata = title: 'myfile', mimeType: contentType

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

        request = gapi.client.request
          'path': '/upload/drive/v2/files'
          'method': 'POST'
          'params': { 'uploadType': 'multipart' }
          'headers': { 'Content-Type': 'multipart/mixed; boundary="' + boundary + '"' }
          'body': multipartRequestBody

        request.execute callback

    listFiles: (callback) ->
      gDrive.loadClient ->
        gapi.client.drive.files.list().execute callback
