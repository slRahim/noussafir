package com.projet.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Trajet {
    int id_trajet ;
    String v_depart ;
    String v_arriver ;
    Date date_dapart ;
    String h_depart ;
    Date date_ajout ;
    String arret_1 ;
    String arret_2 ;
    String arret_3 ;
    int nombre_place ;
    float prix ;
    String description ;



    public int getId_trajet() {
        return id_trajet;
    }

    public void setId_trajet(int id_trajet) {
        this.id_trajet = id_trajet;
    }

    public String getV_depart() {
        return v_depart;
    }

    public void setV_depart(String v_depart) {
        this.v_depart = v_depart;
    }

    public String getV_arriver() {
        return v_arriver;
    }

    public void setV_arriver(String v_arriver) {
        this.v_arriver = v_arriver;
    }

    public Date getDate_dapart() {
        return date_dapart;
    }

    public void setDate_dapart(Date date_dapart) {
        this.date_dapart = date_dapart;
    }

    public String getH_depart() {
        return h_depart;
    }

    public void setH_depart(String h_depart) {
        this.h_depart = h_depart;
    }

    public Date getDate_ajout() {
        return date_ajout;
    }

    public void setDate_ajout(Date date_ajout) {
        this.date_ajout = date_ajout;
    }

    public String getArret_1() {
        return arret_1;
    }

    public void setArret_1(String arret_1) {
        this.arret_1 = arret_1;
    }

    public String getArret_2() {
        return arret_2;
    }

    public void setArret_2(String arret_2) {
        this.arret_2 = arret_2;
    }

    public String getArret_3() {
        return arret_3;
    }

    public void setArret_3(String arret_3) {
        this.arret_3 = arret_3;
    }

    public int getNombre_place() {
        return nombre_place;
    }

    public void setNombre_place(int nombre_place) {
        this.nombre_place = nombre_place;
    }

    public float getPrix() {
        return prix;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }



    public void publierTrajet(Voiture voiture,String str){
        java.sql.Date date_a=new java.sql.Date(this.getDate_ajout().getTime());
        java.sql.Date date_d=new java.sql.Date(this.getDate_dapart().getTime());
        String sql1="INSERT INTO trajet (ville_depart, ville_arriver, arret_1, arret_2, arret_3, nombre_place, date_depart, prix, description, id_voiture,id_membre, date_ajout,h_depart)\n" +
                "    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
        String sql2="INSERT into voiture (id_matricule, marque, description) VALUES (?,?,?);";

        Connection connection=Main.chargerBase();


        try {
            PreparedStatement statement2=connection.prepareStatement(sql2);
            statement2.setString(1,voiture.getMatricule());
            statement2.setString(2,voiture.getMarque());
            statement2.setString(3,voiture.getDescription());

            statement2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        try {
            PreparedStatement statement1=connection.prepareStatement(sql1);
            statement1.setString(1,this.getV_depart());
            statement1.setString(2,this.getV_arriver());
            statement1.setString(3,this.getArret_1());
            statement1.setString(4,this.getArret_2());
            statement1.setString(5,this.getArret_3());
            statement1.setInt(6,this.getNombre_place());
            statement1.setDate(7,date_d);
            statement1.setFloat(8,this.getPrix());
            statement1.setString(9,this.getDescription());
            statement1.setString(10,voiture.getMatricule());
            statement1.setString(11,str);
            statement1.setDate(12,date_a);
            statement1.setString(13,this.getH_depart());



            statement1.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreure 3 !");
        }


    }

    public List<Trajet> rechercheTrajet(){
        java.sql.Date date=new java.sql.Date(this.getDate_dapart().getTime());
        List<Trajet> trouver = new ArrayList<>();
        Trajet recuperer ;

        String sql = "SELECT * FROM trajet WHERE ville_depart='"+this.getV_depart()+"'" +
                " AND (ville_arriver='"+this.getV_arriver()+"' OR arret_1='"+this.getV_arriver()+"' OR arret_2='"+this.getV_arriver()+"' OR arret_3='"+this.getV_arriver()+"') AND  date_depart='"+date+"' AND nombre_place>0 AND date_depart>CURRENT_DATE ;";

        Connection connection = Main.chargerBase();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                recuperer=new Trajet();

                recuperer.setId_trajet(resultSet.getInt(1));
                recuperer.setV_depart(resultSet.getString(2));
                recuperer.setV_arriver(resultSet.getString(3));
                recuperer.setArret_1(resultSet.getString(4));
                recuperer.setArret_2(resultSet.getString(5));
                recuperer.setArret_3(resultSet.getString(6));
                recuperer.setNombre_place(resultSet.getInt(7));
                recuperer.setDate_dapart(resultSet.getDate(8));
                recuperer.setPrix(resultSet.getFloat(9));
                recuperer.setH_depart(resultSet.getString(15));

                trouver.add(recuperer);

            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return trouver ;

    }

    public void supprimerTrajet() {
        String query="DELETE FROM Trajet WHERE id_trajet ="+this.getId_trajet()+";";
        String sql="SELECT id_membre FROM reservation WHERE trajet="+this.getId_trajet()+" AND etat='valider';";
        String sql2="INSERT INTO notification (recepteur,contenu,id_trajet) VALUES (?,?,?) ;" ;
        Statement stm;

        Connection connection =Main.chargerBase();

        // la partie de notification
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);

            PreparedStatement statement1 ;
            while (resultSet.next()) {
                statement1 = connection.prepareStatement(sql2);
                statement1.setString(1, resultSet.getString(1));
                statement1.setString(2, "Le trajet n=" + this.getId_trajet() + " est supprimer,on vous conseille de trouver un autre covoiturage.....");
                statement1.setInt(3, this.getId_trajet());
                statement1.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 4");
        }

        try {

            stm = (Statement) connection.createStatement();
            stm.executeUpdate(query);

        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }


    }

    public void editTrajet(int id , Voiture voiture) {
        java.sql.Date date_d=new java.sql.Date(this.getDate_dapart().getTime());
        String query="UPDATE trajet SET arret_1='"+this.getArret_1()+"',arret_2='"+this.getArret_2()+"',arret_3='"+this.getArret_3()+"', date_depart='"+date_d+"' ,h_depart='"+this.getH_depart()+"',nombre_place="+this.getNombre_place()+",prix="+this.getPrix()+
                ", id_voiture='"+voiture.getMatricule()+"' WHERE id_trajet="+id+";" ;

        String sql="INSERT INTO voiture (id_matricule, marque, description) VALUES (?,?,?);" ;

        String sql1="SELECT id_membre FROM reservation WHERE trajet="+id+" AND etat='valider' ;";
        String sql2="INSERT INTO notification (recepteur,contenu,id_trajet) VALUES (?,?,?) ;" ;

        Statement stm;

        Connection connection =Main.chargerBase();
        // modifie les données de la voiture ou ajouter une nouvelle
        try {
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setString(1,voiture.getMatricule());
            statement.setString(2,voiture.getMarque());
            statement.setString(3,voiture.getDescription());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }
        // modifie les données du trajet
        try {

            stm = (Statement) connection.createStatement();
            stm.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("erreur 4");
        }
       // la partie de notification
        try {
            Statement statement2=connection.createStatement();
            ResultSet resultSet=statement2.executeQuery(sql1);
            PreparedStatement statement1 ;
            while (resultSet.next()){
                statement1=connection.prepareStatement(sql2);
                statement1.setString(1,resultSet.getString(1));
                statement1.setString(2,"Le trajet n="+id+" a été modifier,on vous conseille de consulter le trajet pour voir les modifications.... ");
                statement1.setInt(3,id);
                statement1.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 5");
        }

    }

    public Object[] consulterTrajet(){
        String sql="SELECT * FROM trajet WHERE id_trajet="+this.getId_trajet()+" ;";
        String sql2="SELECT * FROM voiture WHERE id_matricule=(SELECT id_voiture FROM trajet WHERE id_trajet="+this.getId_trajet()+") ; ";
        Trajet trajet=new Trajet();
        Voiture voiture=new Voiture();

        Connection connection=Main.chargerBase();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            resultSet.next();
            trajet.setId_trajet(resultSet.getInt(1));
            trajet.setV_depart(resultSet.getString(2));
            trajet.setV_arriver(resultSet.getString(3));
            trajet.setArret_1(resultSet.getString(4));
            trajet.setArret_2(resultSet.getString(5));
            trajet.setArret_3(resultSet.getString(6));
            trajet.setNombre_place(resultSet.getInt(7));
            trajet.setDate_dapart(resultSet.getDate(8));
            trajet.setPrix(resultSet.getFloat(9));
            trajet.setDescription(resultSet.getString(10));
            trajet.setH_depart(resultSet.getString(15));


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3 ");
        }

        try {
            Statement statement2=connection.createStatement();
            ResultSet resultSet=statement2.executeQuery(sql2);
            resultSet.next();
            voiture.setMatricule(resultSet.getString(1));
            voiture.setMarque(resultSet.getString(2));
            voiture.setDescription(resultSet.getString(3));
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 4");
        }

        Object [] objects={trajet,voiture};

        return objects ;
    }


}

