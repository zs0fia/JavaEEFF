<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="get" name="openEmpire" action="openEmpire">
    <h1>${openEmpire.name} Birodalom adatai</h1><br>
    <input type="hidden" name="empireId" value="${openEmpire.id}">
    <b>Birodalom leirasa:</b><br>
    ${openEmpire.description}
    <br><br>
    
    <b>Birodalom nyersanyagai:</b><br>
    <ul>
    <c:forEach var="prod" items="${naturals}">       
        <li>${prod.getAsset().getName()}: ${prod.getQuantity()}</li>
    </c:forEach>
    </ul>
    <br><br>
    
    <b>Birodalom epuletei:</b><br>
    <c:forEach var="empBuilding" items="${openEmpireBuildings}">
        ${empBuilding.name}<br>
    </c:forEach>
    <br><br>
    
    <b>Epitheto epuletek:</b><br>
    <c:forEach var="building" items="${buildings}">
        ${building.name} (ido: ${building.buildTime} sec)<br>
        <input type="hidden" name="buildingId" value="${building.id}">
        <input type="submit" name="build" value="Epit"><br>      
    </c:forEach>
    <br><br>
    <form method="get" action="home">
    <input type="submit" name="return" value="Vissza"><br> 
    </form>
</form>