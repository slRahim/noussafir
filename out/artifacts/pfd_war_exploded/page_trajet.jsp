<!doctype html>
<html lang="fr">

<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if(session.getAttribute("id_membre")==null){
        response.sendRedirect("/Acceuil");
    }
%>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link href="static/css/mdb.min.css" rel="stylesheet">
    <!-- Mon fichier de  CSS -->
    <link rel="stylesheet" href="static/css/mycss1.css">
    <link rel="stylesheet" href="static/css/mycss.css">

    <title>Trajet</title>
</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>



<section id="form-inscrit" class="mytxt ">
    <div class="container">
        <h4>Modifier trajet </h4>
        <p>On vous donne la possibillité de modifier un trajet déja publier,aprés modification on va informer les voyageurs reservaient dans ce trajet. </p>
    </div>
    <br> <br>
    <div class="container">
        <form action="ModifieTrajet" method="post">
            <input type="hidden" name="id_trajet" value="${trajet.id_trajet}">
            <input type="hidden" name="id_membre" value="${id_membre}">
            <div class="form-group row">
                <label for="start" class="col-sm-2 col-form-label">Ville de depart:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="start" name="v_depart" value="${trajet.v_depart}" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label for="end" class="col-sm-2 col-form-label">Ville d'arriver:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="end" name="v_arriver" value="${trajet.v_arriver}" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label for="ar_1" class="col-sm-2 col-form-label">Arret n_1: </label>
                <div class="col-sm-6">
                    <input type="text" id="ar_1" name="arret_1" class="form-control" value="${trajet.arret_1}">
                </div>
            </div>
            <div class="form-group row">
                <label for="ar_2" class="col-sm-2 col-form-label">Arret n_2: </label>
                <div class="col-sm-6">
                    <input type="text" id="ar_2" name="arret_2" class="form-control" value="${trajet.arret_2}">
                </div>
            </div>
            <div class="form-group row">
                <label for="ar_3" class="col-sm-2 col-form-label">Arret n_3: </label>
                <div class="col-sm-6">
                    <input type="text" id="ar_3" name="arret_3" class="form-control" value="${trajet.arret_3}">
                </div>
            </div>
            <div class="form-group row">
                <label for="dat" class="col-sm-2 col-form-label">Date de depart:</label>
                <div class="col-sm-6">
                    <input type="date" class="form-control" id="dat" name="d_depart"  value="${trajet.date_dapart}">
                </div>
            </div>
            <div class="form-group row">
                <label for="h_depart" class="col-sm-2 col-form-label">Heur de depart: </label>
                <div class="col-sm-6">
                    <input type="time" id="h_depart" name="h_depart" class="form-control" value="${trajet.h_depart}">
                </div>
            </div>
            <br>
            <div class="form-group row">
                <label for="n_place" class="col-sm-2 col-form-label">Nombre de place:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="n_place" name="n_place" value="${trajet.nombre_place}" readonly >
                </div>
            </div>
            <div class="form-group row">
                <label for="p_place" class="col-sm-2 col-form-label">Prix de la place:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="p_place" name="p_place" value="${trajet.prix}">
                </div>
            </div>
            <div class="form-group row">
                <label for="mat" class="col-sm-2 col-form-label">Id_voiture:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="mat" name="id_matricule" value="${voiture.matricule}">
                </div>
            </div>
            <div class="form-group row">
                <label for="marque" class="col-sm-2 col-form-label">Marque:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="marque" name="v_marque" value="${voiture.marque}">
                </div>
            </div>
            <br>
            <div class="form-group row">
                <label for="desc" class="col-sm-2 col-form-label">Description :</label>
                <div class="col-sm-6">
                    <textarea class="form-control" id="desc" name="v_description" rows="3" placeholder="" value="${voiture.description}"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label  class="col-sm-2 col-form-label"></label>
                <div class="col-sm-2">
                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="verefie" onclick="v_modifieTrajet()">
                        <label class="custom-control-label" for="verefie" >Verefie moi! </label>
                    </div>
                </div>
            </div>

            <br>
            <div class="form-group row">
                <div class="col-9">
                    <button type="submit" id="ok" class="btn btn-warning"  disabled>Appliquer les changements</button>
                </div>
            </div>
        </form>
    </div>
</section>


<section>
    <c:import url="footer.jsp"/>
</section>





<!-- script pour la date minimale -->
<script>
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    }
    if(mm<10){
        mm='0'+mm
    }

    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById("dat").setAttribute("min", today);
</script>


<script>
    function v_modifieTrajet(){
        if(document.getElementById('dat').value!='' && document.getElementById('h_depart').value!=''  && document.getElementById('p_place').value!='' &&
            document.getElementById('mat').value!='' && document.getElementById('marque').value!='' ){

            document.getElementById('ok').disabled=false;
        }
        else {
            swal("Ooops!", "Veulleirz remplir tout les champs SVP !", "info");
        }
    }
</script>







<!--speciale pour importer le google map api -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArft1j_q20ao97RVTqcXeKdQoIzXUwFlA&libraries=places&callback=initAutocomplete"
        async defer></script>
<script src="static/js/script_map.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- JQuery -->
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="static/js/mdb.min.js"></script>
<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    })

</script>
</body>
</html>
