<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="get" name="openEmpire">
    <h1>${openEmpire.name} Birodalom adatai</h1><br>

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
        Nyersanyagok hozza: 
        <ul>
        <c:forEach var="nat" items="${building.getProduce()}">
            <li>${nat.getAsset().getName()}: ${nat.getQuantity()}</li>     
        </c:forEach> 
        </ul>
        <input type="submit" value="Epit"><br>      
    </c:forEach>
    <br><br>
    <form method="get" action="home">
    <input type="submit" value="Vissza"><br> 
    </form>
</form>