<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="index.WebForm" %>

<!DOCTYPE html>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net"%>


 <html lang ="en">
  <head>
           
               <link rel ="stylesheet" href ="StyleSheet.css">
              
                  <title> Document </title>
              </head >
  <body>
      <form id="form1" runat="server" method="post" action="WebForm.aspx">
      <div class="toimialaDiv">
         
          <label id="toimiala" for="SelectToimiala">TOIMIALA</label>
                <select id="toimi" name="toimi" class="toimi" value="<%=Convert.ToString(Request.Form["toimi"]) %>">
                  <!--toimiala-->
                  <option value="0">Valitse</option>
                  <option value="85">85 Koulutus</option>
                  <option value="86">86 Terveyspalvelut</option>
                  <option value="68">68 Kiinteistöalan toiminta</option>
                  <option value="41">41 Talonrakentaminen</option>
                  <option value="55">55 Majoitus</option>
               
                </select>
            
      </div>

      <div class="kuntaDiv">
          <label id="kunta" for="SelectKunta">KUNTA</label>
                 <!--kunta-->
          <select id="kunnat" name="kunnat" class="kunnat" value="<%=Convert.ToString(Request.Form["kunnat"]) %>">
              <option value="0">Valitse</option>
                    <option value="Oulu">Oulu</option>
                    <option value="Lahti">Lahti</option>
                    <option value="Helsinki">Helsinki</option>
                    <option value="Tampere">Tampere</option>
                    <option value="Turku">Turku</option>
               
          </select>
          <button type="submit">HAE TIEDOT</button>
      </div>
      </form>
        <%

           

            string toimialaKoodi = Convert.ToString(Request.Form["toimi"]);
            string paikkakunta = Convert.ToString(Request.Form["kunnat"]);


            StringWriter writer = new StringWriter();
            WebRequest myRequest = WebRequest.Create(@"https://avoindata.prh.fi/bis/v1?totalResults=false&maxResults=10&resultsFrom=0&registeredOffice=" + paikkakunta + "&businessLineCode="+ toimialaKoodi + "&companyRegistrationFrom=2014-02-28");


            WebResponse response = myRequest.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);

            string responseFromServer = reader.ReadToEnd();

            string[] tiedot = responseFromServer.Split('{');




          %>
      <div class="taulu">
      <table>
          <tr>
            <th>Y-TUNNUS</th>
            <th>YRITYS</th>
          </tr>
          <tr>
           
    <td>
        <%
      /*  if (result < 100)
        Response.Write("0000");
        if (result <= 110 && result >= 100)
      
         for (int i = 2; i < tiedot.Length; i++) // tässä haetaan y-tunnus
        {
        int yTunnus = tiedot[i].IndexOf("businessId");

        Response.Write(tiedot[i].Substring(yTunnus + 13, tiedot[i].Length - yTunnus - 160));



        }
        */
        %>
    </td>
    <td>
        <%

    
        for (int i = 2; i < tiedot.Length; i++) // tässä haetaan yritysten nimet
        {
        int nimi = tiedot[i].IndexOf("name");
        Response.Write(tiedot[i].Substring(nimi + 7, tiedot[i].Length - nimi - 126));
        Response.Write("\n ");
        }

        %>
    </td>
          </tr>
         
        <tr>
            <td>
            </td>
        </tr>
        </table>
    </div>
  </body>
  </html>
