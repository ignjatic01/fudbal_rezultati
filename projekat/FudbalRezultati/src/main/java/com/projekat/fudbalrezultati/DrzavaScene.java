package com.projekat.fudbalrezultati;

import com.projekat.contoller.ControllerDrzava;
import com.projekat.model.Drzava;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Duration;

public class DrzavaScene
{

    public static void ucitajScenu(Stage stage)
    {

        stage.setTitle("Drzava");

        //Meni
        MenuBar menuBar = HelloApplication.createMenuBar(stage);

        //Prikaz tabele
        TableColumn<Drzava, Integer> idDrzavaColumn = new TableColumn<>("ID");
        idDrzavaColumn.setMinWidth(100);
        idDrzavaColumn.setCellValueFactory(new PropertyValueFactory<>("idDrzava"));

        TableColumn<Drzava, String> drzavaColumn = new TableColumn<>("Država");
        drzavaColumn.setMinWidth(200);
        drzavaColumn.setCellValueFactory(new PropertyValueFactory<>("drzava"));

        TableColumn<Drzava, String> kodColumn = new TableColumn<>("Kod");
        kodColumn.setMinWidth(100);
        kodColumn.setCellValueFactory(new PropertyValueFactory<>("kod"));

        TableView<Drzava> table = new TableView<>();
        table.setItems(getDrzava());
        table.getColumns().addAll(idDrzavaColumn, drzavaColumn, kodColumn);

        //Insert
        Label inputLabel = new Label("Unos nove države");
        inputLabel.setPadding(new Insets(10, 0, 0, 10));
        TextField drzavaInput, kodInput;

        drzavaInput = new TextField();
        drzavaInput.setPromptText("Naziv drzave");
        drzavaInput.setMinWidth(100);

        kodInput = new TextField();
        kodInput.setPromptText("Medjunarodni kod");
        kodInput.setMinWidth(50);
        kodInput.setMaxWidth(140);

        Button addButton = new Button("Dodaj");
        addButton.setStyle("-fx-background-color: #4caf50; -fx-text-fill: white;");
        addButton.setOnAction(e -> insertDrzava(drzavaInput, kodInput, table));

        HBox hBox = new HBox();
        hBox.setPadding(new Insets(10, 10, 10, 10));
        hBox.setSpacing(10);
        hBox.getChildren().addAll(drzavaInput, kodInput, addButton);

        //Update
        Label updateLabel = new Label("Ažuriranje podataka o državi");
        updateLabel.setPadding(new Insets(10, 0, 0, 10));
        TextField idDrzavaUpdate, drzavaUpdate, kodUpdate;

        idDrzavaUpdate = new TextField();
        idDrzavaUpdate.setPromptText("ID drzave");
        idDrzavaUpdate.setMaxWidth(70);

        drzavaUpdate = new TextField();
        drzavaUpdate.setPromptText("Naziv drzave");
        drzavaUpdate.setMinWidth(100);
        drzavaUpdate.setMaxWidth(150);

        kodUpdate = new TextField();
        kodUpdate.setPromptText("Medjunarodni kod");
        kodUpdate.setMinWidth(50);
        kodUpdate.setMaxWidth(70);

        Button updateButton = new Button("Ažuriraj");
        updateButton.setStyle("-fx-background-color: #2196F3; -fx-text-fill: white;");
        updateButton.setOnAction(e -> updateDrzava(idDrzavaUpdate, drzavaUpdate, kodUpdate, table));

        HBox hBoxUpdate = new HBox();
        hBoxUpdate.setPadding(new Insets(10, 10, 10, 10));
        hBoxUpdate.setSpacing(10);
        hBoxUpdate.getChildren().addAll(idDrzavaUpdate ,drzavaUpdate, kodUpdate, updateButton);

        //Delete
        Label deleteLabel = new Label("Brisanje podataka");
        deleteLabel.setPadding(new Insets(10, 0, 0, 10));
        TextField idDrzavaDelete;

        idDrzavaDelete = new TextField();
        idDrzavaDelete.setPromptText("ID drzave");

        Button deleteButton = new Button("Obriši");
        deleteButton.setStyle("-fx-background-color: #FF5252; -fx-text-fill: white;");
        deleteButton.setOnAction(e -> deleteButton(idDrzavaDelete, table));

        HBox hBoxDelete = new HBox();
        hBoxDelete.setPadding(new Insets(10, 25, 10, 10));
        hBoxDelete.setSpacing(10);
        hBoxDelete.getChildren().addAll(idDrzavaDelete, deleteButton);
        hBoxDelete.setAlignment(Pos.BASELINE_RIGHT);

        SelectionModel<Drzava> selectionModel = table.getSelectionModel();
        selectionModel.selectedItemProperty().addListener( (obs, oldSelection, newSelection) -> {
            if(newSelection != null)
            {
                //System.out.println(newSelection);
                idDrzavaUpdate.setText(String.valueOf(newSelection.getIdDrzava()));
                idDrzavaDelete.setText(String.valueOf(newSelection.getIdDrzava()));
                drzavaUpdate.setText(newSelection.getDrzava());
                kodUpdate.setText(newSelection.getKod());
            }
        });

        VBox layout = new VBox();
        layout.getChildren().addAll(menuBar, table, inputLabel, hBox, new Separator(), updateLabel, hBoxUpdate,
                new Separator(), deleteLabel, hBoxDelete);

        Scene scene = new Scene(layout, 420, 450);
        stage.setScene(scene);
        stage.show();
    }

