package com.projet.beans;

import java.sql.*;
import java.util.Date;
import java.util.List;
import java.util.Vector;

public class Reservation {

    int id_reservation ;
    Date date_reservation ;
    int nombre_place ;
    float montant ;
    String etat ;
    String payement ;



    public int getId_reservation() {
        return id_reservation;
    }

    public void setId_reservation(int id_reservation) {
        this.id_reservation = id_reservation;
    }

    public Date getDate_reservation() {
        return date_reservation;
    }

    public void setDate_reservation(Date date_reservation) {
        this.date_reservation = date_reservation;
    }

    public int getNombre_place() {
        return nombre_place;
    }

    public void setNombre_place(int nombre_place) {
        this.nombre_place = nombre_place;
    }

    public float getMontant() {
        return montant;
    }

    public void setMontant(float montant) {
        this.montant = montant;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getPayement() {
        return payement;
    }

    public void setPayement(String payement) {
        this.payement = payement;
    }




    public void reserver (int id_trajet , String id_membre) {

        this.date_reservation = new Date();
        java.sql.Date date = new java.sql.Date(this.getDate_reservation().getTime());
        this.nombre_place=1;
        String getPrix = "select * from trajet where id_trajet='"+id_trajet+"';";
        this.etat = "en_cour";

        String insererReservation = "INSERT INTO reservation (date_reservation, nombre_place, montant, etat, id_membre, trajet) VALUES (?,?,?,?,?,?);";

        Connection connection=Main.chargerBase();

        try {

            Statement statement1 = connection.createStatement() ;
            ResultSet resultSet=statement1.executeQuery(getPrix);
            resultSet.next();
            this.montant = (float) resultSet.getDouble(9);

            PreparedStatement statement2 = connection.prepareStatement(insererReservation);
            statement2.setDate(1,date);
            statement2.setInt(2,this.getNombre_place());
            statement2.setFloat(3,this.getMontant());
            statement2.setString(4,this.getEtat());
            statement2.setString(5,id_membre);
            statement2.setInt(6,id_trajet);

            statement2.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }


    }

    public void annulerReservation (int id_res){
        int id_tra=0;
        int get_nbrp=0;

        String etat_res="" ;
        String conducteur="";
        String sql2="INSERT INTO notification (recepteur,contenu) VALUES (?,?) ;" ;

        Connection connection=Main.chargerBase();

        try {
            String sql_idTra ="select * from reservation where id_reservation = "+id_res+";";
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement2.executeQuery(sql_idTra);
            resultSet.next();
            etat_res=resultSet.getString(5);
            id_tra = resultSet.getInt(7);


            String getNbplace ="select * from trajet where id_trajet ="+id_tra+";";
            Statement statement4 = connection.createStatement();
            ResultSet resultSet2 = statement4.executeQuery(getNbplace);
            resultSet2.next();
            conducteur=resultSet2.getString(13);
            get_nbrp = resultSet2.getInt(7) +1;

            String nbrPlace = "update trajet set nombre_place = "+get_nbrp+"  where id_trajet = "+id_tra+";";
            Statement statement3 = connection.createStatement();
            statement3.executeUpdate(nbrPlace);

            String annuler_res = "update reservation set etat = 'annulé' where id_reservation = "+id_res+";";
            Statement statement1 = connection.createStatement();
            statement1.executeUpdate(annuler_res);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }

        // la partie de notification
        if (etat_res.equals("valider")) {
            try {

                PreparedStatement statement1=connection.prepareStatement(sql2);

                statement1.setString(1,conducteur);
                statement1.setString(2,"la reservation "+id_res+" dans le trajet "+id_tra+" a été annuler par le voyageur....");
                statement1.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("erreur 4");
            }
        }

    }

    public void validerReservation (int id_res) {


        String sql_etat = "UPDATE reservation SET etat = 'valider' where id_reservation="+id_res+" ;";
        String sql_tra = "select * from reservation where id_reservation ="+id_res+";";

        Connection connection=Main.chargerBase();

        try {

            Statement statement1 = connection.createStatement();
            statement1.executeUpdate(sql_etat);

            Statement statement3 = connection.createStatement();
            ResultSet res = statement3.executeQuery(sql_tra);
            res.next();
            int tra = res.getInt(7);
            System.out.println(tra);

            String sql_place = "UPDATE trajet SET nombre_place=(SELECT nombre_place-1 FROM trajet WHERE id_trajet="+tra+") WHERE id_trajet="+tra+" ;";
            Statement statement2 = connection.createStatement();
            statement2.executeUpdate(sql_place);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }

    }

    public void supprimerReservation (int id_res){
        String sql_place="UPDATE trajet SET nombre_place=nombre_place+1 WHERE id_trajet=(SELECT trajet FROM reservation WHERE id_reservation="+id_res+");";
        String sql_sup = " Delete FROM reservation Where id_reservation = "+id_res+";";
        String sql1="SELECT id_membre FROM reservation WHERE id_reservation="+id_res+";";
        String sql2="INSERT INTO notification (recepteur,contenu) VALUES (?,?) ;" ;

        Connection connection = Main.chargerBase();
        // la partie de notification
        try {
            Statement statement2=connection.createStatement();
            ResultSet resultSet=statement2.executeQuery(sql1);
            PreparedStatement statement1 ;
            while (resultSet.next()){
                statement1=connection.prepareStatement(sql2);
                statement1.setString(1,resultSet.getString(1));
                statement1.setString(2,"Votre reservation n"+id_res+" a été refuser par le conducteur veuillez rechercher un autre covoiturage.....");
                statement1.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 4");
        }
        //la partie du suppression du reservation et augmentation le nombre de place
        try{
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql_place);
            statement.executeUpdate(sql_sup);
        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }

    }

    public Object [] getReservation(){
        String sql="Select * From reservation where id_reservation="+this.getId_reservation()+";";
        Reservation reservation=new Reservation();
        String membre="";
        int trajet=0;
        Connection connection=Main.chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            resultSet.next();
            reservation.setId_reservation(resultSet.getInt(1));
            reservation.setNombre_place(resultSet.getInt(3));
            reservation.setMontant(resultSet.getFloat(4));
            reservation.setPayement(resultSet.getString(8));
             membre=resultSet.getString(6);
             trajet=resultSet.getInt(7);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        Object [] objects={reservation,membre,trajet};
        return objects ;
    }

    public void payerReservation (int id_reser) {
        String sql_payer = "update reservation set payement = 'payeé' where id_reservation = "+id_reser+";";
        String sql="INSERT INTO notification (contenu,id_admin) VALUES ('la reservation n="+id_reser+" a été payer...','admin') ;";

        Connection connection = Main.chargerBase();

        try{
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql_payer);
        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }
        // notifier l'admin
        try {
            PreparedStatement statement1=connection.prepareStatement(sql);
            statement1.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 4");
        }
    }

