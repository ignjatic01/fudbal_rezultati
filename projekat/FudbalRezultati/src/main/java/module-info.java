module com.fudbalrezultati {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.kordamp.bootstrapfx.core;

    opens com.fudbalrezultati to javafx.fxml;
    exports com.fudbalrezultati;
}