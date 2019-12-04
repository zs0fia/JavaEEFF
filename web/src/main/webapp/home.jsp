<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Fooldal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <h1>Udvozoljuk!</h1>
        
        <h2>Birodalmak</h2>
        <c:forEach var="emp" items="${empires}">
            <form method="post" action="home">
                <input type="hidden" name="type" value="empire">
                <input type="hidden" name="id" value="${emp.id}">
                <input type="text" name="name" value="${emp.name}" disabled="true">
                <input type="submit" name="open" value="Megnyitas">
                <input type="submit" name="edit" value="Szerkeszt">
                <input type="submit" name="remove" value="Torles"><br>
            </form>
        </c:forEach>

        <form method="post" action="createEmpire.jsp">
        <input type="submit" value="Uj birodalom hozzaadasa">
        </form>
        
        <h2>Hosok</h2>
        <c:forEach var="hero" items="${heroes}">
            <form method="post" action="home">
                <input type="hidden" name="type" value="hero">
                <input type="hidden" name="id" value="${hero.id}">
                <input type="text" name="name" value="${hero.name}" disabled="true">
                <input type="submit" name="edit" value="Szerkeszt">
                <input type="submit" name="remove" value="Torles"><br> 
            </form>
        </c:forEach>

        <form method="post" action="createHero.jsp">
        <input type="submit" value="Uj hos hozzaadasa"><br>      
        </form>
        
        <h2>Kereses</h2>
        <form method="post" action="searchEmpire.jsp">
        <input type="submit" value="Birodalmak keresese"><br> 
        </form>
        
        <br> 
        <br> 
        <form method="post" action="index.html">  
        <input type="submit" name="logout" value="Kijelentkezes"><br>      
        </form>
    </body>
</html>
