module com.projekat.fudbalrezultati {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.kordamp.bootstrapfx.core;
    requires java.sql;

    opens com.projekat.fudbalrezultati to javafx.fxml;
    exports com.projekat.fudbalrezultati;
}