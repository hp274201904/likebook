package library.entity;
import com.sun.org.apache.xpath.internal.operations.Equals;
import lombok.Data;


@Data
public class User {
    private Integer userId;
    private String userName;
    private String password;
    private String image;
    private Double money;
    private String vip;
    private String address;
    private Integer bookId1;
    private Integer bookId2;
    private Integer bookId3;
    private Integer bookId4;
    private Integer bookId5;
}
