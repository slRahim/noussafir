<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="page_mode_utilisateur.jsp">
        <img src="static/img/logo.png" style="width: 60px">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1" aria-controls="navbar1" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar1" class="collapse navbar-collapse mypading" >
        <ul class="navbar-nav mr-auto ">

        </ul>
        <a href="<c:url value="/loginChate"><c:param name="id_membre" value="${id_membre}"/></c:url> " target="_blank" style="margin-right: 1%">
            <img src="static/img/icons8_Facebook_Messenger_35px.png">
        </a>
        <a data-toggle="popover" data-placement="bottom" title="Notification" data-content="<c:forEach items="${liste_notification}" var="notify">${notify}</c:forEach>">
            <img src="static/img/icons8_Notification_35px.png">
            <span class="badge badge-light">${nombre_notification}</span>
        </a>
        <a href="<c:url value="/Acceuil"></c:url>" class="btn btn-md btn-danger" style="margin-left: 2%">se deconnecter</a>
    </div>

</nav>
