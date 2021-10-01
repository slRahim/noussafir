package com.projet.beans;

import java.sql.*;
import java.util.Date;

public class Membre {
    String nom_utilisateur ;
    String nom ;
    String prenom ;
    Date date_naissance ;
    String adresse ;
    String num_tel ;
    float note ;
    String image ;

    public String getNom_utilisateur() {
        return nom_utilisateur;
    }

    public void setNom_utilisateur(String nom_utilisateur) {
        this.nom_utilisateur = nom_utilisateur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Date getDate_naissance() {
        return date_naissance;
    }

    public void setDate_naissance(Date date_naissance) {
        this.date_naissance = date_naissance;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNum_tel() {
        return num_tel;
    }

    public void setNum_tel(String num_tel) {
        this.num_tel = num_tel;
    }

    public float getNote() {
        return note;
    }

    public void setNote(float note) {
        this.note = note;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }



    public Object [] ajouterMembre(Compte compte){
        int statu=0 ;
        String membre="" ;
        java.sql.Date date=new java.sql.Date(this.getDate_naissance().getTime());
        String sql1="INSERT INTO membre (nom_utilisateur, nom, prenom, date_naissance, adresse, telephone,image) VALUES (?,?,?,?,?,?,?);";
        String sql2="INSERT INTO compte (id_email, mot_de_passe, id_membre) VALUES (?,?,?);";
        Connection connection=Main.chargerBase();
        try {
            PreparedStatement statement1=connection.prepareStatement(sql1);
            statement1.setString(1,this.getNom_utilisateur());
            statement1.setString(2,this.getNom());
            statement1.setString(3,this.getPrenom());
            statement1.setDate(4,date);
            statement1.setString(5,this.getAdresse());
            statement1.setString(6,this.getNum_tel());
            if(this.getImage().equals("")){
                this.setImage("user1.png");
            }
            statement1.setString(7,"static\\img\\"+this.getImage());

            PreparedStatement statement2=connection.prepareStatement(sql2);
            statement2.setString(1,compte.getId_email());
            statement2.setString(2,compte.getMot_de_passe());
            statement2.setString(3,this.getNom_utilisateur());

            if (statement1.executeUpdate()!=0){
                statement2.executeUpdate();
                statu=1 ;
                membre=this.getNom_utilisateur();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }
        Object [] objects={statu,membre};
        return objects ;

    }

    public Membre consulterProfile(String id){
        Membre membre=new Membre();
        String sql="Select * From membre where nom_utilisateur='"+id+"';" ;

        Connection connection=Main.chargerBase();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            resultSet.next();
            membre.setNom_utilisateur(resultSet.getString(1));
            membre.setNom(resultSet.getString(2));
            membre.setPrenom(resultSet.getString(3));
            membre.setDate_naissance(resultSet.getDate(4));
            membre.setAdresse(resultSet.getString(5));
            membre.setNum_tel(resultSet.getString(6));
            membre.setImage(resultSet.getString(8));
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return membre ;
    }

    public void editMembre(Compte compte) {
        java.sql.Date date=new java.sql.Date(this.getDate_naissance().getTime());
        String query="UPDATE Membre SET nom_utilisateur='"+this.getNom_utilisateur()+"',nom='"+this.getNom()+"',prenom='"+this.getPrenom()+"',date_naissance='"+date+
                "' ,adresse='"+this .getAdresse()+"' ,telephone='"+this.getNum_tel()+"' WHERE nom_utilisateur='"+this.getNom_utilisateur()+"' ;";

        String sql="UPDATE compte SET id_email='"+compte.getId_email()+"' , mot_de_passe='"+compte.getMot_de_passe()+
                "' WHERE id_membre='"+this.getNom_utilisateur()+"' ;" ;

        Connection connection =Main.chargerBase();
        Statement stm;
        try {
            stm = (Statement) connection.createStatement();
            Statement statement=connection.createStatement();

            stm.executeUpdate(query);
            statement.executeUpdate(sql);


        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }


    }

    public void suppMembre(){
        String sql="DELETE FROM membre WHERE nom_utilisateur='"+this.getNom_utilisateur()+"';" ;

        Connection connection=Main.chargerBase();
        try {
            Statement statement=connection.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

    }

    public void evaluerMembre(String id_exa){
        String sql="INSERT INTO evaluer (id_examinateur, id_membre, note) VALUES (?,?,?)";
        String sql2="UPDATE membre SET note=(SELECT avg(note) FROM evaluer WHERE id_membre='"+this.getNom_utilisateur()+"')" +
                "WHERE nom_utilisateur='"+this.getNom_utilisateur()+"' ;";

        Connection connection=Main.chargerBase();
        try {
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setString(1,id_exa);
            statement.setString(2,this.getNom_utilisateur());
            statement.setFloat(3,this.getNote());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        try {
            Statement statement2=connection.createStatement();
            statement2.executeUpdate(sql2);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }
    }

    public void bloquerMembre (String id_mem) {

        String sql="Select id_email From compte where id_membre='"+id_mem+"' ;" ;
        String sql_bloqué = "update compte set  etat = 'Bloqué' where id_membre = '"+id_mem+"';";

        Connection connection = Main.chargerBase();
        try {
            Statement statement = connection.createStatement() ;
            statement.executeUpdate(sql_bloqué);

            Statement statement1=connection.createStatement();
            ResultSet resultSet=statement1.executeQuery(sql);
            resultSet.next();

            Message message=new Message() ;
            message.setEmmeteur(resultSet.getString(1));
            message.setContenu("votre compte à été bloquer par l'administrateur de site à cause d'une reclamation. pour plus d'informtion contacter nous!!!!");

            message.repondre();


        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

    }

    public void debloquerMembre (String id_mem) {

        String sql="Select id_email From compte where id_membre='"+id_mem+"' ;" ;
        String sql_debloquer = "update compte set etat = 'actif' where id_membre = '"+id_mem+"';";

        Connection connection = Main.chargerBase();
        try {
            Statement statement = connection.createStatement() ;
            statement.executeUpdate(sql_debloquer);

            Statement statement1=connection.createStatement();
            ResultSet resultSet=statement1.executeQuery(sql);
            resultSet.next();

            Message message=new Message() ;
            message.setEmmeteur(resultSet.getString(1));
            message.setContenu("votre compte à été debloquer.Veuillez connecter maitenant!!!!!!");

            message.repondre();

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

    }

    public void modifiePhoto(){
        String sql="UPDATE membre SET image='static\\img\\"+this.getImage()+"' WHERE nom_utilisateur='"+this.getNom_utilisateur()+"';";

        Connection connection=Main.chargerBase() ;

        try {
            Statement statement=connection.createStatement() ;
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }
    }

}
