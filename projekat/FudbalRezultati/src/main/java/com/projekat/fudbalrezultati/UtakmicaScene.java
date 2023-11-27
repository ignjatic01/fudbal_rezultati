package com.projekat.fudbalrezultati;

import com.projekat.contoller.ControllerLiga;
import com.projekat.contoller.ControllerUtakmica;
import com.projekat.model.Liga;
import com.projekat.model.Utakmica;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.ObservableSet;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.sql.Date;
import java.sql.Time;

public class UtakmicaScene
{
    public static void ucitajScenu(Stage stage)
    {
        stage.setTitle("Utakmice");
        MenuBar menuBar = HelloApplication.createMenuBar(stage);

        TableColumn<Utakmica, Integer> idUtakmicaColumn = new TableColumn<>("ID");
        idUtakmicaColumn.setMinWidth(50);
        idUtakmicaColumn.setCellValueFactory(new PropertyValueFactory<>("idUtakmica"));

        TableColumn<Utakmica, String> ligaUtakmicaColumn = new TableColumn<>("Liga");
        ligaUtakmicaColumn.setMinWidth(100);
        ligaUtakmicaColumn.setCellValueFactory(new PropertyValueFactory<>("liga"));

        TableColumn<Utakmica, String> domaciKlubColumn = new TableColumn<>("Domaći");
        domaciKlubColumn.setMinWidth(150);
        domaciKlubColumn.setCellValueFactory(new PropertyValueFactory<>("domaciKlub"));

        TableColumn<Utakmica, String> gostiKlubColumn = new TableColumn<>("Gosti");
        gostiKlubColumn.setMinWidth(150);
        gostiKlubColumn.setCellValueFactory(new PropertyValueFactory<>("gostiKlub"));

        TableColumn<Utakmica, String> stadionColumn = new TableColumn<>("Stadion");
        stadionColumn.setMinWidth(75);
        stadionColumn.setCellValueFactory(new PropertyValueFactory<>("stadion"));

        TableColumn<Utakmica, Date> datumColumn = new TableColumn<>("Datum");
        datumColumn.setMinWidth(75);
        datumColumn.setCellValueFactory(new PropertyValueFactory<>("datum"));

        TableColumn<Utakmica, Time> vrijemeColumn = new TableColumn<>("Vrijeme");
        vrijemeColumn.setMinWidth(75);
        vrijemeColumn.setCellValueFactory(new PropertyValueFactory<>("vrijeme"));

        TableColumn<Utakmica, Integer> goloviDomaciColumn = new TableColumn<>("1");
        goloviDomaciColumn.setMinWidth(25);
        goloviDomaciColumn.setCellValueFactory(new PropertyValueFactory<>("goloviDomaci"));

        TableColumn<Utakmica, Integer> goloviGostiColumn = new TableColumn<>("2");
        goloviGostiColumn.setMinWidth(25);
        goloviGostiColumn.setCellValueFactory(new PropertyValueFactory<>("goloviGosti"));

        TableColumn<Utakmica, Integer> koloColumn = new TableColumn<>("Kolo");
        koloColumn.setMinWidth(25);
        koloColumn.setCellValueFactory(new PropertyValueFactory<>("kolo"));

        TableView<Utakmica> table = new TableView<>();
        table.setItems(getUtakmica());
        table.getColumns().addAll(idUtakmicaColumn, ligaUtakmicaColumn, domaciKlubColumn, gostiKlubColumn, stadionColumn,
                goloviDomaciColumn, goloviGostiColumn, datumColumn, vrijemeColumn, koloColumn);

        Label filterLabel = new Label("Filter");
        filterLabel.setPadding(new Insets(10, 0, 0, 10));

        Label choiceLigaFilterLabel = new Label("Liga:");
        ControllerLiga controllerLiga = new ControllerLiga();
        ObservableList<Liga> lige = FXCollections.observableArrayList(controllerLiga.getAll());
        ChoiceBox<Liga> choiceLigaFilter = new ChoiceBox<>(lige);
        VBox vBoxLF = new VBox();
        vBoxLF.setPadding(new Insets(5));
        vBoxLF.getChildren().addAll(choiceLigaFilterLabel, choiceLigaFilter);

        Label koloFilterLabel = new Label("Kolo:");
        TextField koloFilter = new TextField();
        VBox vBoxKF = new VBox();
        vBoxKF.setPadding(new Insets(5));
        vBoxKF.getChildren().addAll(koloFilterLabel, koloFilter);

        Button btnFilter = new Button("Filtriraj");
        btnFilter.setOnAction(e -> filterTable(choiceLigaFilter, koloFilter, table));
        btnFilter.setStyle("-fx-background-color: #9E9E9E; -fx-text-fill: white;");
        StackPane spBtnFiltr = new StackPane();
        spBtnFiltr.setPadding(new Insets(20, 10, 10, 10));
        spBtnFiltr.getChildren().add(btnFilter);

        HBox hBoxFilter = new HBox();
        hBoxFilter.setPadding(new Insets(10, 10, 10, 10));
        hBoxFilter.setSpacing(30);
        hBoxFilter.getChildren().addAll(vBoxLF, vBoxKF, spBtnFiltr);

        VBox layout =  new VBox();
        layout.getChildren().addAll(menuBar, table, filterLabel, hBoxFilter);
        Scene scene = new Scene(layout, 875, 650);
        stage.setScene(scene);
        stage.show();
    }

    private static void filterTable(ChoiceBox<Liga> choiceLigaFilter, TextField koloFilter, TableView<Utakmica> table)
    {
        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        if(choiceLigaFilter.getValue() == null && "".equals(koloFilter.getText()))
        {
            //table.setItems(getUtakmica());
        }
        else if(choiceLigaFilter.getValue() != null && "".equals(koloFilter.getText()))
        {
            ObservableList<Utakmica> utakmicas = FXCollections.observableArrayList(controllerUtakmica.getByIdLiga(
                    choiceLigaFilter.getValue().getIdLiga()
            ));
            table.setItems(utakmicas);
        }
        else if(choiceLigaFilter.getValue() != null && !"".equals(koloFilter.getText()))
        {
            ObservableList<Utakmica> utakmicas = FXCollections.observableArrayList(controllerUtakmica.getByLigaKolo(
                    choiceLigaFilter.getValue().getIdLiga(), Integer.parseInt(koloFilter.getText())
            ));
            table.setItems(utakmicas);
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Liga je obavezno polje");
            javafx.animation.KeyFrame keyFrame = new javafx.animation.KeyFrame(Duration.seconds(3), e -> alert.close());
            javafx.animation.Timeline timeline = new javafx.animation.Timeline(keyFrame);
            timeline.play();

            alert.show();
        }
        table.refresh();
    }

    public static ObservableList<Utakmica> getUtakmica()
    {
        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        ObservableList<Utakmica> utakmice = FXCollections.observableArrayList(controllerUtakmica.getAll());
        return utakmice;
    }
}
