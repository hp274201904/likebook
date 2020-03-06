package library.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Data;

@Data
public class Indent {
    private String userName;
    private String bookName;
    private String message;
    private String address;
    private String complete;

    public Indent(String userName, String bookName, String message, String address, String complete) {
        this.userName = userName;
        this.bookName = bookName;
        this.message = message;
        this.address = address;
        this.complete = complete;
    }

    public Indent() {
    }
}
