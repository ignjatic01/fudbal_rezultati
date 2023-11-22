package com.projekat.fudbalrezultati;



import com.projekat.contoller.ControllerDrzava;
import com.projekat.model.Drzava;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;


import java.io.IOException;

public class HelloApplication extends Application {

    Button button;

    //String food;

    Stage window;
    @Override
    public void start(Stage stage) throws IOException {
        window = stage;
        Label label1 = new Label("Wlecome to the first scene");
        Button button1 = new Button("Go to scene 2");

        VBox layout1 = new VBox(20);
        layout1.getChildren().addAll(label1, button1);
        Scene scene1 = new Scene(layout1, 200, 200);
        button1.setOnAction(e -> DrzavaScene.ucitajScenu(window, scene1));

        window.setScene(scene1);
        window.setTitle("Title");
        window.show();
    }

    public static void main(String[] args)
    {
        launch();
        ControllerDrzava cDrzava = new ControllerDrzava();
        for(Drzava d : cDrzava.getAll())
        {
            System.out.println(d);
        }
    }
}