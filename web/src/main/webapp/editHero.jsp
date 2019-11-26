<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post" name="editHero" action="editHero">
    <h1>Alapadatok</h1>
    Hos neve<br>
    <input type="hidden" name="id" value="${editHero.id}">
    
    <input type="text" name="name" value="${editHero.name}"><br>

    Hos leirasa<br>
    <input type="text" name="desc" value="${editHero.description}"><br>
    
    <h1>Faji osszetetel</h1>
    <c:forEach var="hybrid" items="${editHero.hybrid}">
        ${hybrid.species.name}<br><input type="text" name="${hybrid.species.name}" value="${hybrid.percent}">%<br>
    </c:forEach>
    
    <input type="submit" value="Mentes">
</form>