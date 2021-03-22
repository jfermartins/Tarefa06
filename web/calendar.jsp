<%-- 
    Document   : calendar
    Created on : 22 de mar de 2021, 10:48:34
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--Capturando as exceções--%>
<%
    int year = 0, month = 0, date = 1, weekDay = 0, day = 1, totDays = 30, i = 0, currentYear = 0, currentMonth = 0;
    String errorMessage = null;
    try {
        year = Integer.parseInt(request.getParameter("year"));
        month = Integer.parseInt(request.getParameter("month"));
    } catch (Exception ex) {
        errorMessage = "Erro na leitura dos parâmetros.";
    }

    java.util.Date calendar = new java.util.Date(year - 1900, month - 1, date);
    currentYear = year;
    currentMonth = month;
    weekDay = calendar.getDay();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendário - JSP</title>
        <style>
            body{
                color: gray;
                text-align: center
            }

            table th {
                padding: 5px;
            }

            #calendar {
                display:flex;
                flex-direction: column;
                align-items: center;
            }

            header {
                width: 402px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            button {
                padding: 5px;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <a href="index.html">Voltar</a>
        <h1>Calendário</h1>
        <div id="calendar">
            <header>
                <%-- Tratando as exceções --%>
                <%if (errorMessage != null) {%>

                <div style="color:red"><%= errorMessage%></div>

                <%} else {%>

                <h2>
                    <%
                        switch (currentMonth) {
                            case 1:
                                out.println("Janeiro");
                                totDays = 31;
                                break;
                            case 2:
                                out.println("Fevereiro");
                                if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
                                    totDays = 29;
                                } else {
                                    totDays = 28;
                                }
                                break;
                            case 3:
                                out.println("Março");
                                totDays = 31;
                                break;
                            case 4:
                                out.println("Abril");
                                break;
                            case 5:
                                out.println("Maio");
                                totDays = 31;
                                break;
                            case 6:
                                out.println("Junho");
                                break;
                            case 7:
                                out.println("Julho");
                                totDays = 31;
                                break;
                            case 8:
                                out.println("Agosto");
                                totDays = 31;
                                break;
                            case 9:
                                out.println("Setembro");
                                break;
                            case 10:
                                out.println("Outubro");
                                totDays = 31;
                                break;
                            case 11:
                                out.println("Novembro");
                                break;
                            case 12:
                                out.println("Dezembro");
                                totDays = 31;
                                break;
                            default:
                                break;
                        }%>
                    <%= currentYear%>
                </h2>
            </header> 
                
            <div>
                <table border="1" style="border-collapse: collapse;">
                    <tr>
                        <th>Domingo</th>
                        <th>Segunda-feira</th>
                        <th>Terça-feira</th>
                        <th>Quarta-feira</th>
                        <th>Quinta-feira</th>
                        <th>Sexta-feira</th>
                        <th>Sábado</th>
                    </tr>
                    <%--Primeira linha --%>
                    <tr>
                        <% for (int j = 0; j < 7; j++) {%>    
                        <% if (j < weekDay) {%>
                        <td></td> 
                        <%} else {%>
                        <td><%= day++%></td> 
                        <%}%>
                        <%}%>
                    </tr>

                    <%--Próximas linhas --%>
                    <% for (i = 0; i < 5; i++) {%>
                    <tr>
                        <% for (int j = 0; j < 7; j++) {%>  
                        <% if (day <= totDays) {%>
                        <td><%= day++%></td>
                        <%}%>
                        <%}%>
                    </tr>
                    <%}%>

                </table>
                    <%}%> 
            </div>
        </div>
    </body>
</html>