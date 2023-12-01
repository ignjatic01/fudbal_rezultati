package com.projekat.fudbalrezultati;

import com.projekat.contoller.ControllerDrzava;
import com.projekat.contoller.ControllerIgrac;
import com.projekat.contoller.ControllerIgracNaUtakmici;
import com.projekat.model.*;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.CheckBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.sql.Date;

public class UtakmicaApp
{
    public static void ucitajStage(Utakmica utakmica)
    {
        Stage stage = new Stage();
        stage.setTitle(utakmica.getDomaciKlub() + " - " + utakmica.getGostiKlub());


        //Domaci igraci
        Label domaciLabel = new Label("Domaći - " + utakmica.getDomaciKlub());
        domaciLabel.setPadding(new Insets(10, 10, 10, 10));
        domaciLabel.setFont(Font.font("Arial", FontWeight.BOLD, 20));

        TableColumn<IgracNaUtakmici, Integer> idIgracDomaciColumn = new TableColumn<>("ID");
        idIgracDomaciColumn.setMinWidth(50);
        idIgracDomaciColumn.setMaxWidth(50);
        idIgracDomaciColumn.setCellValueFactory(new PropertyValueFactory<>("idIgrac"));

        TableColumn<IgracNaUtakmici, String> prezimeDomaciColumn = new TableColumn<>("Prezime");
        prezimeDomaciColumn.setMinWidth(125);
        prezimeDomaciColumn.setMaxWidth(125);
        prezimeDomaciColumn.setCellValueFactory(new PropertyValueFactory<>("prezime"));

        TableColumn<IgracNaUtakmici, Integer> brojDresaDomaciColumn = new TableColumn<>("Broj");
        brojDresaDomaciColumn.setMinWidth(50);
        brojDresaDomaciColumn.setMaxWidth(50);
        brojDresaDomaciColumn.setCellValueFactory(new PropertyValueFactory<>("brojDresa"));

        TableColumn<IgracNaUtakmici, String> oznakaPozicijeDomaciColumn = new TableColumn<>("Pozicija");
        oznakaPozicijeDomaciColumn.setMaxWidth(75);
        oznakaPozicijeDomaciColumn.setMinWidth(75);
        oznakaPozicijeDomaciColumn.setCellValueFactory(new PropertyValueFactory<>("oznakaPozicije"));

        TableColumn<IgracNaUtakmici, Boolean> uIgriDomaciColumn = new TableColumn<>("U igri");
        uIgriDomaciColumn.setMinWidth(50);
        uIgriDomaciColumn.setMaxWidth(50);
        uIgriDomaciColumn.setCellValueFactory(cellData -> new SimpleBooleanProperty(cellData.getValue().getuIgri()));
        uIgriDomaciColumn.setCellFactory(tc -> new CheckBoxTableCell<>());

        TableView<IgracNaUtakmici> tableDomaci = new TableView<>();
        tableDomaci.setItems(getIgrac(utakmica.getIdDomaci(), utakmica.getIdUtakmica()));
        tableDomaci.getColumns().addAll(idIgracDomaciColumn, prezimeDomaciColumn,brojDresaDomaciColumn, oznakaPozicijeDomaciColumn, uIgriDomaciColumn);
        tableDomaci.setMaxWidth(365);
        tableDomaci.setMaxHeight(350);
        tableDomaci.setMinHeight(350);

        //Insert Domaci
        Label choiceIgracDomaciInputLabel = new Label("Igrač:");
        ControllerIgrac controllerIgrac = new ControllerIgrac();
        ObservableList<Igrac> igraci = FXCollections.observableArrayList(controllerIgrac.getByKlubID(utakmica.getIdDomaci()));
        ChoiceBox<Igrac> choiceIgracDomaciInput = new ChoiceBox<>(igraci);
        choiceIgracDomaciInput.setMinWidth(300);
        choiceIgracDomaciInput.setMaxWidth(300);
        //choiceDrzavaInput.setStyle("-fx-pref-height: 10; -fx-background-insets: 0;");
        VBox vBoxCII = new VBox();
        vBoxCII.setPadding(new Insets(5));
        vBoxCII.getChildren().addAll(choiceIgracDomaciInputLabel, choiceIgracDomaciInput);
        vBoxCII.setAlignment(Pos.CENTER);

        CheckBox checkUIgriDomaci = new CheckBox("Starter");
        StackPane spChkBD = new StackPane();
        spChkBD.getChildren().add(checkUIgriDomaci);
        spChkBD.setAlignment(Pos.CENTER);

        Button addButton = new Button("Dodaj");
        addButton.setStyle("-fx-background-color: #4caf50; -fx-text-fill: white;");
        addButton.setMinSize(128, 25);
        addButton.setOnAction(e -> insertIgrac(tableDomaci, utakmica, checkUIgriDomaci, choiceIgracDomaciInput));
        StackPane spBtn = new StackPane();
        spBtn.setPadding(new Insets(5, 0, 0, 0));
        spBtn.getChildren().add(addButton);
        spBtn.setAlignment(Pos.CENTER);

        //Delete
        Label idIgracDeleteLabel = new Label("ID igrača:");
        TextField idIgracDelete = new TextField();
        idIgracDelete.setMinWidth(200);
        idIgracDelete.setMaxWidth(200);

        VBox vBoxIID = new VBox();
        vBoxIID.setPadding(new Insets(5));
        vBoxIID.setAlignment(Pos.CENTER);
        vBoxIID.getChildren().addAll(idIgracDeleteLabel, idIgracDelete);

        Button deleteButtonDomaci = new Button("Obriši");
        deleteButtonDomaci.setStyle("-fx-background-color: #FF5252; -fx-text-fill: white;");
        deleteButtonDomaci.setOnAction(e -> deleteIgrac(idIgracDelete, utakmica, tableDomaci));
        StackPane spDelDom = new StackPane();
        spDelDom.getChildren().add(deleteButtonDomaci);

        VBox vBoxDomaci = new VBox();
        vBoxDomaci.setSpacing(10);
        vBoxDomaci.getChildren().addAll(domaciLabel, tableDomaci, vBoxCII, spChkBD, spBtn, new Separator(),
                vBoxIID, spDelDom);

        SelectionModel<IgracNaUtakmici> selectionModel = tableDomaci.getSelectionModel();
        selectionModel.selectedItemProperty().addListener( (obs, oldSelection, newSelection) -> {
            if(newSelection != null)
            {
                idIgracDelete.setText(String.valueOf(newSelection.getIdIgrac()));
            }
        });

        //Utakmica operacije

        Label rezultatLabel = new Label(getRezultat(utakmica));
        rezultatLabel.setFont(Font.font("Arial", FontWeight.BOLD, 60));
        rezultatLabel.setStyle("-fx-text-fill: red;");

        HBox rezultat = new HBox();
        rezultat.setSpacing(10);
        rezultat.setAlignment(Pos.CENTER);
        rezultat.getChildren().addAll(rezultatLabel);

        Label ligaLabel = new Label(utakmica.getKolo() + ". kolo " + utakmica.getLiga());
        ligaLabel.setFont(Font.font("Arial", FontWeight.NORMAL, 18));
        ligaLabel.setStyle("-fx-text-fill: #555555;");

        HBox liga = new HBox();
        liga.setSpacing(10);
        liga.setAlignment(Pos.CENTER);
        liga.getChildren().addAll(ligaLabel);

        Label vrijemeLabel = new Label(utakmica.getDatum().toLocalDate() + " - " + utakmica.getVrijeme());
        vrijemeLabel.setFont(Font.font("Arial", FontWeight.THIN, 18));
        vrijemeLabel.setStyle("-fx-text-fill: #888888;");

        HBox vrijeme = new HBox();
        vrijeme.setSpacing(10);
        vrijeme.setPadding(new Insets(20, 0, 0, 0));
        vrijeme.setAlignment(Pos.CENTER);
        vrijeme.getChildren().addAll(vrijemeLabel);

        Label stadionLabel = new Label(utakmica.getStadion());
        stadionLabel.setFont(Font.font("Arial", FontWeight.NORMAL, 18));
        stadionLabel.setStyle("-fx-text-fill: #888888;");

        HBox stadion = new HBox();
        stadion.setSpacing(10);
        stadion.setPadding(new Insets(20, 40, 0, 40));
        stadion.setAlignment(Pos.CENTER);
        stadion.getChildren().addAll(stadionLabel);

        VBox vBoxUtakmica = new VBox();
        vBoxUtakmica.setSpacing(10);
        //vBoxUtakmica.setPadding(new Insets(0, 40, 0, 40));
        vBoxUtakmica.setMinWidth(400);
        vBoxUtakmica.setMaxWidth(400);
        vBoxUtakmica.getChildren().addAll(rezultat, liga, vrijeme, stadion);

        //Gostujuci igraci
        Label gostiLabel = new Label("Gosti - " + utakmica.getGostiKlub());
        gostiLabel.setPadding(new Insets(10, 10, 10, 10));
        gostiLabel.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        gostiLabel.setAlignment(Pos.BASELINE_RIGHT);

        HBox hBoxGL = new HBox();
        hBoxGL.setAlignment(Pos.CENTER_RIGHT);
        hBoxGL.getChildren().addAll(gostiLabel);

        TableColumn<IgracNaUtakmici, Integer> idIgracGostiColumn = new TableColumn<>("ID");
        idIgracGostiColumn.setMinWidth(50);
        idIgracGostiColumn.setMaxWidth(50);
        idIgracGostiColumn.setCellValueFactory(new PropertyValueFactory<>("idIgrac"));

        TableColumn<IgracNaUtakmici, String> prezimeGostiColumn = new TableColumn<>("Prezime");
        prezimeGostiColumn.setMinWidth(125);
        prezimeGostiColumn.setMaxWidth(125);
        prezimeGostiColumn.setCellValueFactory(new PropertyValueFactory<>("prezime"));

        TableColumn<IgracNaUtakmici, Integer> brojDresaGostiColumn = new TableColumn<>("Broj");
        brojDresaGostiColumn.setMinWidth(50);
        brojDresaGostiColumn.setMaxWidth(50);
        brojDresaGostiColumn.setCellValueFactory(new PropertyValueFactory<>("brojDresa"));

        TableColumn<IgracNaUtakmici, String> oznakaPozicijeGostiColumn = new TableColumn<>("Pozicija");
        oznakaPozicijeGostiColumn.setMaxWidth(75);
        oznakaPozicijeGostiColumn.setMinWidth(75);
        oznakaPozicijeGostiColumn.setCellValueFactory(new PropertyValueFactory<>("oznakaPozicije"));

        TableColumn<IgracNaUtakmici, Boolean> uIgriGostiColumn = new TableColumn<>("U igri");
        uIgriGostiColumn.setMinWidth(50);
        uIgriGostiColumn.setMaxWidth(50);
        uIgriGostiColumn.setCellValueFactory(cellData -> new SimpleBooleanProperty(cellData.getValue().getuIgri()));
        uIgriGostiColumn.setCellFactory(tc -> new CheckBoxTableCell<>());

        TableView<IgracNaUtakmici> tableGosti = new TableView<>();
        tableGosti.setItems(getIgrac(utakmica.getIdGosti(), utakmica.getIdUtakmica()));
        tableGosti.getColumns().addAll(idIgracGostiColumn, prezimeGostiColumn,brojDresaGostiColumn, oznakaPozicijeGostiColumn, uIgriGostiColumn);
        tableGosti.setMaxWidth(365);
        tableGosti.setMinHeight(350);
        tableGosti.setMaxHeight(350);

        //Insert Domaci
        Label choiceIgracGostiInputLabel = new Label("Igrač:");
        igraci = FXCollections.observableArrayList(controllerIgrac.getByKlubID(utakmica.getIdGosti()));
        ChoiceBox<Igrac> choiceIgracGostiInput = new ChoiceBox<>(igraci);
        choiceIgracGostiInput.setMinWidth(300);
        choiceIgracGostiInput.setMaxWidth(300);
        //choiceDrzavaInput.setStyle("-fx-pref-height: 10; -fx-background-insets: 0;");
        VBox vBoxCIIG = new VBox();
        vBoxCIIG.setPadding(new Insets(5));
        vBoxCIIG.getChildren().addAll(choiceIgracGostiInputLabel, choiceIgracGostiInput);
        vBoxCIIG.setAlignment(Pos.CENTER);

        CheckBox checkUIgriGosti = new CheckBox("Starter");
        StackPane spChkBG = new StackPane();
        spChkBG.getChildren().add(checkUIgriGosti);
        spChkBG.setAlignment(Pos.CENTER);

        Button addButtonGosti = new Button("Dodaj");
        addButtonGosti.setStyle("-fx-background-color: #4caf50; -fx-text-fill: white;");
        addButtonGosti.setMinSize(128, 25);
        addButtonGosti.setOnAction(e -> insertIgrac(tableGosti, utakmica, checkUIgriGosti, choiceIgracGostiInput));
        StackPane spBtnG = new StackPane();
        spBtnG.setPadding(new Insets(5, 0, 0, 0));
        spBtnG.getChildren().add(addButtonGosti);
        spBtnG.setAlignment(Pos.CENTER);

        //Delete
        Label idIgracDeleteLabelGosti = new Label("ID igrača:");
        TextField idIgracDeleteGosti = new TextField();
        idIgracDeleteGosti.setMinWidth(200);
        idIgracDeleteGosti.setMaxWidth(200);

        VBox vBoxIIDG = new VBox();
        vBoxIIDG.setPadding(new Insets(5));
        vBoxIIDG.setAlignment(Pos.CENTER);
        vBoxIIDG.getChildren().addAll(idIgracDeleteLabelGosti, idIgracDeleteGosti);

        Button deleteButtonGosti = new Button("Obriši");
        deleteButtonGosti.setStyle("-fx-background-color: #FF5252; -fx-text-fill: white;");
        deleteButtonGosti.setOnAction(e -> deleteIgrac(idIgracDeleteGosti, utakmica, tableGosti));
        StackPane spDelGos = new StackPane();
        spDelGos.getChildren().add(deleteButtonGosti);

        VBox vBoxGosti = new VBox();
        vBoxGosti.setSpacing(10);
        vBoxGosti.getChildren().addAll(hBoxGL, tableGosti,vBoxCIIG, spChkBG, spBtnG, new Separator(),
                vBoxIIDG, spDelGos);

        SelectionModel<IgracNaUtakmici> selectionModel1 = tableGosti.getSelectionModel();
        selectionModel1.selectedItemProperty().addListener( (obs, oldSelection, newSelection) -> {
            if(newSelection != null)
            {
                idIgracDeleteGosti.setText(String.valueOf(newSelection.getIdIgrac()));
            }
        });


        HBox layout = new HBox();
        layout.setSpacing(5);
        layout.setPadding(new Insets(10, 10, 10, 10));
        layout.getChildren().addAll(vBoxDomaci, vBoxUtakmica, vBoxGosti);
        Scene scene = new Scene(layout, 1160, 700);
        stage.setScene(scene);
        stage.show();
    }

