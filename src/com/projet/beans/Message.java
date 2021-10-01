package com.projet.beans;




import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;
import java.util.Date;
import java.util.Properties;


public class Message {
    int id_message ;
    String emmeteur;
    Date date_message ;
    String contenu ;

    public int getId_message() {
        return id_message;
    }

    public void setId_message(int id_message) {
        this.id_message = id_message;
    }

    public String getEmmeteur() {
        return emmeteur;
    }

    public void setEmmeteur(String emmeteur) {
        this.emmeteur = emmeteur;
    }

    public Date getDate_message() {
        return date_message;
    }

    public void setDate_message(Date date_message) {
        this.date_message = date_message;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public void ajouterMsg(){

        Connection connection=Main.chargerBase();
        String sql="INSERT INTO message (contenu,emmeteur) VALUES (?,?)";
        try {
            PreparedStatement statement =connection.prepareStatement(sql);
            statement.setString(1,this.getContenu());
            statement.setString(2,this.getEmmeteur());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur 3 !");
        }
    }

    public void supprimerMessage (int id_mes) {

        String sql_supp = "delete from message where id_message = '"+id_mes+"';";

        Connection connection = Main.chargerBase();

        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql_supp);

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur 3 !");
        }

    }

    public Message consulterMessage(){
        String sql="SELECT  * FROM  message WHERE id_message="+this.getId_message()+";";
        Message message=new Message();

        Connection connection=Main.chargerBase();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            resultSet.next();
            message.setContenu(resultSet.getString(3));
            message.setEmmeteur(resultSet.getString(4));
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }

        return message ;
    }

    public void repondre(){

        final String username = "nouSSafir@gmail.com";
        final String password = "0559637536";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            javax.mail.Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("nouSSafir@gmail.com"));
            message.setRecipients(javax.mail.Message.RecipientType.TO,
                    InternetAddress.parse(this.getEmmeteur()));
            message.setSubject("Reponce");
            message.setText(this.getContenu());

            Transport.send(message);

            System.out.println("ok b1 envoyer");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("erreur 3");
        }
    }

}
