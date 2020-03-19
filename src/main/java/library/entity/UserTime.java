package library.entity;

import lombok.Data;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.Date;

@Data
public class UserTime {
    private Integer userId;
    private String userName;
    private Date getVipTime;

    public UserTime(Integer userId, String userName, Date getVipTime) {
        this.userId = userId;
        this.userName = userName;
        this.getVipTime = getVipTime;
    }

    public UserTime() {
    }
}
