package library.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Data;

@Data
public class Journal {
    private String userName;
    private Integer userBookId;
    private Integer bookId;
    private String bookName;
    private String buyBook;
    private String returnBook;

    public Journal(String userName, Integer userBookId, Integer bookId, String bookName, String buyBook, String returnBook) {
        this.userName = userName;
        this.userBookId = userBookId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.buyBook = buyBook;
        this.returnBook = returnBook;
    }

    public Journal() {
    }
}
