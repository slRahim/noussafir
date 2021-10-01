package com.projet.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Compte {
    String id_email ;
    String mot_de_passe ;
    String etat ;

    public String getId_email() {
        return id_email;
    }

    public void setId_email(String id_email) {
        this.id_email = id_email;
    }

    public String getMot_de_passe() {
        return mot_de_passe;
    }

    public void setMot_de_passe(String mot_de_passe) {
        this.mot_de_passe = mot_de_passe;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public Object[] login(){
        boolean b=false ;
        String str="";
        String sql="SELECT * FROM compte WHERE id_email='"+this.getId_email()+"' and mot_de_passe='"+this.getMot_de_passe()+"' AND etat='actif';" ;
        Connection connection=Main.chargerBase() ;
        try {
            Statement statement=connection.createStatement() ;
            ResultSet resultSet=statement.executeQuery(sql);
            if (resultSet.next()){
                str=resultSet.getString(5);
                b=true ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreure 3 !");
        }
        Object [] objects={b,str};
        return objects ;
    }

    public Compte consulterCompte(String id){
        Compte compte=new Compte();
        String sql="Select * From compte where id_membre='"+id+"';" ;

        Connection connection=Main.chargerBase();
        try {
          Statement  statement = connection.createStatement();
          ResultSet resultSet=statement.executeQuery(sql);
          resultSet.next();
          compte.setId_email(resultSet.getString(1));
          compte.setMot_de_passe(resultSet.getString(2));
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return compte ;
    }

    public void modifiePassOublier(){
        String sql="UPDATE compte SET  mot_de_passe='"+this.getMot_de_passe()+
                "' WHERE id_email='"+this.getId_email()+"';";

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