    private static void deleteButton(TextField idDrzavaDelete, TableView<Drzava> table)
    {
        int id = Integer.parseInt(idDrzavaDelete.getText());
        int index = -1;
        for(int i = 0; i < table.getItems().size(); i++)
        {
            if(table.getItems().get(i).getIdDrzava() == id)
            {
                index = i;
                break;
            }
        }

        ControllerDrzava cDrzava = new ControllerDrzava();
        if(cDrzava.delete(id) == 1 && index != -1)
        {
            idDrzavaDelete.clear();
            table.getItems().remove(index);
            table.refresh();
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Brisanje neuspjesno");
            alert.setHeaderText("Id ne postoji ili neki drugi podatak zavisi od izabranog podatka");
            javafx.animation.KeyFrame keyFrame = new javafx.animation.KeyFrame(Duration.seconds(5), e -> alert.close());
            javafx.animation.Timeline timeline = new javafx.animation.Timeline(keyFrame);
            timeline.play();

            alert.show();
        }
    }

    private static void updateDrzava(TextField idDrzavaUpdate, TextField drzavaUpdate, TextField kodUpdate, TableView<Drzava> table)
    {
        Drzava drzava = new Drzava();
        drzava.setIdDrzava(Integer.parseInt(idDrzavaUpdate.getText()));
        drzava.setDrzava(drzavaUpdate.getText());
        drzava.setKod(kodUpdate.getText());

        int index = -1;
        for(int i = 0; i < table.getItems().size(); i++)
        {
            if(table.getItems().get(i).getIdDrzava() == drzava.getIdDrzava())
            {
                index = i;
                break;
            }
        }

        ControllerDrzava cDrzava = new ControllerDrzava();
        if(cDrzava.update(drzava) == 1 && index != -1)
        {
            idDrzavaUpdate.clear();
            drzavaUpdate.clear();
            kodUpdate.clear();
            table.getItems().remove(index);
            table.getItems().add(index, drzava);
            table.refresh();
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Pogresan unos podataka");
            javafx.animation.KeyFrame keyFrame = new javafx.animation.KeyFrame(Duration.seconds(3), e -> alert.close());
            javafx.animation.Timeline timeline = new javafx.animation.Timeline(keyFrame);
            timeline.play();

            alert.show();
        }
    }

    private static void insertDrzava(TextField drzavaInput, TextField kodInput, TableView<Drzava> table)
    {
        Drzava drzava = new Drzava();
        drzava.setDrzava(drzavaInput.getText());
        drzava.setKod(kodInput.getText());

        ControllerDrzava cDrzava = new ControllerDrzava();
        if(cDrzava.save(drzava))
        {
            drzavaInput.clear();
            kodInput.clear();
            table.getItems().add(drzava);
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Pogresan unos podataka");
            javafx.animation.KeyFrame keyFrame = new javafx.animation.KeyFrame(Duration.seconds(3), e -> alert.close());
            javafx.animation.Timeline timeline = new javafx.animation.Timeline(keyFrame);
            timeline.play();

            alert.show();
        }
    }

    public static ObservableList<Drzava> getDrzava()
    {
        ControllerDrzava cDrzava = new ControllerDrzava();
        ObservableList<Drzava> drzave = FXCollections.observableArrayList(cDrzava.getAll());
        return drzave;
    }
}
