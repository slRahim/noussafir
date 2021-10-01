package com.projet.beans;

import com.sun.org.apache.regexp.internal.RE;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import sun.plugin2.message.transport.Transport;

import javax.mail.Address;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Part;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class Main {
    static String url="jdbc:postgresql://localhost:5432/projet_fd";
    static String user="postgres" ;
    static String pass="admin" ;

    public static Connection chargerBase(){
        Connection connexion =null ;
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("driver ok");
        } catch (ClassNotFoundException e) {
            System.out.println("Erreure 1");
        }
        try {
            connexion= DriverManager.getConnection(url, user, pass) ;
            System.out.println("connexion reussi");
        } catch (SQLException e) {
            System.out.println("Ereure 2");
        }
       return connexion ;
    }

    public static String extractFileName (Part part) {
        String contentDisp=  part.getHeader("content-disposition");
        String[] items =contentDisp.split(";");
        for(String s:items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=")+2,s.length()-1);
            }
        }
        return "";
    }

    public static String[] statAcceuil(){
        String tstat [] = new String[4] ;
        String sql1="select count(*) FROM membre ;" ;
        String sql2="select count(*) FROM membre ;" ;
        String sql3="select count(*) FROM trajet ;";
        String sql4="select count(*) FROM trajet message";

        Connection connection=chargerBase() ;
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql1) ;
            resultSet.next() ;
            tstat[0]=resultSet.getString(1);

            resultSet=statement.executeQuery(sql2);
            resultSet.next();
            tstat[1]=resultSet.getString(1);

            resultSet=statement.executeQuery(sql3);
            resultSet.next();
            tstat[2]=resultSet.getString(1);

            resultSet=statement.executeQuery(sql4);
            resultSet.next();
            tstat[3]=resultSet.getString(1);


        } catch (SQLException e) {
            e.printStackTrace();
        }


        return tstat ;
    }

    public  static List<Trajet> mesTrajet(String id){
        String sql="SELECT * FROM trajet WHERE id_membre='"+id+"' and date_depart>CURRENT_DATE ;";
        Trajet trajet ;
        List<Trajet> trajets=new Vector<>();

        Connection connection=chargerBase() ;
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);

            while (resultSet.next()){
                trajet=new Trajet();
                trajet.setId_trajet(resultSet.getInt(1));
                trajet.setV_depart(resultSet.getString(2));
                trajet.setV_arriver(resultSet.getString(3));
                trajet.setPrix(resultSet.getFloat(9));
                trajet.setDate_ajout(resultSet.getDate(14));

                trajets.add(trajet);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3 !");
        }

        return trajets ;
    }

    public static Object [] demandeReservation(String id){
        List<Membre> membres=new Vector<>();
        List<Trajet> trajets=new Vector<>();
        List<Reservation> reservations=new Vector<>();

        String sql="SELECT id_trajet, trajet.id_membre , id_reservation , reservation.id_membre , membre.nom , membre.prenom , membre.date_naissance ,membre.note ,membre.image\n" +
                "  FROM trajet , reservation , membre\n" +
                "  WHERE id_trajet=reservation.trajet AND trajet.id_membre='"+id+"' AND reservation.id_membre=membre.nom_utilisateur AND etat='en_cour' AND trajet.nombre_place>0;" ;

        Membre membre ;
        Trajet trajet;
        Reservation reservation;

        Connection connection=chargerBase();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                membre=new Membre();
                trajet=new Trajet();
                reservation=new Reservation();

                membre.setNom_utilisateur(resultSet.getString(4));
                membre.setNom(resultSet.getString(5));
                membre.setPrenom(resultSet.getString(6));
                membre.setDate_naissance(resultSet.getDate(7));
                membre.setNote(resultSet.getInt(8));
                membre.setImage(resultSet.getString(9));

                trajet.setId_trajet(resultSet.getInt(1));

                reservation.setId_reservation(resultSet.getInt(3));

                membres.add(membre);
                trajets.add(trajet);
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3 ");
        }
        Object [] objects={membres,trajets,reservations};

        return objects ;

    }

    public static List<Trajet> dernierTrajet() {
         String sql="SELECT * FROM public.trajet WHERE date_depart> CURRENT_DATE  ORDER BY id_trajet DESC LIMIT 3";
         List<Trajet> trajets=new ArrayList<Trajet>();
         Trajet trajet ;
         Connection connection=chargerBase();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                trajet=new Trajet();
                trajet.setId_trajet(resultSet.getInt(1));
                trajet.setV_depart(resultSet.getString(2));
                trajet.setV_arriver(resultSet.getString(3));
                trajet.setNombre_place(resultSet.getInt(7));
                trajet.setDate_dapart(resultSet.getDate(8));
                trajet.setPrix(resultSet.getFloat(9));

                trajets.add(0,trajet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

          return trajets ;
    }

    public static Object [] mesReservation(String id){
        List<Reservation> reservations=new Vector<>();
        List<Trajet> trajets=new Vector<>() ;
        Trajet trajet ;
        Reservation reservation ;
        String sql="SELECT * FROM reservation , trajet\n" +
                "  where trajet=id_trajet AND reservation.id_membre='"+id+"'  AND date_depart>current_date;";

        Connection connection=chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);

            while (resultSet.next()){
                trajet=new Trajet() ;
                reservation=new Reservation() ;

                reservation.setId_reservation(resultSet.getInt("id_reservation"));
                reservation.setDate_reservation(resultSet.getDate("date_reservation"));
                reservation.setEtat(resultSet.getString("etat"));

                trajet.setV_depart(resultSet.getString("ville_depart"));
                trajet.setV_arriver(resultSet.getString("ville_arriver"));
                trajet.setDate_dapart(resultSet.getDate("date_depart"));

                reservations.add(reservation);
                trajets.add(trajet);

            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        Object [] objects={reservations , trajets} ;

        return objects ;
    }

    public static List<com.projet.beans.Message> messageAdmin(){
        List<com.projet.beans.Message> messages=new Vector<>();
        com.projet.beans.Message message ;
        String sql="SELECT * from message ";

        Connection connection=chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                message=new com.projet.beans.Message();
                message.setId_message(resultSet.getInt(1));
                message.setDate_message(resultSet.getDate(2));
                message.setEmmeteur(resultSet.getString(4));

                messages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return messages ;
    }

    public static Object[] getAllMembre(){

        List<Membre> membres = new Vector<>() ;
        List<Compte> comptes =new Vector<>() ;
        Membre membre ;
        Compte compte ;
        String sql="SELECT * FROM membre , compte WHERE nom_utilisateur=compte.id_membre;" ;

        Connection connection =chargerBase();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet= statement.executeQuery(sql);
            while (resultSet.next()) {
                membre=new Membre() ;
                compte=new Compte() ;
                membre.setNom_utilisateur(resultSet.getString("nom_utilisateur"));
                membre.setNom(resultSet.getString("nom"));
                membre.setPrenom(resultSet.getString("prenom"));
                membre.setDate_naissance(resultSet.getDate("date_naissance"));
                membre.setNote(resultSet.getFloat("note"));

                compte.setEtat(resultSet.getString("etat"));

                membres.add(membre);
                comptes.add(compte);

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        Object [] objects={membres,comptes};
        return objects;

    }

    public static Object [] getAllTrajet(){

        List <Trajet> trajets = new Vector<>() ;
        Trajet trajet ;

        List<Membre> membres=new Vector<>() ;
        Membre membre ;

        try {
            Connection connection =chargerBase();
            Statement statement= connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from Trajet where date_depart>CURRENT_DATE ");
            while (resultSet.next()) {
                trajet=new Trajet() ;
                membre=new Membre() ;
                trajet.setId_trajet(resultSet.getInt("id_trajet"));
                trajet.setV_depart(resultSet.getString("ville_depart"));
                trajet.setV_arriver(resultSet.getString("ville_arriver"));
                trajet.setDate_dapart(resultSet.getDate("date_depart"));
                trajet.setDate_ajout(resultSet.getDate("date_ajout"));
                membre.setNom_utilisateur(resultSet.getString("id_membre"));

                trajets.add(trajet);
                membres.add(membre);



            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("erreur 3 ");
        }

        Object [] objects={trajets,membres};

        return objects ;

    }

    public static List<Trajet> historiqueTrajet(String id){
        String sql="SELECT * FROM trajet WHERE id_membre='"+id+"' AND date_depart<CURRENT_DATE ";
        List<Trajet> trajets=new Vector<>();
        Trajet trajet ;

        Connection connection=chargerBase();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                trajet=new Trajet();
                trajet.setId_trajet(resultSet.getInt(1));
                trajet.setV_depart(resultSet.getString(2));
                trajet.setV_arriver(resultSet.getString(3));
                trajet.setDate_ajout(resultSet.getDate(14));

                trajets.add(trajet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return trajets ;
    }

    public static Object [] historiqueReservation(String id){
        String sql="SELECT id_reservation , ville_depart , ville_arriver , date_reservation , trajet.id_membre FROM reservation , trajet\n" +
                "  WHERE trajet=id_trajet AND  reservation.id_membre='"+id+"' AND date_depart<CURRENT_DATE AND etat='valider';";
        List<Reservation> reservations=new Vector<>();
        List<Trajet> trajets=new Vector<>();
        List<Membre> membres=new Vector<>();

        Reservation reservation;
        Trajet trajet;
        Membre membre ;

        Connection connection=chargerBase() ;
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                reservation=new Reservation();
                reservation.setId_reservation(resultSet.getInt(1));
                reservation.setDate_reservation(resultSet.getDate(4));
                reservations.add(reservation);

                trajet=new Trajet();
                trajet.setV_depart(resultSet.getString(2));
                trajet.setV_arriver(resultSet.getString(3));
                trajets.add(trajet);

                membre=new Membre();
                membre.setNom_utilisateur(resultSet.getString(5));
                membres.add(membre);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3 ");
        }


        Object [] objects={reservations,trajets,membres};
        return objects ;
    }

    public static Membre conducteurTrajet(String id){
        Membre membre=new Membre();
        String sql="SELECT * FROM membre WHERE nom_utilisateur='"+id+"' ;" ;

        Connection connection=chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            resultSet.next();
            membre.setNom_utilisateur(resultSet.getString(1));
            membre.setNom(resultSet.getString(2));
            membre.setPrenom(resultSet.getString(3));
            membre.setNum_tel(resultSet.getString(6));
            membre.setNote(resultSet.getInt(7));
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return membre ;
    }

    public static Object[] voyageurTrajet(int id){
        List<Membre> membres=new Vector<>();
        Membre membre ;
        List<Reservation> reservations=new Vector<>() ;
        Reservation reservation ;
        String sql="SELECT * FROM  membre , reservation WHERE reservation.id_membre=membre.nom_utilisateur AND trajet="+id+" AND  etat='valider' ;" ;

        Connection connection=chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                membre=new Membre() ;
                reservation=new Reservation() ;
                membre.setNom_utilisateur(resultSet.getString(1));
                membre.setNom(resultSet.getString(2));
                membre.setPrenom(resultSet.getString(3));
                membre.setNum_tel(resultSet.getString(6));
                membre.setNote(resultSet.getFloat(7));
                membre.setImage(resultSet.getString(8));

                reservation.setId_reservation(resultSet.getInt(9));

                membres.add(membre);
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }
        Object [] objects={membres,reservations};

        return objects ;
    }

    public static Object [] mesNotification(String id){
        String sql="SELECT contenu FROM notification WHERE recepteur='"+id+"' AND date_ajout>CURRENT_DATE -10;";
        String sql2="Select count(*) From notification WHERE recepteur='"+id+"' AND date_ajout>CURRENT_DATE -10;";
        List<String> notification=new Vector<>();
        int nombre=0;
        Connection connection=chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                notification.add(resultSet.getString(1));
            }
            resultSet=statement.executeQuery(sql2);
            resultSet.next();
            nombre=resultSet.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        Object [] objects={notification,nombre};

        return objects ;
    }

    public static int generationCode(String email ,String id){
        int code= (int) (Math.random()*10000);
        String sql="Select id_email from membre,compte where nom_utilisateur=id_membre and (id_email='"+email+"' or id_membre='"+id+"');";

        Connection connection=chargerBase() ;

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            resultSet.next() ;

            Message message=new Message() ;
            message.setEmmeteur(resultSet.getString(1));
            message.setContenu("Votre code de confirmation est : "+String.valueOf(code));

            message.repondre();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }


        return code ;

    }

    public static  Object [] notficationAdmin(){
        String sql="SELECT contenu FROM notification WHERE id_admin='admin';";
        String sql2="Select count(*) From notification WHERE id_admin='admin';";
        List<String> notification=new Vector<>();
        int nombre=0;
        Connection connection=chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                notification.add(resultSet.getString(1));
            }
            resultSet=statement.executeQuery(sql2);
            resultSet.next();
            nombre=resultSet.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        Object [] objects={notification,nombre};

        return objects ;
    }

    public static List <Trajet> getAllTrajetVoyageur(){

        List <Trajet> trajets = new Vector<>() ;
        Trajet trajet ;

        try {
            Connection connection =chargerBase();
            Statement statement= connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from Trajet where date_depart>CURRENT_DATE AND nombre_place>0");
            while (resultSet.next()) {
                trajet=new Trajet() ;
                trajet.setId_trajet(resultSet.getInt("id_trajet"));
                trajet.setV_depart(resultSet.getString("ville_depart"));
                trajet.setV_arriver(resultSet.getString("ville_arriver"));
                trajet.setDate_dapart(resultSet.getDate("date_depart"));
                trajet.setNombre_place(resultSet.getInt("nombre_place"));
                trajet.setPrix(resultSet.getFloat("prix"));

                trajets.add(trajet);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("erreur 3 ");
        }

        return trajets ;

    }

    public static String [] statAdmin(){
        String tstat [] = new String[4] ;
        String sql1="select count(*) FROM reservation ;" ;
        String sql2="select count(*) FROM membre ;" ;
        String sql3="select count(*) FROM trajet ;";
        String sql4="select count(*) FROM  message";


        Connection connection=chargerBase() ;
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql1) ;
            resultSet.next() ;
            tstat[0]=resultSet.getString(1);

            resultSet=statement.executeQuery(sql2);
            resultSet.next();
            tstat[1]=resultSet.getString(1);

            resultSet=statement.executeQuery(sql3);
            resultSet.next();
            tstat[2]=resultSet.getString(1);

            resultSet=statement.executeQuery(sql4);
            resultSet.next();
            tstat[3]=resultSet.getString(1);


        } catch (SQLException e) {
            e.printStackTrace();
        }


        return tstat ;
    }

    public static Object [] statDetail(){
     String max_depart="SELECT count(ville_depart) AS num,ville_depart FROM trajet GROUP BY ville_depart ORDER BY count(ville_depart) DESC LIMIT 1;" ;
     String max_publier="SELECT * FROM membre WHERE nom_utilisateur=(\n" +
             "SELECT id_membre FROM trajet GROUP BY id_membre ORDER BY count(id_membre) DESC LIMIT 1)";
     String max_arriver="SELECT count(ville_arriver) AS num,ville_arriver FROM trajet GROUP BY ville_arriver ORDER BY count(ville_arriver) DESC LIMIT 1;";
     String max_note="SELECT  * FROM  membre ORDER BY note DESC LIMIT 1" ;
     String res_valider="Select count(id_reservation) From reservation Where etat='valider' ;";
     String res_annule="Select count(id_reservation) From reservation Where etat='annulé' ;" ;
     String res_cour="Select count(id_reservation) From reservation Where etat='en_cour' ;" ;
     String actif="Select count(id_email) From compte Where etat='actif' ;" ;
     String bloquer="Select count(id_email) From compte Where etat='Bloqué' ;" ;

     Object [] objects= new Object[9] ;
     Membre membre ;

     Connection connection=chargerBase();

        try {
            Statement statement=connection.createStatement() ;
            ResultSet resultSet=statement.executeQuery(actif);
            resultSet.next();
            objects[0]=resultSet.getInt(1);

            resultSet=statement.executeQuery(bloquer);
            resultSet.next();
            objects[1]=resultSet.getInt(1);

            resultSet=statement.executeQuery(max_publier);
            resultSet.next();
            membre=new Membre() ;
            membre.setNom_utilisateur(resultSet.getString(1));
            membre.setNom(resultSet.getString(2));
            membre.setPrenom(resultSet.getString(3));
            membre.setNote(resultSet.getFloat(7));
            membre.setImage(resultSet.getString(8));
            objects[2]=membre ;

            resultSet=statement.executeQuery(max_note);
            resultSet.next();
            membre=new Membre() ;
            membre.setNom_utilisateur(resultSet.getString(1));
            membre.setNom(resultSet.getString(2));
            membre.setPrenom(resultSet.getString(3));
            membre.setNote(resultSet.getFloat(7));
            membre.setImage(resultSet.getString(8));
            objects[3]=membre ;

            resultSet=statement.executeQuery(max_depart);
            resultSet.next();
            objects[4]=resultSet.getString(2);

            resultSet=statement.executeQuery(max_arriver);
            resultSet.next();
            objects[5]=resultSet.getString(2);

            resultSet=statement.executeQuery(res_valider);
            resultSet.next();
            objects[6]=resultSet.getInt(1);

            resultSet=statement.executeQuery(res_cour);
            resultSet.next();
            objects[7]=resultSet.getInt(1);

            resultSet=statement.executeQuery(res_annule);
            resultSet.next();
            objects[8]=resultSet.getInt(1);



        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3 ");
        }

       return objects ;
    }

}