    public void supprimerReservationAdmin (int id_res){
        String sql_place="UPDATE trajet SET nombre_place=nombre_place+1 WHERE id_trajet=(SELECT trajet FROM reservation WHERE id_reservation="+id_res+");";
        String sql_sup = " Delete FROM reservation Where id_reservation = "+id_res+";";
        String sql1="SELECT id_membre FROM reservation WHERE id_reservation="+id_res+";";
        String sql2="INSERT INTO notification (recepteur,contenu) VALUES (?,?) ;" ;

        Connection connection = Main.chargerBase();
        // la partie de notification
        try {
            Statement statement2=connection.createStatement();
            ResultSet resultSet=statement2.executeQuery(sql1);
            PreparedStatement statement1 ;
            while (resultSet.next()){
                statement1=connection.prepareStatement(sql2);
                statement1.setString(1,resultSet.getString(1));
                statement1.setString(2,"Votre reservation n"+id_res+" a été supprimer par l'admin veuillez rechercher un autre covoiturage...");
                statement1.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 4");
        }
        //la partie du suppression du reservation et augmentation le nombre de place
        try{
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql_place);
            statement.executeUpdate(sql_sup);
        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }

    }

    public List<Membre> reservationValide(int id_trajet){
        List<Membre> membres=new Vector<>();
        Membre membre;

        String sql="SELECT * FROM reservation,membre WHERE id_membre=membre.nom_utilisateur AND trajet="+id_trajet+" AND etat='valider'";

        Connection connection=Main.chargerBase();

        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                membre=new Membre() ;
                membre.setNom_utilisateur(resultSet.getString(9));
                membre.setNom(resultSet.getString(10));
                membre.setPrenom(resultSet.getString(11));
                membre.setAdresse(resultSet.getString(13));
                membre.setNum_tel(resultSet.getString(14));
                membre.setImage(resultSet.getString(16));

                membres.add(membre);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return membres ;
    }
}
