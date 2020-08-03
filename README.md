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

![image](https://user-images.githubusercontent.com/39657409/89219945-58626e80-d5ee-11ea-9197-1e65d2f2134c.png)
![image](https://user-images.githubusercontent.com/39657409/89219955-5f897c80-d5ee-11ea-9d75-9cc1e1507a1e.png)
![image](https://user-images.githubusercontent.com/39657409/89219966-67492100-d5ee-11ea-97a7-7482dcb8f701.png)
![image](https://user-images.githubusercontent.com/39657409/89220011-7cbe4b00-d5ee-11ea-9d2e-fed6aa629997.png)
