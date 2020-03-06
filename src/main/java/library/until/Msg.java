package library.until;

import lombok.Data;

@Data
public class Msg {
    //1：成功 2：失败
    private int code;

    private String message;

    private Object object;
}
