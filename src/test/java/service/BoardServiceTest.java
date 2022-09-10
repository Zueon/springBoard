package service;


import config.RootConfig;
import domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j2
@ContextConfiguration(classes = {RootConfig.class})
public class BoardServiceTest {
    @Setter(onMethod_ = @Autowired)
    private BoardService service;

    @Test
    public void testGetList(){
        log.info("TEST GET LIST------------");
        service.getList(new Criteria(2,5)).forEach(board -> log.info(board));
    }
}
