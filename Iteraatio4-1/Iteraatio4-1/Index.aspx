<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Iteraatio4_1.Index" %>

<!DOCTYPE html>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net"%>
<%@ Import Namespace="System.Xml"%>
<%
    /*double result;
    if (Request.Form.Count == 0)
        result = 0;
    else
        result = Convert.ToDouble(Request.Form["toimi"]) + Convert.ToDouble(Request.Form["kunnat"]);*/
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
                  <option value="85">85 Koulutus</option>
                  <option value="86">86 Terveydenhuolto-ja sosiaalipalvelut</option>
                  <option value="68">68 Kiinteistöalan palvelut</option>
                  <option value="41">41 Rakentaminen</option>
                  <option value="55">55 Majoitus- ja ravitsemistoiminta</option>
                </select>
      </div>
          
      <div class="kuntaDiv">
          <label id="kunta" for="SelectKunta">KUNTA</label>
                 <!--kunnan IDt-->
          <select id="kunnat" name="kunnat" class="kunnat" value="<% =Convert.ToDouble(Request.Form["kunnat"])%>">
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
            WebRequest myRequest = WebRequest.Create(@"https://avoindata.prh.fi/bis/v1?totalResults=false&maxResults=10&resultsFrom=0&registeredOffice="+ paikkakunta +"&businessLineCode="+ toimialaKoodi +"&companyRegistrationFrom=2014-02-28");

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

            %>
            </td>
            <td>
                <%
                    Response.Write(tiedot[2].Substring(33, 19));  
            %>
            </td>
          </tr>
        <tr>
            <%
                    Response.Write(tiedot[3].Substring(33, 19));  
            %>
            <td>
            </td>
        </tr>
        </table>
    </div>
  </body>
  </html>