    public static String getRezultat(Utakmica utakmica)
    {
        return utakmica.getGoloviDomaci() + "    :    " + utakmica.getGoloviGosti();
    }

    private static void deleteIgrac(TextField idIgracDelete, Utakmica utakmica, TableView<IgracNaUtakmici> tableDomaci)
    {
        int idIgrac = Integer.parseInt(idIgracDelete.getText());
        int idUtakmica = utakmica.getIdUtakmica();
        int index = -1;
        for(int i = 0; i < tableDomaci.getItems().size(); i++)
        {
            if(tableDomaci.getItems().get(i).getIdUtakmica() == idUtakmica && tableDomaci.getItems().get(i).getIdIgrac() == idIgrac)
            {
                index = i;
                break;
            }
        }

        ControllerIgracNaUtakmici controllerIgracNaUtakmici = new ControllerIgracNaUtakmici();
        if(controllerIgracNaUtakmici.delete(idIgrac, idUtakmica) == 1 && index != -1)
        {
            idIgracDelete.clear();
            tableDomaci.getItems().remove(index);
            tableDomaci.refresh();
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

    private static void insertIgrac(TableView<IgracNaUtakmici> tableDomaci, Utakmica utakmica, CheckBox checkUIgriDomaci,
                                    ChoiceBox<Igrac> choiceIgracDomaciInput)
    {
        IgracNaUtakmici inu = new IgracNaUtakmici();

        inu.setIdIgrac(choiceIgracDomaciInput.getValue().getIdIgrac());
        inu.setIme(choiceIgracDomaciInput.getValue().getIme());
        inu.setPrezime(choiceIgracDomaciInput.getValue().getPrezime());
        inu.setBrojDresa(choiceIgracDomaciInput.getValue().getBrojDresa());
        inu.setOznakaPozicije(choiceIgracDomaciInput.getValue().getOznakaPozicije());
        inu.setIdKlub(choiceIgracDomaciInput.getValue().getIdKlub());
        inu.setIdUtakmica(utakmica.getIdUtakmica());
        inu.setuIgri(checkUIgriDomaci.isSelected());

        ControllerIgracNaUtakmici controllerIgracNaUtakmici = new ControllerIgracNaUtakmici();
        if(controllerIgracNaUtakmici.save(inu))
        {
            checkUIgriDomaci.setSelected(false);
            choiceIgracDomaciInput.setValue(null);
            tableDomaci.getItems().add(inu);
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

    private static ObservableList<IgracNaUtakmici> getIgrac(Integer idIgrac, Integer idUtakmica)
    {
        ControllerIgracNaUtakmici controllerIgracNaUtakmici = new ControllerIgracNaUtakmici();
        ObservableList<IgracNaUtakmici> igraci = FXCollections.observableArrayList(controllerIgracNaUtakmici.getAllById(idIgrac, idUtakmica));
        return igraci;
    }
}
