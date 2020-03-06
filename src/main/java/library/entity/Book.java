package library.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Data;

@Data
public class Book {
    private Integer booKId;
    private String bookName;
    private String image;
    private String bookMessage;
    private Integer number;
    private Double money;
    private String sort;

    public Book(Integer booKId, String bookName, String image, String bookMessage, Integer number, Double money, String sort) {
        this.booKId = booKId;
        this.bookName = bookName;
        this.image = image;
        this.bookMessage = bookMessage;
        this.number = number;
        this.money = money;
        this.sort = sort;
    }

    public Book() {
    }
}
