      function doGet(request) {

        var sheet = SpreadsheetApp.openById("1BOhnttJhj6vHugn5ilLfS9g8XLewKbpMXrVuv9lByOU");
        var result = {"status":"SUCCESS"};

        try
        {
          var name = request.parameter.name;
          var email = request.parameter.email;
          var mobileno = request.parameter.mobileno;
          var feedback = request.parameter.feedback;

          var rowData = sheet.appendRow([name,email,mobileno,feedback]);

        }catch(exc)
        {
          result = {"status": "FAILED","message": exc};
        }
        return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);

      }

