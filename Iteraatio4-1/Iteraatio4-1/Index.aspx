<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Iteraatio4_1.Index" %>

<!DOCTYPE html>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net"%>
<%
/*StringWriter writer = new StringWriter();
WebRequest myRequest = WebRequest.Create(@"https://avoindata.prh.fi/bis/v1?totalResults=false&maxResults=100&resultsFrom=0&registeredOffice=Lahti&businessLineCode=86&companyRegistrationFrom=2014-02-28");
WebResponse response = myRequest.GetResponse();
// Get the stream containing content returned by the server.
Stream dataStream = response.GetResponseStream();
// Open the stream using a StreamReader for easy access.
StreamReader reader = new StreamReader(dataStream);
// Read the content.
string responseFromServer = reader.ReadToEnd();
//Now this string includes all data from the external web site for further use
Response.Write(responseFromServer);*/
    
%>

<% 

    double result;
    if (Request.Form.Count == 0)
        result = 0;
    else
        result = Convert.ToDouble(Request.Form["toimi"]) + Convert.ToDouble(Request.Form["kunnat"]);
    %>
 <html lang ="en">
  <head>
           
               <link rel ="stylesheet" href ="index.css">
              
                  <title> Document </title>
              </head >
  <body>
      <form id="form2" runat="server" method="post" action="Index.aspx">
      <div class="toimialaDiv">
         
          <label id="toimiala" for="SelectToimiala">TOIMIALA</label>
                <select id="toimi" name="toimi" class="toimi" value="<%=Convert.ToDouble(Request.Form["toimi"])%>">
                  <!--toimialan IDt-->
                  <option value="0">Valitse</option>
                  <option value="100">80 Koulutus</option>
                  <option value="200">85 Terveydenhuolto-ja sosiaalipalvelut</option>
                  <option value="300">70 Kiinteistöalan palvelut</option>
                  <option value="400">40 Rakentaminen</option>
                  <option value="500">55 Majoitus- ja ravitsemistoiminta</option>
               
                </select>
            
      </div>

      <div class="kuntaDiv">
          <label id="kunta" for="SelectKunta">KUNTA</label>
                 <!--kunnan IDt-->
          <select id="kunnat" name="kunnat" class="kunnat" value="<% =Convert.ToDouble(Request.Form["kunnat"])%>">
              <option value="0">Valitse</option>
                    <option value="1">Oulu</option>
                    <option value="2">Lahti</option>
                    <option value="3">Helsinki</option>
                    <option value="4">Tampere</option>
                    <option value="5">Turku</option>
               
          </select>
          <button type="submit">HAE TIEDOT</button>
      </div>
      </form>
        <%
            StringWriter writer = new StringWriter();
            WebRequest myRequest = WebRequest.Create(@"https://avoindata.prh.fi/bis/v1?totalResults=false&maxResults=10&resultsFrom=0&registeredOffice=" + kunta + "&businessLineCode=" + toimiala + "&companyRegistrationFrom=2014-02-28");
            WebResponse response = myRequest.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            string[] tiedot = responseFromServer.Split('{');
            for (int i = 2; i < tiedot.Length; i++)
            {
                int nimi = tiedot[i].IndexOf("name");
                Response.Write(tiedot[i].Substring(nimi + 7, tiedot[i].Length - nimi - 126));
            }

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
                    if (result < 100)
                        Response.Write("0000");                    
                    if (result <= 110 && result >= 100)
                        Response.Write("4054324-6");
                    if (result <= 210 && result >= 200)
                        Response.Write("6543782-1");
                    if (result <= 310 && result >= 300)
                        Response.Write("8920341-9");
                    if (result <= 410 && result >= 400)
                        Response.Write("1432462-5");
                    if (result <= 510 && result >= 500)
                        Response.Write("5984603-4");
                    if (result <= 610 && result >= 600)
                        Response.Write("4352757-7");
                    if (result <= 710 && result >= 700)
                        Response.Write("2385053-5");
                    if (result <= 810 && result >= 800)
                        Response.Write("5435437-4");
                    if (result <= 910 && result >= 900)
                        Response.Write("9095430-8");
                    if (result <= 1010 && result >= 1000)
                        Response.Write("0023402-1");                    
            %>
            </td>
            <td>
                <%
                    if (result < 100)
                        Response.Write("Valitse");
                    if (result <= 110 && result >= 100)
                        Response.Write("Sorvi&Heppi");
                    if (result <= 210 && result >= 200)
                        Response.Write("A-koodaus");
                    if (result <= 310 && result >= 300)
                        Response.Write("Nastakiekko Oy");
                    if (result <= 410 && result >= 400)
                        Response.Write("Mega seven Oy");
                    if (result <= 510 && result >= 500)
                        Response.Write("FAY Oy");
                    if (result <= 610 && result >= 600)
                        Response.Write("Ajanlaboratorio Oy");
                    if (result <= 710 && result >= 700)
                        Response.Write("Viihdetalo Ry");
                    if (result <= 810 && result >= 800)
                        Response.Write("Ropin pirtti");
                    if (result <= 910 && result >= 900)
                        Response.Write("Kolina ja pauke Oy");
                    if (result <= 1010 && result >= 1000)
                        Response.Write("Nettokoru");                    
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